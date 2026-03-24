Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EF33A6EB
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 00:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774313742; cv=none; b=ZgFxkNKjWFEo0F2MhR6DZ4ODSatyJKgs1CCht00zdTEmYwXoNX8vRAjaP7fG+LyrkrwORU7DGynTv/Kph4G118mWF7TeZtiqVN8/VIjRMCTczxE86H2mjmJPvAJKPejoE0CoKast2Km5YrwhaeKFbsEf82WqHCaKsQQarp3D1+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774313742; c=relaxed/simple;
	bh=fOXRVJYkLwRZbioTX2rMq7tzlqCpWU027+pprA6w/9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDqW2lW+q43Y4oe7rnNufUhZfgB8t/4xVp1HEnIcm+B8EYERLXDJ0heFvdWnZ2iVlfzmZSSEmncfxUgKGca2frZmW3EoznExxdP4Hlbt38EnUBZbbf0FX9dDDf0egO85HBEgd5g13Ly/4DIp/I/HFkRkRmWGO0Os5Jzselsy3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SglrZmc0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SglrZmc0"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5DCC2289;
	Tue, 24 Mar 2026 01:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774313662;
	bh=fOXRVJYkLwRZbioTX2rMq7tzlqCpWU027+pprA6w/9M=;
	h=Date:From:To:Cc:Subject:From;
	b=SglrZmc04GZjLDx9tiCT7oemfzFe3lU5HcyeMRbRXnm4nPIWd0o3tk2h9w8nHhLXw
	 5Bci7DMJn/1theT+QcG8KvhzfkXMe4CIe18fDakJzfGEJs4+/uJfmhKrueR3ACJMVM
	 ml5HMTj286yy2jIYRbg5ur5mummwkqGxy24QJCBY=
Date: Tue, 24 Mar 2026 02:55:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Oliver Collyer <ovcollyer@mac.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yogev Modlin <yogev.modlin@realsenseai.com>
Subject: [GIT PULL FOR v7.1] media: uvcvideo changes
Message-ID: <20260324005537.GA2352505@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20260324

for you to fetch changes up to 1c9c2fe9350e1b92f35bd295bf4bba0d72cfbde2:

  media: uvcvideo: Add support for P010 pixel format (2026-03-24 02:33:54 +0200)

----------------------------------------------------------------
Improvements to the uvcvideo driver:

- VB2_DMABUF and configurable buffer size support for metadata stream
- Intel RealSense D436 and D555 cameras support
- P010 pixel format

----------------------------------------------------------------
Oliver Collyer (1):
      media: uvcvideo: Add support for P010 pixel format

Ricardo Ribalda (4):
      media: uvcvideo: Enable VB2_DMABUF for metadata stream
      media: uvcvideo: uvc_queue_to_stream(): Support meta queues
      media: uvcvideo: Allow userspace to increase the meta buffersize
      media: uvcvideo: Add a stream backpointer in uvc_video_queue

Yogev Modlin (2):
      media: uvcvideo: Change comment to 'Intel RealSense'
      media: uvcvideo: Add D436 and D555 cameras metadata support

 drivers/media/common/uvc.c           |  4 ++++
 drivers/media/usb/uvc/uvc_driver.c   | 38 ++++++++++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_isight.c   |  2 +-
 drivers/media/usb/uvc/uvc_metadata.c |  9 +++++++--
 drivers/media/usb/uvc/uvc_queue.c    | 23 +++++++++++-----------
 drivers/media/usb/uvc/uvc_v4l2.c     |  3 +++
 drivers/media/usb/uvc/uvcvideo.h     | 13 +++++-------
 include/linux/usb/uvc.h              |  3 +++
 8 files changed, 62 insertions(+), 33 deletions(-)

-- 
Regards,

Laurent Pinchart
