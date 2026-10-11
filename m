Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AED3C0607
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729272; cv=none; b=c4/sM0d32osNjXUshou4m9BrNF+BF/H71dxzm/oKhadoCi7mJaOwZPcLb+Qh10gQeLO2V7RCfulgQx5sNLTB5V4qbCvqRCWSNXzcdzerf03HVFlZGpQa+LUSDCxvcFa5DrBAdyo0Hogae+g9iM+83Xy8KXO0+Vq/Ahw8EN/koJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729272; c=relaxed/simple;
	bh=UidLp2CaSrPI7cobqRN6xhCwD03fLvfgR5d5X7Kd+xs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ksq+8cQKLb6Zbd3KzOTW7EuA/XTgLOwtekG/czDdI1YlN7ImEfaWy5gWEq1Jv3p/gOUw/tmFZQpZuQmQhl4SaSoDbs8HNM231vgaAP7XQMaf/9P5Js9F3UufTdgxBxUlbt3Dxjr6exJE1QuYa9Ji3TVGNFBlsT8+austK9ocgaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=pgbERvqH; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="pgbERvqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791729261; x=1791988461;
	bh=nIjNNMTdUx2XpqFyX2wBwv0sP8S1Y4XVKv+rD03A3cs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pgbERvqHWVdZsXGSFVvMyXqXacetwvf9YAb2yvV3C5RHFlOmfGmd3MbY3imt0Uwzt
	 6bD+0k9YxIlmc7BukmpZDrZRaLxb3j03lW84SWIPyGV0ZlkMGGUrqjDyZnOTgIV6N+
	 8pPwPTrRiFSN+VTlh9B3IStnBU5xnJ4U39VXi3EmnJNQKAzf69GiKAuabicedvRdFt
	 xjqn9L+vIaQlcr/Fe89iwTnv4qikoaxEdMHcm4fQahJjoU7T0djwLStErwklAv3XMa
	 RHRdPq/DDzPz7lmPhO0c7vW9mkupXhc652d83bTbJpTQ94OKE5pTCuYxNKLpfW8FQh
	 sPg84cTDmKUfA==
Date: Sun, 11 Oct 2026 14:34:16 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 03/12] media: ipu6: Add IPU4P buttress support
Message-ID: <-QUv20vwP_Fvyx8GMeVsgtsHb5NwrrqqQdutzA6KHdba6DCLA3iNDRYsFUVx-_Ja9j0ak-LPvEIkN63hKhkdr2WvlTYBP5jh38cAyc6tuFU=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 07e67fce8478fe627ffbd61ab6f1efd12f365ab4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

IPU4P uses different power FSM controls and frequency divisor
placement from IPU6, and has a different bootloader status register.

Add IPU4P-specific power management and firmware authentication handling
to the IPU6 buttress driver.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 48 +++++++++++++++++--
 .../intel/ipu6/ipu6-platform-buttress-regs.h  | 20 ++++++++
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  6 +++
 drivers/media/pci/intel/ipu6/ipu6.c           | 40 ++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  1 +
 include/media/ipu6-pci-table.h                |  1 +
 6 files changed, 113 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/p=
ci/intel/ipu6/ipu6-buttress.c
index 105de1744dff..ae63a9238771 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -601,6 +601,43 @@ static int __ipu6_power(struct device *dev,
 =09return ret;
 }
