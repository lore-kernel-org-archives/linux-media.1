Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E1C48D892
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053403; cv=none; b=n2O1RTbLnuRJ9tYkpkuJPV5pEfSiXYr1H2nk/XliQ3mTW9cjRlcdqO5W44wSf8zitggTpPJcmuGfwmX/r1SaVweThEOX3mHoZp+NmdkY94WDf2prb6I5ZUTOd9PLPYWagcaXiW88qGNU+OFtwm1JF7DS8n10JPqYVPFEZx+4sJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053403; c=relaxed/simple;
	bh=pzrGaXr2vc7AK2dHic6Dxs3t4dtTkJgIvsCv45uqoO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9mdngB2Vk5Zq2CVNN7rtKPyDu+z+DyIfh+vZniYMRcjlA5MR+g5VYtQuo0FzhgmzqKtt5hRd1B1cCCUMPbtHwFjWyKEpK1dPDFsDYpYKq8xLIXoFaIS9Z40BjbvC5Zw5uch+T8m2wP1u0pTq3DxfsCfdHdeA8SNaeYl6I5d9rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOJY+fIX; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOJY+fIX"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5351748222cso10786401cf.1
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 01:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053400; x=1792658200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHz/bzikXk8pek8hRSIu9eCONXczI/isD7IKkwfqttA=;
        b=lOJY+fIX7fKTPd5JoHrz///6LH8QPt7T+9J2luCNr8/+KfEmBcpIVYWIyq05ANTSio
         GhthWLK93vM2BFCfb2XEeMTiFc3xYnWbuSfQ6AqNOYPXB0PbY72jM2bL1nrMOiSWDnv8
         +HhVDF9uabAePRl15s8iO1zlH0UFZpT25DoS3qeOjWQBIJoiUESbK4pKXXxMBzBBeZc0
         Fz9b3QPYmXz6ewoHTiX7zzcAeAa90o5RW60lDa5FxpP0U8L+E/01ZdHRR5MIfsqvCWvP
         25fk3q6Fgb5E1Xy+CT4QOcFuY55qQSI+NMsONEfk4mAMaoU5ha0JL5/2oQHLMkxggo8h
         Hlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053400; x=1792658200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHz/bzikXk8pek8hRSIu9eCONXczI/isD7IKkwfqttA=;
        b=Uojfm758WBRlMCWU4lSu2wGnfcp6oNClUp+0uHa7LgDbo/WrQRA1f0Dajwexz7RvKo
         YmfWXZnZi7Gk51ZEBxdBJ6pohcG06XR6OyX+ZWwR3TJWhER8W02AyI1/PrD1PZJw8x6I
         c/aqvsYJNdejilXLri81tRvyaWeeZcPSUqReDHZjojS1CFJSf29mLyccMyqGIptN6nj1
         iK3ZTA+Nc1Z5rkv1DllmBTBXAJPzsC/3sPcyXtGmFO6PqU1vuc+YpoE+clOmcONjIzoy
         +hJ6qUaGf3kdlqOSSqIbllN+oZTDh2ANCzlBEoLvjEmQmdzoXcbm+Hg8yWk1nI8LkHye
         f4jw==
X-Forwarded-Encrypted: i=1; AKwUvByTd8+2hNzkfXAHYtZloM7qS+rmOPx+zPaAItFjmeztLLGYHccIhB2NZcJ00D1GUf95rsZAsQBsvfr/Sg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhIomxoShCi0zNOyTUe6vb020zaylYjtXkDhu6ENjZjyR7pAlP
	Ggd9BCPaDUvPMcVIeKI8xIgFMa0ogbdyxnVN/MohL7vYk9etk9JJR8jZ
