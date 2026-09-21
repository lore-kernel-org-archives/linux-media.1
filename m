Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F284B66C2
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004692; cv=none; b=JEj5+tS6j0xeVE5dpj/Gfvj8LZxUsc6YgesAix8ftL993N6JLZW6hTLHBv1uScMkxEL43opPoTaSXG/CTNaeFIRBbvciHCFtvvBM4B2xJJymfUxrbeasVLu0AO3iQoFXMdTcYUlGnpRaEBw1enx/8E7L1DB2/ZK8DY/zhloHi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004692; c=relaxed/simple;
	bh=QIycfM8lSGGpojOIRQ7BJiuB5wrTj6UvPklU28CgqhI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bLhuVN8m9hUHpT6Sfnf3L8XB3znY7pqwzqXCC7MrgIKQIREKjBWpgzE1r0ndWpZqvo01LuP1o+vfoQilFqrqAR0Xnt2eKHb2NXgI4mFMO4v/+SBd78Z1ZzZU0XLXblmrkd4R6xAhsEdgKV0VuUWItz5wl6T3lv0LNYlxh5gTaZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAVHl5f2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAVHl5f2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so43663865e9.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004689; x=1790609489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q17BTeQu3f/C2Tj9dpVKkyYMWZ/X3XaQhujghfI7S8w=;
        b=gAVHl5f2isrhpL8naWtHKgZD0fb8cq/bsGAFDWx5qy+QghiPWqfEQMtoRYBJw7Z6L4
         RUl5bcfKAt84WTDNTVCJAf2Ak7J4ncG4wllDz7SLe2PGdC/qos7dHHjiqVIKZr8ti4+k
         gNDOWVOb3jPxWFsCxgDGY1/v1K3qd/GKj/HRtznZuiNrnjUWwl+jGr0EViLFbgGyMooJ
         zT3axKlVwnbjnMW6quTpBHzr9Ta4CoQrBizulhfFS5J1IrJN6xDpqYyLpi12ydBeORR2
         0sdEefZxHr9BG48UeRWDMcCheXv5fAZDXdxABu2LiYVb8l7HGNoExiwuLRbIJXzmrVJK
         BQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004689; x=1790609489;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q17BTeQu3f/C2Tj9dpVKkyYMWZ/X3XaQhujghfI7S8w=;
        b=yrrQPXeNy6vbqrPOSFNw/Oso6zgVmBTleBAyoHHUAnt5Whpi328181abuAvuLSPcQD
         XlSVfpvFjlYfx0BkJ3kuzSIdC1BPvREu/Eg0amCyNPGOrDUMSS03oxmJXHJY9CpKHcn3
         dOXUxSRhcdShL4USDxdoIk0ISTqnrAiAIJlB5fQfQyIXV85PkJiwcaxTNBbkv1piknpu
         zvDKLiF0Uj458glCs7UNyU3yzsd7qfqOz1J7bCYHz1i6scLoTYcqcdJ8uolMDKlVoP6k
         6kUlGUkd3wWn5FTlSRsbwHIwfgR8D8Tf26En5xY72/blgZXmfSe35UnyOBFqz4VhTK28
         8KEw==
X-Gm-Message-State: AFuF++k3b4GxwoBpRyrjshqLudCwNUEgvy7ECTntqkxbF/0qCyfhzPsF
	/0V0fqlcX9r28x2bJPyWuA5UanFScPE9oIS4KiPhgKAQcbPwrjMZ3xsSBj8rCw==
X-Gm-Gg: AYBFou0CSuTNFBeqp8Vk9iRXdHwmxEKfKEa77+2XFoeLNrmpOjNLuau0QM/2mWbFpgd
	Fw1DcHiwE494U7gPLSp3IQQ6rlwYKBDhM4b4mwhR2YXK26Qn4BTkB9ZUST/+DCrvbdL8MOTS+Fb
	4MRyZgQCPr9oDt0Bt9ySmTATywvf0IyvwIzIWiuymG+U13DgxL6vscfPtIHe1Ms4Njecg25ybCr
	SJeMfVdLHGuNORdRTc9bNOBVmQWlMWtG0qynhGD+xf/pBq23oYULSb9SNliAGM5snytoAEwhFjI
	/t0QPkyjI0JKnRNLaxbaXXvyy+HBVovUkHoKd1sVU3O/cxsnaeMa2ZeXe14Xr7C5B401KsN7wtb
	Xs958tMLc+mhXOof38kUbUygmEpaUWKgM8zp0eRIl3ZgjgSTPWGJS3k3gcT5aqN+d9sQIzdlSwH
	6lelX5VfW345skgiRj9CsCv9ICDdWDq8iUAxvG05pKGm2w+Nnz8LMpsPiWjuZXAC+GUbE30/tE0
	xn2pQFlHBnnkoILd2etuKP9I0KB+3/DMOW67f4vS1HIavAL8kx91b12Vg==
