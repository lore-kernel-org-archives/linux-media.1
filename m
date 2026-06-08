Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9CF146A66
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897111; cv=none; b=LkoUg5Il7bGhS5WFiRB7QliF+/+n8pi6OZL1Wlqh51jkudpKA7eMHnXjJokvWG7XcWa0c6nNkLSymTpdjgSEu5ewpONJBnRE+7E1+6akSsmJScUvce0GTEgX+Ltc/CnFrJCiHnHQDAPytlbLpfxz4Hpy30i63hCaGzs0I1K+5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897111; c=relaxed/simple;
	bh=BppOv9GzsS/Jn7Nr8+oKKCF7ShPsa0n5I9VSa+nm0lw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NfScpr+sgP0YS2NrOipq1exntVBCGaW13gHPceHHnCoqFmDyZzyriKXYmaK/ObinguthKBa0XKmEARdISAI2IRi2/CNGOK7EYhS9Prtso3Aus7XK/R2IO47c6yqxrjMv3w8LDTI/coTLmZa1k6QSFjmetmhEKY0T5r5lgDve2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgugIydG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pit1Oo+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgugIydG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pit1Oo+r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EggZ1572542
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=; b=XgugIydGheKBpvu2
	ofJnJVr7zPdeE7ys17kDktT4XjStr5uSiH6diK76tDaI+GMKn581gDKl92p6lB52
	IReTCDwhBPnuwc/z6QXLesFXlwdtb4P9uQJFV475cffYhqnX5T/YI/WZBWq+w4zo
	yJwAWkK1najdvB97BrlTBmWuYz+Z0Ze+p678PMdQ9oEFBdFrJ6A0tQ1GKp+Gd0qS
	pHGJO3AMXMACVPNuhu0nvWntKBP47TOsxxjfrutTI2ClOD5RO/prCdS7Msf7iS/2
	V3Zx8dYBcr/RZvRPzgJUJs0Wxj+sjbvu+ZvENd/XQcYVFh5lfsHoH4ihWw0krchl
	Cwlo9A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8wrqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:38:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b74447so2955303a91.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897109; x=1781501909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=;
        b=Pit1Oo+ryOtHRk5QnSKiotcP7BoH38VI/V0Dw5G/1Cj+zZ0XY1EWRFueXjX5c01zfO
         8/kKSaVdI1TMKIG3YC+M9h3kT5m/kHZRqyO9+SGjW0DQCnwpblwJ0tvPZP5qA2Idb31b
         /GoJO/9UqECXOPLs3U8DH9XjizXfAQF3I7gfg+1qzog+OESB6IC0NN03gc30Db5pCWNF
         IuB8MlwAxxWcNpb5vfUn6X1A2qdJLL0HZr5mJv6W6HZob++oUDo2b5bWtLrOAK+eaDhH
         CVENhFEagZdpmLxPzd/l8oMeUWydHf+dpvE5NaXezGrlA18Eon/FJIDn/rKdW1ZwFRUV
         JTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897109; x=1781501909;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=;
        b=rxmhzfhHs19vdtrFFrweudnlFDWvD192LzW7uIqRo9Hp2nLI9cTXx7Z4UFtZp/5Qz/
         pb92w8vypq3D18GRbONfx0/mmx3DIPwbWypr3RvPkM5GLUowrxXVjf/izRgU4TAD4qPY
         vH5HAV52eir29W2AwNBKJpcFcs+DOT5Vl42ZIwdfbHKGEMLRB+Si1v2aST4uuZUjVLnH
         LMgQvF34BRcx2MWSGwATA19Ob1bxdk3M8lKM+OgYaK3SqA/7muunKFh9AUGcnMD/33KV
         /FlXtbQwhlFgQpUwa6sHVPswut0WZdXzRnz3egWBwD8wQTpt8B7l5PUkmpkldoPnK23a
         AsLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1KOJ0aMHxAPVuYuFy5xsDLoihBbwMqrE47lDdtPDaR6S6WBB4Sihtg7TrDmTXOj0DU0ncsT11p/d6Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRD80FOrzK1E5575N1g902StPx0/tujlkdmxdqLPng+72tVzZE
	HEtjxfpdxp5tmqd9563vI+s73z7DFHFkmrEOBk/Pe9H8zk+xRi7e5FNbARLQVMosL3QjWUgDeSb
	jr0g0E+RnqCscW82YjJkeowxa5/2kwXOSVQ2eyakLqGFnlijHSq5WjpmHmlhFhjR5wm9K7R8aOQ
	==
X-Gm-Gg: Acq92OFYFmiFKREf9w49rurHJLCfIHoiy4CmLy7obcHY5wqv0LS8Er5bETm71tL7qFb
	lF/bWfKBLLYsV9Z9r4q4UV/zDQyW4vwC68ugR9tV3XsOf+NeiHkbCwhXuT7iZVbwwtvWsWsitpX
	6KbcBez+8KD5L2R3EBV/kzIlv+cAIlcVF5jN21qBssb1mvfK9KqFMuNr2wt10bNuUbb5s5MNwxl
	CXGAI9HDMV21uQD6Poc0vtzoa/aceTwb6G5UduJMv1u6u4XpaA43OXxZAHbaSSU6qRq9cn6PiVQ
	cnRNR0cv95gGG0aYsSie4xfGSngm5/1ConBjbWsvCFpuUl/yTsFlDTqALnqqiPC0MoaBnkqPHLg
	8VgKpHntmCgVtRGuzOvWctt2YIyYdNe88mLy5YUPXJ5VWcmE0bU7gl2MJyF4DxVXA
