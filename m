Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9144E652;
	Wed, 19 Aug 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138123; cv=none; b=qXrI17mAK5LL6WdjOfxxTLItPBEpokXSFzqSLxuVVOo+9klLTVXMWBkho4mJHUhlhLBzoLtpKedTKwkw4nwXy6iXR9tZKFQf13v6koPZ14SDZ5q2YxF8nEYBuT7ELvMIylra2RfflxVHjFxNMMWpWyJM2fHqULyikODECFcvfUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138123; c=relaxed/simple;
	bh=+O0Gd7dYD+ML+lDGGE6X0GreAnrSVB14tNzQ3byWCIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bojW3iPkbrW6ubE1W/QK48bBcARtS8luNCeUXIcJwt8WU0oPXAePtEGBUsmUZi87IKMEoZh9VGYDUZLrcAsWMOgsr3TXeSAt3ngzyLDSUjmLSzaEsUdZ0WKTe4oEafeRIo5jNx7fnTeEtbLrWXtY/d/c9Wwa0R0BaFSIsixqaDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E226A20044D;
	Wed, 19 Aug 2026 13:05:17 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-002HRY-2M;
	Wed, 19 Aug 2026 13:05:17 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-00000004K0O-2O4l;
	Wed, 19 Aug 2026 13:05:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/7] media: verisilicon: Add RK3588 VPU720 JPEG decoder
Date: Wed, 19 Aug 2026 12:37:29 +0200
Message-Id: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqHhWoC/x3MTQqAIBBA4avErBO0P8auEi1CR5sCC4UIxLsnL
 b/FexkSRaYEc5Mh0sOJr1Ch2gbMvgVPgm01dLKbJCot4tmPiOK4yVsyAjUp4waDqBFqdEdy/P7
 DZS3lA/2YKy9gAAAA
X-Change-ID: 20260819-rk3588-jpegdec-89e1cf4c8898
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Sinn <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787137517; l=3717;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=+O0Gd7dYD+ML+lDGGE6X0GreAnrSVB14tNzQ3byWCIc=;
 b=dG5ZAOPzpg6YY00ZFsztwh+kX27axvdSlRbGYX5WU3XPRC07G+PHESYaoGaxlNuUZCf5Zrgm2
 DSIpuKZXeBhDLKDHZRNvV5mjtnZAZ55V40y8bqFUlVlvt5TOg+z3BP7
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

This series adds support for the RK3588 JPEG/MJPEG hardware decoder, the
VPU720. This series adds it to the hantro driver, along with three fixes
to the hantro core that came out of the work.

Patches 1-3 are independent of the new decoder and stand on their own. A
codec ->run() that fails currently leaves an armed watchdog behind that
later aborts an unrelated job, leaks the pm_runtime reference and the
clocks, and never completes the control handler object bound to the
media request, so the request stays queued until userspace closes it.
Patch 3 makes V4L2_EVENT_EOS subscribable; hantro queues the event in
three places but no application can ask for it.

Patches 4-7 add the decoder itself: the binding, the driver, a minimum
sizeimage for the coded queue, and the DT node.

Unlike the other hantro en/decoders the VPU720 works as a stateful
decoder - userspace hands it a whole frame and never looks inside the
bitstream. The driver parses the JPEG header on the CPU, builds the
quantisation and Huffman tables into a DMA side buffer and programs the
hardware from there.

Patch 6 enforces a minimum frame size to the coded queue for the JPEG
decoder path. This is necessary here as userspace doesn't know how large
a frame can get, but the decoder needs a full frame to work. In my
Gstreamer tests Gstreamer came up with buffers that were too small to
take a full frame at higher resolutions (> 1080p). That is expensive of
course, 16 MiB for a 4k image.

Tested on a Radxa Rock-5t board

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Lucas Sinn (3):
      media: verisilicon: Add Rockchip VPU720 JPEG decoder
      media: verisilicon: Enforce a minimum sizeimage for the JPEG decoder
      arm64: dts: rockchip: rk3588: Add VPU720 JPEG decoder node

Sascha Hauer (4):
      media: verisilicon: Fix the cleanup when a codec ->run() fails
      media: verisilicon: Complete the request on the ->run() error paths
      media: verisilicon: Allow the EOS event to be subscribed
      media: dt-bindings: Add Rockchip RK3588 VPU720 JPEG decoder

 .../bindings/media/rockchip,rk3588-vpu720.yaml     |  93 ++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  25 +
 drivers/media/platform/verisilicon/Makefile        |   1 +
 drivers/media/platform/verisilicon/hantro.h        |  17 +
 drivers/media/platform/verisilicon/hantro_drv.c    |  49 +-
 .../platform/verisilicon/hantro_g1_h264_dec.c      |   6 +-
 .../platform/verisilicon/hantro_g1_mpeg2_dec.c     |   2 +-
 .../media/platform/verisilicon/hantro_g1_vp8_dec.c |   6 +-
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |  11 +-
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |   4 +-
 .../platform/verisilicon/hantro_h1_jpeg_enc.c      |   2 +-
 drivers/media/platform/verisilicon/hantro_hw.h     |  19 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |  69 +-
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c        |   6 +-
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |   6 +-
 .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c       |   2 +-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c         |   6 +-
 .../verisilicon/rockchip_vpu720_hw_jpeg_dec.c      | 962 +++++++++++++++++++++
 .../platform/verisilicon/rockchip_vpu720_regs.h    | 261 ++++++
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |   5 +-
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |  80 ++
 22 files changed, 1595 insertions(+), 38 deletions(-)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260819-rk3588-jpegdec-89e1cf4c8898

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

