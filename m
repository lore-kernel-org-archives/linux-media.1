Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585055;
	b=3X8vA7G5serLSesC3oWIJRsKvUWSIkmtrLSWFrH27KuglhU2m4CQR/vgq1DBEYgJdk4f
	 jlJW/FQGYbsHqqKjaiu9e86Kep/E0Ist1K7kx4po58E2Y59+Ny0YxPqUkBJn/nL+JqTyf
	 wJdBL+/Jb8719Lm/q8NAHUMny17XxRtVLj28X0xfD6YHmJwrrr2Q92FTAD66Uj1m22E63
	 h5xtsyBFvH+I7relIAQm5IQqxIqaRXYIRJgw3JHd64N/QrmKEdEeOU1tOte0s1oQQbnvi
	 K17DUsRY9bZzMPbHlfCeV87uxeYHkR+v0IjXJ8ecze3dNb7xsCqhmI4uDkF74vKb92A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
	b=xyyiquNaQJIbnY8s7ab69Q1OtoNDmpM3bXetxjrOXDl22r5WXPvfx/mpi0v6gitG0R3a
	 q5EMub7s8sLlVf82wiB9kby7AOOzRPFiidsE0J3iGmp7KxsbHAMeSLVJ58CIXBs4kaXkI
	 71E5QUw3C1ijCsUGySvHnNafc2ZE4fjrXny4r/uQudcDdrD9+JSCcOfDtCWG+1oNJseAM
	 P6X2bT+18C/h0nJLrQM2dsBLU9A9uP3MhUSUdq+2BeWEpoCFORXfegMbgWwk9O4gxcWll
	 w6HKvOiAGKPNRjC7arg8MxX1HKzbJIFps1tVlaCnExXlcQ/GXie88o+GQDYiT0I8zdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq106wdr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKkrU0u6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A7606AB39
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 097A7606AB39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq106wdr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKkrU0u6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LC5t4X543591
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=; b=hq106wdrCvnaZp0/
	BDLD2cDahdCUmhRWtZjpB+7YCshF6VxeNFrTXtBUIvGmxn8HfZUQBQtFWdETR5vq
	aYsCTkQ2WCNu0HvEYe+8sKcEXmkAKQ6+wxJsvtFiFQPQGE39zUTmrvtj0/GVRT5T
	bAai/mO/sam/re1hV/u/G7r9+KNmOpzi4qG2FEEyEX7L9zIo/QklZBferOfvRFjH
	JDO+ZG3pcHZtz4eeQTsjPvBqlg8PGlKrMZ3hV8rM6QPf3JNprzpU6Wjh+u5LZyLw
	Vob4+9lHqLmibwB1StTXcUvs+Xhf3V0ORWrzQNNcAtVDBEvjfhAIvBJiPHwI/oFd
	JLmlmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2wxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 12:17:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so18548385a.2
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585053; x=1793189853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
        b=fKkrU0u6A9fBdR3M++1pZHdvYPfCEB95kmPNClgzKscG2EiXw3swQIZIFBG3xKuMGf
         BcfCcqU9eCvXcTd77EChyxcgqzn9qVEJdcXu2bcvtpSD9/IjDc87zlDO4fZgjT62AfZf
         8HNk2bu44xeCv31uNynYyID3P1J2xLxUfpzC3pPD7jcdUrrarLcOv5ISm7Nc9L7Eij8X
         sxu8JrAPfcQS+uwqWS5RJpURa02cnYkHjTJdZDh1U+bF/g8kaqM8qvjlR8RAdpIs6UvZ
         DvaFQTF7JdSy4xwvABCAHj8+PMscWhjNqfZF8F1kbmZ3tJoMxpqFt906pgh5uv/hktNl
         TGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585053; x=1793189853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
        b=CZB4B91JnTyVxd7MYLSTPPcMpZ7Cacbzdfsu/jygKfhyLAgRqL3jGgc9dGqZEwXjX2
         9A2xwPntrxZJFM2kOVZ19FijIqITnxnyr6Lg52OAn/Tc7OK8eYcnjIZoT4frrH35PFcZ
         2da5sNoXePU7MZRRAx/bVt5oQvdmXgFj2oUhCMFFOlkH20U2Eo/1RgTrxjT3+n9V2ER8
         88vGRpXMjyGLVSG6C47gWrnsfjlQfs0JOMd9SkqDsMZ6rU0D+PeRXZXQt9ivA/mzBncv
         GAc2XTo8B3B035AQAaJuhl5c8dFYX0/CWaJEIUIMRpi53kXC0pIyqAWg+iWT2vdliDXw
         tenw==
