Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223343;
	b=I2hX+CKy7MP71kjKfRRvtiZF8La0NIXONXSVbA3XXtkDPxWNgWmlSCj5Dy/zprUycA/g
	 ynjPFTE8R3grpTqCyAQQbFoaeImx34nuKBpuliL8hOkWA7FjkKzY+WCbCL0CdTi1/9gis
	 6hoSv/1nk4b6WwzclCcwahV9N7hv2pgRLY/EX/2b0Ij29Rdm+I5RHVX3cdfioGTI0EHRW
	 G27Ju/EklLiI6i0tqhJcsrKOSyg0S3UEa1L2fYRydQ/k6SKV/eS4/4Vi0yc5ffc9I5PW5
	 gHwqa6hkfYxiXbmT2kHAflKEh7eUkrdBJS3ZZ1bmM3K+IHAh/BVH7LAsuo+dFHddXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
	b=PF7kj3bUi81is+l1I8Aj9PRG438vWYVhV3+Dc8mNvEmeOVtcxbOXNjgWZgrNRvoKbUQo
	 OuavETxipvxF/GZpGmTVH9BJvqtTG7vV/jQ+chesQvk6jiH5NpjVSSveq6kEL2NTkjEaU
	 tdLuCxU/jE31/VfR6T8tLEVZq/HiHqtkL14F8JLf2b9TVZUnQXGp23YeJRaEFPDuh42e6
	 aUClAqzQwQSpeo0KsMvroOGEyUR+ok/FoDUJy0FySLfQxIILV4umiJunGKnRK9lv0fJl/
	 vaRAg5Hf2QbAraRViLwaMWWsUDwt6Yze1m+juxK15eu81MDrpM38KJgOsAjUTEJGxWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfCMgCBl;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A089606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 11:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A089606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfCMgCBl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4293655e9.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794223341; x=1794828141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
        b=jfCMgCBlY9RopVhaSNRGgRHB2LGNqgbKO3lacuno07E4l5GQXAsyg1vIl8S5+G2Hib
         WTLw2oluK8WNJay+xGNbCFdu6rq8+RDVil/5vmziw5ZhveSVb8Atdc2u5pvDPCBvRp7W
         mDSeD4hJWBHULWqzSZckEGzQidvexDgEHLApAeQxwCB3A60sCys5acrGlV0L1jCdpgJl
         MMG0JYRz5npQt1V8W9XihEPoF8aXciUcRAkdAYSPy/CfMcTwM7WcyYwwTKIoBiPVWx4r
         /950l0jX8a6fWRBfhoEWuSpzXO5jPFNAVhZuWSXgV49epv0XwFNSUbjMHzqeZ1jfm5J7
         xMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223341; x=1794828141;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
        b=PDyk2wN9Bk0w1KZhv6GL3hfb+VTYJe8U4NPn5FSZqfj8rxWP4FienI7hSyecxQj6mo
         kfbD6sio/CN06zwVTtY6RjeqahT7E6IKIePYRVc5Gl0W9rx8Ba62ut5WbfRbsASxFGkI
         omD736DFEU6E61ovY9GLso/7ZxJTsKaDkTTvk39kmCHmfsCW7of4gssswVYPpNROg3+D
         iNqX2IzjCPHzTK7ohOQJjYv7sbAI55nvekBO3KyReiqxFjqAXi+ytYx9Aa8sdRISnvfB
         c31OVDx8nNX9tTcb8nJBgrxJK5g4Q4PL9nd6rvEHRJ3og/UucnGK1ezGdxS3JDleZ3Mk
         GeIw==
X-Gm-Message-State: APuU4Z8rNjV567QxaqdzZ6bX+TKaVN6ss5EUSbWRJhKtRXqdko858TCH
	HfnzIzW285YoteNIu4tmcSJcEPTq/Bshnvi3jd0uG5XyHsiURVfox4V+rimBIf5hhKQ=
