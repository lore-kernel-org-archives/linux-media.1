Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793752129;
	b=sdKPsnDPSYAYLszSSk4/OCfXPg34qwSl676lVLpoiGOejRh9IA+ZhFqVmTY5LElJCjYM
	 wPHI1puLwdNL9YyZZx8knCUwNaHFOcXMVrz+M+tYLOK5QW6lZFKktGgDInon41v7fenPn
	 YRElaJBR7rGdfXNnf0mrEyzNzike11ij8Z5Vtvkl4Sw6IvVCX7e62kfVOMk5LsY6Cn4vM
	 HIJZcCfYMmq8Fxes2oJfuRS2S413XjqQTkojGweIrQOhKoy92XCgg7Ta5qVzH/OEHLMXT
	 vooqADzYf1EEGIsIGh8Y7nlcA8fohJRKmsCJirVFQtRPZjta6f+m/r7P1Cape7a2oQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
	b=D4u3kQZg0mNKPekZP3HqN55TTslmYPsIeqJkSpWpPuuaooVC5J2MzX3/fajZItApyx7d
	 NP73Wgz4EmnNVf59UtmAuIy2iZhdFtrc2DDVD4l78bCotmc1GqI80920GGkUaJ/GlBP8J
	 KcQzi9cEykAhxTnDxr58UbhoH81Vfk5OPxQi3kjSIe+s3xMEoxgCuX/aaKrd12FyfyyAn
	 846BzJrcbNKn/i5cXUv3YcRfUVz9eYln817zZJi+SaELJHHBWUTUYDVOGhHpjiHYsBJxv
	 806T3afuR2GolEtqjIK+uj4gSU27/kdYK/Otbx6JyUHBBNoImAIMjUmNIB/S+KpLR5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TGsmBkKL;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E2B606A326
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 00:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E2B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TGsmBkKL
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab35a9d9ceso458831fa.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 16:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793752127; x=1794356927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
        b=TGsmBkKLz1TDbJ3HJ/Y+7unQZOZXwF6ZCda4Iz+qLp+2tMQzBg5Zu9A3hs4Phqsr30
         E6BE1XqfjyioV0JC9dsqwTYQPD9UvuiLKiJVUQmfWORbP3nyv5W+7DcI1aUbl8L8RU0V
         SZybREBo7gKJXMceRZRrrkDIemqSjb+6pH4pMrMngl6oOeiAS96qG6IRT9LoHb2Vd5y1
         GjE9A8+OVpBTCQVff5YIYms+ehQaZ9uXtUUm+INf3unP5YPr4ZwbEQTVrnd2cUhTC+Q4
         S+jZFPWmds8hCqNOsBSSi3UQ/x1nJrdDw0m4cl42pSxZDQKj3jlscyuOewDEjo9q8W9t
         aLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752127; x=1794356927;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
        b=sMlUnlj8sOemaPIi6ivTCGOHUTpWSBRGHjZ72BRV3CAh/3xcuQwa3FvIl9NSGVlqNH
         K5C3wMX91Ol4NJNCBdP+UK+vcQAOkvAWHGQlJanC+jjJ9TqxeQrfaafyW1K7WMxCbLBV
         f9G9irHj+FaMJ4UfbjVf/b/vWwu6UdmcSAakZieePUPWx7qsjMod4WvW//BfKouWpEkn
         hykns9TtUZyQ2N0OdgNpamL2JyZh37dJYuWqkD7+7RsiwXlZ7Eo71oEm3stkddhrMUKY
         ktSvAwf6GSyhil4g1+P3w9LpFnoqrGgDJImKZJG7F4LwkxHbQfyUSWMEnouRaDM4jbPc
         EInw==
X-Forwarded-Encrypted: i=1; AKwUvBzYpqVajjp0rghVLb35DnH+c3emuf43jhPe8w1l/6QLPJjYPrGU48DJia9BbdzOfg8VOjzbq0KNxlBk+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/i2KChmAMntJn4vYiihJgej/KphfaeJNYRlb8JNOsoWjx+YwLN
	DXa/3nEqa+fkokPAtOfNi/Qdk+If+T9Z1siE8Z6CAPtvPi12FwDegk7ZKIM5qikvIYg=
X-Gm-Gg: AYBFou1w0trgbXBJB+ldZ783P0z9GttFYnv6d9JX/kXRJUXLl02/s7qOfnKLNqDgYzC
	3uvGQGH5aTKGFYya9C/+oceqEk4js1MkPxdIdrl48vD5PMoUhMSYdPriF7Yh3BM9DkluIZAAlFZ
	V5pV4n79ts8KbfvpWf2QiAKeSiztchGTHx1djJmq2M808PJ38nlxsFcOXK5b/1DRrCfGXQbA29k
	0qXJwK/hBDQbLXrCBtk6eX5Lhd8Y3vgKoh9tjCUawWj8KDL40JTYMu46C63KuZGmuq0e4S/gWed
	HCC7ArjGdWNu8i4GcQU4FWIMXx6Qjte/2iyihWLa2H0e4qYRKD43taP662NSsUqV6MTGU3cpw2w
	8EO+zFVvS6r+LVHDjzDV176swpjWf3B0mWAiaW3EC04xtKMsBlcAkDjsXkE0V2Yc93wNwmppuGE
	awxLjlg5YQCk9y6PaCO5nyxlb4JTqjyrihhIe4F2Ha3U8VDPJkdyJtMyEbjk0xhHIvULwEMAIaN
	F0s3j4whf+4weKl1NRS4PrNqnOj67VJ1O5kjfJZyO9H2xlppW7ItRJwwzrRc0j+9YJ76Kt50JHc
	gzarWRhVhQREA9/DtGOlZEt0n2zuQo1r3Y5Hi+47vedJq+O6bzLQkIyFOpzNGPZMivtyZFvqdfP
	appMyqw==
X-Received: by 2002:a05:6512:4041:b0:5bf:ce24:38c8 with SMTP id 2adb3069b0e04-5bfd95add38mr4540761e87.4.1793752126952;
        Tue, 03 Nov 2026 16:28:46 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38d11dasm142334e87.74.2026.11.03.16.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:28:46 -0800 (PST)
Message-ID: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org>
Date: Wed, 4 Nov 2026 02:28:23 +0200
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
Subject: Re: [PATCH v2] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org,
 manivannan.sadhasivam@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
 <tencent_964D3CB9DF49E7B244CADB34F5E05A8BE10A@qq.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <tencent_964D3CB9DF49E7B244CADB34F5E05A8BE10A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 11:20, Shuai Liu wrote:
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
> 
> With CONFIG_VIDEO_QCOM_CAMSS=y and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
> 
>    camss-csiphy.c:(.text+0x51d): undefined reference to
>    `phy_mipi_dphy_get_default_config_for_hsclk'
> 
> Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
> which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
> transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
> consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.
> 
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
> Signed-off-by: Shuai Liu <847807867@qq.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
