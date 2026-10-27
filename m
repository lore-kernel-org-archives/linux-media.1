Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142512;
	b=wpyIjTXHWuqEuLeayBQOghwaTBZwOafwJmaQ0RRx6VaFAQR7pNIUhg7W+KVG6BP549jm
	 ZW+cKW26VlbFgSizRd60YjmF29gEdC2XCwtuoDkfF2VGq3sKBWriAqDXchBX8cS+7Yiki
	 XfOMXvRf4KAkM4XydT2G6FiiQp1S9FTYDcQqJUolmE6eyLd9oHDBn1rl2H4JCc13X2e5q
	 k7v98qZ0XL9rEsMe//KDdkXVhXAbb69WZ/Z1B4TI1jAfXEyIX/uqs9tafgg2nHM0PVJrK
	 jYLBY8fkDXbGfkWkg0MHkfkb+3szN9CrWYUxaN9ySf2ZtUj9s3MVafVqpSoO857ILGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
	b=lPmFLA29jVNSovR2yQrldrC/dKvkhXwic55aH3FmymNGaNzBTCNSRSdti72fbVvbHYkt
	 1dIJe63Ba6m70eZB/hLCGGxn6VAF+ftFg6lr1E1kXWWNSYHJV+o+qHJY4HrYOI885o35z
	 4G1yopcmSSWWwlBdOTPfkUEA5zscJvjFB+z3zoFQNBnLcuBYMMKYBT2bs/M0RJkV23RGI
	 I5esWFDT21jv8RtGrwwrT4HT34FwD1vmBx7k15KQdmW1bDUxWAECjTxkUCO9P4Ia5WvXZ
	 cGHt7J/baQU2Dqud1n2ZA51aN6jXkBf7IBTe2ARW7O9uGi5rOWiua25DRobGI4msFzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1JEifzE;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2DE606A326
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 23:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1JEifzE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so2810275e9.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142511; x=1793747311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
        b=N1JEifzE8WJuAFdjki2cOGRWaqZA15OX1oNx7Veggg1n3WM5RxsQl+5MDCSBYimjGw
         OyUp6OssqDhobUzZxSm9u85xfihhNLx+2UFk7X1NJlY9cYQmu8wJ/vOBt34u3mam+kxu
         eDgZTp/6dLp3HMkSkM/3mHD1/DDosBOzHs9WOZFfutAj950PUgGOW+FvG/ARwi4n/fC3
         aHJXUTuXo6Fa8h6WUE7STPm+rzja+HT5OchC9i3ExJEypsSfLxhGJD7AU1Cp/xTh3yur
         ma1cAek2BmIhU2oABqpJ8hsbIHmQAwtfzVN1c6bNZFwVSF/Qjw6Mo/R14ntTdozVP2aU
         S9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142511; x=1793747311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
        b=lG9JYzQhqyCenJ2gtoExu5xL+vj+mT0MCZ6PAUZJvhqNF//bTDE16eUttiQ5yJ3YRz
         rQP7/fXoSx0imSfw96b2VLe0JfYXU178JYvsNMOi2lyCOM3aA2NuMSep9tMkJ6OUIpd5
         rd/5LfLU3MlJH9ibeQx9WGMj93J4zrx7Ermh0P8agJ7+LyJzNcoAyyX7FdnJz4ZhRZeG
         /z7ACdve6egtEUTJ73rd0TSn+6RV3CbKfDnzDjV48kcxaGHiwZoqMiI0v3cIGYa9PJKV
         rd46lczeECIHhzvBGnfudaQNN7MD+DN1932fdz7PSeKvT7BQZrULgjfDF11hjjpn7yQo
         wg4w==
X-Forwarded-Encrypted: i=1; AKwUvBxpiK4tp6mpm/x1M/M+lUloliY3u3CBZyZ6wRy4MMWLByxzPACHCDFFp2dK26xOhpz79Q4j+Jo3S/llXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7C2sGfvHl8VRc7jA026FcPVwyZZcBy1IPR6ECK7ogIsWlrMHd
	Ppeis7Djsj2sGWuG8P5w2GGNKEQQOhhmowO8b96klQgyAYbdiXkJz11e