=20
+static int __ipu4p_power(struct device *dev,
+=09=09=09 const struct ipu6_buttress_ctrl *ctrl, bool on)
+{
+=09struct ipu6_device *isp =3D to_ipu6_bus_device(dev)->isp;
+=09u32 pwr_sts, val;
+=09int ret;
+
+=09if (!on) {
+=09=09val =3D 0;
+=09=09pwr_sts =3D ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
+=09} else {
+=09=09u32 shift =3D (ctrl->subsys_id =3D=3D IPU_ISYS) ?
+=09=09=09    IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_SHIFT :
+=09=09=09    IPU4P_BUTTRESS_PS_FREQ_CTL_RATIO_SHIFT;
+
+=09=09val =3D BUTTRESS_FREQ_CTL_START |
+=09=09      (ctrl->ratio << shift) |
+=09=09      FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK, ctrl->qos_floor);
+
+=09=09if (ctrl->subsys_id =3D=3D IPU_PSYS)
+=09=09=09val |=3D BIT(IPU4P_BUTTRESS_PS_FREQ_CTL_OVRD_SHIFT);
+
+=09=09pwr_sts =3D ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
+=09}
+
+=09writel(val, isp->base + ctrl->freq_ctl);
+
+=09ret =3D readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
+=09=09=09=09 val, (val & ctrl->pwr_sts_mask) =3D=3D pwr_sts,
+=09=09=09=09 100, BUTTRESS_POWER_TIMEOUT_US);
+=09if (ret)
+=09=09dev_err(&isp->pdev->dev,
+=09=09=09"Change power status timeout with 0x%x\n", val);
+
+=09return ret;
+}
+
 int ipu6_buttress_power(struct device *dev,
 =09=09=09const struct ipu6_buttress_ctrl *ctrl, bool on)
 {
@@ -615,6 +652,8 @@ int ipu6_buttress_power(struct device *dev,
 =09if (IS_IPU7(isp))
 =09=09ret =3D on ? __ipu7_power_on(dev, ctrl) :
 =09=09=09   __ipu7_power_off(dev, ctrl);
+=09else if (IS_IPU4P(isp))
+=09=09ret =3D __ipu4p_power(dev, ctrl, on);
 =09else
 =09=09ret =3D __ipu6_power(dev, ctrl, on);
=20
@@ -824,6 +863,8 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
=20
 =09void __iomem *base =3D IS_IPU7(isp) ?
 =09=09=09     isp->base + IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7 :
+=09=09=09     IS_IPU4P(isp) ?
+=09=09=09     psys_pdata->base + IPU4P_BOOTLOADER_STATUS_OFFSET :
 =09=09=09     psys_pdata->base + BOOTLOADER_STATUS_OFFSET;
=20
 =09ret =3D readl_poll_timeout(base, data, data =3D=3D BOOTLOADER_MAGIC_KEY=
, 500,
@@ -1089,9 +1130,10 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 =09=09ipu7_buttress_setup(isp);
 =09=09b->ref_clk =3D 384;
 =09} else {
-=09=09dev_dbg(&isp->pdev->dev, "IPU6 touch 0x%x mask 0x%x\n",
-=09=09=09readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
-=09=09=09readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
+=09=09if (!IS_IPU4P(isp))
+=09=09=09dev_dbg(&isp->pdev->dev, "IPU6 touch 0x%x mask 0x%x\n",
+=09=09=09=09readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
+=09=09=09=09readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
=20
 =09=09writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
 =09=09writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/d=
rivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index 57e661cc2177..6679a7d35e89 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -330,4 +330,24 @@ enum {
 /* IPU7.5 */
 #define IPU7_BUTTRESS_SEL_PB_TIMESTAMP=09=09BIT(9)
=20
+/* IPU4P */
+#define IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_SHIFT=0920
+#define IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_MASK=09GENMASK(24, 20)
+#define IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_IDLE=090x0
+#define IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_IS_RDY=090xc
+
+#define IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_SHIFT=0925
+#define IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_MASK=09GENMASK(29, 25)
+#define IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_IDLE=090x0
+#define IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_PS_PWR_UP=090x10
+
+#define IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_SHIFT=09=091
+#define IPU4P_BUTTRESS_PS_FREQ_CTL_OVRD_SHIFT=09=097
+#define IPU4P_BUTTRESS_PS_FREQ_CTL_RATIO_SHIFT=09=098
+
+#define IPU4P_IS_FREQ_CTL_DIVISOR=09=09=094
+#define IPU4P_PS_FREQ_CTL_DEFAULT_RATIO=09=09=090x12
+
+#define IPU4P_BOOTLOADER_STATUS_OFFSET=09=09=090x8000
+
 #endif /* IPU6_PLATFORM_BUTTRESS_REGS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h b/drivers/me=
dia/pci/intel/ipu6/ipu6-platform-regs.h
index f08e7e8fd87d..526b02309277 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
@@ -16,10 +16,16 @@
=20
 #define IPU4P_ISYS_IOMMU0_OFFSET=09=090x000e0000
 #define IPU4P_ISYS_IOMMU1_OFFSET=09=090x000e0100
+#define IPU4P_ISYS_OFFSET=09=09=090x00100000
+#define IPU4P_ISYS_SPC_OFFSET=09=09=090x00000000
+#define IPU4P_ISYS_DMEM_OFFSET=09=09=090x00008000
=20
 #define IPU4P_PSYS_IOMMU0_OFFSET=09=090x000b0000
 #define IPU4P_PSYS_IOMMU1_OFFSET=09=090x000b0100
 #define IPU4P_PSYS_IOMMU1R_OFFSET=09=090x000b0600
+#define IPU4P_PSYS_OFFSET=09=09=090x00400000
+#define IPU4P_PSYS_SPC_OFFSET=09=09=090x00000000
+#define IPU4P_PSYS_DMEM_OFFSET=09=09=090x00008000
=20
 #define IPU4P_MMU_L1_STREAM_ID_REG_OFFSET=090x0c
 #define IPU4P_MMU_L2_STREAM_ID_REG_OFFSET=090x4c
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/=
ipu6/ipu6.c
index 43d951735f72..789477e3829b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -140,6 +140,28 @@ static const struct ipu6_buttress_ctrl ipu7_psys_buttr=
ess_ctrl =3D {
 =09.pwr_sts_off =3D IPU6_BUTTRESS_PWR_STATE_DN_DONE,
 };
=20
+static const struct ipu6_buttress_ctrl ipu4p_isys_buttress_ctrl =3D {
+=09.subsys_id =3D IPU_ISYS,
+=09.ratio =3D IPU4P_IS_FREQ_CTL_DIVISOR,
+=09.qos_floor =3D 0,
+=09.freq_ctl =3D BUTTRESS_REG_IS_FREQ_CTL,
+=09.pwr_sts_shift =3D IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_SHIFT,
+=09.pwr_sts_mask =3D IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_MASK,
+=09.pwr_sts_on =3D IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_IS_RDY,
+=09.pwr_sts_off =3D IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_IDLE,
+};
+
+static const struct ipu6_buttress_ctrl ipu4p_psys_buttress_ctrl =3D {
+=09.subsys_id =3D IPU_PSYS,
+=09.ratio =3D IPU4P_PS_FREQ_CTL_DEFAULT_RATIO,
+=09.qos_floor =3D 0,
+=09.freq_ctl =3D BUTTRESS_REG_PS_FREQ_CTL,
+=09.pwr_sts_shift =3D IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_SHIFT,
+=09.pwr_sts_mask =3D IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_MASK,
+=09.pwr_sts_on =3D IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_PS_PWR_UP,
+=09.pwr_sts_off =3D IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_IDLE,
+};
+
 static const struct ipu6_buttress_registers ipu6_buttress_regs =3D {
 =09/* Registers */
 =09.irq_status=09=3D BUTTRESS_REG_ISR_STATUS,
@@ -375,6 +397,15 @@ static void ipu6_internal_pdata_init(struct ipu6_devic=
e *isp)
 =09=09isys_ipdata.csi2.gpreg =3D IPU7_IS_IO_CSI2_GPREGS_BASE;
 =09=09isys_ipdata.csi2.nports =3D 4;
 =09}
+
+=09if (IS_IPU4P(isp)) {
+=09=09isys_ipdata.hw_variant.offset =3D IPU4P_ISYS_OFFSET;
+=09=09isys_ipdata.hw_variant.spc_offset =3D IPU4P_ISYS_SPC_OFFSET;
+=09=09isys_ipdata.hw_variant.dmem_offset =3D IPU4P_ISYS_DMEM_OFFSET;
+=09=09psys_ipdata.hw_variant.offset =3D IPU4P_PSYS_OFFSET;
+=09=09psys_ipdata.hw_variant.spc_offset =3D IPU4P_PSYS_SPC_OFFSET;
+=09=09psys_ipdata.hw_variant.dmem_offset =3D IPU4P_PSYS_DMEM_OFFSET;
+=09}
 }
=20
 static struct ipu6_bus_device *
@@ -631,6 +662,15 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
 =09psys_ctrl =3D &ipu6_psys_buttress_ctrl;
=20
 =09switch (id->device) {
+=09case PCI_DEVICE_ID_INTEL_IPU4P:
+=09=09isp->hw_ver =3D IPU_VERSION_4P;
+=09=09isp->cpd_fw_name =3D IPU4P_FIRMWARE_NAME;
+=09=09isp->cpd_metadata_cmpnt_size =3D
+=09=09=09sizeof(struct ipu6se_cpd_metadata_cmpnt);
+=09=09isp->buttress.regs =3D &ipu6_buttress_regs;
+=09=09isys_ctrl =3D &ipu4p_isys_buttress_ctrl;
+=09=09psys_ctrl =3D &ipu4p_psys_buttress_ctrl;
+=09=09break;
 =09case PCI_DEVICE_ID_INTEL_IPU6:
 =09=09isp->hw_ver =3D IPU_VERSION_6;
 =09=09isp->cpd_fw_name =3D IPU6_FIRMWARE_NAME;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/=
ipu6/ipu6.h
index 2afbd70cae74..84a50fba1466 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -26,6 +26,7 @@ struct ipu6_bus_device;
 #define IPU6EPADLN_FIRMWARE_NAME=09"intel/ipu/ipu6epadln_fw.bin"
 #define IPU7_FIRMWARE_NAME=09=09"intel/ipu/ipu7_fw.bin"
 #define IPU7P5_FIRMWARE_NAME=09=09"intel/ipu/ipu7ptl_fw.bin"
+#define IPU4P_FIRMWARE_NAME=09=09"intel/ipu/ipu4p_fw.bin"
=20
 #define IPU_VERSION_6=09=09BIT(0) /* TGL */
 #define IPU_VERSION_6SE=09=09BIT(1) /* JSL */
diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.=
h
index cacb8a3170d0..7369d46621af 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -16,6 +16,7 @@
 #define PCI_DEVICE_ID_INTEL_IPU6EP_MTL=09=090x7d19
 #define PCI_DEVICE_ID_INTEL_IPU7=09=090x645d
 #define PCI_DEVICE_ID_INTEL_IPU7P5=09=090xb05d
+#define PCI_DEVICE_ID_INTEL_IPU4P=09=090x8a19
=20
 static const struct pci_device_id ipu6_pci_tbl[] =3D {
 =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
--=20
2.55.0


