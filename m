Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57B7366057
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074761; cv=none; b=ho4JZjlaMpPaXG5osOVYECc2xlUIVIunUUkTM5mP34E+Pnalep5dzJOaUSjHC0Uiy8xqrhqnhvjvEwp58NTJRG3rvmvqdARCodCN0HtTTol5adFkB6/gPUbtblrsb3s4wyhDoeqAvpQs9mSjJcNgD7Vn1znEmK2lgOkF2DAYNTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074761; c=relaxed/simple;
	bh=eoOmjhohqlc4bD9VkeDoWJkaId5oyMWFqJyMp8PKmmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mKz2YrPMbn9SBpDanHho8gkqUy3Akr7Nqd5WCpUsHhRJUYLDcjSXAJGVpXs2l8Ne5x6ql9f05cFPqaO3QyqH9wpS0vJ5TzYt48Im75V/0Dt7tLnFtXj3B/TEuRODGp6YydVcwBHcPQrKugCwinGyCda9olplDzv4med6owVVM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=h3zjTJe6; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="h3zjTJe6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uCpVefvv5ROP1tgitV0gkmnvwqRDrAl+dZVonDpY3E4=; b=h3zjTJe6X4is8rzoinQsqmcjQH
	KZNRglTsXxg3UhlgM+8TuHHwhPNgUtVQWeEIHC2M+vYasin+X3pytf0O41VGmykYHhfbX74DHm09X
	wbvtmmyn7clzL8fs/pf+59vWpPHq0F47FgujR26xqaHuc7sWXnAXBB9cWg6n2GrSKGI6uX/pIX07o
	QMsp1OIMIszzODgxSJdZGNYsM8/+COgSLRnFMaw2PioeHIgS8D3DI+45KGPdssqhnj0Qxy5Ke5eJp
	XY5KfPoWWDBb8iiEYCQTpeWVjQmZG14g1WYy7YQdqhTZMH5sUjEcnEKfO+UoiUKf6y3X3Ta2J/wLG
	mPMjMl8g==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wCEAv-00FL6B-Pw; Mon, 13 Apr 2026 12:05:49 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/3] dma-fence: Silce sparse warning in dma_fence_describe
Date: Mon, 13 Apr 2026 11:05:24 +0100
Message-ID: <20260413100526.15729-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sparse complains about assigning a string to a __rcu annotated local
variable:

drivers/dma-buf/dma-fence.c:1040:38: warning: incorrect type in initializer (different address spaces)
drivers/dma-buf/dma-fence.c:1040:38:    expected char const [noderef] __rcu *timeline
drivers/dma-buf/dma-fence.c:1040:38:    got char *
drivers/dma-buf/dma-fence.c:1041:36: warning: incorrect type in initializer (different address spaces)
drivers/dma-buf/dma-fence.c:1041:36:    expected char const [noderef] __rcu *driver
drivers/dma-buf/dma-fence.c:1041:36:    got char *

It is harmless but lets silence it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: ac364014fd81 ("dma-buf: cleanup dma_fence_describe v3")
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 1826ba73094c..a2aa82f4eedd 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1037,8 +1037,8 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
  */
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
-	const char __rcu *timeline = "";
-	const char __rcu *driver = "";
+	const char __rcu *timeline = (const char __rcu *)"";
+	const char __rcu *driver = (const char __rcu *)"";
 	const char *signaled = "";
 
 	rcu_read_lock();
-- 
2.52.0