X-Gm-Gg: AYBFou0+s4Zq2i+B4iEDBQ4CUpBVDcoY61iwC6LakhqRUcT1oqRwOw7I8l3TrktdIPx
	8wbAck/+jUj8ztScLDrnioyX31jHxJVaIPxQ+OkXrq9AXbM2T2P4QqcErlRXxWmVZ/+EwtmgK5D
	C1w336Vb2Fggp+WK58Hr+zq+5de6Ikq1fc8leJtmqnKqkBozujk8mYU77Sfa8TSzHetQMHSNmA/
	NFrv0/MbPBzL5NOvGCjlP55BUFoXNqyFs49TTHghxodipJJBvAsd5K8zeWSMMFRurBGILgkee5Z
	HO6DXGimEsIiDzMHnDox7Z/kyOuTbTu56MD6+owXYVRYJcNgMwjteEOpRHWrSu4MATLq/9isJsM
	Odz/I6/5KjnTUHNuRjjmsF2Dm97EKu8qBHHbpedOe6zUKL8Bu+EBWIMnp6gBU0K2+Er59gXWakD
	M+bi3n9YfT/tW8cyOQ40f1FWsskQIATzgZxhPsSM2R46XN5zq8xwT5UKLY5o1USHi6WvlhZPY/M
	fg4LW8PGB1uKRxd3v6ZDT1I8nZfMiMTAhnnXzSubmEpWfDOECtXkdmCV5VNr7UtSKenJzSxZMyH
	AJGUK3BAt3kNqNmPuMtsLkY=
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2908976185a.42.1792053400267;
        Thu, 15 Oct 2026 01:36:40 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-44-200-54-59.compute-1.amazonaws.com. [44.200.54.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm711843985a.40.2026.10.15.01.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:36:39 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	Yishai Hadas <yishaih@nvidia.com>,
	Edward Srouji <edwards@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Deep Shah <deepshah146@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH rdma-rc 1/2] RDMA/uverbs: Fix uobject leak in DMABUF release
Date: Thu, 15 Oct 2026 08:36:36 +0000
Message-ID: <20261015083637.200958-2-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015083637.200958-1-deepshah146@gmail.com>
References: <20261015083637.200958-1-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uverbs_dmabuf_release() treats a NULL uobj->context as an aborted
allocation, but normal ufile cleanup also clears it. Closing the uverbs
FD before the dma-buf FD therefore skips uverbs_uobject_release() and
leaks the uobject and ufile references.

Clear dmabuf->priv before dma_buf_put() on allocation failure and use
that NULL pointer to identify an abort. Otherwise, always call
uverbs_uobject_release(). This also avoids reading a freed uobject if
release is deferred until after the allocation has been aborted.

Fixes: 0ac6f4056c4a ("RDMA/uverbs: Add DMABUF object type and operations")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Deep Shah <deepshah146@gmail.com>
---
 drivers/infiniband/core/uverbs_std_types_dmabuf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/core/uverbs_std_types_dmabuf.c b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
index 2411ebee69e2..d88d30f1e42f 100644
--- a/drivers/infiniband/core/uverbs_std_types_dmabuf.c
+++ b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
@@ -68,9 +68,10 @@ static void uverbs_dmabuf_release(struct dma_buf *dmabuf)
 	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
 
 	/*
-	 * This can only happen if the fput came from alloc_abort_fd_uobject()
+	 * This can only happen if the fput came from the error unwind of
+	 * UVERBS_METHOD_DMABUF_ALLOC. The abort cleans up the uobject.
 	 */
-	if (!priv->uobj.context)
+	if (!priv)
 		return;
 
 	uverbs_uobject_release(&priv->uobj);
@@ -141,6 +142,8 @@ static int UVERBS_HANDLER(UVERBS_METHOD_DMABUF_ALLOC)(
 	return 0;
 
 err_revoked:
+	/* Tell uverbs_dmabuf_release() that the uobject is being aborted */
+	uverbs_dmabuf->dmabuf->priv = NULL;
 	dma_buf_put(uverbs_dmabuf->dmabuf);
 err:
 	rdma_user_mmap_entry_put(mmap_entry);
