Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204E239184A
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 19:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.223.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625543; cv=none; b=jY8wEP24F4STaHrC+HzcJikXV3tQxEzyTi7ZwE9uz0sAqBd9X7Ip+oJ1UR+PrlTbMk4EIz0kg2StdFRPwtIKDNMzPoO/JKJsKwxM454Vt2ybEhmE786pZju/6v1vWeIcJFWUQ7qaoVErJZmIeCR2WlDtYCzyRhuUEYzswoDmvdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625543; c=relaxed/simple;
	bh=HU6Gihil+9z03JWzcLZqgIBMitJS4pNU2gb4KZekRYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1B5IR3C7EAs5X/kf/jEpmN/+wX1Cv0/qpqrIPwW4UzBwAjw0DUB+DfuLDIY3Mk8BVOrm7yNLa3KRxGVtrLGHiFTJhiNBa/1XFJDoeEERwY2Dpokc4l2H3octlEkuZYmP0B76K2k6Y/HWOdhRH0Y900u4KNWY0Y5cd1hOCp8xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=CmuOiVI8; arc=none smtp.client-ip=23.83.223.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="CmuOiVI8"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9650B4C07F1;
	Mon, 28 Sep 2026 19:58:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a209.dreamhost.com (100-96-4-183.trex-nlb.outbound.svc.cluster.local [100.96.4.183])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 427C34C0721;
	Mon, 28 Sep 2026 19:58:54 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Cure-Bubble: 092205985063c709_1790625534443_1514188764
X-MC-Loop-Signature: 1790625534443:3676939605
X-MC-Ingress-Time: 1790625534443
Received: from pdx1-sub0-mail-a209.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.4.183 (trex/8.0.2);
	Mon, 28 Sep 2026 19:58:54 +0000
Received: from offworld.lan (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a209.dreamhost.com (Postfix) with ESMTPSA id 4htsZP4FqNz1M8;
	Mon, 28 Sep 2026 12:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790625534;
	bh=yOAkVbw5Y5WdGtxF4n15J0FVVkDgFz6f2VlHyqeejmM=;
	h=From:To:Cc:Subject:Date:Content-Type:Content-Transfer-Encoding;
	b=CmuOiVI8qzmfoAnqG5j1/7WpYSMA0vlkpOjhVprIfukN+4P/Cs9FZdFfxBOTBDI9J
	 2MuKYqZ2CkgDM12jnOGsKEv58b3TlP74UbmzmXJnxtwpaQuPxBZpFm2TM3YQeaX/bZ
	 C7E22i/XT+Lc0F/kr4wqS3yQxfwbRAuAmOCTuq5HvDAoZgVNIvyqN8wvD6+yyCsDL2
	 FgMA+HgGOanHBLA7Pr8ApDPEWUD0aGrlgftkYtk2Jh7DsAOhsyE6oBhe4/xdn7drpz
	 02xchyO9HiJd/HXyhPUXzZdpLzXQZQ1+cX7js6jbTIt1u22adh2MOaKg0HUXCUxCwv
	 mvSlsILtDwpeA==
From: Davidlohr Bueso <dave@stgolabs.net>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: benjamin.gaignard@collabora.com,
	jstultz@google.com,
	tjmercier@google.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dave@stgolabs.net
Subject: [PATCH v2 1/2] dma-buf: validate the attachment before asserting its reservation lock
Date: Mon, 28 Sep 2026 12:58:49 -0700
Message-Id: <20260928195850.1982569-2-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928195850.1982569-1-dave@stgolabs.net>
References: <20260928195850.1982569-1-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dma_buf_phys_vec_to_sgt() asserts the reservation lock before its
NULL checks run. Validate first, then assert.

Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Reviewed-by: T.J. Mercier <tjmercier@google.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 drivers/dma-buf/dma-buf-mapping.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..e6ecd6c80587 100644
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
2.39.5

