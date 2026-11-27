Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780743;
	b=FlJOj5pp39Mdn6SWx5sN5dVGy7z1LKJHWMjgybpXwDsfktFDjTdBNLUHeRoh7j1TNuBY
	 UEIIGUNiyhXZZM8XwK1Bm6+56ZxgWn8Gq0vEaYCFnu/kK4FYfkElmoAk4Cl3X+zZ0gajS
	 erf4xPpICKdKd5TafQdUHTNHVclk2Rv4AlvVu1/94xNPpN5mCXa0VAd3Kzv0+jToCy7CR
	 +MrBy531IWp78ZHVgEWIgr9hZc8iuypkuZHghyyeErt4D8xRB8iOaIwjR+Jd6gjhpHxle
	 9gawhqHUwXU8GSns6REngkjqYLIdKQpAtTP5mdWycG5PC07Z5jl+t9iBb8Va6UOYa4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780743;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=OMRzMqimnpifq9KqdKtuno/m96CUs1InXnt4XHhwNBQ=;
	b=VPHgEFK6dh3c8cuEXpe504T8/3/90T824QXPaNvzsH5QNRBNDZDmkfmAzJrilr8FQ6eP
	 W65ITZ96nlJt2ssMO5S8mCZ7woFNxz7jcX8f/tNClGr3euQvCAlW0e0sq4Q8xuPywYSU5
	 pYG7dtBoCuRLeYLUr79FFDTwmm/r3o8vOM8d7/7BQw8SZuGyS801dvxzfhU42KYD7Qzjx
	 fXf63AH0BXiDH8fvL8ordr87DrqIha43+M04mVUiBku0AsV1vrOLWPYeKXexZziLTRydH
	 aj3pOz1VzEgMBn8DGnpA5sj73/ox1Fu4Qu6NVVXCJp2KYZDnJWBsTuZRJjawclXVviw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=q5MO5YVG;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC9606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AC9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=q5MO5YVG
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261127115901euoutp01fde517293e51f2b75a1717ef04b99f3b~r5RHRFPGa2736527365euoutp01r
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:59:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261127115901euoutp01fde517293e51f2b75a1717ef04b99f3b~r5RHRFPGa2736527365euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795780741;
	bh=OMRzMqimnpifq9KqdKtuno/m96CUs1InXnt4XHhwNBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q5MO5YVGFIixhmJOrvOSvOZsaSWjdszMMYPssap+dQ6rK5yPW+3/EcWpigmPsoxkP
	 Gm6quncItbvugg7v+3RBarFytP6IWpWeuNIy548quybj9FLd8u3IXgyd0HtP/wv7iq
	 iXVDoemKZ7QGtQNt8Bj7IAkpMflVcFjHQjQsYkmk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261127115900eucas1p268ca3a6688c2fd99513317dfc99dbf59~r5RGyPG-n1794517945eucas1p2Y;
	Fri, 27 Nov 2026 11:59:00 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261127115859eusmtip187432b32fa06abf697f09b384f0e17fd~r5RFyRcK30664806648eusmtip1N;
	Fri, 27 Nov 2026 11:58:59 +0000 (GMT)
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
Subject: [PATCH 2/4] media: iris: use dma_iova_size() to check the reserved
 IOVA size
Date: Fri, 27 Nov 2026 12:58:46 +0100
Message-ID: <20261127115849.2780625-3-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261127115900eucas1p268ca3a6688c2fd99513317dfc99dbf59
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127115900eucas1p268ca3a6688c2fd99513317dfc99dbf59
X-EPHeader: CA
X-CMS-RootMailID: 20261127115900eucas1p268ca3a6688c2fd99513317dfc99dbf59
References: <20261127115849.2780625-1-m.szyprowski@samsung.com>
	<CGME20261127115900eucas1p268ca3a6688c2fd99513317dfc99dbf59@eucas1p2.samsung.com>

The IOVA reservation code compares dma_iova_state::__size directly with
the requested chunk size. __size is internal to the DMA IOVA API and may
carry flags in its upper bits, so use the dma_iova_size() accessor
instead.

Fixes: 200473c198b2 ("media: iris: Fix iova allocation from restrict region")
Cc: stable@vger.kernel.org # v7.4+
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 41dec90f3e2b..0af913e40604 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -181,7 +181,8 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 		if (!dma_iova_try_alloc(dev, &state[count], 0, chunk))
 			goto err_free_iova;
 
-		if (state[count].addr != end - chunk || state[count].__size != chunk)
+		if (state[count].addr != end - chunk ||
+		    dma_iova_size(&state[count]) != chunk)
 			goto err_free_iova;
 
 		rem -= chunk;
-- 
2.43.0

