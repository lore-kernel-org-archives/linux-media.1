Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782595;
	b=t8OU4YjXdY968d081bBO1PF9Zl2GMEgorSzp0/RSEccwUsF28HV/QWAzdWUm2G7hfMJ+
	 t+bcmTNToGF2GvaaK5cT2UcwogPJMxxrmt3RpoZdsu7g5tpVrG0LvkUlhg2TmVGkdYEs1
	 zMn/KU9v/qL0x28HElzZTrTN0k8ocGGcX5yUhmCijuxBs+Q57cfYwwt1i0LPskm2Aq4Vp
	 KSOWUSLAwRvGxB3whf+PE/Z/Se1jz5H8nWxmP8PU+LG6ImbG9Gx2R1fUTpDTe1FKqwIas
	 XCAjRNiqvsN4TQ0g3u0V0/gH6BwTFyqL/lahkV/6RGArqSlHkYsq+kpubINRKUnMw4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
	b=VBJgp8NFUd8kdZuOkfGXTTH3rd+oq7yuHeUrS3dS1EJ3xV8rgR7fZZL5KV0frv5bQyCC
	 emXoaOtEhzoiur2//1e1zA1f5BoEDSsUDu4FhGqxiG/PtFl5Sl3rod8l5iC83ZFLx4DG7
	 UwA6cRn9BluyCUzhln7BoRuJd/sU08Krb1fjiemBp0GHQeHNz9P5hFZ4TOPDPljPebTSl
	 6OZ3+KfOBo+ms63YXGchVeQec111WErHTpw4ExXHhk1EY+YnvMu15emlML8E5qMc9IZ9q
	 Qkc47VmswqZp5U+jq6OHUBJdYWBLwem3qRPXoVFAODnwF50Yx6Z34Jk9koClQ1YMraw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn+9XV1y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EppFsVea;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6017606A326
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6017606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn+9XV1y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EppFsVea
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApBkk1377008
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=; b=Kn+9XV1yfjnhjYAM
	m5dYVj+P/eXoYNTYmNSJH1qNZWewfhkm0SM3xTcVKOtag+RrHL9id8l3DRyn8Q7O
	2ONwELDprTsYla/i9ui+1TVLcWQFbzjO3C68qFgbHOcXBUhdy0SBMATrvTZUSCat
	CTaF3by6QkmdyMSPq6b0f9hJL5lUDTgvcJODsXNUuGaL/iDqEjdFjI4l4mnwK2nm
	92kOtxtb+2P48G7jk4CXiEccoPlQVaiXwduyk4wLe6LabqRTFVIaEid4GDF/WSSI
	eXPRh0CAwhZI5q+LuVJtNKN5rM5P7CZuyrTI8MTdLChjDt0Rv9YbLG0a138evwZC
	Zp0qIQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3agtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:29:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so4094085eec.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782593; x=1796387393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
        b=EppFsVeaV6N0nyrh8SmbFWlD92Twq6ri8bcseH1Hw0ClUXbUdIDXnx/zhICNljjxhn
         IA21YypzKDFON5Zp6zfX1ouDiQ8pqNO6Hjtf2vbYPTmDOjnuxThEJ45u2JtaSqxlhd7C
         dS/VtGZI5KK93maBCqh9fWx8UNk/y0XK/EUhg7wP6bBPFQlAYglAenmT08JEqbzPXYT7
         cKkpvwBDM3g1rlqRU9sosv93CovAQd86dJdaaG2npd12uSl2HE4snBQzawPdmeerHNCa
         xLX96uvF5pNFchbYqxa0A8KL88t/2g+ZmoN17EG+7HrocVlGY6FkOqYxC6WuAyntVF/S
         k51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782593; x=1796387393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
        b=jkkThsqnR9LxKb1/kHRnk4ljpXaXhGW+ZV2MVag3ZPOuPcBuQ9ddUy68jCxeRcaglO
         CSfoVqk+LAbQFCQeBRiKC7ZiSVaTwNVN4cl1flQ1q5UBzAPogJBnwMhwgyK1Vs3yGz8k
         sfXWhrt23zLsdq+iPLslkfJ4OXUvFuD6VUPyIDRFT70TWYSe0Wfn8CwDxXmLzHMg34L4
         joTgh1+U2sj3xjkoCQhUab/6ffIzKpKQzynoY7xvSTYk8BvIBkbNR5q35BZfeYzUsoyh
         nwdryFVwrdtoqGXCHLVo532JxnxCvzFgFtrfGS+ii/bUk5ryaRJZH7x3rbxW19dQFnXw
         0BqQ==
