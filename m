Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639571;
	b=i8hivgyYJ3G21weLeGbZQbOifYC3WslR/QZ90Cd822gT2wM4t9OXbVZLH7OIMp7PR8OK
	 i4E1L0p1NmmGDw0b/GIflcyK0VNZE+w76gL9cQ5ucYyxYpNY8nd4hBd7a3dBIHLQsUpbX
	 aEG07aTClns2o13KSE8yUXX6cpAGAT5BzWfFn43w5sb1e4DVGvHYp27T3XqWDPrhoH6pz
	 h5CumbgAhao+D5gpYGjWemIccuEShC8ZqGU0qoPlivyv3BNe79kxqGVjQ5Lc+nZTB2Hm+
	 M1cCalzI1vMYat43xvsCCc5T/R8IZD99r+kqdfdNkZpZcrIKWKm5gb0QwL++CC8KYPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8VG88+Iq3vaISnahrDlu9XP6pNoIrIIWL4VTZc72VoQ=;
	b=YAu3gdENim/gQ6uVgpalOstAwiSL1fNzkvLNSYtACXcJrZqh5rsEui+e6F9pPyyu70tR
	 V3iPavk3mSZnPEaJLAlL7blciVs+ffYXQG2Q0u/kzvJMOju4ezzcEMo06RdOZmQN+R+6i
	 W2QZAssohYtFpVuphDiKuDLhNOip3jEcBTrzzeacZN2W0G5cGw0E87re9uG+j4PUBU8I9
	 FOhICThgNSPmzTclruI+T7MBZ5WbAghYBEhiudsIneRX+BPpRxyb5xivIEBH9DqzVtYKr
	 XCPl9lB21t5e1vcNI0dAqDQv4TBT/4yTHRpU5T10zapIGODK2TUPCpug7NAwKeLqxzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="QUj/2aX/";
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B786606A918
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B786606A918
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QUj/2aX/
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so1824618e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793639568; x=1794244368; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8VG88+Iq3vaISnahrDlu9XP6pNoIrIIWL4VTZc72VoQ=;
        b=QUj/2aX/Pwq4cGAOB7apUhZIZsWaAwdu+sFoW0jJU0WB0eQWSyG13Z2acJZ29W6zDE
         vZorbn+qU1kod/QAAk7ciVbRGz7AXMc+HMeuf1czrqMjb/dW7BjH54VdNhqzULY+O0Ox
         Xe9/1Rh6NA1xgRt+9ZRVfCjAuWrGaiZxffgr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639568; x=1794244368;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8VG88+Iq3vaISnahrDlu9XP6pNoIrIIWL4VTZc72VoQ=;
        b=G9Zt1ad+vOIbXGXdPJS3mmLcCF8AJyOmqxKUqy4oaXaMbcfph6vn60av7Ys3pkXKHe
         SiJvznjbk79Jn7+UR3IPFhpCg2bX8yG7KCcXvLJ5II5IdBhseRacGEbfVZkmz51l3J/1
         WtiGqz0cegVLp2jHaesCq+nm0ptVScatM0ExVIYI9H+lJu+sg7qWWOaPzGjbBEWW+q8+
         B/x8pEv/gRcB6BAuvpUzh4xHJfv6xXjgqxSO5J5j4H5B+E03PdmY1qgEuHq8g/7BNZ1D
         Re1BHI0YwN6sBKnDnWUsgKdxj/QzgAMOq47Dz393lI55A8HpolcLed0i0XGj1C3jQyKj
         3YnA==
X-Gm-Message-State: APuU4Z+UigzAfOZd0X8siNR9nwEydmp5qKsZpEIiKvB0KAFOyVxW1KbU
	Z1mqa3kuAGMftWGUNKQHFD5QzzUyWeZKSGLJiKOCB0UFKP71ozuqp1/hBgfsdmmnQw==
