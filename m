Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AF246D097
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934754; cv=none; b=NeXEB+ugjiZPaykHjlX3cQuF02a7/fq5WBSIgaUDO9+uYNh6Vt3yymXwceE0ykwvgK3Mf5z+H/Gd239ugOaO1CgfO2AAMVeG4Dyr4KRzqdXe9xbWrUUKjQJJmaG1Pw+B+BFWgOv79qcnjNYjMpypPUNe9r3KPZ1PxxxfFI1MkjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934754; c=relaxed/simple;
	bh=Wk003mPRscXKkC2kxK3DF9LhU0/tg9S9WPMvqfiftDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRdFPUWGTnrfsOwZ/nunw20TCqFb/hw5Mvl328fdJT58Zb5LEtzbeaSJskig5X4TGfk2u+mRv9IapNNIa1kIf9DtxsAfvok5TsJ6v+CJmnaRuCDaP8f88PDROWa4FsjpyJFUD1QVulZDnBrgxhavwg/waoANEIxgAJMBbFBw45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZFAZPXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOyMwdil; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZFAZPXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOyMwdil"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nZt11190354
	for <linux-media@vger.kernel.org>; Fri, 2 Oct 2026 09:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=; b=TZFAZPXJvSUNssIP
	kbk4Y3PNfs53YClIJ7NeWTLSU8weFgQIhT0GriEVdsvjpKB5nQqVG2mF18cyI+hj
	TxMj+coha0MF9X5GnZRp0uy44Oi4HleRM+fPsU1qSAfPz7fksKJD7FFLF1ZVF13b
	r8OVcf9DdQ3OG6r/TrU7ZtqsuNAjkYFZyizO+z1/l7vRtJ/mSOPNVCPFy7/4amZg
	rB4V986F0pYY7OEry2uircqTrRflMnOt74soam/7mi5DQLYHbFdDNdAlZk81UyuZ
	8mti8T1dPGhaMMSipI4VKklJ25Psf88ohK304inRExITdggAOZpJ6WTjwj/MpE1g
	pjBHZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjj44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 09:52:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so1831630485a.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934751; x=1791539551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=MOyMwdilCZtgFK/CyzQ+TNT5LRrlZr6NHF4RfIu8wBr6HgmAXmKcKtQvrYKzZqR4IN
         pN4gE//hzYv5RS/9b531nf9tKVJ81IA48IywJLvUaLs0mCzLdZtC5tFN8vYzRqXNzrge
         cjpv8+S+5DjvRA2W9fiymhPLFnHy0ikH7Lx3irSIvpPnDBsUJB6LREB16lY4Itl0st9Q
         nC6l1MdzXbJUxhQp1mAG4mcfsq87Z2+bkx9bxgiTyq82kaNIHvE1zphQVOqO3Ouwyb/R
         fdUtWvaF0BcLXF/AYZ2Azd/eoiVDCBinAcKfgZ/ZqKXZgVPgYYs152334MXnHefPECfV
         1nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934751; x=1791539551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=v+ETihriE4ottwDM1tL5GH6iZB8irlXi0roVfCmJ7ohK+QTtQCtxyuhEKXJqFQT1jw
         RwbGXoEJjhhOHXmr2ZTIOJ5u+A8zZrB4AsXVh65SEQXQO+uAGMmMZ2vQcp1GLw464Y29
         97kUPF8ZR/3Oa34recZZ9yqq9WnDgZQMrEGJ2yFlPAQPT9aiW985Pv/UWfzFKdJ+WNco
         sYdWUZUIdGrrJY+sYmWg7dv5MwAcUjPoGltt+J/Ppyv/5Bg9JB/jBecN9O5es5XA3Bjw
         f8mpiaNw9Zgzq19COS/Y5WPThwth867OMJjlW1EqriaJR0PfG32qyVkCUyJHO4FDm67D
         71Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxkKxdX+hl/xUIb/bWXdW00Rsi8iBAL3pVvA+r3TLpJZJ1Ai8pbuMWDBsJE8r5RTGl+lXhLEQNHgEwTlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kbFh61AZYrWxRuRClB/6UuxqG1VxLmkIHr8JS4FfH5lDyH6Jwa
	0vvw3LYpbc1D7oZtY/07I6CalgglXDsvwDDgJTwVkiKcJTSGDWUc117ai2SfTfbfLFRjNAOCLeL
	Aeao+VQPun6745RlUQ/cQjnNppoNKSoXVihRc7pJtm5kK0nMihsrh+gHhQBfUujdZKw==
