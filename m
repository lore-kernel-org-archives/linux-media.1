Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478308;
	b=Pq4f08neVpRPiRATaZa0X1QwJnjD4s0mo8VFwIdCo6GYUoWTza8TToCX/HCJE7VvTmqQ
	 70TDZ4tExl4hLrrKaq96cNHtt4ro/jKbjaY+VMbPPRObfRMwx152jnHaz3R9f8g5EYhlN
	 1ixxrVAloHBznKUPh/HA7rFqKl4mOvycsQNtGp+7a9RibCmogskA7TboAPF+pDToz6GY0
	 hX7wMvju+ZAGjN7+OEF/cQe6NroGfUigE8XrcX6hG1jthae2pigqgPvxRgwVBCljFdHSB
	 ApTGkrpwrZwNKursuZcxhspgbgRnYQm1KXNRNS5hnuTHHUwEVHvGvueekIvLDsqB3Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
	b=mIx11jM4oQElQc3FEPAG1jjYLHf4kQMZyQWuz4OdbEmJcXnRRAQRkignOvTgxA4de//0
	 15UcKWb+Rcx2JiGvXnYgY3foHHSzkEA5NZGqLO06QCMMibHbLbuy2ER3YgsjHVPW6Sakg
	 rVixg1TZTJ4CltE92r6ZaN6G8Qc8c593al4xqd0muWR6hEh078bS5w1iZqAHFX4FZP97+
	 BEqoFvqfeGx0PBdM4xp7S3rBwLNs+CSY9y2PrJMXm9OqPUEvyoR5L4oJE2B7M4DCf9lC6
	 rw4tO0rPdVLBXrRRY6s7VodF894mSaOhh7CZrpdfdfPBBk87NPKfTo2ez2FuLLOJ0iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Aln6DWWQ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A723A60A2602
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A723A60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Aln6DWWQ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b042c0759so1808474f8f.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478306; x=1793083106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
        b=Aln6DWWQ66nyAA9XH0EuCU+6CESveBtk2wAH+eysfQwQxncBnpy32ta5rQJP2FuDG9
         foMXr68z1yIVgvIA0V6vbJV0ZGqtgO/wNwSP+mOmHw2/CgFj2Qx9eiowrJRrhT/ttb+U
         uzN9WFHl2ux1CLe7GuIunPeHCivhj+M5O2rNz53CCeloPsLYiPERQNOrsDOAdc6qtpRP
         ywiMxJL65clx/1iZeHhJFYHAD62irJ/hVko+GSsPoQaMGQPximjG8fLKLYoh/L7LuGj9
         6WwnEo4A9NPLZ/qrE3RiteOxhMTxWtmYNG+nmjTA+c6zk60/7qSAvHHbKL4ZewVqPcCU
         3BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478306; x=1793083106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
        b=lHBGV28Fnh7QXAr7FzNfYTo2AdLwWbCn68S52RT+f5YhANJeaxbreJUosTNUEloLBa
         bjgeEFs+2S8KapQ/oiF4po3jpB1KpZGFMAk33fUXIhU+bwSznslupiEo63N3VQwiklJm
         RPvb3FDoBpXHjNsCD6Pofpa9LIJXHzCNI0bmo0Ki69TEr2WxSMmz/J5fKvC/zrZcmPOS
         cPTgJWqPF4Y/Q22OrIuCyBPQKVXdYRO21/7Mf7Lf0//sbxp6kYzoc9AEq3Yo78uif98V
         ZJG1H38YTVymil3J/5uc+LFEi6coMQlSCnov1StfHypQNlx8nYy9/jzqI2MIJgs+AvMV
         +7mg==
X-Forwarded-Encrypted: i=1; AKwUvBy/IJD7rskQC5IwSUWD5Z8B8sSyGx7ks+oBl9m+RFmvn4AIFzEV0hnVX1eF+JlNOjCljuI2NDdV5xLkSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKvBrMbDjobSGTka0c7o5sh+I2GnMLJnHqK81czPyf//3pAgw4A
	SWqKAU5VKNzIwHcOQbWIwNNTZKNBtQR3qQarH4dnBSgsWflBY5NLlHqy
