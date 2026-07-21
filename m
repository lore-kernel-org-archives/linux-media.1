Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDAF4189DA
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671362; cv=none; b=oz0oQDCjpr14ZQBU5PuhKrSS5lp0ZHhIG+TV4pCtr+yTAhVAExNFWdz+KOr59R7ijJzD+hCegxYXxJG4MkJYnm20Le6iJ4G6JCXrY+Aqo9xAPqcVEdFXLNHYL4wus7dMWo346t8INEBGzkdOD89+rOp9k8dMdDInzcRAwfUzfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671362; c=relaxed/simple;
	bh=T/VkMFPUv3Q5qYauWlQZ7smouZ3swOM4/oAl9Uvfjkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lz4eUr6yIZbObMG1JIaHGc9T9NdcoSQS4p9VWm67tfeWCBrMU6cQSwII/qoswxAQKox63G2XZNuLeNArlvygLnaLgYlfB4xGcYrc8qgXURPvKlxEZ083+oGPOvx+K2VBG3r9xi0LiCzIo+h4RjTNiIqHJzFuYmHEjp7yO5SlCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Av93SSLp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Av93SSLp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so85579745e9.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784671359; x=1785276159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPSg3MjVVHYHBL8xsGemBcS28WSKAlhtJKnkhU6oD9k=;
        b=Av93SSLpAJNkb7MhhY1beSXm9AQ/ak0c2Bc9/yhV5R3M7BqJQuKLGeiwME7HgSh9MY
         q+AsoJbwnjAItJQI8Nm1BSJ2X2tHB5EEWMF+pre05nm98Ekh+gawIneuZ84zQpUqKGwO
         i0Uuafs4YsW89LIT9+0WiKUxsDXpo4njdg8YGxGR+S+hgV4BD4XZS1da2lLVWfJ9SeZM
         wLDPD46vDp+q0I3UE7nk7buCj0pbOOSxLFBpgYizz5vlO9iMM9Ywb67RBuqRMTDZJlsD
         KGAVL/mmIb8bQe22VPENbA0MXONN+zuQatD6caGmYUtE+FgaLkZxHazwQgk1C9y+zuvp
         fS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671359; x=1785276159;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPSg3MjVVHYHBL8xsGemBcS28WSKAlhtJKnkhU6oD9k=;
        b=PnZ9PhUFbOPNiVWG9U6h1HVG40xnO8B4bpxihkqyFyekZFLM6a+eOPBbsIyfpn+Xbq
         x9SnIcujIGnbxZdwTFxFq7L8fj+j41mWcrEVuRixjX6Dz1Xm71Nr3Qrz2f6Ebuji5kTZ
         I+mazVVIAt7jIsQZmBrgJoY6OQ3J0Ch+WOvpHsjPzanYQW/x+A1t5sPIQjv2J3oSse4A
         eT0iyVqLIBMmzZJljTAShpSrw036KymeQ0qGyX8R15pZ1ne9q8k2OjXiQTs13xEopCnz
         FFlHY64M/Mdhd089XBD2jFDzib0dfif1V7pHQ3ciSIRN+QowklAXaY4dd91fYkWz8RSt
         guOQ==
X-Gm-Message-State: AOJu0Yw2QZxwQkJvLgj+yNkxs9U+rCeirqd7KT7LtPamzK27r/fUalLs
	gKIyEzleYB/i8FnUMwrPUQYrVVHhWwW7EjWJBYFHoxnW92OsnruvbDChWvT589yo6KI=
X-Gm-Gg: AR+sD13GOHqYyLpi/LbQP9a0NzVgNeIKe27uR51WDChcB6V+EEWY29ZdI3NYSTn8i4G
	d+x+f8y/qmwq30LCUyWpnGaXNK53k0/ue+zjhM9omRj1NFkywLml9+uVHmwpTbO/TJpaIRVsVYV
	hypx25ns3v9cq2Gn9ZJ2AB1HdNgOD3rlM6cIv2zDcBdqcgNjmCfp5HQ7p2MT+pTzQQC4XjjoE9/
	E8sGJ+V3E9tnP4FmTfpvVukQd2AKCuQS6xW17NNIsWO7m16c/CH6BlTTKkEtlOsAfcdfV2UlnBC
	lQ86aLho8/VOc9ucwqLoAhOglxZC0bWpkW6AzTvfs67dZu5wpyDZe1GHxIQGGQBg45TMLjhHq77
	CGGVGO2Qf8aMLvKv5MCUrUnbjZDF0GR8m8wo4xXFmZQte9PZf7D/4U+tG89+i5kCkTFxwMpKldC
	8tW4Momv+J2MVhN3I=
X-Received: by 2002:a05:600c:190b:b0:495:4d35:5eab with SMTP id 5b1f17b1804b1-4954d5a2d76mr203295865e9.24.1784671359200;
        Tue, 21 Jul 2026 15:02:39 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653698bcsm88625915e9.2.2026.07.21.15.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:02:38 -0700 (PDT)
Message-ID: <8163a7e4-675f-4d6c-85b7-48d07f063a67@linaro.org>
Date: Tue, 21 Jul 2026 23:02:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <gCmRXbwBpa-hkTNAvWkjhFvbPk73RIl1OebJb8Iae0gLmAr2kcfNoYDnLhyG9EOKGZZ-jhn7F8f6vwQWrGPhJw==@protonmail.internalid>
 <20260721-camss-version-v2-1-b2440d99085a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260721-camss-version-v2-1-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 14:21, Loic Poulain wrote:
> Add optional PM clock support to the CAMSS driver using the PM clock
> framework. This allows CAMSS clocks to be registered once and
> automatically managed during runtime suspend and resume.
> 
> This is especially useful for global CAMSS clocks that are shared across
> multiple CAMSS subblocks.
> 
> This avoids the need for each subblock to reference and manage the
> shared clocks individually. A typical example is the set of clocks in
> the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
> blocks.
> 
> Introduce a small PM clock descriptor table in the CAMSS resources
> structure to describe clocks and their optional rates. Initialize
> these clocks at probe time and delegate clock ownership to the PM
> core.
> 
> Hook PM clock handling into the runtime PM callbacks to ensure clocks
> are properly suspended and resumed alongside power domains and ICC
> paths.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
