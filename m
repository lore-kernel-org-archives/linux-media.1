Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142514;
	b=knCBcKBV3kcUzdRmvyBpoc10+5L+hfJ67MtybM2WhUAFKx6go5RsWjdzNdN49LpnLcYn
	 2iQqqvb1kcGviSp0Ybt9Oc1Xj81waSpdMPJfBUMRm8X+2q1WVUAfom1dmCrQ9OQMcY53I
	 sif793wNakeyNQaiJ/us14p1UBEUq+TfJDALF4DmsNxJm3wi0/UQXTPrlzklRQGXNLoHo
	 9R6qaWTIAAHDOcgXUEcdW/MUW/k+an1EEAExbUsBg279mQBpJSSrmIy7pmE+d1Ije5fV4
	 AdbOfefijrUsxdkQIRdAv641/rDaKr2UZXWgjT7S5yeaK0yJyZa7RY4J1qUdai5oDvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OHlnBz/JKIlwTxqnifjMU0ea8jV5/wrIgri2BVKwHRw=;
	b=a+Kfb5Zz1YWEqzu6AX8rGD6W372luALx/240Bv9dVj93pzq683yHwsDO0P1bXPw5InKv
	 gZlMaGpxIIKGsttBbL5yH7l6UCAdwqQSVQUILBKfqeoZmVuBJtf7oijmzgBHMBXEz00nk
	 /1Ch1KpqIVPUWyjsDU0XmbCcSlqXvfGmXVJqmFTEPCGY0kVOHs6JYiiXsC2ebL/ahAtWn
	 yJisA7uK/8pWOoErdPLqDjcRTdBzPecfHvLA4TFkN3NufLb4RjbLQpVNBqT1U1EkfBv33
	 ZPYqlUyjOqJea6QUDzoL+9ZbJ/7Wdz2VVIvjkmCPyTbGl1VGYSRKEKEKOHbX6ifGpAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuMzm6a6;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3411606A338
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 23:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3411606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuMzm6a6
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so8798125e9.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142511; x=1793747311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHlnBz/JKIlwTxqnifjMU0ea8jV5/wrIgri2BVKwHRw=;
        b=cuMzm6a63ZFv8dszcFQFxRKaH56KZbptfFeYFGVoSAWN2SA1nNxdu3dNQCoKC2KnW0
         ztB/ygtLEyRqiccbqnfTwoa3Pme1FaPEpx7a8Tt+Ma/iepUjVkYEbmZX3cSDhGPwQAl2
         NdBOOrGzrvWus1zyz7dRLDNZih2+WHDXTMTYcXNAaL+XlX4FOGz1FeNWizmtwtT5d+rZ
         Fa2o1iVhw3IuglL/WNIsHXT5OtM9haTZVZd8VHqroejRgWLYQsMIPSMiphb3Jy7vvvob
         cS6AGTrI34tnGOW11egZk7rFE/7dsB52OP/J5cbt84BLwvhVsedvcN1lejPhsMIKWI8W
         kkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142511; x=1793747311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHlnBz/JKIlwTxqnifjMU0ea8jV5/wrIgri2BVKwHRw=;
        b=BJ2Ody2Y8dbH9fooIasc+tULVMMW3TNmkIpq2HG0Vu+tlHkE8L+lOFE2HmWxWrQMkO
         66s91W6Pki98/X9qdujmO76ZJU550V2s+shOukpTCvPpoFjAZAMbQGJFm+lxU4NV9IvO
         QvrM8ITFR/d0yTaOvggcpqN9Sh/4SUXm7YuedA6GgceKrGHFsYMtLZisod7gMPcanFG5
         A19BMGxXMMCtZAla6se2fXcKVqjKWseavPTyswLhroNqXPDBMTazeeQpTpDjfS/2TQXS
         /ltbrE9CvcV1keKKLyjLTncKMjvqbLZHxq2DDo2XGhqtcsjvQ5TOeQqYGXRsvr61Mehv
         TjOA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ5R1L+UXBod4wTfVEbsZ3dSFc5ImvsMeMpQ7Un96xHNXGETdc2p3Qtuqf4+FZQldZ0nnoN9wPBPbxWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ4l0cqbzBVacL9JmtB1SvqnhWE37/1Pp44LBeSfwDpO70URME
	ZKhsNSkgVlqmX7Ll6D4WsJVd69UDrfAYne0uKpIPmSX0LleuXuX5RPSd
