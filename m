Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609767;
	b=fmBSGVMgtHKa2kmkHa1tzaBtLfvtDvcuBX2fm6/e5Sb5emTF76fp/DTdyIOZ9mm0eZF4
	 ScSqCMZC/RY88S1peGY812GsvzTQ4ZwSdg21id9CjrYLY+ZKsnkdWQQ5tfHz/40jBt9xS
	 qQo+rcfuyjxK+uZR/k6cMjyeIbZrGGx3n/W3jmL8zFideMbmE/NXMjoS/cRGREdV2keYS
	 jBHfcu7jAsdRtCkYadXF0n9HqKuOFhTPSVZr/ExuGmar1Mq4DX8Q9Uisa/yAappLMd7oU
	 BX1/02RmtCTmECOfCKp7H1Ve9pGQa4n/UoAkuTB4z7asYxRAdNw0Wc3shBA2HWo+itA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T5n9P9Rk3sw0uyrSlgak95rJRdejRe3OTzZ6wjZE9yM=;
	b=s/kKJDsnlRrdBHZkHh8BFS1qm3veW2z3dF+7LQ017COxrT3IJBpn+sMn4Jm8SnXAi8Wz
	 m/SMFzXoImB4cocXP5QYgkZNVf0Md9nYRXz8SA8D+DVL5uSeyjFfF4zKA8cQ0ijboVt8x
	 OWOOYPt4aM7nABAoTVAwC4PmBm+yOciLjqfQGoqm2a0nZJXgtnQ8hlaBIiLRmVKdWnBQQ
	 6ZHTIfH4PKuvQyPXRRRN6EHuwba+QGB6iyzxr7zybZ0ochFjfh/fpdS0KV3tDxQOUN3ui
	 16qBtOcLb55AZkSnkOXSnQcZsSHg5nAEmGYThkW1SsEcaJn7rWVPUGYZiolGv1QPGKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzYk3oav;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T04zh+K4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B32606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzYk3oav;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T04zh+K4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APC2519415966
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5n9P9Rk3sw0uyrSlgak95rJRdejRe3OTzZ6wjZE9yM=; b=DzYk3oav/XGIb1h4
	QiDlmQvm4HgUI5yT1Ux/rTqSMvDxeewckfrTHHcvGuXda7GElQK2GjTdqypPbVqJ
	uApOjh6sLUAdFHptLPZJR6WNbp6OHul5FkryLr4ZKe/AsJ10o/9pmpRYzl2/m7zG
	VXvVN3qm0gcZ6TIwh7e7lDxdoaeRxdUARIpmVxsSRKHb3T3bpDt5jYSZ0cvD2pT9
	lxDpOLUnD3WGnsdXU4O7MdXLuZXfNOfhdFBT/n/boRtKs73SRXdbG6NF5wC4FAwq
	IRUrVMKBsszC8XwE0VaHDSV1bFA3CgJlzeQQUes7Ciq3woaYQKd+7C89pFCpZPTS
	e8V5MA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxr3ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:29:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so384552385a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795609765; x=1796214565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5n9P9Rk3sw0uyrSlgak95rJRdejRe3OTzZ6wjZE9yM=;
        b=T04zh+K4/KwrpR5ZcUVldclJx+uJwwSqYBHO8GffKVKQOO2xzEt6AmPoC+SRPsC8bv
         44uJxPkesXX5xiEDqk+SrfEmyz5XP3AIX9mzuX6sbdodyajnxxpjS4PNEATKuK1qLmvC
         Zd1P82GG+T4gJk+KSP1z5Kcpm3RKMwa/WSjdz6MHkJpep0HTMbv47SHL9obIxCPAQ7oR
         CYbgWK5mbIiny7usbYsOhEPxUUJHTxSUYjIRc+NpgO+6dIpUwiJuR9QaQL6TsaIsGa6D
         qP69l83qrMG1mU9xRVszD8ABHZZ55wbiOaHncMf2eLFsqIWwLoDiWAu8YDDFrZmJKibN
         aHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609765; x=1796214565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5n9P9Rk3sw0uyrSlgak95rJRdejRe3OTzZ6wjZE9yM=;
        b=a6iB3/63N8yKiG34POCOyi/AnuAQHqOWUwccWxr2Ca0I6oZ3ZifbvYvJDaxkXvdhck
         RJK7zhfOcDR4sjAMc3KA32BO8Xouldg2ZqWPI0v/9xlsmq+4l6kIYH07YgwrjU52ho1y
         1KVJk+O0U3vXRVcyh8w7K0IGRu7ypFt6FA19qe4rch6NUZZmZBL5ej8ykx+fekIyMuRx
         R6MFnmOZF2LgpzgGX7B7EAHZvqkmbGMK8uy3GU8lvGBMDDTj0hqp+McS0AM0r5xK+lIF
         f95F3A/kF+TtAvX66HqQH/skldsIg3+9vfvYK+QBZCH7u8FwUoyz3CpvABBY3gphwuhD
         XRYg==