X-Gm-Gg: AYBFou2iTMrNH34xGP5nQ/5AjV+0L5gLZhk5HHTQd2F38seJfehSXXJFAaBiVaqVNRv
	VhbM59aYLzoNI+sxwBTqxg9RcQcFFnFoCxKGcE6B3S8Dbu8yMg/DPPLSZw5OCulnWoTDOkr+6Xy
	pUdhXym1tc/6JubhceL4Z/ZE1P3e+Qx/EZubryIhwXqteGCi9tHcjno8TeejmNo34GuRBcGw2m6
	B9OMpBtO8mfZk8xyvWqlgkvcm2falmEO5578Yz4VI57v4fZWsfLzuVEcK7YjlsuT+CLUfLsLRrk
	/4ND454V+3j7o+hakN7A5zOUTG92+qHfTXjn+ffFBOVfjSndZrtCl3vVwmgGvswAtFemi7sJFVM
	emps2KCIzEjKldHPmVef0ylLKyAo03XbjoiZTSpGnPos7cXoC73/4okjTOvoopz7DD1xtquGF7w
	VXovaHl0ciWG3Hq1L1ECBGTzniQoRjeLu2p3QeO9E+mHvnj+pr8UKIyXuVwJugveru9xaUqw+y/
	heqiO7G/1/S9VDde3qwrNbOkHUd2vf+gmDxkeFPW03gK1EI+G59T+hyAn9HZyNcV0jWnQVMFZPc
	S0hpB0mt2GCBM7M7NXzOnyZqvk6OrbFXH/JBsQ==
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr72108245e9.7.1794223341348;
        Mon, 09 Nov 2026 03:22:21 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm272724515e9.1.2026.11.09.03.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:22:20 -0800 (PST)
Message-ID: <7a2e44a7-41af-461a-96c6-ea91780bf524@linaro.org>
Date: Mon, 9 Nov 2026 11:22:19 +0000
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
Subject: Re: [PATCH 3/3] media: iris: Fix use-after-free on unbind with open
 sessions
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <2rWHCgRwgvQ8e4bhpYnYDjIzh1pjQNSNjdBFELmGe_h6iZzVLuoQDpUPAD64feN0mYHgyoDf3AYwIu-5ilkZdA==@protonmail.internalid>
 <20261017-iris-handle-unbind-v1-3-7809148eb90f@oss.qualcomm.com>
 <46e9506d-1eae-48d4-803d-d731d85fd376@kernel.org>
 <831090d5-57c6-46dd-559a-bd6abebb982c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <831090d5-57c6-46dd-559a-bd6abebb982c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2026 05:08, Vishnu Reddy wrote:
>>> +static void iris_core_release(struct v4l2_device *v4l2_dev)
>>> +{
>>> +    struct iris_core *core = container_of(v4l2_dev, struct iris_core,
>>> v4l2_dev);
>>> +
>>> +    mutex_destroy(&core->lock);
>>> +    put_device(core->dev);
>>> +    kfree(core);
>>> +}
>>> +
>> What you would have here is an admixture of devm allocated stuff and
>> hand-allocated, refcounted with custom v4l2_release() which might all work
>> but, it's not obvious to me does work i.e. core is hand allocated while
>> reg_base, response_packet etc are devm() managed.
> reg_base and response_packet are safe: after iris_remove() the IRQ is
> freed and the core is in IRIS_CORE_DEINIT, so nothing uses them. Only
> the core structure must outlive remove(), so only that is refcounted.

Right and you can confidently assert that for clocks, regulators, power 
domains and ICC ?

TBH I think this is pretty hacky and unlikely to be safe.

Another way I don't think this approach works is an ioctl() waiting on 
firmware do do whatever. If the ioctl wakes up after the devres() 
removal - then what ?

>> A much simpler solution to your problem is :
>>
>> static struct platform_driver iris_driver = {
>>      .driver = {
>>          .suppress_bind_attrs = true,
>>          ...
>>      },
>> };
>>
> This was discussed in [1]. Dmitry noted it is a sign of a badly written driver,
> and I agree: it removes the unbind interface to avoid the problem instead of
> fixing remove().
> 
> [1]
> https://lore.kernel.org/all/ 
> CAO9ioeUvV+3sME9P1bJTpDOSty=uojOKak659XCf337++vPVNg@mail.gmail.com

In which case I think you need to do more poving/reasoning here about 
admixture of devm and hand-rolled allocations.

Like what's the use-case you are supporting here with the unbind exactly ?

---
bod
