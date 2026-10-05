Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F3336920F
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182509; cv=none; b=F5APckA6gFeX8Tq331lbgpwS3kVNv+tHryUNqV0LnrKGA+GKPRGCo3jburml+8othIEZ7shiHPDhAg3lOYABqiv/Z7IsjRw+4vJ/J/InonhT8lPbY0q9VXIBO8PCXMXqcDbualYfkMrJQqfp2GQBB5GtT+XuWQ0Ki/GbUuMoo+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182509; c=relaxed/simple;
	bh=47GGG/TFsZMBvOvHQurBJTD67WcKVpguC+ALPQBlEoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m4RxqQOiWR3ITYr2aCWBF6VIm8MtKsb12srMolgxhaldU29cSZoSIhu2A2nT5ZrUf6fOL+hRlkQptw8tPnJgTbj4Spu0qv9I46YeB2kj+OCUma7JoTbHPjQO8ZT72EqC9Qnv67NUkLaCsS+ZNumHKZtA2TVN+amdVr55AiDb7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2YjLZPj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2YjLZPj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so644259f8f.3
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 23:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182503; x=1791787303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kSCKY+SGjMm5KV1kEQwiYEh/lGTKYsHdzMVyPpC8Ps=;
        b=P2YjLZPjACeTxU2HjoABnavRkiEvwWd0gDw6wH1PO9W50Je2aSyofrGza17xWNiGz/
         mWtO6qEAHpLco3ka1uQzkw1LLzC/KPwjjAbgdOuRka9+kHXxV1/Hjgqz2jcb3GQfHCtf
         1fM8EE6Pq1tp0Abo9WrVZvVqtIGfM4SFo98pXZvOWzlfdNfgMnuVS2NFspdtZ1pJjISU
         t08Dye4GS2Rdfngsb7j4Fyoi6xYuWbZcOe0O5O4hhWusxk05Oji4bcUoIfYIby5TljfU
         8ovOcDYBA3WYjq1D8xoo0NPooY9lnmSGdlRvNwkL29JxYU2Wny2jZ9Hl+LZ976/Av7v8
         tPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182503; x=1791787303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5kSCKY+SGjMm5KV1kEQwiYEh/lGTKYsHdzMVyPpC8Ps=;
        b=Vnu1/WGDwrYu8uSGTu24g5Y7Taq/juwmC+R6Cn+RKXM0pFHum/zQbM5mi6Zvz90RQw
         VkQBo/6GK1loYDolq9962ZoE1Q7jEBqzXL+m1OpX3GMIHy4OnRwr9n5gENDzNu90jPS+
         Jy8vwSUoAH6WUC81l3Wqp9y7++BN2nm4kpqjksMNPY8mTi5at0qSfSComiZfaPDuKLgg
         BGPcu46rlVf4egfOCVmW6I9rDzVN5CZIB4AkPQFEO+XiHTZG7OsApMKB6vJo4oPk7RNq
         UlteofUk85BuaaGvQ1AuUQQ5VJTwCKc3howwHr5dRord8uGMSDE6tqXN9EtFUllUg/fb
         8whw==
X-Forwarded-Encrypted: i=1; AKwUvBwtUY6B4SP3kQ6n/1F8l40hseBi1rgpUrYLIDg8iMraRZMpv/DYpJ+Ksxx9yxcwbFx+xKC/Fwry9AZs5w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJS2zhDlD0RzAKw8ub03O9JeuPfLgsq9/6+upFQVGVg1nwSy74Z
	fkY9BzCZe4AteLI/anx4QXxlQ2G8fxG2giena05t5zX5BmBJMaqYJ3F0
X-Gm-Gg: AYBFou0CY8Dd35Gvs2du9lRK+pgKbBC88bmwHOkLnkicz2vtK0fPCXmWYNxJsa/tXc1
	/A/YI1GykJOnvQGlMaGrqmSRQJwVodB+oFDPeapulDTqlaxejQ/EQie7P739nsOKc60Z7cd+hg+
	eZxx/xu4ij8oYu4/FCHVCYEDknlP9FNn8rrCyo5eALshAsOWFcOFNLZMH/B74ZdNCkXqxbxUZgW
	tjCWuix6a6X/4mPsVwCllcypy6Wemg4gvaRY1ttHSUz8DKNNJUbY3MnKWgKnfmMI0Y9WtOW+hLe
	EWBghYke4MLOShGhCxctxPT8MqmF+Xe6YVEur50nnbqQRhhlR4KB2OadkgBDZOHyCaTDmECbZiG
	ZAJEQHRycYWLIL8zbabFjvMOpmda7IlNzVJAeEWBoxcqqebVPazHmgwADF5Hyvm82ZYFAqs5OWd
	6hOwA6fnTfzGEQ/WJkeoSPreq5HLqqNhOvvtmzLN4mixcQ8SpqzWxyQAAcIegjFVnEeWVNDwbku
	B9GrCARGftnoa/okg+wPjZT8BT7E10Ws4RSfAFCfa77sgYhrGp4D+B+K+w1IlBYzfmclxCyIUV+
	Q15oSXmcqaJwWOKilOQg+RksyEFjbpXug5vIb3oc38qD86Nuov5eu968wrryZV+pGMHYesEqzB+
	4tA==