X-Gm-Gg: AYBFou0HtU3PwHmkllu1uDsWVGp0Xgr0YF3NdYrCb17qkzOiDJbu7HStQjVLpJUDWNX
	Q+BAsf36aZ9nkMPrEHnc0eld5vGetRlhpoXJpLbwh/ordc7VFhHADWuFZ/5PdyvsdWnaYqBFjzU
	3UrnFO4+qKAhG6lySpNbnCJbAEu3Rt0oK90hqV5wA3Ri19mZlnrjc309fnuTXXTUgI1gnvLexyG
	HHEQkCFOFVCSODwZk96ALEdQtMqDkOAQUjF7qMIKuLi2+NRcStbTGK45O0n9hc3dWFeajn37Kzf
	JPmYAQIXeUd2UanpQWG/1I0jj4hyZLNaMEOgKQPLCDK01q0hAHABJv9mFcdXwKdfqmjRhyyNiMM
	AttXlmcpuy/5ihGF6ZfW4hAmSCqw+/zRw/54t7Ojr1Avd0y+1PBWDVhVhAnbxJjt4WBpocY1ELf
	mibaSuOrrHt+jaIEgrqJrEoIEY+dFqXKJOhHnAPlewUXUj1jWEhHzNrVp+z6xw6Q86EYiBoCz5r
	9gkVr/IjS6g7wwl+CVZRp2Ssct2/azhR0ycLlQw0xb5u17oQotzP5+fCTV4YE/wBQqL5Idu/yRc
	jyc5CpGrRAgtg1tbyjTQTVHw6SuGCx2a+DsuT+v0os4O/k9Gp/MphiZBuS6bacXSenxmZWp+tcf
	GL3XnCuI914qG
X-Received: by 2002:a05:6000:1e4f:b0:48e:412:3829 with SMTP id ffacd0b85a97d-48e07fb2b18mr14486670f8f.15.1792478305848;
        Mon, 19 Oct 2026 23:38:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 2/6] iommufd: Publish successful PAL mappings under resv
Date: Tue, 20 Oct 2026 08:37:41 +0200
Message-Id: <10fbbfdbf3a19fff48e504bcf5ec3a74f11bfd7c.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792477872.git.kmehltretter@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
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

iopt_map_dmabuf() stores the PAL map result in exp_phys before checking
for errors and publishes the attachment after dropping resv. The
attachment is already linked to the DMA-buf. An invalidation after the
unlock can therefore pass a NULL attachment to dma_buf_pal_unmap_phys().
On map failure, the non-NULL error pointer also looks like a live mapping
to iopt_dmabuf_revoked().

Keep the map result local until it succeeds. Publish the attachment and
physical list together before dropping resv, leaving exp_phys NULL on
failure.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 0b32c65af..9e9bc6a1c 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1491,6 +1491,7 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 {
 	struct dma_buf_mapping_match pal_match[] = { DMA_BUF_IMAPPING_PAL() };
 	struct dma_buf_attachment *attach;
+	struct dma_buf_phys_list *phys;
 	int rc;
 
 	attach = dma_buf_mapping_attach(dmabuf, pal_match,
@@ -1513,16 +1514,16 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 	if (rc)
 		goto err_detach;
 
-	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
-	if (IS_ERR(pages->dmabuf.exp_phys)) {
-		rc = PTR_ERR(pages->dmabuf.exp_phys);
+	phys = dma_buf_pal_map_phys(attach);
+	if (IS_ERR(phys)) {
+		rc = PTR_ERR(phys);
 		goto err_unpin;
 	}
 
-	dma_resv_unlock(dmabuf->resv);
-
 	/* On success iopt_release_pages() will detach and put the dmabuf. */
 	pages->dmabuf.attach = attach;
+	pages->dmabuf.exp_phys = phys;
+	dma_resv_unlock(dmabuf->resv);
 	return 0;
 
 err_unpin:
-- 
2.39.5 (Apple Git-154)

