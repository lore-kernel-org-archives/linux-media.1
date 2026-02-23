Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD7379997
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884093; cv=none; b=iaeGghXtXdEnhEj8r8LmgP27MnOM3Plc/iK87SZD7OlCcsb8JHYqsKO1LDY6ZcIGuQsyw49K9aNmvICE4z/6m2d274ZrfPbiJls6hpkliCXZttzoptjyP5npa1UTRv86BmoqdsVnpCe4LI+VPGIaJoC0efUpxrFA7hEJdK8oMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884093; c=relaxed/simple;
	bh=O7msDbSV/q/aPMQwbkM5TLFQRq+8/vrOQCED1+8NCdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uq9Eq0rfbiXLNQegXlJ27OB59oaTjeLF+rYjg/q/Nr29jF3Dx3EFP3vrqW0q+TZgzx8tJbMsb4ouK4TeOAz42jt5qaeg2Tnl3A7d09eZ9Ubia7nkNKMfeUNgGunSS/CJJydwJQ1aFRAK1stPn9aHVpKcpS0C9VzXdu9TL6DPDYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T50wnAdF; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T50wnAdF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771884090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cx0m4RKg1tjcI09gpNOMxEOQE0GYux9DXoEt7ZAs+co=;
	b=T50wnAdF5NS6LJODD63u0Q0iXUFJUCfVWKAWRCHWBZDCJUzfkQpYYXWD6CNLxdSxw68e1g
	Fg1GaeLRWLQvc9K2x85NBZjp2dyIVlEHz00oPEOawOboR2WazxMfd7EbTMCxrkv0igrxE2
	Ps810Q5/SoC8nXHjHClv4R6ZP4gKSEY=
From: Bart Van Assche <bart.vanassche@linux.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 05/62] dma-buf: Convert dma_buf_import_sync_file() to the early-return style
Date: Mon, 23 Feb 2026 14:00:05 -0800
Message-ID: <20260223220102.2158611-6-bart.vanassche@linux.dev>
In-Reply-To: <20260223220102.2158611-1-bart.vanassche@linux.dev>
References: <20260223220102.2158611-1-bart.vanassche@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Bart Van Assche <bvanassche@acm.org>

Before making changes in dma_buf_import_sync_file(), convert it to
the early-return coding style. No functionality has been changed.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/dma-buf/dma-buf.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 11711874a325..1666133ac8b8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -523,11 +523,13 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
 		dma_resv_lock(dmabuf->resv, NULL);
 
 		ret = dma_resv_reserve_fences(dmabuf->resv, num_fences);
-		if (!ret) {
-			dma_fence_unwrap_for_each(f, &iter, fence)
-				dma_resv_add_fence(dmabuf->resv, f, usage);
-		}
+		if (ret)
+			goto unlock;
+
+		dma_fence_unwrap_for_each(f, &iter, fence)
+			dma_resv_add_fence(dmabuf->resv, f, usage);
 
+unlock:
 		dma_resv_unlock(dmabuf->resv);
 	}
 
