Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [37.187.220.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EADD23392B
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.220.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729812; cv=none; b=sX7kAcEx8uxM3KLFdfZpvbum21CkPW5FDABsCkJ5Kpc7oo/zqR4D/sOtpYBpj7ErtOC3NaS1WLBsQspJM6U7EMg2dOqrautC0scfFEL5Iw0Ldrsirwc8nusGToo16E0BJUgavA0M+l6DcJ2Efdl0G9lpZg6Ivc6GZeIYBsNra1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729812; c=relaxed/simple;
	bh=aJNJ2CsryrThNi21l8tZM3qDtXSzzYQe/oOCBbufyLE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kVtMb6upikOBnmhXFrnhmxPlx0cpxgrhu7AfZPAayfXLLZ/LEH2jf/081KUOJ284ggj7O2n76YVD+RVwoZ8g6MD0oQ9WC3ar5rSqdNdr9wjZ6UUq2ZeVBnUzzo2jh2DbT8KKtAJUr+UAr4jkAZKuo+yDSDaA4B0dAg8jCwt9T3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=QGCY9FW9; arc=none smtp.client-ip=37.187.220.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="QGCY9FW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791729799; x=1791988999;
	bh=iCFgGXKdUzGp1OLoujy3D+3k0lN+3E0jN6xnzFSekxo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QGCY9FW93YZ04PTYA8UoS+2RFWlYfcETSxUw6Rmn4RK9e/tgUT8XWCaBzXit4pxGj
	 pqWTTuAyMm6kY9j88RDPFlCxbxttp3qsUH95F1xQM14UgLsU9uMRqeqaM7UukvI+nI
	 MQUNyQP/KTyzlr6/z4cqMguJBfndRPI8I0W+8p4NyvPIzxW7dZTF97A01mw95M928M
	 HJfPkNfJ7eTXbxLx9jdL46ceYRjrdW3Zx4PqNcMKvbtkxXKg7PL4fMV5vPeD+ilK5+
	 nkM6L7+VwBE5QGMpj/T81QRTiBdITHPHixG298Ip2CMxDFZkNcx03fi2IGuPNmAnTo
	 G1fvucnteW8ZA==
Date: Sun, 11 Oct 2026 14:43:16 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 11/12] media: ipu6: Work around IPU4P CSI-2 port 2 timing
Message-ID: <wHlhg4wMna8LgQHoqgFJxsJ3dL0clAd63yzOzr-vjRpkqq6WSPuzlLeYRGYHKwdl17CXzPVLFCWD6CNkI-BTMTd33QepNGnNWJZX6yvPAV4=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: cd54676d9f670847bc27e7c33e9623047ffb3e29
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use fixed timing values for the verified Surface Pro 7 front-camera
configuration (CSI-2 port 2, firmware source 7, two lanes), including
the lane-count programming order observed in Windows. Retain calculated
timings and the existing initialization order for other configurations.

Tested on the Surface Pro 7 front camera; other IPU4P systems need testing.

Co-developed-by: supermepsipax <supermepsipax@github>
Co-developed-by: thisiscamk <thisiscamk@github>
Co-developed-by: ConsultingFuture4200 <ConsultingFuture4200@github>
Co-developed-by: georgemihaila <georgemihaila@github>

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 50 ++++++++++++++++---
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c b/drivers/me=
dia/pci/intel/ipu6/ipu4p-isys-csi-phy.c
index ec0a36069b01..ffa7d80cd5f2 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
@@ -69,6 +69,22 @@ void ipu4p_isys_phy_setup(struct ipu6_isys *isys)
 =09=09ipu4p_isys_configure_phy_bb(isp, &ipu4p_phy_bb_configs[i]);
 }
=20
+/*
+ * Use fixed timing observed in Windows for the SP7 front camera:
+ * IPU4P CSI-2 port 2, firmware source 7, two-lane D-PHY.
+ */
+static void ipu4p_isys_apply_fixed_2lane_timing(struct ipu6_isys_csi2 *csi=
2)
+{
+=09writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
+=09writel(1155, csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(0));
+
+=09for (unsigned int i =3D 0; i < 8; i++) {
+=09=09writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(i));
+=09=09writel(1269,
+=09=09       csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(i + 1));
+=09}
+}
+
 static void ipu4p_isys_csi_irq_enable(struct ipu6_isys *isys,
 =09=09=09=09      unsigned int port)
 {
@@ -118,6 +134,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
 =09struct ipu6_isys_csi2 *csi2;
 =09void __iomem *base;
 =09u32 value;
+=09bool fixed_timing;
=20
 =09if (!cfg || cfg->port >=3D isys->pdata->ipdata->csi2.nports)
 =09=09return -EINVAL;
@@ -146,14 +163,30 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
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
+=09writel(timing->ctermen,
+=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
+
+=09fixed_timing =3D csi2->port =3D=3D 2 && cfg->nlanes =3D=3D 2 &&
+=09=09       csi2->asd.source =3D=3D
+=09=09       IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + 7;
+=09if (fixed_timing) {
+=09=09ipu4p_isys_apply_fixed_2lane_timing(csi2);
+=09=09dev_dbg(&isys->adev->auxdev.dev,
+=09=09=09"using fixed SP7 timing for CSI-2 port %u, source 7, two lanes\n"=
,
+=09=09=09csi2->port);
+
+=09=09/* Windows configures the lane count before RX_CONFIG. */
+=09=09writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
+=09} else {
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
@@ -162,6 +195,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
 =09writel(value, base + IPU4P_CSI2_RX_CONFIG);
=20
 =09writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
+
 =09writel(0, base + IPU4P_CSI2_RX_ENABLE);
=20
 =09ipu4p_isys_csi_irq_enable(isys, cfg->port);
--=20
2.55.0


