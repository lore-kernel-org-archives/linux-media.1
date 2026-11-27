Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783115;
	b=XhbM9CdqY/rYv298I4OnuqBM57BXfkobzYzxQy4gnAchjQYM9UvH3HBfrG6Ie6z3+M5T
	 tyDPYH6JOT+ScPcY9/HeJe5yHna0MaJbRkTU3HPwr0/ofljNSaqEQM53RdbdVwCwHRYc2
	 LltMpf33rmWyEk2zw+CwdqxBQTpap2jiqbpe/gwXdN1ZXpPU81aHNjUIbGzOQu63wkIPG
	 buYE9iBp0HqLVacKW6LUunj1E++x6v0GL4CfYZgGD+DaICT6+5NPrxfbautLOW1KbPaHf
	 MfCobRh+FjtsOILgqsmam2Jz5sJ/a9YY6DC3xhwsIjWQZjRLz8EQyWpzNiOYufRqcKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
	b=XJ2Xz1Ir1cCnp4ticvZLuvKaDlAcU1G2o6Hk1zHo3LDxLAGJGnth+D3yEwjU8fHbTx3r
	 gpoDhLf33sFuCJ0UnrWFrnrYh2Q3HkeLxZTdKp0NwRCKkuWE76HTXOdxTC3Iz8IbvKrCI
	 iL9drcP5qrASOnRYU5ccEotY4rsJAkrzOp+2dHALqVfAq3zRdnvg/QZWMxQsGJufyVDuu
	 2ywCBMWhhE8JEyqfNimLCnSO+aaDuo9jTvw70Zy9KaBHOLe6jooElBWm8tnwjRlhlYCP6
	 S99jjUZk42e4UftBzZ9O9PVdNdm1CMA25w1RRy3x4gBbsergiF9PDLPrmApyAsqlyew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OsVD7nYe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K7oTcFTg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CAC606A31F
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CAC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OsVD7nYe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K7oTcFTg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApAIP2906439
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=; b=OsVD7nYemQhekW+f
	MgqDMfW6xtVAqohPNaln/mjk0f598jSdZ3jjOLaW912eROmGX8PQz5nJXPGZey9w
	l5B3qubGjlPmYQrNzOwF1gbwa0casEQjd+DYCODHkpz7FLDqX+DDcrDdtOnUzFxF
	inYM9cv391V7CHSyJxl1nJrmwADZiR6SPcgVXAybDl0MAy5xmObe5I2eOeplFNsd
	m9WM8zkFpJoG8GzwTPd4w5gs84DQPJraEqYP0QiGWnCtIbyhP25NykOV1KlinxsI
	gVGCqMquxW4xtaH8eB7Ky8HP+4w2zOSXjuPlLavcdkkqhM+xv7X8SgzV9GLGnzIn
	+ym14w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93h7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:38:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso10107318eec.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783113; x=1796387913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
        b=K7oTcFTgsrOKKNvyzFPX6UYCSKWWB7QEPTfnuYn7drrq9d5q6TNIwZ905xZrumFLD3
         yhANAtknJcKw5/SPwfIoAXJVtUoyasynNDMNXa2bOiO9vFHFcLZYZj6Oh6lZxOVjprpl
         R/DyvJDAn2D2KntHlj/dSjwZ1LYGZjTxcxI6XQQ0KH34Xu0L/LJzBYhqFDmtalqWOd7o
         wFIMYlQqXFiJ/8tZxVUZPeB/Bi6ZBtW1hwK3bTAsIvj8K1CI5GbEVZ4n0FzUsWjURBZK
         lc8VNtOA89TDj9YVWM4Ga0EnB58z9C2xn/ZLb6g1gJU4kfNjnf8jje67siyPoU1MsgfK
         zfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783113; x=1796387913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
        b=iSewJKr0xer1t2QjkuzTpDXFCQKQeSvIuC/cYRY9Y0miB/F+LVCQ7GWj+E5yaqU+70
         BVmHRzf4sCaXXk9BcXAANm4vMSq4OeAY6SfNMJqtj1KaXHKYHXgZbWQTxcVwTzj6dzFH
         Vvhpr0d5vBm2BzhrNOtF6q8GUGxmcXhA5BxSMhVWRlfzWa414tzL4TyXtpwrH9AGia8q
         r9UYhotI+0RStDZ486rb4Gh0JK6NGjq0HFb7/4bnCMhu7Dwk5Xp/I/u6RNYKA1umRrq8
         yaEck5niZNdMJDkzN+TVX0HaSGhxex7UPMZ4c/81/VbIt+/0YVREHEjxvhu0qYG8AAuq
         5I/g==
X-Gm-Message-State: APuU4Z8VUAHOiZI16OK8cwm5i20kFsq16y5xdZ9zWSgMWdQV1SDrNTVV
	9DfI0qs1kJGIxm3deIa2ncPvZx884qylXbHadH2D2egjr1lXVkHblE+/pPBqCnEWu8A0t7WXOM3
	XxfYGoV6QZLS2Fn1cMKQxS6cUMZI1pcYvlyvTEfq02DsUAOcDI+cRO54+KpAsanbmuw==
