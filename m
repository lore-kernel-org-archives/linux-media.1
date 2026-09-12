Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2747CA60
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217120; cv=none; b=PCJcf1udmBJ/+Ie1vikRVYqLxVNETABy8UJFDBUvk87+Vh69qlJ9nEvg1cSTwkog6ko91y+aQdlVVGEFov9+V90Qrke93GeRrwFn4XjXnjT/hrWZCZ+YlxwyyzZfbuJJv/JsNgZO0yEzsRReosK/0ynI8Yv7pDj+u3GUX32G2Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217120; c=relaxed/simple;
	bh=p9H5fJ0qznjbd7WwkOCCZHtdV2j8uNOzcKohs1KM2HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EM4c2MGXMaL8/AZmel0kWrTTrSiDTM/G9Cbp7cj7XowmqP6LGE3vFpCG+oEk4yjGpwrUmLgsv7iPedlWayh2Es9VgeLgDg6Ubb/3DqChTVsjj29SgJPRMGXQrrGjQuhowYq/Lt9eTHhuGwIjNKg96s5exKhvREy3pUHx0IbsXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYGxXM71; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYGxXM71"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso5616925e9.3
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217116; x=1789821916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnLavuIU3PeT29b0R+tsLZa/nqbV4NGKsHKuPzpckLg=;
        b=TYGxXM71DZHjLh/Rq+9HcXxkLFjtrbsrxxrp8GJVKX9v3d8viBPMuSsfYI7H+1yUoB
         P5f5ynRhjCrlMvHrco2IhASIwqEgsmCFtyj1QgnNVCW70TjLDsN0g5/fkuqYEDyedC/7
         iEw3V3Cc7WvEYmGocV1xGhp3h85C8T1KyfgzwFDNvO3ZQgV3rxOav9QiSdA+QsJAmu8x
         VVf3ACsBz+5JazTqf5/PMzcNuiW79TUaJgSA286iuHwvwRCiHjWquG/epviTgRJA6eow
         6Y54GwKte6yQgmV7UXDZv612iCll+R0Bxs6bdsWjLM5hN7v45rjAW3kQkIysQmkhYsdE
         YUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217116; x=1789821916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnLavuIU3PeT29b0R+tsLZa/nqbV4NGKsHKuPzpckLg=;
        b=Y43WB73KBcPtCxYmIA/i0O2RqljQ8vnU2OsdOK9Znkwc0UdMZZoxWVEZurH6vgcAKU
         wI/rbn2Qq/ZbcMXhRlPVCnyrHbla9Rimz3QceGcDfK+7cJukZmapX0HvrqXr1fM9A851
         AyO8D4EYg5WQv96Vl3575R00F4LeDN2ouxfSxCuvre2qhZO/A8MpX/BBgL2C5jh+Xg+O
         7ELMFBlGRHK9Jlf3znQD1qlawpGVaWY1q9qpZRRe3yQB/rEC2uzaqVV+1rDpaNNL9OD4
         JKxNpEaWsGSCiPKhMa3ZkmTwaF4GdfVJctgB659jX/ZpBYrOC7G2iuw3ujNRb3jdK8A1
         rYBw==
X-Forwarded-Encrypted: i=1; AKwUvBx4k2VXxxoZIvH9G4pv9EW5TntKO9gDDkrGzeusiVAks6bEo9UdeMpndLGKfqnXE74N8cGymrbfzeyadA==@vger.kernel.org
X-Gm-Message-State: AFuF++luo/M4zuvPH/G1lb6cfcDv0mjRdWtMG9h+k9epI2EAs6jm/2IK
	kz3Xx35cYFZkjzXW7NnLQZH0wCx14gMUDQyL6RvxAtL6rh7jbbdwrKW7
