Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450271;
	b=Gbc1vVU0xYNWjB6k6zbyDP77SlSb25VHMhnPFo2JWW9ZLXnPrjddL5X6uhib2tKAZ3Oa
	 VD7cL3YrZUGSlkQjg0d3m2Oqge6FYgy4OKr02ePRLtO9VBgAGWEDBeQBTR6j1o1NbCkU6
	 yTg6QOG3mhDIcdzptwcjeJDys3EtWZ5U6zzHfrUjV+0uuZI9+yHO9mlKE2aZYPJ0AMT6u
	 O9EAIAP1Nhb1w32LQbX70AoN2A4JimANQQefjAt5N63LnJVThG0o76s1HHttQkcuuboL1
	 4QStkIfRa9li0zDD1vmflVdADxJXBdNJT3pnLFLNLp5DAfLW9+K4P0YlxIZ5jKNk2Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450271;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lnOq6KzhyeEww1J1kjNHS6lCCW5b+4fV/oYYtn6ZqIU=;
	b=gckkUSGlIXJVXmIHULpY2gAr1FeSkl09uOGgNQc6SA9nsJUKkC/uWIznVhd8FpvkF54F
	 c5exCPQbXZuI5R32sLKRmFl1ZzU/9RMRncnp5ze+nS8TZUJTI5xpyYktl/vcGsJU2hRDD
	 cjfhQkDu3Oq1duWSEdUUe5zqQeeqcBuy8MvCH2CeXmO2NGVbDSCrfnoVh8UXYBkk4TBWC
	 uCO6IbWdLeyhw2uff0YKQKeVIUuIAqVwnqQfga0dzm3Rr9QaEOnvyabA1kfndeCwIUyKD
	 ESLXRN8OBvf/uqxiDr59/6Dke/HS+JM6OrRVeF2SstyNAfWpWUdE0KXc+DFze+eAtOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=qDp2g8iO;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182EA606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 182EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=qDp2g8iO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793450268; x=1793709468;
	bh=lnOq6KzhyeEww1J1kjNHS6lCCW5b+4fV/oYYtn6ZqIU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qDp2g8iOvC9yNvoKE/8XKUYomC7FhFlR2kcnQOojcAdzxoHRpC7gobEVdRnBUlsR6
	 nymxsbuqpR/YT4Kv9f8XyCezRqdwJo8neUxXjVw87nxx1FyQXhhnIKwkEy3kBT+UFi
	 AkCol7MMynIJkw2bcdXbz2PZXFdQqwB/dO53WVRl/uQYg2stI4cwWCPvF6gRaFMETW
	 OVvjCbdXfbgWGr8MptCrr4QzpXsngT7LHCTetn+thwDNQ209wFeioI8IlBKdd+G5tI
	 MkSEWUvWmi9wMIWHK5tlJFtHRWyJA1xenL4tmfpOgPXuLfD9wgJHLM5CPhdKh4HeCO
	 lj+5zmdrpBKBg==
Date: Sat, 31 Oct 2026 12:37:45 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 10/12] media: ipu6: Add IPU4P CSI PHY driver
Message-ID: <gFA4p9lGPPkGxkbDnbfblvYfNhZOjJLgwimit_oxwNrKdJ7bITmNPWCXOoNN_KHKD3EqjISrPd4NS4VqchOpYZNHqsiE_0UxIbGTs7rUAyo=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: ce1b35b682457caf5a2526e68efacae0a70dbd7c
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add IPU4P-specific CSI PHY initialization and power management.

Configure the PHY building blocks during ISYS resume, and handle
receiver lane timing and CSI error interrupts when streaming.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/Makefile         |   1 +
 .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 175 ++++++++++++++++++
 .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     |   4 +
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   8 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  10 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   5 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  12 ++
 7 files changed, 212 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/inte=
l/ipu6/Makefile
index 54fca25785a..ff826876166 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -25,6 +25,7 @@ intel-ipu6-isys-y=09=09:=3D ipu6-isys.o \
 =09=09=09=09ipu6-isys-mcd-phy.o \
 =09=09=09=09ipu6-isys-jsl-phy.o \
 =09=09=09=09ipu6-isys-dwc-phy.o \
+=09=09=09=09ipu4p-isys-csi-phy.o \
 =09=09=09=09ipu7-isys-csi-phy.o