X-Gm-Gg: AYBFou3VkrirAJZgCvtHrHI5t/K9/HGbf0uNvkOfu9izYFN4RhREZxP1iVgsbyaPs1+
	+dxAikLU8urCTPLzXLsgm4h1b7h2Y5dlNldWBkrGEknofW7u3zfNKOJOpSxrCBJS7SmFHVuapW6
	zSHSv84vldPB+Y+p4SasGjqRHVF5YjQ+UyT6OjRW75KoBy2PThVZ7x/so5kbNeEObnkcg02l9hB
	tkpjwWnD7hydMfqGEMF7Alc6YRc27ZMnZrq9Yhh/PKRzb+wA+VRbjL8dQxiI6HrrY8vdbtGV7wc
	AXGuHhxwlz/Lp9yuSa+2/fVvSygKgmmD5p6WcmxD/9JBo7h23STzTwIZAzbpHCWS4D/VCK8km3Y
	5MKsVsRA37EMLAi9jaDgKCsehBGJ3LUy8RdmQHJJQ2PyPGKwsNGoXSGB70OW/8Q==
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237247985a.27.1790934751372;
        Fri, 02 Oct 2026 02:52:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237245885a.27.1790934750933;
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm55681315e9.13.2026.10.02.02.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Message-ID: <94e3f42c-4ffd-417a-9bee-69c504360af9@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:52:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clocksource: clint: Use IPI_MAX for IPI muxing
To: "GUO Ren (XuanTie)" <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Anup Patel <anup@brainfault.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
 <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vjLljHVBSMgJjbruR73WlZZj5WxA9mga
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf7ee0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uCLItbk5GdqmTsIkEKsA:9 a=QEXdDO2ut3YA:10 a=Dn0JnjMMefUA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfXwB5QJbVdAVGs
 LTCIzohLxv5uO28OHvoX4106hAflLOHfb3GBbKZAsT9ztCI1tMTMrhoFrMlr4yCPtnUKPOqeb5R
 wUx9Xb0VXsgdP084dbcJ3qXXeA4C9LaQIV6s1/VWtmCu3LDUOA9C+DMejIrdz3lCQwQmDoz0AJa
 ENEQpG+2Yt3Vj+f4vQwEyFDyCarHtRslLJdQw38l2zQ3EvUjj79pgoPkxwmb8veMGJ9r8TlNPuj
 YmZlcXVpbiZbXBXtiMGchQ5841BYrXm8TFZzyoDdnYJQdYK8OOV7ZumrwKDqA4ajUcge6Ck5fx5
 0URaCotKTZwj0IwPnVbWrc2ovoOFzdfmX8xPfE6QgphWtzrix4YwOiIMSL9wrfRQcj8/GdPfj1v
 YXU0KtMmfhnau5k4hLBCzeQyY2G7vcpRjT5GlE+TgxQGY0OuOB9fFzcrcK67LKmhjYdndacF4Vk
 ApFaUIx7iFchqoNCyCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX7KglCMNj1Jdc
 MHJkkMQBywLX1TlZL7/g5/n8dPxVEhAlXMvbOAKd4LGx7fPXZjNphkMm2PfkNrBPvBLUb7A9D+F
 H+WxGTfd5OD0DOtSaI0AdZtWETZG+Kg=
X-Proofpoint-ORIG-GUID: vjLljHVBSMgJjbruR73WlZZj5WxA9mga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039

On 9/11/26 05:27, GUO Ren (XuanTie) wrote:
> Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
> constant is exported from riscv asm/smp.h.
> 
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
