Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985314;
	b=hNlj0X8krtlvau/MMNZYpivHdrORsN7zhFrYjXM9Maowu0B0twJQcICTWLtL8IJB1djD
	 iEzy0oJR2rVHYAWPY6isCBvxzq0hOEPi1M9CTZGTNJYtkbIJBprXBAP55fYukkVlkU96X
	 yIr8/AUiM7zStTfxlNM1KMUl2HCYqNAYfqTCiqCFqKs9pqwGlDEWYjRHnuaP54hd1BR2q
	 qRsfCXvGoruoN+CqqgpmkFnuYwvorANCSTBsbN65xLfKvKmtv10i5tDOqeaz2EHBxSeyl
	 Tn04KeBQBEM5CBXfGP75P5V31q9RY7QFiDU3TtG2NHodfaLO6XOkoxZ6qxzp7KX/FyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lmKzW+OeZV65HUu7GatYIY1aKfS/VgNzCR8dOXpD9VI=;
	b=cyhBZSmpK6aSANKA4cebl8aOYeLOV5/xRRwBCSKKS7sBTUjj35H9dxxMdyfMTMdCs12a
	 PolxYuKbra1zEW3oUC/dMknGptt8/Lj3qMS3zZtob/vIr245yRvi/gPql267JhuVysXRo
	 dpdgfaeGT4ziygkboQs8cgugPBnFnE3Fs4u76LzFCO9fmCRKOuJeFi8o3ESBt4xaiCNQ7
	 TKchCbydCAVGDsmh3/tfkv8CswapEiPfRj7L1Y8GbI6TobEEe1KnUa9ksOz1UpjH7e/Ms
	 +N+Is7aRVWLF/+bQ1wXhe3BWU9zkxtAqB/VuRk+j19wiprOUSIJnI0uCdz1PzUBRj8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyiSk5EI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjZA2LUo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79343606A32D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 17:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79343606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyiSk5EI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjZA2LUo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F03jU2671673
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 17:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmKzW+OeZV65HUu7GatYIY1aKfS/VgNzCR8dOXpD9VI=; b=lyiSk5EIBhoTe0q6
	Db1dkJhOfq/MMO2ic9syj24/2SoSzzCE+hPKgBc4lxpC5pk+SDsBD0db/JqaeNfj
	ZWmFJh3jNWoZQXIFGhsaUrYkCQqNHrikQ7cKjbNaPOyZOI5T1aiQ5blFtg7xKht4
	/g91h7WI2eQ+bf/DZhTnceJlzEcNtTIJLjdAoJOTETTjn7I7Uv03PagjCnwlS1AG
	zyP8nQXUwiHa6apwKp8e3cVoGv3lndfLAnSPV0hDMLARImBFMdYwbcxgNYthvwyT
	JHvNY0r7knqti+YQYPVC8wfs2V9gVWIhbhhbPva6hsIRqx8R3M0dXTY2CtwFnlxm
	dCUYWA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcbub6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:15:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1439412eec.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 09:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985313; x=1794590113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmKzW+OeZV65HUu7GatYIY1aKfS/VgNzCR8dOXpD9VI=;
        b=AjZA2LUoGjozqh4ZsHwknA+l/htwc894jy6KbB1bP571rGLzrO9HhZI2t8VfCCl+0P
         dIzwUlu43a//4nDv7+8jk6mlT+wUmjkSFB7UrDOy0Y2/7ou/ls3MLIb1WdivWXYjNJbo
         mrSziVm+jhSXbbrd8Qp8z76R2yCJrWCZThOFhewbJgHUGYhYdTi68zOa49k8j9eLpY1N
         2Uw7cjlAH4qb73tqXQ/AJ74tIc6RNS4e94hO1SXbHTzZNNck+AcvL55Ta4VuUakPuqCB
         Zmrk1zgYd4IUvFFTydvo45xmSl1lmGDzGan0DVdALf1hfcRtofaVo7IdJ06dY7jMDaMR
         SKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985313; x=1794590113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmKzW+OeZV65HUu7GatYIY1aKfS/VgNzCR8dOXpD9VI=;
        b=21p63z8d7z+qfoVSKmq06bTf3LHq5e9qx8ahxL9rgwCru8hvbzJHGaOQ4WdLATq6G6
         8PhWw3d/Z2xQR6lhKIcllCM8BXnfdwtIQmZQawlVTLdKEe0ZoN/KVmgftqk4OgiGRCPJ
         tMc4moOLdVmtOFRwSs7Jme0iPBP5xmEx8UW+82+mXH+yu0kiJlOXMFrLekwNKe8F/3pi
         uyYWIfLqsDTgaaDX3EeQAekv5lWZLUg+97w7UPRXdUtGsPfxU8Fp43twKIVLMcJNEKyW
         yVAH/cmfiwMEjlEsb98xYetzXRJhTy4XpZQUTo7waSUKqhLm7KJbYYjEO4pICcfmgmGm
         Rjlg==
