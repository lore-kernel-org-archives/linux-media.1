Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BAC3E63AA
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965886; cv=none; b=n6kU2frsmFaSXp2IxLywzNTmdMWiHuVMX0n2W8yRYI0IG/6ckAPXBO2/nTJghLNQmI34tsSJqg7OvN/yzbZpzBch1us2oOpxDlYrL4kTVco9PxFYzdFa1OT0d/DKR1BBiD03n5+YqaFQliD+WK1rDErhs+XSyqlIjRNZsJY/82Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965886; c=relaxed/simple;
	bh=M1QVpyQl+tfoWBjiEFQ4lxipLnUlVCZK93NhJ2zuUVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1aq5fmstJ0eWY6UVytumUEAQIqwGpFpu7+qlB34hOemT8Moh9HX10pTQ2Qk8g2z82nYFGwp1qNbW4I6m3jvbjyW6iz9SJbZc6SHmBdVfemyx9rfOA3PW0Ec7MC+6AWRJ9jiBWcTrnzBk+LzAEpHLmKxx2YmGbJ+o/sNJtqWVb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWEMgDI4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzRvDfAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWEMgDI4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzRvDfAw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dkOe1861408
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qcs1zBqNu56tW75IOxQG//EA+2Y3fUZLHsadckfVa2M=; b=HWEMgDI4T4XA/OQa
	W39aEezwHqNCSHjTBhPeW7KbSS55m9qsAPm7j0HeE/zvoTSypT1LipWPoIXLJ8yr
	yoWUJYHqOesGVYgLnS2csP9IXtlWb5E5RRMU5Jq0XEohhfOZ+vPC9qyfvcDEWpR1
	K+zwP6NtQJgBkjMxKtc4KjfnlIFLOD0UBU8e8fSThvpoFJeVhjNQZmpmDJk2c9S8
	+thd4uPVhH3ZfI9tHN8ZhhCT0TwnXgDpC1XU6z19TA7xc1mAvMhZ9hj82zVmmUvN
	MRVu8E545TvuZNKwZilpXqMvHD/b2hr2tzMpOQ9hiq4JCQ9fBEbHLeVyclCnUPQn
	E0//Xw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghsc3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:24:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso3980721cf.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786965883; x=1787570683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qcs1zBqNu56tW75IOxQG//EA+2Y3fUZLHsadckfVa2M=;
        b=DzRvDfAw6IlFYZPtLuXQKp4DseW1zysNrBPcLvMdNPReeDovk2MgJG8ydl86We3Db9
         U8th3PyGenMjGE0Bh2enZit4sMgJswZnAK54t6F6MRs76P/rMvq7oqn+c8JpjO6BIZkd
         BfQS56aAvnhqqwLb0Hu9GJ1vMW8zYRE518OT+lvGug12EMeH2hX6YI7Qotu9yRauHchy
         GV3NW9ByXrCqcLSCXiWT6eY8Fif4fuqdEZZ/lcJ+5wzXnqWszog4+d9x6hFLSDUzbNev
         1t558A3rt6S3WxVB7Ul17ruIaJa5+srKtGeYBeNZjXv8yj7wZvSSB7PxHXlwd194I9wE
         EmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965883; x=1787570683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qcs1zBqNu56tW75IOxQG//EA+2Y3fUZLHsadckfVa2M=;
        b=kF0rklFgIPPfSe5Dq73SZHI5esOWiq3ACJ3hyt1Oer4M239WKrbn/kO5Hc3W9jWapB
         NwLg80ZLx02YyHYZJMYCl4fSKxmJbnxscRDFHngCO0UwHfKqtQuo3zokoTM6/c/bP/SB
         9kv5H3pXR3I9SsmTalgfEKonMNV76LmLK7zXFQStYtq9HSqIhLygZWeh/PBUG3ITLi9S
         zJviACWacG36qzsu47crAitkBOjP9IhvluUvS41mD7HRLSqZow3fc4cxvpG7TxgR8Suf
         xvCyczETw+KJCzhdwo5U8hSwop6tAWXuPjDMttmGJy+C50O8lMG1zMTBHzQ/GjhBIA+b
         YNEA==
X-Gm-Message-State: AOJu0YxTFa3BJ2Nxufg9iqatIw8MDODmJmaIO3NeMzcfdFV5FbjNT2HR
	eUZ6Yi+xcbl7stpBNS256JDE6kX/6avA1lcGiKzeBwEBX3E9Zja2HVmHgkeSlBbQyDm2RuhedpW
	R2sa9CZObPkttUAFZLv5V2FRbJUcnGmToY5CJ+NgQGVj1OxKZPA10U4LgoiFcSgE2hQ==
