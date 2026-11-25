Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608414;
	b=y0x2wM0nJps5qs6AZ3gqQQaKwR2idA6mFVMSlxQhtk9eUASVeUEZ3mArw6Caup4xZVZp
	 hvCa8ajwYa88hN43dLHhKsvqM/x+wohH21wsBoGE3p3yD2CHSnkocBSBCwFgbsY5G8bQU
	 t+dzabNZXAVhdp0WROmSP97ycRdRVphJ5+chFjg7U/5Aa2P1UY/8mfbFo1NY9XWjVM04D
	 7o5mF19qinP4iFCC2ARb9DqetFr9sozXrm1JyBSwtFiwv0irLAmQPr9o7Wz3bosyJcRPQ
	 H2Rs37m5JZ8qMiB2TZmN1TO4myo/8xKH8zQ7iu6R96GThp1A7yyvhgo4X52gBYIuJmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TZ75YOIfKBwTfslTITYUFFKUgc2Pnhr4Y8AL/Fs1ee4=;
	b=SYz02cKLDItpVQKNTY7YyyI9WxW6N9fYOKdHMNUeEsWu4fy3zxUPJ77Zu8SpECOy1Zt6
	 GaEtzs9yMebh/RZ0wOInNsrPvXEwnqAK11H1FZMrWLTl9EebCgz8+BT0SgGw8pUK5TYoV
	 fU1EC6CRRUwWndOtu4D3+jnw/MOdZi41F34zEe5I+YBM89ah8u4Iu7rLCUS9ew3oSxYPU
	 uScOEukDuW1KGdrS1ir3wQF2uhtKIMx7IIf/jhXWQzokoT+2Ev/lPYPlJ4sYGA1fKbeI6
	 HU/vkR9C4rjDGAtXO9yL+1JXKEAcKIk9skJP5wtx5ehf/idjsvAEcDBZ+0K3pLyMgig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KZvds5F0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Os8O7D9h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7EE606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F7EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KZvds5F0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Os8O7D9h
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mcT4796791
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZ75YOIfKBwTfslTITYUFFKUgc2Pnhr4Y8AL/Fs1ee4=; b=KZvds5F0Sf684Diq
	s5tfKvVhhtBUBPqyI+V4cfkdp5YdcxWyYF0x3JpWG5O5bFoL3ZdsPbx9MoeO/RVS
	hrmFxMfJ/Ds9vqOYBcuCml8s8SeWq1oJ/QhHGT58mYA6Qo//IGQTMjsKh+RpbNVo
	yHNBW+FRJn5ua7haVSIy2ZeE0DRJQFnr6n684kkot6BuhO/qDm36Kmz10ErZ80+T
	YhMaUtY22YGdpd9dAgH2nFEBDHm6B/os6p9lFYDFIf7pQDVnzaNTCwa6J1n4PbvP
	PUNnbgRZJC+5DDgvyacCwwRY7KWn7vENKZ9OyBvd6upDDxGREHnDU+tWJci53tLQ
	W01EWQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtk7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:06:52 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b37869f851so89834597b3.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608412; x=1796213212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZ75YOIfKBwTfslTITYUFFKUgc2Pnhr4Y8AL/Fs1ee4=;
        b=Os8O7D9htl9+7D5tVobjjSFACdvojtcLcQZpBy/1I/+aItzi5aqI7lcK5X8QwQ8y6y
         vw3t4aKLpItIFdoKhyYH4hDhwWFFTODPy+OsCpNqpTIJ7vu6gpGmxmeorPjkfPAcAsVl
         x70GNAd7z8YOm+DFPIp9LXEOQzEiOMYaQ5yDLAD4Sw1YpO7/0n5gnuL+bo1fsT6iA1cx
         0aK7+t5fa3C7tALjhJct6/4elQtefmas6k+i6NfQL6ppZFlO1z75TLBCIP1M3pJwstIi
         7VrJ4F3Bmqw768pr4B62P5tkqMdsde21GclgGej7Z6iDJIMmFXqeClVjVke1t0ndrFOE
         xDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608412; x=1796213212;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZ75YOIfKBwTfslTITYUFFKUgc2Pnhr4Y8AL/Fs1ee4=;
        b=0ySu66PdUHTRxlhdyniXPdyv/EWWr87Kzqga2+1RZgB7r4fp/peXh79oj14V9RXewS
         +E5kZ7MdtTECvC/szC6OiGSdIYsEzlj2tjULS+oSvewhRp2jO1kyjATu/+Vcr4pHRQxK
         oXOvKQQp1hidGOPaK8JTun135USouBS1JXUqfDAdaq7pXFsHlJP/PO67NCs/yqXLJtIc
         fWW862S1WCCF/IX9vD81opUfQ1oUK1UcfHmCjAhPH8rdETYH5zntdqf/E91jFX4iomXV
         8wBV+ma4HtjYPOSE6jj9WvFKHzGgJ3anzJxrp5r4905ez7R5whMZXeh7YAq9nXEuP30s
         umTw==
