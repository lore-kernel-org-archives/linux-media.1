Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB942D0620
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472731; cv=none; b=IRLkRsPU8HqEuHDZHqo9FL/75JZSZV3XArB/QmGNNeLnGWfkJx6V1xH2+HulOZa+TxgE9Icm8O8piGaXQqkFL+R3S3rjGzjiwTrgMqQCG0bK/tLl8+e0ZWF6T/8eVGcNzeRt8NG5K2b8+yiddvPLXnjnvFUffkrtQ/o2XumgCng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472731; c=relaxed/simple;
	bh=LHr0gqH7n0yRSAkE/aalDwrj21rLVhWzRJr0Xrj57rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNjvDiMAUioSa7Ak0OwkqgP4zsj8QVhsAOTkEPt3/5pptS9Pa7iFFYuBXq8pMu4Pt4MXnjmT0Crf3zi1ClhIp3LVsBy2ZSsjfGUfjaoKH2CtY4rgMMOu9sLa/UOYcKBQ2pItpkrov4P0g0lBw61pVnTdb2nUsnwt0/o6oW7BbF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RryFkP88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzMBAvx7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RryFkP88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzMBAvx7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVFST4148741
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 15:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOaMsWHOvOprnRa69YNWuqJ2U5SFuaIR1zue+6jvCdI=; b=RryFkP88wN8a/mxl
	xOr2ZWTyExtE7my0hLk/4UaEP2w3EKwaOUXFyCuAP65hpjmF3zGminfKQ0JHKQFE
	kYcVzZ10drhhvYsOacr0B+EIy3OLWZHQ01vnY+nBgp7q4+kIZLHhlN3qkT9nHeqc
	+ze9jj40QjLYR6D4iV0jH/yXULlEUWPd3lpW4YQeXPqv4XDiL8l/CzMlLrBSk2AJ
	KVZxhsewck0dOIzowKiBHfQXfKFFPXskpRp0Bvc6lAzBD8U+qnggX8/2I8Q034RV
	Ckuk6tJknarJSp5+/cFl7Kkx8hoVb+pEkGYqIwCGLm+PlcOH1NKWKZpXtHZxVY1W
	PDxCYw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6bh1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 15:18:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ce86cc29c6so1187758e0c.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791472727; x=1792077527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOaMsWHOvOprnRa69YNWuqJ2U5SFuaIR1zue+6jvCdI=;
        b=XzMBAvx7IfFS5/nKmqsATbbdehY2+o2A1wblINrG83sy/yfwa8wqijahie4r+0cwxi
         XKQA73sUpkmkFJSQac4YsPp0XOMONWmC0R1aiWlkYhpRUbWCa5Zt+vERgD6bpM6Jl+8A
         M/Hz11bSMQF+JdGB/zyk2smz0dhqFPAAUzx/O+4GoZi4t9k3l5YfddIqe+YuvmXTfsTk
         iH/amiO67ctTEvNR9o134dDI5sQ0aKgfnSUbHYSIvnoDpGoNE/oAB+uIVjgxLiuR8LnL
         Z9tenzXehwbeK127g/vOasL2P4Ud9NcXpMFOp2yeMKsvd/Y2qTrI688QoERJtOFeMHfW
         e8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472727; x=1792077527;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOaMsWHOvOprnRa69YNWuqJ2U5SFuaIR1zue+6jvCdI=;
        b=AQUoxASCKfcm0r5bNbkhJEPE6r4vIwg/n/w7Sf3O6CdfFD40cnUvI/th1liFUP3UAu
         5rcMQX7SZoq9JsPVbYofqhTBhFN6L3HwL+QyI2kOnsVo9u9g5FBycYkAMLqgMlaop3/B
         me6gdZ+SwhiVH6M1UZ6F7b5b9ryZ4S17WmKr3faj9k87dY2Sg2+vRkwCb4ttF/4DjcSI
         /ywG7x78V7hqFmictREcPcFcAbAoUaYSnOqLqIRKlViF32lfLAJMTLaAVulH/fB1B/S4
         DbbCjctjHxMkbaiR8kemndyL+BCsH44mH4g4HpyNZYDd9gs0c3XeEWDDn3l8E2QRMIUy
         +urA==
X-Gm-Message-State: AFq9FYJ9KJxKRDz0J8VnVAUllWV2Ql9fHFDxYWRJEpvc+Kc/I7ap33Xu
	hvNDiWk8ZEZDRqeZSxh2MFqVdANyf/P5D2boo0DCRgXfn0KqtQpif3toB6JQoCyfYM2qiYy2fxU
	21OPbEUAwMkjEBT8ovNq43i28XWbYBjie4G6lzUhDp13eyhNLej/vw5pzQOHTPIitPQ==
X-Gm-Gg: AYBFou3q95iM8HitJtuaE2/OBJ8aqp3nhfwkSjdLB5tJMVN3kg/AfUkgelXBrGBKE2S
	+clWDvIy01A2rRgoIt7jzkbp0P+ZSGiqGhaR3zekMZl9SIjMDtsnHRnw3/ExUaQTBAGh3+HipeR
	o/vyYJKlS9VT2V7KjRePY2ZlD1L3MFiEDEh+jozZ5X+K8TNql4e2Dlss+w4reB/tokOJtVD+8dZ
	GUemfDMwAFdU4c/4x1AJoVYKYGNqQau0eV4R8nxJWoAb5lbhlgJmCaa+f561Zj7iNomEH2udIXi
	bLiu+lWZFAyfevf7UK6W8CDxnzXp1L/Ubkz6kOkUo2HUbmfaxza+cClZzEwBpvwTg3tq5NLgiUk
	xH3WsVHO4R1GF+YoTyz852c7N+IVLvWF4RnXApF8=
