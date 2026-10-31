Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449767;
	b=lpCIMQQfjRXfSKkkqtdhNxsqLK97Oi8rC0O5YeHIT8kO0e0JEv3XOn6DYXOXTtkx6B3r
	 /pyImUcMdFJSm2zL2hXfNstLaqafsgwsmEUahRBhWVZjH+b0jnQYTR9iC0kHDJdK6NVMg
	 OIQMCM0RS4oKqEtYGHoEb2n1ir+iy7ca2WfS3SqCItAi6M1tFBHjWgmzgCZPfxYtIdFxy
	 TC6uFy8jH47DxWVo+6FocnWVNBtNC4bsOI7gjfLHyIbHZiDmvuZhOY3e2D+iMWLr/DE5/
	 c/nrt4yR6uBhaxvsDkDTKj2MrRjtY8A0g2cJWFqtbGnkhX3w1CtIUjoQEh/DYQn2WQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449767;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QKwM/G3d8cDDqbj3kEze5vJBx9xtFiM+MKTaWbpMyNY=;
	b=KfYOEz8OCypmA1LpktTryykCL9CaCXbMySOhg93JJogl78HGjmVUXurvpW1RbsvKWEXG
	 SaNzfypK7BhvI3k9UCppu+XFqzwl4rzpoHh/FnfWTVUdRxbYXf8himpKaW9BFs7OAeoey
	 8GIHnI/Z+VWN/KV1iM5jmA43Jy6uNTpgIiozk+oIefrOGHiOlLJQchH3bpkE6k3zAz3iB
	 ItDREmy8m0OcSLffUaI3176l8LAqBQ04NesDjQbN4oiYek6ArH2dvlBpGa5j3dzyKMGen
	 YQ7LVF3ykUsEVUezrlYvYOFZRo6mZAP9zSna84lvmAZlNduBz3Dfy0QYmKhCW9txzhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=lczqcwury5dnvlu3pftvohahlq.protonmail2 header.b="nCRH/zQt";
	arc=none smtp.remote-ip=109.224.244.30
Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346D606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2346D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=lczqcwury5dnvlu3pftvohahlq.protonmail2 header.b=nCRH/zQt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=lczqcwury5dnvlu3pftvohahlq.protonmail2; t=1793449764;
	x=1793708964; bh=QKwM/G3d8cDDqbj3kEze5vJBx9xtFiM+MKTaWbpMyNY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nCRH/zQt+lDdW7vrtIAk7vzs9B+GM4CoZjwXZULW1IQxHQ61QaoaSHDYYXpX+Pr55
	 Juqne0cTZXjvnIdwXJzjWHf2to4E/yQDdmCOiud2GHooJVgUKewWIlcOOcV0Kju790
	 dQWint+udv5yBfO8gvq6GgyuGbSAOfkeI7dMePDN1CtQ0MjBZuC9eR9JbxQ2lhnrgd
	 RMuMRYv5VEzcttuS7nie48bKlE8tDQxEXfx1CqhZ2kXT9qiWwfy5EXY5I42iP/G03x
	 KD/JE76yjPu62oJ4xrdm4POZEACzWPLjoH4y4957MMVGDM1pxmvfYFv6VZLTNZrWm1
	 KLxTHiwy6FyRg==
Date: Sat, 31 Oct 2026 12:29:19 +0000
To: Ruslan Bay <ruslanbey@proton.me>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 02/12] media: ipu6: Add IPU4P MMU support
Message-ID: <HIqY305sMFUHwl9wyKbGQ0DCE3QOKwFva_k_NSdEz_Rp9xb1o6GM6uTjXTP4ejKQwXlePFZaTVUWmL3UN4-wUXmfrB1p4hWNaWOeiP_A4bg=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 16792ef14ad2162e31e18fdea38234d853e8b78a
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

IPU4P uses the same MMUv2 programming model as IPU6, but has different
MMU register offsets, instances and stream allocations.

Add IPU4P-specific ISYS and PSYS MMU data and select the corresponding
operations during initialization.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    | 114 ++++++++++++++++--
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   7 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   1 +
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |   8 ++
 drivers/media/pci/intel/ipu6/ipu6.h           |   2 +
 5 files changed, 122 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c b/drivers/media/pci=
