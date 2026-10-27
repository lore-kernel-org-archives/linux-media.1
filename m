Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142513;
	b=QusTjuo+NOWh1lxQVIj1g7yGe1YhB/tXQLXOc3neLMi5cUS8QPt37idG7i0h3EYPUBe/
	 gF7QmkVBJ7ZhfI5sp4felIHMxi/6xGUmjAYGT28PeOQvP2pc/1ajDXSgsKUO54BONlpv1
	 wY2f0XLILIUdd4mTNXfevV2hJP3bksohRp9vlBY7RYJcIZ+Cwbm3AVx2IHOkJiW3V/qvh
	 6BePWYaGCv3Ha9up65dQF9V8cbik0eYLYQnB9FMzwEBdxqLJP3iY1PZOIpXRYRo2QdXn3
	 bOAjiqwdLXYI3OU+7noI3yqS5rk5nfbE46KmDxOZlp/ogt8Ha1KI4Z58a1VOIYL+ohQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=COW4Sty1k46g+o3iTAbh7/aAOvozPxbum42w7fwKbM0=;
	b=dEQxXuxEmyciRwuUVjA+EXxDPptLUZE2c5j8NDs+Krq9JO9zb4RgZ+YX4WhTknwZFUIz
	 XImfqZD2Mz0RkjVjhGq+OYJeiqU873j7fWG22ylaKIB5rs1JKqxHi12Lryvl1j0nV3AHP
	 RitR2IZMhNGihkpN9q6/HZ52n1YigqrSAk9pAHEVThD70X4LJDXWEPwG75Q07XxvZaIjY
	 FZ64WkRUxgQFIMkGq8RnpyO8tfVUbQNqgvFIWK2EJObNRxGqqSEnXPOKGW2mDJm2p6Uhb
	 KYRXf09CnEONamTz3SblDnfnvii5YRrtcexLkW4oIzIh83sMSGtDHyH5NDMDdoGoiVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBHxXBs2;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814CD606A336
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 23:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814CD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBHxXBs2
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso2985135e9.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142512; x=1793747312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COW4Sty1k46g+o3iTAbh7/aAOvozPxbum42w7fwKbM0=;
        b=XBHxXBs2M2K0DPA+AMbUz21DvKRIZsMDmhq+QykviA2ymOkLAJE5xK4qf4cgqBiOQt
         9nMl5qljZo7o9u9X2f2oFTB1lrNnTSer8YFUap8nAUeybpXXAE11E8gFhyn4I4d8Mw7/
         mf8g6Lk/xabZ9TFhG2fGpnYf61xDmTwe6SK8CneEi7TO7z1OuZntzoqQo6OlDCwWdrd6
         osHstGBS3wFFkl+rUVBZmYSF0p9N1YOa047HhGbpEqA3G+oQXiz3EV51CCtSPEFO6FLY
         SNR5mD3A5Fasmr18CMSsKmWXOGeFXJj3+21G5GtammpBIIlfNvkKv3qF6xtW81MojJiM
         3GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142512; x=1793747312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COW4Sty1k46g+o3iTAbh7/aAOvozPxbum42w7fwKbM0=;
        b=SnzxG4RLnkxeRBFjhTKD/btW71jQCinDYQsEB++l8mAEm0+A5SIqC6008cLErGLjWU
         JubRK217Yi1XydLi5oLraD0ollnwAtf+MhVubbdFdHr0r61c/TQZ2TrWHMkJ+lxNRmPM
         bkinsr+clS2FeHzyhxDIGduP9Ziu/Rz7PQ642chKqJYEkV5tapl0JWMDEUC2pVWFPcz2
         QuiYYC6NkSNscnQfhmlIQeBRIKY+1MStolgGP7dBkMtVFLhupJy27scdpHSmFiaiL1Uu
         D219zt+A93JLsCAGzpqU/pDQOQWFv8xxrve+pHrsIKPfUS72u/4/bDOCurl847UqIGnv
         oaWg==
X-Forwarded-Encrypted: i=1; AKwUvBxqnOxh/AaT7hZp653dotIg41RjDcIJLACsHqlFGy//bJzF9yvGlQrSOFy9uD5CTZxVx8cikOUD9Q49wA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKr2CRgpY2ayrxaxLp9FZgNXN7dYVXGIFgEJ6VkuEWlxcZBf82w
	0qotsYiNeyXPnuAMQIrPgMIow41SAZH8KNErcofdoB6upxG0YQeoKDdP