X-Received: by 2002:a05:6000:128b:b0:486:f97b:6412 with SMTP id ffacd0b85a97d-48b1276dfa2mr10765967f8f.46.1791182503211;
        Sun, 04 Oct 2026 23:41:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62289b62sm1666871f8f.20.2026.10.04.23.41.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:41:42 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] dma-buf: test the debug scatterlist wrapper
Date: Mon,  5 Oct 2026 08:41:33 +0200
Message-Id: <20261005064133.7305-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005064133.7305-1-kmehltretter@gmail.com>
References: <20261005064133.7305-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Map a dma-buf from a mock exporter and check the sg_table the importer
gets. The exporter's table has one DMA entry and one, two or no CPU
entries. That covers a mapping that merged entries and a table without
a CPU side.

In all modes the DMA address, length and existing DMA flags must be
preserved, and unmap must give the exporter its own table back. In
strict mode the CPU fields must be cleared. In warn mode they must be
there for all CPU entries and every entry must be marked.

The warn mode check calls sg_page() and sg_nents_for_len() on the copy
on purpose, so it prints one report.

The .kunitconfig now sets DMABUF_DEBUG. For the warn mode add
--kconfig_add CONFIG_DMABUF_DEBUG_WARN=y.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    KUnit, the dma-buf suites, with
    tools/testing/kunit/kunit.py run --kunitconfig drivers/dma-buf/.kunitconfig:
    
    - UML, strict mode (the .kunitconfig as it is): 56 passed, 1 skipped
    - UML, --kconfig_add CONFIG_DMABUF_DEBUG_WARN=y: 56 passed, 1 skipped
    - UML, --kconfig_add CONFIG_DMABUF_DEBUG=n: 56 passed, 1 skipped
    - x86_64 in QEMU (--arch x86_64), strict mode: 56 passed, 1 skipped
    - x86_64 in QEMU, DMABUF_DEBUG_WARN=y: 56 passed, 1 skipped
    - x86_64 in QEMU with KASAN, both modes: 56 passed, 1 skipped, no
      KASAN report
    
    The skipped test is test_race_signal_callback, which needs 2 CPUs. UML
    has no NEED_SG_DMA_LENGTH, x86_64 has it.
    
    In warn mode the test prints one report. On x86_64:
    
      DMA-BUF: importer used the CPU side of an exporter's sg_table
      [...]
      Call Trace:
       <TASK>
       dump_stack_lvl+0x2f/0x50
       check_warn+0x113/0x4b0
       test_debug_sg_table+0x2c4/0x740
       kunit_try_run_case+0x8e/0x120
       kunit_generic_run_threadfn_adapter+0x1c/0x40
       kthread+0xc5/0x100
    
    The test also builds as a module on x86_64 (DMABUF_KUNIT_TEST=m).

 drivers/dma-buf/.kunitconfig |   1 +
 drivers/dma-buf/Makefile     |   1 +
 drivers/dma-buf/st-dma-buf.c | 253 +++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 drivers/dma-buf/st-dma-buf.c

diff --git a/drivers/dma-buf/.kunitconfig b/drivers/dma-buf/.kunitconfig
index 1ce5fb7e6cf9..7dcf41de464e 100644
--- a/drivers/dma-buf/.kunitconfig
+++ b/drivers/dma-buf/.kunitconfig
@@ -1,2 +1,3 @@
 CONFIG_KUNIT=y
 CONFIG_DMABUF_KUNIT_TEST=y
+CONFIG_DMABUF_DEBUG=y
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index b25d7550bacf..e34f18c4a6ed 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
 
 dmabuf_kunit-y := \
+	st-dma-buf.o \
 	st-dma-fence.o \
 	st-dma-fence-chain.o \
 	st-dma-fence-unwrap.o \