X-Received: by 2002:a17:90b:54d0:b0:36e:2106:dedc with SMTP id 98e67ed59e1d1-370f0c5060fmr13843868a91.22.1780897109094;
        Sun, 07 Jun 2026 22:38:29 -0700 (PDT)
X-Received: by 2002:a17:90b:54d0:b0:36e:2106:dedc with SMTP id 98e67ed59e1d1-370f0c5060fmr13843847a91.22.1780897108663;
        Sun, 07 Jun 2026 22:38:28 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm17548029a91.1.2026.06.07.22.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:28 -0700 (PDT)
Message-ID: <4f775a8a-ae97-53e8-f8f1-8b37e200911b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] media: iris: Add context bank hooks for platform
 specific initialization
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-4-afaa55d11fe0@oss.qualcomm.com>
 <20260603143600.87F901F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143600.87F901F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UMYh2icyJoMFCIC4M2-qfqoTYXTAcj90
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a265555 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FEqDrzKljyI82_xno7EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX0gcDrc3Qu5US
 Nh1m1XMs0GFtMBgSqIp8FjX5tnyEGlrAGjKMnud4UBqT6pZSkYK8q7SNiZmUdZ0yTIMhRjlT63H
 5FWe74ToqAzq6TCoXVWKvoP4sps/BG0zGLN2xZCKNcn0aFphXP8ZDD7Mf7j6g8AfzVO5kRKQKzo
 jI4mgkH+LOXdm5caeTmuWxrLpLbDkI0HlDlhGF3SZ6y3zUkE2SfkRtu42PlIj0Enl0RlZlx2cMD
 rWKDJw7caYGi7C+ccW55O/pP3gscAyhW3NpL8zivql7Oik7B6ND5nS/vJO1dzF/Ey9/wM1DdeeN
 IYSBxj3qyBtbUhQa1ZauikZFgvjslv3mSgFYCb+SFRYnTsJjzSGwjR3++/mGltXwBU2K1Aqel5e
 rXhA3Kh681QTqKfzNhYbNCRWYo+EUrbte1zvFfWBvLkW2s5GQFEJRr1IqJsaRthp8id7iu6j/rL
 vhpWCvdU0Srfvza+UOg==
X-Proofpoint-GUID: UMYh2icyJoMFCIC4M2-qfqoTYXTAcj90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/3/2026 8:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Concurrent calls to `iris_core_init` can bypass hardware initialization and use uninitialized hardware.
> - [High] Failure during `iris_wait_for_system_response` leaves hardware initialized and memory allocated without cleanup, leading to permanent DMA memory leaks on subsequent opens.
> --
>
> commit 378c8a359d3ed3242ace4eba3b25ac54fcc682b5
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
>     media: iris: Add context bank hooks for platform specific initialization
>
> This patch adds initialization and de-initialization hooks for platform-specific
> context bank devices. These hooks are required for the glymur platform where
> Linux runs as the hypervisor and the driver must manually manage the firmware
> IOMMU mapping.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
>> index 52bf56e517f91..89dbe9bbf6b0a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> [ ... ]
>> @@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
>>  
>>  	core->state = IRIS_CORE_INIT;
> [Severity: High]
> This is a pre-existing issue, but does setting the state to IRIS_CORE_INIT
> here before initialization completes create a concurrency flaw?
>
> If a second thread calls iris_core_init() while the first thread unlocks
> core->lock and waits for the system response:
>
> drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
>     ...
> 	mutex_unlock(&core->lock);
>
> 	return iris_wait_for_system_response(core);
> }
>
> The second thread would see core->state == IRIS_CORE_INIT and return 0
> immediately, bypassing hardware initialization and allowing user-space to
> issue ioctls before the hardware finishes booting.
>
> Can this cause firmware crashes or unhandled hardware states?

It's not introduced in this patch and it's pre-existing issue.
Will taken up as a separate post.

>>  
>> -	ret = iris_hfi_queues_init(core);
>> +	ret = iris_init_cb_devs(core);
>>  	if (ret)
>>  		goto error;
>>  
>> +	ret = iris_hfi_queues_init(core);
>> +	if (ret)
>> +		goto error_deinit_cb_devs;
>> +
>>  	ret = iris_vpu_power_on(core);
>>  	if (ret)
>>  		goto error_queue_deinit;
> [ ... ]
>> @@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
>>  	iris_vpu_power_off(core);
>>  error_queue_deinit:
>>  	iris_hfi_queues_deinit(core);
>> +error_deinit_cb_devs:
>> +	iris_deinit_cb_devs(core);
>>  error:
>>  	core->state = IRIS_CORE_DEINIT;
> [Severity: High]
> This isn't a bug introduced by this patch, but if
> iris_wait_for_system_response() times out, it sets
> core->state = IRIS_CORE_ERROR and returns -ETIMEDOUT. Since the VFS release
> is never called on an open failure, the queues and the newly added context
> bank devices remain allocated.
>
> When a second open() attempt calls iris_core_init(), it sees the ERROR state
> and jumps to the error label:
>
> drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
>     ...
> 	} else if (core->state == IRIS_CORE_ERROR) {
> 		ret = -EINVAL;
> 		goto error;
> 	}
>     ...
> }
>
> At the error label, the state is simply reset to DEINIT without freeing any
> previously allocated resources like queues or cb_devs. A third open() attempt
> will see the DEINIT state and proceed with a full initialization, allocating
> new DMA memory and overwriting the old pointers.
>
> Does this permanently leak the previously allocated resources?

It's not introduced in this patch and it's pre-existing issue.
Will taken up as a separate post.

>>  exit:
