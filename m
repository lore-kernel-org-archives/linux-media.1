Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803BE3E3DBC;
	Mon, 24 Aug 2026 07:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554881; cv=none; b=pxcJpYgl8nd6o3DncairQWV8SLz6CibfLRsa53BNhtvHu7lYgV+Gde/0y+GaJjbjZF/L/9te9MMjirJi872T4HeA6fS97RaAF2906NpiBHz59N3rubeEPXySxB8cP34AEP3whjHAeHyowApXEk/klJgl3OvsGDJP5Sl2kP7XMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554881; c=relaxed/simple;
	bh=ZrzT1INpYp2PH7YPp3yG6IEA/R6dIdxom/U7Lx6vDYU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PC5gSEyIF+I7opDQif38OxTMgiYfzjYeuAd9c9m3Qg+UHT2axw8ugry2/5+Ua/EnfRw/B1rHEhuJ0HhG3h8Xepwcg+ObvEhBl38HysSSbDdZTNd4kBWJp77j9y6T4Ib37k5iKJZFppMwcqNHcUvcPyznwTjRn1Rh8HPeh0yLw/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5B61D2010D6;
	Mon, 24 Aug 2026 09:01:15 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOgF-0033lH-0k;
	Mon, 24 Aug 2026 09:01:15 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOgF-0000000DDM7-0alc;
	Mon, 24 Aug 2026 09:01:15 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/4] media: rockchip: Add JPEG decoder driver
Date: Mon, 24 Aug 2026 09:01:08 +0200
Message-Id: <20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTsi2oC/x3MQQqAIBBA0avIrBNMSKSrRIsYR50CE4UIxLsnL
 d/i/waVClOFVTQo9HDlOw3MkwCMRwok2Q2DVtooq2dZbrwwcpZnpuAIpXLGWoXeLAZhZLmQ5/d
 fbnvvH8NgDlNiAAAA
X-Change-ID: 20260821-rockchip-jpegdec-0d6880cf656c
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787554875; l=1849;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=ZrzT1INpYp2PH7YPp3yG6IEA/R6dIdxom/U7Lx6vDYU=;
 b=E1A/kSx7sqk1KlpzpTjPfPraET1fHCTezJot/oqZ/YxSn9tJQZ2ykdvQQIrYdwYH2GcDTMy0G
 H8WRwyNA9PXDBeEQN/Sx82urPrw1PskfUBSPLddTM6xV8UrH9vUaXUB
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

This series adds support for the Rockchip JPEG decoder hardware. The driver
was previously sent as part of the Hantro driver in [1]. The hardware
turned out to be not Hantro compatible at all, so this new series contains
the driver as a standalone driver in drivers/media/platform/rockchip/

Comments to the last series have been addressed where still applicable.

Also the hardware seems to be identical over various other Rockchip SoCs, to
accomodate for that I replaced several occurences of rk3588 with rockchip
and added rk356x support which was already reported working with this driver.

[1] https://lore.kernel.org/all/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de/

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Sascha Hauer (4):
      media: dt-bindings: Add Rockchip JPEG decoder
      media: rockchip: Add JPEG decoder driver
      arm64: dts: rockchip: rk3588: Add JPEG decoder node
      arm64: dts: rockchip: rk356x: Add JPEG decoder node

 .../bindings/media/rockchip,jpeg-decoder.yaml      |   92 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   22 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   24 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkjpegd/Kconfig    |   14 +
 drivers/media/platform/rockchip/rkjpegd/Makefile   |    3 +
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  230 ++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2279 ++++++++++++++++++++
 10 files changed, 2675 insertions(+)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