diff --git a/drivers/dma-buf/st-dma-buf.c b/drivers/dma-buf/st-dma-buf.c
new file mode 100644
index 000000000000..892c195b749c
--- /dev/null
+++ b/drivers/dma-buf/st-dma-buf.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Test the sg_table that dma_buf_map_attachment() hands to importers.
+ */
+
+#include <kunit/device.h>
+#include <kunit/test.h>
+
+#include <linux/dma-buf.h>
+#include <linux/module.h>
+#include <linux/scatterlist.h>
+
+#define MOCK_DMA_ADDR	0x12340000
+#define MOCK_ORDER	2
+
+struct mock_param {
+	const char *desc;
+	/* Entries of the CPU side. The DMA side always has one. */
+	unsigned int orig_nents;
+};
+
+struct mock_buf {
+	struct kunit *test;
+	struct sg_table sgt;
+	unsigned int alloc_nents;
+	struct page *pages;
+	bool unmapped;
+};
+
+static struct sg_table *mock_map(struct dma_buf_attachment *attach,
+				 enum dma_data_direction dir)
+{
+	struct mock_buf *buf = attach->dmabuf->priv;
+
+	return &buf->sgt;
+}
+
+static void mock_unmap(struct dma_buf_attachment *attach, struct sg_table *sgt,
+		       enum dma_data_direction dir)
+{
+	struct mock_buf *buf = attach->dmabuf->priv;
+
+	/* The exporter gets its own table back, not the copy */
+	KUNIT_EXPECT_PTR_EQ(buf->test, sgt, &buf->sgt);
+	buf->unmapped = true;
+}
+
+static void mock_free(struct mock_buf *buf)
+{
+	buf->sgt.orig_nents = buf->alloc_nents;
+	sg_free_table(&buf->sgt);
+	__free_pages(buf->pages, MOCK_ORDER);
+	kfree(buf);
+}
+
+/* Runs from delayed fput, the test may be gone by then */
+static void mock_release(struct dma_buf *dmabuf)
+{
+	mock_free(dmabuf->priv);
+}
+
+static const struct dma_buf_ops mock_ops = {
+	.map_dma_buf = mock_map,
+	.unmap_dma_buf = mock_unmap,
+	.release = mock_release,
+};
+
+/* A table as an exporter would return it, with a made up DMA mapping */
+static struct mock_buf *mock_alloc(struct kunit *test, unsigned int orig_nents)
+{
+	struct scatterlist *sg;
+	struct mock_buf *buf;
+	unsigned int i;
+
+	buf = kzalloc_obj(*buf);
+	if (!buf)
+		return NULL;
+
+	buf->pages = alloc_pages(GFP_KERNEL, MOCK_ORDER);
+	if (!buf->pages)
+		goto err_buf;
+
+	buf->alloc_nents = max(orig_nents, 1U);
+	if (sg_alloc_table(&buf->sgt, buf->alloc_nents, GFP_KERNEL))
+		goto err_pages;
+
+	/* An offset of a page keeps the lengths page aligned */
+	for_each_sg(buf->sgt.sgl, sg, orig_nents, i)
+		sg_set_page(sg, buf->pages + 2 * i, PAGE_SIZE, PAGE_SIZE);
+
+	sg = buf->sgt.sgl;
+	sg_dma_address(sg) = MOCK_DMA_ADDR;
+	/* Without NEED_SG_DMA_LENGTH the DMA length is the CPU length */
+	if (IS_ENABLED(CONFIG_NEED_SG_DMA_LENGTH) || !orig_nents)
+		sg_dma_len(sg) = buf->alloc_nents * PAGE_SIZE;
+#ifdef CONFIG_NEED_SG_DMA_FLAGS
+	sg_dma_mark_bus_address(sg);
+	sg_dma_mark_swiotlb(sg);
+#endif
+	buf->sgt.nents = 1;
+	buf->sgt.orig_nents = orig_nents;
+	buf->test = test;
+
+	return buf;
+
+err_pages:
+	__free_pages(buf->pages, MOCK_ORDER);
+err_buf:
+	kfree(buf);
+	return NULL;
+}
+
+/* Strict mode: only the DMA side, the CPU fields are cleared */
+static void check_strict(struct kunit *test, struct sg_table *sgt)
+{
+	struct scatterlist *sg;
+	int i;
+
+	KUNIT_EXPECT_EQ(test, sgt->orig_nents, sgt->nents);
+
+	for_each_sgtable_sg(sgt, sg, i) {
+		KUNIT_EXPECT_NULL(test, sg_page(sg));
+		KUNIT_EXPECT_EQ(test, sg->offset, 0U);
+		if (IS_ENABLED(CONFIG_NEED_SG_DMA_LENGTH))
+			KUNIT_EXPECT_EQ(test, sg->length, 0U);
+	}
+}
+
+#ifdef CONFIG_DMABUF_DEBUG_WARN
+/* Warn mode: the CPU side is all there, and all entries are marked */
+static void check_warn(struct kunit *test, struct sg_table *sgt,
+		       struct sg_table *orig)
+{
+	struct scatterlist *orig_sg = orig->sgl;
+	struct scatterlist *sg;
+	u64 len = 0;
+	int i;
+
+	KUNIT_EXPECT_EQ(test, sgt->orig_nents, orig->orig_nents);
+	KUNIT_EXPECT_TRUE(test, sgt->sgl->dma_flags & SG_DMA_DMABUF_DEBUG);
+	KUNIT_EXPECT_FALSE(test, orig->sgl->dma_flags & SG_DMA_DMABUF_DEBUG);
+
+	/* sg_page() and sg_nents_for_len() report this, rate limited */
+	for_each_sgtable_sg(sgt, sg, i) {
+		KUNIT_EXPECT_TRUE(test, sg->dma_flags & SG_DMA_DMABUF_DEBUG);
+		KUNIT_EXPECT_PTR_EQ(test, sg_page(sg), sg_page(orig_sg));
+		KUNIT_EXPECT_EQ(test, sg->offset, orig_sg->offset);
+		KUNIT_EXPECT_EQ(test, sg->length, orig_sg->length);
+		len += sg->length;
+		orig_sg = sg_next(orig_sg);
+	}
+
+	if (len)
+		KUNIT_EXPECT_EQ(test, sg_nents_for_len(sgt->sgl, len),
+				(int)orig->orig_nents);
+	else
+		KUNIT_EXPECT_NULL(test, sg_page(sgt->sgl));
+}
+#else
+static void check_warn(struct kunit *test, struct sg_table *sgt,
+		       struct sg_table *orig)
+{
+}
+#endif
+
+static void test_debug_sg_table(struct kunit *test)
+{
+	const struct mock_param *param = test->param_value;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf_attachment *attach;
+	struct dma_buf *dmabuf;
+	struct sg_table *sgt;
+	struct mock_buf *buf;
+	struct device *dev;
+
+	dev = kunit_device_register(test, "dma-buf-test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	buf = mock_alloc(test, param->orig_nents);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	exp_info.ops = &mock_ops;
+	exp_info.size = buf->alloc_nents * PAGE_SIZE;
+	exp_info.flags = O_RDWR;
+	exp_info.priv = buf;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		mock_free(buf);
+		KUNIT_FAIL(test, "dma_buf_export: %pe", dmabuf);
+		return;
+	}
+
+	attach = dma_buf_attach(dmabuf, dev);
+	if (IS_ERR(attach)) {
+		KUNIT_FAIL(test, "dma_buf_attach: %pe", attach);
+		goto out_put;
+	}
+
+	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		KUNIT_FAIL(test, "dma_buf_map_attachment: %pe", sgt);
+		goto out_detach;
+	}
+
+	/* The DMA side is the same in all modes */
+	KUNIT_EXPECT_EQ(test, sgt->nents, 1U);
+	KUNIT_EXPECT_EQ(test, sg_dma_address(sgt->sgl), (dma_addr_t)MOCK_DMA_ADDR);
+	KUNIT_EXPECT_EQ(test, sg_dma_len(sgt->sgl), sg_dma_len(buf->sgt.sgl));
+#ifdef CONFIG_NEED_SG_DMA_FLAGS
+	KUNIT_EXPECT_TRUE(test, sg_dma_is_bus_address(sgt->sgl));
+	KUNIT_EXPECT_TRUE(test, sg_dma_is_swiotlb(sgt->sgl));
+#endif
+
+	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+		KUNIT_EXPECT_PTR_EQ(test, sgt, &buf->sgt);
+	else if (IS_ENABLED(CONFIG_DMABUF_DEBUG_WARN))
+		check_warn(test, sgt, &buf->sgt);
+	else
+		check_strict(test, sgt);
+
+	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
+	KUNIT_EXPECT_TRUE(test, buf->unmapped);
+	KUNIT_EXPECT_EQ(test, buf->sgt.nents, 1U);
+	KUNIT_EXPECT_EQ(test, buf->sgt.orig_nents, param->orig_nents);
+
+out_detach:
+	dma_buf_detach(dmabuf, attach);
+out_put:
+	dma_buf_put(dmabuf);
+}
+
+static const struct mock_param mock_params[] = {
+	{ .desc = "one CPU entry", .orig_nents = 1 },
+	{ .desc = "two CPU entries merged", .orig_nents = 2 },
+	{ .desc = "no CPU side", .orig_nents = 0 },
+};
+
+KUNIT_ARRAY_PARAM_DESC(mock, mock_params, desc);
+
+static struct kunit_case dma_buf_test_cases[] = {
+	KUNIT_CASE_PARAM(test_debug_sg_table, mock_gen_params),
+	{}
+};
+
+static struct kunit_suite dma_buf_test_suite = {
+	.name = "dma-buf",
+	.test_cases = dma_buf_test_cases,
+};
+
+kunit_test_suite(dma_buf_test_suite);
+
+MODULE_IMPORT_NS("DMA_BUF");
-- 
2.53.0

