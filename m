Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774826;
	b=FV9cF74dzfc2mZq77voYdKbu1eWqhgRMMLgiFAaOeOcoMkiikdV/HZmB8zsDD7rWesNo
	 haYdRg1nC/zCwgmJjdlTuKQeNZZ+BCVliZ8QAnJDl8gukqgiFZiNamIJ2p7tW2uOc68V8
	 K7VSORBCVn7iizjBtV0X1luExImVbzsp67R3xngSshJJj6jYlqiqwWsnv3pQO4akqdb8g
	 KRMuuypFo4SGvoySc5/6mR8SSQQ4XkRexQBCwFUPumn4LAc4LN07pEqdTPIOL1eUPczU4
	 XSYB4ihot5j/guQs32UezALR/L9iccZRrfJ3U+bKowTaZrhHlBPsZj+XHfz9ABHrSmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774826;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5H5ym8yFS5kShUZR5Q7c6s45Tl481Zh55Tk93vajtz0=;
	b=2rCtHpb0zznsD4Zqc5SgabRVmHNxr0XZh1Jk61esKjatknfaw8miZPgtxWJYSkzn4BEt
	 h8L/bXRw+xUjuKlDClFPI2MeOOfCMYbkHcNm+rieZPn0GEk7qi8tv8iFJ40Rq6OXtZa6k
	 iYhyCjbkliISqrSotoVvvQOcPQ8jg/Vke8aCU3Tj2lfZvZ+RSdEW7xgbdAh9CJt9YOZCq
	 IIrhX3yrDdRVUW0lPhMozJPQbTx4+MjDWQZUSpqUuefvR+xPO542Ss9ZI2FQ/bnst1WuM
	 xTUYCCjUf/9IAN65pcZ2bWjeE2loac9ZYRp9Zd/0OrhK49ua7Rcc5mGXl8BFO4Rv7Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eibUD7gr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A070606A329;
	Fri, 27 Nov 2026 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eibUD7gr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF4B1F000C1;
	Fri, 27 Nov 2026 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774826;
	bh=5H5ym8yFS5kShUZR5Q7c6s45Tl481Zh55Tk93vajtz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eibUD7grCnexTntNTZygSHANiIgIllSgHQn1UzMNEKaKhFiiH45/H5uDgmdSl85e+
	 80Es/d3VVdGyzfeXaCM2hdR4DiLmccvcwGiyBHs0OSexkWLZcwJZV5qPCyI6SZ/N1i
	 mHCeJKpFpfbYYgbSPGar0U3JMHjk/dqtS03ItKkV+DHtocO5GYfWfbHuPw/WzHltk5
	 lnntstck3tY7O18iN+erWEK4QZI+s4zLUx3h6ViN+vHFfZsVJ8IR6lV5U4Ib+ZlwDH
	 iBX0oVRziVjYMHg5San6xYMaYAz/Wi0NDXp1pkGTfV+njYJO/0aLGELtMR6omX/LaF
	 90zOfizUHfF2A==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Ruslan Vagner <rusya92266@gmail.com>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 4/8] dma-buf: dma-fence: Improve dma_fence_timestamp()
Date: Fri, 27 Nov 2026 11:18:09 +0100
Message-ID: <20261127101812.2706432-6-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127101812.2706432-2-phasta@kernel.org>
References: <20261127101812.2706432-2-phasta@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_fence_timestamp() can be made a more robust and useful function by
having it return an error code that indicates whether the fence was
signaled or not. Only if it's signaled, returning a timestamp makes
sense, otherwise the user should choose what value to interpret as a
replacement.

Have dma_fence_timestamp() return an integer status code. Return the
timestamp via a pointer.

To be able to port drm_sched, move its hack for overwriting functions to
a temporary function for now.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence-unwrap.c       | 20 +++++++++-----
 drivers/dma-buf/sync_file.c              |  8 +++---
 drivers/gpu/drm/scheduler/sched_entity.c |  4 +--
 drivers/gpu/drm/scheduler/sched_main.c   | 34 +++++++++++++++---------
 include/linux/dma-fence.h                | 20 ++++++++------
 5 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 120fe0c2a75a..a1e9b1ee2c32 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -136,10 +136,14 @@ struct dma_fence *__dma_fence_unwrap_merge(size_t num_fences,
 				unsignaled = dma_fence_get(tmp);
 				++count;
 			} else {
-				ktime_t t = dma_fence_timestamp(tmp);
+				ktime_t fence_ts = ktime_get();
+				/* Leaves fence_ts unchanged if fence is not yet
+				 * signaled.
+				 */
+				dma_fence_timestamp(tmp, &fence_ts);
 
-				if (ktime_after(t, timestamp))
-					timestamp = t;
+				if (ktime_after(fence_ts, timestamp))
+					timestamp = fence_ts;
 			}
 		}
 	}