X-Gm-Message-State: APuU4Z95RtyLfQyHZ4EQdqKBy2jw/jnDYJbyl9twgaepv5kAzNmTl/fO
	M/Yw+NXrR83BzpPxUPtQZK8YYSQj7d2vhD2EzBZo+DvDCkpO2A38s/OEF8RUKhAHJa6XtnGE5/A
	fGCUh/tK84YXZ0IYk1UWALI+A2RcKn7E5Uus++ckIcswcRWkEs2h2/9F8VLR7AiLQtg==
X-Gm-Gg: AZFdTZevfRXYmIKoPFHQofe/MA7nkwMGgfOMG+k2rcnkFjnFqmE44ErNdjTJnpLaaGC
	QX8r2yVU9pGqcrd7BzQb/KObdUNZTKh3uYpkgPnftqxI974oRxgJPgYnuWfEfBvY6tuyrKPMloV
	aUjsC4k5Csq7HiDBuJrrLDKYG/ZCcmVj8fy2BQblQcOB/quWD9QcsbkqR+kZBBf3pzSYko9kjFQ
	gwPT/2sA6tSPHzv/tT3XrCqswX5ksO8B7dynT5SOISVdFZmB4Ab6vtlfz/S2/njSCtNvTmbhrQc
	SC7rCE/Co5ECYw4kBeKmlL357vwF2z4GeqML75OdHpBgBVOGj92ykTz+rTGGEN8PG88v/FbZduD
	durMDFPsRJF3ZsLdR5E2TdnpvH97R49Sx5u98MtsHn7wTcTEIQDe5+6aOAw8AA9Ys0iA++QJrpp
	M04YQ8/Q==
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr31457719eec.6.1795782593296;
        Fri, 27 Nov 2026 04:29:53 -0800 (PST)
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr31457692eec.6.1795782592750;
        Fri, 27 Nov 2026 04:29:52 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm60695792eec.25.2026.11.27.04.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:29:52 -0800 (PST)
Message-ID: <042b79ad-6036-43de-8157-752db5d7734b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:59:46 +0530
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
Subject: Re: [PATCH v3 4/4] media: iris: Wake up blocked clients when the
 driver is removed
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
 <20261119-iris-handle-unbind-v3-4-52d467a13907@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-4-52d467a13907@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b0977c1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oO3DLwcLetx5d5aH5KEA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 6rpb65TSu7Q-IY8nkPddbXJWJUsdgjfH
X-Proofpoint-ORIG-GUID: 6rpb65TSu7Q-IY8nkPddbXJWJUsdgjfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX+zWS8bL7dSy9
 6a9Ziw83usWixeInflDX+RYJs4x17SNNJH50OhgAzpkLhU/1f8YPcJEtwWH4JaYo8YT8i+SRpK8
 jWQ3c0LdYqltvRdIlu3vb72PVC3ACIQ4XT3JsmmhYHj9eicUxKUgCjfxsNdk42QEJBtpL9XHP+I
 nEmqBE++mL1QQf6+mQjjHa8fZ3S7I+7SG0J4ZRfEA3bEbk2TC3MqS8ZXc613d845ZNWEKCBUzRT
 yXhhivQXX4WcwMoZLPW2KOttiDcg1TcZ8bu1K1udfgUNsiQjwK0l1+zFS1kHPvvKuSiqABcqoxf
 0dKsqOdcufPH3QXtQRd5DqIT2is4p1VTr9QuwE7t1eP0QVJ/UJN/L3uzwv5jGqVKrbn2L8jm3B9
 P7ZP2R9ermqknzC/QqZBQWKPu5qWum3SAezGZaXQdXGCh+StjAhTMLP5ZRDiqMMhaMJoKXNBLAo
 8WHCc4bEZBEbMY9QV0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfXxT6uVYIjiEQK
 aybVfhoqheIAnOcJSUi1Tm5P8TcsMLOft9ZodsSVa9RSaqCqCuV91qjLH+3bL3LvrVMAQE9Txmq
 H/VWbOafA043KsQ5DpQW/UA8zf67wq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049


On 11/19/2026 5:15 PM, Vishnu Reddy wrote:
> iris_remove() does not wake up a client that is blocked in
> VIDIOC_DQBUF or poll() on an open session. The client stays blocked and
> keeps its file descriptor open.
> 
> Flag the vb2 queues of all open instances as errored after the core is
> shut down. This wakes up the blocked clients, which fail with an error
> and can close the file descriptor. Skip the instances that are already
> closing, as iris_close() releases their queues.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
>   drivers/media/platform/qcom/iris/iris_probe.c    | 16 ++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vidc.c     |  5 +++++
>   3 files changed, 23 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