X-Gm-Gg: AYBFou1FE3WtqAagu3n06xFYqwHqpp5oc6yb188N+C4usSjU8ZE4w7/tw0QqnWeuPyj
	dWtTRCu90figrkJC67AcF8YFyVpdEch0nQbZBO/dPCvfSP3ZlDrb8vx2cT7rG5wEkaHJWZ/lSq5
	p64arF/2cuFug9nKDDQ/NMIl1FHs/J5G6+yVNNG403MHiZADi3h0gXWQl6pLzOs8pDSBEEHJ/SF
	nUSrslk1JDcUb1LiWQ9esz+IOsZq3IQEWXocAb0c9h7LK2jczN7Hi8VcbjijmNVpYvEhT8YmsCU
	az6FAezf5fi0o50dgh+G2heudtDZQ/L01RHB5Bb0V+Req0vpfFNZjD7N2CH1mlsqnH8m3XaL0pa
	w8E7AuEuIPMZbREA9sgMGlHWrIV2i0EuC2EXKomdqQd7/D6BiKOYBTvXBg+8s6H5w9TfdK6CrQn
	sWTffr5w5bWm2SF3UYZh/cChM5CIvWiY4ogZ9dVf2qt+iTLqPAgq2A3HI0LNWc0E0mktHMaej2H
	bmb37SG58OXTEpc9tUnUd8omA7Isw5Q2xMRZErYlD2Ex2Cj8e96E1xuFxU1h9IvvB91P/9KqUBe
	UUL796yC8gjc3OEBEzdlcrEI
X-Received: by 2002:a05:600c:8b78:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a9672fa52cmr8085195e9.27.1793142510534;
        Tue, 27 Oct 2026 16:08:30 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.29
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
Subject: [PATCH v4 2/5] media: atomisp: queue: move remote queue handling into helpers
Date: Tue, 27 Oct 2026 23:08:04 +0000
Message-ID: <20261027230807.2407261-3-vladurares@gmail.com>
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

Move the remote queue branch of every queue operation into its own
static helper, written the way the function is meant to look once the
unused local queue support is gone, and call it from the existing
function after the local branch.

While at it, tidy up the moved code: drop the redundant parentheses
and '!= 0' comparisons, use !ptr instead of comparing to NULL, and
return the result of the final ia_css_queue_store() call directly.

This prepares for removing the local queue support in the next patch
and keeps that change easy to review. No functional change intended.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../atomisp/pci/runtime/queue/src/queue.c     | 402 ++++++++++--------
 1 file changed, 226 insertions(+), 176 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index d27c6567daeb0..4212c113da41a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -70,10 +70,46 @@ int ia_css_queue_uninit(ia_css_queue_t *qhandle)
 	return 0;
 }
 
-int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
+static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	int error;
 
+	if (!qhandle)
+		return -EINVAL;
+
+	/* a. Load the queue cb_desc from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_full(&cb_desc))
+		return -ENOBUFS;
+
+	cb_elem.val = item;
+
+	error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
+	if (error)
+		return error;
+
+	cb_desc.end = (cb_desc.end + 1) % cb_desc.size;
+
+	/* c. Store the queue object */
+	/* Set only fields requiring update with
+	 * valid value. Avoids unnecessary calls
+	 * to load/store functions
+	 */
+	ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
+
+	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
+}
+
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
+{
 	if (!qhandle)
 		return -EINVAL;
 
@@ -89,48 +125,53 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 
 		/* Push the element*/
 		ia_css_circbuf_push(&qhandle->desc.cb_local, item);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		/* a. Load the queue cb_desc from remote */
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		if (ia_css_circbuf_desc_is_full(&cb_desc))
-			return -ENOBUFS;
-
-		cb_elem.val = item;
-
-		error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
-		if (error != 0)
-			return error;
-
-		cb_desc.end = (cb_desc.end + 1) % cb_desc.size;
-
-		/* c. Store the queue object */
-		/* Set only fields requiring update with
-		 * valid value. Avoids unnecessary calls
-		 * to load/store functions
-		 */
-		ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
-
-		error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
+		return 0;
 	}
 