X-Gm-Gg: AZFdTZfUtz2MWRa7DkWFpzlfuZLNB1F7jPqNgzX3GakRJJxDmDSU0xh+zVEYpSyyakR
	aPiGuwhtphM28jUujZvyd+NEK5//3uQSY0pgxERiiuqaO6vXZ8XqcKwdAYxTbJ86Dmz6uHZHEwn
	FogzQwhDzFfiqWmg++UBIxKQasmO7ok776ufR5dQVO1cp3QYZ8H1WbnW3tKblLe3VJ2FvijjHiN
	BA5H5DRmheTmn6PP091PybZ4FDNpV70TEpgk1y1j1cwdeB1rBTjG+OasReEpL3XauI/hcSjzrBN
	TU7sk6NlEBzL68NgBGQOO6lheruKFCa1OGP8HfTjge1hbpoFrFO4NCZIAbeHRdwYS3rMLriVO39
	g7gZRma4tm/GWwHOjfQMZsNoMN3LO9Fe6QjRgihBgNb3BDKlx0tJGzbseoNw1H8KtfU9cBbMfk/
	+Oc7m8
X-Received: by 2002:a05:7300:89:b0:386:c880:19b1 with SMTP id 5a478bee46e88-386c880248emr9901025eec.10.1795783112933;
        Fri, 27 Nov 2026 04:38:32 -0800 (PST)
X-Received: by 2002:a05:7300:89:b0:386:c880:19b1 with SMTP id 5a478bee46e88-386c880248emr9901006eec.10.1795783112393;
        Fri, 27 Nov 2026 04:38:32 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm88060568eec.10.2026.11.27.04.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:38:31 -0800 (PST)
Message-ID: <ffdfe000-fff5-4498-a4d9-1de2e0f23707@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:08:25 +0530
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
Subject: Re: [PATCH] Revert "media: iris: reject open() when the session limit
 is reached"
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261031-fix_v4l2_compliance_unlimited_opens-v1-1-f20cc9231ee3@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261031-fix_v4l2_compliance_unlimited_opens-v1-1-f20cc9231ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oiPf4jiHsbpVFFcDmWsl4hmDa7l6SVp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX7AYdTeIeP5hE
 4Ijt4bKczIB3yI3zXw5HDd/z7CZM1mQtFEbRP+D7wUorWs8DdFjkjs9SLOgodFy5jJWyG0pnBHY
 lRADu+/0fZOuNF0wboMFRDyYsT+73KHYfhZiGY2NXFxV4m5wo1xQXmrrDaHq/G+MNMfnJSCjF4m
 x68b585ihHg1FR3U/HNKu5ciTSDHr77suHH0RwUNKKCCO2Gvr9oX4mRS0sagWwVrnMq77fxiw7f
 6BQNhrs3ll04oLFQQ4UhLhRc1s9Ztih89jTxAysAjJlMJFmBFgWp32SxC2cx90H4U7tlrZVZn2R
 kVHyWa5rydt7p8isxLkBM82K1PVFljuSIbWmF1Als73WARmHS1Ird/iwPUKS/kZaUGPPaPuolz2
 qL2QPmKCbsGN+mybpDAkK+Y3lTOI5CwoMjftgV7ITgEsYwn8HsimjhbdPCyMMn82yIuweYui5pw
 gZm54AQ8O97D3w5QxVQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0979c9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7GKYziPKAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GeMy74hU6CVubCBKRZ8A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX4xDZaTEUcMjK
 B00qLWMIKpUuSCH/SxDRjYvjorKoILOUQUEwu8hZ9pEp5bZ4AQOZDBlDIPZAR3kRJG6yp+vb6bk
 aAA7ksznNKEc1swz0DGXD6hRRZjq4c4=
X-Proofpoint-GUID: oiPf4jiHsbpVFFcDmWsl4hmDa7l6SVp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270050



On 10/31/2026 1:45 AM, Vishnu Reddy wrote:
> This reverts commit 397ebadcbc21 ("media: iris: reject open() when the
> session limit is reached").
> 
> V4L2 does not allow drivers to impose artificial limits on open().
> Resource limits must be enforced where the resource is actually
> consumed. v4l2-compliance verifies this through testUnlimitedOpens()
> and now fails with:
> 
>    fail: v4l2-compliance.cpp(773): !ok
>          test for unlimited opens: FAIL
> 
> Link:https://github.com/gjasny/v4l-utils/blob/master/utils/v4l2-compliance/ 
> v4l2-compliance.cpp#L747
> 
> The session limit is already enforced at the right place. An instance
> that did not fit within max_session_count is not added to
> core->instances, and iris_check_session_supported() rejects it with an
> error from iris_vb2_queue_setup() and from iris_vb2_start_streaming(),
> which is when a firmware session is really needed. Failing open() adds
> nothing over that and breaks the compliance requirement.
> 
> Fixes: 397ebadcbc21 ("media: iris: reject open() when the session limit is reached")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vidc.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
