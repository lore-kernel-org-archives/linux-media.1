Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569528;
	b=RNxI7LcvvoX9YV5rOJmnswYOGjoUmcBAszLMmJ6f2SO4nlANUmCC1V1+Ljj/Fg49Mqcb
	 mQ4QgDlK2qfA1Uc29gDw1OsU7D3c+spkygb7X8j6xsh8SyjuwaNS6GPbEQnlr8xKxXnav
	 t0TPJA/sjfRvqK52AYXI8ktQOPGKW4ntT2pXoE0xdFTK7RCwB0pHXAXyBl7JwCKntLYZN
	 lKSd/i1ZfWEhzXXU6+KyQpHz/ws5RfeHWULUY4HlrmVZxefpfQp9f1FIiwTMNfIk/s+VD
	 wImPWBfKVyHeHJIY5oe6GAjWxbuLW8QwrkFqusyGrC3+vBkPT1+kwYrkHyqEdpKgI9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
	b=bV9Re2gAJPTOUrqKvsTL0MlMv31l6wSa53roV7Z1bHCXJAoZ0EvJiasrjRk5O1p8iXI1
	 /SdtsBerPAuZpK94UHFpajbHqS01Hw5/zPqITF5HEip8y3U4hszIWxqlN3TDOjrMUmxNC
	 AQHyFlhQjjIp1nWn9Tj1QqE+C7+rQZxIps1Hqrp6DU/OqGJS1SxqY3lEfZls720dHyXn7
	 h9sgH/aJdXXgOzeoo+o03ds4M2/jdd+JA2SKGpJBaHfiLTYaLg929hXi7jnwuFzT3IU46
	 RW26HWTWhRanrJqIsh8CX+RIWNzazKF6lHYVSKJRBsKOXRflZXqoRV4sX8Mhh2tID0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCppyAF4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhvGLjr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894E606A31B
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2894E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCppyAF4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhvGLjr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j9483874614
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=; b=ZCppyAF4iD9eo7Ff
	djLO5MAMC/3oIOxgBbLUCm3c/TYVxQgd5gX3Q7VHl6q24nAEETxzzq/OPSO5/xC7
	jwaxAAgmi2HFC8A43uxcM0Rsd6KymfI4cGtziWegJu7deyqe9GdryUD8Zeq/8/lQ
	Jm17wYZfM3arSKuT2tRaD3DKNYAjgHNz45seLuGZ/OHT6++qnZMpstzKvGFFnNlR
	lUm6gIkqAZFdaNqqsVmTpv3Mjm4KO2+9j4ZaY4TnQW2E+MX/CWOYUqWGmClrFE/q
	EqS7TNPcNladRqFbaD7YxP4yVoq4A/3pzmVWFZ7la6I3QTkoQhk8uchyO93UsZVh
	CoeNAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1sna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:58:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91795e52969so1634466d6.3
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569526; x=1793174326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
        b=YDhvGLjrIDEhuGo7Fhzm52vLvD2utcA4m5Oiqfv2ezQiFUjOe89/DvsIUx5l4fFWfU
         CrrpWR4H2CggzX/tZJyID8pVQ1VRysvgcwoScv9FBV45AsR6CS92fMibsl/bE97488R3
         y00vfKQN+CXajTIVbUD/exOmeMR3zy7fpj3UY2ARX14QIujiZS+cofW3SrPZRxfhjqiO
         +GmO0bMMiwzE9AxOTlb19AWokgkN1+bkkRqiqJASZIksxwxSSWcIrSpAlmAPgCObf7O9
         wJ0h7s661viptUrrN1fc1USq27mX83Su8+gSChAl9P0dZuOSoHPxABBzWVWiiyJeoNj9
         FZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569526; x=1793174326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
        b=bwrbHGT0D4nMV3Whq6JkoQgKDsXTNIv+BE5myYDVQaUhPATYQ3UlnxZXaZDDhqDvFt
         pt+Z10p/OV2SyfdyI4bLDwyODe4eVDAXcmbLNF+lOJ4sF5NGqU/ZRJuO8UptSOHpSm1e
         Btiv8hd7L3ez3wX2aSktC26zty3UpgwhYFOuXjYS0OoeUvyfGcuFuFMKWhEggOHlW2bN
         QanA+zOfgMPZ+B+OrVBeyblrZm7ASFG7uiJ7bjYL4gt0SxmGoZz55NvsqFa97P6/2rDb
         bpdc004B4xZ8D/EqL8EqgbzDhxGSxq9+V1jq5d8VvUYAt6Hqe4ksAURKkqZ3Rssu+h8/
         VlSA==