X-Gm-Gg: AYBFou2VErU/sHdrdrfZ9FxllNyvZHJgjkVfPRTG/TDPDk0O5O629Q5THhH903qjjvK
	jDiNQyF8EkCCZxu0x9O8ByLrpu3vQ0xWZiUqr75B3GpwnfwAChzmAfBLqa0XiE1P+PEZqAB4CY+
	z3c/crOdJITNyB/ooo8Ne1F+9aZ7LPjj8k9dSWfinE6Rir0QoRTlcBzQZnA9WiRw+7tpDLmAWI9
	kpO/ZoOWIrk21L6F/B0s0yNnrJ+vuEeaJBu6sTs1R40v0Q8vWCM3zBz+YPGPOEV4J/DKe7vKhmN
	6Oi3NzzLylPVbbU7EkXI0kD4L5ISroDx7bqF7jnsKHA6w9RoxGbKuqDpFJKpmkN7x/oVwnS2YK6
	UQqMOIi7aNTPp7zYx8fusJUXoX/xOVozT0I1fGzm6Eo/G/EUoQBSSVwgrFbipILydW7k5gLMFgm
	JFwsU4OJD44vIztskCZ0RranOcM3MzYJAkg290v9loQ0xvFnKnN+UuTMFms7AURsd4ohwoPKPR8
	IyNPGPPIR2NJOKrVJbOAi1Y6A8BFUdAekhGxaU8KUPO6s2oEs7bm8HxR4tJFE9PnVCkQy1jCh23
	FyB+TqXW4e9+2o/S8gQZd5ZLcuoXsA+5d7hACHLm/sWkdg6TqU5/TKPD3y4FPKQko78rKqe3Xal
	Ells5NaYdBA==
X-Received: by 2002:a05:651c:4198:b0:3ab:53ca:c746 with SMTP id 38308e7fff4ca-3acb7a9a3f9mr29982501fa.12.1793639568252;
        Mon, 02 Nov 2026 09:12:48 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd5c479bbsm566121fa.32.2026.11.02.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:12:47 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Nov 2026 17:12:44 +0000
Subject: [PATCH] media: videobuf2: publish buffers in bufs_bitmap under
 mmap_lock
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-vb2-mmap_lock-v1-1-fe550fe03ed8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIvE6GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3bIkI93c3MSC+Jz85GxdS1PLVIPkZJPUlCRjJaCegqLUtMwKsHn
 RsbW1ANTThOxfAAAA
X-Change-ID: 20261102-vb2-mmap_lock-959e0cc4edb3
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

vb2_mmap() only takes q->mmap_lock, not the main queue lock (q->lock).
To keep vb2_mmap() safe, newly allocated buffers must not become visible
in vb2_get_buffer() until they are fully initialized and q->mmap_lock is
held.

Commit a286b0837e13 ("media: core: Add bitmap manage bufs array entries")
started setting q->bufs_bitmap inside __vb2_queue_alloc() before buffer
memory is allocated and without holding q->mmap_lock. As a result:

- A concurrent mmap() can find a half-initialized buffer, and if buffer
  allocation or .buf_init() fails, __vb2_queue_alloc() frees that buffer
  without holding q->mmap_lock, causing a use-after-free in vb2_mmap().
- If fewer buffers are allocated than requested, they are already
  counted as active in q->bufs_bitmap before .queue_setup() checks
  whether the smaller count is acceptable.

Fix this by keeping new buffers only in q->bufs[] during allocation and
setting their bits in q->bufs_bitmap under q->mmap_lock once allocation
and .queue_setup() succeed. Add a memory barrier pair on q->bufs_bitmap
so lockless vb2_get_buffer() readers also see fully initialized buffers,
and let __vb2_queue_free() read q->bufs[] directly when cleaning up
unexposed buffers.

Fixes: a286b0837e13 ("media: core: Add bitmap manage bufs array entries")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
This patch was generated by an LLM, but supervised and reviewed by a
human (not the most handsome human, but a human).
---
 drivers/media/common/videobuf2/videobuf2-core.c | 97 +++++++++++++++++++------
 include/media/videobuf2-core.h                  | 13 +++-
 2 files changed, 85 insertions(+), 25 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f1757..185393078ce3 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -427,19 +427,36 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
 }
 
 /**
- * vb2_queue_add_buffer() - add a buffer to a queue
- * @q:	pointer to &struct vb2_queue with videobuf2 queue.
- * @vb:	pointer to &struct vb2_buffer to be added to the queue.
- * @index: index where add vb2_buffer in the queue
+ * vb2_queue_add_buffers() - publish buffers staged by __vb2_queue_alloc()
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @start:	index of the first buffer to publish.
+ * @count:	number of buffers to publish.
+ *
+ * Set the @q->bufs_bitmap bits of the @count fully initialized buffers that
+ * __vb2_queue_alloc() stored in @q->bufs[] starting at @start, which makes
+ * them visible to vb2_get_buffer().
  */
