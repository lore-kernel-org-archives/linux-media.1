Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E547ECCC
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366739; cv=none; b=ax8fMfF44/oeW7BakzAD6sV6Ws4I1W2QMaV4+JXMbV6chaHX3po2/onlYGUl/fijldY0Uc+AUdDNLjGjUMW2VmFVkU70WECFRs3VWfAy7wSyuqMlEA/9u1DX92a/pdzIF5NoFkl+MtC1o4/yZbhBOmOgmvqavSe/DJaexLzlsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366739; c=relaxed/simple;
	bh=A9zqlCOxjRlPR6veYqUZq2yHzXNj7ksqudP06P908Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+VG3Uz2RGGvsJaFNss2pyD3GdKrcODdmzAfBd3+UNzSDZAMdHkCeDvF5N1LdPrO9OUvYw3dKmGV3ghylD4xatbFKj0Og0igtiAi6BoxREwkD2/2sdIODVlcj+VqGiuYQInmGE9X8uD+ZPFbzqwkj8O6CsBlp5GWipSFStAElzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJQcdaX1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJQcdaX1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a02718da81so13502455e9.1
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791366727; x=1791971527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTCkoZU0MickLLuynMxKjy0YUIqhaSwwD9LsZbzk31Q=;
        b=dJQcdaX1hM5UJxG5DtkGI2oRPMXqempOR594uf9pqZjpG1yzcicjFbQOYbIEDfxE0f
         IJASTEU+D3ZWknqSUl0PtuWpBKwVxzeBhQq4eMxNW1VUy8GO5/SPZeiImYAG2zyQgQTJ
         w7inapaFSHrf0SjynUBULolD26W/C87gtT1eSycnsGtAlcm8AFfsCxhxuREcq2OCoigA
         xosXm2JS3aDM5S07ZreIpNhMIhWmaQX0sqC/HkGE1UORHKksJD5t7D9KjyBTafTuFoYe
         A6S0BUHXHBAnIFQgoAPGTqKmbD2n2Yb9lxE7S8ah85m5H7tyyEA4IKsXgXP1mthWH9qq
         e6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366727; x=1791971527;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTCkoZU0MickLLuynMxKjy0YUIqhaSwwD9LsZbzk31Q=;
        b=hqzNt3njSVA75xB9MNu8PNMWqW8lkbDC5pi5X50Oy9YtkNLQ/rzWe7hxUs79ZHW1JV
         w2cA5RC8gWdbWgTf4gU77uyK9VyAUkLRmSJRwdFDuVr/vnPav6G/GLZDp6a8EwRYqyEw
         NV2D6v9o18jvd5PWdiplytdm57UrxhwdcwvJzJGFMTYDCFPn1Nhua5hb6Z2WgTE0/hUJ
         6x3tivrclv7GWL/5w0tAcQWESRkOVJB+NOTuuYrJ7jsSXJsDyfvYkpZlSoPkOV8qYV5B
         Oqr5WgE0BR3zo+9NS9OzpwZjNhWqLBuuWUitk7pWE1tfawo1Ey4T06LhUDwKoyxG1t87
         UN8A==
X-Forwarded-Encrypted: i=1; AKwUvBxiyzucZFpfkD0nKyioHa67CiLFGDXIq6dN81fH8Juq01mHp07++7sL0/VgZIJijizXbK1aJoXXe4lIRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mukUo1i8Ocet4433/zjxkPFDy6hOD8AAkYYcp+yKcISySF5d+k
	Fap3lzIwtMBp8W8bKViNRlIPE+8WBb6bhY8/2y04hF4HS6iVEhxSC8AbxpTJ/3u7PrQ=
X-Gm-Gg: AYBFou1j/UNfdc/AG9daRR8qz6b/IuFNoySFnSQ/+wA93Kny8XRJW2odtb5ZfjBUyAw
	pYBLOCpKs3VBDzXwLsVEXboTgAwX25KsbRjZ3rG92DkSYfJBRXvPgkIc/tSw4YJD9tqfzpG7e8U
	hIz0pLVASURFa+S15Z5oUQJmrs7eIQsecQI2FZco4jWKUi3vpZwCv5uM9HOq4/7wQeMppGRk+k+
	r9hqg+gIFB1YsOsudo+mhA0GFT1HU/JABe6F59kpx1mYxoOjxOLqaELXzSUMOO74r4wGFUjXyV8
	CUnkmWQ+O4H+fwK+KjBTJNy9ogumpCaviTC0afABZ06TaVHW2SglYNidO9xHe5aSYm9rneZLMF9
	ApYYerItePt50c/W6Fxbg/4/WK8qjh3h60vU3/mL09a0DmzRLZH7ahpk+cao0KFqEAqfutg4DZ7
	jwlnsABkU2b+kwa9SCr1xtXtZyZ60u1QjIuqNhEtJBp+5QyCTcFvxIHntjXy0bWajSXl+14Z7wh
	8NcAnw02GnD
X-Received: by 2002:a05:600c:8884:b0:4a1:80d8:aeb3 with SMTP id 5b1f17b1804b1-4a180d8b0f1mr16568905e9.12.1791366726900;
        Wed, 07 Oct 2026 02:52:06 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm54587755e9.14.2026.10.07.02.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:52:06 -0700 (PDT)
Message-ID: <e7c46f2e-fa6e-4cfa-b16e-8fa5d2112db4@linaro.org>
Date: Wed, 7 Oct 2026 11:52:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel
 path variant
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
 pshrotri@qti.qualcomm.com, Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Document the qcom,sm8250pix-camss compatible for CAMSS configurations
> that use the IFE pixel path. It uses the existing CAMSS property
> layout without additional properties.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index a509d4bbcb4a..d561179be48c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -14,7 +14,9 @@ description: |
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-camss
> +    enum:
> +      - qcom,sm8250-camss
> +      - qcom,sm8250pix-camss
>   
>     clocks:
>       minItems: 37

Same feed back as on the other binding.

Enabling the PIX path shouldn't require a new compat string - 
Lanai/sm8650 operates this way and x1e/x2e will also follow this format 
in v2, v3.

Lets please align to that and work to a common cause.

---
bod
