Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC80D415B85
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.212.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421566; cv=none; b=Qrfg7AUtGZ0d7Sf+83Li9bZZM/f5bM6M5rH8t1tBPk9EJ9uWU3ye8y56uPfPND/sqc1a6pPvdcbKALvTEeTr13eBrTeARAIingrZretqDTLSNTFejVtv46cwBSmMElNSCZvT4SOKU4uksaH0ZtA2iEZKsV31kdIZ/drNzVuXetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421566; c=relaxed/simple;
	bh=ufXw4uCVxvNYKgDoWeGTQAuOXuc7KFR0ri6ssG+QcEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dYyeNA/KpXR8Ct38loyOy57WgrFebTkJwVQnbBivkWVcjr2vo4ypWoobKoZ5Lickf0k/VkPCTKGJPNtU0nspjkTh5MwG/JVFGlkMoUxKHdzYy5fnXN05j2ALCMvrgO6CvgYHP0mUQ33Rpaf5UdDYwmpym9q/XgeKHYhh/4fe/AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=SoLOgKWy; arc=none smtp.client-ip=23.83.212.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="SoLOgKWy"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A14368016E4;
	Mon, 14 Sep 2026 21:23:06 +0000 (UTC)
Received: from pdx1-sub0-mail-a247.dreamhost.com (trex-green-1.trex.outbound.svc.cluster.local [100.100.67.126])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 49695801461;
	Mon, 14 Sep 2026 21:23:02 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Tank-Bubble: 1fc4c4da24a9f59b_1789420986561_3665350486
X-MC-Loop-Signature: 1789420986560:4095314019
X-MC-Ingress-Time: 1789420986560
Received: from pdx1-sub0-mail-a247.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.67.126 (trex/8.0.2);
	Mon, 14 Sep 2026 21:23:06 +0000
Received: from offworld.lan (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a247.dreamhost.com (Postfix) with ESMTPSA id 4hkJ5x57G9z105H;
	Mon, 14 Sep 2026 14:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1789420982;
	bh=6IKLKmDIKx0whR4qJGZ5km9++1OTPpBzFcxxbrXhRWo=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=SoLOgKWydf5tpx3vLcoKMa4ECJV6TO0RCMR/xu20336ypPvBqJpzo4ft41yZNaaU6
	 PCmCFAm7FfDYbgJSigSSrBGtusqZPcYbQ+wKoigCzKcOrP8P4CG7vO/nvA7ZDwW/NG
	 wDMgGLDpVsBPr2pwUg5X1sO088PvxiV1QgxzRrCh7yGDGzj8hbqpwUoWUXJhD0KFz4
	 e7YAGMFTloUNx8fKLZjzRNcn1vBaEHhKoi7/TFYN96bteC6HzGuXkIL3vOuT2fpSiJ
	 Bf09rEU9JbTOAL6AmRGjAZvJmZC5bswBxKJT+fRdT7pNZHyJB3c43twG8llf07NIiM
	 6H4XNWbHQ47hA==
From: Davidlohr Bueso <dave@stgolabs.net>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: benjamin.gaignard@collabora.com,
	jstultz@google.com,
	tjmercier@google.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Davidlohr Bueso <dave@stgolabs.net>
Subject: [PATCH 3/3] dma-buf: validate the attachment before asserting its reservation lock
Date: Mon, 14 Sep 2026 14:22:58 -0700
Message-Id: <20260914212258.2657788-4-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914212258.2657788-1-dave@stgolabs.net>
References: <20260914212258.2657788-1-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_buf_phys_vec_to_sgt() asserts the reservation lock before its
NULL checks run. Validate first, then assert.

Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 drivers/dma-buf/dma-buf-mapping.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 833be519e1e6..12674d89b23e 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -111,12 +111,12 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
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
2.39.5