=20
 obj-$(CONFIG_VIDEO_INTEL_IPU6)=09+=3D intel-ipu6-isys.o
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c b/drivers/me=
dia/pci/intel/ipu6/ipu4p-isys-csi-phy.c
new file mode 100644
index 00000000000..6177be4fa01
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/types.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-isys.h"
+#include "ipu6-platform-buttress-regs.h"
+#include "ipu4p-isys-csi2-regs.h"
+
+struct ipu4p_phy_bb_config {
+=09u8 bb;
+=09u8 crc;
+=09u8 drc;
+=09u8 afe;
+};
+
+#define IPU4P_CSI2_GPREG_CR_PORT_CONFIG_DEFAULT=090x3895
+#define IPU4P_CSI_BSCAN_EXCLUDE=09=09=09(BIT(9) | BIT(18) | BIT(27))
+
+static const struct ipu4p_phy_bb_config ipu4p_phy_bb_configs[] =3D {
+=09{ 4, 13, 32, 0x0f },
+=09{ 6, 13, 32, 0x15 },
+=09{ 10, 13, 32, 0x15 },
+=09{ 12, 13, 32, 0x0f },
+=09{ 14, 13, 32, 0x15 },
+};
+
+static void ipu4p_isys_configure_phy_bb(struct ipu6_device *isp,
+=09=09=09=09=09const struct ipu4p_phy_bb_config *config)
+{
+=09void __iomem *base =3D isp->base;
+=09u32 value;
+
+=09value =3D readl(base + IPU4P_BUTTRESS_REG_CPHYX_DLL_OVRD(config->bb));
+=09value &=3D ~GENMASK(6, 1);
+=09value |=3D FIELD_PREP(GENMASK(6, 1), config->crc) | BIT(0);
+=09writel(value, base + IPU4P_BUTTRESS_REG_CPHYX_DLL_OVRD(config->bb));
+
+=09value =3D readl(base + IPU4P_BUTTRESS_REG_DPHYX_DLL_OVRD(config->bb));
+=09value &=3D ~GENMASK(6, 1);
+=09value |=3D FIELD_PREP(GENMASK(6, 1), config->drc) | BIT(0);
+=09writel(value, base + IPU4P_BUTTRESS_REG_DPHYX_DLL_OVRD(config->bb));
+
+=09value =3D config->afe | FIELD_PREP(GENMASK(30, 29), 2);
+=09writel(value, base + IPU4P_BUTTRESS_REG_BBX_AFE_CONFIG(config->bb));
+}
+
+void ipu4p_isys_phy_setup(struct ipu6_isys *isys)
+{
+=09struct ipu6_device *isp =3D isys->adev->isp;
+=09void __iomem *isys_base =3D isys->pdata->base;
+
+=09writel(IPU4P_CSI2_GPREG_CR_PORT_CONFIG_DEFAULT,
+=09       isys_base + IPU4P_ISYS_GPOFFSET +
+=09       IPU4P_CSI2_GPREG_CR_PORT_CONFIG);
+=09writel(IPU4P_CSI2_GPREG_CR_PORT_CONFIG_DEFAULT,
+=09       isys_base + IPU4P_ISYS_COMBO_GPOFFSET +
+=09       IPU4P_CSI2_GPREG_CR_PORT_CONFIG);
+=09writel(IPU4P_CSI_BSCAN_EXCLUDE,
+=09       isp->base + IPU4P_BUTTRESS_REG_CSI_BSCAN_EXCLUDE);
+
+=09for (unsigned int i =3D 0; i < ARRAY_SIZE(ipu4p_phy_bb_configs); i++)
+=09=09ipu4p_isys_configure_phy_bb(isp, &ipu4p_phy_bb_configs[i]);
+}
+
+static void ipu4p_isys_csi_irq_enable(struct ipu6_isys *isys,
+=09=09=09=09      unsigned int port)
+{
+=09void __iomem *base =3D isys->pdata->base;
+=09u32 offset =3D ipu4p_isys_csi_irq_ctrl_base(port);
+=09u32 offset0 =3D ipu4p_isys_csi_irq_ctrl0_base(port);
+=09u32 mask =3D IPU4P_ISYS_CSI_ERROR_MASK;
+
+=09writel(IPU4P_ISYS_CSI_IRQ_ACTIVE,
+=09       base + offset);
+=09writel(0, base + offset + IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET);
+=09writel(0xffffffff, base + offset + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
+=09writel(IPU4P_ISYS_CSI_IRQ_ACTIVE,
+=09       base + offset + IPU4P_ISYS_IRQ_MASK_OFFSET);
+=09writel(IPU4P_ISYS_CSI_IRQ_ACTIVE,
+=09       base + offset + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
+
+=09writel(mask, base + offset0);
+=09writel(0, base + offset0 + IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET);
+=09writel(0xffffffff, base + offset0 + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
+=09writel(mask, base + offset0 + IPU4P_ISYS_IRQ_MASK_OFFSET);
+=09writel(mask, base + offset0 + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
+}
+
+static void ipu4p_isys_csi_irq_disable(struct ipu6_isys *isys,
+=09=09=09=09       unsigned int port)
+{
+=09void __iomem *base =3D isys->pdata->base;
+=09u32 offset =3D ipu4p_isys_csi_irq_ctrl_base(port);
+=09u32 offset0 =3D ipu4p_isys_csi_irq_ctrl0_base(port);
+
+=09writel(0, base + offset + IPU4P_ISYS_IRQ_MASK_OFFSET);
+=09writel(0, base + offset + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
+=09writel(0xffffffff, base + offset + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
+
+=09writel(0, base + offset0 + IPU4P_ISYS_IRQ_MASK_OFFSET);
+=09writel(0, base + offset0 + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
+=09writel(0xffffffff, base + offset0 + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
+}
+
+/* PHY settings persist until ISYS is power-cycled. */
+int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
+=09=09=09     struct ipu6_isys_csi2_config *cfg,
+=09=09=09     const struct ipu6_isys_csi2_timing *timing,
+=09=09=09     bool on)
+{
+=09struct ipu6_isys_csi2 *csi2;
+=09void __iomem *base;
+=09u32 value;
+
+=09if (!cfg || cfg->port >=3D isys->pdata->ipdata->csi2.nports)
+=09=09return -EINVAL;
+
+=09csi2 =3D &isys->csi2[cfg->port];
+=09base =3D csi2->base;
+
+=09if (!on) {
+=09=09value =3D readl(base + IPU4P_CSI2_RX_CONFIG);
+=09=09value &=3D ~(IPU4P_CSI2_RX_CONFIG_DISABLE_BYTE_CLK_GATING |
+=09=09=09   IPU4P_CSI2_RX_CONFIG_RELEASE_LP11);
+=09=09writel(value, base + IPU4P_CSI2_RX_CONFIG);
+=09=09writel(0, base + IPU4P_CSI2_RX_ENABLE);
+
+=09=09ipu4p_isys_csi_irq_disable(isys, cfg->port);
+
+=09=09return 0;
+=09}
+
+=09if (cfg->nlanes !=3D 1 && cfg->nlanes !=3D 2 && cfg->nlanes !=3D 4)
+=09=09return -EINVAL;
+
+=09if (csi2->phy_mode !=3D PHY_MODE_DPHY)
+=09=09return -EOPNOTSUPP;
+
+=09if (!timing)
+=09=09return -EINVAL;
+
+=09writel(timing->ctermen, base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
+=09writel(timing->csettle, base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
+
+=09for (unsigned int lane =3D 0; lane < cfg->nlanes; lane++) {
+=09=09writel(timing->dtermen,
+=09=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
+=09=09writel(timing->dsettle,
+=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
+=09}
+
+=09value =3D readl(base + IPU4P_CSI2_RX_CONFIG);
+=09value |=3D IPU4P_CSI2_RX_CONFIG_DISABLE_BYTE_CLK_GATING |
+=09=09 IPU4P_CSI2_RX_CONFIG_RELEASE_LP11;
+=09writel(value, base + IPU4P_CSI2_RX_CONFIG);
+
+=09writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
+=09writel(0, base + IPU4P_CSI2_RX_ENABLE);
+
+=09ipu4p_isys_csi_irq_enable(isys, cfg->port);
+
+=09writel(IPU4P_CSI2_RX_ENABLE_ENABLE,
+=09       base + IPU4P_CSI2_RX_ENABLE);
+
+=09return 0;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h b/drivers/=
media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
index 4e2f31048ff..05f96b7e97b 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
@@ -47,6 +47,10 @@ static inline u32 ipu4p_isys_csi_irq_ctrl0_base(unsigned=
 int port)
 #define IPU4P_ISYS_CSI_ERROR_MASK=09=09=09GENMASK(15, 0)
 #define IPU4P_ISYS_CSI_ERROR_BITS=09=09=0916U
=20
+/* IPU4P ISYS GPREG windows */
+#define IPU4P_ISYS_GPOFFSET=09=09=09=090x66800
+#define IPU4P_ISYS_COMBO_GPOFFSET=09=09=090x6e800
+
 /* CSI receiver registers */
 #define IPU4P_CSI2_RX_ENABLE=09=09=09=090x00
 #define IPU4P_CSI2_RX_ENABLE_ENABLE=09=09=09BIT(0)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/=
pci/intel/ipu6/ipu6-isys-csi2.c
index b78e4b6af26..d9c3d3577dc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -392,6 +392,11 @@ static void ipu6_isys_csi2_stream_disable(struct ipu6_=
isys_csi2 *csi2)
 =09cfg.port =3D csi2->port;
 =09cfg.nlanes =3D csi2->nlanes;
=20
+=09if (IS_IPU4P(csi2->isys->adev->isp)) {
+=09=09isys->phy_set_power(isys, &cfg, NULL, false);
+=09=09return;
+=09}
+
 =09writel(0, csi2->base + CSI_REG_CSI_FE_ENABLE);
 =09writel(0, csi2->base + CSI_REG_PPI2CSI_ENABLE);
 =09writel(0, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
@@ -426,6 +431,9 @@ static int ipu6_isys_csi2_stream_enable(struct ipu6_isy=
s_csi2 *csi2)
 =09if (ret)
 =09=09return ret;
=20
+=09if (IS_IPU4P(isys->adev->isp))
+=09=09return isys->phy_set_power(isys, &cfg, &timing, true);
+
 =09mask =3D isys->pdata->ipdata->csi2.irq_mask;
 =09nports =3D isys->pdata->ipdata->csi2.nports;
=20
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.c
index 12320ea2f49..c00ae9eb6fc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -829,12 +829,14 @@ static int isys_runtime_pm_resume(struct device *dev)
 =09if (ret)
 =09=09goto err_mmu_hw_cleanup;
=20
-=09if (IS_IPU7(isp) || IS_IPU8(isp))
+=09if (IS_IPU7(isp) || IS_IPU8(isp)) {
 =09=09ipu7_isys_setup_hw(isys);
-=09else if (IS_IPU4P(isp))
+=09} else if (IS_IPU4P(isp)) {
 =09=09ipu4p_isys_irq_setup(isys);
-=09else
+=09=09ipu4p_isys_phy_setup(isys);
+=09} else {
 =09=09ipu6_isys_setup_hw(isys);
+=09}
=20
 =09if (!IS_IPU7(isp) && !IS_IPU8(isp))
 =09=09set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
@@ -1099,6 +1101,8 @@ static int isys_probe(struct auxiliary_device *auxdev=
,
 =09=09isys->phy_set_power =3D ipu6_isys_jsl_phy_set_power;
 =09else if (IS_IPU6EP_MTL(adev->isp))
 =09=09isys->phy_set_power =3D ipu6_isys_dwc_phy_set_power;
+=09else if (IS_IPU4P(adev->isp))
+=09=09isys->phy_set_power =3D ipu4p_isys_phy_set_power;
 =09else
 =09=09isys->phy_set_power =3D ipu6_isys_mcd_phy_set_power;
=20
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.h
index c15de43dccc..924ef8ce506 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -247,6 +247,11 @@ int ipu6_isys_jsl_phy_set_power(struct ipu6_isys *isys=
,
 =09=09=09=09struct ipu6_isys_csi2_config *cfg,
 =09=09=09=09const struct ipu6_isys_csi2_timing *timing,
 =09=09=09=09bool on);
+int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
+=09=09=09     struct ipu6_isys_csi2_config *cfg,
+=09=09=09     const struct ipu6_isys_csi2_timing *timing,
+=09=09=09     bool on);
+void ipu4p_isys_phy_setup(struct ipu6_isys *isys);
 void ipu4p_isys_irq_setup(struct ipu6_isys *isys);
 irqreturn_t ipu4p_isys_isr(struct ipu6_bus_device *adev);
=20
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/d=
rivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index 153bf93f93f..1cb54856189 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -24,6 +24,18 @@
 #define IPU4P_PS_FREQ_CTL_DEFAULT_RATIO=09=090x12
 #define IPU4P_BOOTLOADER_STATUS_OFFSET=09=09=090x8000
=20
+/* IPU4P CSI PHY building-block registers */
+#define IPU4P_BUTTRESS_REG_CSI_BSCAN_EXCLUDE=09=090x100d8
+#define IPU4P_BUTTRESS_REG_CPHY0_DLL_OVRD=09=090x10100
+#define IPU4P_BUTTRESS_REG_DPHY0_DLL_OVRD=09=090x1014c
+#define IPU4P_BUTTRESS_REG_BB0_AFE_CONFIG=09=090x10174
+#define IPU4P_BUTTRESS_REG_CPHYX_DLL_OVRD(bb)=09=09\
+=09(IPU4P_BUTTRESS_REG_CPHY0_DLL_OVRD + ((bb) >> 1) * 0x100)
+#define IPU4P_BUTTRESS_REG_DPHYX_DLL_OVRD(bb)=09=09\
+=09(IPU4P_BUTTRESS_REG_DPHY0_DLL_OVRD + ((bb) >> 1) * 0x100)
+#define IPU4P_BUTTRESS_REG_BBX_AFE_CONFIG(bb)=09=09\
+=09(IPU4P_BUTTRESS_REG_BB0_AFE_CONFIG + ((bb) >> 1) * 0x100)
+
 /* IS_WORKPOINT_REQ */
 #define IPU6_BUTTRESS_REG_IS_FREQ_CTL=09=090x34
 /* PS_WORKPOINT_REQ */
--=20
2.56.0