X-Gm-Gg: AYBFou0KzjFZQqmZN1q4/2JDEDEmSlF5tWWaXHvY8BBHw1LQJhn/Q0dY0D4m/O7lMch
	16fSfQdWt60bx4yehNwutty4uNBeOTIs2KBTg1RbrYJsMZHiygg1r5lOMWq1RxbgyEIGT0/rIp0
	N4dVgsDC+BGgQuO1z9mXpKgwRy7CxNfKhN9n0YBGCZ2Bli72t9/FKNKXDYADMFPnwNQj93+GXxg
	PpkPCgY5kGQQzjqHbbJIZKZyn0PlU/yAV0w5DIkJctp+XSbACBV7t1ZZansNXXfv08vkbhKW5jh
	Qpl8HsxPUvIlWqG4nFGTZlI3uL2Z2rtVEznig2zpWiUb6BhnOlJcNWmn9cJ1/9/wB3oXz0nQ3vv
	bWOS3vLNxUQRIhfDSzvNQGbMyOO+Z9BE7ryHt+D5EeFhP6TaPycJ43jhEDanqVm1Uqn9bAO5VrV
	w+k3GRvTCeVPYuV8XVXFUF6J/ClfY/zYLvWM6IS6Xqr5SLauDnzWPaRwR20KQjyh3RUuKgEN/eD
	mSHRQTdVsLbObd+MuudDyDspP1EWS5zOqwXzmcHJgFgTYhnk5AQh2ZNNesWZvopC9XCVl78bDEF
	AFuaScMVi6g8aAopNQtrxEtYEXNm
X-Received: by 2002:a05:600c:4693:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49e619bec89mr188946025e9.6.1789217115992;
        Sat, 12 Sep 2026 05:45:15 -0700 (PDT)
Received: from [10.192.161.217] (82-132-213-27.dab.02.net. [82.132.213.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm226373935e9.14.2026.09.12.05.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 05:45:15 -0700 (PDT)
Message-ID: <7b126162-f412-41d8-8002-6b31d2795f51@gmail.com>
Date: Sat, 12 Sep 2026 13:45:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] misc: fgds: enable GPU-NVMe direct I/O via POSIX and
 io_uring
To: Li Wang <liwang@kylinos.cn>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <2026090913-landline-encroach-c544@gregkh>
 <6aed7ecf-d125-40d1-a82d-1a7f62049605@kylinos.cn>
 <2026090924-corsage-shout-833d@gregkh>
 <33c9db65-fa30-4d34-9026-98144ce1ed95@amd.com>
 <9447bb67-96e9-43b3-87c8-db231051fa2d@kylinos.cn>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <9447bb67-96e9-43b3-87c8-db231051fa2d@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 04:57, Li Wang wrote:
> Hi Christian,
> 
>>>>> Nor why "fgds" is the name, that's going to be hard to remember, does it
>>>>> stand for something?
>>>>>
>>>> "FGDS" stands for Fast GPUDirect Storage. GPUDirect Storage (GDS) is NVIDIA's
>>>> technology enabling direct I/O between GPU memory and files on NVMe,
>>>> widely used in LLM workloads to bypass CPU overhead.
>>>
>>> That's nvidia's specific solution, but this works on other devices,
>>> right?  Or just for that one platform?
>>
>> That was nvidia's specific and very hacky out of tree solution
> Exactly, I completely agree with your viewpoint. In fact, we previously conducted
> a deep analysis of NVIDIA's GDS implementation code, which was also one of the
> motivations for us to develop fgds.
> 
> Please allow me to introduce NVIDIA's GDS implementation briefly:
> NVIDIA introduced two kernel modules: one module called nvidia-fs, and the other module
> is a customized NVMe driver replacing the Linux kernel's default NVMe driver.
> nvidia-fs creates a device file for every NVIDIA GPU on the machine: /dev/nvidia-fs<gpu-id>.

I'm not an nvidia expert, but IIRC they switched to P2PDMA, which
is supported by the upstream nvme driver.

-- 
Pavel Begunkov

