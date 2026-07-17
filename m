Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869752C21C4
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276706; cv=none; b=YJKWbkqaTzOsHS6P0+eAc0ZKqSyPGJRALfgMum5g8E8H/+/qMsg6DzUYd+QAx83malc2/a5kHtA/payL8BHpk+Yjk365RHqUgMyRPQYk7f5lTVgk7GGaUj2WcEBMcO/ZtZwd9XSLgKNTro6r0EUj98yW0lpo3EGxJt6BqUz52bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276706; c=relaxed/simple;
	bh=57m0X1Ku14F+xxDWxNk3+Ts49pmlUJGTlnaEpJkC1fE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=A2KfqQAW+Am9FuoQEBpi1hHEfLPto52+6ofNyqzt3cDaC+7Y384NhWdk7PeLP3O1XonxeU9xKL9TCCDM/BPsjBtRguD37ksNHJfA52Id0KD8mDjePu67WVBLX1hHe0fNHrdl+DzL7A1fEU1WpXss5OkKRhlUlZyz1EZ9QLJkQ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHssLkUb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHssLkUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAAD1F00A3A;
	Fri, 17 Jul 2026 08:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276705;
	bh=bufMpBdGolJ5Ybw0Na2tXTP7fWyllNNfP1en9Zq/ZVM=;
	h=From:To:Subject:Date;
	b=cHssLkUbRG09An0O+2h+mCCdtsfB/+jipElgpEdRU7jdSHEp1Af8iHKsentHMeKXA
	 RsgReCvq3o2w10oY+XYIEsUDoTurgsHn/o1YmMGGw16SCc1sKtR4rRUsExB9nCDzbX
	 26Ggspn59p0tiwQTgN59A2Qkm5zXLiw0c31EImcuxFmD0jnKjhDyOQvDNDmZGa9tUj
	 mAQFfIRe+1s2xog3GWo7Kjt0NSZ9BDXmSC08aztgQIYMrP4O+oSEXImyQE+89AENfb
	 QpbUjhLnt1HHpTGpXqV57jsvZN62xwKvqKw4Fwi8BmHfgAKQz0zJcq+4NbPSU4N6da
	 NGYEYnvzu/FRA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Subject: [PATCH 00/19] media: clean up unnecessary vb2_queue_release calls
Date: Fri, 17 Jul 2026 10:19:23 +0200
Message-ID: <cover.1784276382.git.hverkuil+cisco@kernel.org>
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
 drivers/media/platform/nxp/imx7-media-csi.c        | 10 +++-------
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 14 +++++---------
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  5 ++---
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   |  7 ++-----
 .../platform/samsung/s3c-camif/camif-capture.c     |  7 +------
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |  4 +---
 drivers/staging/media/imx/imx-media-capture.c      | 10 +++-------
 drivers/staging/media/ipu7/ipu7-isys-video.c       |  6 +-----
 include/media/videobuf2-v4l2.h                     |  4 ++++
 24 files changed, 42 insertions(+), 114 deletions(-)

-- 
2.53.0

