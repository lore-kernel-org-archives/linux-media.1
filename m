Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676423;
	b=bEVj8KHZ65w7wMqb10SlzT5hYK0WEelG2XR+UXMmkgo1K552PQIVfh7cLW7I8/KzJjNd
	 xxCaoevD8I3rojPd1nJgBkZuZlA5VklgiNNg9gS6s/4Ur8UpenRB7BAcaCKyLvRIo94eg
	 NfzhIz4pq2Kz4OP1IkmG4i5WwzCyRf4KNNe83JIMY86Fx1pGtrbQtZA1tDSHBNOj+z2GF
	 Re7NAwS1gjvjIVAWNtOi+EJqH/EYD/GnX3y3wPuaruaJ/bVtGj7qSHFX7BlcFOXLGXv8/
	 bN7vPQrFD35DP7vyI5eL9YAbKE6m8b+UkzhOGr80ueLWXN8szxSpzK6NYcVJNU2YM1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NAGZI9h77fAEVJOMFwdusvDKaYM8J+TbnUlWkWl59RI=;
	b=knPe4DBIN18Y7FDFKynhdZs8tHa/88w2ta3uVEZoPYyRp8rFIEVnEvm/TCWqkvKEiu4G
	 ckHndqPzXA97BDM/zr5x7OKj5FgQs2f0WZAzLaakqioY6gOzGVkCMLfj+4sMYHrQeD/QX
	 6scCqowCMT1906Gk18mZEHnMQ6ziy/2d10TyhprrBP5fHxGlFSRo0on8mbofmhAMzycQA
	 +V+gCzbSr+7ml4c0vHJKIw0mZE/vWSrh+O8/KiAEAeH5II6aw6rrco6Kcnc2hTnIEPpGi
	 UEUO1VXvCrGtx9jaIurWzkG84clrK97xPrv+HvFKe672pgj8zQ6FPVcnI1EgXSw68og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQHE9ns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wf5eHh4x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A0606A32A
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930A0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQHE9ns;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wf5eHh4x
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36RJF1686572
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAGZI9h77fAEVJOMFwdusvDKaYM8J+TbnUlWkWl59RI=; b=jOQHE9nsO934AjXL
	6eI4s2hT3Ut9arcgad+qRKj3BXHkJVD6xsI1JUtqOs128cq/N4bQ8O4Jy/H+2O2t
	t+ZAsxHf6+tYOcPHJA6jDyPHYb9lo5Lv/EJlc46OHzRk/Zf9A/hqVc0iou+X+Bls
	YuNJ2Wuax9S7ba576miO0lwqI3nDRu/wCsknRXenidp3WnEXS6yfEpcw34PORZpX
	ccMONITFfJbFTkcXB+75vdirU/9umBwaA7oWgc9HopQiupKzkfXOvGPAa2v9hBF5
	K6BuTr834ZHhWs35WCOJgwxqTK9YsrF38H0SzE06VuROOCsgBBngS33wodVmZWuT
	qkLX/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9q32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:00:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so1012356585a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 23:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795676415; x=1796281215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAGZI9h77fAEVJOMFwdusvDKaYM8J+TbnUlWkWl59RI=;
        b=Wf5eHh4xkmMmBf7S2ekVF8nKLgHYoRSR89EvlKxilxqr2durEr6xZnD8lKVfdt2mX1
         +NkmcV/srVJ5uQsKEIElSKpdv96Pgcil31YRKsiS6SWqhQM26GTVrA0YxnUIH6jQhC1v
         3zqBdPgADHgdKytuphrn67n4lb/FDyX1RCg/yq3Qi6wkR+66MqwUpUcJkoMwb594e9CY
         l9iXfm9Tkgk+EaT5u0ffLkjFPRvcEmCNVLWJ+WtvTwbSlzfEkRe25rl6QHlneVsNv1ip
         kOHNWTI2IcdYKaYhA7y2SHPPXZH0XsCKbJ96EBt+cZuo+wqHEMCzQ5nkpyDMwebw7bLG
         kjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676415; x=1796281215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAGZI9h77fAEVJOMFwdusvDKaYM8J+TbnUlWkWl59RI=;
        b=TPWcovQeB7bcQcUWW6oyKLq2AkTU9Xp8Ax5F/6eUNsA+OhbHBlL55SE9ZT1MV4JAJk
         nIATAwkgxGepn2TqFwxEdt4t13A73kfxML3oMncczgulaaUsXPZ0Yzl3BrbfoCJApizV
         nj9IWl2gAGG8bLkAhOgd9b9jONR/Gv70a2IL7Z6Xb5BnOPiQD11S96PD0DCP3e1tSha8
         lkpzCd06T6oxRokZLc4uzYer73I4kSgALnM+2A7SA866I5S4kM7JzHVUKDjTpllsI0im
         YgR19YD3/tdRqmjAwwTzjn5vKRNARcH8JhYQWvg1u0w1xCOuZlnUYx5yMbJXOCyoq+QS
         h26A==
