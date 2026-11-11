Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402185;
	b=zhL/MGYaJ00hYBR5vfK2bJH4g1yBeDrD311JG8OlA3KxuPyPCmvM5b3gJ3rLHuZoEqZa
	 Je+gEcqR+MoYhy3/5sWbtP2TyobyObcrnYmrfcgE3XXhSt3T/lT1Mfy5zPSIUWBbBrpta
	 c7zjkahIBur30qo/+aenCpIkUiBXz1b2fBr86BY9tReNqg6PZRBx1toGw0unhwCLWnS5N
	 RkQh8/62BlNDxLbRyQjOvayXTBPMBTnVro2NLecOFGu7GdUArdp4ZAPf1tt+0O4+z37EZ
	 EDNy2H95u9I0Qdz9/Gt0Cv4wAdRoAQeTfOAtFim0+qpuSYs+X+fXJ19/ShvEaQVMrvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
	b=Z31bn+toEeBf+C+TTWK5YkXG4cx1c5cistD0PebEEWNFYWMMRvu+FQIoPx0qkINLwBDs
	 Txvnekadu+/tFRhqSQEBnCQaERPVwccO5chXgc24HvuqLE/P5oG/gW5ODjR7F1nEX3P+1
	 P9WMebXqo+vWIba3kBMbz3Z+FdqMb7JZ7eYBkQ+3aCkm5VagWgaz715m6Gh+zVEwoO/nC
	 Ljj4Q0wCIT/EUIhXqkiZHDGvvmJ78QxEmY68Tv4pZEmtPJUxFzNr7IUG/VUAEDQ57Oy+t
	 wpDknYi5BwQXRWs1+rJp6hzO94ivMcLDEn0dMveDXGcaX+F4q5wJPagnzpDDAoI0how==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PH9mWwXg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjzR67P8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F6606A337
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816F6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PH9mWwXg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjzR67P8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYsWO2286495
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L8WR9+GG2EfUF3UrFaA4c5ks
	UoCcRyLK8GiwEhxkvFI=; b=PH9mWwXgQ5gEnifkFQhZ3anQH+M6DXWxjaYRNBm4
	8z/pNaY5400bAsBEpQNm+vBW+Q+jfqxxN8HzrTI5OzBHGZzkIlvScO/QKa7SGl2a
	PcypMhUu/gBKUX5uX9oh04q9yOC77RcAXm6BOFLzWoUXUVzVzcsM5EsBVKTYRsaf
	ij+ZkoP+ccbshZD5IvbBTtE8sEoCZpbwWmu4e2y+FeoOw8o2qNPB3O+GvjrxE3+p
	AL5/WPO/FeuqH2XP24+LiL3cpFAdsvCWMFBzD9x9fNyI2UQVztZgs07w1ZKgjDrL
	0O5WFB1GTvFsJB+TEYBpy6tRV1lwTog6SnR/2XN3l1argg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm98qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:03:04 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eab0467c89so4037233e0c.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402184; x=1795006984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
        b=ZjzR67P8wqGqtdDTOZihJridX5Q+5MAT9lUERZhujk3OFRjnm/V3mV6hyZLHbMF+FB
         +byN0EVBtuZuuy7pVYmilcT+CwaRmYKUJUn1DS22CGwS191pyWZ2YqgC0M32PjG0nK7r
         fdUJ0Z32Nk3ThjHjex4z18y95JXPOjKkHBew2NeXNP42a6nE9fwxzlMoOUFCPeMLElUM
         u44kv3rU/ciITpwAdoXoXmblb0bND3+tK1Q4gU+gaSRSlNag+u0LRXnKMR+hpPZQyPwk
         wTgsrQqOEWHdoXmaZhouO421u7IYZzMWsXy53ZGchDt7r/u5x/cejS8bsSnALtMQugnt
         0rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402184; x=1795006984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
        b=wYMp/rLXvfdukglIneCnxSW8haEZuCZsyFxPcvH5I9BK69nmlwQ66hG/mPscO/8O/S
         XU+lZK52tH2sfdTyT653nTa5BIu/+rHGetsFiUmJ6ZsbdSLAX6VJCfoPQHelARfqsA1w
         BIl+QqUovnQTFqtb5ho2w6+naCnL1FWr5wJFWfMjFFpYs9d87sWz53IOVD7H8aQM0Unk
         WGCDpongxBpA3kdp4+15tgvb1kS8j7ZFaUsMevEJewtuh5AIY5XmbnXz4H5g58WxWgmI
         TamOsQedw2PoQ6ZIwgQkMlbM5dfhmwxrr1EDW2AjK/EEy5nyjJC/ufrDotFgHIbvLgLm
         Pb8g==
X-Forwarded-Encrypted: i=1; AL+hErHWoIHMrexwr7IV3M0fvt00H7RYSNJMa10caNH+wbpw8SHpOiuf+RR5HA7Cm2/Qop5512oYLGv9k8su4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LlFWD7nPWzRIr2Mit1x8L/n2GISdWgKzX3KJ/Qy07wSI6hpx4
	MIqWoingrNGcplRTOTZ9uA40IHUzjjAUfHAeFnHCk/2jDtpEbYTzzP8U8niNpDocer6KH4wQkEH
	W7EV+rUQJ/LK3JtmZbIlPrWHZTSM4I9JtXQTy/O4nqDFfbvJDuTaooHy26EJLOD/26Q==