/intel/ipu6/ipu6-mmu-hw.c
index 2b395fbd596..e05fc3f7752 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
@@ -38,7 +38,66 @@
=20
 #define TBL_PHYS_ADDR(a)=09((phys_addr_t)(a) << ISP_PADDR_SHIFT)
=20
-static struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] =3D {
+static const struct ipu6_mmu_hw ipu4p_isys_mmu_hwdata[] =3D {
+=09{
+=09=09.offset =3D IPU4P_ISYS_IOMMU0_OFFSET,
+=09=09.info_bits =3D IPU4P_INFO_REQUEST_DESTINATION_PRIMARY,
+=09=09.nr_l1streams =3D 0,
+=09=09.nr_l2streams =3D 0,
+=09=09.insert_read_before_invalidate =3D true,
+=09},
+=09{
+=09=09.offset =3D IPU4P_ISYS_IOMMU1_OFFSET,
+=09=09.nr_l1streams =3D IPU4P_MMU_MAX_TLB_L1_STREAMS,
+=09=09.l1_block_sz =3D {
+=09=09=095, 16, 6, 6, 6, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 5,
+=09=09},
+=09=09.nr_l2streams =3D IPU4P_MMU_MAX_TLB_L2_STREAMS,
+=09=09.l2_block_sz =3D {
+=09=09=092, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+=09=09},
+=09=09.l1_stream_id_reg_offset =3D IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
+=09=09.l2_stream_id_reg_offset =3D IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
+=09},
+};
+
+static const struct ipu6_mmu_hw ipu4p_psys_mmu_hwdata[] =3D {
+=09{
+=09=09.offset =3D IPU4P_PSYS_IOMMU0_OFFSET,
+=09=09.info_bits =3D IPU4P_INFO_REQUEST_DESTINATION_PRIMARY,
+=09=09.nr_l1streams =3D 0,
+=09=09.nr_l2streams =3D 0,
+=09=09.insert_read_before_invalidate =3D true,
+=09},
+=09{
+=09=09.offset =3D IPU4P_PSYS_IOMMU1_OFFSET,
+=09=09.nr_l1streams =3D IPU4P_MMU_MAX_TLB_L1_STREAMS,
+=09=09.l1_block_sz =3D {
+=09=09=092, 5, 4, 2, 2, 10, 5, 16, 10, 5, 0, 0, 0, 0, 0, 3,
+=09=09},
+=09=09.nr_l2streams =3D IPU4P_MMU_MAX_TLB_L2_STREAMS,
+=09=09.l2_block_sz =3D {
+=09=09=092, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+=09=09},
+=09=09.l1_stream_id_reg_offset =3D IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
+=09=09.l2_stream_id_reg_offset =3D IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
+=09},
+=09{
+=09=09.offset =3D IPU4P_PSYS_IOMMU1R_OFFSET,
+=09=09.nr_l1streams =3D IPU4P_MMU_MAX_TLB_L1_STREAMS,
+=09=09.l1_block_sz =3D {
+=09=09=092, 6, 5, 16, 16, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 3,
+=09=09},
+=09=09.nr_l2streams =3D IPU4P_MMU_MAX_TLB_L2_STREAMS,
+=09=09.l2_block_sz =3D {
+=09=09=092, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+=09=09},
+=09=09.l1_stream_id_reg_offset =3D IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
+=09=09.l2_stream_id_reg_offset =3D IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
+=09},
+};
+
+static const struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] =3D {
 =09{
 =09=09.offset =3D IPU6_ISYS_IOMMU0_OFFSET,
 =09=09.info_bits =3D IPU6_INFO_REQUEST_DESTINATION_IOSF,
@@ -86,7 +145,7 @@ static struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] =3D {
 =09},
 };
