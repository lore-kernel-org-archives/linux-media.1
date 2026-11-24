Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514384;
	b=t3IfWemjH/IgmMt1UvMLJS7G3AACki9DTimFasWYFydKAutU+FxzupNc7VCC4cBnDI7k
	 UZPclPCpzdC9c2q+/zHLQHogKL4qRezgvgezP0LK+I2jx/XQSyZJLTeSE1ObJ4zdohDGJ
	 XUPCHxyTufUSxovv6mWIW9LIGrG0JzIg254JD8hvT84l9ETgFgmB+q0VDcEOUQXhApLIO
	 DT6+iRxTpojzgVUGYKFXEvgyg/+bWCYOGsN5fBg6ahdWbRJPgn4emLhg1um9gDqOl0ylW
	 GZrWDuG44UoWOnVMjaX0EjeJeX0+KY+hFmFty/exp4+Ywag/ESU1+Qs2JMOH5BnBIuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
	b=vnBmEqW5/oQTdlX0hvteTOkwfX5FGQly+W0PkODvVkVWRO03JApyhDIjqqzacX+J7lVU
	 r3B3TySkg+aPHU4lsjtlGB538LcsD4C/S1HnDXMURaq7wdxG0fG0Re2Bbg/Rzqij455Aq
	 U3APGLX7xRRKtxU1WyqEqz3Z5adY+2dxVfi5vOVj7vlsrMEy6FRs0mHvAOS6vQGVop56/
	 v2z4/OB5d1ptOXmv2ktspm9BgCM3bPQVIBQjbjdVhsAMAm0LQQTuNmJ4edjMtrdFEkTNl
	 s8kQ4xxwqHoRAO4+8sx7oyoYCJMogSahD2JMMmMBAhDWLdplJvcFIAC09+Ss5DfVVgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hSmIepVb;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B884606A338
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 09:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B884606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hSmIepVb
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4395d31228so723471866b.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 01:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514382; x=1796119182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
        b=hSmIepVbK9PWjrJBE1AprzX2N4p1wm7x2m2I4anFjoKv2cxG0XLVrsBXe5NIFEkEyS
         N1kijXpvpVAN1QOMPlyRqhgOTpbYI2dzHaqAoJgWxpAkkhtP/f5iWwn9TTl7wD24X3EB
         WxlV6AcGpKBEp2UfKtKPv5cEG83EaXrPouH3HCq1HYm8dq+s0DeWeySHJUhux/lzsOQU
         968QwsVS4eWoqKrOqBrwPqrEZ0Qn1jTJPqZWc1wPIH36W6qEAhXYEFtpPDLNxQ1aVfiF
         CbjZJRD7nsJlM5HtssYnsr/+Dt2Z9ZMa016YK5pVeoA31McodNBQihAv70Dw6snjGmXN
         dLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514382; x=1796119182;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
        b=NZfPHwmSbgEBBbAUowRwNpi4Sv68AmiIoe3/y0KUvJnLMcrOWH0QLIPuu8rvN29+lA
         AZ2rRC6tR9F30EaA1kRHjb9rPNKXEEfJbuF4jHCRUAwHsXOkX22WSsI1+UYszc8SAQ83
         3MLjo4twWtkKh3azRIRoBLvgS5ewG5KH3qkSOUYmU6vkM37ed6LIfRGGprkovia0nCob
         +hAgbzjYnJCVUTasrA29p8XK0+l6Jbzj9f5saxRujjoif20SxBlH/u5CnYvK6hJdk9q/
         f/Vi/nCwVZGC4yCoNsh39j93sRWG6scE16rjjMIiJlVhzH/x+8Tg3jPJiW3mNO1vHIpe
         V6ug==
X-Gm-Message-State: APuU4Z8ZcNzeDbOab738mY7Ier6nT7fRcScGBuvaHD1QwmWKeXfLXG30
	jOr60G5lJWQhIRCby6/T1BX6KvB5sS2Ag5VWj9BFJKwOOjgoCCmbSBUCfbidxQZ1ATU=
X-Gm-Gg: AZFdTZeYTOVwezEXq82DuxWGAe0fWmdMDz0oWaXkDPfIN+fv7BZ4y2A8WXRuOf+QsUo
	bOesS70iMKckaqcLE5uUnBSb0Rpnh+u0Ir0kphtUL4aMwsVcLf6p+FNMzbsZSWdWWJjkd8h+jCV
	0qcTzRVAYrR4rCJ0iotFsbCZHWLyG9JV+if/jlh4awvloRj3YN3t4L8M5CT8/y5sI/JlqFs+S8o
	755wz6ENBX1DMJDHX3mLSDP+ZP7wfXLd5zZowF0e0aI7eXluuWoYXryzXWjiRTmeZBFFaVgzCn6
	lskCgtLJt3pUasBoWYuggONiiDA8AQZ2boAYcdkv2eRFGUXY2MoheoMCuK9SMc6X7QAwlEOSB1u
	yatPLdpkb/Gtl/NWypRANOkek0NDyOFokNbleoyy73q37+rPtVC4uJfFptn7VRL5AkYEuc9EX7r
	NJaO9231Io33cAWHpXWwItBUFgMczs6UWAFNqXRwzF0LSPsvY/W872iUPRRxGUNXWBaJufwCmNH
	4LZH9EZI0ebz44ioZPOPnyJrRANrsC4moRhwAGamwMYYSGtChbvz6btNHVINgqh/P/n/LCpiYfe
	mqZixDOB6nAgIbQD9fKhJ51lXQo/L5fDTatBkCGuNzE=
X-Received: by 2002:a17:906:f10a:b0:c49:b8ec:a9e3 with SMTP id a640c23a62f3a-c513aad202amr993480966b.43.1795514381642;
        Tue, 24 Nov 2026 01:59:41 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01b0bsm493902266b.10.2026.11.24.01.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:59:41 -0800 (PST)
Message-ID: <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
Date: Tue, 24 Nov 2026 09:59:40 +0000
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
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> The CAMSS CSID latches the ARM architected counter on every start of
> frame. This series exposes that time to userspace, both through the
> V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> 
> Until now both were taken when the interrupt was handled, or worse, when
> the frame had finished being written out to memory, which is about a
> frame period late. The hardware value is free of interrupt latency and
> is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> with other timestamped data such as IMU samples.
> 
> Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> having the core take it. Patch 2 passes the SOF time down to the common
> CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> uses the same time to stamp the captured buffers.
> 
> Patches 4 and 5 are picked from the timestamp support Bryan shared
> earlier, with patch 5 adapted to use the conversion helper added in
> patch 2 rather than its own.
> 
> Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> Bryan O'Donoghue (2):
>        media: camss: Define timestamp registers for csid-gen2
>        media: camss: csid-gen2: Report the hardware SOF timestamp
> 
> Loic Poulain (4):
>        media: v4l2-event: Allow drivers to provide the event timestamp
>        media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
>        media: qcom: camss: csid-340: Report the hardware SOF timestamp
>        media: qcom: camss: Timestamp buffers at start of frame
So I was offlining this change and kind of left it at comments I 
received to make the type of timestamp selectable on a per-buffer basis.

IDK if that's really required for a first pass but, its where my own 
reviews were left at that time.

---
bod