X-Gm-Message-State: APuU4Z9twp2brSbuUI45lRT2l2F5s2RGHytgWLUiI9cBkkcjL1pz5TNj
	uJAnfFU7pCaQncPydBv365nj9rZKP4hk1JzT70lfh0XlYi3d5sHnNZUKvw6GR/B+raDonDq/fas
	niwTDJfFdBBl1kDQoSvI3KyiIb231YoXu/LYK+oxVfuegAObQzXHE8Idt1ejSL9sGug==
X-Gm-Gg: AZFdTZfNzh9CASv914Ic6PrlBjumAhHPm1bRga0c5Bj/+NG2Wk4chfPdJp/eNPuGyQx
	9tquU+B0YZOixA0em5Ye2qqGGXsjw3vGuMRKTvP4Xy9y4cRNHVFYnUH7vKyn35fPTwigA102zYD
	GXx0MXp5Nw+waBGtkV/I3Iuq1phX8nPIG6++/aXBUsVSFAu639oMGmGwyKnx/2Rc2KxtdzGIw7/
	FCqtsBlEM8q+bBZ+Fr5Kq2D80AZ4l6rPWO3tImpFiYlX4AXJ1WDWgVb5CybG9axr+kicZ8KHK1F
	9qTej2U8/5T6tI0bjrwjdURe9bZZqR84wgVlKeECdaYGPG6ySMCZE5uCss2Nag9Z2Johp5C6qT/
	k9dbKxfgwcZM+65xsguImKnFQVNJhaYQOmnbCSuDIs4okwc9Lz1QTJ1ZVTwdaLfCVvazocF4FGQ
	w=
X-Received: by 2002:a05:620a:8802:b0:945:b967:475f with SMTP id af79cd13be357-949ba956648mr3487517385a.16.1795676414307;
        Wed, 25 Nov 2026 23:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:8802:b0:945:b967:475f with SMTP id af79cd13be357-949ba956648mr3487505985a.16.1795676413443;
        Wed, 25 Nov 2026 23:00:13 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm794422335e9.13.2026.11.25.23.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:00:12 -0800 (PST)
Message-ID: <9b858d24-f783-44e5-a7e6-85b59e054f37@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:00:11 +0200
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
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gCObRQQIFHEro8EOa2KP1aBhzNt1bHA-
X-Proofpoint-GUID: gCObRQQIFHEro8EOa2KP1aBhzNt1bHA-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX2IVcduJ3TBbs
 6Qqq6qdGw2dnHDNVf3VtYjQA9Yl3Oymi9GZeFycsLXxrkBXp+DRFxh2Avy2fdMLHvIMuJNgRdzV
 e2h7hleWNZdyzY24hcn+VA/lTcOq0k4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX2vir1VfkdBkf
 zZehTlR0dXblR1tOT8uinjhYu0NDhuxCT1Bw46s9J4Ha3ICU04nKwWueBPkfwynb/AoUk33gWMY
 Ya8ePsUWx4poZ8V4Am+QE+jO9xlODDziTtzOxUhAby4IacSwWuz85fbda8c1+0gWrj3OSmjzQZt
 QHApaPWNO0O88Ce/N/0gqB3Q8aszIeuIMhGEOzVmR0ilWLW3N74HVVSTJnA0Hsm6kIgTu6YR26P
 e05yTSIBSLTsll/q9ppDYD8F6BjakAKJ+9xApm3XC3H+hFVYEbTXLq0J2Z4/CN9vHTrutI9cemZ
 QDtRPr5RqRS2TtSXllurCfUuFxkuC+agYABuPtr5h1KbTRKJ63u3WxelkWHBokgmIVTR3LwqOWl
 hm29ZcBOmGp9BDeKGxR9abxRXSjAKNgK8iMKzFjGrBwprntdD7sopDWiMJeqMn6+VgriUiIHdJ/
 LCkuDzw9oBBxZ1PEeDQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07d900 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=H5SKo5UfUjvo3ROSXWYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260026

