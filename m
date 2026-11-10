Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354734;
	b=vztIcHcdpmbXrn69cVl8nwbJHDXAsQ57T8zdArOWlzZ0Uhq4E1Da2pQWRSR7dji+TJEo
	 uyyaRs620l7NyNp43G6sS67yOLZyQPCvfvZJ9yTfamrvujLybh70JEnfnOdtLQJAyUwkI
	 KjrmNizypnjtvwWk1RXRi0n8DOyecYckWvzGiW8M8dXg7F1bewGLARvMo431CC4/W/lqo
	 vVM8uH75+rYyFbwMQgX30cyh4hc/zdH/4GP8Ly3re6OnSbW15oWIpN0ZzlK5pfItMlfI5
	 NvDQppJM+5TLJCvHIqLcX9cfK/CbNpkVSw8FI5ka2xdPy6Pbgh0Vnr8k1KJNZGPyyrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354734;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZW6/d6tafc93+2es2jKCUdQztkgttkGrcDy02n1rkws=;
	b=nXEds2RB78fIp9JLIPg+BEZu8COCOQgrugsDqOMfXGOBYLFYRGDFYg8pSM8bPaPzXGl6
	 KCmCcduB7YGnjVV+Fp7uzV7HP/QOONn4ENUxaXxmHv5Dw4P9GQDcJ3lMcZczjgoYdb3Wh
	 uPDiRSW3PKMgdjZNlK+X9XxvY2ew3b+CEhQwTx/fWvJHcZFmOR10XbWwQgvTlNrNLNaMg
	 JPl9M63dy/utMJupIZOM+CknIrAyKWrr6lEu6KlRu6UZ8P3o5gVFQnLchHgnPqiEFvXcF
	 bBMkaZ5Je5A01C8efYt1xl/pzJ5vNoNbCbqZzsWiiKvjce2iOb7Zg9WQiPrRxzQi1hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C960A380B
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 23:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18C960A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798af41644so2210507d50.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 15:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354733; x=1794959533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZW6/d6tafc93+2es2jKCUdQztkgttkGrcDy02n1rkws=;
        b=YgzNtoiu8NCaTXpwRHrbNSg2v2kp+cZYJtfRw+1BoJZHBKmO/qlPpPHyCbHD1TmyRG
         3ncC1C4V1zTKxFHFqFxIbP7VvsOdYJSecsBiotBdSN/srQWY5CFerHPTPdTzSyAs/8/R
         V9L9roRU0bC6hO+ejFMsNPqnZOnfkP0KYeXSx1G90szQloxx7CRyRLywSa6e/baIazt0
         fORGIQcQym/kJc3lWiWuY6JWQ9Lxb9Cpc9yQCF5dVT+zKVuqIifmfBsJoxCEm7JsNCb/
         poK2GekaA3IlJ90IDcPauJxhKZdE0xiXSZW69/go+ebkoBSEUV+6yh5dTIeMWOP37Cf0
         5Xqw==
X-Forwarded-Encrypted: i=1; AL+hErGtHRTBHRke0zwl5LCT8amNy+HsM429UlY1GU4h+SgiTo/YcNgAYOYjTllZZ/PLm+xcp4Ll/xvwGBaE4w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ACyptUkUg4Ekj31sFueDNbLP36yt8+0ohEm3Qvuv8utFREfyY
	yGGQQ41IVxzE4CSBbWL3tzJt/bumVnpMxRfJQUsUJIzEQmRJiVq730OB
X-Gm-Gg: AYBFou0nwbEkOQeo1u+CLW0+qeUk1FzMS64qtYI0nEGw/Ge8D5kpvvkdZzRLjPYL+27
	Y/YsjULokLoIkF51vUGPWQNKLJsPTPed1C432ZBqTDwx1ncBsD186hhDgfkidVtUCVi/vp0CwDQ
	wXuaEIAHcUhl8FHrd2VXPvoj1VwMK3QHtXKs6LMp+sjB4kcm0JXe153S2j6rhtPYCsN53jmwPH5
	vKyjvYJfZNdKf3ni2PO0xPUWr2h9fMt6sSNkXC2b4msAaKT+rVA3anvifzvpuOZekjRflvDFDc9
	/Qy8wOMVxu8Ppw3Z4nEtWq7frHfBUq8bup1uHVoMeZBf6x0H9VwB5W0v1sHM46eDanbt5GboTWD
	ZsMrox1Yd8LG1ns+U4b6+oT+ZdL4qOj0fcFO8apQeeQVSHa+2i8BO0NL8J/ZZjaLieJa7qTZDnp
	mDIv89qC9nouWTSSP5oTSi40FaoX0sApEx3/gtdLhT1K3h8NLOHrg35gxSTh7sv9dBrAWa0LQbp
	/c7F9hZntTaUPgb5ORYM3id2BD3GdZgU+lvv1lk0jK/7LNSNwLgIFC+eIdOKf5hr3OWIh+010W/
	IOHtDfhIrvbBzShrZSn+KEG27QjkAnRp+pN3BOdkr79bl2QJ183NaoU5iqQgd1qkXAOxBfSJ
X-Received: by 2002:a05:690e:16a1:b0:67c:17fb:ecaf with SMTP id 956f58d0204a3-67c67ee4a9dmr690322d50.26.1794354732657;
        Tue, 10 Nov 2026 15:52:12 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589f065dsm3149000d50.16.2026.11.10.15.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:52:12 -0800 (PST)
Message-ID: <f127954b-2255-482b-aa3c-cedd2311f77e@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:52:03 +0000
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
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: qcom,sm8150-csi2-phy: Add SM8150
 CSI2 PHY
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
 <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

Thanks for the review, replies below.

> Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:

The hardware can do combo mode, but the driver only implements D-PHY and
returns -EOPNOTSUPP for C-PHY, so the binding stays D-PHY. Would you
like it documented as "not yet supported" anyway?

> D-PHY combo mode is also supported on the SM8150 CSIPHY apparently,
> it shall be reflected in a way that two endpoints could be present.

Split mode is described in the binding, but the driver rejects it, so it
cannot be used today. Is it fine to keep it out until the driver
supports it?

> In downstream camcc-sm8150.c, PLL0 is on MX, and PLL0 supplies CSIPHY
> clocks. I believe MX shall be added to the list of 'power-domains'.

You are right that PLL0 uses the MX corner in camcc, but that corner is
internal to the clock controller, not a power domain of the CSIPHY. The
PHY only consumes the top GDSC; SM8150 uses legacy GDSCs, while on X1E
MX is a real power domain attached by the PHY driver.

> Still it would be preferred to get 'vdda-0p9-supply' and
> 'vdda-1p2-supply' properties.

Renamed in the binding on v4, the driver and the DTS, matching the X1E naming.

> In general the change looks good, thank you, but likely it can be
> embedded into the scheme for X1E.

Clocks, register offset, power domains, lane table and timer all differ,
so folding it in would need if/then blocks for almost every property.
Would you still prefer that, or is a separate schema acceptable?

Best regards,
Andrew