-static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
+static void vb2_queue_add_buffers(struct vb2_queue *q, unsigned int start,
+				  unsigned int count)
 {
-	WARN_ON(index >= q->max_num_buffers || test_bit(index, q->bufs_bitmap) || vb->vb2_queue);
+	unsigned int i;
+
+	lockdep_assert_held(&q->mmap_lock);
 
-	q->bufs[index] = vb;
-	vb->index = index;
-	vb->vb2_queue = q;
-	set_bit(index, q->bufs_bitmap);
+	/*
+	 * Order the buffer initialization and the q->bufs[] stores done by
+	 * __vb2_queue_alloc() before the bits that publish them. Pairs with
+	 * test_bit_acquire() in vb2_get_buffer(), which is also called
+	 * without q->lock or q->mmap_lock held, e.g. by vb2_find_buffer()
+	 * from a mem2mem .device_run().
+	 */
+	smp_mb__before_atomic();
+	for (i = start; i < start + count; i++) {
+		if (WARN_ON(i >= q->max_num_buffers || !q->bufs[i] ||
+			    test_bit(i, q->bufs_bitmap)))
+			continue;
+		set_bit(i, q->bufs_bitmap);
+	}
 }
 
 /**
@@ -448,6 +465,8 @@ static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, uns
  */
 static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
 {
+	lockdep_assert_held(&vb->vb2_queue->mmap_lock);
+
 	clear_bit(vb->index, vb->vb2_queue->bufs_bitmap);
 	vb->vb2_queue->bufs[vb->index] = NULL;
 	vb->vb2_queue = NULL;
@@ -460,6 +479,11 @@ static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
  * @first_index: index of the first created buffer, all newly allocated buffers
  *		 have indices in the range [first_index..first_index+count-1]
  *
+ * The allocated buffers are stored in q->bufs[] but not published in
+ * q->bufs_bitmap: the caller must either publish them with
+ * vb2_queue_add_buffers() or free them with __vb2_queue_free(), both under
+ * q->mmap_lock.
+ *
  * Returns the number of buffers successfully allocated.
  */
 static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
@@ -506,7 +530,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		}
 
 		vb->state = VB2_BUF_STATE_DEQUEUED;
+		vb->vb2_queue = q;
 		vb->num_planes = num_planes;
+		vb->index = index + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
 		init_buffer_cache_hints(q, vb);
@@ -515,7 +541,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			vb->planes[plane].min_length = plane_sizes[plane];
 		}
 
-		vb2_queue_add_buffer(q, vb, index++);
 		call_void_bufop(q, init_buffer, vb);
 
 		/* Allocate video buffer memory for the MMAP type */
@@ -524,7 +549,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			if (ret) {
 				dprintk(q, 1, "failed allocating memory for buffer %d\n",
 					buffer);
-				vb2_queue_remove_buffer(vb);
 				kfree(vb);
 				break;
 			}
@@ -539,11 +563,20 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 				dprintk(q, 1, "buffer %d %p initialization failed\n",
 					buffer, vb);
 				__vb2_buf_mem_free(vb);
-				vb2_queue_remove_buffer(vb);
 				kfree(vb);
 				break;
 			}
 		}
