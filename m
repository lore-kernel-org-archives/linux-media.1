Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3713823392B
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729756; cv=none; b=RsXOB586qPThR3XdN1ETLWFAYfSZqHpdo8gEEm13GkNMMI39tjhzLPE2JvYIwKOvtdLA3Vtn1Y8kHcq3tqPEK/WdD9I/6x2hg6EIqfRz2Kc0t7SsBfdgzPBAJl+uiIhUhNgkj0uDHhwm1NauQY0XGrnDvzM0wGyWiZkGLMpvjIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729756; c=relaxed/simple;
	bh=OkOwIGEDuL4nX+OJREUb29rMP0+wfJdTKQzNubJSndY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=epL7/xzQ1rkwU+VO+RgFe1rIMi2+/HonO6SXve1mJZ8ftb3jjXi7zd4PerGE6ASyTKZUWfDK/BBMP9jJ7rWfKM6C+1OwcdBwrM/3msMuLezQIKLnXtkGP1+LLi0EeMHXW1ZLRAIQzblv0sFOBztwqV2BtqOeHc2WrdgDk4RXmE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=cuXvavIS; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="cuXvavIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791729750; x=1791988950;
	bh=pmV262LUGBihTBO+qzZ00UV+YuOiL4hFHJrhuIWcUxM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cuXvavISqWmWW3wvJXnb+Iogsi10h24aP3S30Nrgi9750zwxI407pi8e9Ji1yTIVG
	 66F4fAWqeQTQSQa6FR+Zg/lETti8tIk3tGAp41TDuMDQgsCJRi34Z/DUI7veM+qK8a
	 iE7z8H8Z+2XMKayoLBFl4bIQHetzyejEtkBEA4/cSy/0zvzAMeddnlXgJv/LdxOTr+
	 2OkL/1aP9jATKC6iRdelnL1A4Mjp+KFDKOb5SPo2PHsRpZAsjn4w6Ilp/S3WPU1e4B
	 qvdFWw1T0wgIQhWHqbWvjSMzshac4HqjUOubq9lxQuOfjeYcvQAER1eazlvpjT7BG9
	 myP3ypFIzHKHg==
Date: Sun, 11 Oct 2026 14:42:26 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 10/12] media: ipu6: Add IPU4P CSI PHY driver
Message-ID: <mCpc6C8bcDL02wCBRv96D0AqrxxKY2rRD2t2FzuH_I22RCO1HSNlNdhupxxCvAMOciPxALyypzlkKTuwcAwoueE6la5U-RP1P2Xgsd89NJI=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: f9af6e8218d8ffa4392fd9b0c6c119e3a7a77f41
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add IPU4P CSI PHY setup, power management, and interrupt handling.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/Makefile         |   1 +
 .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 173 ++++++++++++++++++
 .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     |   4 +
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   8 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |   3 +
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   6 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  12 ++
 7 files changed, 207 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/inte=
l/ipu6/Makefile
index 54b543ec5f52..43bc57ff1ab9 100644
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
index 000000000000..ec0a36069b01
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/io.h>
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
+=09/* BB10 is part of the verified IPU4P PHY baseline. */
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
+=09u32 offset =3D IPU4P_ISYS_CSI_IRQ_CTRL_BASE(port);
+=09u32 offset0 =3D IPU4P_ISYS_CSI_IRQ_CTRL0_BASE(port);
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
+=09u32 offset =3D IPU4P_ISYS_CSI_IRQ_CTRL_BASE(port);
+=09u32 offset0 =3D IPU4P_ISYS_CSI_IRQ_CTRL0_BASE(port);
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
+/* IPU4P PHY building blocks remain configured until the ISYS power cycle.=
 */
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
index 1e1423869e21..8f2c760ab7ba 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
@@ -42,6 +42,10 @@
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
index ea3817ef8ac8..1d4762758761 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -313,6 +313,11 @@ static void ipu6_isys_csi2_stream_disable(struct ipu6_=
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
@@ -347,6 +352,9 @@ static int ipu6_isys_csi2_stream_enable(struct ipu6_isy=
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
index 6d10a427b4b6..12498748c8b6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -902,6 +902,7 @@ static int isys_runtime_pm_resume(struct device *dev)
 =09=09ipu7_isys_setup_hw(isys);
 =09} else if (IS_IPU4P(isp)) {
 =09=09ipu4p_isys_irq_setup(isys);
+=09=09ipu4p_isys_phy_setup(isys);
 =09} else {
 =09=09ipu6_isys_setup_hw(isys);
 =09=09set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
@@ -1136,6 +1137,8 @@ static int isys_probe(struct auxiliary_device *auxdev=
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
index 775b85396e6f..52d114caac93 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -259,4 +259,10 @@ int ipu6_isys_jsl_phy_set_power(struct ipu6_isys *isys=
,
 =09=09=09=09struct ipu6_isys_csi2_config *cfg,
 =09=09=09=09const struct ipu6_isys_csi2_timing *timing,
 =09=09=09=09bool on);
+
+int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
+=09=09=09     struct ipu6_isys_csi2_config *cfg,
+=09=09=09     const struct ipu6_isys_csi2_timing *timing,
+=09=09=09     bool on);
+void ipu4p_isys_phy_setup(struct ipu6_isys *isys);
 #endif /* IPU6_ISYS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/d=
rivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index 6679a7d35e89..1830b127783b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -6,6 +6,18 @@
=20
 #include <linux/bits.h>
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
2.55.0