=20
-static struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] =3D {
+static const struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] =3D {
 =09{
 =09=09.offset =3D IPU6_PSYS_IOMMU0_OFFSET,
 =09=09.info_bits =3D
@@ -159,10 +218,21 @@ static struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] =3D =
{
 };
=20
 struct ipu6_mmu_hwdata {
-=09struct ipu6_mmu_hw *hwdata;
+=09const struct ipu6_mmu_hw *hwdata;
 =09unsigned int nr_mmus;
 };
=20
+static const struct ipu6_mmu_hwdata ipu4p_mmu_hwdata_lookup[IPU_SUBSYS_NUM=
] =3D {
+=09[IPU_PSYS] =3D {
+=09=09.hwdata =3D ipu4p_psys_mmu_hwdata,
+=09=09.nr_mmus =3D ARRAY_SIZE(ipu4p_psys_mmu_hwdata),
+=09},
+=09[IPU_ISYS] =3D {
+=09=09.hwdata =3D ipu4p_isys_mmu_hwdata,
+=09=09.nr_mmus =3D ARRAY_SIZE(ipu4p_isys_mmu_hwdata),
+=09},
+};
+
 static const struct ipu6_mmu_hwdata ipu6_mmu_hwdata_lookup[IPU_SUBSYS_NUM]=
 =3D {
 =09[IPU_PSYS] =3D {
 =09=09.hwdata =3D ipu6_psys_mmu_hwdata,
@@ -256,17 +326,21 @@ static int __ipu6_mmu_hw_init(struct ipu6_mmu *mmu)
 =09return 0;
 }
=20
-static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *de=
v,
-=09=09=09=09   void __iomem *base)
+static int __ipu_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev=
,
+=09=09=09=09  void __iomem *base,
+=09=09=09=09  const struct ipu6_mmu_hwdata *hwdata_lookup,
+=09=09=09=09  unsigned int max_l1streams,
+=09=09=09=09  unsigned int max_l2streams)
 {
 =09const struct ipu6_mmu_hwdata *lookup;
-=09struct ipu6_mmu_hw *mmu_hw, *src;
+=09struct ipu6_mmu_hw *mmu_hw;
+=09const struct ipu6_mmu_hw *src;
 =09unsigned int i, nr_mmus;
=20
 =09if (mmu->mmid >=3D IPU_SUBSYS_NUM)
 =09=09return -EINVAL;
=20
-=09lookup =3D &ipu6_mmu_hwdata_lookup[mmu->mmid];
+=09lookup =3D &hwdata_lookup[mmu->mmid];
 =09src =3D lookup->hwdata;
 =09nr_mmus =3D lookup->nr_mmus;
=20
@@ -275,8 +349,8 @@ static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu=
, struct device *dev,
 =09=09return -ENOMEM;
=20
 =09for (i =3D 0; i < nr_mmus; i++) {
-=09=09if (src[i].nr_l1streams > IPU6_MMU_MAX_TLB_L1_STREAMS ||
-=09=09    src[i].nr_l2streams > IPU6_MMU_MAX_TLB_L2_STREAMS)
+=09=09if (src[i].nr_l1streams > max_l1streams ||
+=09=09    src[i].nr_l2streams > max_l2streams)
 =09=09=09return -EINVAL;
=20
 =09=09mmu_hw[i] =3D src[i];
@@ -289,6 +363,28 @@ static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mm=
u, struct device *dev,
 =09return 0;
 }
=20
+static int __ipu4p_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *d=
ev,
+=09=09=09=09    void __iomem *base)
+{
+=09return __ipu_mmu_init_hw_data(mmu, dev, base, ipu4p_mmu_hwdata_lookup,
+=09=09=09=09      IPU4P_MMU_MAX_TLB_L1_STREAMS,
+=09=09=09=09      IPU4P_MMU_MAX_TLB_L2_STREAMS);
+}
+
+static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *de=
v,
+=09=09=09=09   void __iomem *base)
+{
+=09return __ipu_mmu_init_hw_data(mmu, dev, base, ipu6_mmu_hwdata_lookup,
+=09=09=09=09      IPU6_MMU_MAX_TLB_L1_STREAMS,
+=09=09=09=09      IPU6_MMU_MAX_TLB_L2_STREAMS);
+}
+
+const struct ipu6_mmu_hw_ops ipu4p_mmu_ops =3D {
+=09.init_hw_data =3D __ipu4p_mmu_init_hw_data,
+=09.hw_init =3D __ipu6_mmu_hw_init,
+=09.tlb_invalidate =3D __ipu6_tlb_invalidate,
+};
+
 const struct ipu6_mmu_hw_ops ipu6_mmu_ops =3D {
 =09.init_hw_data =3D __ipu6_mmu_init_hw_data,
 =09.hw_init =3D __ipu6_mmu_hw_init,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.c
index 1a564ceb747..824408b21cc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -684,7 +684,12 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 =09if (!mmu)
 =09=09return ERR_PTR(-ENOMEM);
=20
-=09mmu->ops =3D (IS_IPU7(isp) || IS_IPU8(isp)) ? &ipu7_mmu_ops : &ipu6_mmu=
_ops;
+=09if (IS_IPU4P(isp))
+=09=09mmu->ops =3D &ipu4p_mmu_ops;
+=09else if (IS_IPU7(isp) || IS_IPU8(isp))
+=09=09mmu->ops =3D &ipu7_mmu_ops;
+=09else
+=09=09mmu->ops =3D &ipu6_mmu_ops;
 =09mmu->mmid =3D mmid;
 =09mmu->ready =3D false;
 =09INIT_LIST_HEAD(&mmu->vma_list);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.h
index ff113384c12..8434dd5324c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -197,6 +197,7 @@ struct ipu6_mmu {
 =09const struct ipu6_mmu_hw_ops *ops;
 };
=20
+extern const struct ipu6_mmu_hw_ops ipu4p_mmu_ops;
 extern const struct ipu6_mmu_hw_ops ipu6_mmu_ops;
 extern const struct ipu6_mmu_hw_ops ipu7_mmu_ops;
=20
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h b/drivers/me=
dia/pci/intel/ipu6/ipu6-platform-regs.h
index b883385adb4..01a7abddd6d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
@@ -14,16 +14,23 @@
  */
 #define IPU6_UNIFIED_OFFSET=09=09=090
=20
+#define IPU4P_ISYS_IOMMU0_OFFSET=09=090x000e0000
+#define IPU4P_ISYS_IOMMU1_OFFSET=09=090x000e0100
 #define IPU6_ISYS_IOMMU0_OFFSET=09=090x2e0000
 #define IPU6_ISYS_IOMMU1_OFFSET=09=090x2e0500
 #define IPU6_ISYS_IOMMUI_OFFSET=09=090x2e0a00
=20
+#define IPU4P_PSYS_IOMMU0_OFFSET=09=090x000b0000
+#define IPU4P_PSYS_IOMMU1_OFFSET=09=090x000b0100
+#define IPU4P_PSYS_IOMMU1R_OFFSET=09=090x000b0600
 #define IPU6_PSYS_IOMMU0_OFFSET=09=090x1b0000
 #define IPU6_PSYS_IOMMU1_OFFSET=09=090x1b0700
 #define IPU6_PSYS_IOMMU1R_OFFSET=090x1b0e00
 #define IPU6_PSYS_IOMMUI_OFFSET=09=090x1b1500
=20
 /* the offset from IOMMU base register */
+#define IPU4P_MMU_L1_STREAM_ID_REG_OFFSET=090x0c
+#define IPU4P_MMU_L2_STREAM_ID_REG_OFFSET=090x4c
 #define IPU6_MMU_L1_STREAM_ID_REG_OFFSET=090x0c
 #define IPU6_MMU_L2_STREAM_ID_REG_OFFSET=090x4c
 #define IPU6_PSYS_MMU1W_L2_STREAM_ID_REG_OFFSET=090x8c
@@ -105,6 +112,7 @@
 #define IPU6_INFO_IMR_BASE=09=09=09BIT(10)
 #define IPU6_INFO_IMR_DESTINED=09=09=09BIT(11)
=20
+#define IPU4P_INFO_REQUEST_DESTINATION_PRIMARY=09BIT(4)
 #define IPU6_INFO_REQUEST_DESTINATION_PRIMARY IPU6_INFO_REQUEST_DESTINATIO=
N_IOSF
=20
 /*
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/=
ipu6/ipu6.h
index 4db9f3d85d8..c70ae6bb1d9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -95,6 +95,8 @@ struct ipu6_device {
 /* The firmware is accessible within the first 2 GiB only in non-secure mo=
de. */
 #define IPU6_MMU_ADDR_BITS_NON_SECURE=0931
=20
+#define IPU4P_MMU_MAX_TLB_L1_STREAMS=0916
+#define IPU4P_MMU_MAX_TLB_L2_STREAMS=0916
 #define IPU6_MMU_MAX_TLB_L1_STREAMS=0932
 #define IPU6_MMU_MAX_TLB_L2_STREAMS=0932
 #define IPU6_MAX_LI_BLOCK_ADDR=09=09128
--=20
2.56.0