X-Forwarded-Encrypted: i=1; AL+hErFq1IY/57xw0+lph6VREDtzhz7Pb0/+BHo8JueiT/OKqqLlW/tqQ1LPooSgIvc7PuWNRVDaN20WtrPk3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Br8VBgGLOUURVkpxoon35wQp9dQHiPbucBVIqZTr9k7F8BqWy
	MgMNU5d7XMMAjFktpyhA1I3R8tXU410sCB132QUxoV6zVeDRmmJMq6RYt4I9Ztk0HYQCV6aOB35
	05bG/zml7duq/LmuIQSSAquxDSuwVNQz2mOrXLo73sustDeZa/d67OyASoROnQCPhqw==
X-Gm-Gg: AYBFou28a34q/COwQvrSM+Esn9HGQ8oUQDbHcAOXGHfuKLSZbg3VWUA7s5isBR6vDHA
	VlIJpIi5oDm7ZY6JNl0vLWi+2tLjhWiyupBMYVu1fwC0Nbw+V7TGU8H20LaY3qa0kbfgyJ3jsSD
	1XNqh/utIb4LAFporE0uO5tWM+rnz3aDJ4aY1reYJKj9HWG04sxu3IpXd62xILgOaxES3x5p6L5
	4IwvLrUADKdXCmDRp+adSo7jDehsqUOcIYLoeuaia81ljNVrREnZovmheRysLxQFtDp1Qm6vIsY
	DSoh2KBb2ArPmlElMG2gDQBPviRsMqa/ezQEA1QIxL66sDOWS47cTDU+19y1d+PhPzKsUGGEbrK
	BmdtiZb0iPiQnqbYQ4qLSEP77inDY/cF3LzMma11lBgAaOIXqAT127zjHE6w6d4w3lqD8ntAzGO
	KvNJCZzhAQ
X-Received: by 2002:a05:7301:700c:b0:36f:83e7:fb7b with SMTP id 5a478bee46e88-36f83e7fbfemr3882646eec.40.1793985312683;
        Fri, 06 Nov 2026 09:15:12 -0800 (PST)
X-Received: by 2002:a05:7301:700c:b0:36f:83e7:fb7b with SMTP id 5a478bee46e88-36f83e7fbfemr3882602eec.40.1793985312037;
        Fri, 06 Nov 2026 09:15:12 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:11 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:44:24 +0530
Subject: [PATCH v7 1/5] iommu/dma: Keep reserved regions below the IOVA
 rbtree anchor
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_iommu_ranges-v7-1-5c0f72083e52@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=4417;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=G44uhZ1HXNVABGhn+qxMp/4C0rxJ1LZuV1TxZ8zeVL8=;
 b=BHBQFBOwgwPIQIoLF/meExK3QhQeHwPdFrwMKaRrt42zE9AMIGbbdJCDmSvFJT7Dzg8ntKu+H
 t0TRfWYzL4RAYGk4cpg8KgcxlTf/ScPXLS9o3YKyz4YsYjLIucY8QmS
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: PKpkexL8Fs87Sn2i79_G4EQc-0_GZDgx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX0C4B1awT2z9a
 BmvdZ3xrgdCs7pq6mfun8L7hgy4fy0S80nrXHH1nyC7y4JFWTnCO/6NPOrJ4wGI3k/SXALVqXus
 RjlJEgVfMuSrYBOx5BQtSeaSdCoRRWiMNznzsAurZ+j8AS00yWTfYh6i/1PxZ1Zw0tGr+LpWZWw
 r18SSsHNylLkLf5dbxpuLWa4WKxkpZRrdPN60I6FXYIlLhaVyJ0QLrQn9Fgmo7CtPFo0GhmTPrJ
 9Och+ptonJ1NKRxEjTpAgAec/k4zqKDuoFFrNEXMKqIcMwAjjR/nRQ0NyQL91DHX+Wt0dgJ5CS/
 a+RuplauhkslR3H1hDKhIVJ1G7qwPU+l/gti5rx6qoSfLKzIRT+HOoJIlG0PkPxPWKFZEmTBRNP
 QPgcyVSQwTkqHfz4mmLuPAh5OPobcD5c4SA0Rn5Eu39Pa1fj47ATjq6FqTsVdOhg3JVGkYprCzn
 p49Byue6n63JYO1C1ow==
X-Proofpoint-GUID: PKpkexL8Fs87Sn2i79_G4EQc-0_GZDgx
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aee0b21 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dye_ZhmbRBr0AdBEf-cA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX3K0/6z78bdZ/
 BMcaL6bGaKaSAq0M3QxqPovKwacelFyRzCFm76KJ9ZNL455uR+Kw4JJD43wZ8EStd0oRRAtWAfb
 nJrEHHisozdVoYvE2ydDO7xQJHB+Af8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

