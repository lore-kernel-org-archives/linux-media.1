Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E352842E
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067414; cv=none; b=lR3zooFccJF1CngfT5SNSf31oDuQbSRoKkR30kYsJZL6Sh+QSJukaBBaBBgiiN6pfW+qN6JdRkRTVnbYaz3I5jqT2V9/ltbYmvg0kcdOhZoo+VbiEF6syU4J+jCEuyqxnZoKanbFzxbcvrgMqp6cTFQZJQeUk1lktF9msSrwbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067414; c=relaxed/simple;
	bh=xcSudL0df4MclDXMa3bDtxmiwJRhRONHmT+v4SEV0xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxoZ9WvlXkxBydwJ8ULnboED35Vac9a1s2syIKxGVrsczyJfOiAj8P/knfMomgu7VASspeohgtI/VAJFSXBSjwil5FtMBZtqhRMrIgCHJojp6kH5PxqV+PIjfEspmUcmo5WtlCkoda2sGcZz8+ydjn1FIIRIpVFLPX1CiK69eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBDitGLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/4ZoyZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBDitGLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/4ZoyZc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8dDHD3703871
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 08:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=; b=RBDitGLAD4Q1hDaU
	b+xslq1XVVCO+4/r9CoMfBBZe000lwYOkP+E0mD/sML14h9vuCrnSQkzV20qEvdx
	dZYwwjY4DhYoYsmP3XRkc8JUfkfPgdGcZi7mPMT4kMZpQW+NxNIA4IiXF8mkIWrh
	dgmlv5RN5B2dXNv/4VNDcHqKwm8P+ShZzSCX4+kraKkFEtSbC7N251XVTVRcn2c5
	/gxv0PMn3OWSsN5OLkdFt4wsu38a/3Lfv3/U9Rcz6M6baR6gfrmV0L55GsHryJWs
	BrwolA0P38Xdb0TYE1plyyLS8hQNPYyg+ddNHXcw8PWOHMQGG7WOTZ3zWrXjmWve
	UmnYRQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqg29m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 08:56:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf3eeb42cso15570885a.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790067412; x=1790672212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=;
        b=Y/4ZoyZc7Kw+Ya8dSWEYh6Umx9iv78wj+VGZP9c9SwM5dZZIW/Nwxy+SKTcqE4bVxM
         EQ7gaNKqldbhUqNeH+7NNTUkuKkF1w8Lom/Z3FXrUZW2BJBeNk5jMSGzf9r6SlGbV8rD
         uwEyj51Liqn6IN91zPIPxVzC3T4L6Lz4HAxbLqtzT2jBtaGNcXQYrPE/92ryX8dfjmTi
         NCPDaXE+J7OJ1EVnIvG/xEYgcz4oJFuEaaRy8oRhIhesjtIJ4Bm3cuwWLuqDpRhi0hlf
         GLmBPqvRk3tCTs8kYqmC398hDiGWeMCipozJd1RGB2bmjeS0XpdcHv8rkmrrWAEzbgKw
         JBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067412; x=1790672212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=;
        b=tNJSnF5syES1zaWGR4jJRMXUT7AoHTe0zeHmYccWZHC/GXtV9g39aLxuRiOFtBMx9u
         sTshyi7OTAuj8UpMKa0HucEQ+gEtedZdgrKvRaHuFHHgkngpOq1Hn8gCe2CXBlEACzAj
         KYZ5SNsFHyn5EMmhz3euWcZtWkOQQocSWOvnKxokQi7uyr1HbhtD17iV18QwCmNopodj
         y1L4BwYbWw0drYaUosDONnYNyI4/pQHMlV1/rf2ulLyvhsNgKvdtMxOAFSX3a7SecwHO
         t4fwrrRIejUclQQFEVzNZ8b6JPbBG+qRqs0UH3upkmcEO75SS5Xwyl403HSKwJHe38rp
         pg7w==