X-Gm-Gg: AYBFou1/P0XaAih4jAumAzLbcYfbfMnttYED89jMIrnULQaZjYVEkoJ6b8dsbUD3eQz
	6H11vJec6z9aZcwxL5X2cBMCM7M2/VqD02eyUp5TEvsaMWgXb45ahUsUFfA5MJQM+gZc4QHCCBH
	MQfJVLeZhP8H0ev0DzKINe9DWEpfWD+FantAVcbB+ktoBKp0/nDH/PPXUWPko6cnMwSkmC2FGoi
	nN53fDJ8rY0aUI0aPwCiWLeZ0KtD/ka+adIz7KMlnOJt3+uZoSKQzRbzZi34ghe2TYRGdZnnuy3
	6pjGxd1AMiIg6zQFnX1yZc//WDvdnrPpNGfMv95MQO5lwnRlJ6HEe/JhUlPtbPxxUBFyAH1EICb
	qkOieoQVELtkQDv3Cve9CEZqSffsKDljsr9euarv6DXDVR5tuxG+7RXUe6mgFNs89fUx0EaexDQ
	Z2Lzr5tvoTaKSIihV2LpiWQBxyYZB4OqqiAa0/4Z/52xnXkJAC/aKTJ+NQteXkaw7NhfDlpRiKy
	brZ7cWynUD8kUX746YIQQYJTfN3OhgHxuQB/QbQqex//QHptZTVUMKUuWaW2lAlaKBY1hakw13g
	Tjw=
X-Received: by 2002:a05:600c:83ca:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a9672030admr8831385e9.23.1793142511988;
        Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 4/5] media: atomisp: queue: move circbuf types and helpers to queue_comm.h
Date: Tue, 27 Oct 2026 23:08:06 +0000
Message-ID: <20261027230807.2407261-5-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027230807.2407261-1-vladurares@gmail.com>
References: <20261027230807.2407261-1-vladurares@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The remote queue code only needs the circbuf descriptor and element
layouts plus five small descriptor helpers from the circbuf library.
Move them into ia_css_queue_comm.h and include that header instead of
the circbuf ones.

The descriptor and element layouts are shared with the SP firmware and
are moved unchanged, including their static_asserts.

While at it, drop the OP___assert() NULL checks from the moved helpers,
as every caller passes the address of a local variable, and convert the
moved code to the kernel u8/u32 types and the usual function
declaration style.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../queue/interface/ia_css_queue_comm.h       | 130 +++++++++++++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     |   2 -
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   1 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 5 files changed, 130 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
index 7cd788e2b16bd..8323347bea6b4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -7,8 +7,136 @@
 #ifndef __IA_CSS_QUEUE_COMM_H
 #define __IA_CSS_QUEUE_COMM_H
 
+#include <linux/build_bug.h>
+#include <linux/types.h>
+
 #include "type_support.h"