X-Gm-Gg: AR+sD11pWnjrI2FqPO+DX1fopny5HnUIwZqsrwvkQSSYITBKhUdItBsg4PPZLDoLKBX
	X5pBTRi7iq2pOQO+zqVq6gtmKZnRHJ4Lt7cXzsm9hnlaNT2+CE+BsMygFRaOMd+N6/XScroHj/X
	uv6obG9i8XQuVrlPx0T7CZp9UH3V7V/wWtAEmHZivK/BxkNCPja3opAkiu9v0U//99Hgc9O1mok
	v1/4aNFFPhgbrffWII7EPBy+VYXVJIHYG07CG8E8bJkz5p5MfAILrr6JiOtbFhqX+OunHGWLkUv
	CJO21gpfA5p7pr7Oz9bb1Ous/1MWq35OrLPimZg3PFnAkXLqZhfRhL2ssh6rxJhNjPkfqWlNF/C
	/voRv8DZ3p5oWyEqYBF/NOcqL
X-Received: by 2002:a05:622a:1787:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52d854b8b9dmr194454351cf.4.1786965883383;
        Mon, 17 Aug 2026 04:24:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52d854b8b9dmr194453971cf.4.1786965882931;
        Mon, 17 Aug 2026 04:24:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85883cbsm495142a12.15.2026.08.17.04.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 04:24:41 -0700 (PDT)
Message-ID: <cedd23f9-4ae2-4215-aa12-5481783b84f8@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: venus: report the frame size of the codec
 being enumerated
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
 <20260812-venus-8996-v1-3-6615f82a63b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-3-6615f82a63b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a82ef7c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FViGdUMYcZh3DYrJdpUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NSBTYWx0ZWRfX1a+ipDoQE9xL
 XztDdehk+AVAK1G0vcJTS+psoMB/QrWea8pf/Lt+b0Bi8x9p2vBBf9jA56X4sT7bnUjeaMKQWBd
 /wHX7WAwZaZdiTw5Zk3RKE4YUDb6EQY=
X-Proofpoint-ORIG-GUID: HLFcgQiniY_CbTp2-RdhkfPdozpEx7wM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NSBTYWx0ZWRfX4I33XTidSlzs
 qJYot8cVz+959DxZh4MNk6gz9SwMTgvI3Y73IzePNWlLjeYJmH90YCve4XqnaOMue+Kq3D0tMsi
 hakornobkyvj2nu8LqPIzINYEoFQZFx1uJ1MPl7+unQ6x+iMbSWkBQTDO8E6KZAk9oLoPoYCcrf
 M++8IKK2/Ree40oUVbCG/cH8de1U0A900sArZhfHZ5ZamtQddGTfkOyBurbd4shT0Cx4rbX7u6O
 b+WbCqRztDD7+utC2zdc6oNJtcme8Od8+9Z2AQEc84a8FaUDwoLhQq0+ZZpJFYRfCPNgyEtX3vX
 4n/H64SAtCAPWBCNcaaC8isIh13r3Zsz4RWERzy9U5UivvucUDAmbGNlyVG4POVi/KkkxX65n7L
 jNm5RKBPPslq3Ths7Dz+cy56lKCuYaLmRBlonXj2Pnilez1tifdqPlkG3CZbhnUTlatkV+pBXSu
 zaeGer8CBBgu4i/T2hA==
X-Proofpoint-GUID: HLFcgQiniY_CbTp2-RdhkfPdozpEx7wM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170085

On 8/12/26 10:01 PM, Dmitry Baryshkov wrote:
> VIDIOC_ENUM_FRAMESIZES takes the pixel format to describe from
> userspace, but both vdec and venc answer it out of frame_width_min() and
> friends, which resolve the capabilities through inst->hfi_codec, the
> codec the instance is currently set to.  Enumerating any format other
> than that one therefore returns the limits of an unrelated codec: on a
> freshly opened decoder, which starts out as H.264, asking about MPEG-2
> on MSM8996 reports the H.264 limits where the firmware describes MPEG-2
> as 16x16 to 1920x1920.

You gave some numbers for MPEG-2, saying H.264 has some different numbers.
I think it would be slightly easier to parse if you either skipped them or
gave numbers for both codecs

> Resolve the capabilities through the format being enumerated instead,
> falling back to the codec in use for the raw formats, which have no
> codec of their own.  Both drivers now share one helper, alongside the
> pixel format to codec mapping that venus_helper_check_codec() already
> carried.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
> +static u32 venus_pixfmt_to_hfi_codec(u32 v4l2_pixfmt)
>  {
> -	struct venus_core *core = inst->core;
> -	u32 session_type = inst->session_type;
> -	u32 codec;
> -
>  	switch (v4l2_pixfmt) {
>  	case V4L2_PIX_FMT_H264:
> -		codec = HFI_VIDEO_CODEC_H264;
> -		break;
> +		return HFI_VIDEO_CODEC_H264;

We already have this - to_codec_type() in hfi.c

Konrad