@@ -168,10 +172,14 @@ struct dma_fence *__dma_fence_unwrap_merge(size_t num_fences,
 			if (!dma_fence_is_signaled(tmp)) {
 				array[count++] = dma_fence_get(tmp);
 			} else {
-				ktime_t t = dma_fence_timestamp(tmp);
+				ktime_t fence_ts = ktime_get();
+				/* Leaves fence_ts unchanged if fence is not yet
+				 * signaled.
+				 */
+				dma_fence_timestamp(tmp, &fence_ts);
 
-				if (ktime_after(t, timestamp))
-					timestamp = t;
+				if (ktime_after(fence_ts, timestamp))
+					timestamp = fence_ts;
 			}
 		}
 	}
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 2166bbdf7e4a..54ef230bcc4b 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -268,6 +268,7 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
+	ktime_t fence_ts = ktime_set(0, 0);
 	const char __rcu *timeline;
 	const char __rcu *driver;
 
@@ -282,10 +283,9 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 		sizeof(info->driver_name));
 
 	info->status = dma_fence_get_status(fence);
-	info->timestamp_ns =
-		dma_fence_is_signaled(fence) ?
-			ktime_to_ns(dma_fence_timestamp(fence)) :
-			ktime_set(0, 0);
+
+	dma_fence_timestamp(fence, &fence_ts);
+	info->timestamp_ns = ktime_to_ns(fence_ts);
 
 	rcu_read_unlock();
 
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 03e68b4102d5..5ceffb4d3114 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -78,8 +78,8 @@ ktime_t drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
 	struct drm_sched_fence *s_fence = job->s_fence;
 	ktime_t start, end, duration;
 
-	start = dma_fence_timestamp(&s_fence->scheduled);
-	end = dma_fence_timestamp(&s_fence->finished);
+	dma_fence_timestamp(&s_fence->scheduled, &start);
+	dma_fence_timestamp(&s_fence->finished, &end);
 	duration = ktime_sub(end, start);
 
 	spin_lock(&stats->lock);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 44553db9b04c..e515bfa949b4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -898,6 +898,26 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	return IS_ERR(entity) ? NULL : entity;
 }
 
+/*
+ * This is a temporary, hacky function until we can find a canonical solution
+ * for not overwriting fence timestamps.
+ *
+ * FIXME: Remove this hack.
+ */
+static void drm_sched_overwrite_scheduled_ts(struct drm_sched_job *current_job,
+					     struct drm_sched_job *next_job)
+{
+	struct dma_fence *current_fence = &current_job->s_fence->finished;
+	struct dma_fence *next_fence = &next_job->s_fence->scheduled;
+	ktime_t current_finished, next_scheduled;
+
+	if (dma_fence_timestamp(next_fence, &next_scheduled) != 0)
+		return;
+
+	if (dma_fence_timestamp(current_fence, &current_finished) == 0)
+		next_fence->timestamp = current_finished;
+}
+
 /**
  * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
@@ -928,19 +948,7 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 		next = list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
 		if (next) {
-			/* Make the scheduled timestamp more accurate.
-			 *
-			 * TODO
-			 * The test_bit_acquire() is a hotfix against timestamp
-			 * misordering. Replace it with something better.
-			 *
-			 * The counter-part of the barrier is located in
-			 * dma_fence_signal_timestamp_locked().
-			 */
-			if (test_bit_acquire(DMA_FENCE_FLAG_TIMESTAMP_BIT,
-				     &next->s_fence->scheduled.flags))
-				next->s_fence->scheduled.timestamp =
-					dma_fence_timestamp(&job->s_fence->finished);
+			drm_sched_overwrite_scheduled_ts(job, next);
 
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 1c1aa4c7635a..70bb8434ac1a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -679,21 +679,25 @@ static inline void dma_fence_set_error(struct dma_fence *fence,
 /**
  * dma_fence_timestamp - helper to get the completion timestamp of a fence
  * @fence: fence to get the timestamp from.
+ * @ts: a place to store the timestamp to.
+ *
+ * Writes the fences timestamp into @ts if the fence is already signaled.
+ * Leaves @ts unchanged otherwise.
  *
  * Return:
- * The fence's timestamp if the fence is already signaled, the current time
- * otherwise.
+ * 0 if the timestamp was written to @ts, -ENOENT if the fence was not yet
+ * signaled.
  */
-static inline ktime_t dma_fence_timestamp(struct dma_fence *fence)
+static inline int dma_fence_timestamp(struct dma_fence *fence, ktime_t *ts)
 {
 	unsigned long flags;
-	ktime_t ret;
+	int ret = -ENOENT;
 
 	dma_fence_lock_irqsave(fence, flags);
-	if (WARN_ON(!test_bit_acquire(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)))
-		ret = ktime_get();
-	else
-		ret = fence->timestamp;
+	if (dma_fence_test_signaled_flag(fence)) {
+		*ts = fence->timestamp;
+		ret = 0;
+	}
 	dma_fence_unlock_irqrestore(fence, flags);
 
 	return ret;
-- 
2.56.0

