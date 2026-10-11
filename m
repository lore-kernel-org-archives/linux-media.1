Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9BB126BE1
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729155; cv=none; b=N05vSYfa0Kp0A2gO+OwmDx2GlzB65UblGXMOe8gvtnKMDlLfF7bJ06O1K45HFuN3zdqoNTMEU6Uwd9C99zDnH27GdQIC3cHkP+0QUBVClqRHxcP38PCg/2nEx0dHU19CY5I2Xfrpa/5NCoCDt5ZUaPSf8fuV5Uvov/2MgYxdAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729155; c=relaxed/simple;
	bh=32Yc1jgme0KbQZ8BUPKBxgFqABRt9AcQuCQjiVBNO1s=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=roJG9WehBJMgOzjNYe8TXCHPJXscX8VlYpVbaOvyagr6jIZKjdGYW5SkYXtpuXWDulhP79NvlxEAXDWEZLWUGXI4ZHDQ8ZQkxgJ31Da3yde1phaLQAYgRsyK6H4OD+nG37v0sH1ghWbYz0Ypr2bsWuQZAXS/5K5r6hCsBCFJVQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=J3dbsc3i; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="J3dbsc3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791729150; x=1791988350;
	bh=XcWsTtF2EQB4sqC889NE8V5mSiGfPrkkdHzM9+ChHVs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=J3dbsc3i0b4bvIMVyH6BgJHkK/IdokGRgVuPkBZ9Q+DrRLKRoVVaZiYU618eoZyTF
	 7pE97b4/9ADRaeNcbZvVFTUzdq/AFczebEfz7scex69B95dVTJKu8sJxukoHGAgxqq
	 2eEN6bx7RE78ONdTTJu7Jf3Btu7mcV1rkoeqMtUxh2Fc07XQKVwxbds/s71CJdkYQ2
	 fXVzVKrcF17B1Hb4f2chyvg0nAJz81dzhbr49VV8HQzGYmaFOP5D2mdMdyR1DlPcY5
	 qi/CMUM/3v45KL9BED/fdAoNrAN8geL/mb8HFT3iMo+qJiQ3er852nNKDAtTQJ/XCS
	 Cs/Im2uwTcqKA==
Date: Sun, 11 Oct 2026 14:32:23 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [PATCH 02/12] media: ipu6: Add IPU4P MMU support
Message-ID: <-wYlMRTagoUwgNowZlR5M-zZ5DX9WvFLj808Vs7j_fK6SP9Jh1WFnfG-ptS0pkzi4FXLbEdeNXfkof5aFLRDbp7jc35Q5lXY6owao5CoTUA=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 057fedec2a1d710f85e018bede7136fc6a8fd588
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The IPU4P MMU uses the same MMUv2 page tables and register programming
model as IPU6, but differs in register offsets, number of MMU instances,
and stream block allocations.

Add IPU4P-specific ISYS and PSYS MMU hardware initialization data and
wire up IPU4P MMU ops in ipu6_mmu_init().

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    | 109 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   7 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   1 +
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  11 ++
 drivers/media/pci/intel/ipu6/ipu6.h           |   2 +
 5 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c b/drivers/media/pci=
/intel/ipu6/ipu6-mmu-hw.c
index 2b395fbd5969..ca2b23741585 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
@@ -158,6 +158,65 @@ static struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] =3D {
 =09},
 };
