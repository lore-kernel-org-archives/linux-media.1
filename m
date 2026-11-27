Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783306;
	b=oZdlz1jgVpR3/rmoYaXV8VHUJzQd9E5GmmF3TbFg9+AfFa+FrkYq3qPdUeF2tBP2bq0N
	 bf9dS/2MhC9no6aKrXAfqldZGySfal9jxYd4mgVs9yKs6BC8Q7Tp/YPINvr/sCofv/SYV
	 cDTGKMT8e83ahcwJhR4JDDDKGYdtqxKT0/l/PVieAFn1UzKJk8+Gse29QQFpT3zcBDD3t
	 IaX2bs2Ls5YIMjOS4vwzTz4WrN0vnMkt41agR33u5PUvw31e6MH5+F5aI7CiWDVauidik
	 h/TQ02McZNiQ9uH9kIVZzRW+Fvys9I1kvBmZxfHElp85uOg5h3dYmtzwBuoS9LSI16Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G7WfnYAAz9L7iq6xcuOnJKP+ixkbp4G3odLAKqkVuMg=;
	b=RIaMluyfR/V00rX1Pog+XKCSwAjR44cRgucCYx8/xR47Zzce+02/d32ndXr9fqd9Zn56
	 LQvjGGgvv3CnWl2MTO33PgREs3wK4eOyU/LR7sx7jnuDvMm3Rw9X8y30ZtFETsi803WGs
	 8qT6jG+8vVNYKxgAjwsqfLUJ/RDGvrxHYp+FS6cC8+y9BKGqOTVfVG/nQHDQ8sKvXL0Jz
	 uMU2/q4qZcMNWhjXJWAkwfs5t2vqDn5MRw8T70yIOIVF0cJsIjQnlrtHPZ+DMLLlGUADK
	 6pwuJKOoca8JqpiXBn2D3Pu+UJE3BKik5vtqx3bHQgc9n5MkIGLp/zl/OEIh0WquCyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ksYuS3+N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jEjY+FC8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6960A606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6960A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ksYuS3+N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jEjY+FC8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp1om1047037
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7WfnYAAz9L7iq6xcuOnJKP+ixkbp4G3odLAKqkVuMg=; b=ksYuS3+NdQcAkupq
	UqtxonlxKl8nzWLPnjJ2cnDy4QMEFs8ukuo/xtyLmhlxavYzxHwouTzgqhYBoMbE
	2FA5UbMyhVHF5c3ODFPVYbg9DjA9YSOu5EszWDVtsLgLG//r1U/pSoNXMRgZtA68
	ePQQjJsazCF4H78cHmZmgZXN5kEbalgR4Q+rqk8JgnK5Wg7nRJAauY1hDBqouPYA
	jrWUDUIIiP9xyUTXioJvgDZga74UZUqQzVAjVdS2/KZ9qzKXIXJHo162KVnU/xX+
	c8g80b8Zvlp70HFSnj+8i8A9z5BKRrOev4mB8d/T1F6sBjKs22r5tNsBrlTg3Afa
	Zgo9/w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkyxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:41:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so7019784eec.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783305; x=1796388105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7WfnYAAz9L7iq6xcuOnJKP+ixkbp4G3odLAKqkVuMg=;
        b=jEjY+FC8/F6SyJENSeH/5Ipor9xyWqnnr0kYQ0vAXgWx6l39ZWH45sesJV9MrMRRRq
         F4ZbARA7aUR+WmMqkpreph7pteI3BAyzoLIL6qIvSApjUESpkAWSO6kwuIqAZXzfrFvK
         Um0Bf67ehWLPUavx8SKe8KnzjBP3E6ifMurS9Mj1DDcRiWGtsufEEI2r/p6FBCaDOacK
         1Rl+uhpiTsR1WGDmIT9VGpmS8OJf/OEsoRvj6pO5E4qS8KJqlxkep7+fB0YdmaYpmZSO
         LemZ+n+ryUjf80EDvuqcYBrycC5igh+nZx6t+2X+ivcZ5v8w4GFDXWeDQFz8Phl+Y22H
         rXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783305; x=1796388105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7WfnYAAz9L7iq6xcuOnJKP+ixkbp4G3odLAKqkVuMg=;
        b=UvuVZTzLwibDryYEwAyE/H+fUArA1LEXYuz0j7dHyF6vC/NbFj3nRLEw8jU70VyUmu
         4KuaqYeH4JzSRdoadDAz6lAzW7lBDt2NDTILsc+LfvgiFC+NMZf9AZq4M8m2EKrRC1e0
         zYwvg2Me85oAr0f5ouH4gtHlBwh1riEqBeVfEeKWHVXxida33C9FfDPcdMm0qP6ByhBH
         eCtQtqIqjyQGquvvbjUC13tLgUVQkVv2hbcm/ir11156sDjORsqqoDT5wMcNMuoI0jly
         U8ND/9rbT4Jua290iDE6+kCxVRcMtDtG0dGhMMcjX+BubvGPW+miUzCW0cP4bT4Sc6QG
         /xLw==
