Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780742;
	b=dsnYLcxdEsyX3ScGVPP6FbFxuqv2i/dfKrQeEFyQ7EgdsiH5uCj0NkyXzSTqJxxPEkG4
	 rovVgnLZKB+Q167rqvaWU4vmgFT9XB/XmVo03ymSnRaEUz/3u4TCSab4jUEplRxQLxZQr
	 5vNjYcNAquiZii8iSZ36Sp7YzRxzlOc+Lcv3lAjKiUIO4Oo5bSKYWQOKFa2K67A2ybdxq
	 v9w1xTjuMpLpKZyza5hEMLQkn5WiI0NC4Pgb4jhurcktxy091ywoOVlLw9zrzBTSu/jtu
	 7x+FaQsTnfXiHaJQhS7+8wPd1ptGLdv3CBVZN1EogDE6wxXwqncDrOgw4o0hMrHisGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780742;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=kU/vWsvzp/oeLbWN7RubnpobMMTsDvkHbxerPWgHnis=;
	b=DDkbb52E519ef0peUTpL8lKAgHolxWSD7oPY5d8zlwPqwHYZZbkjWnR6q6wsg+miLDH3
	 UVbRYbT6r2eygvoHwMPbUjYzMuAfrogBmztlbL+eiNRuTYCt+M/O3wMmLNeSb2RPTqT/z
	 P1SSKb7AflLVIJD5LDUE/vau12jHYcSjD4GSNgQTraMvzI/H9A7pLTe46pKktln/7kq6I
	 3fGmiL6RBxj2aTZMERIrTXxNPK20X6sYkVpjZhoG4JAE1oJTzizaf86Lx/9A1q4WLMgkp
	 No3fChGXrgCDGDjePPjTdCyoLslIlpiYwVnD82oXtw10I8ROcji/pLiAQbtolGE9Ruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="g/ETUpOx";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F9606A32D
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303F9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=g/ETUpOx
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261127115859euoutp029be95fc008e8acc0943998e8c162a6a4~r5RGC-lVt1646916469euoutp02T
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:58:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261127115859euoutp029be95fc008e8acc0943998e8c162a6a4~r5RGC-lVt1646916469euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795780739;
	bh=kU/vWsvzp/oeLbWN7RubnpobMMTsDvkHbxerPWgHnis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g/ETUpOxD/ZT0Oi4ngNjjkxmcCs2PjgFbZIjtugjnIvBV8v/PCWi5b70lRdHRBgEY
	 J8aArwdHqiPq2Or+U5kHx6JPJhjRYBgyDw0xogGec9Df4A/835VSe/KLxsZCUQG9nX
	 +p7D1rf4O8d4gCXWMoZUJMN75GEyngQrOh/tjRiU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261127115859eucas1p1ae20b01eec39080daf19dbd71aba10e9~r5RFsd37W0787907879eucas1p1w;
	Fri, 27 Nov 2026 11:58:59 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261127115858eusmtip1fe13b1aeb26ee1104c142b331f20a2bc~r5REtVNTR0670706707eusmtip1t;
	Fri, 27 Nov 2026 11:58:58 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe
	<jgg@nvidia.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Honglei Huang
	<honghuan@amd.com>, prakash.gupta@oss.qualcomm.com, Alex Williamson
	<alex@shazbot.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
	<abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho
	Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] media: venus: use dma_iova_size() to check the reserved
 IOVA size
Date: Fri, 27 Nov 2026 12:58:45 +0100
Message-ID: <20261127115849.2780625-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127115849.2780625-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261127115859eucas1p1ae20b01eec39080daf19dbd71aba10e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127115859eucas1p1ae20b01eec39080daf19dbd71aba10e9
X-EPHeader: CA
X-CMS-RootMailID: 20261127115859eucas1p1ae20b01eec39080daf19dbd71aba10e9
References: <20261127115849.2780625-1-m.szyprowski@samsung.com>
	<CGME20261127115859eucas1p1ae20b01eec39080daf19dbd71aba10e9@eucas1p1.samsung.com>

The IOVA reservation code compares dma_iova_state::__size directly with
the requested chunk size. __size is internal to the DMA IOVA API and may
carry flags in its upper bits, so use the dma_iova_size() accessor
instead.

Fixes: 953439251b59 ("media: venus: Fix iova allocation from restrict region")
Cc: stable@vger.kernel.org # v7.4+
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/qcom/venus/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7087af32060f..cec5db2bf755 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -408,7 +408,8 @@ static int venus_reserve_iova_region(struct device *dev, struct dma_iova_state *
 		if (!dma_iova_try_alloc(dev, &state[count], 0, chunk))
 			goto err_free_iova;
 
-		if (state[count].addr != end - chunk || state[count].__size != chunk)
+		if (state[count].addr != end - chunk ||
+		    dma_iova_size(&state[count]) != chunk)
 			goto err_free_iova;
 
 		rem -= chunk;
-- 
2.43.0