+
+		/*
+		 * Stage the initialized buffer in q->bufs[]; it becomes visible
+		 * to vb2_get_buffer() only after vb2_queue_add_buffers() sets
+		 * its bit in q->bufs_bitmap under q->mmap_lock.
+		 */
+		WARN_ON(vb->index >= q->max_num_buffers ||
+			q->bufs[vb->index] ||
+			test_bit(vb->index, q->bufs_bitmap));
+		q->bufs[vb->index] = vb;
 	}
 
 	dprintk(q, 3, "allocated %d buffers, %d plane(s) each\n",
@@ -562,7 +595,8 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int
 	struct vb2_buffer *vb;
 
 	for (i = start; i < start + count; i++) {
-		vb = vb2_get_buffer(q, i);
+		/* See __vb2_queue_free() for why vb2_get_buffer() isn't used */
+		vb = q->bufs[i];
 		if (!vb)
 			continue;
 
@@ -580,6 +614,11 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int
  * __vb2_queue_free() - free @count buffers from @start index of the queue - video memory and
  * related information, if no buffers are left return the queue to an
  * uninitialized state. Might be called even if the queue has already been freed.
+ *
+ * Buffers are looked up directly in q->bufs[] instead of through
+ * vb2_get_buffer() so that buffers staged by __vb2_queue_alloc() that were
+ * never published in q->bufs_bitmap (because a later .queue_setup() call
+ * rejected the allocated number of buffers) are freed as well.
  */
 static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned int count)
 {
@@ -587,9 +626,19 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 
 	lockdep_assert_held(&q->mmap_lock);
 
+	/*
+	 * No buffers were ever allocated (e.g. REQBUFS(0) on a fresh queue),
+	 * only the queue state needs to be reset.
+	 */
+	if (!q->bufs) {
+		q->memory = VB2_MEMORY_UNKNOWN;
+		INIT_LIST_HEAD(&q->queued_list);
+		return;
+	}
+
 	/* Call driver-provided cleanup function for each buffer, if provided */
 	for (i = start; i < start + count; i++) {
-		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+		struct vb2_buffer *vb = q->bufs[i];
 
 		if (vb && vb->planes[0].mem_priv)
 			call_void_vb_qop(vb, buf_cleanup, vb);
@@ -624,7 +673,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 		q->cnt_unprepare_streaming = 0;
 	}
 	for (i = start; i < start + count; i++) {
-		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+		struct vb2_buffer *vb = q->bufs[i];
 		bool unbalanced;
 
 		if (!vb)
@@ -676,7 +725,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 
 	/* Free vb2 buffers */
 	for (i = start; i < start + count; i++) {
-		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+		struct vb2_buffer *vb = q->bufs[i];
 
 		if (!vb)
 			continue;
@@ -1000,14 +1049,16 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 
 	if (ret < 0) {
 		/*
-		 * Note: __vb2_queue_free() will subtract 'allocated_buffers'
-		 * from already queued buffers and it will reset q->memory to
+		 * Note: the buffers allocated by __vb2_queue_alloc() were never
+		 * published in q->bufs_bitmap, __vb2_queue_free() frees them
+		 * straight from q->bufs[] and resets q->memory to
 		 * VB2_MEMORY_UNKNOWN.
 		 */
 		__vb2_queue_free(q, first_index, allocated_buffers);
 		mutex_unlock(&q->mmap_lock);
 		return ret;
 	}
+	vb2_queue_add_buffers(q, first_index, allocated_buffers);
 	mutex_unlock(&q->mmap_lock);
 
 	/*
@@ -1125,14 +1176,16 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 
 	if (ret < 0) {
 		/*
-		 * Note: __vb2_queue_free() will subtract 'allocated_buffers'
-		 * from already queued buffers and it will reset q->memory to
-		 * VB2_MEMORY_UNKNOWN.
+		 * Note: the buffers allocated by __vb2_queue_alloc() were never
+		 * published in q->bufs_bitmap, __vb2_queue_free() frees them
+		 * straight from q->bufs[] and resets q->memory to
+		 * VB2_MEMORY_UNKNOWN if no buffers are left.
 		 */
 		__vb2_queue_free(q, *first_index, allocated_buffers);
 		mutex_unlock(&q->mmap_lock);
 		return -ENOMEM;
 	}
+	vb2_queue_add_buffers(q, *first_index, allocated_buffers);
 	mutex_unlock(&q->mmap_lock);
 
 	/*
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a..0b32ac7bc8fc 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -565,8 +565,11 @@ struct vb2_buf_ops {
  * @memory:	current memory type used
  * @dma_dir:	DMA mapping direction.
  * @bufs:	videobuf2 buffer structures. If it is non-NULL then
- *		bufs_bitmap is also non-NULL.
- * @bufs_bitmap: bitmap tracking whether each bufs[] entry is used
+ *		bufs_bitmap is also non-NULL. __vb2_queue_alloc() fills in
+ *		an entry before its bit is set in bufs_bitmap, so buffers
+ *		must be looked up with vb2_get_buffer().
+ * @bufs_bitmap: bitmap tracking which bufs[] entries hold a fully
+ *		initialized buffer. Bits are set and cleared under @mmap_lock.
  * @max_num_buffers: upper limit of number of allocated/used buffers.
  *		     If set to 0 v4l2 core will change it VB2_MAX_FRAME
  *		     for backward compatibility.
@@ -1286,7 +1289,11 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
 	if (index >= q->max_num_buffers)
 		return NULL;
 
-	if (test_bit(index, q->bufs_bitmap))
+	/*
+	 * A set bit guarantees that the buffer is fully initialized, pairs
+	 * with smp_mb__before_atomic() in vb2_queue_add_buffers().
+	 */
+	if (test_bit_acquire(index, q->bufs_bitmap))
 		return q->bufs[index];
 	return NULL;
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-vb2-mmap_lock-959e0cc4edb3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