X-Gm-Gg: AYBFou0joyV34WMOBb0kUOf6wjsTkmUHBFecjPeq4yp3zWnpGBeihtUcBSju+4gh/fH
	F73VBemTuv+KRcWajnlNcLIg5dowckP/B21yJLzYPR4+AhmZ4/zMHWGhT9kb0bCATs+H9e3ZaPt
	j8XI7qFfjtbayhIlHtdyJ/aMFRKMz2pOqKLkwnbMykgTWFfOcGri30eI8PdwUXpbzeUFI08uae1
	5QXpvDsLp42rXtOQJt62WOUnH9cJMZdZnwtLlBFijI4b7Z4aQTUX/D5Bzvf9U7x6mbMaXO92DHs
	F1Ao8DblAvUVzaCEfLyUeZAKxe8nDoabnQ1IsFTLnuJWcgwsplEmYQEcrx0Dk82K8/PUSy+EWWX
	okzNsyoBj9UtBQ+E5NcVY3xsufrHkjPbrphxKDPpzeyVN/8IMExFnueKcXw8ws/QP6xFvldNpp4
	WlLiRLP1uJW7xZpy/rl676onloDRirqHlPKGsAbgS8gLmS5zyYESLGaIz1L+9dLF8uwgPi4Q1kQ
	xroLgdfeIaEZXe4buyycUxIKyV/cYlA1KhKLcM4FBBbjd5olQ9ODJ/KhClAkvFu4AiaOMulSPz6
	zfCC
X-Received: by 2002:a05:600c:1f94:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4a966399719mr8984575e9.4.1793142511233;
        Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:30 -0700 (PDT)
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
Subject: [PATCH v4 3/5] media: atomisp: queue: remove unused local queue support
Date: Tue, 27 Oct 2026 23:08:05 +0000
Message-ID: <20261027230807.2407261-4-vladurares@gmail.com>
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

ia_css_queue_local_init() has no callers, so no queue is ever created
as local. ia_css_queue_uninit() only handles local queues and has no
callers either.

All queue handles are in the static css_queues in bufq.c, and
ia_css_bufq_init() sets up each of them with ia_css_queue_remote_init().
This happens in ia_css_start_sp(), before the host sets
host_sp_queues_initialized for the firmware, and css_queues is not
cleared afterwards. Before that, the old code would have taken the local
path with a NULL cb_local.desc and hit OP___assert(), so the handles do
not seem to be used before initialization.

With only remote queues left, the queue type no longer serves a purpose.
Remove the local queue code together with IA_CSS_QUEUE_TYPE_REMOTE, the
type field and the type checks.

struct ia_css_queue appears to be host-only: it is not copied to SP or
ISP memory, and the firmware uses struct host_sp_queues, whose addresses
the handle stores. Removing the union member keeps the struct size on
32-bit and reduces it on 64-bit, where cb_local held two pointers.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../runtime/queue/interface/ia_css_queue.h    |  29 ---
 .../queue/interface/ia_css_queue_comm.h       |   5 -
 .../atomisp/pci/runtime/queue/src/queue.c     | 206 +-----------------
 .../pci/runtime/queue/src/queue_access.h      |   2 -
 4 files changed, 8 insertions(+), 234 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
index c097d912d87f8..87207c355e8e2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
@@ -13,32 +13,12 @@
 #include "ia_css_queue_comm.h"
 #include "../src/queue_access.h"
 
-/* Local Queue object descriptor */
-struct ia_css_queue_local {
-	ia_css_circbuf_desc_t *cb_desc; /*Circbuf desc for local queues*/
-	ia_css_circbuf_elem_t *cb_elems; /*Circbuf elements*/
-};
-
-typedef struct ia_css_queue_local ia_css_queue_local_t;
-
 /* Handle for queue object*/
 typedef struct ia_css_queue ia_css_queue_t;
 
 /*****************************************************************************
  * Queue Public APIs
  *****************************************************************************/
-/* @brief Initialize a local queue instance.
- *
- * @param[out] qhandle. Handle to queue instance for use with API
- * @param[in]  desc.   Descriptor with queue properties filled-in
- * @return     0      - Successful init of local queue instance.
- * @return     -EINVAL - Invalid argument.
- *
- */
-int ia_css_queue_local_init(
-    ia_css_queue_t *qhandle,
-    ia_css_queue_local_t *desc);
-
 /* @brief Initialize a remote queue instance
  *
  * @param[out] qhandle. Handle to queue instance for use with API
@@ -50,15 +30,6 @@ int ia_css_queue_remote_init(
     ia_css_queue_t *qhandle,
     ia_css_queue_remote_t *desc);
 
-/* @brief Uninitialize a queue instance
- *
- * @param[in]  qhandle. Handle to queue instance
- * @return     0 - Successful uninit.
- *
- */
-int ia_css_queue_uninit(
-    ia_css_queue_t *qhandle);
-
 /* @brief Enqueue an item in the queue instance
  *
  * @param[in]  qhandle. Handle to queue instance
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
index 0bed6425a07f0..7cd788e2b16bd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -19,11 +19,6 @@
 #define IA_CSS_QUEUE_LOC_SP   1
 #define IA_CSS_QUEUE_LOC_ISP  2
 
-/* Queue type specifier */
-/* Avoiding enums to save space */
-#define IA_CSS_QUEUE_TYPE_LOCAL  0
-#define IA_CSS_QUEUE_TYPE_REMOTE 1
-
 /* for DDR Allocated queues,
 allocate minimum these many elements.
 DDR->SP' DMEM DMA transfer needs 32byte aligned address.
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index 4212c113da41a..6747696595eab 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -13,24 +13,6 @@
 /*****************************************************************************
  * Queue Public APIs
  *****************************************************************************/
