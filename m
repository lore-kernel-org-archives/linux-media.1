Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B4338F62F
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250137; cv=none; b=oDl9D60vRHaNvwRuZtxZq+nlDrjWYP9ciA0/VnPxzeSuL6vcxXvGitvjYtHfAcXiTA6CBaRyGv8bGeuzWQg3extMdlPrlx5dpxRzRCPibhoE0i++V4VcO++awv2txUlTbuBqJLm6jP68MgIg2VeadjpPBk7hMQCaAX0vHwzVIuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250137; c=relaxed/simple;
	bh=SRwSVulPU8kvoPyee+PpfijIu60aNz6nBA+kIgzWNgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMHN+ZxJlbUxQpHVM9yED5OuSbzRKw+0BXsZ9QeCJH6dWnzzfJlDilr2oEsJrc9qmhfQLYYdKqSi2PByOyyTNzumYy3O7xsfpQxZl9SHNdj9SjP2YnUHwt2hzq5jGyYR/EJVrJwza5EqHAGuN6Qw4NpPr3wqBggeJ4RXCWabPhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOQw9l9T; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOQw9l9T"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso87189b3a.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787250133; x=1787854933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kr733lw/E7WQPqwfM+17kmV0Ipx+SjehSAOAO7A/DeA=;
        b=eOQw9l9T/a+0tRNc7x9st1xb0hVWhl/Gh1ABZSyTdInqiwlJ0nutYUbhXTL/wEr6Kz
         b+WGFJ9rc26rjmxmpkvbYV19XrbTrL+ISUoCXEal8D1392VEvSSZTETgU3mSftZQB53D
         ycjFuU6sDktO9GIi5To7qxPIP/keuOu7PwhAcNcOIEbpa5/mHH+2TrrsP0Rx/RLElGtk
         yxq7WJY5VbuyjwVXW4PzcF2bgVcvU9Ut56zSooJdMrGiktUSiJUgAqc2G6SDz4V72bIG
         4PjXieIG02AwnirVBB3Vw6mYvsoLyFvJJwbETq0Y3Ujw8zOurnlEIXSA5H+Ohhk5LBVm
         RoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250133; x=1787854933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kr733lw/E7WQPqwfM+17kmV0Ipx+SjehSAOAO7A/DeA=;
        b=Cxh96bB37IabxFnMskAgTnlIQd2JZVBsUAAguo28nRfxbCMLc4yYBuu2xDXxVYSUlW
         /GxI6BZBumC4yYhQtvNHtcs07NsRxS5VFCRb+gWCbzmezPZsxzs1anGvilIIulnRNFZY
         nMv6ysKkEYOZKzqwMXbYDDPqMzWAaiD15VrW8e0IJmPhB3pJiBcqUWm/fO1SKP9dCJDR
         ONeAmsaJrTq4/O2Pxzau6TmfCRKl09YWxZpyYjUsCX8oCMm0e+fXr/+LtLHJ414SM30h
         Mk6oT+WgSPk8omB7R+p/SHCvv6YEdvbmhWzWpVdwPYWMisHkWQ+emTCMKBENKQVMHzFj
         Xccw==
X-Gm-Message-State: AOJu0Yy4kGLmzuVpzj54qgEbOAy31loctr8ufMRWmchhMrY95T9SqcdJ
	hV4hYJgEWLbTbYZx6cVgb5UfV5UpdJ2R5c/FRYUoLcnaRFYJdowFJo33MFdzOVv4Kjc=
X-Gm-Gg: AR+sD10zKmmQlRcNYVRrnjaZQer4fqXRxC01GanADFExT1o4JaAyQnrUTK1YljQO7WK
	//MsDh5zjaWYK//EACOb1jm2FiBTG7OkoXJxITzOdva1Pt4OIL6mB2+b7j7J1k237KN4/V8C/V7
	8zEABiXZ1DF/lH/MyJog/AYnXc/esCLDRJfoDi0Hxf3+dEKgobFSSVZiq6U7GP/10voSwKG/MDo
	ME5CL5cqI2cI3RjrlNrvrLsqcu8AD2vJwfZSYFncEQpJ2WwyF8Iinx2WTbYupnKPIV9ObH3Lyup
	uq+aN3cHZEC8dgndpe0AHePfZY+rVxA2ajJdJmc7FBrQpLPGTXRGXa5AJM2o1LCLfIzlbZ+8hu8
	JKE3ZO9p9SVAgkB7tREby1xzg3AT6a2eEv8V0NPvxxpB9J9o9bQfY6Nsn4vMKqfwj132xuqSYal
	NFxyDkr+gXLbPOoImoZGN7kGTUHvAHhAbbeCSd0nazhkJRxPHCtHsH1tRDzTuytS0OXDC7jx1i3
	+pD32EXe/hHQLK10xyFaFJBnhH2/l3PaTPof1f9qFpFUNtb6wv6HQ==
X-Received: by 2002:a05:6a00:ba8e:b0:848:417a:d1a6 with SMTP id d2e1a72fcca58-851d38e0a48mr22931553b3a.15.1787250132364;
        Thu, 20 Aug 2026 11:22:12 -0700 (PDT)