-#include "ia_css_circbuf.h"
+
+/****************************************************************
+ *
+ * Portable Data structures
+ *
+ ****************************************************************/
+/*
+ * @brief Data structure for the circular descriptor.
+ */
+typedef struct ia_css_circbuf_desc_s ia_css_circbuf_desc_t;
+struct ia_css_circbuf_desc_s {
+	u8 size;	/* the maximum number of elements*/
+	u8 step;   /* number of bytes per element */
+	u8 start;	/* index of the oldest element */
+	u8 end;	/* index at which to write the new element */
+};
+
+#define SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT	(4 * sizeof(u8))
+
+static_assert(sizeof(struct ia_css_circbuf_desc_s) == SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT);
+
+/*
+ * @brief Data structure for the circular buffer element.
+ */
+typedef struct ia_css_circbuf_elem_s ia_css_circbuf_elem_t;
+struct ia_css_circbuf_elem_s {
+	u32 val;	/* the value stored in the element */
+};
+
+#define SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT	(sizeof(u32))
+
+static_assert(sizeof(struct ia_css_circbuf_elem_s) == SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT);
+
+/****************************************************************
+ *
+ * Inline functions.
+ *
+ ****************************************************************/
+/*
+ * @brief Test if the circular buffer is empty.
+ *
+ * @param cb_desc The pointer to the circular buffer descriptor.
+ *
+ * @return
+ *	- true when it is empty.
+ *	- false when it is not empty.
+ */
+static inline bool ia_css_circbuf_desc_is_empty(ia_css_circbuf_desc_t *cb_desc)
+{
+	return (cb_desc->end == cb_desc->start);
+}
+
+/*
+ * @brief Test if the circular buffer descriptor is full.
+ *
+ * @param cb_desc	The pointer to the circular buffer
+ *			descriptor.
+ *
+ * @return
+ *	- true when it is full.
+ *	- false when it is not full.
+ */
+static inline bool ia_css_circbuf_desc_is_full(ia_css_circbuf_desc_t *cb_desc)
+{
+	return ((cb_desc->end + 1) % cb_desc->size) == cb_desc->start;
+}
+
+/*
+ * @brief Get the offset between two positions in the circular buffer
+ * descriptor.
+ * Get the offset from the source position to the terminal position,
+ * along the direction in which the new elements come in.
+ *
+ * @param cb_desc	The pointer to the circular buffer descriptor.
+ * @param src_pos	The source position.
+ * @param dest_pos	The terminal position.
+ *
+ * @return the offset.
+ */
+static inline int ia_css_circbuf_desc_get_offset(ia_css_circbuf_desc_t *cb_desc,
+						 u32 src_pos, u32 dest_pos)
+{
+	int offset;
+
+	offset = (int)(dest_pos - src_pos);
+	offset += (offset < 0) ? cb_desc->size : 0;
+
+	return offset;
+}
+
+/*
+ * @brief Get the number of available elements.
+ *
+ * @param cb_desc The pointer to the circular buffer.
+ *
+ * @return The number of available elements.
+ */
+static inline u32 ia_css_circbuf_desc_get_num_elems(ia_css_circbuf_desc_t *cb_desc)
+{
+	int num;
+
+	num = ia_css_circbuf_desc_get_offset(cb_desc,
+					     cb_desc->start,
+					     cb_desc->end);
+
+	return (u32)num;
+}
+
+/*
+ * @brief Get the number of free elements.
+ *
+ * @param cb_desc The pointer to the circular buffer descriptor.
+ *
+ * @return: The number of free elements.
+ */
+static inline u32 ia_css_circbuf_desc_get_free_elems(ia_css_circbuf_desc_t *cb_desc)
+{
+	u32 num;
+
+	num = ia_css_circbuf_desc_get_offset(cb_desc,
+					     cb_desc->start,
+					     cb_desc->end);
+
+	return (cb_desc->size - num);
+}
+
 /*****************************************************************************
  * Queue Public Data Structures
  *****************************************************************************/
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index 6747696595eab..47300af8e5c05 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -6,8 +6,6 @@
 
 #include "ia_css_queue.h"
 #include <math_support.h>
-#include <ia_css_circbuf.h>
-#include <ia_css_circbuf_desc.h>
 #include "queue_access.h"
 
 /*****************************************************************************
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
index 2591d157870ce..65835420a13c0 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
@@ -8,7 +8,6 @@
 
 #include "type_support.h"
 #include "queue_access.h"
-#include "ia_css_circbuf.h"
 #include "sp.h"
 #include "assert_support.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index 776c6d6cb1fcc..93dae469cff9a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -11,7 +11,6 @@
 
 #include <type_support.h>
 #include <ia_css_queue_comm.h>
-#include <ia_css_circbuf.h>
 
 #define QUEUE_IGNORE_START_FLAG	0x0001
 #define QUEUE_IGNORE_END_FLAG	0x0002
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index ec68c16d42722..f08f918b361c4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -29,7 +29,7 @@
 #include "sh_css_defs.h"
 #include "sh_css_uds.h"
 #include "dma.h"	/* N_DMA_CHANNEL_ID */
-#include "ia_css_circbuf_comm.h" /* Circular buffer */
+#include "ia_css_queue_comm.h"
 #include "ia_css_frame_comm.h"
 #include "ia_css_3a.h"
 #include "ia_css_dvs.h"
-- 
2.43.0