-int ia_css_queue_local_init(ia_css_queue_t *qhandle, ia_css_queue_local_t *desc)
-{
-	if (NULL == qhandle || NULL == desc
-	    || NULL == desc->cb_elems || NULL == desc->cb_desc) {
-		/* Invalid parameters, return error*/
-		return -EINVAL;
-	}
-
-	/* Mark the queue as Local */
-	qhandle->type = IA_CSS_QUEUE_TYPE_LOCAL;
-
-	/* Create a local circular buffer queue*/
-	ia_css_circbuf_create(&qhandle->desc.cb_local,
-			      desc->cb_elems,
-			      desc->cb_desc);
-
-	return 0;
-}
 
 int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *desc)
 {
@@ -39,9 +21,6 @@ int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *des
 		return -EINVAL;
 	}
 
-	/* Mark the queue as remote*/
-	qhandle->type = IA_CSS_QUEUE_TYPE_REMOTE;
-
 	/* Copy over the local queue descriptor*/
 	qhandle->location = desc->location;
 	qhandle->proc_id = desc->proc_id;
@@ -56,21 +35,7 @@ int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *des
 	return 0;
 }
 
-int ia_css_queue_uninit(ia_css_queue_t *qhandle)
-{
-	if (!qhandle)
-		return -EINVAL;
-
-	/* Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Local queues are created. Destroy it*/
-		ia_css_circbuf_destroy(&qhandle->desc.cb_local);
-	}
-
-	return 0;
-}
-
-static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -108,30 +73,7 @@ static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
 	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
 }
 
-int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
-{
-	if (!qhandle)
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		if (ia_css_circbuf_is_full(&qhandle->desc.cb_local)) {
-			/* Cannot push the element. Return*/
-			return -ENOBUFS;
-		}
-
-		/* Push the element*/
-		ia_css_circbuf_push(&qhandle->desc.cb_local, item);
-		return 0;
-	}
-
-	return ia_css_queue_enqueue_remote(qhandle, item);
-}
-
-static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
+int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -170,29 +112,7 @@ static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
 	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
 }
 
-int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
-{
-	if (!qhandle || NULL == item)
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		if (ia_css_circbuf_is_empty(&qhandle->desc.cb_local)) {
-			/* Nothing to pop. Return empty queue*/
-			return -ENODATA;
-		}
-
-		*item = ia_css_circbuf_pop(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_dequeue_remote(qhandle, item);
-}
-
-static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
+int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -213,24 +133,7 @@ static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
 	return 0;
 }
 
-int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
-{
-	if ((!qhandle) || (!is_full))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_full = ia_css_circbuf_is_full(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_is_full_remote(qhandle, is_full);
-}
-
-static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -251,24 +154,7 @@ static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t
 	return 0;
 }
 
-int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_free_elems(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_free_space_remote(qhandle, size);
-}
-
-static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -289,24 +175,7 @@ static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t
 	return 0;
 }
 
-int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_used_space_remote(qhandle, size);
-}
-
-static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
+int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -339,31 +208,7 @@ static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_
 	return 0;
 }
 
-int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
-{
-	u32 num_elems;
-
-	if ((!qhandle) || (!element))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		/* Check if offset is valid */
-		num_elems = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
-		if (offset > num_elems)
-			return -EINVAL;
-
-		*element = ia_css_circbuf_peek_from_start(&qhandle->desc.cb_local, (int)offset);
-		return 0;
-	}
-
-	return ia_css_queue_peek_remote(qhandle, offset, element);
-}
-
-static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
+int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -384,24 +229,7 @@ static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
 	return 0;
 }
 
-int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
-{
-	if ((!qhandle) || (!is_empty))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_empty = ia_css_circbuf_is_empty(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_is_empty_remote(qhandle, is_empty);
-}
-
-static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
@@ -422,21 +250,3 @@ static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
 
 	return 0;
 }
-
-int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		/* Return maximum usable capacity */
-		*size = ia_css_circbuf_get_size(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_size_remote(qhandle, size);
-}
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index d62133a8fe6f8..776c6d6cb1fcc 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -43,11 +43,9 @@
 	} while (0)
 
 struct ia_css_queue {
-	u8 type;        /* Specify remote/local type of access */
 	u8 location;    /* Cell location for queue */
 	u8 proc_id;     /* Processor id for queue access */
 	union {
-		ia_css_circbuf_t cb_local;
 		struct {
 			u32 cb_desc_addr; /*Circbuf desc address for remote queues*/
 			u32 cb_elems_addr; /*Circbuf elements addr for remote queue*/
-- 
2.43.0