X-Forwarded-Encrypted: i=1; AKwUvBzvJe9uL/Ef8nura4pfGbf1VF69ivIb2V75dPcESZ2a7H/LvXyqj8UCUuE/34hY1c+oP6zoC7q9NJAIjw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLYWHAgEeo9mF8Tr+90AiovP0gyi9ToorP2Wl5rvQ4J5lsaE0ap
	Jnb52zMQ4MnIUzRqTjTXMM+/7affSB2fJAKrd5zhUggOqeRxNY1Fjcq4I9XxiAHXTF7Wj/8jOkN
	fMQyKAzzQ6EDNPWfp1+4eO9LZhy15yFzblP1WehHywQQB2uPyKf0t3jnHdBmCPN0DlA==
X-Gm-Gg: AYBFou05FPkZehRo96Qikh0AF2E5jNJ3x7uivzyqR+MO7NSJFbf2YQqiyUe+5Gafi3X
	LmTsYSv5sZQLVK6BVzGXIx7yL2SK2qPtbC2mqgk3fKGOsqhki9s/Zyqh/Md1yA8RxbTcV9AD8LP
	Z+ntxrfPH/kYidSHhr2k2xOD/Xbnq0bVJsgz3iy4WWApHRnKj4TGomwVnHCtrBHcxr2QDxWsLx8
	Ei6wz/TkQ6r5uzuzSgASURlSpsz/+AN/IBEVhd3gsMCXUt9tEbVvIxvg451K2ZaPePEEZXsJzzU
	Gze6pQrgVywYLTBjonnSHxUqyE3/WiJK1s8HDEM7HwX6h6c7VfpAHYo10CBgXtiwiCjIm1ywJMO
	InqO/e24f9Qrx4yUic7V+yA==
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr436659585a.6.1792585053165;
        Wed, 21 Oct 2026 05:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr436652385a.6.1792585052487;
        Wed, 21 Oct 2026 05:17:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7c55asm71894466b.20.2026.10.21.05.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:17:31 -0700 (PDT)
Message-ID: <eb5a2294-2e1e-4449-827d-eccea61198d8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:17:28 +0200
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
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8ad5d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Db7omukDTCqXEX29fTMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NNOSa6Rz9uOHFyLzQ_IRR728mVm8-3JC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX0bToD6WsY3oF
 GxH/lwXEOsKXBEGdF/GQeCesF5l5uwfaV3SWxYAsQ9kWxhY8Gqfw+k47dXX9ZtmvmZOTQmLJYMh
 xlIVXwQyrzuONcF4O9W2LaWd7L+r5PTD451Mj1lEte+I+xVoJYEmzVyeijDuYLYr/wfCWiLgJZp
 wQs9tNasIe5n1gYJOU4xlV9yc5qATM+nmHgYC8SPtPq0Rlf617ZeuW1zsbJNvuHmU+cA9PnHqze
 LOx/o49/1M1VO+L7+NlFuM00E791BXFkhLFccSqpadhH1XYVF+xu3sOnoS3ju0x09PJ1ixHkYOZ
 vTxsrV5EZxa63w5ZAQUHmSsvPBT0GaZVbZCqWkiul0KFy8Q4MFkM1uj1fYbxMQkuS7zJFyHcA7S
 5+d3VLIpiuv1qf8YMflsi6cmhQlFxKLw7SINO9uCyacYvPrC8P6KJPIRjJcHlU1Gijjl4Q2mIyD
 SeYVnr+BULg9F6bvO+g==
X-Proofpoint-GUID: NNOSa6Rz9uOHFyLzQ_IRR728mVm8-3JC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX5Icd0qGq3/36
 AhWpxBpbIQEvgYUKnMmmdt4oo4fgTiRVgapPTgmYeL41PBT7MwY3rVKYDxBpA6hhPQ+gxgwvMNr
 AuZLQqjGCpZQoPmw/utBM8uIN0CcnEA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 9/21/26 11:51 AM, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
