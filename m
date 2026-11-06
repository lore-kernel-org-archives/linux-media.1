Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964021;
	b=dK/N2c61HS6sS+DzVt0vc7sQxoI5nT6/0vXoz0u4+2Ks2thxmuzISFZgkkNF+gIsMluK
	 gB00mgdCo0Z5cHoRTT+esKIsS285oEjviXffKOcMzp77Jv3N91gyU7povRdYK4LdRIh3u
	 7O/WW3byI6CkoaH6tcEk6jASPI4VOI4Xue2b03TNVe4PPQ5FevrV2t8Jjh507T/bs59ig
	 LGWFYu59HI8f3s3cxXRDLbJO1UgDeidnTWsV+9KY2BURQdRjxpDfoHJiu2yPgiMBlXtFO
	 SMUu3CRROdF/udV7NdUxvBCLpX2+e1wjqz2s/L0hILLEI93qj7+3RiiPpSubRqld1tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
	b=4mK+easLQ6pdd6uO7xi+8iDbLoj3gtI9h3ja2zBVoMShdv+DddNrxupjtJ2JPLN08eP2
	 aoZWWEu7t/Y+dht0xWz3/8rbY4Rx2YMQ5N8q96AfUl06wKatn1S9NYUBpWHh9pDhaSM6i
	 JiuPYqAsMW06Gs8CJ0C/KkGf1KVBzvrBYKdQDbriKdFHuBzwxQ1rnmWWvPvWi7Cm/wNdK
	 7Nl/ocwwY3FCNvjZCeWn849NjPS320q0OSkTYubLGN10hhyMdFhEwEzTTzqi2G16Bdaxa
	 9hLCC1hDkyROtfvM6EeXh8F/ijH20D6WWzBQEM/lXPSrhLBcdtV6hmOnGYWm8KcoQgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUFumtMK;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1B9606A32F
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 11:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1B9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUFumtMK
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab1cb6eb70so549091fa.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 03:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964019; x=1794568819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
        b=DUFumtMK1phvIfSGAyjvBixjvVUbWj1LhChEW4qMThx2dH1KWLjydGDlGxwzpHi34F
         ydA4JtviInKqlL9MBEr4abhaPmqh35/Uak9OQijt/vKOoxpyIl7pLa4orHyfSO4vuI8h
         SglDNnGd8ZUztb4n0NY4SsyAZ9xEeS9rvIb8Uji0t3mFVucpO92chNyBayYeqhSZXz7f
         pju8gY1T4R95xWyHa0+c6Mq3d7+y2EYrsAokrF5RWngcDjic2+Aau7B9OAqIXzMIdHn4
         4rVW8y1o56QVlQPc1f89iBiWKmHxDUxq16YvDKR0r+xTHHx+sXdDVn4V3wvaoTs7a4WC
         gHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964019; x=1794568819;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
        b=nlwZQVRr2xk/wFRKcQSMYG6a5Xcravrkz/X5S9fBy6yyEMxvfeGCCkhoMom1m0BkUr
         z9UBDZYNEAkQCAaikfl1igjNduWf9e38rAWjP/tudx+tQNktJ9tRL2oVPjK5ftwGXkBV
         9dBSXpQ8rvYZxvb2Kbfh92SYesQZ84xjLDf4EEkhe1s9N9LWFdhC18uBqWcBbe6SX8rP
         GfGZlruYbWEVxP4XE+SptszAXGPWnt72iD1TLZluDHxOrwaKdfbucrP+DrQWhHbZ+uMb
         OA52KNBEU7XcCXAg3lq6a/VW0hHMgTYOJWqzoY9qEw7aDpwWj5qSCtLveqPS+aksU61g
         afOw==
X-Forwarded-Encrypted: i=1; AKwUvBxGXQ4Ixbjo3eulP/qKxpH0QB8yPZ2jXgCAW2dEvSJ7ZMhdd/2MMV6j5vqZeMG2hRNe3E78FgxWU/rxNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eaD7MqGbtBrQTP5dQZd2I+hjtcz6B8ETO8q3cAwe+pdaJBzMP
	Q1iFPOpSrGygkkVI/OQqu+N7A9D0h/tYQ9hY8wemtBmcFUmqXQ3lHNf31rSFGo/HwSo=
X-Gm-Gg: AYBFou19OYWC64qq0K1xU65bGw3uoTPDJdQLYsjzbcfK0w8ZKRCf9pYYrHuaNm5WKfv
	Ssv9GNNC+8ZMIxsLoUCGfr4JnzrFXtSlIOgQwoWqiPl3LzGb0NOSyTTh6xM7I/WvEyhyRhqueL2
	W5+tfDxiMbTa37koqx/BdU+kVGqMXsopBpfw+LUN8bdZv5VMLVaJbuvL0TMFbw4WH4gplWN+PRB
	pu3h0fe7Y6oQBkKueVX1KrcEoxKkH+Whe0Audvn6FGgLkqQCD68F16DQ6T5wgPTDtYG/4Niwhnn
	39SP+6QtpmiderdHH2HFKA826H0rlVzHg9FGEVvq3CE+5AIo/AA+D4m9EkTeOfvg+Z8yb7/lIWT
	pH1YD+g0nfRqSuB+T5Qi5OiIwOmb7klnspTKc+gEcjY4S1HP3ML9PZHLFB+gxDCOVqDF9C4RZBD
	ocM2YMX7RqBd5r6E/0ZSGwofkXps+kJYci+Z510ftqjaLS/ynTko2cA/U2Zelcrs4EGdGfT8Srf
	6XNAZejpqOmPUvaM3/daVcv+Nx/eTHQmwFkM8iWaJZ/NAFK4KiYRxDG6f+P8a2KWKDFq8ZSLmbl
	hv6qopCX/srvRiZjzu13eov1hliOib8uDMnuMjdvQFvlgQMxenN/yRvNn38hugCkp7AVZMSApSc
	6oJveaw==
X-Received: by 2002:a05:651c:a201:20b0:3ab:1864:5004 with SMTP id 38308e7fff4ca-3acf36dacb5mr4022961fa.0.1793964018157;
        Fri, 06 Nov 2026 03:20:18 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5facfe9sm2950231fa.21.2026.11.06.03.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:20:17 -0800 (PST)
Message-ID: <540014fb-d271-4e20-9a3c-3f2fb66723ce@linaro.org>
Date: Fri, 6 Nov 2026 13:20:16 +0200
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
Subject: Re: [PATCH v2 2/5] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/6/26 05:24, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 27 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 412 +++++++++++++++++++++
>   1 file changed, 412 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..26f8939001df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,412 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 27
> +    maxItems: 27
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer

I ask you to switch to the new CSI2 PHY driver, please exclude these I/O
spaces from the CAMSS container device.

It makes no sense to deal with all-phy-combined supplies and the multitude
of other solved problems.

The cost of changing the device to exploit the new CSIPHY driver is
close to zero.

-- 
Best wishes,
Vladimir
