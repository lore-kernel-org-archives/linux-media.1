Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489810;
	b=rURQCqbFwmuRBXDZwIHiTNUY9Ot5vLTLZJDaZx7hJDRRo1USnBoByKWhADiI8p3Q/fhr
	 Z9dmWG97TLVKxlhSXO2E1FHpFMU29/9XhtEV4Drj2U7xOqXQ/KKeb7Ugmr4ToITuPDixM
	 3Bp2nYytPV1wvCpfJO8kLlm0bkG4EyNBiA1cuGbuQPCodG850F7Ebrkm2cBRvLFeHOWaT
	 JeS7NeLl/rfZxqC3B4hcWPYu8do5NFqacKpkGj5vvA7tA51Cb9uwD8gHjE8EsH3UwBIXY
	 hQ6aZLc6qHDKViLZG6toe4eLiCD2bvN+bDsEQNVQej0rv4SmjkYYHy337k/dU7jvASg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
	b=CQI57TEIiYHdYPmpxrt7PwncX3bvFIa5luziNnU7Hf7geOwd/hljMGQW6KOqLhk7kzOW
	 Dy6HOdHIwTC0SEK16yxg1+vr5CAovW+vlWbBpS0SowNwYne1+HyTb8BS2QdEdqaFX2pJq
	 6gRsYcFVFdf/SXS2rEbpBI9yvIeHPTjV1CGTTcrbkK74uhOF8MpZVyxCfSuWBliPK9Nf2
	 v7ytIZppbRWZ4glNoZosBXpO85lwGzOZMLFwebXEGPfU9Ds8jeJ5Ia2nzkOZxIdtwo7ou
	 rUIDRwn3eylcl6nbV1kSdzZdMnHqNE5GptD4N2wDaADAhR+QO1RERP5QSqOBgbLnLRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgA7F8vZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxha15Ko;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D551606A32D
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D551606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgA7F8vZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxha15Ko
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2ldGk1598155
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=; b=SgA7F8vZYCl2eqhk
	Scqa9m7Y0kpz3s40wNs+bogYGfHThXyha2bNQyEtkVMHWn/0n/DTLJsdWVdAY4Bo
	Rq/WqAamOTw8+2Vq1eS9ARL7XXIsfEiIGk2o0eMQ1mGDqca70DLOtO8s/4Q/oAft
	48RYZyyTprsBFNKz6euynZEp66X7iOAuYnHO+V9CW8dAVoUrbYZtZwqMy1jycfLh
	Y/W7Ar3N2uGbJYPCFifapmjIiBeLdqLOXbz0w+gm0r0MGC01mUPPSlpKN6yqm6OV
	hf50Zb4DRqOBCLKvgL0qMcvqutPcA/AsMi1H56yrWUOQB5Ztv28A/HR137/tfH2c
	k9kCHQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqhere-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:10:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so4453748eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 19:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489808; x=1796094608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
        b=bxha15KovaW9h5pv4at8q6iqDyGmb3/N5WC7A20k8Z127RD7v5VGaLgApvhPV/U+M5
         bKadqMvSffGSWSz/psegRwkEK9R5mosT5DS0mXv19A5eAOsjJcHvgAb/QOK/XLxwANAg
         z/Qg9d69Fg46JuHmkCp2JMFrNpmnh+dnKq0sYOCt/gpu4sUKRRGyqzspUcr5VuoYRCRF
         8KQ2HFJo+ZKmtl6wmyjSh0Zh/R6bY3nlzfcAwfwcuAsJJhRd5hcGV4E9qfiW5IYktnK9
         wjevLybuEUK1mTvQ8tcLoJ50MmA6we9PJIzUzRnX34+VSwrmechCFpVmm3M6hm5MzkPE
         p1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489808; x=1796094608;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
        b=CbV7IGwHBjP0G/Eo8rHLtWFsnFLLegfrlo49aZa+qnx1ppIgiFBdc9ge5Qd3yhTsLs
         2BzdwJjTbNr+beHPxOIYWZe8JIoD0O4gXQMg0U4rWrU5HQroj73ymsjQNNHN2tp+hbMf
         QT7lHE8wWnQdlOsqSJQbkuIk8Fj0ju3/Swmvfd8NRSEzMlR6jIq78DKc9bOGLKv1uvoJ
         V5jVim1XUj/zuvGHTkrD3Ko+lo2lo7jmNmeGGmq4jSTQaZFPGi1/LiQbeDX2uk8fSs4P
         dDqv2tyTqh9u4ex4IAKSjh6ieMlsiTJJiaCSxEQsuIV6TaZLpWvsGgZZXmp/cEXwYtHe
         Vj1A==
