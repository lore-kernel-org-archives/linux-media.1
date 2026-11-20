Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170955;
	b=NJ56Cw5lfLMHwU23PcShENaaNW93b0apJmXuaivR3gFX1wjaneXgO5TvNmQdw3EkkIKi
	 qoUpVyq/cwJTYlhnzAQZzXc1PLtNT4/RjoFHOT1bOutWTkHIH9EgieJddVgVduNvbWqrk
	 mYH9HiLOcdfbCCRsrdUvgqV56QphLX+EMu/ptuZr8cc8VARzxzWJMmOhBR/bf08SQQ1ru
	 VdIPzlJWs6HsJeYKjqXANTJuSeMY9BpVi2aJw9zGC/gPjOoW6HDe/iNgXT37/6e82P1rn
	 IcPWoHSPiWR28W7gbG7S3No/PayjVI6F6GAXi2bTnhlgd/4MJGdHwu5saB8jS4lY44Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jja5CIRJx6p71jdLiDhzh91wfoRIZk+1zpGerhUQBKg=;
	b=fK04BEWpsCWv8jdvK5KP3lHOYVhPdmmioJVde6yr6VC3nRiSQ70V0gDYA0GYjYoYCK5p
	 SXAxyF8MjXqvzrgiugeTB1bsSNNbq3DJKZbJWtNlOcP0kwM7MEVO2oMTnVgirO4qRBriW
	 clxxJAOwUmd04+BZKPej1eefgpRTpnK2+R8bdGMk9jZ1qOPpV1oi6jDvsYObSQpmq/tDf
	 Bzo+1gJvp5pBr/51pPXb2ST0c4BebzWPsOZerV3LQt95pRrH9Pz4xVg4pWB5xitR2q9+S
	 UhShkcXp2VBuUGBHvX1Grtq8JaXdlA1jErYpDK9T7KZnO581hlr9VLVsOvvlDhHqxNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+qR4cbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/eUO/Qe";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AE6606A320
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21AE6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+qR4cbO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/eUO/Qe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f4u11049172
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jja5CIRJx6p71jdLiDhzh91wfoRIZk+1zpGerhUQBKg=; b=C+qR4cbOm4AQtRHv
	WIj1hFUNtydcyAh4E1CrmnryhpUuL4AyJrq1xnJKCD2K62S4iyMHxToMBgBiF2VE
	cMKQyljlLBoe25qhVfiafS6dGtz/SQtxJWRGOjuUfWOKxQM3XHx3QiK9RysI2K3z
	QO9BprVVJg/N5c0uqMjnats955ePDVr0XgCwh3Y3P7W3WHRbNb9IcDQDR+bRtUVX
	BKTUChVxVby3MCDRP9D+MUatUAS3OeIS2weqGYVeDYo/UaU6DscWfhN7D5CAvqpQ
	FFhYETFkKQLF2oGFa6k6fl7NJPjptAbY3g4bILgNC+KKOQVlng+WbSE2cQxOI0Rh
	ccLXdw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah214-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:35:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3821eb27024so1240465eec.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 02:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170954; x=1795775754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jja5CIRJx6p71jdLiDhzh91wfoRIZk+1zpGerhUQBKg=;
        b=X/eUO/Qe63RdSTPLS7pGhQz+I1mr8WKnLRiRP2FNn0/fQOgQnWvk547NiQf8ip2v+o
         2OWd+Blhx3F9qNZ7sve8BrQNpNEbsLU+DyKe26ts+FsTWVEu4jwwL2WYQJT3KD9HVoOK
         f/ss2L9p2l/M+L0mIFEb4RfN7Kywvan2zufDZSLgB6GEyH3ZKUcXafrllalHL/65V5TN
         qKaLaW7M07mhH21yT68Xdd7kveCx1kYdORScRUgt6eN8YbEfRA+fgNA1w8J/Z0EaPbXc
         IjQzvsjtFOa2EEiSxuo3Q2+F9UQNShiCv240I71l9ynm/kpja3yh7eRG8cLx81tkWVQg
         /mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170954; x=1795775754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jja5CIRJx6p71jdLiDhzh91wfoRIZk+1zpGerhUQBKg=;
        b=Hwxne1doRMjmAZN7mZecULtTZG4HCxqMAXCIvvsWQCJfU9yNLCbvEw+SsgJgxumtk4
         GR3PKZJH4P+PnXm5eMm5s4w3v7T3xufeLuOGGfuX/Y1UjXQ/kwJBLGFBj+bz7eFaY1Sy
         T8hxjOgCfbR1+lqNcc+XqrKeXKALjIiFUxWFJpPenznFTlaC3rDdbHBxqzKr6JMGMTPp
         SmCVmnWTsv2AyutXeY8hrZiDf2vDNgQTWnoaKC1QH5klk1yxBk2vXLFsWPPWEgXtsVEK
         yRZA5ODLYkocOwAmQ4UzY5WXvxVCB39nltHqF03Hgn4Z5dpheg5Cp58aZrIpyU+D3Tzc
         8DLg==