X-Gm-Message-State: APuU4Z9BEUtyCO3hfx78x44Qlw3WB7ZQ6/GWDk+igx36aYxdShVF4VMx
	CgEoBlFhJDfM65wUfJG8RFHv/xxKHJFcVmGu+F2mQHi5tiWSo4TFWltPSbVFCWdQbLcvUOc1dfE
	B/XcBLKs2Qg2n4qd7XQQ6t7Xq8lnPX8wwnhZwrOXaFDnD9TPSW59r4Bdsh9a10NR+Of5GSwVpTQ
	5P
X-Gm-Gg: AZFdTZdH6jc2EeOwTjYhRRJdGhrEeIIqZ1IcaIv72yWZsitnxCbSlG3yxkHlRVbBs1Q
	eku4Ja2ok83TW/nkwKjqt6byXpc57VK8C9Gg8v9VaU9MYiIVvVbjIcbsvqanoDkIvfk6VLPnLTO
	RyDRQjFNoX/MEVffHawkVVLJ84Hsak8f41uNzZYFTx/tGRrGIGbEmvujrlOJeQcfKNmbQH4HBnr
	Q7KuV5VgA/UUbh6aehjmDG6uLGRsGZuQ+Wvi9oheSfhddW5DJzb5fsAJKEEV5tuQaIOgPY3TX2h
	naR0iUqfElPoJRrFk8q38l9sBMYo7JkmDlEZx8+XKLEhdBzKS+CqJdhetR7bEOt7W0Hk2MAwJzi
	/Vl/JxAiHXzwWcjPw+6EbjbQGDBQdLBUNp6Ls86mQ4O6TQUpxr8Nqi807d0l7Lvgn1rEtk9/lYy
	hs57iHcRmntnoPPw==
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id 00721157ae682-8b520514f25mr60659887b3.63.1795608411766;
        Wed, 25 Nov 2026 04:06:51 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id 00721157ae682-8b520514f25mr60659807b3.63.1795608411223;
        Wed, 25 Nov 2026 04:06:51 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm34174138f8f.4.2026.11.25.04.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:06:50 -0800 (PST)
Message-ID: <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:06:49 +0200
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
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com>
 <8808df3f-e090-4dba-af7d-a51146290d48@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8808df3f-e090-4dba-af7d-a51146290d48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0OCBTYWx0ZWRfX8ExORXIvJfU/
 jEfrefsp5pvVcMP7UJ/qqs/xX9Wa0ZaTKM16hKmwDpGbW5HxggFnnBCAfQpT+I0xer72U0xGUJ8
 zi28L+4gvIv2sb+UIpQGqBY/U1o3Mtb6QhBzAJ/9C5Aokg2p0F6WduCJ4/Phu8fiSx38EOKMD8W
 lUrUPuuVWLyXnjZC/SeQTc8nzg1ywUGzAlYlJJLsPk056jg5+LiE9RMKFQJq5UsuEqBr9cJxYdR
 AcKFhnQ2Ww589Uo5XR1F0AmS3KKiuuMVPAr1yUeDf1L8x1OsnEiIIfjv8PzThxtzetJCFM71qSd
 aZjOFDBC8HYVkzhbkR/Ak7IESxbI5mr9juRc6V3HSO/dkWLDUrHWPDppX3/lR0KBvMzrqMKji45
 VgJtznIH2PaCwDfEUbGTI8i+F3gOKfI+aYxkCBcWT3RjCBv3QWpBeg/DdIetBACrlogSak0FlxZ
 0ellvRNxudmscLXeaPQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06cf5c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ozu270GxbeEhLzGUQ-kA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 23InEhUEqejIWYyDz6KA4rKnHKD2l2z-
X-Proofpoint-ORIG-GUID: 23InEhUEqejIWYyDz6KA4rKnHKD2l2z-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0OCBTYWx0ZWRfX5lppR9gKo40y
 9ZiUx0B/VFdfkerfUAX5Vgc6B/Hu4lwqHFQMDm0jfU38/wSL9ilABfxex8rKYMPvuRN8oOI+xQN
 Z6O+R1sxbo9qtphSyjXyru7i6SBZngA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250048



