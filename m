Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA82C0F69
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615766; cv=none; b=YIavQ2RRKEd6GlRKImRHlaj0agfJJXtG0iK51WXPTlP0mpUhChJEhXppAcwFH+FnAop5NPriI3ehRGAOQKs1nevj9P0mIVeyOkWvVDLvCb5+aHuRA+obwW2FK3fQh+5KCUa+tZtCPqKobDlNl1K92XtTIdHmGv7R/7+LSCACcro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615766; c=relaxed/simple;
	bh=tbuZYRFxR0SNrnUv3pyfAyT8StDufh7d+gqUtmMdbzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQskj9+QYUHtKaNs7zYMVJB2OwEDI9aqBpWIX7S+vQj4v5OR73z9demZajLXEw8qt3ac5PPeoRVL0w0dAjDhkP6sMdLUP29wp1JkezhTGoHy6E41KEnpkUrN9YuqRlWndAba6TLZpgewmL+Hr6goKv4Xq/Ujn0XrfDEuNx8j8DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvDGooiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvDGooiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982E31F000E9;
	Tue, 16 Jun 2026 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615765;
	bh=0Z0NHb0EMj7g6GIMmpJoV+JGRxQfI2+0s9My7yJr+JQ=;
	h=From:To:Cc:Subject:Date;
	b=fvDGooiKaEN+yxUoK1+cZi3oNpXbvGxByIG6fr5X02Lovo5Wst6giuXRInkqud9XF
	 4D1McrdF6GHjux6IG6LdbMz6pXnSKcEWwrNHoXNzpIho5St0idUH8ZFHZWaRW0Io5+
	 R/waOauy2o/Gvj4iJRaz2A8OhkvRe/T30Qo7BmPVl+COu/YdMtGKzuMmqJZJPfwHif
	 xx6nkE3H6Pvah8iHKo7f41zHvA5RokEK+A0T5bRWJps7Y0gOmo/JFBmXfCKI5l55HI
	 RYkosn9gU/wnW1zqWPsT7zV66yYrGGOYucWEV187TjJQLh4fuDWgJZHS8y+qDrOs8f
	 hs8CyfLOAbbFg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv2 0/6] media: em28xx: fix lifecycle issues
Date: Tue, 16 Jun 2026 15:10:26 +0200
Message-ID: <cover.1781615432.git.hverkuil+cisco@kernel.org>
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
 drivers/media/v4l2-core/v4l2-async.c    |   4 +-
 4 files changed, 74 insertions(+), 48 deletions(-)

-- 
2.53.0