X-Received: by 2002:a05:600c:3ba0:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fc55adc12mr195005285e9.0.1790004688933;
        Mon, 21 Sep 2026 08:31:28 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:28 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH v2 0/5] media: rockchip: add support for the RK3576 Video
 Capture unit
Date: Mon, 21 Sep 2026 17:29:56 +0200
Message-Id: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHRNsWoC/1WPzW7DIBCEXyXi3K0MZoH41PeocuBnSWjrOAUHt
 Yr87sV2parHkWbmm3mwQjlRYcPhwTLVVNJ0bUI8HZi/2OuZIIWmmeiE6owwUJO3N8jvPWoFijT
 nhmwnpGItcssU09dW93radbm7N/Lz2vHryPR5b5x5t/1hGnWHIPiSQED2FcJcQGsuXDC9DKSGK
 tYaZwuBn8YxzcPBBYzSYOxjywuBzijUPSEebeycFigpSm4kWyddUpmn/L0drnxbsGGPHP9/qxw
 6CH1Ecmhs5/DlPNr08dyo7LQsyw8bfY7wOwEAAA==
X-Change-ID: 20260828-vicap-rk3576-6e7118ea0246
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=3333;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=QIycfM8lSGGpojOIRQ7BJiuB5wrTj6UvPklU28CgqhI=;
 b=xJZVG8DMwVCT85tBT03zInvpL1eGKUYrkEBIDqUtAM993jolzJTX6rarm5D6/FBRrPwbZBk9W
 TrrC0yfaAx5BsukaBjJDfNKb5HQLhUoYXudewIoohBijfVtAOh6wHaB
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

This series adds support for the Video Capture (VICAP) unit of the
Rockchip RK3576 to the rkcif driver.

The RK3576 VICAP features a digital video port (DVP) and five MIPI
CSI-2 capture interfaces. Compared to the RK3588 variant, the MIPI
register blocks are laid out differently, the ID_CTRL0 bit layout has
changed, the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1, and the
capture size is configured in the new ID_SET_SIZE register. In
addition, the pixel clock of each MIPI port enters the VICAP through a
dedicated gate in the clock and reset unit, so the VICAP claims five
interface clocks and five interface resets.

The two driver patches that come first prepare the rkcif driver for
that, by adding a register index for the capture size and a callback
for the contents of ID_CTRL1. Neither changes the behavior of the
existing variants.

The device tree node connects the VICAP to the two MIPI CSI-2
receivers that are usable with the MIPI D-PHYs in full mode, following
the approach taken for the RK3588.

Tested on a Radxa ROCK 4D with a Radxa Camera 4K, whose Sony IMX415
sensor is wired to the first MIPI D-PHY in full mode.

This series applies on top of the RK3576 MIPI CSI-2 receiver
series [1].

[1] https://lore.kernel.org/r/20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Changes in v2:
- Split the driver patch in three, one adding a register index for the
  capture size, one adding a callback for the contents of ID_CTRL1, and
  one adding the RK3576 support itself (Michael)
- Collected Acked-by from Conor and Reviewed-by from Michael on the
  binding patch, and Reviewed-by from Michael on the device tree patch
- Link to v1: https://patch.msgid.link/20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com

---
Amin Gattout (5):
      media: dt-bindings: add rockchip rk3576 vicap
      media: rockchip: rkcif: add a register index for the MIPI capture size
      media: rockchip: rkcif: add a callback for the MIPI ID_CTRL1 register
      media: rockchip: rkcif: add support for rk3576 vicap mipi capture
      arm64: dts: rockchip: add vicap node to rk3576

 .../bindings/media/rockchip,rk3568-vicap.yaml      |  46 +++++-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  83 +++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 155 ++++++++++++++++++++-
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   4 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  21 +++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |   1 +
 7 files changed, 308 insertions(+), 3 deletions(-)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260828-vicap-rk3576-6e7118ea0246
prerequisite-change-id: 20260825-csi-2-rcv-dts-7712bd834de6:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

