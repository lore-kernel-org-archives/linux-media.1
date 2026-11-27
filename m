Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782538;
	b=gKob9mUdrVpVEH2kUw4+NTEYxIgkjRsUKI19NctS+IGmubJnYy7ZVXcKIKwlJgHqIVF/
	 RcU3Pm8ZDTW/lGZFZWrrRATGnHjSrXVob5TrA/Affdvk2k14psoe0jgN4UBpZg3t/ZdAt
	 sb/gENQ7cI0v1Naiwj7l2a5t9Yma6LBLNFnq6CUYHwmJC/N10hLv4GdkvmtSOZZN3gRFr
	 Nk2bAW/+RMIhikkCPrvVG3chP8hpJk3gAQoaVsw4kp5OIlp+zAh2xZRG3hUdPbJsqYZgV
	 Nqlg/bHLh33BgdcZSi5YlZk/bOlebN2k+CZOA/RZ90v6sREk1EkLd3ixQt8jvXWY7AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3iHq8357jseZEPfEyY2Z08chWi95v8Y1kHGpmZ69UH8=;
	b=gCXe+h3grGLnNC5RmfhdSq8+CWqAZOUc66f7MlTKFgCnWzcBf9oiSoZ6NuwQ0GxLQxrx
	 v9PHM+8gux//aj649/KBznNDXxmQ+1X76op0ChHyNDB/9r5FcyUa7eI+gRW/oGqgTEgUb
	 r194Gf6zagtWkmS+rY+jQ+4TFwJugg5+D1cQ/kef2jiD3Z0ZFZ+vH9W0d6N38oLStxv+A
	 6wGG5xbl8q+8sYDS41ZhODXR5Js1crj8kJ6tR+43Ptjbkbbhs8LNliM2++LHws19y8Nyb
	 w+7Y2SrcGNlojuP1GYsINGo1wGZYuucAXphCvoVliU7wORx2qLOJWT78zks4v6wRdyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iseZnTaF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8MLt8mJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16EE606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iseZnTaF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8MLt8mJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsNdP3610402
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3iHq8357jseZEPfEyY2Z08chWi95v8Y1kHGpmZ69UH8=; b=iseZnTaFgCFpXMMw
	ec54HP9LDjwx4J65rptPmYVSvR9ZcDicWkOail3UnLs0byHjKYWMNo1GFxsXMMaT
	AAsG1do/JGmeBEBCBMETqd0rhVBErVyd3aUJADH0blpW0W+mOJYvmWtJpQrsP7yQ
	3B/VgyhcB6JI86zaF3nys3t5LqLc/3ygda+RvP3K4DnRHmHIhN6Mxf+mJfy2FXIq
	a6o/ZmXfdS0TriFMKF6Z64/acVmkRUOyMgXtaHa+CVseJKoBS7qsdwfBSNVRo8pR
	laT65WJvAbSB9odsyCvwEcSfISbtiCw3URmyrXkSfyvoDXX8g3h8+m8KsxAvmQ6k
	JdpzLw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9m45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:28:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so4806038c88.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782536; x=1796387336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iHq8357jseZEPfEyY2Z08chWi95v8Y1kHGpmZ69UH8=;
        b=f8MLt8mJyN60VZe8SegpvDgixQ+Sa8aSForsvT8pcM1Mkf9XPp5GD6L5aj2byoJoFC
         tbP0+ZjkKUI30Iu6+xQPKGb8d8AmP/NKivCqYBi0LbxYrpi5WKCAdf1JaRriwNKk1fFb
         HRp4/8ZHJGEgxNYFV/xUBWrL2Hzebi/bA6jMsUp1U52q47nCd9A4txLKqjMGxKj7ri1P
         W/5hlcKlo4g+Z3HMEL1KedFg/wP3ldSx2/n5Fzcdt3W35/LGG90sm+qv/634fqc+zHuj
         yE+TrnfAflMBHEG5Ol0odR81Z9m1Z9Aln6oXaqGug0xSJ+LUSw8RUrwV/0Knde9gs8Uc
         9pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782536; x=1796387336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3iHq8357jseZEPfEyY2Z08chWi95v8Y1kHGpmZ69UH8=;
        b=rcdMae8NwcxJN/H5OVObZkVxyfFDz0wnBPeozy3zz9EBWnkWDebt2b7DgablPac4eG
         yJ6JVi86PShGlz2VV37WRzdCPD+uGcm6D5fkOK6OU9kRqqNBVU4BuCc5uCapS+1GHXzv
         5Wf0Ho+wAIwPDMk0Ykh9lRL9nNm29aeWrLgk3X4Z11PDrGk0SpZAZfcsm6u9ymMLkN+/
         MUgP6tWL1IaXx+T8K8FHXuLWm3QQobhYNPQTguY/hdefsWXJ9suw33w4SjFSIAKkJeKj
         icCA8rr+7c0aGF/NNJGxtF513he7G3xtUEQpdotXqibvfEzykkmaw/Vw9wsUHQlRafvU
         BvVQ==
X-Gm-Message-State: APuU4Z9tIxrvCYw0n4xI8FFudzCOKBXpt6LsuuAfiJegUpmeVX6SKfm4
	434MGuqKizkeOrSoAEU9h2vD+LVkK7KJYBcTSGPlIxDhAnCY21Sq4iUYfqUBP4yCwK/s/7qK/1+
	npcvOsTlnMYmlpVGCOls5EOr09qfwGi07ILjMrQNOqkKJHOm1UxIKI5j2fdYoyRLEHQ==