X-Forwarded-Encrypted: i=1; AL+hErGPDGTaBnmjurbusQB45uo7Jd2p+nd6/xb8uE3cudtj1MSam7VeMxrkOdweDoDfwcMx/rV0JnPSatmpfQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8N6CSU1/mQ/FVT7XGFzTgx+pYaSyl+QTfOQpzvqb87b6arCyCx
	nLtllarvrBgA8qceMyeWgLPQVMeYixw3UWA/X9DJVp5djgpoac9RV7daok2YCL6TWIkXUnUAYEX
	wioiFCHJUacQkuDQQxZpnmydv+brdoozo9b1K34lWSJ84RIZ8Zz2QrgCY6jH5nuJXuA==
X-Gm-Gg: AZFdTZfR915NLKxoFgYOtf/9DgGPIwbs8h7NelOUQNVPbElBV9byGKS/+kVlIoIF8BZ
	g2YA0uRO/r9SQcWok55dDesNWanDPRme2/CMMqEk2PWU5bcjbUO4+9eH03+IxgthLs9HmDBm42S
	NjlM6geoG3AvmDq7ZaQuYV+31o56l83qOjCJW21UQj31aIP+8prmRQgNbB2zWO021rVNmBqaHgN
	sgpxk47iF+/ok0iDcLQGx76hZfdCLwlyHNT84v/5XNH57bT0B2+BE/8/tnrIgn6KOqF7CtoY45L
	795oXeLpgQsu1q6t4Qa4bLXrdANH/l7zzrvC7KIz+MGhp97MbwNFzVUsJ2jm0zAiVViB+PQYCaZ
	oUaA1R/lY5FTC61xMT9wu+Gc2Jm45Wl9HM3J0AxNH5U8tiQDKxXVOuIc3OdZ9t4bieah3fqio69
	pXUQzZcA==
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id 5a478bee46e88-386668523cfmr12340356eec.12.1795489808113;
        Mon, 23 Nov 2026 19:10:08 -0800 (PST)
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id 5a478bee46e88-386668523cfmr12340327eec.12.1795489807624;
        Mon, 23 Nov 2026 19:10:07 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm36076974eec.2.2026.11.23.19.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:10:06 -0800 (PST)
Message-ID: <bdddf7b3-76d0-a8e5-2c9a-c23953e6b97d@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:40:00 +0530
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
Subject: Re: [PATCH 1/3] media: iris: Skip redundant decoder input config
 params
Content-Language: en-US
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
 <20261031-fix_dec_seek-v1-1-cfedf0c267ee@oss.qualcomm.com>
 <179492375803.2846709.17266637550647614190.b4-reply@b4>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <179492375803.2846709.17266637550647614190.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b050011 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=RZcGvm1UZh7VgU8MZDwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX3kswt6ZR0YBZ
 0GV1pX1Cg0E5/BWxDbGZ3xY5Jig0ZsT8PjNStc3Xa6LAgHqRaivGFWh2fZ9A0bN0ZOUwVMHB0Bn
 eenccGj/bzr2R/yFu0OLhmNEWVLCxJSsu9PkNlFPb6UIApb5HjOILcLLDceDCqEBTEeeJSJkk3K
 Gmt7p+PJ5lg41yzuhLediTMzHRprqiskvd4JMATqO7CmALUiuhdy2nYayBmmmJR9LqL2VuEJN7Z
 bJ+rmUqqPITI946C209dU5g4ohBhioOeSW/vxjc5q2UzYufLU4T4kAyrM7cknwb01Cbhu2pZBoT
 ZuP3r+FR5spzsjn3IbuoJeyWol+rCw7X21AE9zvvN7PpZIk1kDHaB7kenDvKfs/WNppwalbdnIb
 IBKMOomDfT6ZaQHmSq92JEjzsW3jZwxWrcMNpPlcMEehI+n0z2H6oH3tim/QDY39VsC5z8iSXhT
 RVpOdzzn9LIgcPkaZVA==
X-Proofpoint-GUID: v3UadZgLiwFrW0FT4oFzfGihcuv4dpj1
X-Proofpoint-ORIG-GUID: v3UadZgLiwFrW0FT4oFzfGihcuv4dpj1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfXybWdQ9tdFFPw
 N5fF3cF1FdwQua/81qr9ME+9OBWYFHIYKWp6UPF7HdOzET56llUvHm3GueuUkFfdIzYbOSw64rg
 /Xsme8ihiHfjBP/9wjmx4m4XNGbvt5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011


On 11/17/2026 7:25 PM, bod@kernel.org wrote:
> On 2026-10-31 01:49 +0530, Vishnu Reddy wrote:
>> The decoder input configuration parameters are sent to the firmware every
>> time the output plane is streamed on. This includes streamon after a seek.
>> Resending these parameters generates a port settings change (PSC) event
>> even when the input configuration has not changed. The client then
>> receives a redundant resolution change notification on every seek. A seek
>> hang was observed when redundant PSC events were generated for the same
>> configuration.
> Its not clear reading the git log here where that hang occurs. Userspace,
> kernel, firmware ? I think you should specify that.

Ack, the hang is in userspace. Will update the commit description.

> ---
> bod
>
>
