Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449895;
	b=XzcLbailzO2L+nz8EzxuUVjYUyunWAw0AWb7jj3FD4NJt8thaip1NdMrVubHog2rLC+h
	 lHDSehn4kvU7P78nYO10ijgqpBKbTxvVfRESlTkLLGygUuuFfEUxI3woD4fj66R2Hp6ik
	 LHVlaChPKzFcPAivKQOwyjFxK4H0DXMEZR6CNxxr0pga6jaV0zeK1hlSLJK8UJjjbddEo
	 EcpcnukbplbeHyuGJhHdKq1bg3FECATvEeJJx8C34PNNvhCtY867XftHf4Vqhk9Ei9NId
	 +AKvi8rwZwGlNOUawypee1JVL+lkUg26Szz4ubBaqieddJCBXq4QlIWmiy7hZ1Wjr9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449895;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3EbV+pW+21RM9atjNvR8Df+NflIGHLYqMLecEZlZNJ4=;
	b=KmuQcwA28/H5/d0172WMF56cRcy+/cZecM2A9t53hzj4A1TWcfaoKC0QIdVGKe3pE4Ix
	 g6MyzL8QzSyoYyfzgleFNYnPMPT8f/SaThRs5wIYJ6lKVGj2uTKo/oILNnRJ6uThB1ghs
	 LBylvro/GFC3Jd/H/qRIQH7e+foxKhZJc2pyTcxD7cCw9pNrJ6Puxsz1k6Yc0o4XXSzb8
	 AzZuzYWY1oKc8SbHh3r7RISb2MAEajo8i+T8fw7uu0bK/7LpFKt1d6wjO2RGxyp9Gtr06
	 3xJHhFccgf263qauFRn3UekA3YlCVRZtWFal/ZLK1ahUlD6ebVzoZaJKgl0EAJPJjRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=o9AdQ3fq;
	arc=none smtp.remote-ip=109.224.244.31
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E8606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=o9AdQ3fq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793449892; x=1793709092;
	bh=3EbV+pW+21RM9atjNvR8Df+NflIGHLYqMLecEZlZNJ4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=o9AdQ3fqhZbyoV9k8r6NhOewiMND5bDs3/fNu8Edr2W9ulj4vrnC6j22RkLuwy4MJ
	 kBAp1HTyk8Nfu3ZMkWkaQfIpwCN2Dgh+CALcBhR3jgHMv8cc9pCTGvdNtwnAzV7wJf
	 NBOhF1vKuXJPbGouQQgOCY2zENVVUrsRxoRTRBUuEfaaDICvAAxtRDowBo3sbYtT6p
	 ZZPz30b62SwGUBtXQSYNRwlQvMh4+HlpEyA3iA07nFPyyBxiXnjv5gXSjUpJmtx5cE
	 d+1A8kqFNAY+MiwQqWlG4TKPHiycFic2KswMybnEq5gHb+iBa9L1kTfQiMfaaoGzhb
	 b3cx+ZADBDQLg==
Date: Sat, 31 Oct 2026 12:31:28 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 03/12] media: ipu6: Add IPU4P buttress support
Message-ID: <dxiseBxpo43MCJmKSifa4B3wCb7LUo8rIpVr0mGqSQ3iY_uJubyeh5YTLLMkcwddOe1imYnPpQdC5Cjy-_8zCU1_rbfqaQF2hnx4YkX2Mzw=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: f59962b1e95d4c4d40ee4f80e6ef57a957ded6b4
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

IPU4P uses different power-state fields and frequency-control layouts
from IPU6, and has a different bootloader status register.

Add IPU4P-specific power management and firmware authentication
handling.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 59 ++++++++++++++++---
 .../intel/ipu6/ipu6-platform-buttress-regs.h  | 18 ++++++
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  6 ++
 drivers/media/pci/intel/ipu6/ipu6.c           | 40 +++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  2 +
 include/media/ipu6-pci-table.h                |  1 +
 6 files changed, 119 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/p=
