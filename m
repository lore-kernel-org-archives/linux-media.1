Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4A3B0ACC
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 04:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313761; cv=none; b=q+Jwaq96JfdMBSGmENypKrouaqQ3pRH2trMlWHFepmJzpmxxFYlx5Iy7gfFe7LVf60TicdcPyYsh3wSfSnHBUxfQYNFe5IzlMdZzJNCsbF8tpk6zm2YBN31EXGREaeX6Zpz16Fiy1wqbc6K13h5KH+esPIt8zAviDUZJBLBD2YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313761; c=relaxed/simple;
	bh=YmgsfoXmP3wicea3p38VOglMuty4QAN7Ko28KEOX1Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nR5Rmq/DXzd2vdvt5H8Qbk2HKNk9a26O48Gyz7PpKZZn/QZpzxYIuIf+GIiUcTQ/U2qF98PG2ZRVevgmFzGStvDT0xiSlN3n263s8kAxXqq+D0G4sJcw7q/VoftjTaWTFn6y61kFnw2QnBWxhJHNnkZlsV8hSVzc0ihYN7srMGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtuYZphI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3Jr5zap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtuYZphI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3Jr5zap"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641ZDV3614034
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 04:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvmf0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380c178acfbso2125497a91.1
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313756; x=1783918556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=Z3Jr5zap9lUWE5NcKmoo9cq4VyYd8OfMJGVQ6b4AKiCEBOMaj87jG60tHh+PoJe8zn
         Nx8ZhE9BKLjIcVtnjd3NzKx5w1mutKKi3zTqyOYyg8ICK2g1jmoefVbycgr3tmk9H52N
         kXxEAYauB1ur/Gpn1QujPW4nmKf8HSlqLi2eYH0Gypm76IOueG94Oj57ecdMJqSBmwjO
         qx3Kf+rydvZdq4PIXZqotXQc7paiAki1F1wUbnFuaUEYZS5b6RS5letdZKyVFgu5RA9Y
         FV8jSmCzURwxVusAJCv4/HNWsKhhgQjNktQG3QrTiH0PV1JuPBsAg8/ZazyRiFkh9NoQ
         dAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313756; x=1783918556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=cZ+gC7i3bdlxdSr9h3O0zegDHa7KcgVHsCSXQjo1akTZ2fzGO7+U7vN4vXyarUM4n2
         Sm6n7UBZtX3flxt90+LbfeJaTZl878n+bLre1T1OpCAZz3ay9ZQKqFxdjqaiQuLIG+FA
         TQdW+7o8OpwWaBp9KIKB+lNNnzzoZrD+dg0KjliWT0OrbEoc5AG6Rn308XRmBJze5ENJ
         CD/Zd+WFxk04kzLaeKSlkYUY1YbRUyHnKJ3CR4Tguek7GXfuappf1VoIpQqgQPWvRLkc
         dTzbEcgZ+MUQ1S44YlHIId5p4HeG8O5ue6aMViqkcWpVW4mQKmLA+X1mq8aIrQJZq+ek
         mOfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJ81SrwVZa0ENC3EJ3kDl0WPRSbV3oX6X0YRxNoXqOeggKSBfkM6FrELKxbTBeHRjSpThHWIll1CEDnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOK/OtTqyAlAwxWIx+thyJiDIcEBIEt8dQ9yfeygkrad3ZmwCI
	l2QcLT7FJjzPH0ftQQZ3Ajfd/ZG2PF8FDnTeK4TgMlXQHn3Ks2VwoECN1xbdv2FVv0MqFp8sxGf
	YFWtO1K5ixsJOl5kHZV/ED4vmsbnSZok1vHfdSZHVD0iRKB3JC9YkZNwYoownAuvw5Q==
X-Gm-Gg: AfdE7clH28bXf9KYldGHM+wLSyURg+MFPQTviPBXY53qjAtSO/f4hkouBhSQVzTu5g2
	BxXfnpb0x+W7fu669okkqJKr/AM6+EMjJqaBlBxarMQA2zH2P85LcxS83j67eY5BVDiQSEskge/
	kWEdKHLXJSKqyU9PzJg914NCigTs1IqtFuyjYLhX6t1kv7SKtcHe2UFXkBVcWdtuNtSQSCFTAaL
	wSuZZC5PYx5suSY2zgTty2iosds07Yk800mz1nXCGLrdqzvT+Q4gGJNS1w/lSFZxUiBblJoJDPc
	DMmoFxv3/aw6Y8Zp/kSLX1AKmvuFzazIfvBxR2TDInDLUnP6RZsL2zE2EPOcR2Qay1ED6uDEZ9G
	XXa3M8OD8Sn4fCGNmpd5A2w8TYLyVwnz9iX5eCN+g
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328708a91.4.1783313756484;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: FRQAfWnrKn3QucEGppM_5UY-DCB15BPQ
X-Proofpoint-GUID: FRQAfWnrKn3QucEGppM_5UY-DCB15BPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX6S0n9tnVg3rU
 2Qy9dWxCdRaZr3k6TKGt4f4KyBZXcCeCKfeE5Zf5oyKXr7VAwy1ADPRX2oQ/DNtxEORPWSLBLrf
 5pGz1fA6jkzAyrR3YJcS8qQ2mwdsc440tQfT5rg5C98luFPeUZg4jCP2/xj5i9WWimWACldJhaR
 TgfL0owxaM191/K3LH+cLEAzFBECLqztQTOvaxxIe4zPtPfmLfn27EF8kOChvHu8b1TQB7EFhbC
 zqpd8S0Lg03Rt1do/ydRupfkIlgvoCO3M//J4B/0jo54YtFAFp9f0Z0kttMOEocnQylE8Ngb20q
 pY5cOORsP7J+Rdr2y4+wZm/BHQfHnHIm+M6LZs0aZf/u774VEzYcqBfPs+s0md9yp95vyWrttwN
 vFk1PfPTAbdBLlctSBDxs7HH8weMf8bOClGaCmxS0JRnsLEGZzxsGzuwg3jBCpKPRMCJW/20xj6
 90e7FoBNMmb3kVkHWKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX8uf/YnPd9q23
 z/WMU4UCvpodmtoDjoc6a9Ku91LnZ+AGHXA+/jklhpP1vqxbltdElhXOqww/mbvMzVL5GcdcWWV
 u7WF+8Eexmwr1K41sL3uE2mDA/pX9jg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,