X-Gm-Gg: AZFdTZel8i6JcLSdqqjnKhVIGDbzK3EjarOgezXVeReIIvUnhu6NWM7tToeTvcSJlw4
	PFMxzdNCDdHR60+S6K54Mn1j+fuYpTrIe7DDlK8+pzuEYqBEb5aMD7CGlj8/jNzw5eNLYEgi3aV
	mYsatrmWd4y9+Acbi/cAgE/7mlwIfOxmJ+B3B2eexdbTeTgEo376sK8vxKz1h5fEEf2avodwf04
	o2AYqtKKpzzr+PQTbJETGyCL5DRzJhzH5lUNFXH36PwPfYdoiQEOHguC5vg9un3O8m2nZahkLzK
	CqtpHP0//uM+RQsG6dpX4SN0t/NjOUQQrDjn28IvZABzMnPRZgRdNHlvpLZC+nBFgoQHlbhLIoc
	Q/+vdY9ewgIvkCnO2nRepOpCqyV5Md1To8DdfM3eHsKzwh28DQRU95rbQGSniaiEr0Eo8niHSVo
	7NQgRZ
X-Received: by 2002:a05:7022:ec17:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b55689ad7amr31111911c88.18.1795782535471;
        Fri, 27 Nov 2026 04:28:55 -0800 (PST)
X-Received: by 2002:a05:7022:ec17:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b55689ad7amr31111888c88.18.1795782534930;
        Fri, 27 Nov 2026 04:28:54 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm68351064c88.5.2026.11.27.04.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:28:54 -0800 (PST)
Message-ID: <704a4e68-ee5f-4ed3-a975-49c0b131d6b2@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:58:48 +0530
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
Subject: Re: [PATCH v3 3/4] media: iris: Fix use-after-free on unbind with
 open sessions
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
 <20261119-iris-handle-unbind-v3-3-52d467a13907@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-3-52d467a13907@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX9D2wTu5ChHRN
 r/JUl/UM0GXZIJby8crElTBft4hE+5U7pcXXeADEayS3Awvqq6dbsPx89/vMRt3QzapeADANvo1
 WmFAJx67MgxEeZyYOznUzHHk5USFWwHjB+eQp54mu2ecf7tN0zRzazISnreDygxrSreuTsz4VOF
 hM1e+lHzxd5lGXMhlqpOLzQIfHqV+jHLXtm8DgF+sx8yos22rM8QHLiBZo2deiUd5fjOJX1zjvF
 /DJcpIrEVo3PY4JVrU+Rk3xHknYBZgGW328Cmm5TKX6oqbxljcwPsrdhv55z+co+CLYVIp6sT3R
 P1iLL33O86BY/FCeEWShPIOPhU0P3qRH+ZuJVzGgQOxG3pGaP+ETj8NZ2uNpXnb7VIsHuyEXODI
 wIF4EgTllXuXJnvO0zh/OhLwnFALecOIDWRxAlLsZ9r1c6Dx9N2EPswZ5dhrHerDmqVDlZtskhb
 alUxeeUKNFQ3sHa5cSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX+hm0Rqc+Nw0R
 jxJdim7hZsezU74oF8z3WsSpvwj0rz/GKpz5zl8cMRtK2ywevQnw4eonuYLZO9vXm9l9EdBIbUu
 sjlPW8hffg488pYMWOfUeh7qN3tPz9k=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b097788 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g8Q9F2srHmfhVmvwUhAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: GFtNrefNn8spKSyuN73kmkPqyqsj4Es0
X-Proofpoint-ORIG-GUID: GFtNrefNn8spKSyuN73kmkPqyqsj4Es0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270049


On 11/19/2026 5:15 PM, Vishnu Reddy wrote:
> The driver can be unbound through sysfs while a client has a video
> session open. The core is devm allocated and freed when remove()
> returns, so the open sessions then use freed memory.
> 
> Only the core structure needs to outlive remove(), because it is the
> only thing the file operations of an open session still use. Allocate
> it with kzalloc and tie it to the reference count of its v4l2_device,
> which every registered video device holds. It is freed when the last
> file descriptor is closed. The other devm resources (register mapping,
> response packet, clocks, power domains, interconnects) are only used by
> the power on/off sequence, the clock and bandwidth votes and the
> interrupt handler. All of them are released with the unbind, after the
> core is shut down.
> 
> To make sure nothing uses them afterwards, set a removing flag at the
> start of iris_remove(). It makes core init, new sessions, command
> writes and the clock and interconnect votes fail with -ENODEV, so a
> client still holding a file descriptor cannot power the hardware on or
> vote for resources that are gone. A client waiting for the firmware
> only times out and returns an error without touching them. Runtime PM
> is also disabled explicitly in iris_remove() instead of with devm,
> because its callbacks use the core.
> 
> Callers that hold a runtime PM reference, such as iris_open(),
> iris_hfi_queue_cmd_write() and iris_scale_power(), can still be running
> when remove() starts, as video_unregister_device() does not wait for
> them. Take an rw_semaphore for read around the reference and wait for
> it in iris_remove(), so that the references are dropped before runtime
> PM is disabled and the unbind releases the resources of the device.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Reported-by: sashiko-bot<sashiko-bot@kernel.org>
> Closes:https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c      |  5 +++
>   drivers/media/platform/qcom/iris/iris_core.h      |  4 ++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 18 ++++++++-
>   drivers/media/platform/qcom/iris/iris_power.c     | 24 +++++++++++-
>   drivers/media/platform/qcom/iris/iris_probe.c     | 48 ++++++++++++++++++-----
>   drivers/media/platform/qcom/iris/iris_vidc.c      | 15 ++++++-
>   6 files changed, 102 insertions(+), 12 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

