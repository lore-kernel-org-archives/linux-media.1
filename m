Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786304;
	b=rKqmM6B07gUUBiVouajzq9pmIZsZ/fu1bBCjKCvEvIUS89RuU5rxsL54Eu2TS3ruYFXf
	 lgaPeEGyGyOdg3NcHvUw6LyNmLBO6qQXe4fK2gbQcDblz5dI+Op9raWufYXXVT/6y2KSn
	 V8F3pOd+VE0Aj9D1FgCWrBhaJLA+tLF/tFRG/S0IDG+oitKrVR+OwB3KTT5kLqKjbQxwA
	 fg2jLk5YC8V0o2s0mGGzqNaZSmLwS4XT4FQHpAks6kTSiEnuqRObX0AeLwURFsNGIjt36
	 3jME6rmv+loG9I4izMiCoFzZfFni9VQBxIarnpjxUZHYSUYVSkW2HUL4Cunba+L5n6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
	b=FN0CC4HzamA0AllS6MSiLEiDnTKXUwsWteN9BxOtZN3QBeyEKLSetq6svTvCd21dIl10
	 eKfPtYRrIZ4nmsVCNebGbbECSl/UHdwNmoEX4y0prXgMPbgUj9vbCU1NAJDKtUYvzkPuo
	 /aadInmMljlqisjmOQROjNY2FBtk0pPGQlWd0kBIVysaVf2Uvj3x0oQzpB8eXjviwpvW4
	 BaS7YYs+XH0LHdYu5mYB0RENpVk8Jvl39cSVQRfZpUYa10IiS/oraRHhFD1HNwo9c0wyS
	 xjUjDkBeLD2GnHVQO0rbcB08GJ7bxXk6XbahyYlQcSzk395rLBigtK7Yi42jT0yVpxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evH8njkL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Klei1wBo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2E606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evH8njkL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Klei1wBo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCh96L2205027
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=; b=evH8njkL/TLzgNau
	KHzfI8iNVD1HdH3UOaNX994fNRKQqHHPUQ13YPOoMUuxFpkUhGSvvMyY5Jq+529A
	Xti2KksoHv3nDG9PnOnUSD1Oom3GwQAKqeddfQEzixm8vMW+W2AGScO6ZyG+aU0p
	k8jAgFRbhtrd/8VD8l7Z7HltCT+CXaaSRD/p/DCTgSdZVvvUjr+2zLuZJR4T6r9k
	umS3LHcbCJ683Z6woHLB4Yniy2cyWYLAHQi/rM42ucvj/n0PpHTYsf/OQ84y/XDG
	BsxLKvh8ll29YwoQWnXVaMrLI8Ih1cmcmjChWGLO14VSkj4Rz2jQCCMXwja6sCCS
	EJpcyw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hu7xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:31:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so7756538c88.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795786302; x=1796391102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
        b=Klei1wBoKGZ8Ivh01hemdBW/PrNYRdfKTuraEU6fSvXSF4ZxipSQe2YuLmOb9Qlg7T
         tmJPfohF5ntitehP6RJjIu1r/5x5C41G6Z3UbKWku+1LXZjDV6D7fszIRz7B29TLooAF
         N+QAahCkUEdHmL3krzVELef6FxORJFXVIrubuOrTDoKs2qC6jrW1SZfnE37cwnuPuzSf
         okJJPgAtd6QFr3ISPNQJlsXLEyXEEolR/l7Uegg55m7kkES02fZQ3f0aB0DkQ4tGpng9
         ri2zW6Bc/7ddHRDceLOBCGn9TMjKOG3I8moEkgx3htN0FatpPYgRyfh5/fUcpuVhQIE9
         gSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786302; x=1796391102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
        b=zmPcHRE0jsX4+QduBftssNvSmFcTBOlXLsp9teJi1Bt4ZvBMREDfnbieHKY6piQC0V
         UKEpjlIY+rxdeUyC0EGpbpxudFg6tU7tz7oRDEDEVagJVks7/m96d2fr16oi3yQTs0lM
         jTMDk9Lz3Gb6kkK7KFmJyYOixyQMwuxQ8sqJ3IrSOCXpzz8WsHDUU98C/aNkeFs/zdUM
         8JU/V/ufLOGPvXzWb/cwhFP7Y7xoGM6bS0oR/OucqPW8+HMRnD97fQiH4AfQbUdV3VD0
         OZyFRGeNVljUAMA2OLZZwRZHCzWdGf4tsbXOUStnqBaWbPjSOzV/Qc6kUAtHlT6b4HfU
         UmJA==
