Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825AB3F1AC9
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191982; cv=none; b=Cj/npo3tFzUyxdlcCVFkIXSpIwnuOeGoM3SafvImMLtdQPVxxumkm02sWFjxfg7p0s41MYqCu1/YMTgu+CvBm/BV3CyvdoGKYBVIyCGEPNHpBi7kDdo+hC5YsQUdwa2S57npCJXC5ERdTl/LgZEl6IR4GpEXLd/QjRjos3KAf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191982; c=relaxed/simple;
	bh=383B+m8HkKLQbnCqGyYcuRDD3acocEzN6VJi13NHvlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HKXSrUe8BKal3oG5NFmzOVg9dqn3h2eh4/J6ijNK/16fi5S9dXtllFTM36e3ZGZiHaaTCbTcOmEqUZEQzXNPdgf633zjS5d9FEzJackt5vbQmk1UrIlVFXcXH78c45MUJkPqGwqj2rPTR/xsOzuvBSQ77VpCQY0VbpkwkWOoZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhpZfgD4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhpZfgD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690C5C2BCB3;
	Tue, 19 May 2026 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779191982;
	bh=383B+m8HkKLQbnCqGyYcuRDD3acocEzN6VJi13NHvlI=;
	h=From:To:Cc:Subject:Date:From;
	b=rhpZfgD4/3cuEYRC8SPsHbj5tfFUMnU++YAHlP2rst4GiaYuuE3K0yfDwtTSAgZgQ
	 nfC726d2p1HPrDeaAP+Zs6GfL/OfnfSybtsS7GXLN3cPC6mJYeLXnj3csYl2d13nq9
	 cKYANy3NMXmkk/ejQlkim/AHsovDSweppUPDtpVM/jQPPUIuw76q/R1kGMDIiTqRm4
	 CBHN8v7Ua5d9fXR+QJLR6CistdkicjjvK7O9mPfz5LMrdx6WibgOzT4qUsI4kimih7
	 dp6P0bLhqJCEG45h2a9pnxvselwHgFuOC1YlmIcFabF4kE48eue9FdGiDb1265LQgp
	 M+Sbhhokd7YyA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: [PATCH 0/3] media: em28xx: fix lifecycle issues
Date: Tue, 19 May 2026 13:54:40 +0200
Message-ID: <cover.1779191683.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch switches the em28xx driver to use the v4l2_device
release callback, letting the v4l2 core do all the refcounting
until the last user is gone and it is safe to free all memory.

The second patch drops the 'users' counter and uses the internal
v4l2_fh counter instead. And the last patch switches
video_unregister_device to vb2_video_unregister_device: this
ensures all streaming is stopped when the video device is unregistered.

All this still needs to be tested on real hardware, but that will
have to wait 2-3 weeks.

Regards,

	Hans

Hans Verkuil (3):
  media: em28xx: use v4l2_device release callback
  media: em28xx: drop 'users' field
  media: em28xx: use vb2_video_unregister_device

 drivers/media/usb/em28xx/em28xx-video.c | 96 ++++++++++++++-----------
 drivers/media/usb/em28xx/em28xx.h       |  2 -
 2 files changed, 54 insertions(+), 44 deletions(-)

-- 
2.53.0

