Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741F62D46B3;
	Tue, 23 Jun 2026 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782221717; cv=none; b=SFt37GOL45hMdVZw/zY30d9B5bLIdfSbtiqdj15vrwMXjI1fNQALP49u/S6yg6BYfBtLWne+q6nuorNdyicUU9lra68VqS6tIg1wkBJ7+ixLHejZ41gPjh2tTjwqmr4TWQVwnogVk4x2PGQhLCsXlonobN0MGVYAgZKSyOWPyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782221717; c=relaxed/simple;
	bh=IDr6oRKb7Nqz7KTpc4Vr1ihOJQ5BGo5o0zLwDCFL4TY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNXC7vAVcP/HqLNnEFVAzsfOHwQ+tKhmkDNAqYBq/a4aourSWJKvvsXAqXiVdEbo8Ofzgw1hJk7u6iPvyXiuC/rtP9ujV8Aq/RJyqiG+uTFsguDQ7Np+AkzxvBJ8AY+8iChbGRq7vZQ+FWuZpBEAIL2UF4jlhOKBLY+oah/sC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igm0Ou51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igm0Ou51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782B21F000E9;
	Tue, 23 Jun 2026 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782221716;
	bh=e2L7pUS6THPTgQRuS5kLnP/Z6QEsPEFFQSf/IKODmiY=;
	h=From:To:Cc:Subject:Date;
	b=igm0Ou51B3RVhCU9xzhsZ5mrxW98fjLsXtdFu+r9tuLhjwEZ5VwdM89Wl5zQZ5vac
	 HUvyFmAMlXJDcE0O18a2AqyN8gNcWhrdHGyhQ60FJaySzU07fc5H61gblDiv6KknFs
	 dSefAkLlHxcVnk3PDugrBif9JD4UenmnkzPiK/5EHeZPTOUZE9tSGj4m1x70OrBbMH
	 fvim/X7C81iYRSy4n2XVoBKO0f7miRX3pT6HO/fsq9ENh1Tv7org/glyjO/osvMC/E
	 rwXsj/BPzwLP+sLRV7RrQE40urz+n7KfB2o6KgYxkt5Jw03IW9WTY5FdGA7RGNYXyF
	 dnJB/E0yZTPSw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Tvrtko Ursulin <tursulin@igallia.net>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] dma-buf/dma-fence: Set better string for dma_fence_driver_name()
Date: Tue, 23 Jun 2026 15:34:58 +0200
Message-ID: <20260623133457.1029880-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_fence_driver_name() reports that a driver whose fence is already
signaled is a "detached-driver". This is incorrect, the driver might
still be loaded and running.

Rename that string to something more descriptive.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Just compile-tested.
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index c7ea1e75d38a..9c3dfa7b0066 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1173,7 +1173,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 	if (!dma_fence_test_signaled_flag(fence))
 		return (const char __rcu *)ops->get_driver_name(fence);
 	else
-		return (const char __rcu *)"detached-driver";
+		return (const char __rcu *)"driver-whose-fence-is-signaled";
 }
 EXPORT_SYMBOL(dma_fence_driver_name);
 
-- 
2.54.0