=20
+static struct ipu6_mmu_hw ipu4p_isys_mmu_hwdata[] =3D {
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
+static struct ipu6_mmu_hw ipu4p_psys_mmu_hwdata[] =3D {
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
 struct ipu6_mmu_hwdata {
 =09struct ipu6_mmu_hw *hwdata;
 =09unsigned int nr_mmus;
@@ -210,6 +269,17 @@ static void __ipu6_tlb_invalidate(struct ipu6_mmu *mmu=
)
 =09spin_unlock_irqrestore(&mmu->ready_lock, flags);
 }
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
 static int __ipu6_mmu_hw_init(struct ipu6_mmu *mmu)
 {
 =09struct ipu6_mmu_info *mmu_info =3D mmu->dmap->mmu_info;
@@ -289,8 +359,47 @@ static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mm=
u, struct device *dev,
 =09return 0;
 }
=20
+static int __ipu4p_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *d=
ev,
+=09=09=09=09    void __iomem *base)
+{
+=09const struct ipu6_mmu_hwdata *lookup;
+=09struct ipu6_mmu_hw *mmu_hw, *src;
+=09unsigned int i, nr_mmus;
+
+=09if (mmu->mmid >=3D IPU_SUBSYS_NUM)
+=09=09return -EINVAL;
+
+=09lookup =3D &ipu4p_mmu_hwdata_lookup[mmu->mmid];
+=09src =3D lookup->hwdata;
+=09nr_mmus =3D lookup->nr_mmus;
+
+=09mmu_hw =3D devm_kcalloc(dev, nr_mmus, sizeof(*mmu_hw), GFP_KERNEL);
+=09if (!mmu_hw)
+=09=09return -ENOMEM;
+
+=09for (i =3D 0; i < nr_mmus; i++) {
+=09=09if (src[i].nr_l1streams > IPU4P_MMU_MAX_TLB_L1_STREAMS ||
+=09=09    src[i].nr_l2streams > IPU4P_MMU_MAX_TLB_L2_STREAMS)
+=09=09=09return -EINVAL;
+
+=09=09mmu_hw[i] =3D src[i];
+=09=09mmu_hw[i].base =3D base + src[i].offset;
+=09}
+
+=09mmu->nr_mmus =3D nr_mmus;
+=09mmu->ipu6_mmu_hw =3D mmu_hw;
+
+=09return 0;
+}
+
 const struct ipu6_mmu_hw_ops ipu6_mmu_ops =3D {
 =09.init_hw_data =3D __ipu6_mmu_init_hw_data,
 =09.hw_init =3D __ipu6_mmu_hw_init,
 =09.tlb_invalidate =3D __ipu6_tlb_invalidate,
 };
+
+const struct ipu6_mmu_hw_ops ipu4p_mmu_ops =3D {
+=09.init_hw_data =3D __ipu4p_mmu_init_hw_data,
+=09.hw_init =3D __ipu6_mmu_hw_init,
+=09.tlb_invalidate =3D __ipu6_tlb_invalidate,
+};
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.c
index 243d438786ba..93e3be1ef09e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -684,7 +684,12 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 =09if (!mmu)
 =09=09return ERR_PTR(-ENOMEM);
=20
-=09mmu->ops =3D IS_IPU7(isp) ? &ipu7_mmu_ops : &ipu6_mmu_ops;
+=09if (IS_IPU7(isp))
+=09=09mmu->ops =3D &ipu7_mmu_ops;
+=09else if (IS_IPU4P(isp))
+=09=09mmu->ops =3D &ipu4p_mmu_ops;
+=09else
+=09=09mmu->ops =3D &ipu6_mmu_ops;
 =09mmu->mmid =3D mmid;
 =09mmu->ready =3D false;
 =09INIT_LIST_HEAD(&mmu->vma_list);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.h
index 44880478d242..455604eb8b64 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -197,6 +197,7 @@ struct ipu6_mmu {
 };
=20
 extern const struct ipu6_mmu_hw_ops ipu6_mmu_ops;
+extern const struct ipu6_mmu_hw_ops ipu4p_mmu_ops;
 extern const struct ipu6_mmu_hw_ops ipu7_mmu_ops;
=20
 struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h b/drivers/me=
dia/pci/intel/ipu6/ipu6-platform-regs.h
index b883385adb44..f08e7e8fd87d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
@@ -14,6 +14,17 @@
  */
 #define IPU6_UNIFIED_OFFSET=09=09=090
=20
+#define IPU4P_ISYS_IOMMU0_OFFSET=09=090x000e0000
+#define IPU4P_ISYS_IOMMU1_OFFSET=09=090x000e0100
+
+#define IPU4P_PSYS_IOMMU0_OFFSET=09=090x000b0000
+#define IPU4P_PSYS_IOMMU1_OFFSET=09=090x000b0100
+#define IPU4P_PSYS_IOMMU1R_OFFSET=09=090x000b0600
+
+#define IPU4P_MMU_L1_STREAM_ID_REG_OFFSET=090x0c
+#define IPU4P_MMU_L2_STREAM_ID_REG_OFFSET=090x4c
+#define IPU4P_INFO_REQUEST_DESTINATION_PRIMARY=09BIT(4)
+
 #define IPU6_ISYS_IOMMU0_OFFSET=09=090x2e0000
 #define IPU6_ISYS_IOMMU1_OFFSET=09=090x2e0500
 #define IPU6_ISYS_IOMMUI_OFFSET=09=090x2e0a00
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/=
ipu6/ipu6.h
index 321ca1d57157..2afbd70cae74 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -93,6 +93,8 @@ struct ipu6_device {
=20
 #define IPU6_MMU_MAX_TLB_L1_STREAMS=0932
 #define IPU6_MMU_MAX_TLB_L2_STREAMS=0932
+#define IPU4P_MMU_MAX_TLB_L1_STREAMS=0916
+#define IPU4P_MMU_MAX_TLB_L2_STREAMS=0916
 #define IPU6_MAX_LI_BLOCK_ADDR=09=09128
 #define IPU6_MAX_L2_BLOCK_ADDR=09=0964
=20
--=20
2.55.0