Received: from desktop.local (97-115-106-59.ptld.qwest.net. [97.115.106.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d369a487sm2037829b3a.59.2026.08.20.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:22:11 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [RESEND PATCH 3/5] facetimehd: fix compile-time issues and formatting
Date: Thu, 20 Aug 2026 11:21:52 -0700
Message-ID: <20260820182156.18078-4-jackflusche@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820182156.18078-1-jackflusche@gmail.com>
References: <20260820182156.18078-1-jackflusche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix errors and warnings from clangd and checkpatch.pl to meet kernel
code standards in the FacetimeHD driver

Signed-off-by: Jack Flusche <jackflusche@gmail.com>
---
 drivers/media/pci/facetimehd/fthd_buffer.c  |  33 ++---
 drivers/media/pci/facetimehd/fthd_buffer.h  |  14 +-
 drivers/media/pci/facetimehd/fthd_ddr.c     |  29 ++--
 drivers/media/pci/facetimehd/fthd_ddr.h     |   5 +-
 drivers/media/pci/facetimehd/fthd_debugfs.c |  14 +-
 drivers/media/pci/facetimehd/fthd_debugfs.h |   3 +-
 drivers/media/pci/facetimehd/fthd_drv.c     |  40 +++---
 drivers/media/pci/facetimehd/fthd_drv.h     |  16 +--
 drivers/media/pci/facetimehd/fthd_hw.c      |  62 +++++----
 drivers/media/pci/facetimehd/fthd_hw.h      |   4 +-
 drivers/media/pci/facetimehd/fthd_isp.c     |  75 ++++++-----
 drivers/media/pci/facetimehd/fthd_isp.h     |  19 +--
 drivers/media/pci/facetimehd/fthd_reg.h     |   3 +-
 drivers/media/pci/facetimehd/fthd_ringbuf.c |  10 +-
 drivers/media/pci/facetimehd/fthd_ringbuf.h |  11 +-
 drivers/media/pci/facetimehd/fthd_v4l2.c    | 141 ++++++++------------
 drivers/media/pci/facetimehd/fthd_v4l2.h    |   4 +-
 17 files changed, 227 insertions(+), 256 deletions(-)

diff --git a/drivers/media/pci/facetimehd/fthd_buffer.c b/drivers/media/pci/facetimehd/fthd_buffer.c
index fae443c1f380..4955e2bb028e 100644
--- a/drivers/media/pci/facetimehd/fthd_buffer.c
+++ b/drivers/media/pci/facetimehd/fthd_buffer.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2015 Sven Schnelle <svens@stackframe.org>
@@ -24,9 +23,9 @@ struct buf_ctx {
 
 static int iommu_allocator_init(struct fthd_private *dev_priv)
 {
-        dev_priv->iommu = kzalloc(sizeof(struct resource), GFP_KERNEL);
+	dev_priv->iommu = kzalloc_obj(struct resource, GFP_KERNEL);
 	if (!dev_priv->iommu)
-	    return -ENOMEM;
+		return -ENOMEM;
 
 	dev_priv->iommu->start = 0;
 	dev_priv->iommu->end = 4095;
@@ -41,17 +40,17 @@ struct iommu_obj *iommu_allocate_sgtable(struct fthd_private *dev_priv, struct s
 	int ret, i, pos;
 	int total_len = 0, dma_length;
 	dma_addr_t dma_addr;
-	
-	for(i = 0; i < sgtable->nents; i++)
+
+	for (i = 0; i < sgtable->nents; i++)
 		total_len += sg_dma_len(sgtable->sgl + i);
-	
+
 	if (!total_len)
 		return NULL;
 
 	total_len += 4095;
 	total_len /= 4096;
-	
-	obj = kzalloc(sizeof(struct iommu_obj), GFP_KERNEL);
+
+	obj = kzalloc_obj(struct iommu_obj, GFP_KERNEL);
 	if (!obj)
 		return NULL;
 
@@ -60,7 +59,7 @@ struct iommu_obj *iommu_allocate_sgtable(struct fthd_private *dev_priv, struct s
 				1, NULL, NULL);
 	if (ret) {
 		dev_err(&dev_priv->pdev->dev,
-			"Failed to allocate resource (size: %d, start: %Ld, end: %Ld)\n",
+			"Failed to allocate resource (size: %d, start: %lld, end: %lld)\n",
 			total_len, root->start, root->end);
 		kfree(obj);
 		obj = NULL;
@@ -71,14 +70,14 @@ struct iommu_obj *iommu_allocate_sgtable(struct fthd_private *dev_priv, struct s
 	obj->size = total_len;
 
 	pos = 0x9000 + obj->offset * 4;
-	for(i = 0; i < sgtable->nents; i++) {
+	for (i = 0; i < sgtable->nents; i++) {
 		sg = sgtable->sgl + i;
 		WARN_ON(sg->offset);
 		dma_addr = sg_dma_address(sg);
 		WARN_ON(dma_addr & 0xfff);
 		dma_addr >>= 12;
-		
-		for(dma_length = 0; dma_length < sg_dma_len(sg); dma_length += 0x1000) {
+
+		for (dma_length = 0; dma_length < sg_dma_len(sg); dma_length += 0x1000) {
 		  //			pr_debug("IOMMU %08x -> %08llx (dma length %d)\n", pos, dma_addr, dma_length);
 			FTHD_S2_REG_WRITE(dma_addr++, pos);
 			pos += 4;
@@ -92,12 +91,13 @@ struct iommu_obj *iommu_allocate_sgtable(struct fthd_private *dev_priv, struct s
 void iommu_free(struct fthd_private *dev_priv, struct iommu_obj *obj)
 {
 	int i;
+
 	pr_debug("freeing %p\n", obj);
 
 	if (!obj)
 		return;
-	
- 	for (i = obj->offset; i < obj->offset + obj->size; i++)
+
+	for (i = obj->offset; i < obj->offset + obj->size; i++)
 		FTHD_S2_REG_WRITE(0, 0x9000 + i * 4);
 
 	release_resource(&obj->base);
@@ -113,7 +113,8 @@ static void iommu_allocator_destroy(struct fthd_private *dev_priv)
 int fthd_buffer_init(struct fthd_private *dev_priv)
 {
 	int i;
-	for(i = 0; i < 0x1000; i++)
+
+	for (i = 0; i < 0x1000; i++)
 		FTHD_S2_REG_WRITE(0, 0x9000 + i * 4);
 
 	return iommu_allocator_init(dev_priv);
diff --git a/drivers/media/pci/facetimehd/fthd_buffer.h b/drivers/media/pci/facetimehd/fthd_buffer.h
index 2e76ded90215..c6d390288783 100644
--- a/drivers/media/pci/facetimehd/fthd_buffer.h
+++ b/drivers/media/pci/facetimehd/fthd_buffer.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2015 Sven Schnelle <svens@stackframe.org>
@@ -10,7 +9,8 @@
 #define FTHD_BUFFER_H
 
 #include <linux/scatterlist.h>
-#include "fthd_buffer.h"
+
+struct fthd_private;
 
 enum fthd_buffer_state {
 	BUF_FREE,
@@ -29,14 +29,14 @@ struct dma_descriptor {
 	u32 count;
 	u32 pool;
 	u64 tag;
-} __attribute__((packed));
+} __packed;
 
 struct dma_descriptor_list {
 	u32 field0;
-    	u32 count;
+	u32 count;
 	struct dma_descriptor desc[4];
 	char unknown[216];
-} __attribute__((packed));
+} __packed;
 
 struct iommu_obj {
 	struct resource base;
@@ -68,6 +68,6 @@ extern int fthd_buffer_init(struct fthd_private *dev_priv);
 extern void fthd_buffer_exit(struct fthd_private *dev_priv);
 extern void fthd_buffer_return_handler(struct fthd_private *dev_priv, u32 offset, int size);
 extern void fthd_buffer_queued_handler(struct fthd_private *dev_priv, u32 offset);
-extern struct iommu_obj *iommu_allocate_sgtable(struct fthd_private *dev_priv, struct sg_table *);
+extern struct iommu_obj *iommu_allocate_sgtable(struct fthd_private *dev_priv, struct sg_table *sgtable);
 extern void iommu_free(struct fthd_private *dev_priv, struct iommu_obj *obj);
 #endif
diff --git a/drivers/media/pci/facetimehd/fthd_ddr.c b/drivers/media/pci/facetimehd/fthd_ddr.c
index df21537680db..3bacdf0125c4 100644
--- a/drivers/media/pci/facetimehd/fthd_ddr.c
+++ b/drivers/media/pci/facetimehd/fthd_ddr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * FacetimeHD camera driver
  *
@@ -17,13 +18,7 @@
  *
  */
 
-#include <linux/version.h>
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0)
 #include <linux/prandom.h>
-#else
-#include <linux/random.h>
-#endif
-
 #include "fthd_drv.h"
 #include "fthd_hw.h"
 #include "fthd_ddr.h"
@@ -302,12 +297,11 @@ static int fthd_ddr_calibrate_one_re_fifo(struct fthd_private *dev_priv,
 		*rden_byte1 = bl_start[1];
 	}
 
-	if (*rden_byte0 > 63) {
+	if (*rden_byte0 > 63)
 		*rden_byte0 = 63;
-	}
-	if (*rden_byte1 > 63) {
+
+	if (*rden_byte1 > 63)
 		*rden_byte1 = 63;
-	}
 
 	return 0;
 }
@@ -429,13 +423,14 @@ static int fthd_ddr_calibrate_rd_dqs(struct fthd_private *dev_priv,
 	u32 pass_end[16]; // u32 var_f0[16];
 	int fail_sum, i, j, bit;
 	s32 setting;
-	printk(KERN_CONT "\n");
+
+	dev_info(&dev_priv->pdev->dev, "Calibrating RD DQS: ");
 
 	for (bit = 0; bit < 16; bit++) {
 		pass_start[bit] = 64;
 		pass_end[bit] = 64;
 
-		printk(KERN_CONT "%.2d: ", bit);
+		pr_cont("%.2d: ", bit);
 
 		/* Start looking for start of pass */
 		for (i = 0; i < 63; i++) {
@@ -446,9 +441,9 @@ static int fthd_ddr_calibrate_rd_dqs(struct fthd_private *dev_priv,
 				fail_sum += fails[i + j] & (1 << bit);
 
 			if (fail_sum) {
-				printk(KERN_CONT ".");
+				pr_cont(".");
 			} else {
-				printk(KERN_CONT "O");
+				pr_cont("O");
 
 				pass_start[bit] = i;
 				break;
@@ -461,9 +456,9 @@ static int fthd_ddr_calibrate_rd_dqs(struct fthd_private *dev_priv,
 				if (pass_end[bit] == 64)
 					pass_end[bit] = i;
 
-				printk(KERN_CONT ".");
+				pr_cont(".");
 			} else {
-				printk(KERN_CONT "O");
+				pr_cont("O");
 			}
 		}
 
@@ -478,7 +473,7 @@ static int fthd_ddr_calibrate_rd_dqs(struct fthd_private *dev_priv,
 			setting = 63;
 		settings[bit] = setting;
 
-		printk(KERN_CONT " : start=%d end=%d len=%d new=%d\n", pass_start[bit],
+		pr_cont(" : start=%d end=%d len=%d new=%d\n", pass_start[bit],
 		       pass_end[bit], pass_len[bit], settings[bit]);
 	}
 
diff --git a/drivers/media/pci/facetimehd/fthd_ddr.h b/drivers/media/pci/facetimehd/fthd_ddr.h
index 162e7c343ab7..c31acd5b3bda 100644
--- a/drivers/media/pci/facetimehd/fthd_ddr.h
+++ b/drivers/media/pci/facetimehd/fthd_ddr.h
@@ -1,5 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Broadcom PCIe 1570 webcam driver
+ * FacetimeHD camera driver
  *
  * Copyright (C) 2014 Patrik Jakobsson (patrik.r.jakobsson@gmail.com)
  *
@@ -20,6 +21,8 @@
 #ifndef _FTHD_DDR_H
 #define _FTHD_DDR_H
 
+#include "fthd_drv.h"
+
 #define MEM_VERIFY_BASE		0x0 /* 0x1000000 */
 #define MEM_VERIFY_NUM		128
 #define MEM_VERIFY_NUM_FULL	(1 * 1024 * 1024)
diff --git a/drivers/media/pci/facetimehd/fthd_debugfs.c b/drivers/media/pci/facetimehd/fthd_debugfs.c
index 50ab5a75f14c..4807864a9f49 100644
--- a/drivers/media/pci/facetimehd/fthd_debugfs.c
+++ b/drivers/media/pci/facetimehd/fthd_debugfs.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2015 Sven Schnelle <svens@stackframe.org>
@@ -93,7 +92,7 @@ static int seq_channel_read(struct seq_file *seq, struct fthd_private *dev_priv,
 	u32 entry;
 
 	spin_lock_irq(&chan->lock);
-	for( i = 0; i < chan->size; i++) {
+	for (i = 0; i < chan->size; i++) {
 		if (chan->ringbuf.idx == i)
 			pos = '*';
 		else
@@ -113,6 +112,7 @@ static int seq_channel_terminal_read(struct seq_file *seq, void *data)
 
 {
 	struct fthd_private *dev_priv = dev_get_drvdata(seq->private);
+
 	return seq_channel_read(seq, dev_priv, dev_priv->channel_terminal);
 }
 
@@ -120,6 +120,7 @@ static int seq_channel_sharedmalloc_read(struct seq_file *seq, void *data)
 
 {
 	struct fthd_private *dev_priv = dev_get_drvdata(seq->private);
+
 	return seq_channel_read(seq, dev_priv, dev_priv->channel_shared_malloc);
 }
 
@@ -127,6 +128,7 @@ static int seq_channel_io_read(struct seq_file *seq, void *data)
 
 {
 	struct fthd_private *dev_priv = dev_get_drvdata(seq->private);
+
 	return seq_channel_read(seq, dev_priv, dev_priv->channel_io);
 }
 
@@ -134,6 +136,7 @@ static int seq_channel_io_t2h_read(struct seq_file *seq, void *data)
 
 {
 	struct fthd_private *dev_priv = dev_get_drvdata(seq->private);
+
 	return seq_channel_read(seq, dev_priv, dev_priv->channel_io_t2h);
 }
 
@@ -141,6 +144,7 @@ static int seq_channel_buf_h2t_read(struct seq_file *seq, void *data)
 
 {
 	struct fthd_private *dev_priv = dev_get_drvdata(seq->private);
+
 	return seq_channel_read(seq, dev_priv, dev_priv->channel_buf_h2t);
 }
 
@@ -148,6 +152,7 @@ static int seq_channel_buf_t2h_read(struct seq_file *seq, void *data)
 
 {
 	struct fthd_private *dev_priv = dev_get_drvdata(seq->private);
+
 	return seq_channel_read(seq, dev_priv, dev_priv->channel_buf_t2h);
 }
 
@@ -155,6 +160,7 @@ static int seq_channel_debug_read(struct seq_file *seq, void *data)
 
 {
 	struct fthd_private *dev_priv = dev_get_drvdata(seq->private);
+
 	return seq_channel_read(seq, dev_priv, dev_priv->channel_debug);
 }
 
@@ -187,7 +193,7 @@ int fthd_debugfs_init(struct fthd_private *dev_priv)
 	debugfs_create_devm_seqfile(&dev_priv->pdev->dev, "channel_buf_h2t", d, seq_channel_buf_h2t_read);
 	debugfs_create_devm_seqfile(&dev_priv->pdev->dev, "channel_buf_t2h", d, seq_channel_buf_t2h_read);
 	debugfs_create_devm_seqfile(&dev_priv->pdev->dev, "channel_debug", d, seq_channel_debug_read);
-	debugfs_create_file("debug", S_IRUSR | S_IWUSR, d, dev_priv, &fops_debug);
+	debugfs_create_file("debug", 0600, d, dev_priv, &fops_debug);
 	dev_priv->debugfs = top;
 	return 0;
 }
diff --git a/drivers/media/pci/facetimehd/fthd_debugfs.h b/drivers/media/pci/facetimehd/fthd_debugfs.h
index d3f8b74239e4..f665117abdc5 100644
--- a/drivers/media/pci/facetimehd/fthd_debugfs.h
+++ b/drivers/media/pci/facetimehd/fthd_debugfs.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2015 Sven Schnelle <svens@stackframe.org>
diff --git a/drivers/media/pci/facetimehd/fthd_drv.c b/drivers/media/pci/facetimehd/fthd_drv.c
index c8d715122e5f..f991d08a8a31 100644
--- a/drivers/media/pci/facetimehd/fthd_drv.c
+++ b/drivers/media/pci/facetimehd/fthd_drv.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2014 Patrik Jakobsson (patrik.r.jakobsson@gmail.com)
@@ -11,10 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/version.h>
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5,4,0)
-#include <linux/pci-aspm.h>
-#endif
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/workqueue.h>
@@ -97,7 +92,7 @@ static void sharedmalloc_handler(struct fthd_private *dev_priv,
 
 	request_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_REQUEST_SIZE);
 	response_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_RESPONSE_SIZE);
-	address = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_ADDRESS_FLAGS) & ~ 3;
+	address = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_ADDRESS_FLAGS) & ~3;
 
 	if (address) {
 		pr_debug("Firmware wants to free memory at %08x\n", address);
@@ -106,7 +101,7 @@ static void sharedmalloc_handler(struct fthd_private *dev_priv,
 
 		ret = fthd_channel_ringbuf_send(dev_priv, chan, 0, 0, 0, NULL);
 		if (ret)
-			pr_err("%s: fthd_channel_ringbuf_send: %d\n", __FUNCTION__, ret);
+			pr_err("%s: fthd_channel_ringbuf_send: %d\n", __func__, ret);
 	} else {
 		if (!request_size)
 			return;
@@ -115,12 +110,12 @@ static void sharedmalloc_handler(struct fthd_private *dev_priv,
 			return;
 
 		pr_debug("Firmware allocated %d bytes at %08lx (tag %c%c%c%c)\n", request_size, obj->offset,
-			 response_size >> 24,response_size >> 16,
+			 response_size >> 24, response_size >> 16,
 			 response_size >> 8, response_size);
 		FTHD_S2_MEMCPY_TOIO(obj->offset, &obj, sizeof(obj));
 		ret = fthd_channel_ringbuf_send(dev_priv, chan, obj->offset + 64, 0, 0, NULL);
 		if (ret)
-			pr_err("%s: fthd_channel_ringbuf_send: %d\n", __FUNCTION__, ret);
+			pr_err("%s: fthd_channel_ringbuf_send: %d\n", __func__, ret);
 
 	}
 
@@ -136,7 +131,7 @@ static void terminal_handler(struct fthd_private *dev_priv,
 
 	request_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_REQUEST_SIZE);
 	response_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_RESPONSE_SIZE);
-	address = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_ADDRESS_FLAGS) & ~ 3;
+	address = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_ADDRESS_FLAGS) & ~3;
 
 	if (!address || !request_size)
 		return;
@@ -153,6 +148,7 @@ static void buf_t2h_handler(struct fthd_private *dev_priv,
 {
 	u32 request_size, response_size, address;
 	int ret;
+
 	request_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_REQUEST_SIZE);
 	response_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_RESPONSE_SIZE);
 	address = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_ADDRESS_FLAGS);
@@ -165,7 +161,7 @@ static void buf_t2h_handler(struct fthd_private *dev_priv,
 	ret = fthd_channel_ringbuf_send(dev_priv, chan, (response_size & 0x10000000) ? address : 0,
 					0, 0x80000000, NULL);
 	if (ret)
-		pr_err("%s: fthd_channel_ringbuf_send: %d\n", __FUNCTION__, ret);
+		pr_err("%s: fthd_channel_ringbuf_send: %d\n", __func__, ret);
 
 }
 
@@ -174,8 +170,9 @@ static void io_t2h_handler(struct fthd_private *dev_priv,
 				 u32 entry)
 {
 	int ret = fthd_channel_ringbuf_send(dev_priv, chan, 0, 0, 0, NULL);
+
 	if (ret)
-		pr_err("%s: fthd_channel_ringbuf_send: %d\n", __FUNCTION__, ret);
+		pr_err("%s: fthd_channel_ringbuf_send: %d\n", __func__, ret);
 
 }
 
@@ -202,7 +199,7 @@ static void fthd_handle_irq(struct fthd_private *dev_priv, struct fw_channel *ch
 		return;
 	}
 
-	while((entry = fthd_channel_ringbuf_receive(dev_priv, chan)) != (u32)-1) {
+	while ((entry = fthd_channel_ringbuf_receive(dev_priv, chan)) != (u32)-1) {
 		pr_debug("channel %s: message available, address %08x\n", chan->name, FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_ADDRESS_FLAGS));
 		if (chan == dev_priv->channel_shared_malloc) {
 			sharedmalloc_handler(dev_priv, chan, entry);
@@ -210,7 +207,7 @@ static void fthd_handle_irq(struct fthd_private *dev_priv, struct fw_channel *ch
 			terminal_handler(dev_priv, chan, entry);
 			ret = fthd_channel_ringbuf_send(dev_priv, chan, 0, 0, 0, NULL);
 			if (ret)
-				pr_err("%s: fthd_channel_ringbuf_send: %d\n", __FUNCTION__, ret);
+				pr_err("%s: fthd_channel_ringbuf_send: %d\n", __func__, ret);
 		} else if (chan == dev_priv->channel_buf_t2h) {
 			buf_t2h_handler(dev_priv, chan, entry);
 		} else if (chan == dev_priv->channel_io_t2h) {
@@ -232,7 +229,7 @@ static void fthd_irq_work(struct work_struct *work)
 	u32 pending;
 	int i = 0;
 
-	while(i++ < 500) {
+	while (i++ < 500) {
 		spin_lock_irq(&dev_priv->io_lock);
 		pending = FTHD_ISP_REG_READ(ISP_IRQ_STATUS);
 		spin_unlock_irq(&dev_priv->io_lock);
@@ -246,7 +243,7 @@ static void fthd_irq_work(struct work_struct *work)
 		spin_unlock_irq(&dev_priv->io_lock);
 		pci_write_config_dword(dev_priv->pdev, 0x90, 0x200);
 
-		for(i = 0; i < dev_priv->num_channels; i++) {
+		for (i = 0; i < dev_priv->num_channels; i++) {
 			chan = dev_priv->channels[i];
 
 
@@ -396,11 +393,7 @@ static int fthd_pci_init(struct fthd_private *dev_priv)
 		goto fail_irq;
 
 	dev_info(&pdev->dev, "Setting %ubit DMA mask\n", dev_priv->dma_mask);
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5,18,0)
-	pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(dev_priv->dma_mask));
-#else
 	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(dev_priv->dma_mask));
-#endif
 
 	pci_set_master(pdev);
 	pci_set_drvdata(pdev, dev_priv);
@@ -441,7 +434,8 @@ static int fthd_firmware_start(struct fthd_private *dev_priv)
 
 	/* Query the sensor's native resolution now so fthd_v4l2_register()
 	 * can advertise it. Non-fatal: if it fails the V4L2 layer falls back
-	 * to a default size. */
+	 * to a default size.
+	 */
 	fthd_isp_cmd_channel_camera_config(dev_priv);
 
 	return fthd_isp_cmd_set_loadfile(dev_priv);
@@ -457,7 +451,7 @@ static int fthd_pci_probe(struct pci_dev *pdev,
 	dev_info(&pdev->dev, "Found FaceTime HD camera with device id: %x\n",
 		 pdev->device);
 
-	dev_priv = kzalloc(sizeof(struct fthd_private), GFP_KERNEL);
+	dev_priv = kzalloc_obj(struct fthd_private, GFP_KERNEL);
 	if (!dev_priv) {
 		dev_err(&pdev->dev, "Failed to allocate memory\n");
 		return -ENOMEM;
diff --git a/drivers/media/pci/facetimehd/fthd_drv.h b/drivers/media/pci/facetimehd/fthd_drv.h
index 439143fd337d..bed989a40617 100644
--- a/drivers/media/pci/facetimehd/fthd_drv.h
+++ b/drivers/media/pci/facetimehd/fthd_drv.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2014 Patrik Jakobsson (patrik.r.jakobsson@gmail.com)
@@ -14,7 +13,6 @@
 #include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/mutex.h>
-#include <linux/version.h>
 #include <media/videobuf2-dma-sg.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -30,9 +28,9 @@
 #define FTHD_BUFFERS 4
 
 enum FW_CHAN_TYPE {
-	FW_CHAN_TYPE_OUT=0,
-	FW_CHAN_TYPE_IN=1,
-	FW_CHAN_TYPE_UNI_IN=2,
+	FW_CHAN_TYPE_OUT = 0,
+	FW_CHAN_TYPE_IN = 1,
+	FW_CHAN_TYPE_UNI_IN = 2,
 };
 
 struct fw_channel {
@@ -105,7 +103,8 @@ struct fthd_private {
 	int sensor_id1;
 	/* Native sensor resolution, read from the firmware's per-channel camera
 	 * config. MacBookPro sensors report 1280x720; the 12-inch MacBook
-	 * (MacBook8,1, sensor 1675) reports 848x588. 0 until detected. */
+	 * (MacBook8,1, sensor 1675) reports 848x588. 0 until detected.
+	 */
 	unsigned int sensor_width;
 	unsigned int sensor_height;
 
@@ -114,9 +113,6 @@ struct fthd_private {
 	struct vb2_queue vb2_queue;
 	struct mutex vb2_queue_lock;
 	struct list_head buffer_queue;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(4,8,0)
-	struct vb2_alloc_ctx *alloc_ctx;
-#endif
 	struct h2t_buf_ctx h2t_bufs[FTHD_BUFFERS];
 
 	struct v4l2_ctrl_handler v4l2_ctrl_handler;
diff --git a/drivers/media/pci/facetimehd/fthd_hw.c b/drivers/media/pci/facetimehd/fthd_hw.c
index 8180072922d4..2c04392f3dfe 100644
--- a/drivers/media/pci/facetimehd/fthd_hw.c
+++ b/drivers/media/pci/facetimehd/fthd_hw.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2014 Patrik Jakobsson (patrik.r.jakobsson@gmail.com)
@@ -12,6 +11,7 @@
 #include "fthd_hw.h"
 #include "fthd_ddr.h"
 #include "fthd_isp.h"
+#include "fthd_reg.h"
 
 static int fthd_hw_s2_pll_reset(struct fthd_private *dev_priv)
 {
@@ -20,7 +20,7 @@ static int fthd_hw_s2_pll_reset(struct fthd_private *dev_priv)
 	FTHD_S2_REG_WRITE(0xbcbc1500, S2_PLL_CTRL_100);
 	FTHD_S2_REG_WRITE(0x0, S2_PLL_CTRL_14);
 
-	udelay(10000);
+	mdelay(10);
 
 	FTHD_S2_REG_WRITE(0x3, S2_PLL_CTRL_14);
 
@@ -142,14 +142,14 @@ static int fthd_hw_s2_pll_init(struct fthd_private *dev_priv, u32 ddr_speed)
 		dev_info(&dev_priv->pdev->dev, "Failed to lock S2 PLL: 0x%x\n",
 			 reg);
 		return -EINVAL;
-	} else {
-		dev_info(&dev_priv->pdev->dev, "S2 PLL is locked after %d us\n",
-			 (retries * 10));
 	}
 
+	dev_info(&dev_priv->pdev->dev, "S2 PLL is locked after %d us\n",
+			(retries * 10));
+
 	reg = FTHD_S2_REG_READ(S2_PLL_STATUS_A8);
 	FTHD_S2_REG_WRITE(reg | S2_PLL_BYPASS, S2_PLL_STATUS_A8);
-	udelay(10000);
+	mdelay(10);
 
 	reg = FTHD_S2_REG_READ(S2_PLL_STATUS_A8);
 	if (reg & S2_PLL_BYPASS)
@@ -182,7 +182,7 @@ static int fthd_hw_ddr_phy_soft_reset(struct fthd_private *dev_priv)
 
 	FTHD_S2_REG_WRITE(0xfffff, S2_PLL_CTRL_9C);
 
-	udelay(10000);
+	mdelay(10);
 
 	FTHD_S2_REG_WRITE(0xffbff, S2_PLL_CTRL_9C);
 
@@ -323,7 +323,7 @@ static int fthd_hw_s2_init_ddr_controller_soc(struct fthd_private *dev_priv)
 		return -EIO;
 	}
 
-	udelay(10000);
+	mdelay(10);
 
 	/* WL */
 	FTHD_S2_REG_WRITE(0x0c10, S2_DDR40_PHY_PLL_DIV);
@@ -397,10 +397,10 @@ static int fthd_hw_s2_init_ddr_controller_soc(struct fthd_private *dev_priv)
 		dev_err(&dev_priv->pdev->dev,
 			"Timeout waiting for STRAP valid\n");
 		return -ENODEV;
-	} else {
-		dev_info(&dev_priv->pdev->dev, "STRAP valid\n");
 	}
 
+	dev_info(&dev_priv->pdev->dev, "STRAP valid\n");
+
 	/* Manual DDR40 PHY init */
 	if (dev_priv->ddr_speed != 450) {
 		dev_warn(&dev_priv->pdev->dev,
@@ -565,7 +565,7 @@ static int fthd_hw_s2_init_ddr_controller_soc(struct fthd_private *dev_priv)
 	udelay(500);
 
 	FTHD_S2_REG_WRITE(0, S2_DDR_2004);
-	udelay(10000);
+	mdelay(10);
 
 	FTHD_S2_REG_WRITE(0xab0a, S2_DDR_2014);
 
@@ -574,7 +574,7 @@ static int fthd_hw_s2_init_ddr_controller_soc(struct fthd_private *dev_priv)
 	if (ret != 0)
 		return -EBUSY;
 
-	udelay(10000);
+	mdelay(10);
 
 	FTHD_S2_REG_WRITE(0, S2_3204);
 
@@ -652,35 +652,34 @@ int fthd_hw_init(struct fthd_private *dev_priv)
 
 	ret = fthd_hw_s2_init_pcie_link(dev_priv);
 	if (ret)
-		goto out;
+		return ret;
 
 	fthd_hw_s2_preinit_ddr_controller_soc(dev_priv);
 	fthd_hw_s2_init_ddr_controller_soc(dev_priv);
 
-/*
-	dev_info(&dev_priv->pdev->dev,
+	dev_dbg(&dev_priv->pdev->dev,
 		 "Dumping DDR PHY reg map before shmoo\n");
 
-	for (i = 0; i < DDR_PHY_NUM_REGS; i++) {
+	for (int i = 0; i < ARRAY_SIZE(fthd_ddr_phy_reg_map); i++) {
 		if (!(i % 3) && i >  0)
-			printk("\n");
+			dev_dbg(&dev_priv->pdev->dev, "\n");
 
-		val = FTHD_S2_REG_READ(ddr_phy_reg_map[i]);
-		printk(KERN_CONT "0x%.3x = 0x%.8x\t",
-			 ddr_phy_reg_map[i], val);
+		int val = FTHD_S2_REG_READ(fthd_ddr_phy_reg_map[i]);
+
+		pr_cont("0x%.3x = 0x%.8x\t",
+			 fthd_ddr_phy_reg_map[i], val);
 	}
-*/
 
 	ret = fthd_ddr_verify_mem(dev_priv, 0, MEM_VERIFY_NUM);
 	if (ret) {
-		dev_err(&dev_priv->pdev->dev,
-			"Full memory verification failed! (%d)\n", ret);
-		/*
-		 * Here we should do a shmoo calibration but it's not yet
-		 * fully implemented.
-		 */
+		dev_warn(&dev_priv->pdev->dev,
+			"Full memory verification failed, calibrating. (%d)\n", ret);
 
-		/* fthd_ddr_calibrate(dev_priv); */
+		ret = fthd_ddr_calibrate(dev_priv);
+		if (ret) {
+			dev_err(&dev_priv->pdev->dev,
+				"Calibration failed! (%d)\n", ret);
+		}
 	} else {
 		dev_info(&dev_priv->pdev->dev,
 			 "Full memory verification succeeded! (%d)\n", ret);
@@ -696,17 +695,16 @@ int fthd_hw_init(struct fthd_private *dev_priv)
 
 	ret = isp_init(dev_priv);
 	if (ret)
-	    goto out;
+		return ret;
 
 	dev_info(&dev_priv->pdev->dev, "Enabling interrupts\n");
 	fthd_irq_enable(dev_priv);
-out:
+
 	return ret;
 }
 
 void fthd_hw_deinit(struct fthd_private *dev_priv)
 {
-	dev_info(&dev_priv->pdev->dev, "%s", __FUNCTION__);
 	FTHD_ISP_REG_WRITE(0, ISP_REG_41020);
 	fthd_irq_disable(dev_priv);
 }
diff --git a/drivers/media/pci/facetimehd/fthd_hw.h b/drivers/media/pci/facetimehd/fthd_hw.h
index 58d802488f67..ea91847462e0 100644
--- a/drivers/media/pci/facetimehd/fthd_hw.h
+++ b/drivers/media/pci/facetimehd/fthd_hw.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2014 Patrik Jakobsson (patrik.r.jakobsson@gmail.com)
@@ -11,6 +10,7 @@
 #define _FTHD_HW_H
 
 #include <linux/pci.h>
+#include "fthd_drv.h"
 
 /* Used after most PCI Link IO writes */
 static inline void fthd_hw_pci_post(struct fthd_private *dev_priv)
diff --git a/drivers/media/pci/facetimehd/fthd_isp.c b/drivers/media/pci/facetimehd/fthd_isp.c
index bef1cd4b03c3..d721925f3664 100644
--- a/drivers/media/pci/facetimehd/fthd_isp.c
+++ b/drivers/media/pci/facetimehd/fthd_isp.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2014 Patrik Jakobsson (patrik.r.jakobsson@gmail.com)
@@ -22,9 +21,9 @@ int isp_mem_init(struct fthd_private *dev_priv)
 {
 	struct resource *root = &dev_priv->pdev->resource[FTHD_PCI_S2_MEM];
 
-        dev_priv->mem = kzalloc(sizeof(struct resource), GFP_KERNEL);
+	dev_priv->mem = kzalloc_obj(struct resource, GFP_KERNEL);
 	if (!dev_priv->mem)
-	    return -ENOMEM;
+		return -ENOMEM;
 
 	dev_priv->mem->start = root->start;
 	dev_priv->mem->end = root->end;
@@ -48,7 +47,7 @@ struct isp_mem_obj *isp_mem_create(struct fthd_private *dev_priv,
 	struct resource *root = dev_priv->mem;
 	int ret;
 
-	obj = kzalloc(sizeof(struct isp_mem_obj), GFP_KERNEL);
+	obj = kzalloc_obj(struct isp_mem_obj, GFP_KERNEL);
 	if (!obj)
 		return NULL;
 
@@ -58,7 +57,7 @@ struct isp_mem_obj *isp_mem_create(struct fthd_private *dev_priv,
 				PAGE_SIZE, NULL, NULL);
 	if (ret) {
 		dev_err(&dev_priv->pdev->dev,
-			"Failed to allocate resource (size: %Ld, start: %Ld, end: %Ld)\n",
+			"Failed to allocate resource (size: %lld, start: %lld, end: %lld)\n",
 			size, root->start, root->end);
 		kfree(obj);
 		obj = NULL;
@@ -93,7 +92,7 @@ static int isp_acpi_set_power(struct fthd_private *dev_priv, int power)
 
 
 	handle = ACPI_HANDLE(&dev_priv->pdev->dev);
-	if(!handle) {
+	if (!handle) {
 		dev_err(&dev_priv->pdev->dev,
 			"Failed to get S2 CMPE ACPI handle\n");
 		ret = -ENODEV;
@@ -118,7 +117,7 @@ static int isp_acpi_set_power(struct fthd_private *dev_priv, int power)
 
 	if (result->type != ACPI_TYPE_INTEGER || result->integer.value != 0) {
 		dev_err(&dev_priv->pdev->dev,
-			"Invalid ACPI response (len: %Ld)\n", buffer.length);
+			"Invalid ACPI response (len: %lld)\n", buffer.length);
 		ret = -EINVAL;
 	}
 
@@ -180,7 +179,8 @@ static void isp_free_channel_info(struct fthd_private *priv)
 {
 	struct fw_channel *chan;
 	int i;
-	for(i = 0; i < priv->num_channels; i++) {
+
+	for (i = 0; i < priv->num_channels; i++) {
 		chan = priv->channels[i];
 		if (!chan)
 			continue;
@@ -196,7 +196,8 @@ static void isp_free_channel_info(struct fthd_private *priv)
 static struct fw_channel *isp_get_chan_index(struct fthd_private *priv, const char *name)
 {
 	int i;
-	for(i = 0; i < priv->num_channels; i++) {
+
+	for (i = 0; i < priv->num_channels; i++) {
 		if (!strcasecmp(priv->channels[i]->name, name))
 			return priv->channels[i];
 	}
@@ -212,16 +213,16 @@ static int isp_fill_channel_info(struct fthd_private *dev_priv, int offset, int
 	if (!num_channels)
 		return -EINVAL;
 
-	dev_priv->channels = kzalloc(num_channels * sizeof(struct fw_channel *), GFP_KERNEL);
+	dev_priv->channels = kzalloc_objs(struct fw_channel *, num_channels, GFP_KERNEL);
 	if (!dev_priv->channels)
 		goto out;
 
 	dev_priv->num_channels = num_channels;
 
-	for(i = 0; i < num_channels; i++) {
+	for (i = 0; i < num_channels; i++) {
 		FTHD_S2_MEMCPY_FROMIO(&info, offset + i * 256, sizeof(info));
 
-		chan = kzalloc(sizeof(struct fw_channel), GFP_KERNEL);
+		chan = kzalloc_obj(struct fw_channel, GFP_KERNEL);
 		if (!chan)
 			goto out;
 
@@ -274,11 +275,11 @@ static int fthd_isp_cmd(struct fthd_private *dev_priv, enum fthd_isp_cmds comman
 
 	memset(&cmd, 0, sizeof(cmd));
 
-	if (response_len) {
+	if (response_len)
 		len = max(request_len, *response_len);
-	} else {
+	else
 		len = request_len;
-	}
+
 	len += sizeof(struct isp_cmd_hdr);
 
 	pr_debug("sending cmd %d to firmware\n", command);
@@ -311,7 +312,7 @@ static int fthd_isp_cmd(struct fthd_private *dev_priv, enum fthd_isp_cmds comman
 		goto out;
 	}
 
-        ret = fthd_channel_wait_ready(dev_priv, dev_priv->channel_io, entry, 2000);
+	ret = fthd_channel_wait_ready(dev_priv, dev_priv->channel_io, entry, 2000);
 	if (ret) {
 		if (response_len)
 			*response_len = 0;
@@ -323,8 +324,9 @@ static int fthd_isp_cmd(struct fthd_private *dev_priv, enum fthd_isp_cmds comman
 	request_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_REQUEST_SIZE);
 	response_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_RESPONSE_SIZE);
 
-	/* XXX: response size in the ringbuf is zero after command completion, how is buffer size
-	        verification done? */
+	/* XXX: response size in the ringbuf is zero after command completion,
+	 * how is buffer size verification done?
+	 */
 	if (response_len && *response_len)
 		FTHD_S2_MEMCPY_FROMIO(buf, (address & ~3) + sizeof(struct isp_cmd_hdr),
 				     *response_len);
@@ -349,11 +351,11 @@ int fthd_isp_debug_cmd(struct fthd_private *dev_priv, enum fthd_isp_cmds command
 
 	memset(&cmd, 0, sizeof(cmd));
 
-	if (response_len) {
+	if (response_len)
 		len = max(request_len, *response_len);
-	} else {
+	else
 		len = request_len;
-	}
+
 	len += sizeof(struct isp_cmd_hdr);
 
 	pr_debug("sending debug cmd %d to firmware\n", command);
@@ -380,7 +382,7 @@ int fthd_isp_debug_cmd(struct fthd_private *dev_priv, enum fthd_isp_cmds command
 		goto out;
 	}
 
-        ret = fthd_channel_wait_ready(dev_priv, dev_priv->channel_debug, entry, 20000);
+	ret = fthd_channel_wait_ready(dev_priv, dev_priv->channel_debug, entry, 20000);
 	if (ret) {
 		if (response_len)
 			*response_len = 0;
@@ -392,8 +394,9 @@ int fthd_isp_debug_cmd(struct fthd_private *dev_priv, enum fthd_isp_cmds command
 	request_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_REQUEST_SIZE);
 	response_size = FTHD_S2_MEM_READ(entry + FTHD_RINGBUF_RESPONSE_SIZE);
 
-	/* XXX: response size in the ringbuf is zero after command completion, how is buffer size
-	        verification done? */
+	/* XXX: response size in the ringbuf is zero after command completion,
+	 * how is buffer size verification done?
+	 */
 	if (response_len && *response_len)
 		FTHD_S2_MEMCPY_FROMIO(buf, (address & ~3) + sizeof(struct isp_cmd_hdr),
 				     *response_len);
@@ -418,6 +421,7 @@ int fthd_isp_cmd_start(struct fthd_private *dev_priv)
 int fthd_isp_cmd_channel_start(struct fthd_private *dev_priv)
 {
 	struct isp_cmd_channel_start cmd;
+
 	pr_debug("sending channel start cmd to firmware\n");
 
 	cmd.channel = 0;
@@ -530,7 +534,7 @@ int fthd_isp_cmd_set_loadfile(struct fthd_private *dev_priv)
 
 	memset(&cmd, 0, sizeof(cmd));
 
-	switch(dev_priv->sensor_id1) {
+	switch (dev_priv->sensor_id1) {
 	case 0x164:
 		filename = "facetimehd/8221_01XX.dat";
 		break;
@@ -547,7 +551,7 @@ int fthd_isp_cmd_set_loadfile(struct fthd_private *dev_priv)
 			break;
 		}
 
-		switch(dev_priv->sensor_id0) {
+		switch (dev_priv->sensor_id0) {
 		case 4:
 			filename = "facetimehd/1874_01XX.dat";
 			break;
@@ -557,7 +561,7 @@ int fthd_isp_cmd_set_loadfile(struct fthd_private *dev_priv)
 		}
 		break;
 	case 0x9774:
-		switch(dev_priv->sensor_id0) {
+		switch (dev_priv->sensor_id0) {
 		case 4:
 			filename = "facetimehd/1674_01XX.dat";
 			break;
@@ -582,8 +586,10 @@ int fthd_isp_cmd_set_loadfile(struct fthd_private *dev_priv)
 
 	/* The set file is allowed to be missing but we don't get calibration */
 	ret = request_firmware(&fw, filename, &dev_priv->pdev->dev);
-	if (ret)
+	if (ret) {
+		pr_info("Firmware set file %s not found, no calibration possible\n", filename);
 		return 0;
+	}
 
 	/* Firmware memory is preallocated at init time */
 	BUG_ON(dev_priv->set_file);
@@ -650,10 +656,11 @@ int fthd_isp_cmd_channel_camera_config(struct fthd_private *dev_priv)
 	struct isp_cmd_channel_camera_config cmd;
 	int ret, len, i;
 	char prefix[16];
+
 	pr_debug("sending ch camera config\n");
 
 	memset(&cmd, 0, sizeof(cmd));
-	for(i = 0; i < dev_priv->sensor_count; i++) {
+	for (i = 0; i < dev_priv->sensor_count; i++) {
 		cmd.channel = i;
 
 		len = sizeof(cmd);
@@ -667,7 +674,8 @@ int fthd_isp_cmd_channel_camera_config(struct fthd_private *dev_priv)
 		 * native width and height (e.g. 1280x720 on MacBookPro,
 		 * 848x588 on the 12-inch MacBook). Record sensor 0's size so
 		 * the V4L2 layer can advertise the real resolution instead of
-		 * a hardcoded one. */
+		 * a hardcoded one.
+		 */
 		if (i == 0) {
 			unsigned int w = cmd.data[0] | (cmd.data[1] << 8);
 			unsigned int h = cmd.data[2] | (cmd.data[3] << 8);
@@ -1148,7 +1156,8 @@ int fthd_start_channel(struct fthd_private *dev_priv, int channel)
 	/* Crop the full sensor area. The 12-inch MacBook (MacBook8,1, sensor
 	 * 1675) reports an 848x588 sensor via CISP_CMD_CH_CAMERA_CONFIG_GET;
 	 * the old hardcoded 1280x720 crop exceeds that array and makes the
-	 * sensor interface throw SIF errors. Use the negotiated format size. */
+	 * sensor interface throw SIF errors. Use the negotiated format size.
+	 */
 	x1 = 0;
 	x2 = dev_priv->fmt.fmt.width;
 
@@ -1157,7 +1166,7 @@ int fthd_start_channel(struct fthd_private *dev_priv, int channel)
 	if (ret)
 		return ret;
 
-	switch(dev_priv->fmt.fmt.pixelformat) {
+	switch (dev_priv->fmt.fmt.pixelformat) {
 	case V4L2_PIX_FMT_YUYV:
 		pixelformat = 1;
 		break;
diff --git a/drivers/media/pci/facetimehd/fthd_isp.h b/drivers/media/pci/facetimehd/fthd_isp.h
index b12108f65193..29c744e5cb18 100644
--- a/drivers/media/pci/facetimehd/fthd_isp.h
+++ b/drivers/media/pci/facetimehd/fthd_isp.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2014 Patrik Jakobsson (patrik.r.jakobsson@gmail.com)
@@ -10,6 +9,10 @@
 #ifndef _ISP_H
 #define _ISP_H
 
+#include <linux/types.h>
+#include <linux/ioport.h>
+#include "fthd_drv.h"
+
 /* ISP memory types */
 #define FTHD_MEM_FIRMWARE	1
 #define FTHD_MEM_HEAP		2
@@ -438,7 +441,7 @@ enum fthd_isp_cmds {
 };
 
 enum isp_debug_cmds {
-	CISP_CMD_DEBUG_BANNER=0,
+	CISP_CMD_DEBUG_BANNER = 0,
 	CISP_CMD_DEBUG_NOP1,
 	CISP_CMD_DEBUG_NOP2,
 	CISP_CMD_DEBUG_PS,
@@ -494,11 +497,11 @@ struct isp_cmd_hdr {
 	u32 unknown0;
 	u16 opcode;
 	u16 status;
-} __attribute__((packed));
+} __packed;
 
 struct isp_cmd_print_enable {
 	u32 enable;
-} __attribute__((packed));
+} __packed;
 
 struct isp_cmd_config {
 	u32 field0;
@@ -509,13 +512,13 @@ struct isp_cmd_config {
 	u32 field14;
 	u32 field18;
 	u32 field1c;
-} __attribute__((packed));
+} __packed;
 
 struct isp_cmd_set_loadfile {
 	u32 unknown;
 	u32 addr;
 	u32 length;
-} __attribute__((packed));
+} __packed;
 
 struct isp_cmd_channel_info {
 	u32 field_0;
@@ -534,7 +537,7 @@ struct isp_cmd_channel_info {
 	u8 unknown2[40];
 	u8 sensor_serial_number[8];
 	u8 camera_module_serial_number[18];
-} __attribute__((packed));
+} __packed;
 
 struct isp_cmd_channel_camera_config {
 	u32 unknown;
diff --git a/drivers/media/pci/facetimehd/fthd_reg.h b/drivers/media/pci/facetimehd/fthd_reg.h
index 27da24a4a1d3..6937e61f3e76 100644
--- a/drivers/media/pci/facetimehd/fthd_reg.h
+++ b/drivers/media/pci/facetimehd/fthd_reg.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2014 Patrik Jakobsson (patrik.r.jakobsson@gmail.com)
diff --git a/drivers/media/pci/facetimehd/fthd_ringbuf.c b/drivers/media/pci/facetimehd/fthd_ringbuf.c
index 7b099ae56379..2dc6db323d3b 100644
--- a/drivers/media/pci/facetimehd/fthd_ringbuf.c
+++ b/drivers/media/pci/facetimehd/fthd_ringbuf.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2015 Sven Schnelle <svens@stackframe.org>
@@ -15,7 +14,6 @@
 #include "fthd_drv.h"
 #include "fthd_hw.h"
 #include "fthd_ringbuf.h"
-#include "fthd_isp.h"
 
 u32 get_entry_addr(struct fthd_private *dev_priv,
 			  struct fw_channel *chan, int num)
@@ -29,7 +27,7 @@ void fthd_channel_ringbuf_dump(struct fthd_private *dev_priv, struct fw_channel
 	char pos;
 	int i;
 
-	for( i = 0; i < chan->size; i++) {
+	for (i = 0; i < chan->size; i++) {
 		if (chan->ringbuf.idx == i)
 			pos = '*';
 		else
@@ -55,7 +53,7 @@ void fthd_channel_ringbuf_init(struct fthd_private *dev_priv, struct fw_channel
 			 chan->name, chan->offset, chan->size);
 
 		spin_lock_irq(&chan->lock);
-		for(i = 0; i < chan->size; i++) {
+		for (i = 0; i < chan->size; i++) {
 			entry = get_entry_addr(dev_priv, chan, i);
 			FTHD_S2_MEM_WRITE(1, entry + FTHD_RINGBUF_ADDRESS_FLAGS);
 			FTHD_S2_MEM_WRITE(0, entry + FTHD_RINGBUF_REQUEST_SIZE);
@@ -86,7 +84,7 @@ int fthd_channel_ringbuf_send(struct fthd_private *dev_priv, struct fw_channel *
 
 	FTHD_S2_MEM_WRITE(request_size, entry + FTHD_RINGBUF_REQUEST_SIZE);
 	FTHD_S2_MEM_WRITE(response_size, entry + FTHD_RINGBUF_RESPONSE_SIZE);
-	wmb();
+	wmb(); /* Force write to request size and response size buffers */
 	FTHD_S2_MEM_WRITE(data_offset | (chan->type == 0 ? 0 : 1),
 			  entry + FTHD_RINGBUF_ADDRESS_FLAGS);
 	spin_unlock_irq(&chan->lock);
diff --git a/drivers/media/pci/facetimehd/fthd_ringbuf.h b/drivers/media/pci/facetimehd/fthd_ringbuf.h
index a59fb5e0e21c..2adfe4f2d1ce 100644
--- a/drivers/media/pci/facetimehd/fthd_ringbuf.h
+++ b/drivers/media/pci/facetimehd/fthd_ringbuf.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2015 Sven Schnelle <svens@stackframe.org>
@@ -10,6 +9,8 @@
 #ifndef _FTHD_RINGBUF_H
 #define _FTHD_RINGBUF_H
 
+#include <linux/types.h>
+
 #define FTHD_RINGBUF_ENTRY_SIZE 64
 
 #define FTHD_RINGBUF_ADDRESS_FLAGS 0
@@ -17,8 +18,8 @@
 #define FTHD_RINGBUF_RESPONSE_SIZE 8
 
 enum ringbuf_type_t {
-	RINGBUF_TYPE_H2T=0,
-	RINGBUF_TYPE_T2H=1,
+	RINGBUF_TYPE_H2T = 0,
+	RINGBUF_TYPE_T2H = 1,
 	RINGBUF_TYPE_UNIDIRECTIONAL,
 };
 
@@ -31,7 +32,7 @@ struct fw_channel;
 struct fthd_private;
 extern void fthd_channel_ringbuf_dump(struct fthd_private *dev_priv, struct fw_channel *chan);
 extern void fthd_channel_ringbuf_init(struct fthd_private *dev_priv, struct fw_channel *chan);
-extern u32 fthd_channel_ringbuf_get_entry(struct fthd_private *, struct fw_channel *);
+extern u32 fthd_channel_ringbuf_get_entry(struct fthd_private *dev_priv, struct fw_channel *chan);
 extern int fthd_channel_ringbuf_send(struct fthd_private *dev_priv, struct fw_channel *chan,
 				     u32 data_offset, u32 request_size, u32 response_size, u32 *entry);
 
diff --git a/drivers/media/pci/facetimehd/fthd_v4l2.c b/drivers/media/pci/facetimehd/fthd_v4l2.c
index 11414473f7f0..46c70c76cf7d 100644
--- a/drivers/media/pci/facetimehd/fthd_v4l2.c
+++ b/drivers/media/pci/facetimehd/fthd_v4l2.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2015 Sven Schnelle <svens@stackframe.org>
@@ -12,7 +11,6 @@
 #include <linux/sched.h>
 #include <linux/wait.h>
 #include <linux/delay.h>
-#include <linux/version.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-ioctl.h>
@@ -26,34 +24,23 @@
 #include "fthd_buffer.h"
 
 /* Fallback ceiling used only if the sensor's native size wasn't detected.
- * The real per-device limit is dev_priv->sensor_width/height. */
+ * The real per-device limit is dev_priv->sensor_width/height.
+ */
 #define FTHD_MAX_WIDTH 1280
 #define FTHD_MAX_HEIGHT 720
 #define FTHD_MIN_WIDTH 320
 #define FTHD_MIN_HEIGHT 240
 #define FTHD_NUM_FORMATS 2 /* NV16 is disabled for now */
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 7, 0)
-# define VFL_TYPE_VIDEO VFL_TYPE_GRABBER
-#endif
-
-static int fthd_buffer_queue_setup(
-    struct vb2_queue *vq,
-#if LINUX_VERSION_CODE < KERNEL_VERSION(4,4,0)
-    const struct v4l2_format *fmt,
-#endif
-#if !(LINUX_VERSION_CODE >= KERNEL_VERSION(4,5,0))
-    const void *parg,
-#endif
-    unsigned int *nbuffers,
-    unsigned int *nplanes,
-    unsigned int sizes[],
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,8,0)
-    struct device *alloc_devs[]
-#else
-    void *alloc_ctxs[]
-#endif
-) {
+static int fthd_buffer_queue_setup
+(
+	struct vb2_queue *vq,
+	unsigned int *nbuffers,
+	unsigned int *nplanes,
+	unsigned int sizes[],
+	struct device *alloc_devs[]
+)
+{
 
 	struct fthd_private *dev_priv = vb2_get_drv_priv(vq);
 	struct v4l2_pix_format *cur_fmt = &dev_priv->fmt.fmt;
@@ -70,11 +57,7 @@ static int fthd_buffer_queue_setup(
 	/* FIXME: We assume single plane format here but not below */
 	for (i = 0; i < *nplanes; i++) {
 		sizes[i] = cur_fmt->sizeimage;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,8,0)
 		alloc_devs[i] = &dev_priv->pdev->dev;
-#else
-		alloc_ctxs[i] = dev_priv->alloc_ctx;
-#endif
 		total_size += sizes[i];
 	}
 
@@ -95,7 +78,7 @@ static void fthd_buffer_cleanup(struct vb2_buffer *vb)
 	int i;
 
 	pr_debug("%p\n", vb);
-	for(i = 0; i < FTHD_BUFFERS; i++) {
+	for (i = 0; i < FTHD_BUFFERS; i++) {
 		if (dev_priv->h2t_bufs[i].vb == vb) {
 			ctx = dev_priv->h2t_bufs + i;
 			break;
@@ -107,7 +90,7 @@ static void fthd_buffer_cleanup(struct vb2_buffer *vb)
 	ctx->state = BUF_FREE;
 	ctx->vb = NULL;
 	isp_mem_destroy(ctx->dma_desc_obj);
-	for(i = 0; i < dev_priv->fmt.planes; i++) {
+	for (i = 0; i < dev_priv->fmt.planes; i++) {
 		iommu_free(dev_priv, ctx->plane[i]);
 		ctx->plane[i] = NULL;
 	}
@@ -125,7 +108,7 @@ static int fthd_send_h2t_buffer(struct fthd_private *dev_priv, struct h2t_buf_ct
 					ctx->dma_desc_obj->offset, 0x180, 0x30000000, &entry);
 
 	if (ret) {
-		pr_err("%s: fthd_channel_ringbuf_send: %d\n", __FUNCTION__, ret);
+		pr_err("%s: fthd_channel_ringbuf_send: %d\n", __func__, ret);
 		return ret;
 	}
 	return fthd_channel_wait_ready(dev_priv, dev_priv->channel_buf_h2t, entry, 2000);
@@ -138,8 +121,9 @@ static void fthd_buffer_queue(struct vb2_buffer *vb)
 	struct h2t_buf_ctx *ctx = NULL;
 
 	int i;
+
 	pr_debug("vb = %p\n", vb);
-	for(i = 0; i < FTHD_BUFFERS; i++) {
+	for (i = 0; i < FTHD_BUFFERS; i++) {
 		if (dev_priv->h2t_bufs[i].vb == vb) {
 			ctx = dev_priv->h2t_bufs + i;
 			break;
@@ -158,7 +142,7 @@ static void fthd_buffer_queue(struct vb2_buffer *vb)
 		list = &ctx->dma_desc_list;
 		list->field0 = 1;
 		ctx->state = BUF_HW_QUEUED;
-		wmb();
+		wmb(); /* Ensure state is set before sending buffer */
 		pr_debug("%d: field0: %d, count %d, pool %d, addr0 0x%08x, addr1 0x%08x tag 0x%08llx vb = %p\n", i, list->field0,
 			 list->desc[i].count, list->desc[i].pool, list->desc[i].addr0, list->desc[i].addr1, list->desc[i].tag, ctx->vb);
 
@@ -167,7 +151,6 @@ static void fthd_buffer_queue(struct vb2_buffer *vb)
 			ctx->state = BUF_ALLOC;
 		}
 	}
-	return;
 }
 
 static int fthd_buffer_prepare(struct vb2_buffer *vb)
@@ -179,7 +162,7 @@ static int fthd_buffer_prepare(struct vb2_buffer *vb)
 	int i;
 
 	pr_debug("%p\n", vb);
-	for(i = 0; i < FTHD_BUFFERS; i++) {
+	for (i = 0; i < FTHD_BUFFERS; i++) {
 		if (dev_priv->h2t_bufs[i].state == BUF_FREE ||
 		    (dev_priv->h2t_bufs[i].state == BUF_ALLOC && dev_priv->h2t_bufs[i].vb == vb)) {
 			ctx = dev_priv->h2t_bufs + i;
@@ -199,11 +182,11 @@ static int fthd_buffer_prepare(struct vb2_buffer *vb)
 		ctx->vb = vb;
 		ctx->state = BUF_ALLOC;
 
-		for(i = 0; i < dev_priv->fmt.planes; i++) {
-		  sgtable = vb2_dma_sg_plane_desc(vb, i);
-		  ctx->plane[i] = iommu_allocate_sgtable(dev_priv, sgtable);
-		  if(!ctx->plane[i])
-			  return -ENOMEM;
+		for (i = 0; i < dev_priv->fmt.planes; i++) {
+			sgtable = vb2_dma_sg_plane_desc(vb, i);
+			ctx->plane[i] = iommu_allocate_sgtable(dev_priv, sgtable);
+			if (!ctx->plane[i])
+				return -ENOMEM;
 		}
 	}
 
@@ -236,7 +219,7 @@ void fthd_buffer_return_handler(struct fthd_private *dev_priv, u32 offset, int s
 
 	FTHD_S2_MEMCPY_FROMIO(&list, offset, sizeof(list));
 
-	for(i = 0; i < list.count; i++) {
+	for (i = 0; i < list.count; i++) {
 		ctx = (struct h2t_buf_ctx *)list.desc[i].tag;
 		pr_debug("%d: field0: %d, count %d, pool %d, addr0 0x%08x, addr1 0x%08x tag 0x%08llx vb = %p, ctx = %p\n", i, list.field0,
 			 list.desc[i].count, list.desc[i].pool, list.desc[i].addr0, list.desc[i].addr1, list.desc[i].tag, ctx->vb, ctx);
@@ -268,7 +251,7 @@ static int fthd_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		return ret;
 
-	for(i = 0; i < FTHD_BUFFERS && count; i++, count--) {
+	for (i = 0; i < FTHD_BUFFERS && count; i++, count--) {
 		ctx = dev_priv->h2t_bufs + i;
 		if (ctx->state != BUF_DRV_QUEUED)
 			continue;
@@ -295,31 +278,27 @@ static void fthd_stop_streaming(struct vb2_queue *vq)
 		pr_debug("done\n");
 	} else {
 	    /* Firmware doesn't respond. */
-	    for(i = 0; i < FTHD_BUFFERS;i++) {
-		    ctx = dev_priv->h2t_bufs + i;
-		    if (ctx->state == BUF_DRV_QUEUED || ctx->state == BUF_HW_QUEUED) {
-			    vb2_buffer_done(ctx->vb, VB2_BUF_STATE_DONE);
-			    ctx->vb = NULL;
-			    ctx->state = BUF_ALLOC;
+		for (i = 0; i < FTHD_BUFFERS; i++) {
+			ctx = dev_priv->h2t_bufs + i;
+			if (ctx->state == BUF_DRV_QUEUED || ctx->state == BUF_HW_QUEUED) {
+				vb2_buffer_done(ctx->vb, VB2_BUF_STATE_DONE);
+				ctx->vb = NULL;
+				ctx->state = BUF_ALLOC;
+			}
 		}
-	    }
 	}
 }
 
-static struct vb2_ops vb2_queue_ops = {
+static const struct vb2_ops vb2_queue_ops = {
 	.queue_setup            = fthd_buffer_queue_setup,
 	.buf_prepare            = fthd_buffer_prepare,
 	.buf_cleanup            = fthd_buffer_cleanup,
 	.start_streaming        = fthd_start_streaming,
 	.stop_streaming         = fthd_stop_streaming,
 	.buf_queue              = fthd_buffer_queue,
-#if LINUX_VERSION_CODE < KERNEL_VERSION(7, 0, 0)
-	.wait_prepare           = vb2_ops_wait_prepare,
-	.wait_finish            = vb2_ops_wait_finish,
-#endif
 };
 
-static struct v4l2_file_operations fthd_vdev_fops = {
+static const struct v4l2_file_operations fthd_vdev_fops = {
 	.owner          = THIS_MODULE,
 	.open           = v4l2_fh_open,
 
@@ -337,7 +316,7 @@ static int fthd_v4l2_ioctl_enum_input(struct file *filp, void *priv,
 		return -EINVAL;
 
 	memset(input, 0, sizeof(*input));
-	strcpy(input->name, "Camera");
+	strscpy(input->name, "Camera", sizeof(input->name));
 	input->type = V4L2_INPUT_TYPE_CAMERA;
 	input->std = 0;
 
@@ -362,8 +341,8 @@ static int fthd_v4l2_ioctl_querycap(struct file *filp, void *priv,
 {
 	struct fthd_private *dev_priv = video_drvdata(filp);
 
-	strcpy(cap->driver, "facetimehd");
-	strcpy(cap->card, "Apple Facetime HD");
+	strscpy(cap->driver, "facetimehd", sizeof(cap->driver));
+	strscpy(cap->card, "Apple Facetime HD", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
 		 pci_name(dev_priv->pdev));
 
@@ -398,7 +377,8 @@ static int fthd_v4l2_ioctl_enum_fmt_vid_cap(struct file *filp, void *priv,
 	}
 
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	strncpy(fmt->description, desc, sizeof(fmt->description));
+	if (desc)
+		strscpy(fmt->description, desc, sizeof(fmt->description));
 
 	return 0;
 }
@@ -409,7 +389,8 @@ static int fthd_v4l2_adjust_format(struct fthd_private *dev_priv,
 
 	/* Upper bound is the sensor's native resolution (e.g. 1280x720 on
 	 * MacBookPro, 848x588 on the 12-inch MacBook); fall back to the generic
-	 * ceiling if it hasn't been detected yet. */
+	 * ceiling if it hasn't been detected yet.
+	 */
 	unsigned int max_w = dev_priv->sensor_width  ? : FTHD_MAX_WIDTH;
 	unsigned int max_h = dev_priv->sensor_height ? : FTHD_MAX_HEIGHT;
 
@@ -453,7 +434,7 @@ static int fthd_v4l2_ioctl_try_fmt_vid_cap(struct file *filp, void *_priv,
 {
 	struct fthd_private *dev_priv = video_drvdata(filp);
 
-	pr_debug("%s: %dx%d\n", __FUNCTION__, fmt->fmt.pix.width, fmt->fmt.pix.height);
+	pr_debug("%s: %dx%d\n", __func__, fmt->fmt.pix.width, fmt->fmt.pix.height);
 
 	if (fmt->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -466,7 +447,6 @@ static int fthd_v4l2_ioctl_g_fmt_vid_cap(struct file *filp, void *priv,
 {
 	struct fthd_private *dev_priv = video_drvdata(filp);
 
-	pr_debug("%s\n", __FUNCTION__);
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	fmt->fmt.pix = dev_priv->fmt.fmt;
 
@@ -514,7 +494,8 @@ static int fthd_v4l2_ioctl_g_parm(struct file *filp, void *priv,
 	 * and what enum_frameintervals advertises. The old frametime/1000 value
 	 * (25 fps) disagreed with the real 30 fps rate, which made GStreamer's
 	 * pipewiresrc compute negative frame durations and stall after one frame
-	 * (e.g. GNOME Snapshot froze, while ffplay/v4l2-ctl were unaffected). */
+	 * (e.g. GNOME Snapshot froze, while ffplay/v4l2-ctl were unaffected).
+	 */
 	struct v4l2_fract timeperframe = {
 		.numerator = 1,
 		.denominator = 30,
@@ -533,7 +514,7 @@ static int fthd_v4l2_ioctl_s_parm(struct file *filp, void *priv,
 		struct v4l2_streamparm *parm)
 {
 
-        struct fthd_private *dev_priv = video_drvdata(filp);
+	struct fthd_private *dev_priv = video_drvdata(filp);
 	struct v4l2_fract *timeperframe;
 
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -541,7 +522,7 @@ static int fthd_v4l2_ioctl_s_parm(struct file *filp, void *priv,
 
 	timeperframe = &parm->parm.capture.timeperframe;
 
-	if(timeperframe->denominator == 0) {
+	if (timeperframe->denominator == 0) {
 		timeperframe->numerator = 20;
 		timeperframe->denominator = 1000;
 	}
@@ -578,7 +559,6 @@ static int fthd_v4l2_ioctl_enum_frameintervals(struct file *filp, void *priv,
 	unsigned int max_w = dev_priv->sensor_width  ? : FTHD_MAX_WIDTH;
 	unsigned int max_h = dev_priv->sensor_height ? : FTHD_MAX_HEIGHT;
 
-	pr_debug("%s\n", __FUNCTION__);
 
 	if (interval->index)
 		return -EINVAL;
@@ -611,7 +591,7 @@ static int fthd_v4l2_ioctl_subscribe_event(struct v4l2_fh *fh,
 	return -EINVAL;
 }
 
-static struct v4l2_ioctl_ops fthd_ioctl_ops = {
+static const struct v4l2_ioctl_ops fthd_ioctl_ops = {
 	.vidioc_enum_input      = fthd_v4l2_ioctl_enum_input,
 	.vidioc_g_input         = fthd_v4l2_ioctl_g_input,
 	.vidioc_s_input         = fthd_v4l2_ioctl_s_input,
@@ -623,7 +603,7 @@ static struct v4l2_ioctl_ops fthd_ioctl_ops = {
 	.vidioc_querycap        = fthd_v4l2_ioctl_querycap,
 
 
-        .vidioc_reqbufs         = vb2_ioctl_reqbufs,
+	.vidioc_reqbufs         = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs     = vb2_ioctl_create_bufs,
 	.vidioc_querybuf        = vb2_ioctl_querybuf,
 	.vidioc_qbuf            = vb2_ioctl_qbuf,
@@ -654,7 +634,7 @@ static int fthd_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	pr_info("id = %x, val = %d\n", ctrl->id, ctrl->val);
 
-	switch(ctrl->id) {
+	switch (ctrl->id) {
 	case V4L2_CID_CONTRAST:
 		ret = fthd_isp_cmd_channel_contrast_set(dev_priv, 0, ctrl->val);
 		break;
@@ -669,10 +649,9 @@ static int fthd_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_AUTO_WHITE_BALANCE:
 		ret = fthd_isp_cmd_channel_awb(dev_priv, 0, ctrl->val);
-
+		break;
 	default:
 		break;
-
 	}
 	pr_debug("ret = %d\n", ret);
 	return ret;
@@ -711,11 +690,7 @@ int fthd_v4l2_register(struct fthd_private *dev_priv)
 	q->mem_ops = &vb2_dma_sg_memops;
 	q->buf_struct_size = 0;//sizeof(struct vpif_cap_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(6,8,0)
-	q->min_buffers_needed = 1;
-#else
 	q->min_queued_buffers = 1;
-#endif
 	q->lock = &dev_priv->vb2_queue_lock;
 
 	ret = vb2_queue_init(q);
@@ -739,21 +714,17 @@ int fthd_v4l2_register(struct fthd_private *dev_priv)
 		v4l2_ctrl_handler_free(&dev_priv->v4l2_ctrl_handler);
 		goto fail;
 	}
-#if LINUX_VERSION_CODE < KERNEL_VERSION(4,8,0)
-	dev_priv->alloc_ctx = vb2_dma_sg_init_ctx(&dev_priv->pdev->dev);
-#endif
+
 	vdev->v4l2_dev = v4l2_dev;
-	strcpy(vdev->name, "Apple Facetime HD"); // XXX: Length?
+	strscpy(vdev->name, "Apple Facetime HD", sizeof(vdev->name));
 	vdev->vfl_dir = VFL_DIR_RX;
 	vdev->fops = &fthd_vdev_fops;
 	vdev->ioctl_ops = &fthd_ioctl_ops;
 	vdev->queue = q;
 	vdev->release = video_device_release;
 	vdev->ctrl_handler = &dev_priv->v4l2_ctrl_handler;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,0)
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 			    V4L2_CAP_STREAMING;
-#endif
 	video_set_drvdata(vdev, dev_priv);
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -761,7 +732,8 @@ int fthd_v4l2_register(struct fthd_private *dev_priv)
 		goto fail_vdev;
 	}
 	/* Default to the sensor's native resolution (detected at probe), or the
-	 * generic ceiling if detection didn't run. */
+	 * generic ceiling if detection didn't run.
+	 */
 	dev_priv->fmt.fmt.width  = dev_priv->sensor_width  ? : FTHD_MAX_WIDTH;
 	dev_priv->fmt.fmt.height = dev_priv->sensor_height ? : FTHD_MAX_HEIGHT;
 	dev_priv->fmt.fmt.pixelformat = V4L2_PIX_FMT_YUYV;
@@ -782,9 +754,6 @@ void fthd_v4l2_unregister(struct fthd_private *dev_priv)
 {
 
 	v4l2_ctrl_handler_free(&dev_priv->v4l2_ctrl_handler);
-#if LINUX_VERSION_CODE < KERNEL_VERSION(4,8,0)
-	vb2_dma_sg_cleanup_ctx(dev_priv->alloc_ctx);
-#endif
 	video_unregister_device(dev_priv->videodev);
 	v4l2_device_unregister(&dev_priv->v4l2_dev);
 }
diff --git a/drivers/media/pci/facetimehd/fthd_v4l2.h b/drivers/media/pci/facetimehd/fthd_v4l2.h
index 8e4f9d574904..13856ee757f3 100644
--- a/drivers/media/pci/facetimehd/fthd_v4l2.h
+++ b/drivers/media/pci/facetimehd/fthd_v4l2.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * FacetimeHD camera driver
  *
  * Copyright (C) 2015 Sven Schnelle <svens@stackframe.org>
@@ -28,6 +27,7 @@ struct fthd_fmt {
 };
 
 struct fthd_private;
+
 extern int fthd_v4l2_register(struct fthd_private *dev_priv);
 extern void fthd_v4l2_unregister(struct fthd_private *dev_priv);
 
-- 
2.55.0

