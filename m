Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450322;
	b=VaWYtmsHujiE2h52GCXJj3f7D81a51xT2hhmUEQkNLd1rdCv1K70oofnRGF9gDzHRAR1
	 kAAJhivxEc3a4vSYgKbWhudOHSC7sM90Dx59q+hD/iplQGlcnFD1S9fj5+9v4OzXM1swb
	 6FESVW5ThcVThfYyrHJZHJ4u+It7oyQwDWiM6Wprf31AbkcZUMla3NtfGcyu4DoCTY125
	 dSA9xOhet6SnMkZN+zmw8rv296NmB0EPQ/3WwJeO+BGU8hvnOplZfuidl5L0FEPwKf6zE
	 /ofoYbxwW+zSBLwlAkvNjmfRyB/UcTKGXh+yx39ENNZqKHRLG+a3PttwebFBKL2SZQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450322;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4TVv54ULIVMtIXhEvOJQuOrHPfdAo/oQPE8aLgDWvDA=;
	b=FwqPOO8o99KpfXB4f2CQaktf/wpdRmH1TXJWkBCr0fuf8vbjiTLDVl0WGSNZKkm0rlll
	 HKRRirEMZa8Qj/7r/ZWTTA1IECpQGxVL414KqG8Sx2IzlfY7xpEVJ6rFF7L22ayFL+VsZ
	 ItnlQXB8bT9g+hyu9vua/tv7Nm1KTvoSUhdInBmOGWA3jBlPuM1MxgkQtsC7icqOmXDds
	 ZlNuLvI7eeK7O9VkX1k/4GCGuGTtl7AiDVGQ2vUhjbmVg/56PX0aR6OsqxfYLI8eTs0BS
	 vm+g6zz/UB4dIIRWKTNwJRk0Yl/0WCkEqGO6e7vAJnJp2AA1ynm1x7svsrCvVXb2Jrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=QNJdDEqT;
	arc=none smtp.remote-ip=109.224.244.31
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCE606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFCE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=QNJdDEqT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793450318; x=1793709518;
	bh=4TVv54ULIVMtIXhEvOJQuOrHPfdAo/oQPE8aLgDWvDA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QNJdDEqTdTmlesV5GkicuoeSb+qfN3jF0FavaTjb4Nn6ZbQq39W5plf7wAm4Vnf7B
	 /ijBnN8NzDz0kzeSBwzNYOVASVsekmwdbAO7cYWG0PowLrQofbYnUlAgl7T8qmnFBF
	 rmTZC7KVTYxEnxYaRhjVQe/LtQq7i6bpHGx//72ybvf7mcxkwgBlpsok6Elok93sPA
	 9xX40iCKI6Y1UWXPbHIJakLCuCbp35FJCZszZ4mbsoMbAssxMj/zJH382CCF4P9yz7
	 KrOQZgq4jb7Sz/Oc2Zs9Y4+fsCLrDE7ysMddJCezLR0wZv5+YfxWfk6FAtEEnvbfN9
	 4EMnznGGzWILA==
Date: Sat, 31 Oct 2026 12:38:34 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 11/12] media: ipu6: Fix Surface Pro 7 CSI-2 capture timing
Message-ID: <ElC-F7kGAuGuGMVkVhXXoaOAwPg9xWLwWxnihXLHEfX1R_urhMZo3nI7oN2CzRMAeZOGpussj-09mGxFf_7md1p-WPNW_H5WlmSIffLkZpU=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 8075b93cf4410d5623f0dc82d5ccf5cb1d87d325
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

The calculated D-PHY timing causes capture errors on the Surface
Pro 7 front camera.

A shifted data-lane timing was observed on a Windows system and
reverse-engineered from its camera driver. Apply the resulting
1269-tick value to both lanes on IPU4P CSI-2 port 2.

Keep the existing timing path for other configurations.

Tested on Microsoft Surface Pro 7 with the OV5693 front camera.

The Co-developed-by tags will be updated with the contributors' actual
names and email addresses in the final patchset.

Co-developed-by: supermepsipax <supermepsipax@github>
Co-developed-by: thisiscamk <thisiscamk@github>
Co-developed-by: ConsultingFuture4200 <ConsultingFuture4200@github>
Co-developed-by: georgemihaila <georgemihaila@github>

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 66 ++++++++++++++++---
 .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     |  3 +
 2 files changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c b/drivers/me=