On 11/25/2026 2:04 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Loic,
> 
> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>> Modern CSID revisions latch the global timestamp counter at SOF. That
>> counter is the ARM architected counter, so correlating it with
>> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched value
>> into the time the frame actually started, rather than the time the
>> interrupt handler ran.
>>
>> Add a hardware operation returning that counter value and do the
>> correlation in one place, leaving a CSID revision with nothing to do but
>> read its own registers. Revisions not implementing it keep being
>> timestamped at queue time.
>>
>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/camss/camss-csid.c | 72 ++++++++++++++++++++++++++
>>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
>>  2 files changed, 81 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d01da58b4dd8a3a425cbc 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -8,14 +8,17 @@
>>   * Copyright (C) 2015-2018 Linaro Ltd.
>>   */
>>  #include <linux/clk.h>
>> +#include <linux/clocksource_ids.h>
>>  #include <linux/completion.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/io.h>
>>  #include <linux/kernel.h>
>> +#include <linux/math64.h>
>>  #include <linux/of.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/regulator/consumer.h>
>> +#include <linux/timekeeping.h>
>>  #include <media/media-entity.h>
>>  #include <media/mipi-csi2.h>
>>  #include <media/v4l2-device.h>
>> @@ -37,6 +40,16 @@
>>  
>>  #define LANE_CFG_BITWIDTH 4
>>  
>> +/*
>> + * The CSID latches the global timestamp counter on SOF. That counter is
>> + * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
>> + */
>> +#define CSID_TIMESTAMP_WIDTH	56
>> +#define CSID_TIMESTAMP_MASK	GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
>> +#define CSID_TIMESTAMP_NS_MUL	10000	/* NSEC_PER_SEC / 19.2 MHz, reduced */
>> +#define CSID_TIMESTAMP_NS_DIV	192
>> +#define CSID_TIMESTAMP_MAX_AGE_NS	(2 * NSEC_PER_MSEC)
>> +
>>  #define MSM_CSID_NAME "msm_csid"
>>  
>>  const char * const csid_testgen_modes[] = {
>> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
>>  	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
>>  }
>>  
>> +static u64 csid_timestamp_to_ns(u64 ticks)
>> +{
>> +	return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
>> +}
>> +
>> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks)
>> +{
>> +	struct system_time_snapshot snap;
>> +	u64 delta, delta_ns, now;
>> +
>> +	ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
>> +
>> +	/*
>> +	 * Translating requires reading the counter the CSID latched from.
>> +	 * If timekeeping is driven by something else there is nothing to
>> +	 * correlate against, so let the caller fall back to IRQ time.
>> +	 */
>> +	if (!snap.valid || snap.cs_id != CSID_ARM_ARCH_COUNTER) {
>> +		dev_warn_once(csid->camss->dev,
>> +			      "CSID%u: Can't use hardware timestamp, invalid clock source (%d)\n",
>> +			      csid->id, snap.cs_id);
>> +		return 0;
>> +	}
>> +
>> +	/* How long ago, in counter ticks, the timestamp was latched */
>> +	delta = (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
>> +	delta_ns = csid_timestamp_to_ns(delta);
>> +	now = ktime_to_ns(snap.systime);
>> +
>> +	/* Fall back rather than reporting a nonsensical timestamp */
>> +	if (delta_ns > now) {
>> +		dev_warn_once(csid->camss->dev,
>> +			      "CSID%u: SOF timestamp predates CLOCK_MONOTONIC, ignoring\n",
>> +			      csid->id);
>> +		return 0;
>> +	}
>> +
>> +	if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
>> +		dev_warn_ratelimited(csid->camss->dev,
>> +				     "CSID%u: Too slow! SOF timestamp is %llu us old\n",
>> +				     csid->id, delta_ns / NSEC_PER_USEC);
>> +
>> +	return now - delta_ns;
>> +}
>> +
>> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
>> +{
>> +	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
>> +
>> +	if (!hw_ops->sof_ts)
>> +		return 0;
>> +
>> +	return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, id));
> 
> I am not sure if we need to do this every SOF. Most probably the delta will
> remain the same during the streaming, so I think it's best to use the delta within
> tolerance and then apply that for the whole streaming session. Also, I think it's better
> to have a constant delta from the monotonic clock rather than a fluctuating one.

I think it will be the best to send both timestamps to userspace, and give the freedom
to userspace to decide by him self. But the API is not allowing that as discussed.

> 
> ~Gjorgji
> 
>> +}
>> +
>>  void csid_sof_event(struct csid_device *csid, unsigned int id)
>>  {
>> +	u64 ts = csid_hw_sof_ts(csid, id);
>> +	struct timespec64 sof = ns_to_timespec64(ts);
>>  	struct v4l2_event event = {
>>  		.type = V4L2_EVENT_FRAME_SYNC,
>>  		.u.frame_sync.frame_sequence =
>>  			atomic_inc_return(&csid->sof_seq[id]),
>> +		.timestamp.tv_sec = sof.tv_sec,
>> +		.timestamp.tv_nsec = sof.tv_nsec,
>>  	};
>>  
>>  	if (atomic_read(&csid->frame_sync_users))
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
>> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6abfcc3efe22178dcc2f2e7 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -111,6 +111,15 @@ struct csid_hw_ops {
>>  	 */
>>  	int (*reset)(struct csid_device *csid);
>>  
>> +	/*
>> +	 * sof_ts - Read the counter value the hardware latched at SOF
>> +	 * @csid: CSID device
>> +	 * @id: CSID src-stream ID
>> +	 *
>> +	 * Return the raw counter value of the most recent SOF
>> +	 */
>> +	u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
>> +
>>  	/*
>>  	 * src_pad_code - Pick an output/src format based on the input/sink format
>>  	 * @csid: CSID device
>>
> 

