Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D583BC68D
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777310770; cv=none; b=OJ+tg8EgErZxuqxlIucKUXJCchYu4Dt2cIkOLx7AQdCAPFgTVyJahXeM2KgByiFx52QbYdIjdyc0VbGF56qJEKrDZzl/VclzgzA6WdjN+TIuWq+wZtxn1x5OQDSyR4wz34kwlXlxFoiRe8AFSVmPrpFHTx0BFzxk7nZErImOPyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777310770; c=relaxed/simple;
	bh=JG8mxS9i7QQZ6A/BJBB1M9zNmRM6umvWte7BVTi3Gos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RcwH0I+eEjYFuC35GvtYknj1MyrZX5+lnwVAZ4x+uIyY016f3Fsfaj4Owk17HiX3cuXhbPtymCWiCd8A5hwov6uJpZ9zdHsr99dfkPyNE/vyOhfX41PzvlcQufj1CfnCUK6aoJJegcZ+o5Ucmro0xaNdD9sA19rXvmr/1PrwgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=syeXzU9Q; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="syeXzU9Q"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777310756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Wd0ztt1cxde3+fGD/1IJw2pKKT81J5P1qKg+eBGc9A=;
	b=syeXzU9QyDJ8aW3SRcVjkxpVJYsA5gTo25Xq/O/czeK8DZT91hKz+8/wwADDGUF+FaoVZ5
	rznbhciY+O99TZZfU0XZbwlCRBk966EhookPYX1LR+XsXvA8IhxG1OiAOV8NN0BXKNB/d0
	GBsNCLrIOR0Ev4NGkkiuGwJBU5OilNw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: heaps: use max3() in dma_heap_ioctl
Date: Mon, 27 Apr 2026 19:25:21 +0200
Message-ID: <20260427172519.417333-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=thorsten.blum@linux.dev; h=from:subject; bh=JG8mxS9i7QQZ6A/BJBB1M9zNmRM6umvWte7BVTi3Gos=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnvZ///y9p5yaFJ4GPc2SNFdnkX35UtEbH1sdt8sLGhL 0KQf0ZaRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEykvIaRoUFa4TD3y46q+Llz vjOeXFa80Kq9Z0HER8XzbfMfu4vUSDP8T/mpcPZx0cdCWea9s8uCDGrX8sYunnL80NbUvV0CVoG 9/AA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace two nested max() calls with a single max3() in dma_heap_ioctl().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/dma-buf/dma-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index ac5f8685a649..52eec2ebb2e8 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -153,7 +153,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		in_size = 0;
 	if ((ucmd & kcmd & IOC_OUT) == 0)
 		out_size = 0;
-	ksize = max(max(in_size, out_size), drv_size);
+	ksize = max3(in_size, out_size, drv_size);
 
 	/* If necessary, allocate buffer for ioctl argument */
 	if (ksize > sizeof(stack_kdata)) {
