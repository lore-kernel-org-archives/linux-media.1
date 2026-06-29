Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1D395AD9
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716235; cv=none; b=NNTYdY6+zZV1pqk6UTBROWxv8ZT2uDkbeoPJKINioYHK9JYb7F8TCZEVhiMHVy9feOpRFK1rFCZqZp+OCqnTovrArjCVvYrbcKXsl7U61XMiFBMK48+N+05rLE/zVWa2OOSCAsjMCZRiwWfMoC/prwS2H0EovpJ9ccOgC3PO/Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716235; c=relaxed/simple;
	bh=Fb+AldgvYoIX0/Z2tP0YMWCb+yO11ylhlhBO2BDAJGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTboxnSPLqhO3cG/EUhm1J4qHMymiGfbjFfFhZMPMH9stKZzxJBioQvKvKh+nplR6fnWVflDHS7dpvRSDyQlwD+ft/+Nm31JgYY0f6wYf3W/SPEO/fTmtla5XK9EtzFr/NRUtx39v7v3q9eEK45PEcQK0ytomcZIrpzC6EbP1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlfARee+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlfARee+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E2F1F000E9;
	Mon, 29 Jun 2026 06:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716234;
	bh=ngzXjOzQ0ZRM+qwpdZ7NtE/tGTrJllQwYJxXQpVyxBg=;
	h=From:To:Cc:Subject:Date;
	b=dlfARee+M5Zq00lemqoGu9aDn3SD2AFXFovi/xZkZIMRmqy6kxrcXhIHUwkgfMUE0
	 pdVFSt7iQbbAojSViS7HX4KFASisKhOxCGCgJ9CvBwfpp+QBXwfDCOMht+ggEr3ONy
	 CuSOUoU142WC2Whw6OUf08SVGSXnVXlv7lYRIeq5JEslzQc8dji+lZnXO5ZGjM8zMg
	 IvtN/BEnMqWFvoYF8n4eAmZClbjdMSxk4vLA6XXBMmu1/C2JIaXkY8jWDfufvaixrJ
	 T8k+UqNqmIynF3Hxcopu5stX/m35km9p5n2IsmlAo+Aws9bs0h90iRIdb6jp40VVqU
	 fP344H52cTqZQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv3 0/6] media: em28xx: fix lifecycle issues
Date: Mon, 29 Jun 2026 08:55:48 +0200
Message-ID: <cover.1782716154.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch fixes (I believe) a bug in v4l2-async that
was introduced back in 2013. Sakari, can you take a look at this?

The second patch switches the em28xx driver to use the v4l2_device
release callback, letting the v4l2 core do all the refcounting
until the last user is gone and it is safe to free all memory.

The third patch drops the 'users' counter and uses the internal
v4l2_fh counter instead. The fourth patch switches
video_unregister_device to vb2_video_unregister_device: this
ensures all streaming is stopped when the video device is unregistered.

The fifth patch fixes a use-after-freed, and the last patch correctly
gives the vb2 buffers back to the vb2 framework if start_streaming
fails.

This has all been tested on my em28xx device.

Regards,

	Hans

Changes since v2:
- keep check if sd->asc_list.next is non-NULL in patch 1/6

Hans Verkuil (6):
  media: core: v4l2-async.c: unreg subdev if asc_list is empty
  media: em28xx: use v4l2_device release callback
  media: em28xx: drop 'users' field
  media: em28xx: use vb2_video_unregister_device
  media: em28xx: dev_info->pr_info since dev has been freed
  media: em28xx: requeue buffers if start_streaming fails

 drivers/media/usb/em28xx/em28xx-cards.c |   2 +-
 drivers/media/usb/em28xx/em28xx-video.c | 114 +++++++++++++++---------
 drivers/media/usb/em28xx/em28xx.h       |   2 -
 drivers/media/v4l2-core/v4l2-async.c    |  10 ++-
 4 files changed, 78 insertions(+), 50 deletions(-)

-- 
2.53.0

