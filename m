Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10562409DF0
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158114; cv=none; b=hVL/t1r8LDL362Z9i9ztgZzR9E2LRlNeL2bZrhhBNVU263KQivBzESThv1/lQgN/+HZSKzwW1XetW8lFrELs0k4qBe3oielwycscz+4upqgL7AR25LjKb/L8/MG0Rxae4/M5ijuXbtBmNpfzi+YVc1HsxyBDwPJJI8K3YE7PT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158114; c=relaxed/simple;
	bh=niBY2JpFOklKd917dTAHHMhNNMyO5rA/VqRHgr0GFUI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KI8pfnIovqHXgSIsP/5UuVzfxIy/N+lXjxmrhIT6a3KEIzNh5ZeuOYpFAEPHYI54tYNokJrElo4MYEvYEoAm9IFo7HJNk5/MOMMXVOC9+BF93fw8gPcNGk1kI1+nh8wjAtvsFtzPuBGUYQ27pEJcZoiSWYEqN35z+lbGNch0K2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCNPhtun; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCNPhtun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2CC1F000E9;
	Mon, 27 Jul 2026 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158113;
	bh=yLbjx1nA43h076JBQb4Mo29X3orQOZieyFlAr/2Cqqc=;
	h=From:To:Subject:Date;
	b=CCNPhtunnhZjbGW+L6J34SYLRZTe2PiA+fkCesigfv1/7Tt/Irx2/xjj6G0nUD5O+
	 eE0CNOxNgO93UIDU+eLbfhoS0IP1wAtapLHx2SzZ4x4w/WSJ5IP6VPUTg+sD2IeUWh
	 2GNwQcVc0xtORb28IkOIR9iZhC0VoN557PSgIKsbwF+Syy37hByU7EdvzHScA+7eBk
	 6nFx33syeZtut++iyylZtAEcKQ+bBs8+cMkqb+kBaDiC6DL3RplCM/fP43QqfI4S07
	 TWvLgo7AN0J2QTqq7LZ2edc+IIsT9lhJ8vHXXsJWnB7ulF1zud6vzCybfVhw8PP+bn
	 Fcy3TqbMgWv+w==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 00/19] media: clean up unnecessary vb2_queue_release calls
Date: Mon, 27 Jul 2026 15:12:47 +0200
Message-ID: <cover.1785157986.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many drivers call vb2_queue_release() unnecessarily. There is normally no
reason for drivers to call this function directly, instead call
(_)vb2_fop_release(), vb2_video_unregister_device() or
v4l2_m2m_ctx_release().

This series removes the vb2_queue_release() calls from most drivers.

There are still a few old drivers that call it, but let's get the
majority fixed.

Regards,

	Hans

Changes since v1:
- improve commit logs
- ensure media_entity_cleanup comes after vb2_video_unregister_device
- fix a few compiler warnings for unused vq variables

Hans Verkuil (19):
  media: videobuf2-v4l2.h: improve vb2_queue_release() documentation
  media: pci: hws: drop call to vb2_queue_release
  media: pci: ipu6: drop calls to vb2_video_unregister_device and
    vb2_queue_release
  media: pci: zoran: use vb2_video_unregister_device
  media: platform: amd: isp4: drop vb2_queue_release calls
  media: amlogic: c3: isp: drop vb2_queue_release calls
  media: amphion: drop unnecessary vb2_queue_release call
  media: arm: mali-c55: drop unnecessary vb2_queue_release calls
  media: imagination: e5010-jpeg-enc: drop vb2_queue_release
  media: nuvoton: drop unnecessary vb2_queue_release calls
  media: nxp: imx7-media-csi: use
    _vb2_fop_release/vb2_video_unregister_device
  media: raspberrypi: pisp_be: use vb2_video_unregister_device
  media: renesas: rzv2h-cru: use vb2_video_unregister_device
  media: renesas: rzv2h-ivc: drop unnecessary vb2_queue_release calls
  media: samsung: s3c-camif: drop unnecessary vb2_queue_release
  media: ti: j721e-csi2rx: use vb2_video_unregister_device
  staging: media: imx: drop vb2_queue_release call
  staging: media: ipu7: drop unnecessary cleanup calls
  media: renesas: rzg2l-cru: drop unnecessary vb2_queue_release

 drivers/media/pci/hws/hws_video.c                  |  5 -----
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |  6 +-----
 drivers/media/pci/zoran/zoran.h                    |  1 -
 drivers/media/pci/zoran/zoran_card.c               |  4 +---
 drivers/media/pci/zoran/zoran_driver.c             |  5 -----
 drivers/media/platform/amd/isp4/isp4_video.c       |  8 +++-----
 .../media/platform/amlogic/c3/isp/c3-isp-capture.c |  7 ++-----
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 11 ++++-------
 .../media/platform/amlogic/c3/isp/c3-isp-stats.c   |  7 ++-----
 drivers/media/platform/amphion/vpu_v4l2.c          |  8 +-------
 .../media/platform/arm/mali-c55/mali-c55-capture.c |  4 +---
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  4 +---
 .../media/platform/arm/mali-c55/mali-c55-stats.c   |  4 +---
 .../media/platform/imagination/e5010-jpeg-enc.c    |  8 +-------
 drivers/media/platform/nuvoton/npcm-video.c        |  7 ++-----
 drivers/media/platform/nxp/imx7-media-csi.c        | 11 +++--------
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 14 +++++---------
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  5 ++---
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   |  8 ++------
 .../platform/samsung/s3c-camif/camif-capture.c     |  7 +------
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |  4 +---
 drivers/staging/media/imx/imx-media-capture.c      | 11 +++--------
 drivers/staging/media/ipu7/ipu7-isys-video.c       |  6 +-----
 include/media/videobuf2-v4l2.h                     |  4 ++++
 24 files changed, 42 insertions(+), 117 deletions(-)

-- 
2.53.0

