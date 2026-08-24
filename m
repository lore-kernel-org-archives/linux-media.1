Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6497135E1B8;
	Mon, 24 Aug 2026 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553587; cv=none; b=pBNh22rp6T8wcIR3wN5Q4XGZRHDV6bgvrZqupqoqJ98i7Cl6YO10sf8mj2cctrGed9L9KodMgSrhabmX9KUiiu+na4/pcbSfTq2NaOHt92S1TLNWyQKdpA1DlGcZDDRw8KcjB2kJDfrD20cLIF/KyIeVAG7yZiXdXt1W6ByQs1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553587; c=relaxed/simple;
	bh=Yr7A6reUyyDCMEF4I5SVOxrskAXy24WpmyQEjcaemrw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MtsOP53IoXWCT3Ov0grXO96yFo/SBnHOn2X7IlyAvgHHBznYbM+9X+xTWO0iCIOiBKxS8pxCCbGc8tDsPNYryDKBrgbzURvCGSd3UZYmxy6xeQn6IvclBRHJDTUJ261FlhbPF5y3L3hwGEqel95B8mG9bpjjG+piS0PafpqcjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C1DEF200F4F;
	Mon, 24 Aug 2026 08:39:35 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOLH-0033ic-2A;
	Mon, 24 Aug 2026 08:39:35 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOLH-0000000DClv-22qh;
	Mon, 24 Aug 2026 08:39:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/3] media: verisilicon: Fix error paths in hantro drivers
Date: Mon, 24 Aug 2026 08:39:33 +0200
Message-Id: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXni2oC/3XMQQ6CMBCF4auQWVtDKeKUlfcwLEw7LaNJIS0SD
 Ondrexd/i953w6JIlOCvtoh0sqJp1BCniow4yN4EmxLQ1M3XY1Si/hSF0TxnMlbMgI1SeNag6g
 RymmO5Hg7wPtQeuS0TPFz+Kv8rX+pVYpaKGWvrbFOddrcZgr+vcQp8Ha2BEPO+Qs7L4PfsQAAA
 A==
X-Change-ID: 20260819-rk3588-jpegdec-89e1cf4c8898
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787553575; l=1639;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=Yr7A6reUyyDCMEF4I5SVOxrskAXy24WpmyQEjcaemrw=;
 b=Z9lYl9pt+cU57E8Z3IdiQ6jOYE0qMgAAci9SQfGPbifR8CQ9ds8PSD++6ezUflWNP05L7a0bN
 H8yQOMUwqeHBbBx2gMkoruwEo5h9TggfH3AxjaTZbSyOLsHkSdChLD2
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

This contains the Hantro error path patches previously sent as
part of "media: verisilicon: Add RK3588 VPU720 JPEG decoder" [1] as a
separate series. As the Rockchip JPEG decoder turned out to be no Hantro
compatible hardware at all I'll continue that as another series. This
series now contains the useful stuff from [1] with Nicolas comments to
the first patch addressed.

[1] https://lore.kernel.org/all/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de/

---
Sascha Hauer (3):
      media: verisilicon: Fix the cleanup when a codec ->run() fails
      media: verisilicon: Complete the request on the ->run() error paths
      media: verisilicon: Allow the EOS event to be subscribed

 drivers/media/platform/verisilicon/hantro_drv.c    | 35 ++++++++++++++++++++--
 .../platform/verisilicon/hantro_g1_h264_dec.c      |  4 ++-
 .../media/platform/verisilicon/hantro_g1_vp8_dec.c |  4 ++-
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |  9 ++++--
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  2 +-
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
 drivers/media/platform/verisilicon/hantro_v4l2.c   | 13 +++++++-
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c        |  4 ++-
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |  4 ++-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c         |  4 ++-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |  3 +-
 11 files changed, 70 insertions(+), 13 deletions(-)
---
base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
change-id: 20260819-rk3588-jpegdec-89e1cf4c8898

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