X-Gm-Message-State: APuU4Z/BJdQmptEN0naot2DLg9i1AYmH1EwowmythjvQFIOa/ox6ZO0w
	OItax3r9I9BFIAwJSsYM3gbceQKyJOMdhxBpwDU9QELjC/r6as9qGEGYGO75KF0G+IpqfaWQ+76
	4J3boY4+s4+2cjEOgB9abbI8Ik0knw4/6ETrytvsCpDSnNB2iMdN5O0eY5h99nOzmIw==
X-Gm-Gg: AZFdTZc2rSzcoHFpfY+qZoHjWflIiy58y25OHSnxjz9mjU/MSMf7exbFh/Qr7EeL1Sp
	rW2b2OAM8M9xFZ73/88TjapPqJtxrYw7exnNbmqZWoUv9hYgNTznPl4M1WL8ep+pCZAOds5nakK
	eJAqRLaSIv0BMtLJnN3ShMCl/1rkhlJh+crF+H140r8zIcuhVchzgTFvl2sVlL31luY5ZZN0LAm
	wP/6OVQgaLcwF1Igw3kVFKIaGoJRf1X+ICqXG7GnEIxynsHRdophKANg/aLirexIiaPg9Sqy3tj
	WyfBM8NKEDzD76xhMiRryxqzI8UG18pdP2EIVZhD4jcDlpaABmLKlcvbzVW4d+irHv49+Z/pyx6
	tXtxkRjrGbPIxOJfQYGj0jI7C+0M2ErGeZcAskxZykhw7kVfb/3PiMGder1/ZSlOJWb/X74nezN
	gbdqwqnRTudPlypQ==
X-Received: by 2002:a05:620a:4046:b0:949:6476:91df with SMTP id af79cd13be357-949ba9b395bmr3433141385a.27.1795609765515;
        Wed, 25 Nov 2026 04:29:25 -0800 (PST)
X-Received: by 2002:a05:620a:4046:b0:949:6476:91df with SMTP id af79cd13be357-949ba9b395bmr3433137785a.27.1795609765059;
        Wed, 25 Nov 2026 04:29:25 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm31886868f8f.34.2026.11.25.04.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:29:24 -0800 (PST)
Message-ID: <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:29:22 +0200
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
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: edHTrhWjrb7QxFxaY0YDVALojlKbmkEY
X-Proofpoint-ORIG-GUID: edHTrhWjrb7QxFxaY0YDVALojlKbmkEY
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b06d4a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=H5SKo5UfUjvo3ROSXWYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0OSBTYWx0ZWRfX+b35RjaJ3b/O
 F/dzehsu9Ls6Mohg84koOyzYeiGVb/VgDOWHqL3onA65eGV/4LB3zj68sQG7YuwzlkUoxz4mpnJ
 9uUGxZm0rucFZXbiXdDiAHLLIwOMLyvIUbn+aX16TuRWNX9DYuz082jzau+9V0wHOabvSu00iBS
 ib+675FAiX5TzFkp0JyLAAilSJ5N2pImDq8tj2+K9+qyKHgf90jX0QGUFWLMzV33sulaXTvnDwf
 MrTILVBnkChbGzOyp7400Ec39ibChOT0dfe38JdImKBjmZI4ZpSMOTxvVdRDp9macY628oMf0fD
 viskS07fBgQA6GGbLJK3AKrhfP21F1BbMgiaO3MRgDGdlSYw5zxRU2hQB5VQVR3vNJBV2Dun0UV
 PlsxnUhypHiEjtPJJW6qbUsHpQEm9VchCwuhpXCkPcjhKr2EPqMCdztkYxvOYREiCduOy3eenK7
 55rvzG2qpTTkIxj8oFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0OSBTYWx0ZWRfX0/o+e2kpd+6l
 iExWSW61QMp341U64myEDkr9QMtzO5rMkfa8VFPBVJvz5UXfZWRJv612BFGNs6Io4rdelmEiBc/
 xA5YwLptKlNbIlmgCKRdEp1PKVpS8vQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250049

Hello,

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

I think it makes sense to add an additional field for hardware-based timestamps.
Converting the timestamp to the monotonic time domain introduces precision loss,
so it's better to expose both to userspace and let userspace decide what to do with
them.

~Gjorgji

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