The IOVA allocator tracks address ranges by page frame number (PFN).
The highest node in its rbtree is a fixed anchor at PFN ~0UL, which is
embedded in the DMA cookie. dma-iommu converts reserved regions to PFNs
with iova_pfn(), which returns unsigned long. On x86-32 with PAE,
addresses are 64-bit but unsigned long is 32-bit, so the upper bits of
the PFN are lost.
A reserved region that ends at the top of the address space then gets
the anchor's PFN. reserve_iova() merges it into the anchor and lowers
the anchor's pfn_lo. At teardown, free_iova_mem() no longer recognises
the anchor and frees it to iova_cache, which corrupts the slab. PCI host
bridge windows above 16TiB and the reservation after the last PCI DMA
window hit the same problem.
Compute the PFNs in u64. Skip ranges that start above the PFN space and
clamp the end one PFN below the anchor. The allocator never hands out
those IOVAs, so nothing is lost. On 64-bit, PFNs never reach ~0UL, so
nothing changes there.

Fixes: fade1ec055dc ("iommu/dma: Avoid PCI host bridge windows")
Fixes: 7c1b058c8b5a ("iommu/dma: Handle IOMMU API reserved regions")
Fixes: aadad097cd46 ("iommu/dma: Reserve IOVA for PCIe inaccessible DMA address")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-195658@kernel.org/
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 78742aeba932de1054fbf394c4fae86e9b1be20c..fbf788ac055b6d1e87482c3de043ef57bb12d9e6 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -505,21 +505,34 @@ static int iommu_dma_ranges_sort(void *priv, const struct list_head *a,
 	return res_a->res->start > res_b->res->start;
 }
 
+/*
+ * IOVA PFNs are unsigned long, and ~0UL is the rbtree anchor. On 32-bit
+ * with a 64-bit dma_addr_t, iova_pfn() would truncate the range. Compute
+ * the PFNs in u64 instead, skip a range that starts beyond the PFN space
+ * and clamp its end below the anchor. Such IOVAs cannot be allocated.
+ */
+static void iova_reserve_range(struct iova_domain *iovad, u64 start, u64 end)
+{
+	u64 lo = start >> iova_shift(iovad);
+	u64 hi = end >> iova_shift(iovad);
+
+	if (lo < ULONG_MAX)
+		reserve_iova(iovad, lo, min(hi, ULONG_MAX - 1));
+}
+
 static int iova_reserve_pci_windows(struct pci_dev *dev,
 		struct iova_domain *iovad)
 {
 	struct pci_host_bridge *bridge = pci_find_host_bridge(dev->bus);
 	struct resource_entry *window;
-	unsigned long lo, hi;
 	phys_addr_t start = 0, end;
 
 	resource_list_for_each_entry(window, &bridge->windows) {
 		if (resource_type(window->res) != IORESOURCE_MEM)
 			continue;
 
-		lo = iova_pfn(iovad, window->res->start - window->offset);
-		hi = iova_pfn(iovad, window->res->end - window->offset);
-		reserve_iova(iovad, lo, hi);
+		iova_reserve_range(iovad, window->res->start - window->offset,
+				   window->res->end - window->offset);
 	}
 
 	/* Get reserved DMA windows from host bridge */
@@ -528,9 +541,7 @@ static int iova_reserve_pci_windows(struct pci_dev *dev,
 		end = window->res->start - window->offset;
 resv_iova:
 		if (end > start) {
-			lo = iova_pfn(iovad, start);
-			hi = iova_pfn(iovad, end);
-			reserve_iova(iovad, lo, hi);
+			iova_reserve_range(iovad, start, end);
 		} else if (end < start) {
 			/* DMA ranges should be non-overlapping */
 			dev_err(&dev->dev,
@@ -568,15 +579,12 @@ static int iova_reserve_iommu_regions(struct device *dev,
 
 	iommu_get_resv_regions(dev, &resv_regions);
 	list_for_each_entry(region, &resv_regions, list) {
-		unsigned long lo, hi;
-
 		/* We ARE the software that manages these! */
 		if (region->type == IOMMU_RESV_SW_MSI)
 			continue;
 
-		lo = iova_pfn(iovad, region->start);
-		hi = iova_pfn(iovad, region->start + region->length - 1);
-		reserve_iova(iovad, lo, hi);
+		iova_reserve_range(iovad, region->start,
+				   region->start + region->length - 1);
 
 		if (region->type == IOMMU_RESV_MSI)
 			ret = cookie_init_hw_msi_region(cookie, region->start,

-- 
2.34.1

