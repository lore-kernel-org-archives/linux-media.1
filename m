Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF5F4A64C4
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475286; cv=none; b=NKUBcaG7Y5IofC5VRNz06RNVgnLZjzRLCHR5y8xuPXAq3D8eMsCxFPA76naebJ4ZJZBqF5x+DhnR1AfMCmaoyo7Qyo/xuBXLlCq8P6iyPWrdb4eBoxylIv/FZclvL5YRRzjhX6iSmeJ1KJ0JEkww3dKJKxnrcaGMveumBBrJOjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475286; c=relaxed/simple;
	bh=fjgaxYIkHsKMCuCxbpX52v0NBvL5DHy/++HiJ3R7ad0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kl2jVxErGPTu9W3WuLShDJz0z+0vr2LxK+XB5Ok/z1SOTurodgsO0Pm5oN+7ewMeIAijvVKidb8+Fiu2mqEHSFvJrj+EskAH/Y0/8LIHCyD2Qx/yWt7HOYADu5KgBg6sdHyNMNzhRXSRbDjRtOcqSPIS3RVYXhnYcIi0/gGIjD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGnntRw+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGnntRw+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so1648075e9.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475282; x=1790080082; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WazcjzkIAdsaj6kzT/3JxFcBr2wvj1ct6YfgbM8kJLQ=;
        b=VGnntRw+8tBeYzc47DUeyVR+ZR0t8p2/1BLOYxR3IOHZ8EJGgrGxmJHYa6vDdKb5CB
         /MIthYHXBUo3Nd7n1ClXAYATztN/M4GAkWnbdMSkHe+jVkzV7iLVN92jmsAWfmaLeWzk
         PBeId5Zb7d477OQi3UMPU7JuLNZX31eVhfS7c3k2RlCwn0uboxIRK8v0wfPr9R1hohvF
         C3B11MJs303r32kKngRrUhNYcB0TL7QSgeruUOSPZ8y6bYZB1zVd3zWqd9yqQzNYOE1h
         UAQb/XTHGi20czWkgQlwflc6jej3dqF8I8Se1SfiC3rzrK9aO1oLgeiknounyhIw2gq0
         tdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475282; x=1790080082;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WazcjzkIAdsaj6kzT/3JxFcBr2wvj1ct6YfgbM8kJLQ=;
        b=u4nFX+NiDlPsM7s26pHtYnDjpn2n6q6Rw7RVei25k8tPRTQqRZSLGUxnMAc0QZjbcU
         XKNWPkS59dwd5BAqTJ0Wo4n9ndHJsDStBFi6rrkq9s62M0TYmcdu4TlJnvfru5jUVZr7
         hqKyowU393UZP5C3FPvQ0iZrEhSx8aWMW7bwBByebBHFGQADp1RJDfJncTm0+Xm/w+D8
         74PbhzsXMIjEhqewbOBQq1dcNebvkLXrQYJYGYZAClH1nX1qsQi0Ko9L3ETHyag6/opP
         +P6bUFlzN0cLq6rhhqXOhbD2yQZnwVC/euc+ADeK6y/QkJowuzBDqJi9ycOyJVs5xvrN
         50pg==
X-Gm-Message-State: AFuF++kDjI5QLTjbJo/8Ybdt8wMM/6kK0PsiU/rF9PRadGTq6Cv0Ric7
	ZhSJF2Pak9UBZ9FYldoBPoWKReiAVRnPg8E02dqBIPSNta4OmTvcENcU
X-Gm-Gg: AYBFou2ZhVZn4m6/MDHiS4pVqKwWLKBI6mS1GevcdfGUVCtm1kBJGffbFNZWAUAS7Bh
	NGJYSl7j2Fl8bc4X8fiExHqN6wCCaGPt/FWgDvmi6Jq4bGlXcsXfx9wnAquOAqgj+I4RtuhJiRR
	4HMMgqeXRaCWzUzBIsHtnbXxlfTmNOEzobYEL/p6uI63p3O/48boaQruRgkGbhOrJH7RXxj3BWE
	kPAKLQyMu4ERz4s0Tc845hJ3n3Ieb7JGeXGNNzSWuT0Imd1/P4N0DPoZjHodeNlEV6ofKGEagGc
	K9Nvk2ZPvdXnuzX9knQd70MyYmDcUgkASrqtgwDGb8sUiZ1llKfnQvKmuSs1s81q3/rjOb7s2sk
	QRtURdul7qL4q508KFxpi+PKcqODPr1aI21F2yoFmEGzB8uV7riIEIs7rmdcJpPoVVCOUSqsuCG
	kvn+M+lSp4+amj9WetvA1eoUoC65Re3si0kHQOcwfhINq9ixQmu4hFx/Fi/uiNLvHpM1JcpB15e
	B38WgkYEGD06vWC0XfxHfzWm4phNQIZFlkUcd+7micdSgCt1A3ddKX/NDE2A/Z/PPY=
X-Received: by 2002:a05:600c:4e4a:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49e8228f824mr15102105e9.18.1789475281666;
        Tue, 15 Sep 2026 05:28:01 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm83105075e9.15.2026.09.15.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:28:01 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/3] media: rockchip: add support for the RK3576 Video
 Capture unit
Date: Tue, 15 Sep 2026 14:27:55 +0200
Message-Id: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMs5qWoC/0WNywrCMBBFf6Vk7UAzzSSxvyIu8phoFLUmtQjiv
 xsf4PLAvec8ROWSuYqxe4jCS675cm4gV50Ie3feMeTYWGCPurdoYcnBTVCOAxkNmo2Ull2PSot
 2mQqnfP/oNtsv15s/cJjfjt+i8PXWOvN39s+M3S9CEGoGhBIWiHMFYyT6aAcVWY8LvjXeVYZwO
 Z3yPHY+UlKW0pDaH5G81WQGJlq71HuDpDgpaZXYPp8vODiI1vEAAAA=
X-Change-ID: 20260828-vicap-rk3576-6e7118ea0246
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475280; l=2501;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=fjgaxYIkHsKMCuCxbpX52v0NBvL5DHy/++HiJ3R7ad0=;
 b=p9QzUFEagfxIF+66sL2fgBQy9ZfkQOV2yNuM1urHy+dkfInoi+sxwkJKWB/FT0x3gg10Ims/2
 CoWDe/9nDo8BTaMVgacfHx57PWnOhfXxp5lc8ZkaaE7HTDs8Rj8nMC7
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
Amin Gattout (3):
      media: dt-bindings: add rockchip rk3576 vicap
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