X-Gm-Message-State: APuU4Z8EHietzN0j6Ed4HQCrjvaHnHzBwM7aqUIlYhONEu9LftJ1W3FM
	aKk/LW6pug0nHwS8MO8FFQotd05DL2Bih79RxFhlLJd/0QwdIFO18l7nwGHD7E0x26cZZWQVmtO
	01HWSD1aEsaSpPzr7d5rCa3pC+ha1AVp2is8FGfToG17RjmD43KP7CoGOJWxR8Q/Wtg==
X-Gm-Gg: AZFdTZe7/lyDDxzUkBGmkkE1ivLe+gnzEFHJcv5IwxeGOApuWo5leYjLQh3OxQAamyj
	4SuJMjktlbse/8de003Uz0JxUbYFOYhsebDbqMIBZwVI+q063mkoSvq9BXhG2r9KwWU4vFycoYq
	7y+l/nn71/f7e2d/zOjQcfnXpqcHb3c9uVCxsYaCnSC/4s6IGEKItrLiFEOFbFdgLAqmKXCeVKi
	l/cqxnxpiVXirzn2iq5cJ7hdcmjMgSRkFvIsKMiP8xgg6L+bbSBKzVJKGYTNGdBsr9nvzizFuEf
	plbQ3o38I9/pJvuaTeGWLSqNlLokR4ARZQx0qAbetd88br3QwCDavMz31ykMB5r1j8QUsTo6rEs
	P0Mt59KyDPSYIrDqqE4+OdpV5f+PYSup5Ndrcpx4OmxTqlvDM9ImWVxTWzHlKyhUOf76dhshy76
	nnBSReJg==
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr30974319c88.21.1795786301675;
        Fri, 27 Nov 2026 05:31:41 -0800 (PST)
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr30974289c88.21.1795786301163;
        Fri, 27 Nov 2026 05:31:41 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm43708473eec.18.2026.11.27.05.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:31:40 -0800 (PST)
Message-ID: <c1a5a27d-5b59-41f9-976e-68a7961e9936@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:01:33 +0530
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
Subject: Re: [PATCH v2 2/5] media: iris: allow larger capture buffer pools on
 HFI gen2
To: Xilin Wu <sophon@radxa.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
 <20261127-iris-va-fixes-v2-2-385e8636c22d@radxa.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127-iris-va-fixes-v2-2-385e8636c22d@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfXwClwnUG1bKZm
 fjYejYviy8bcYIcw8avbF9IdoU2U3nU6vQ1QCxgVTV3V8GYDB0/4EbrSzI70ppwf1RY027s/Q3D
 da8OgfTj+i/1lAW8KluAoeV9LNGPDho=
X-Proofpoint-GUID: RnQsPxh-S2RR4rylRaaXilxtByUOctgp
X-Proofpoint-ORIG-GUID: RnQsPxh-S2RR4rylRaaXilxtByUOctgp
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09863e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=jXj6vGqe9ollWG7NQzIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX168X7239iLdQ
 emLKAYR25NzKNtnUdFUpohCJxHTqqaM4e0Jx8E4uYr6IMoQkyRJ350AXJwSr7X6M08Of8JmAZFP
 7FAC0lASOkmwlQnIgACGbw12l5AGnuwv8WUnEnCRkppS59ewvSs9lGIJLNS8/lCskpjm1BQIvLF
 lPf70M/RHkTyIsP872SWnVi8ISFbf3z2jJ5yIxOlQcQF/vzBdBNT3TmjNr9gpQWY8afZ2xqEnoq
 0lgFiZp9OXt0EeFEQ71+kKZ87LVjf2boZMAQ+D6CWKNA+Gtljpd7XtfDfMtmCaExJQk6xHlWHX3
 nqsOI2FoKL63YH9+YBbhL2t+1nwaDCYPlZp/QHEWXO+m55gVu7QJt6z5HSu4+cvjLYzx6cdcve0
 wKkGnO85BtfotlU7qMkCi6aiOPk+QS13DLTMVbiXVTGLwa7FeZV/Ti0oZnxcCZ4XLoGBtcaRWBp
 rgg6AReRx8mjxWlrJ4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270053


On 11/27/2026 5:10 PM, Xilin Wu wrote:
> vb2 limits a queue to 32 buffers unless the driver sets
> max_num_buffers. Clients with deep decode pipelines, such as VLC with
> frame threading, can need more CAPTURE buffers than that.
> 
> HFI gen2 firmware takes the number of host buffers for each port
> through HFI_PROP_BUFFER_HOST_MAX_COUNT. The encoder caps set it for
> both ports, while the decoder caps only set it for the bitstream port.
> 
> Add OUTPUT_BUF_HOST_MAX_COUNT to the HFI gen2 decoder caps, and size
> the CAPTURE queue from that capability when the platform provides it.
> Platforms without it, such as HFI gen1, keep the vb2 default.
> 
> Signed-off-by: Xilin Wu<sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vidc.c     |  8 +++++++
>   2 files changed, 38 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