X-Gm-Message-State: AFq9FYIxBF6hWhFSe/QO42ctkq+jLM1JhlP2KXvVPDO+hOQWNDBVLhcD
	6eKyfg61YDasd/51XXdq20VSUum4yWi2CFBi00zwi3gmfvINRI3TdAZJn5hkgPl/HNxiUl/bvak
	KIerDh4jD+xE5rXyduEJR2usU9+ubwsg6+QE2GqtBciHmjrln8jraNrt2FMhi2EE7eQ==
X-Gm-Gg: AYBFou2heiy/ZuR/EpovUwE1XD7+wWNKzgOFdJXbBaj6QU+y7hDIt17FmHVCczv36l0
	6RwJ1DHxZtQPCrriyBwpb88mqk3KZloVF0M8hbBgzZvcTzex7aVI83OCv1CyYjNzCjf4QEvGwh9
	kKrnggNxB6EbSwQpS1+OHXKdyZ6m/k7xk8yhevtrnSH7lUHLjabZwe/EOUwLiisZa8Qw5Dj+/np
	2TRJoEJKHOuhsZOn2xcMnyEkZPiU4atck8UquxkBcSyJBEanBmD2H4cD1DS72Xd3h+FNlTCYVzB
	nNX2PZmCFiL2z02DY6wkwbTMjU+iu3vkTqWejB7+DIIFzoyAQez1LM8+D+ElUhQElxfODytbUPE
	AyUtNyeqEbd1ham7RsB8SxQ==
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr22605771cf.2.1792569526107;
        Wed, 21 Oct 2026 00:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr22605431cf.2.1792569525647;
        Wed, 21 Oct 2026 00:58:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fba0fcsm49248266b.48.2026.10.21.00.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:58:44 -0700 (PDT)
Message-ID: <ec32a20d-bced-41a2-8993-6bafbfb63159@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:58:41 +0200
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
Subject: Re: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad870b6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=W3aFgimVbiLOBcthf_4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: i6d0bKa6224AvLmLcaW3biLavkJdzN43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXxiAKj2RZVcSA
 hqA5lgkGE/tR0GWi4Yf7ddA32kMhWeoBCqbYsT2kQUZf2QgiW2AO0TKS1hzpz81eY9e7DOhqBdK
 MMmsca2Bfq1d4YmuOBSzZ1rGB4mtZ1f/WSjXVlZlzV4Llj/Kfa1Clo2MlU9LpBilbn+gj/gLjwE
 yzADf3a+7cSUvxO76VlEqWb3MnrBi6/pi/VcOV9g5Z+ipXeovFKHn60r76/lZ81vAgH1mNQopq5
 OyXSI+u/pEyFjg9/3ASpqshs5KcBn8cAXjPPhVYLj2eyLnLOIvTtBLNqduW5bhQnRI2UmHhpo8C
 0lmpSkvQ77LlcSHfBRjva7tjJRKyO1WjRnmUTNs4UvxvGkALCRkZOVe95LwEB9eSMTW/YQc6fYv
 7k539qMHQiz3kXCCMQrErbwuXOage8aNE3/v15tLbS2wQo7fb0RRfF/gR9/pWMXvIbR0NQ59wzB
 VUOSQFNoglMadKGVaoA==
X-Proofpoint-GUID: i6d0bKa6224AvLmLcaW3biLavkJdzN43
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX0QNj08P8ALGw
 usJSh12tUo4Uzym1kt9JNQ51KHsKEOObm3C5F217w2o7l0Bl5oIUNYAbh3XuiGh6DDuvr8N7e3y
 pPOlYN4LOxeuFhpB6yowGREEyJujANw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On 10/20/26 10:45 PM, Jorge Ramirez-Ortiz wrote:
> A PAS ID of 0 does not identify the iris peripheral, so the
> remote-state update never reached it. Pass IRIS_PAS_ID, as every
> other PAS call in this file does.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