X-Received: by 2002:a05:6122:1d53:b0:5d6:36d0:d20f with SMTP id 71dfb90a1353d-5e6d360322dmr2727001e0c.23.1791472727432;
        Thu, 08 Oct 2026 08:18:47 -0700 (PDT)
X-Received: by 2002:a05:6122:1d53:b0:5d6:36d0:d20f with SMTP id 71dfb90a1353d-5e6d360322dmr2726979e0c.23.1791472726995;
        Thu, 08 Oct 2026 08:18:46 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a185d914fdsm119815825e9.7.2026.10.08.08.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 08:18:46 -0700 (PDT)
Message-ID: <337dfe66-eb55-4e96-b5a6-b2b9214d9170@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 18:18:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 58/74] media: uapi: Add CAMSS ISP statistics definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, bod@kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-58-ed985aefd611@kernel.org>
 <7cec7156-e85b-42e0-857a-e590b9e252b2@oss.qualcomm.com>
 <c0d8ff20-ee5a-48b2-8cb4-3a837077e192@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <c0d8ff20-ee5a-48b2-8cb4-3a837077e192@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g13pcZfo2jljVpQh5Ps1Yg8YVkXQBR-C
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7b458 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UWgbE6y0LSW-oyGiUeIA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: g13pcZfo2jljVpQh5Ps1Yg8YVkXQBR-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MCBTYWx0ZWRfXwcVzb1FrnRN6
 gd+h8G9h0jurWnBvnUSwhiK/9CsUVY9HjTYY1lM3fa36QWWsvbxIPquFxCY4VbYoOlTigeBJFXM
 AdvKd9Ytgz8Z+kvx49OJyF9a2HQQI02P0Bj5WDsrYEsiePUCTID/yn2uJe+6HMGqxEw9nGX17aM
 hpN8/sJWi8ZIcGUfem36UjzW6OAhkRYn12Nt08114ZYlhJC3ouniNWvq+yga7NBItWg/VR8lOya
 ZrP7FUbkZojHz/lXVwVS1bFQDoYnBQpk7+bh8LzVByRM+oMZa95F47xBM9muHSk3Q9HrSkkp2B3
 9gk1KfbgLf0pkC4r0eO5UoL8A8huICtR4tA2h76ql2s4Tot8HfYt+7VEzSQCnyAlxIMsc7zhvUo
 GXtTXSIJabyHS2RTdVwr0OjX6biHWoWA+xPrLA3E6jdTnbIXGjW9617E9Ze1awxuaROC3Hv0Kvq
 WgULPCMJoFZ1HqIgh/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MCBTYWx0ZWRfX3jUKYJfFMrRp
 NXZY3/54SxCkqLhCjPNKJL7UYbrrLBy0UIb4HQDCHQVvBPpaMeHqGCtPXqCsdPhTQ9QEOg4NGwn
 +iepPIB4CF+2kt+ZBzdJ51GZ/F3kKdA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080060

Hi Bryan,

On 10/8/2026 4:40 PM, Bryan O'Donoghue wrote:
> On 08/10/2026 12:23, Gjorgji Rosikopulos (Consultant) wrote:
>>> +/* Number of bins in a Bayer histogram. */
>>> +#define CAMSS_STATS_BHIST_BINS	1024
>>> +
>>> +/**
>>> + * struct camss_stats_bhist - Bayer histogram
>>> + *
>>> + * Histogram of the luma of each 2x2 Bayer quad inside the histogram's region,
>>> + * over CAMSS_STATS_BHIST_BINS equal bins spanning its input range. Quads
>>> + * whose luma falls outside the input range are not counted.
>>> + *
>>> + * @header: block header; @header.type = CAMSS_STATS_AEC_BHIST
>>> + * @bins:   number of quads per bin
>>> + */
>>> +struct camss_stats_bhist {
>>> +	struct v4l2_isp_block_header header;
>> I think that the whole format is not correct, having header is preventing address alignment
>> of the buffer for the stats, as i have mentioned in the next patch copying the statistics
>> on each frame is not correct, just to have generic statistics format in userspace.
> 
> Err no I'll disagree with you there.
> 
> Since we are introducing stats on the qcom side we get to be the first - 
> or close to first - system to implement extensible self-describing stats 
> which is the mirror to the params.
> 
> Extensible stats lands in 7.3 so IMO there's no reason not to use it.
> 
> Also I think its kind of a crap design to have extensible params but not 
> extensible stats.
> 
> It should be all or nothing. I don't see a gigantic problem in copying 
> in data and then looking at how to accommodate dma straight into the 
> stats output with block alignments later.

Well i dont see reason to accept copying of the data in the first place,
i have no time to check the exact structure but the statistics are 
not same as parameters, usually there is structure mirroring exact
layout of the hw, parameters need to be parsed and written to the memory.
There should be a way the header to give exact offset of the data in the 
memory and that will create a hole min with page size maybe bigger.
There should be some common sense here adding everything in the kernel to have
generic UAPI should not be at the price of copy overhead.


> 
> The extensible header facilitates next-hopping anyway so userspace 
> shouldn't have to change once we DMA to the aligned regions.
> 
> Also if that is not supported by extensible stats then it _should_ be 
> supported by extensible stats - i.e. it should be possible to DMA 
> directly into the output buffer and pad the blocks as much as you need.

Here i disagree we should have proper implementation in first merged series.

The question is what we will do with the first header which describes first block.
I need to check exactly the discussion and implementation for this topic.

~Gjorgji

