Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608264;
	b=I5K0vYqbNg4t4c5Ops65quxFEdZcccA5xhQJyoauhKAr4s08lNqyUnCx5oF25kFDn298
	 BhiTR/6gWa/HAwoqeH1WvqGUFcqi4lwcjbba2MFdwVkjGUt/921afGZFLoy9UE0164Cak
	 Dpc2rqf9POgcdWjJxY7SuyosOg8T/1iWaDWg0qXDo7PO8NwbnFU6eMTG8+UFQLoBAIuoG
	 CD0MmB82Z+Oyw/xsiPrbtbvQlXNxREjWOAXVfYaLlcWftWEf/aIFjQrn0TpS96PjWmiHD
	 wILlLimbl8sd7xFof48nIv8x1lR1KJX5a23PEVWGZwLGFD2/KO/OWCAh7B79J7hy9kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6YB9PjRjFo/PsltLBdgWYNBWcYtnhQJ5XwxF1KIhXpU=;
	b=kD7WDMjWHBQPCdeTURXoV3knMXmSsoW4YpTj/yoEO5fKkPRec/uh88eYEQBEcvBgydb2
	 Ivn2gtFyoIVe7xmoZw1aHKJwVue6F6vsg4BmvfYu2nW3/A8NBpj99pJaQaMrJswD74wNe
	 26cdfTuWayeIISTIiuZBB1dsMupMMcdn0J5BxaIthTuHGh+sS03jEdvVtavZg6YvWLQkd
	 +8tCnd48BD+3GWepT9uahUL49IvOfB8mg7RqYxt3Evvu+9aXDhxwcFcaV013A/hF9qmGm
	 AE7VBAs+wfybBguvBtQ5QsHmiGI6chN8whyZ2g3oFxgcAeV2LWtZxPexQ6JVyef/w/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MFzEkSYK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6M1qN48;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3C606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C3C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MFzEkSYK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6M1qN48
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9miQu3642180
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YB9PjRjFo/PsltLBdgWYNBWcYtnhQJ5XwxF1KIhXpU=; b=MFzEkSYKc5XIkTd+
	JovCieqwt97RXvVkxF1tR+AVPUyuJBLE+Y0s+8s0ujFWzyQYGIO++KdkTZ5eJ4GM
	+25a6sXObDL7rlArwaAl3qWw9Aj4zBJjGIgBdPLF7mc9rWfxqFf0cJCqiKwRIyEm
	ruLWtqJ70doDTHdsbsRZjI13HfFIh88pQej6hU7nFx+V4XJrKAooBDt/6cJvoEqH
	HZ7UhnTD78yvnTqVP9dzn2NyQhqiTyd1qzuimTPAJZIDbo6GfXn5CL0SrESP9DFS
	+Q6mgmXoVWyMR3mYdBsbuBkzt4DugBka7geXdp/dVtn+5/0w7ik+scxYvOXbzcWC
	4r5ysQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aqwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:04:22 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4fc2d32caso79680777b3.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608262; x=1796213062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YB9PjRjFo/PsltLBdgWYNBWcYtnhQJ5XwxF1KIhXpU=;
        b=X6M1qN484CNkcOdLcr64FWrpy3PMpyfo0/kK4U3z3QGUaf19YPY0xNn3RL8iHP2IxX
         copNmqhej0/zWo6zw+pen1l/2SsK+dnMpNjPUzoHm34Xm+tNgrEXmJiQCO7AA+5Pk9Zr
         TPtlaSNE+yEuyLZ2kT8ImPAmls8zPGi13RopCCwbF2nMLIykYclgKirng0WL5KJ1jfH2
         weOx2OlIjWvAaPeNNQ/Coyn1/b+O57py+Ogm8NybwqxX5XkLG+Lg4qBzDrJuL/Kw3Yx+
         1UXUm5tw+VH1sE0x+/ps7IeACXIgQdSKoXpz/UtCMIYS2WWWPDEMtOP85pZmtXDUIf/s
         h4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608262; x=1796213062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YB9PjRjFo/PsltLBdgWYNBWcYtnhQJ5XwxF1KIhXpU=;
        b=lTX55gOINFG+/Uj+GLRvyliT0vu7RhxW6jpI27zQoKUImBn6Drrnikp7hEwqOVLiuP
         bxjfUsD7KflSEBFLzY6eNrUdo2+ucjpvjTnqwifnVAle/NWfxRY73KSg56zIDnyY6wJR
         5BERbmAv0hjur0NSjr7RBH81nlVwa8uxXkoMD8VeyiOrJ8+ZL/9XnquJb5yH8VRIXEQs
         TFanVFiq8rDG+UdpOML1qJMVwqTqExFxM1X+GL7Lbf+WGJH5Eu1VG8BDfIO8zKFMSk4j
         3Jc69TLemxzKr9wykmNfYkWrAAHFWAugtwAfVSJ4yy+RY8UttWgQjhEOe9ZIOCmXSYkr
         PHoQ==
