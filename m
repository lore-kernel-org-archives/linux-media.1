Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5102D4746DF
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 20:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481214; cv=none; b=qLGXOJ2PF/p5AAOc43EZf6XZcVBT8ez49zrylCCp9Z/P2S5Ik/wAN+otykvy/NrtSHugX3dihKJC2pL05HBI/KOUk1McjeHnG2z2sMPNfs6dw8Ct0gGgRfsZXYQKP61FFWL9EtwMVaz5oiqu+c+UcyRfXK9RKh3s0G4sz60n3jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481214; c=relaxed/simple;
	bh=l6/81gtxbZ60/Hvdpw288NKu5EBB5kJc2RhGV7Ufscc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUnRC6x5/+Wi7vxMAaUOM4LoWu/aV37dovrfmFmxL5DQkfWhcpHGpk7ok73nzHWNtIsytvmd2reXbScbqaWfKr8jzgsrbNyx54/g91NJGXtQniTa/2Lb2FSbbuV8I46BIf+iZX/ODn0hbZq9749+jDVQDdUFyo5jDBS5cS5iyTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kaitmazov.com; spf=pass smtp.mailfrom=kaitmazov.com; dkim=pass (2048-bit key) header.d=kaitmazov.com header.i=@kaitmazov.com header.b=bNewAhB1; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kaitmazov.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaitmazov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaitmazov.com header.i=@kaitmazov.com header.b="bNewAhB1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaitmazov.com;
	s=key1; t=1786481210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVMLOnuxl7jMrjiQSGAnMsEYe1sxvBWDZDUQnH2kIwI=;
	b=bNewAhB1g3t4EHoKZ1aX+FJxAwyV9z6B3WMHC5i8bqglyM61XcVR2+Zkbcm/DfRY66lSCm
	YpeYkYKtiSuAPfwf/FANhWOO8uIU/L5rPYPUswuE95cq1bL5HbqLRlwcnY7TnIYTj7LvFi
	5tSv6oaKWIdrgSrO5WET+94mT5LYRWiExSSPSVVvbhcBfAmkwaz1Q0eqsFIaR3bYAs5jzr
	ipbrvAzQPZC5lMYXeqe1PQUyCEHDdA5AjU3dFeJStnoxJPg4IYfAhJLa3huwnC4UWQzHuZ
	Ll6su59EujFucEiX7fafZmqOKB2spAEV6WgbswXVtpeblSUf7iDs84vK88cv+A==
From: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
To: mamin506@gmail.com,
	lizhi.hou@amd.com,
	ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
Subject: [PATCH 2/3] accel/amdxdna: add a quiet variant of amdxdna_gem_vmap()
Date: Tue, 11 Aug 2026 23:45:55 +0300
Message-ID: <20260811204556.875037-3-taimuraz@kaitmazov.com>
In-Reply-To: <20260811204556.875037-1-taimuraz@kaitmazov.com>
References: <20260811204556.875037-1-taimuraz@kaitmazov.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

amdxdna_gem_vmap() logs an error whenever the mapping fails, which suits
its callers: each of them treats a failure as fatal to the operation it
is performing. The next patch adds one that does not, and an exporter
that implements no vmap op fails every call without anything caching
that, so a logging probe would print on every ioctl.

Split the mapping out into __amdxdna_gem_vmap(), which returns the error,
and leave amdxdna_gem_vmap() as that plus the log. No caller changes: it
still returns the address, or NULL after logging.

Signed-off-by: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index b66ec9e48..d0c846b02 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -191,12 +191,8 @@ amdxdna_gem_destroy_obj(struct amdxdna_gem_obj *abo)
 	kfree(abo);
 }
 
-/*
- * Obtains a kernel virtual address on the BO (usually of small size).
- * The mapping is established on the first call and stays valid until
- * amdxdna_gem_vunmap() is called.
- */
-void *amdxdna_gem_vmap(struct amdxdna_gem_obj *abo)
+/* Returns the error instead of logging it. */
+static void *__amdxdna_gem_vmap(struct amdxdna_gem_obj *abo)
 {
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
 	int ret;
@@ -210,13 +206,28 @@ void *amdxdna_gem_vmap(struct amdxdna_gem_obj *abo)
 	if (!abo->mem.kva) {
 		ret = drm_gem_vmap(to_gobj(abo), &map);
 		if (ret)
-			XDNA_ERR(abo->client->xdna, "Vmap bo failed, ret %d", ret);
-		else
-			abo->mem.kva = map.vaddr;
+			return ERR_PTR(ret);
+		abo->mem.kva = map.vaddr;
 	}
 	return abo->mem.kva;
 }
 
+/*
+ * Obtains a kernel virtual address on the BO (usually of small size).
+ * The mapping is established on the first call and stays valid until
+ * amdxdna_gem_vunmap() is called.
+ */
+void *amdxdna_gem_vmap(struct amdxdna_gem_obj *abo)
+{
+	void *kva = __amdxdna_gem_vmap(abo);
+
+	if (IS_ERR(kva)) {
+		XDNA_ERR(abo->client->xdna, "Vmap bo failed, ret %ld", PTR_ERR(kva));
+		return NULL;
+	}
+	return kva;
+}
+
 /*
  * Free mapping established through amdxdna_gem_vmap()
  */
-- 
2.55.0