ci/intel/ipu6/ipu6-buttress.c
index f1d236054cf..b1d2f762d29 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -450,6 +450,44 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *=
isp_ptr)
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
+=09=09val =3D BUTTRESS_FREQ_CTL_START;
+=09=09if (ctrl->subsys_id =3D=3D IPU_ISYS) {
+=09=09=09val |=3D FIELD_PREP(IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_MASK,
+=09=09=09=09=09  ctrl->ratio);
+=09=09=09val |=3D FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK,
+=09=09=09=09=09  ctrl->qos_floor);
+=09=09} else {
+=09=09=09val |=3D FIELD_PREP(IPU4P_BUTTRESS_PS_FREQ_CTL_RATIO_MASK,
+=09=09=09=09=09  ctrl->ratio);
+=09=09=09val |=3D IPU4P_BUTTRESS_PS_FREQ_CTL_OVRD;
+=09=09}
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
 static int ipu7_isys_d2d_power(struct ipu6_device *isp, bool on)
 {
 =09u32 target =3D on ? IPU7_BUTTRESS_D2D_PWR_ACK : 0U;
@@ -632,7 +670,9 @@ int ipu6_buttress_power(struct device *dev,
=20
 =09mutex_lock(&isp->buttress.power_mutex);
=20
-=09if (IS_IPU7(isp) || IS_IPU8(isp))
+=09if (IS_IPU4P(isp))
+=09=09ret =3D __ipu4p_power(dev, ctrl, on);
+=09else if (IS_IPU7(isp) || IS_IPU8(isp))
 =09=09ret =3D on ? __ipu7_power_on(dev, ctrl) :
 =09=09=09   __ipu7_power_off(dev, ctrl);
 =09else
@@ -774,6 +814,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 {
 =09struct ipu6_buttress *b =3D &isp->buttress;
 =09struct ipu6_psys_pdata *psys_pdata;
+=09void __iomem *base;
 =09u32 data, mask, done, fail;
 =09int ret;
=20
@@ -842,9 +883,12 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp=
)
 =09=09goto out_unlock;
 =09}
=20
-=09void __iomem *base =3D (IS_IPU7(isp) || IS_IPU8(isp)) ?
-=09=09=09     isp->base + IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7 :
-=09=09=09     psys_pdata->base + BOOTLOADER_STATUS_OFFSET;
+=09if (IS_IPU4P(isp))
+=09=09base =3D psys_pdata->base + IPU4P_BOOTLOADER_STATUS_OFFSET;
+=09else if (IS_IPU7(isp) || IS_IPU8(isp))
+=09=09base =3D isp->base + IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7;
+=09else
+=09=09base =3D psys_pdata->base + BOOTLOADER_STATUS_OFFSET;
=20
 =09ret =3D readl_poll_timeout(base, data, data =3D=3D BOOTLOADER_MAGIC_KEY=
, 500,
 =09=09=09=09 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
@@ -1154,9 +1198,10 @@ int ipu6_buttress_init(struct ipu6_device *isp)
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
index 4c4ca95c7d5..153bf93f93f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -6,6 +6,24 @@
=20
 #include <linux/bits.h>
=20
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
+#define IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_MASK=09=09GENMASK(7, 1)
+#define IPU4P_BUTTRESS_PS_FREQ_CTL_RATIO_MASK=09=09GENMASK(15, 8)
+#define IPU4P_BUTTRESS_PS_FREQ_CTL_OVRD=09=09BIT(7)
+
+#define IPU4P_IS_FREQ_CTL_DIVISOR=09=09=094
+#define IPU4P_PS_FREQ_CTL_DEFAULT_RATIO=09=090x12
+#define IPU4P_BOOTLOADER_STATUS_OFFSET=09=09=090x8000
+
 /* IS_WORKPOINT_REQ */
 #define IPU6_BUTTRESS_REG_IS_FREQ_CTL=09=090x34
 /* PS_WORKPOINT_REQ */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h b/drivers/me=
dia/pci/intel/ipu6/ipu6-platform-regs.h
index 01a7abddd6d..8006af84201 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
@@ -14,12 +14,14 @@
  */
 #define IPU6_UNIFIED_OFFSET=09=09=090
=20
+#define IPU4P_ISYS_OFFSET=09=09=090x00100000
 #define IPU4P_ISYS_IOMMU0_OFFSET=09=090x000e0000
 #define IPU4P_ISYS_IOMMU1_OFFSET=09=090x000e0100
 #define IPU6_ISYS_IOMMU0_OFFSET=09=090x2e0000
 #define IPU6_ISYS_IOMMU1_OFFSET=09=090x2e0500
 #define IPU6_ISYS_IOMMUI_OFFSET=09=090x2e0a00
=20
+#define IPU4P_PSYS_OFFSET=09=09=090x00400000
 #define IPU4P_PSYS_IOMMU0_OFFSET=09=090x000b0000
 #define IPU4P_PSYS_IOMMU1_OFFSET=09=090x000b0100
 #define IPU4P_PSYS_IOMMU1R_OFFSET=09=090x000b0600
@@ -37,12 +39,16 @@
=20
 #define IPU6_MMU_INFO_OFFSET=09=090x8
=20
+#define IPU4P_ISYS_SPC_OFFSET=09=09=090x00000000
 #define IPU6_ISYS_SPC_OFFSET=09=090x210000
=20
+#define IPU4P_PSYS_SPC_OFFSET=09=09=090x00000000
 #define IPU6SE_PSYS_SPC_OFFSET=09=090x110000
 #define IPU6_PSYS_SPC_OFFSET=09=090x118000
=20
+#define IPU4P_ISYS_DMEM_OFFSET=09=09=090x00008000
 #define IPU6_ISYS_DMEM_OFFSET=09=090x200000
+#define IPU4P_PSYS_DMEM_OFFSET=09=09=090x00008000
 #define IPU6_PSYS_DMEM_OFFSET=09=090x100000
=20
 #define IPU6_REG_ISYS_UNISPART_IRQ_EDGE=09=09=090x27c000
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/=
ipu6/ipu6.c
index cdf812c0296..1432c2a1f6f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -96,6 +96,28 @@ static struct ipu6_psys_internal_pdata psys_ipdata =3D {
 =09},
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
 static const struct ipu6_buttress_ctrl ipu6_isys_buttress_ctrl =3D {
 =09.subsys_id =3D IPU_ISYS,
 =09.ratio =3D IPU6_IS_FREQ_CTL_DEFAULT_RATIO,
@@ -347,6 +369,15 @@ static void ipu6_internal_pdata_init(struct ipu6_devic=
e *isp)
 =09psys_ipdata.hw_variant.spc_offset =3D IPU6_PSYS_SPC_OFFSET;
 =09isys_ipdata.csi2.fw_access_port_ofs =3D CSI_REG_HUB_FW_ACCESS_PORT_OFS;
=20
+=09if (IS_IPU4P(isp)) {
+=09=09isys_ipdata.hw_variant.offset =3D IPU4P_ISYS_OFFSET;
+=09=09isys_ipdata.hw_variant.spc_offset =3D IPU4P_ISYS_SPC_OFFSET;
+=09=09isys_ipdata.hw_variant.dmem_offset =3D IPU4P_ISYS_DMEM_OFFSET;
+=09=09psys_ipdata.hw_variant.offset =3D IPU4P_PSYS_OFFSET;
+=09=09psys_ipdata.hw_variant.spc_offset =3D IPU4P_PSYS_SPC_OFFSET;
+=09=09psys_ipdata.hw_variant.dmem_offset =3D IPU4P_PSYS_DMEM_OFFSET;
+=09}
+
 =09if (IS_IPU6EP(isp)) {
 =09=09isys_ipdata.ltr =3D IPU6EP_LTR_VALUE;
 =09=09isys_ipdata.memopen_threshold =3D IPU6EP_MIN_MEMOPEN_TH;
@@ -660,6 +691,15 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
 =09psys_ctrl =3D &ipu6_psys_buttress_ctrl;
=20
 =09switch (id->device) {
+=09case PCI_DEVICE_ID_INTEL_IPU4P:
+=09=09isp->hw_ver =3D IPU_VERSION_4P;
+=09=09isp->model_name =3D IPU4P_MEDIA_DEV_MODEL_NAME;
+=09=09isp->cpd_fw_name =3D IPU4P_FIRMWARE_NAME;
+=09=09isp->cpd_metadata_cmpnt_size =3D
+=09=09=09sizeof(struct ipu6se_cpd_metadata_cmpnt);
+=09=09isys_ctrl =3D &ipu4p_isys_buttress_ctrl;
+=09=09psys_ctrl =3D &ipu4p_psys_buttress_ctrl;
+=09=09break;
 =09case PCI_DEVICE_ID_INTEL_IPU6:
 =09=09isp->hw_ver =3D IPU_VERSION_6;
 =09=09isp->cpd_fw_name =3D IPU6_FIRMWARE_NAME;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/=
ipu6/ipu6.h
index c70ae6bb1d9..ccf001c2db9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -15,11 +15,13 @@ struct pci_dev;
 struct ipu6_bus_device;
=20
 #define IPU6_NAME=09=09=09"intel-ipu6"
+#define IPU4P_MEDIA_DEV_MODEL_NAME=09"ipu4p"
 #define IPU6_MEDIA_DEV_MODEL_NAME=09"ipu6"
 #define IPU7_MEDIA_DEV_MODEL_NAME=09"ipu7"
 #define IPU7P5_MEDIA_DEV_MODEL_NAME=09"ipu7.5"
 #define IPU8_MEDIA_DEV_MODEL_NAME=09"ipu8"
=20
+#define IPU4P_FIRMWARE_NAME=09=09"intel/ipu/ipu4p_fw.bin"
 #define IPU6SE_FIRMWARE_NAME=09=09"intel/ipu/ipu6se_fw.bin"
 #define IPU6EP_FIRMWARE_NAME=09=09"intel/ipu/ipu6ep_fw.bin"
 #define IPU6_FIRMWARE_NAME=09=09"intel/ipu/ipu6_fw.bin"
diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.=
h
index 4c7e724ea15..e04ff2a8b2a 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -8,6 +8,7 @@
=20
 #include <linux/pci.h>
=20
+#define PCI_DEVICE_ID_INTEL_IPU4P=09=090x8a19
 #define PCI_DEVICE_ID_INTEL_IPU6=09=090x9a19
 #define PCI_DEVICE_ID_INTEL_IPU6SE=09=090x4e19
 #define PCI_DEVICE_ID_INTEL_IPU6EP_ADLP=09=090x465d
--=20
2.56.0


