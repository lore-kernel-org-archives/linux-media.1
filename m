Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288984;
	b=l5UpDQ786WUanOsQRbyaRzOWzet+WUUgsUmx7qhRdo2S2BHRhVHDZmerjQ5qN7Vi2SYq
	 S1viUWPjSLH/7VjrKSZpKZjHAQVBhJaBj6cYW0WL/EV9oaTVmkLsu5d7oDRkF/4LzAGNr
	 QMALYV2VVBBhJPgMiYYJ8Eu2o7SUpREZWmG3FcsZ2IhzizuR9y/u1kluiVVAoYhxhoc+6
	 ZVPQtQeBV5dfJy6obRVyA8gXnWRX3JIUnzWExqOC2796AIenf8o36y2l4jvudGAsEmjE6
	 KvEFiAdMSxjI5ZpgYXpZkF0PhtI/u9Q8mG/xOwW+mveDl+1k/6cc3YjLlavHE+KYBYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
	b=J8hxdAxDQX7tm4K1piQdfKYY4NyMCyISX1m9sLcWnSijBkpoZg5v2sFHRlu5BvKduOrq
	 A79OFvPGbaE+87+tw0fjjZvIqVc/ILuUaZU9FaI8xyj14bxK7G0sV1N7mu67OgmveeGlf
	 mqA+XotCmnrNdEGd5V20dU8qdcR0MCSEKFxwZLf9ARSDYQwlnFtwCuXTvbHUw94dGhL5V
	 ODHcTcnLy6GjARQWJhvPJ0G1ibnilwXOfymkbudTDCEQrSo6gqcHGvBNBALMMrYDSzWkv
	 uxkFsu4PNkmymQywRG2rwmFE2VrXhR50SsWrfJQmvcyK1+lTLeNeJw7nGqBqBymn7dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y2KtIZVB;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFEE606A320
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DFEE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y2KtIZVB
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4682977f9aso292511266b.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793288982; x=1793893782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
        b=y2KtIZVBXtmEzm9KYq10is51yoTw2GIuRE3BfODGCqJBgLFAABS/s3IRpKGSZ6mac4
         4PgDjfCDYP9pQTkCT+pA5MmplPx6MILiJ2tWeOUVLPnqgPZbrFQPP0pkgPr80YCI4TfC
         WYGNyfMVMpzS+ZFqxQ+Ec6IYWAw+K8DzAvADEdvoM4lHZEOGSKdCCeq77fF2DL93h2zD
         PGgEoEQDm1axADypCf0Gqic0C9Xy+iwvJ4CjrhqSV5w27ATAT5suICLAp0KCj4YKNi91
         SgUORdM2cB/nXVPmXDwKtLKdO4TQ0jxAoMMlVJ0VMqjBUMZZe/VskxGYJDptGuMrho8C
         pUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288982; x=1793893782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
        b=zs5DhXLO0tqRqm5N8rwG/ub4Enu2J5CbGjLKhcPAZKNPEt6DmayMROH/QyPCvCsAQ+
         5BQxApXULIjOkeqlZvn9tCqtXCUl7IDQNtBf2dnw9FOZCzRFRBuTcgiA37LczQlwzicK
         hvePiDG//mCEYdfg+xdAA5fxbbU8SK5phMzA5BxLat4nm5YWhbTPM+wlRnRrwOjQTRdF
         qs2kN2lOH8h/IlIAlvI2iK7tJCtMUBTXzYVpAgJDrlffJvbe35pwtQVwkKEmk34t7vyG
         mIjh++K9YOUXl4SrLPbGOMbWK3hnthypOvGD0Ts4xVNNzZZfTvyS/1vs8A75cCzyRQdn
         7TEg==
X-Forwarded-Encrypted: i=1; AKwUvBzCTbNVfXcl6Awpq5V0DLr/uRpusBqZZsmTVoJAbv6kGyUSdRG+EW964bxx6FgpeBgxJpsr3wl1VTsJ1g==@vger.kernel.org
X-Gm-Message-State: AFq9FYICTvdmW+N4SEH3u03aTyDljfdJu3a7xBaXM+/uY2XcukqH8bOk
	9Q3eA17aG5HP9Rodv9xYoidnZubjvUf+CYlO6x86MDrf5eS9JShwhlXCuZhokY1Z2U8=
X-Gm-Gg: AYBFou3xTkuzj24J7VOGxZYRUCkwZfx+9l7BZGSSs8FNSHMj3TKZCxQ8ayJl7BJslI2
	rU3SHFXBHds3jIYTOnDSR2bgauPTXfSU/wWQdbnlhln6h6wz+/WLrcynLX0QO7wohMGjXbNSqyD
	gK0avJA6ghzvDaDM1mw+0VWMFc5XuvoPv8jyS60pW+wGP5rapJCEO6HxJ6E3IvATLh3BatHh8c4
	FsyOLarjZPrI+uLxWlWOgdpKipO7X6gEH8cDuO3ja2r6QsZxN1oXt/ByeIwu0OnLvuaEtiZcAMM
	p8fwDhfjx2ytDDQ2sja+ztptdT0pXN4Buh3Tnq45pbNWiG9fFlLVecwEcS9HPuwf/t07I+f5oYk
	bQ1yIE5v5nHGjKYxW12BifXxVpN2e+cTja+NpwptVin8TlejHk7Oi3sSiqHE6mdh40uPgeWhTY7
	5QokdvOu6f57YeLVffG+jdssmNLxV9hu9m2nS5v4M4zTRpvMszEBBdC1lM2NaHX56y/sqYmAbMS
	PJ+5ayCPQ1LgLOorVgIdlvJiXc2vme/zhYRHPKd0aC6FvueJbnW40z6Ha6ZyucoAoEFql9Lgvd4
	tDH2dAB8+m1F8OxW8XsrovA9SBdOV/51F3iDL+Fk
X-Received: by 2002:a17:906:7312:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c49bdf7a5c4mr522279766b.43.1793288982497;
        Thu, 29 Oct 2026 08:49:42 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca264d484sm7985666b.27.2026.10.29.08.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:49:41 -0700 (PDT)
Message-ID: <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Date: Thu, 29 Oct 2026 15:49:41 +0000
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
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
 <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 15:46, Loic Poulain wrote:
>> Is this something that should also be tied to frame_sync_en?
>>
>> Also, just thinking out loud, are there cases where we'd want to
>> toggle this dynamically at runtime based on any V4L2 configuration or
>> pipeline path? For example, should it be enabled for the pixel path
>> but disabled for RDI?
> Obviously, if userspace subscribes to the related framesync event, we
> should enable it regardless.

That's the behaviour already :)

Again though we want SOF so that we can drive seqno which really 
_should_ come from the CSID signal not from buf_done() *

---
bod