-	return 0;
+	return ia_css_queue_enqueue_remote(qhandle, item);
+}
+
+static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !item)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_empty(&cb_desc))
+		return -ENODATA;
+
+	error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
+	if (error)
+		return error;
+
+	*item = cb_elem.val;
+
+	cb_desc.start = (cb_desc.start + 1) % cb_desc.size;
+
+	/* c. Store the queue object */
+	/* Set only fields requiring update with
+	 * valid value. Avoids unnecessary calls
+	 * to load/store functions
+	 */
+	ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;
+
+	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
 }
 
 int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
-	int error;
-
 	if (!qhandle || NULL == item)
 		return -EINVAL;
 
@@ -145,47 +186,35 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 		}
 
 		*item = ia_css_circbuf_pop(&qhandle->desc.cb_local);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		if (ia_css_circbuf_desc_is_empty(&cb_desc))
-			return -ENODATA;
-
-		error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
-		if (error != 0)
-			return error;
-
-		*item = cb_elem.val;
-
-		cb_desc.start = (cb_desc.start + 1) % cb_desc.size;
-
-		/* c. Store the queue object */
-		/* Set only fields requiring update with
-		 * valid value. Avoids unnecessary calls
-		 * to load/store functions
-		 */
-		ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;
-		error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
+		return 0;
 	}
+
+	return ia_css_queue_dequeue_remote(qhandle, item);
+}
+
+static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !is_full)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	*is_full = ia_css_circbuf_desc_is_full(&cb_desc);
+
 	return 0;
 }
 
 int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 {
-	int error;
-
 	if ((!qhandle) || (!is_full))
 		return -EINVAL;
 
@@ -196,28 +225,34 @@ int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 		 */
 		*is_full = ia_css_circbuf_is_full(&qhandle->desc.cb_local);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*is_full = ia_css_circbuf_desc_is_full(&cb_desc);
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_is_full_remote(qhandle, is_full);
+}
+
+static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	*size = ia_css_circbuf_desc_get_free_elems(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -228,28 +263,34 @@ int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		*size = ia_css_circbuf_get_free_elems(&qhandle->desc.cb_local);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*size = ia_css_circbuf_desc_get_free_elems(&cb_desc);
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_get_free_space_remote(qhandle, size);
+}
+
+static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	*size = ia_css_circbuf_desc_get_num_elems(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -260,28 +301,47 @@ int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		*size = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*size = ia_css_circbuf_desc_get_num_elems(&cb_desc);
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_get_used_space_remote(qhandle, size);
+}
+
+static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	u32 num_elems;
+	int error;
+
+	if (!qhandle || !element)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* Check if offset is valid */
+	num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
+	if (offset > num_elems)
+		return -EINVAL;
+
+	offset = (cb_desc.start + offset) % cb_desc.size;
+	error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
+	if (error)
+		return error;
+
+	*element = cb_elem.val;
+
+	return 0;
 }
 
 int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
 	u32 num_elems;
-	int error;
 
 	if ((!qhandle) || (!element))
 		return -EINVAL;
@@ -298,39 +358,34 @@ int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 
 		*element = ia_css_circbuf_peek_from_start(&qhandle->desc.cb_local, (int)offset);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error =  ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* Check if offset is valid */
-		num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
-		if (offset > num_elems)
-			return -EINVAL;
-
-		offset = (cb_desc.start + offset) % cb_desc.size;
-		error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
-		if (error != 0)
-			return error;
-
-		*element = cb_elem.val;
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_peek_remote(qhandle, offset, element);
+}
+
+static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !is_empty)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	*is_empty = ia_css_circbuf_desc_is_empty(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 {
-	int error;
-
 	if ((!qhandle) || (!is_empty))
 		return -EINVAL;
 
@@ -341,28 +396,35 @@ int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 		 */
 		*is_empty = ia_css_circbuf_is_empty(&qhandle->desc.cb_local);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*is_empty = ia_css_circbuf_desc_is_empty(&cb_desc);
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_is_empty_remote(qhandle, is_empty);
+}
+
+static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
+	int error;
+
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* Return maximum usable capacity */
+	*size = cb_desc.size;
+
+	return 0;
 }
 
 int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -373,20 +435,8 @@ int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		/* Return maximum usable capacity */
 		*size = ia_css_circbuf_get_size(&qhandle->desc.cb_local);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* Return maximum usable capacity */
-		*size = cb_desc.size;
+		return 0;
 	}
 
-	return 0;
+	return ia_css_queue_get_size_remote(qhandle, size);
 }
-- 
2.43.0