X-Gm-Message-State: AFuF++mIdBifqyhSvR1Rp8oNzn+Vv6uVW+v4JGT0llON+OUEKBEqeTOF
	jyxekGIgdaZcYu3Ca4QMnmZREYD2jwY1zwEJXM1WH+AelgWqCetuO9w14uolBuKtzxccnTaPO/S
	Lrt6B6rYImFcey1BHedrI9LULOzyKAd0j+cso9giWKD/fTgEIyHFUiwiGgT/Z2Rv2jQ==
X-Gm-Gg: AYBFou2Cmr0hWbpdDJaCGT+sPPASaKIKyJJZwupyENffSYEoaV3n84odspkgP34pZo3
	wW49Jw71Ta4r4WxoRHYh0Bqhk3pfP06LDNZQHQhfiagU7kn6ZRU6omD5nDVzaAENs2CAMGGHm2j
	51wROgp+pnZfOuNMe+u1WPejLwoxY+Ui6DP4mNLS041H3syITjgdy5OfN8DTR54OIi2zv1LaicM
	gIYSOrzJUujY5SVTik1GuGsMoCGcEg9k7NbFMr7MRFjkpvZRVivx9h1WBKG9Gawp9AyojmEgozq
	ldrawXpTa700LnJO6iV2bLtxXc5XLW30DqAGYR4gezPi8TeiXAitdnivMfsL1T4F4L6353lUNpb
	F896GhMVuY9A/HWvbqEj86w==
X-Received: by 2002:a05:620a:6484:b0:939:e9a3:3105 with SMTP id af79cd13be357-93c15f63685mr458254785a.6.1790067411654;
        Tue, 22 Sep 2026 01:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6484:b0:939:e9a3:3105 with SMTP id af79cd13be357-93c15f63685mr458250685a.6.1790067411114;
        Tue, 22 Sep 2026 01:56:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f32esm51695466b.15.2026.09.22.01.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 01:56:50 -0700 (PDT)
Message-ID: <cb89ad25-00f3-4dd3-930b-c4423ffb4656@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:56:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPSS line buffer width and height order
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyOCBTYWx0ZWRfX3NZQXcsYrj5N
 JAM2HfBdj9EvxF21rKcMntCKMq5vNBTM5i4FyceHG9nhQVKcGbRhD9EqLqyhGr9kBwYrgPcL2WK
 7hP7y6JlFBbtpCd+K4EkPOLNBUF1s55Dl1EdZMHS92pk7tLsdwHzqypUwWgAsXkmJf7wk8gwrFr
 MmQxGSU+yejMbterrTbakmZeKgLFuZnpBazk9+4Hmtp3U6p684u/LzZeFE31xw5i0CzvXSsD8TJ
 xCH7T6ttuQrnZ01DgrgbC01UqztAaAx499kLCfPu19B9Q5Mehtgxaqz8gXR08f+UHso7frkDvbS
 tXnW4JL7xIAiWPxz8e1LW/PvELnsXnAChahRqUz8x1OsjD7hgkUuN3J6J4XTb5k/fKlVx9fxbo/
 BkDQcNvRkndLK+65q+UGiBnS1DnfHJl2IAGiun+TqwxHa/UEJICvwF/jPRf1SCEdYAqIyGKgyrp
 Ikk6lkr6rs2DWRUOFHQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab242d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kVwqO6oyCToStzI6_vUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: LNK34kiKS53MxmGiIDLYV-htI16cFI-u
X-Proofpoint-GUID: LNK34kiKS53MxmGiIDLYV-htI16cFI-u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyOCBTYWx0ZWRfX9YhuW97qEIPQ
 OWrJGWgpbr1SxU1ALlpQrvmI/2/PAitSQacop73Hnh0L+bAzDxx2iY7c0+u/YmCCsam28athFe5
 HrVWet34Kr2gyToTRk2I5XzBuwA4O0Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220128

On 9/22/26 5:24 AM, Wangao Wang wrote:
> size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
> called with width and height swapped, miscalculating VPSS line buffer
> size for non-square resolutions.
> 
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