Hi Loic,

Apart from hw timestamp propagation some other comments.

On 11/25/2026 12:19 PM, Loic Poulain wrote:
> The timestamp reported to userspace for a V4L2 event is taken when the
> event is queued, which for an event signalling a hardware occurrence is
> only as good as the latency between the two. A CSI decoder able to latch
> the start-of-frame against the system counter knows that time to within a
> few microseconds, whereas the interrupt handler that gets to queue the
> event can be hundreds of microseconds late and is not consistent about
> it.
> 
> Take the timestamp from the event when the driver filled it in, falling
> back to the current time when the field is cleared. Drivers have had no
> reason to set it so far, and every in-tree caller either uses a
> designated initialiser or memsets the event, so the field reads as zero
> everywhere today.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>  include/media/v4l2-event.h           |  9 ++++++++-
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
> --- a/drivers/media/v4l2-core/v4l2-event.c
> +++ b/drivers/media/v4l2-core/v4l2-event.c
> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>  	wake_up_all(&fh->wait);
>  }
>  
> +/*
> + * Hardware able to timestamp the event itself reports that time in the event,
> + * which is more accurate than the moment the driver gets to queue it. Fall
> + * back to the current time for the drivers that leave the field cleared.
> + */
> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> +{
> +	struct timespec64 ts = {
> +		.tv_sec = ev->timestamp.tv_sec,
> +		.tv_nsec = ev->timestamp.tv_nsec,
> +	};
> +	u64 ns = timespec64_to_ns(&ts);
> +
> +	return ns ? ns : ktime_get_ns();
> +}
> +
>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>  {
>  	struct v4l2_fh *fh;
> @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>  	if (vdev == NULL)
>  		return;
>  
> -	ts = ktime_get_ns();
> +	ts = v4l2_event_ts(ev);

The documentation states that:
 
"In order to queue events to video device, drivers should call:

v4l2_event_queue (vdev, ev)

The driver’s only responsibility is to fill in the type and the data fields. 
The other fields will be filled in by V4L2. All other fields are filled from the v4l2. "

So here we are changing the driver-api. I am sure that there are drivers
which does not set initialize the whole event struct. This will introduce new bugs with
some uninitiated data send to userspace as timestamp.

~Gjorgji

>  
>  	spin_lock_irqsave(&vdev->fh_lock, flags);
>  
> @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev)
>  {
>  	unsigned long flags;
> -	u64 ts = ktime_get_ns();
> +	u64 ts = v4l2_event_ts(ev);
>  
>  	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
>  	__v4l2_event_queue_fh(fh, ev, ts);
> diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
> index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c60344e5ea73a698352134 100644
> --- a/include/media/v4l2-event.h
> +++ b/include/media/v4l2-event.h
> @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
>   * .. note::
>   *    The driver's only responsibility is to fill in the type and the data
>   *    fields. The other fields will be filled in by V4L2.
> + *
> + *    Drivers whose hardware timestamps the event more accurately than the
> + *    moment the driver gets to handle it may also fill in the timestamp
> + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, so such
> + *    drivers must zero-initialize the whole &struct v4l2_event.
>   */
>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>  
> @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>   *
>   * .. note::
>   *    The driver's only responsibility is to fill in the type and the data
> - *    fields. The other fields will be filled in by V4L2.
> + *    fields. The other fields will be filled in by V4L2. As for
> + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
> + *    CLOCK_MONOTONIC time of the event.
>   */
>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
>  
> 