X-Forwarded-Encrypted: i=1; AL+hErFgCKUzsnSj/Puha/bmOYUwzWUD7dpQfcFVxhLVoUtU7Vc10JGBQlPUGzEYqB9LG+ukyRndnPvV9UjA9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9nL8WKoqho2iX62WcYjqB7ocPfvHuLaln8194p6OqGyIonZnSS
	ukZwgYpJTCOxz1DzJ8aIn8u+Jb7lkqjlw/nWExlnmypWVr5Izr9S8yCZ7ybw/LGWOE/10AvJ/k1
	73TvyIrfkn64nG+cEND+SAY1yqKupet1Veh/XV+B4gYkv8XofPwjhDihVEB636UTnPw==
X-Gm-Gg: AYBFou3uWxAiTdngWcutXDv3SsSb+bn4AJkKYy/hxcw2UiLduw4y4Ht0mIzOmEoqExu
	6yuLoQJBbRjAL6AyNc5xnzjF0/uETFOXKrr0Kgx2+6MQLoyu7PAFXi++0ifGfMzuztbwWbZwr2Q
	2pXY2eutKkXPJuNf5QvX6FTKk0D9s7bPXgvOJr3FM5/AANm1z0VmDGVvYVeCAE4a0o3u3ds5QCm
	wGtQ2thPnJ3ONTpgiLiXsjjKNoAKGKEC82xHJM3ly5gpVO5TUszborSAARCx2oQyv5xVhc8M9bH
	X9msGKOPgK+UdWdL57InP7uRRQzMe8TmyBn9HBjyuKS+AHRz9SQd8v3eeumS1b8Iq9ATlblVCxH
	xA8ZkmZ8ONNN1xwwwOmIB1S3ubir4s9s6QgXigpqxCw799Y6JGuzEKOtZklHcwUWvWAvueSV+dE
	CuF2uuhqnO
X-Received: by 2002:a05:7022:f50f:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b5567b2091mr2086388c88.1.1795170953635;
        Fri, 20 Nov 2026 02:35:53 -0800 (PST)
X-Received: by 2002:a05:7022:f50f:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b5567b2091mr2086346c88.1.1795170953068;
        Fri, 20 Nov 2026 02:35:53 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm5751096c88.7.2026.11.20.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:35:52 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:05:13 +0530
Subject: [PATCH v8 1/4] iommu/dma: Keep reserved regions below the IOVA
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
Message-Id: <20261120-add_iommu_ranges-v8-1-d90486973b73@oss.qualcomm.com>
References: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
In-Reply-To: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795170934; l=4536;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=FYE2mL+pZ5Z1CfQkgLuaMoSmZ66ItGzwlfYFBujy6n8=;
 b=WLCvoXP/7Vfbh6awPjv6raAWHYawo4b5pLRUUX7uVPAlECWCVMKQvpoW6AEbF6Hm2zyCDu7DU
 LNluQNoNeBJAST7P4pA6j6rBPw0mJ/JExYQhkjltmeKvmyAlZrCtoro
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX1YvwgKeC9iTu
 +dimAcmg4i1tnk8sJSl8gGebxISIrbm3Gg3IYgcVxiVm/DbLtODsCj2sbCbwXkzGNaFgi3BxM1y
 Ct4n/OnOSXmrkaUVl0LldR/DtzGh/zo8ZiXPw6hyhsMgWxNaKloz5YmkmaSvOO2a70MdZWHT61a
 BM4MtDwG5KgkIvknjlZbLCoT/qoTxEV4swcHAIn33BdUDhoXxKcH47D5KGXCRAnGoFgHEFegdZT
 OcbNArao7fhTfBUdTsvrCdceBe5QlWe9jyAAa0n0Cck0FryfUTiraKf45nd5yfacPZL7tyzl1Cc
 u27OWpYS65+3cribEBS1yKwftxNV3LygwNL9Rpn4xSka6iKs/0TwvU22BuHfvkAuWYq+sv0DAFO
 1J5DsNaISc5+KNP/lu3DximKZGoAjlgYRgnfK94cA3x1CTR/WXaIB4ej/1zsJmcUfnBSbapfE9R
 DF+NhZglWM9C7Gi6G1g==
X-Proofpoint-ORIG-GUID: XwGLBTTptV_mwS_TY_j2pHXcc3GLlsDu
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b00228a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EEemQ_ogMLg0kHTv6E8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: XwGLBTTptV_mwS_TY_j2pHXcc3GLlsDu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX8bOAXmuUNw1k
 D9SH5Smf3Te95+ObdQYN8Yr+OSJaTRZsavU4eBg8MSl3wuBSVfv6EVM4DSyR5OVNSQEUD0pDJwq
 RYVOy+8+GkU4yiOb1RNRb+amii75zd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200042

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
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b66e83cfbc5f195a46d286d376068fcc13148611..2ee30df470730fd03b5dc46b46e3eaba2df130d6 100644
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

