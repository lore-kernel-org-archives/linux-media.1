Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F0C5616C9
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 19:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156501; cv=none; b=tRk8cKuhVzw1RuvvwM7R8NgvM8dSUT8tXSBQMUc4NzNVHft/9xD93pa0nOu5KnTAUEEfRATwl60QfNwFCdJB5Ct0AQN/u+vKqy/iMtwzTxJ1B5K3cxoeQqW1fRTXyRfzWwABXMs/pcNc699BM/Xb8QGZlZypLDZkigUGaLPPLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156501; c=relaxed/simple;
	bh=XbeleruLc3fvHSxZ/JCm4Tu9QVL6ipJwYJ10zXJUJTY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CJ7wVHih5kS0EJbCTIOim3Ti1aw30oo73d6ILahxNO5rwEJQNhbzkL/TpXiG03AjjEo+EewZf3ZeDrKPuszUVoOPCVg5ry5q5NDOg2RaDTkTfLI8M9MIxGQ8DCO3shlOmQGsRhzH1ley96M3kgLpee9qmzdwug1X2NCV9MGlnBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+ZAwuia; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+ZAwuia"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso15323875e9.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156489; x=1789761289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+i+YV2SDOJ/fUOjXL4JkdG0lXGyDg3CLUWfYcCyxsKs=;
        b=W+ZAwuiaQZ2rrjBpWhRhkN+LNzi8o2prkxvqLSXMWkJPl1T9AL7a/6CGtshMKBT/qm
         d/cQT7Wr7ClL3gUrbHvzedCdIlWNqDG15dDPWQ90z13zWVhrHzoC7qpEzu4GYzf7E3ya
         kgDzFh7bhG7R9LoGolrfRpzC04vZ0vZzCTtFwvduo1aDFH5Wfm/96maL3iIB8mRL2x9a
         yYu87njwQDCYCbrkcgg/ZmLJHuYomPnaE03DFwZoI3L5LKC41j8wdEPz41Epo4zHnTCn
         Z+XIltXnB95wlFPQIIxnGCX++OvZl/5sq0TrpXzp0mj0m+Fpg4dzdz++34M8wC6aizMG
         c9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156489; x=1789761289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i+YV2SDOJ/fUOjXL4JkdG0lXGyDg3CLUWfYcCyxsKs=;
        b=L0pOKrk4lYIwAAGpBU8i04Em+Z6wlbOPm4UtSl4rzLM6VO3pWM0Vfqk+E3UciuRAVg
         xqCjfYE/lRiCg04nhrUoFcWZQGedeWaqNQxv/6tArqPpo771LA1/HDK7gHCvLI2amJPP
         Y+PFvn77sSU1ecToLuAflwihfymVQliBFE/fUXjROu8BRfur1lvM78gPmMx5w6ZH5LI0
         yPS4D18uHmhVwqYRdIbI8JhbMMrq7PSW7gADXqO86fx+rBq5xpYWdLagMLc5RZT5ZLHo
         vC/TYHZyFHgXhtsGXehlZMjw1UX4o+Zu+4cDe6GMktQcr+bLnJ1sp7w9MNeU+s2LH5T7
         bjBw==
X-Forwarded-Encrypted: i=1; AKwUvBweC/6rvI7lQD0bInx3fOf6I9+WLS2PjGcj4/M5t+9Yvova2jO/7Pgh6Q4QISPrKVLI6rncdBzvxsSLew==@vger.kernel.org
X-Gm-Message-State: AFuF++ly9OuL8mRPvZsHuijYc58sSgr2twfjRbCmKHEn9VmWy07kqDlh
	KC1sx+g7Vif84GB1AJ8reqv1wmOzf8b0DUOYh85P6Su94vDiIuIiQche
X-Gm-Gg: AYBFou2rhVBvp4M4+cW49puNJ6WWoPnrikCPRAWJxwEuc6iHPBtOnVpSxt5KUdFKi1D
	LvkGKel+hUt1fCROref5Nq0qPPm1BoJjNCVOOdM0l9ozxJGe7tYgUJT4k9q93VK1qwIeeo+Hg17
	zse4mF3/RGvtB/ehx4SobNrzlWOgmK00UGQKBpK8QHsnsPR656lJa6/BntzWH3XfsQAei+Plhce
	zJK+JHdJmEIyzGLa2onxiEKTHAL4+zbih6dAwP0qA4u0zhhhmzGoF/xs96joyOaacYFnXwxKzFo
	TAvtUK7vOqHE4hKLOlmjgfQyMaxzIGzE0oHNyPakdwqIUXpGJnDjKg9hwBuFK7NFsyRXxRL5JJp
	2XqQKX9WR9pTPaEVl8AmuSqg2qv1Kte5rcyykf6zZPFXu6CLhwDkf+yGLWtlgHdUE4iYZCac70A
	UVs9Hs7QUn01IOXhpAveVI6i+QKX+R1NaDhffxr2DTEohuCD7B1cMDCa1p4xIt6Kqdq2HTVGxaU
	Y2A5hyWBTE7v6CV0hkXRFxUi+a28p0aVwDx8dJUG2u9qUE299rX7fsv3dfeUCnGP/fjoT0ZUlxC
	wZJi5UP86kzt5vnGY62PAbeGvpQvSIBvPnkm
X-Received: by 2002:a05:600d:6501:20b0:49e:69e3:8848 with SMTP id 5b1f17b1804b1-49e69e3916emr21708305e9.30.1789156488932;
        Fri, 11 Sep 2026 12:54:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm92640705e9.2.2026.09.11.12.54.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 12:54:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	=?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Antonino Maniscalco <antomani103@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/gpuvm: Fix names that do not exist in kernel-doc comments
Date: Fri, 11 Sep 2026 21:53:28 +0200
Message-Id: <20260911195328.78529-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPUVM documentation refers to drm_resv and
drm_exec_prepare_object(), but the reservation object type is dma_resv
and the locking helper is drm_exec_prepare_obj().

Use the existing names in the reservation object and map locking
documentation.

Fixes: bbe8458037e7 ("drm/gpuvm: add common dma-resv per struct drm_gpuvm")
Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d1c80ad3deadb7f2e78abf7e50e61ad085391e3f..c43708be348c3659bc7888c1aad25b470ff2cee0 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1051,7 +1051,7 @@ static const struct drm_gem_object_funcs drm_gpuvm_object_funcs = {
  * @drm: the drivers &drm_device
  *
  * Allocates a dummy &drm_gem_object which can be passed to drm_gpuvm_init() in
- * order to serve as root GEM object providing the &drm_resv shared across
+ * order to serve as root GEM object providing the &dma_resv shared across
  * &drm_gem_objects local to a single GPUVM.
  *
  * Returns: the &drm_gem_object on success, NULL on failure
@@ -2718,7 +2718,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  * @req: ptr to drm_gpuvm_map_req struct
  *
  * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
- * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
+ * remapped, and locks+prepares (drm_exec_prepare_obj()) objects that
  * will be newly mapped.
  *
  * The expected usage is::