dia/pci/intel/ipu6/ipu4p-isys-csi-phy.c
index 6177be4fa01..43cd11cac03 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
@@ -5,6 +5,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/dev_printk.h>
+#include <linux/dmi.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/types.h>
@@ -25,6 +26,36 @@ struct ipu4p_phy_bb_config {
 #define IPU4P_CSI2_GPREG_CR_PORT_CONFIG_DEFAULT=090x3895
 #define IPU4P_CSI_BSCAN_EXCLUDE=09=09=09(BIT(9) | BIT(18) | BIT(27))
=20
+struct ipu4p_csi2_timing_quirk {
+=09unsigned int port;
+=09unsigned int nlanes;
+=09u32 data_ticks;
+};
+
+/* The Surface Pro 7 front camera needs shifted CSI-2 data timing on IPU4P=
. */
+static const struct ipu4p_csi2_timing_quirk ipu4p_surface_pro7_timing =3D =
{
+=09.port =3D 2,
+=09.nlanes =3D 2,
+=09/*
+=09 * Reverse-engineered from a Windows camera driver:
+=09 *     data_ticks =3D 1360 - 32000 / F_MHz
+=09 * At 350 MHz, integer division gives 1269.
+=09 */
+=09.data_ticks =3D 1269,
+};
+
+static const struct dmi_system_id ipu4p_csi2_timing_quirks[] =3D {
+=09{
+=09=09.ident =3D "Microsoft Surface Pro 7",
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 7"),
+=09=09},
+=09=09.driver_data =3D (void *)&ipu4p_surface_pro7_timing,
+=09},
+=09{}
+};
+
 static const struct ipu4p_phy_bb_config ipu4p_phy_bb_configs[] =3D {
 =09{ 4, 13, 32, 0x0f },
 =09{ 6, 13, 32, 0x15 },
@@ -118,6 +149,8 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
 =09=09=09     bool on)
 {
 =09struct ipu6_isys_csi2 *csi2;
+=09const struct dmi_system_id *dmi_id;
+=09const struct ipu4p_csi2_timing_quirk *quirk;
 =09void __iomem *base;
 =09u32 value;
=20
@@ -148,14 +181,31 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
 =09if (!timing)
 =09=09return -EINVAL;
=20
-=09writel(timing->ctermen, base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
-=09writel(timing->csettle, base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
-
-=09for (unsigned int lane =3D 0; lane < cfg->nlanes; lane++) {
-=09=09writel(timing->dtermen,
-=09=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
-=09=09writel(timing->dsettle,
-=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
+=09dmi_id =3D dmi_first_match(ipu4p_csi2_timing_quirks);
+=09quirk =3D dmi_id ? dmi_id->driver_data : NULL;
+
+=09if (quirk && cfg->port =3D=3D quirk->port &&
+=09    cfg->nlanes =3D=3D quirk->nlanes) {
+=09=09for (unsigned int lane =3D 0; lane < cfg->nlanes; lane++)
+=09=09=09writel(quirk->data_ticks,
+=09=09=09       base +
+=09=09=09       IPU4P_CSI2_RX_DLY_CNT_SHIFTED_DATA_TICKS(lane));
+
+=09=09dev_dbg(&isys->adev->auxdev.dev,
+=09=09=09"using Surface Pro 7 shifted timing for CSI-2 port %u, %u lanes\n=
",
+=09=09=09cfg->port, cfg->nlanes);
+=09} else {
+=09=09writel(timing->ctermen,
+=09=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
+=09=09writel(timing->csettle,
+=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
+
+=09=09for (unsigned int lane =3D 0; lane < cfg->nlanes; lane++) {
+=09=09=09writel(timing->dtermen,
+=09=09=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
+=09=09=09writel(timing->dsettle,
+=09=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
+=09=09}
 =09}
=20
 =09value =3D readl(base + IPU4P_CSI2_RX_CONFIG);
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h b/drivers/=
media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
index 05f96b7e97b..4b7510e05e1 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
@@ -63,6 +63,9 @@ static inline u32 ipu4p_isys_csi_irq_ctrl0_base(unsigned =
int port)
 #define IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane)=09(0x34 + (lane) * 8)
 #define IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane)=09(0x38 + (lane) * 8)
=20
+/* Shifted CSI-2 data-lane timing register offsets. */
+#define IPU4P_CSI2_RX_DLY_CNT_SHIFTED_DATA_TICKS(lane)=09(0x3c + (lane) * =
8)
+
 /* CSI receiver general-purpose registers */
 #define IPU4P_CSI2_GPREG_CR_PORT_CONFIG=09=09=090x14
=20
--=20
2.56.0


