Received: from outbound.baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA11AA1D2;
	Wed, 27 May 2026 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878837; cv=none; b=aMajrRNaJko1I7MuIPdyFZ9C8Zgx8I5yIu1/OJtI2M8PVe/0Q5XnkQrfbYiBe/ATB2vZ3O5ysA7iHGgm4zoMJDw/RL6cdJHfbGKmY8LuEvjf3KSD4haqvd4F5td0FlkSsjmzDydGnBkGR3eQOXGmoKbIy+6WvW19OJMjH6Ygv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878837; c=relaxed/simple;
	bh=JZoGYpZLqLyD09xcS3xqrvT4bGx+nv/+GYlTzvfpUPM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HCBpMFKFr1vAD7AFatMpSQ/RiBP43v1XQg7XmUPCcPlOGRqw0lzW8HIfRBHLW4KBCBExFVI7DG470PehMslhBdzoqfdpNGHXMmsyJ26YWJ0FgIsdpGUtotJxmmk0UXR+1riVRO5uYbeYzic0JFxbg29Ae4gt/UMhLn/lDhr/vP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=TaYc9YRm; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="TaYc9YRm"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] dma-buf: Move dma_resv_assert_held() after input validation
Date: Wed, 27 May 2026 06:44:49 -0400
Message-ID: <20260527104449.2350-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc2.internal.baidu.com (172.31.50.46) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1779878699;
	bh=8wxiXP655DLDne+j37kjUbGvhP71Q5D+Jw5Sn2qPwtM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=TaYc9YRm50UTB3PERjLWE9PFLf2rUKjf6YsOz++tHMhErOOBfr8yKMCvsuMDlcgHh
	 WjQ92PnYmoK6my3wLAUVW2vdj35v3uNbpjxV6UQOc008dKZCTkTUWTNi6HbaomhtK2
	 9Ksis3y3oHGNoDd3pThW2Q4R8+V5NtnNAlq9w6N3wBGa2Rnq4yHklSwlC5nOtAOfTy
	 1o5XRmiIusLKuqcu7oMJsy3UpqpupBhjwj4l8EZypZKKKWR+OuBJ2BSKUnyFbPg95r
	 Pav5xlHwVP2j+FoVhJLHJLdmV9PyPXKVY6zT+ujJf5G0FkMmUNDZu/2XRvw0P2U5m9
	 EgDhAmGcs5iww==

From: Li RongQing <lirongqing@baidu.com>

Move dma_resv_assert_held() after the validation of 'attach' and
'attach->dmabuf' to avoid a potential null pointer dereference if
the function is ever called with invalid arguments.

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 drivers/dma-buf/dma-buf-mapping.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff..e6ecd6c 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -102,12 +102,12 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 	size_t i;
 	int ret;
 
-	dma_resv_assert_held(attach->dmabuf->resv);
-
 	if (WARN_ON(!attach || !attach->dmabuf || !provider))
 		/* This function is supposed to work on MMIO memory only */
 		return ERR_PTR(-EINVAL);
 
+	dma_resv_assert_held(attach->dmabuf->resv);
+
 	dma = kzalloc_obj(*dma);
 	if (!dma)
 		return ERR_PTR(-ENOMEM);
-- 
2.9.4