X-Gm-Message-State: APuU4Z9vgCwRM4cN72cqpTN+253EAVs+slGQUosxuanaMg3r/EIg22/c
	/SV2ZnCAAMFG3yDl6T9ZbG87234+wQQImaLeZ49Rg49VEHwmmMFh+QYpwAUR3A8BZ0e9yxMXCI+
	dWkH/iZNKgwKGxKF1YwSjmP0gbNNbGiQNEcu5EA+J2stus5MQLf/9lGQS1KGYyHe8bA==
X-Gm-Gg: AZFdTZfsYuK/R/zZw66aYchRm/sHt1j4+YtwbT0FXqAtoKgwiWxoyqFnrFCv9feILd9
	JuXsgnpKvSDDlaCAI0zsSmPjQTiX6LGDIxrWCF7ykLibaynPbbtL2W3KZ9cyF6y/fyGW0ik8F3a
	Y5tSKH+PMgjoB0JVuKodA2z3qMU2YG+wwWPLSV+ljaWNbxZzw6uqgDF2GrteHB8K8+/LotBFJ8i
	a/tsXdKCA2aznjdaKYwTXdK04JUF8ZdSvh8jVNuURfg7YYjA8CrTNuwXglrv7i4BpwiRTxmaEqI
	EUxpfMSpD/iGw4URUYF1czuX7f/hPaz1sdgW4yIhlRKFZ1ZNqHsVB6pkD9PykQkmdCemfp78VTy
	6ZNA/ihDNIMHw6L1V0Nb5A8Ue8Q9pvdKNKPVDh2jST8xsOtUt0ewwcm5OizsJUYPAMO6gLZdqZr
	dQr0/3tDAITj2LAA==
X-Received: by 2002:a05:690c:9b13:b0:8b3:47fd:a021 with SMTP id 00721157ae682-8b5204dd365mr67039877b3.75.1795608262211;
        Wed, 25 Nov 2026 04:04:22 -0800 (PST)
X-Received: by 2002:a05:690c:9b13:b0:8b3:47fd:a021 with SMTP id 00721157ae682-8b5204dd365mr67039707b3.75.1795608261591;
        Wed, 25 Nov 2026 04:04:21 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm27839382f8f.45.2026.11.25.04.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:04:20 -0800 (PST)
Message-ID: <8808df3f-e090-4dba-af7d-a51146290d48@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:04:18 +0200
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
Subject: Re: [PATCH v2 2/7] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06cec6 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JVzDNNKzvtpJFRE6LOoA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P7BZ6mJAMNs5VTWqbVjOZdW_hhTVCEU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXw0F+WqcbukfN
 EDIrwv674m9Gnor561T6F8nBOhLvbL/ctSYiAlJnNbpgW5tnbSvwANbPE9hYujY39/8kBZfoNow
 3NoOi9zkh4GOw8P8MM/VX8Y0WjKQT5eqaenmwH+xMtmwBPJt/YA0bZrVWPSYFbuSEr4Jr4/BFPZ
 iUJXNAEJlLk5UhaR4L85pF8npzWtzKPcXMKj86FeTtKtSkgOv21SjD92NDBXvvCu8AaHP5UnQFn
 nw65hLBD1vFFZu1bbHMfMDL5jJXwIXMXwXQmj8v/CJH+IlAD1Qy2Y/3gX7HUdQtjXi1/doClgRi
 IDEJc1CoJpwOFJM8IcS3P/9pv1L8pPHWEPWdMaOBpLCXnhDM2z2Ju+RDuTEcT/ZhtbqiunPBLG4
 Q5d/A0RoC9TZDiLZRKkBYFL47dojjwQdH87e9UxCTT9o7lb6IiC/KLdkhMEmc0rdmKlNOcdbBMd
 Ao1/HBiAQvIh2YmCMDA==
X-Proofpoint-ORIG-GUID: P7BZ6mJAMNs5VTWqbVjOZdW_hhTVCEU-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXze2J6hjzg5DU
 rjqCNbkznMICnfkwmzY+RM0k6B8fSVzR/Xct9B0351Xzug4DxR3LjZOTRhAFYa+/+uIxoZaFCyI
 bHlxE1AuQ6Dc6yA8zw5J8ZLsy3xYUfk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250047

Hi Loic,

