Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774821;
	b=3jCW2MA/dSQ/TMwBxkbaklRABE61Ve7uek6dicuvkDBdwGah8CW0J86xCgDD+goIwYO4
	 nxrqEniGqx8nKLMYQeRr2bbog15Q84iLeBl3BtSVNMUR3KXgQgQO4MQ7F1lk/wzYBuPwb
	 YgWusZhsFpkF7Cv6cUiOJ57Lp9qRqtsRAduhx2kYoc1Ql3L3MVG1172CZOb7OsBSdmPk3
	 E2eYLfP6jLh4A6GVKoxuL9XvQd7Q2otZArja2vFfC3vMq0ecFjGvW5asgiBIDrMdIhCt9
	 HMqNwshAqCEhdIlGFHheSgOBGcivCpWJy1zYOxhda6hg5G4LqRsmib853ayJHDky8qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774821;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=G26qrvYEnf3XkTM55Hz4I7jUepmcpg76jzpe7qYVv+8=;
	b=UarLrUkT6xHj/BA/eQuH5zg5yyjNbJuRQEXUW5nfCoTPEv0ohfXSAMIMVP3p/RxQ2zmB
	 5fugQBQcDHv018QqoYAKXsvnH3k6+xtoKRzWDD2WhOWt4FHwhi46Ex9xZbtA6IuAROQaw
	 z905ef3F9wioynRU5UgQvPADMY9Ac9or5ga+oqexNs3/ESQhw8LWt18pu1/jfxUb4kNPe
	 BBR3JkStyHXa+ezqD2fKq2QRpujcczN7Evtq4nJOUe+xCpPeMQKxtqiRNi+vbkoKaZPEQ
	 An5iAfTVbn/2MqhHy5z7kdL5k0NiDVPu3/gsz6oWwilBfifdkeYapfQAM9Tg7gwXG4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LUnVub/z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35BD606A326;
	Fri, 27 Nov 2026 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUnVub/z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79191F000C1;
	Fri, 27 Nov 2026 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774820;
	bh=G26qrvYEnf3XkTM55Hz4I7jUepmcpg76jzpe7qYVv+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LUnVub/zJIjk7WOXcRX5o1E4BdvdmyLM5vpiIh5/ter7Tb65pG/l+AV+eDQ2lcZw+
	 VP+Zz0UhqUgM7AYzSAyvW9RxL/hplY81ph4uDZayrH+w59EWU//MCs+3Kkc35mxf12
	 ooMxv9IVyZciKc+XcSrq5ODhSVpWES1vENRifb/xBefZWOYbql3hDZVJAjlMjkvL3E
	 efIO9eYIt5p3sOup71mmUXPyIyecDmeHEiMe2yIyWGbm30ex94ENNJgQOxxtCOo7EE
	 s5HIk9OZphLGDJmqcfpYXmwsPXDs3xBNu1TdMRj4OxjvNIpL9GcFqVYEthMNb6yrL5
	 vWZJgIgich70g==
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
Subject: [RFC PATCH 3/8] dma-buf: dma-fence: Ensure ordering with locks for timestamps
Date: Fri, 27 Nov 2026 11:18:08 +0100
Message-ID: <20261127101812.2706432-5-phasta@kernel.org>
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

The memory ordering in dma_fence_timestamp() is currently being done
manually with acquire functions. It can be done more elegantly with the
fence's spinlock. This also allows for removing the TIMESTAMP bit in the
long run.

Use locking in dma_fence_timestamp().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c |  9 ---------
 include/linux/dma-fence.h   | 24 ++++++++++++------------
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index c947aec1bf91..ab02afdb0f18 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -378,15 +378,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	list_replace(&fence->cb_list, &cb_list);
 
 	fence->timestamp = timestamp;
-	/*
-	 * TODO:
-	 * This is a temporary hotfix to prevent misordering until we
-	 * can completely remove the TIMESTAMP bit.
-	 *
-	 * The counterpart of this barrier are the test_bit_acquire()s in
-	 * dma_fence_timestamp().
-	 */
-	smp_mb__before_atomic();
 	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
 
 	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 29c4332c8662..1c1aa4c7635a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -680,23 +680,23 @@ static inline void dma_fence_set_error(struct dma_fence *fence,
  * dma_fence_timestamp - helper to get the completion timestamp of a fence
  * @fence: fence to get the timestamp from.
  *
- * After a fence is signaled the timestamp is updated with the signaling time,
- * but setting the timestamp can race with tasks waiting for the signaling. This
- * helper busy waits for the correct timestamp to appear.
+ * Return:
+ * The fence's timestamp if the fence is already signaled, the current time
+ * otherwise.
  */
 static inline ktime_t dma_fence_timestamp(struct dma_fence *fence)
 {
-	/*
-	 * The test_bit_acquire() calls order against the
-	 * smp_mb__before_atomic() in dma_fence_signal_timestamp_locked().
-	 */
+	unsigned long flags;
+	ktime_t ret;
+
+	dma_fence_lock_irqsave(fence, flags);
 	if (WARN_ON(!test_bit_acquire(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)))
-		return ktime_get();
+		ret = ktime_get();
+	else
+		ret = fence->timestamp;
+	dma_fence_unlock_irqrestore(fence, flags);
 
-	while (!test_bit_acquire(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags))
-		cpu_relax();
-
-	return fence->timestamp;
+	return ret;
 }
 
 signed long dma_fence_wait_timeout(struct dma_fence *,
-- 
2.56.0

