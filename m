Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664351;
	b=kfn4Ck/D9e8HRyocaVseKfWd3xm9thNWF+QZSXC0sLEFTEa6ZZ99fgCL5ERPHIYCFThl
	 AfJuldtTS80L3HCXwCvJ0SdK2APgGQwk1FSxqxPntGXoKQsxQWrb7FPmuspM4PBqcX83u
	 sCw9iW1xHeaA6bvsWtTCMK6obBcoEAGF13LivKSq0cOVYgduzxnZBWcXtUHWenrR85Qvq
	 MMGWd3ADimiJSoC6Pm2noKsrUKDZsNFVNLL9IR8z4jnS4cwI8NcawXTnWsyLJc0x2DaQJ
	 p7e+5LSxFxSiJ+E8PFlJrZX21evIrtxUwTk2k2UaJH1DhdCPSSpXmzKJTJVJgPFXlMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
	b=t2uiem6thDbwXbnLfdt1IpoFSM2Pu8TWPhOwxbRTW4qp+yyTea6oyozsEnS9URNZSgfV
	 gtBUpCShtKEG3PZqzp5oSK2qHpjOb+R9fqMGYJlq5EJKH+BX7Rppz5GL03MOfq0G1uX+E
	 bqCcxWv2y9ZTRsD0rET0j5ZWECNGokSg7bZkejOtuFmOXN9M7fW79wwAjW56H/8+ANwns
	 Iw7OpjjZdA27kQDgdj6eAawVYU83AsvDrbquOR4RwDHml81czfzQedRGJpZpeLv40I1s5
	 4afDRC1Qun9KqD/gs2dnIvReQiz/uOwQkxGUpL/ahTKD6IUBGLh0Do2Bw10kV4GjZWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTqPv4mg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeJWzvv6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F90606A32A
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 03:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F90606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTqPv4mg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeJWzvv6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36fY1170293
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 03:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=; b=fTqPv4mge0M+6zzG
	qngl6WCXjIHyaudlNy2Naa6s4hHhbVkmTkgbAJ33kmEX0Arwc6gdNHTwJX0+J5wJ
	3vHLloD///qDRtTUquvRDXJvMs1FDEKz049ZYd20cFl0CpJIBauKgXbTW3Ey1On2
	207yFO0QCmcKyPKAm1lMmYhVIUqIc9j0VQxQvjeM/Hd67s5doGkgULtgtTger/mA
	CAGaQ4OyyaQ5sipNwBQhXYt9OPypgrmH+LrURECwE4qoNNqd/sZXIoPb2ZBOzfqd
	6v+pNDjgpqUivD4Y9X7W87ALaoF+GDpru3rLpW2tlrzgOj5iZGknDJZLEQr7ysHs
	sfEnuA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukusf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 03:39:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386ad819860so3315623eec.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795664349; x=1796269149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
        b=FeJWzvv6urYxZHM0K9+fweIo22z1+Fqv/xtKKn5jl39wDlXHMg/C+1+UMykN5jAMZE
         iOF2TX1fc5vRB4oxrwfafmn6RT94QS/rbJgE2aEm7CTYAhFWLdOJjNgJBZrRCc5cLz40
         wFsTx5CYfakxuGK4k0n2OU6G1POytMaM2DvfDgXZJhQ31reyPlcECEuGHXM6/T0VFHiJ
         z9KMPK0BisyYBgMpvYYVUp3/6qcCoBV7bnSlrBkDRLS79vipqrXJblrqWwx1TB+m/ZSh
         cYkNFG4EzUwVT2Fj5YHV4in1RlKA8jGOQx+whIaTyEtNFkpwcxze5sdYMleHAXWi73HA
         LYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795664349; x=1796269149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
        b=TO3x0mlCZUO9zRGdCivT88nLZjReXao4/uSsgdOKevLNAJqeTc9bYZrqy96UBONvd4
         rlMNWUtnO/bwWLacdZFEno4F6+8epxtwZ3xg0JBqejdS70QJs0LNbvi/1K0SWAk5cU3U
         g0gAPjgVAwb3075Cy9zqG5TPNkpp9RzpcNx9XkL39ZIjmj9nkrc6pRUSxycH5tysJPir
         qjRKLGHZKDW3puJIuhfYMBTPgPFV9DynUFcGiT/iRxWMZ9o0H1sydngtDOFlV/cxMSHF
         5frhXyg9Z2Iu7Mm+JIsuQbn8tasRpR6Cz83buDXrFbHVlhhvrcTo9D3qrDDjqFdUVaIC
         MhEg==