On 11/25/2026 12:19 PM, Loic Poulain wrote:
> Modern CSID revisions latch the global timestamp counter at SOF. That
> counter is the ARM architected counter, so correlating it with
> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched value
> into the time the frame actually started, rather than the time the
> interrupt handler ran.
> 
> Add a hardware operation returning that counter value and do the
> correlation in one place, leaving a CSID revision with nothing to do but
> read its own registers. Revisions not implementing it keep being
> timestamped at queue time.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 72 ++++++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d01da58b4dd8a3a425cbc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -8,14 +8,17 @@
>   * Copyright (C) 2015-2018 Linaro Ltd.
>   */
>  #include <linux/clk.h>
> +#include <linux/clocksource_ids.h>
>  #include <linux/completion.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/timekeeping.h>
>  #include <media/media-entity.h>
>  #include <media/mipi-csi2.h>
>  #include <media/v4l2-device.h>
> @@ -37,6 +40,16 @@
>  
>  #define LANE_CFG_BITWIDTH 4
>  
> +/*
> + * The CSID latches the global timestamp counter on SOF. That counter is
> + * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
> + */
> +#define CSID_TIMESTAMP_WIDTH	56
> +#define CSID_TIMESTAMP_MASK	GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
> +#define CSID_TIMESTAMP_NS_MUL	10000	/* NSEC_PER_SEC / 19.2 MHz, reduced */
> +#define CSID_TIMESTAMP_NS_DIV	192
> +#define CSID_TIMESTAMP_MAX_AGE_NS	(2 * NSEC_PER_MSEC)
> +
>  #define MSM_CSID_NAME "msm_csid"
>  
>  const char * const csid_testgen_modes[] = {
> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
>  	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
>  }
>  
> +static u64 csid_timestamp_to_ns(u64 ticks)
> +{
> +	return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
> +}
> +
> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks)
> +{
> +	struct system_time_snapshot snap;
> +	u64 delta, delta_ns, now;
> +
> +	ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
> +
> +	/*
> +	 * Translating requires reading the counter the CSID latched from.
> +	 * If timekeeping is driven by something else there is nothing to
> +	 * correlate against, so let the caller fall back to IRQ time.
> +	 */
> +	if (!snap.valid || snap.cs_id != CSID_ARM_ARCH_COUNTER) {
> +		dev_warn_once(csid->camss->dev,
> +			      "CSID%u: Can't use hardware timestamp, invalid clock source (%d)\n",
> +			      csid->id, snap.cs_id);
> +		return 0;
> +	}
> +
> +	/* How long ago, in counter ticks, the timestamp was latched */
> +	delta = (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
> +	delta_ns = csid_timestamp_to_ns(delta);
> +	now = ktime_to_ns(snap.systime);
> +
> +	/* Fall back rather than reporting a nonsensical timestamp */
> +	if (delta_ns > now) {
> +		dev_warn_once(csid->camss->dev,
> +			      "CSID%u: SOF timestamp predates CLOCK_MONOTONIC, ignoring\n",
> +			      csid->id);
> +		return 0;
> +	}
> +
> +	if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
> +		dev_warn_ratelimited(csid->camss->dev,
> +				     "CSID%u: Too slow! SOF timestamp is %llu us old\n",
> +				     csid->id, delta_ns / NSEC_PER_USEC);
> +
> +	return now - delta_ns;
> +}
> +
> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
> +{
> +	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
> +
> +	if (!hw_ops->sof_ts)
> +		return 0;
> +
> +	return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, id));

I am not sure if we need to do this every SOF. Most probably the delta will
remain the same during the streaming, so I think it's best to use the delta within
tolerance and then apply that for the whole streaming session. Also, I think it's better
to have a constant delta from the monotonic clock rather than a fluctuating one.

~Gjorgji

> +}
> +
>  void csid_sof_event(struct csid_device *csid, unsigned int id)
>  {
> +	u64 ts = csid_hw_sof_ts(csid, id);
> +	struct timespec64 sof = ns_to_timespec64(ts);
>  	struct v4l2_event event = {
>  		.type = V4L2_EVENT_FRAME_SYNC,
>  		.u.frame_sync.frame_sequence =
>  			atomic_inc_return(&csid->sof_seq[id]),
> +		.timestamp.tv_sec = sof.tv_sec,
> +		.timestamp.tv_nsec = sof.tv_nsec,
>  	};
>  
>  	if (atomic_read(&csid->frame_sync_users))
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6abfcc3efe22178dcc2f2e7 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -111,6 +111,15 @@ struct csid_hw_ops {
>  	 */
>  	int (*reset)(struct csid_device *csid);
>  
> +	/*
> +	 * sof_ts - Read the counter value the hardware latched at SOF
> +	 * @csid: CSID device
> +	 * @id: CSID src-stream ID
> +	 *
> +	 * Return the raw counter value of the most recent SOF
> +	 */
> +	u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
> +
>  	/*
>  	 * src_pad_code - Pick an output/src format based on the input/sink format
>  	 * @csid: CSID device
> 