X-Forwarded-Encrypted: i=1; AL+hErEbR3BGjL6Jvfpn9nUvd+5k0m2jx/GBHCgVsGlAO19YOlXumKYQi7hkW2emrpltlwrdFfRfNPpF1fe+gQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8nqzB1nhGrGWtr6iGv1LCg1AeAHUp7dpyAeAdkoRqOmGZ/B3RB
	gaV/cjDPB0xWFn05mOGfh1cM7cVEcA1Fw5l2c3m+F6pYXoj5stvS8Ts630cuQoc4LpkHvsAmn2F
	4SpsaHDS4eHiAY5Gja/XaG9mb2W8JrdYFdBUNIAdymvdQMMmoCHJXssFVPhVMxR+W7g==
X-Gm-Gg: AZFdTZektMqdhfrxivWVLBy9pemYymTEbLIkiy1cqXYAXK1pNKKJH1jBRX1kZqE+aaG
	Bruw/oRdmyL2C8Zmj8jqtgecfpetf2vdJlGUCyk0eLoP2ffx+aLjhSqe+eO/TzVP6RrJpjsmJx1
	4fTgp+gIoSpyfp8XcDcekixTwjSNfTbS7KUBpECZ/9ZzZEXAsJ7cE147qtL49DHnphxazKgzr+J
	2ijl4d1rMyf8mvOn2goGookjkEzm2F4OB+d+rsr8oqC/3CkHt+sxyq3O1lzvX9hFh9v+WFQnvOI
	DcPk5qOMxPA8Y3/HY4dyEX2B57ahWXTU7PXkGb7kuq3NxeqkJfirHz39x7u0wvSJytfjQ2Qeusj
	KlG+2DZKq/4XOC4vHPb9FzwVGTtIpivG+B39hLQtPIYObhUfNmjeMeuJBsmS5vNcFDiXMYTTNs/
	1AqMco1A==
X-Received: by 2002:a05:693c:65c3:b0:386:e9bb:d9d3 with SMTP id 5a478bee46e88-386e9bbda7dmr2871199eec.28.1795783304882;
        Fri, 27 Nov 2026 04:41:44 -0800 (PST)
X-Received: by 2002:a05:693c:65c3:b0:386:e9bb:d9d3 with SMTP id 5a478bee46e88-386e9bbda7dmr2871178eec.28.1795783304400;
        Fri, 27 Nov 2026 04:41:44 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm74177848eec.28.2026.11.27.04.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:41:43 -0800 (PST)
Message-ID: <1ea0310d-b25a-4e34-930e-7998eec03605@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:11:35 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: iris: use dma_iova_size() to check the
 reserved IOVA size
To: Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Sibi Sankar
 <sibi.sankar@oss.qualcomm.com>,
        Honglei Huang <honghuan@amd.com>, prakash.gupta@oss.qualcomm.com,
        Alex Williamson <alex@shazbot.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, stable@vger.kernel.org
References: <20261127115849.2780625-1-m.szyprowski@samsung.com>
 <CGME20261127115900eucas1p268ca3a6688c2fd99513317dfc99dbf59@eucas1p2.samsung.com>
 <20261127115849.2780625-3-m.szyprowski@samsung.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127115849.2780625-3-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UvsnNhZ78SZ3ORaigSNn5mWdS5RHDADP
X-Proofpoint-ORIG-GUID: UvsnNhZ78SZ3ORaigSNn5mWdS5RHDADP
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b097a89 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=umoC_DmSGuEwgYlhGCYA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX8xPjRIzYoHKK
 ESglnk+wctJNioyrOUyyDU+bIdaB8sl73a50kiPFVRU9E5iSgLkN2XezslIPz3Ebd9lBFgxwCoT
 vsXbC08CAvdjAg/j8rpW8EBwvUUiXWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX0CoK7X+/GPiX
 n/uplZMYutJPdbKAp+/NMB4TPIWz7I1QYhqhU6xmV2H+ac6a+P0fkjiLog6TzO40PVhecTazHVj
 k5bcFUWbCd+7NlEvneo0QyXUattDGifSCFELtOjrHKQFZS7qDNAW8D7gd4MDuFy4Fe0BY0eUewN
 M6JJe8kWfuaxnQNM9MebOPETHDH1/0JAml+3W5EUMFWWcG490Zg7/m5yHp7Stf1D6RNaVFPdqgg
 7mkdhdXgNPGBhSuE9HeGFWhH5xejSEMKGNwKGz3Bwij8+RKwOZQH4yvp0TeUYG7YQDt+IkzcRKx
 OuR+Y3EedSn9BOqDg6CcRrfPiTL2po74auuz+O5GlEJKMng12N426OSiIUJw3YYlppmeaW/g0Q7
 JciXYK5VE3pIXdCD6qxbIZPPPncv/aFcuxziuMBMt7Ygp6etaj3FFT49tF5jUqWwG0n1fzsM/cL
 XEfsaNyv79/j76LS5gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270050


On 11/27/2026 5:28 PM, Marek Szyprowski wrote:
> The IOVA reservation code compares dma_iova_state::__size directly with
> the requested chunk size. __size is internal to the DMA IOVA API and may
> carry flags in its upper bits, so use the dma_iova_size() accessor
> instead.
> 
> Fixes: 200473c198b2 ("media: iris: Fix iova allocation from restrict region")
> Cc:stable@vger.kernel.org # v7.4+
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