X-Gm-Message-State: APuU4Z/c2xxCWM+OmXYbwssA4f4m0G4qfkZntPCvwiIxDvMLSfD+LtqN
	KrRgRd7LeVH72HugfY0+4e/WLtpzqwQtDsZfmAuO0Wci31gRai8Q4ala+DnKETAaGCyVw5jtYHB
	q0Tu0g/epx+DgN/Oy/RXBGGBuvA9y04h770xO22VAJno0dNBkxoIg6ewf/lIVKVPCdL3JMv9vtg
	==
X-Gm-Gg: AZFdTZc/SV4aCS2ArbRNFXl/I9EFOuNQs3Yp3rGz5dAdFSpwYp+yP0Vu38Z8t7OJV+p
	K8rcBDyk33WGaJ4ur/lgWr/zZYRlG4m2HeKcnkmjCvPlW885zEeZtRngTrlxXpf8s1NM3D8T8T7
	2S/bgwzh231gaFwhJ8/pgkeOi9fNnld1kwdzL45i4VsFtsRdzd5Cm7BROqJUFUvMDOkKh7F0f03
	5DsIBiio8RIQ5gnUkxBsr1pCZsmVFj32Keuh4FskwsnVkOIHOHQlWAe6bBQIv0wHgyXAIEDwL9V
	OrUkf+/35+kJseytLjyHkQuKZBPYP6L6YubGvNrSx4rs14oo8kK0HcV3mQSHkEG+rBHKzQhrk1q
	ktbVLeYMKCJgPrgs7kMf0kMYHvMmRITSkagObZ3ImMIy6YCNBGIY1sJiOiaAHWytqZCcSJBDpzg
	4Ix+dK
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr12744966eec.11.1795664348600;
        Wed, 25 Nov 2026 19:39:08 -0800 (PST)
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr12744935eec.11.1795664347990;
        Wed, 25 Nov 2026 19:39:07 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm49729022eec.19.2026.11.25.19.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 19:39:06 -0800 (PST)
Message-ID: <3c7382f6-8665-1632-acf0-b380aa8c5aeb@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:09:01 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b07a9dd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RiDGyf5vU9R3Kc8e4UgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: YhtZaLf10WeQ4wsc8SZDNj-X0GIYm4tf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxMyBTYWx0ZWRfXxe9QVupbL3qq
 TIG9snorc8hmTSaw8QVpM8cMekDejYCBNveACL+9sQJHnsXyACBcVnrH5YQSrQ0dWo2FF1A1Jkn
 QXe3jFeG7P+RYDTWEpyszOu/si/5qxs=
X-Proofpoint-GUID: YhtZaLf10WeQ4wsc8SZDNj-X0GIYm4tf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxMyBTYWx0ZWRfX++BQzg++u9hq
 815jVt1oxA6+4PVxXo3n9dVOrq9P2mrLRC4+wWFkvCmDclpi4AOhXPC6H25n5XXp9cb35uUbHtY
 3Sk/gBjLn3BuD6r6gczfkNMHiNP3kkIxN93Bmfc4kOKCC0Di4NeQ4dcoGyQc+SM8HuQ47dOsPmD
 T3z0LZjheedfwCVggfKVoOGRkMMqv7AGFksHSRH7TsOA4yeMkCo+lWq6j5TNg8JpEVFKvZyjYOK
 CkLnOF+v4v1K2BnYwcr//v91iCozlx3GZhXiUUGVUn9GRc/Gvqp2++j1knjd6Iea0TSjTdq/tlT
 OKgF5Lp/yobuj40lOvMCWO7U6HTGsbXbYazx0WD4juqmWk9Rao2fNeUa4/ed65d1XARJPqE6uSk
 62OAzpltdv7aasZXT9+Ldgd9AcqA4bjcO8cMWI8vVy0b83u4Z+l96pe0xpkDWEcjb2NbqhVoT2L
 eY5SfpJi7zwe9b4ZRYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260013


On 10/21/2026 2:15 AM, Jorge Ramirez-Ortiz wrote:
> A PAS ID of 0 does not identify the iris peripheral, so the
> remote-state update never reached it. Pass IRIS_PAS_ID, as every
> other PAS call in this file does.
>
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21cdf1c39835..6ff5eefff391 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -195,5 +195,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