X-Gm-Gg: AYBFou1mD7mmGGkEfNXCsxRZygxuujeKTrZT0hr4VztFY6Ov7QUisoWmSWxsIV5jAir
	dEhpw0V16FjV4i7E0NQ0kqJaofdUn6OYZlVFY+PoT7e6MLTtbE6Ho8Vk5PxB1yXAVzDU7bqWRwP
	qe0duaqn4x/6p1t3p+36fh6kXImJpCoqWj9YmUN2vZDLkRCMpG1bW2g3KXRRnNaM9gPz+gEYmA7
	rVP0E7NiDt0AZtgzRi4XHEz2SWnFHN/cXvrStpcCPrFPbVdJyXnI4mS6xgWpYDJSrXwS96CW0JU
	u9ikvh/E4fRu+IxVr3OKtwqzhHFiT43zdvwLBzGVaRFvUE46P5k4KSlJFqsBuMvSMndvSvyHpyT
	NBh0zjXknxhhn7AASsUMkObHSHQRN1qVRsOQMCKwcjbTnfOXpoP+eAk3jGl7GZRkUOILsDvsyK2
	qkmXQZOKzhdofePO4hdmgN5/dqqTf1+8ayMJ/WTqV3h9AEZ9ELefYNo2FRgZ82Nw==
X-Received: by 2002:a05:6122:1782:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ee1c2b2435mr795025e0c.2.1794402183555;
        Wed, 11 Nov 2026 05:03:03 -0800 (PST)
X-Received: by 2002:a05:6122:1782:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ee1c2b2435mr795003e0c.2.1794402183114;
        Wed, 11 Nov 2026 05:03:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bafba6sm959941e87.62.2026.11.11.05.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:03:02 -0800 (PST)
Date: Wed, 11 Nov 2026 15:03:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
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
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/5] iommu/dma: Keep reserved regions below the IOVA
 rbtree anchor
Message-ID: <5pyhbuzlrk2pf3sct7zopoycvgliuvzzmd5qse65p3r63jarvo@g3clac2ao4xq>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-1-5c0f72083e52@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-add_iommu_ranges-v7-1-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-GUID: xuFpwuDfNOEeXX6xLutQKepab2iOpC5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX2JoY5dd1ebGg
 uwOLNRP3lk6T29vZfmiXYoIXyaQ9Yv7fdq51M0O7SYSvnUU0JoQxZpTJB/XMgN9H6IrRpGbT/Dk
 pnit8aWM+km+hYxVzYlLEB1CwlFQcTqEA3eEvN5hV2GaqcZYLXx6SKJepA0V93oiIWkM9VyOVQw
 i5I+tN8RDGb9zqGvKXFkERDlHqmopgpCxHJc0ShRDwWRCZGwTX5+wQwEUn+46mgazLZAb6eLB1C
 1e6cp1jq9mAv7LTHoDSQLs02hWWaEf+5Elo+RhSa5fDcA9lzEACMbM5LEp3eE0R5MnpIKWiB99h
 D5YSOwZgCQPd17+Z8pgaR/wjEPncT5Td1f4OmydKSQW9ZCbm5PsbVseIOdmo88dr7Yp2dxLa5QD
 Gc+LCCqGWTys7gFOmptafKEZBqr4eSxSppbP97kXL99D1vRs5CxINkPREnzNPzSM+Tsmac6L4cd
 bNLvBzjPsM7DR9HzIpg==
X-Proofpoint-ORIG-GUID: xuFpwuDfNOEeXX6xLutQKepab2iOpC5g
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af46788 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WA2_6xBGtpbLEjlkeFEA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX8VTW2ooAT52e
 HhKoQM0+xa7g2Q7rfrlN+c42+O5ZAhtfLL5gC3W9toK6QT5FvCgk/uAnnQn1jSakFINf8y7wOVe
 ICZogdbB5NqysjGMK3hIAwjmwD62sfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:24PM +0530, Vikash Garodia wrote:
> The IOVA allocator tracks address ranges by page frame number (PFN).
> The highest node in its rbtree is a fixed anchor at PFN ~0UL, which is
> embedded in the DMA cookie. dma-iommu converts reserved regions to PFNs
> with iova_pfn(), which returns unsigned long. On x86-32 with PAE,
> addresses are 64-bit but unsigned long is 32-bit, so the upper bits of
> the PFN are lost.
> A reserved region that ends at the top of the address space then gets
> the anchor's PFN. reserve_iova() merges it into the anchor and lowers
> the anchor's pfn_lo. At teardown, free_iova_mem() no longer recognises
> the anchor and frees it to iova_cache, which corrupts the slab. PCI host
> bridge windows above 16TiB and the reservation after the last PCI DMA
> window hit the same problem.
> Compute the PFNs in u64. Skip ranges that start above the PFN space and
> clamp the end one PFN below the anchor. The allocator never hands out
> those IOVAs, so nothing is lost. On 64-bit, PFNs never reach ~0UL, so
> nothing changes there.
> 
> Fixes: fade1ec055dc ("iommu/dma: Avoid PCI host bridge windows")
> Fixes: 7c1b058c8b5a ("iommu/dma: Handle IOMMU API reserved regions")
> Fixes: aadad097cd46 ("iommu/dma: Reserve IOVA for PCIe inaccessible DMA address")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-195658@kernel.org/
> Cc: stable@vger.kernel.org
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/dma-iommu.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
