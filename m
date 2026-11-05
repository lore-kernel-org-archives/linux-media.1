Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872465;
	b=BetBPYVa+GGJCHH8wdurvvq4h0yInvT9GoUVpOv+74KiZhpv5OfmFwZdG6VYiNSVuRT2
	 NM/9yxO2jJRpLTCy1K4YfPyaKk999oA8rW/cf8BqjF0aE4PKn3cbWH8+wK3CVGRj0lrGN
	 cfxKfk+SswFpJMTkVMcntG0oDmdVeZ/IxX3XApDydV2U8ShOIEXbjIaHKu0EzoCMoMKvB
	 1yJFqpuGMUGUJegAjbCWk1mlQZt85PUKs7b7IpB99HFu81S8wddl7QzXLV5F/ij0+rjQ6
	 nJekf/oeWoynbXB5RlMCtChFpQ7Qo8RIh5zpO9Xeqx6kR+hXZU8/7XvUQhDAGbqE2rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
	b=IYJrBPvKJe6OA6eJOGqF9whhf6Qs5jrmngLIlPx/9dCRs237YmDq152JD5nPIQX/cpt7
	 phmhIg17M15t4f+K0OvZRsiue/sHauydOGT+5c/1r6znEHtWNoFRKrE6Lebl+bqNB709U
	 UrYSjADiyj3TNuYw1qbsKV7BD0qTT6dtHp0zwu9h7X7oguVXERIfASUGdzVPm6prYdthI
	 nA3jR7mQiI6mLKYuVrzTlMxJKgBF+lpCf89DqpDtSTT4i6HvTzGXqjLq4Lwg5WyBuS0Sg
	 WB5O+SBIPQjAgm2RabBp8GFFne9NVnZ4DehId2CUeLR8zzIG77O9Pfmq71cf6ZX7GVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u5fjdwl0;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D127606A337
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D127606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u5fjdwl0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11044245e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872463; x=1794477263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
        b=u5fjdwl0lTWSaSIEzx139mydxtXWqrSt8vY2zyXiD9mYugFWNCbtSyddgACYhIMH8t
         9pa7u5hZxCXUo7LLOmp6x9srKSC0xdw/wThtTCXY+sia6WTxp5cBqPy/FCu40ne5Nj4C
         cVQBiKFYRxxcBUmQYkviodfufSqTRP2S8rEpOv1WnRzb3597DxmkBULCuz5sjZrbosNF
         mzwxKwBSF/9onBAQmhqcfUcJKegFnq4WgmpxJLjZQFY7/6hUXOvHivsGkgDlVWEGj9y4
         34Hx+rJFGgrLcHpcBWIezUJxTyA2pG83VIrfCKzfiGnxGMDr7zVlBE/DkshcnvcSndmc
         w4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872463; x=1794477263;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
        b=UojrfRK8CcLZL31+A0T4EJs9iaRFXtwuR3kx95wJ21tmSoq8fS/KyVM9NyYmJR9efD
         b93g6tp7ORH0A/fUDbcsaQTT1uQEna9ln777IhGfWZFl3rFzEb2c4RoEOfQm7VaHbzx+
         sB69ZenTPZgIQxsc8i6VXdpZ0k14eANSZhVCeOMsU6o2UbJhaZLxiMOoGmZBCsVn3HS1
         UhGjklPIrDXuC+Pfbb4aLlOI914+gN3PwsT9MX6G39aaiJrZ6RxScHJofI0jNMZxyT2y
         Hqq/7jhH4p0FdZ6ePNKXaYWELYImk/STfjn1455UVtu3950Fa7dBOgpONnVU573xLL4d
         mXQg==
X-Forwarded-Encrypted: i=1; AKwUvBykkXbMHB9NdfhbCQ+FbnCHDIbUwJ2l3LtykvLutntLzO8u7Ma/4MYj1JpBHsNaQ10RKhxE2A916w72RA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bxYhOtxR8tY7k2kP3curIKiYHoleA9u6bBKYj5JGTvNmE8Baz
	PhWY47DQ12jap6pylZ5pGKnqT2FxogLkBROfb+q/D7ju1LxnqkvBOKOLNxaXgNcJCKA=
X-Gm-Gg: AYBFou02w8fpKkQBRA86esxHSzrd7/PfZ1/AiqlN+AK9mk9mRupXlMJ22hHpksUE0TF
	p2/cHY1ovGTB8VENUJ2b9J2dpfdnO7IGg/A6Ny5zlGag6lm7cyVWc/BfRoanvUMQaTEN2g/9I85
	9WhbiA7M+wNAy1tsOQT8uqFlFrreWN6IABTlSX60Qrqb8462LCwv5/JkajoiKRruY4vSwqwVdJ/
	vgYGg1OXelJOvBg9HdV8ypJCDor5Ma1O4k7b3h+dZfVH0TDhmCLSmqxOmKZW5unfFkOf4WXdZ4a
	ankwX2XImURDPaZEHN5hJ/vkBKPPr41ggLAyQaOKO3TpYaB3yto5Xu3YmNHayMTRNeGZ2mLXV2q
	iTQFiX2lIaTZq1T/XrcHDyj4Gi0HcZoLlMfOpw2+mEcc3CGG0O1U6dqubrtqjp+hhsLzE6OW88a
	VwlHXoVA+Mfgq1VHnbeGzQqxSa7u7VGeiw9qbZqCTKogAl7iTEX4KGU/idUNQCz3yswswJItpUN
	Z6H2O+CK4oSZQ5jbTbdC9wtOAvsv7WnLZEWCrxRnhOyIw1L7PfQhiZNhWRT88cCWw1Gv7gn52oI
	2Kz7KZNGNix0qfwbPm+KRDQEOXP6ZjdAoEQONplq
X-Received: by 2002:a05:600c:6089:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4ac14ec75fbmr396131445e9.1.1793872462901;
        Thu, 05 Nov 2026 01:54:22 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm8669912f8f.18.2026.11.05.01.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:54:22 -0800 (PST)
Message-ID: <28793651-1a46-4589-a9c6-97ac979a5b48@linaro.org>
Date: Thu, 5 Nov 2026 09:54:20 +0000
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
Subject: Re: [PATCH 1/4] dt-bindings: media: Add Qualcomm SM8350 CAMSS
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-2-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-2-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation of Qualcomm SM8350 camera
> subsystem.
> 
> Qualcomm SM8350 CAMSS contains:
> * three CSID and two CSID lite blocks,
> * three VFE and two VFE lite blocks,
> * six CSIPHY devices are described as separate CSI2 PHY devices.
> 
> The SM8350 CAMSS is very similar to the previous generation SM8250 CAMSS,
> CSID register spaces are placed inside VFE register spaces.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
