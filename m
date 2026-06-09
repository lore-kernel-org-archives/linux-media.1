Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F7367B68
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995196; cv=none; b=jrPZxNHelhk7Qjm9e96CkTvquchTMyx9l645R+XFOpx71uHZbaRhjpJ+ZH0YnCYdBvdZ/GhuE+r/7HPHVbQrzXZuGourV2ONnBxd0fbpMgv/Jh0xJVKnbASHVUHPdOJGdhuY3cEv1Y2n8IES/BVfnaBH4IKglTVU7VXn6n4Njqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995196; c=relaxed/simple;
	bh=hO/azaYVEfXjB6ij8N/yUOBnpCCFhFhBm81VvQU7s44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZHujn743De5X6CTf1QF+KXVwaEhq6x1HzSLIlwFKjSIcWFk9u0s2uBCQvz8Ej+auVtMIJua1jlA+hlOKDcc88Ah3k8odeGtmBzL0axkqx5qvnxgK3eGzHhhUWWoNL6vx4nMroBgIqUzGjq4DDMbkkVbXAJXB+TCNZifNNGordc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mx46d0J6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mx46d0J6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so6690883a12.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995192; x=1781599992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1J30wpRr/zoxFVY10vvN98wpm4s2FZR/qZwrLhfn4I=;
        b=mx46d0J6AJ1751fVgfKsmyRULlgl7ZNWXoFlySMWRtrYq40PeoQJ8t3EqHxIjJkQym
         JhypGRH/2mhfovyf5+N9xS51RqRX8r0dmvL0WQThPeoGD99mM9ovYoXgizAy7qLU8O8B
         NE1Q2hpv0YAqdfT69fZ3ktb6PQonoIGqH02R6f7asVB0ztJXjgLJMW/sQOTyqz+ruWBi
         xrei1vWRKf3pL2LJ7+Ysk/7H/TbXTXjSD/cGZFbZVTPkzIFMwhXx9h+QJaWZE5+acpbo
         OFT4UnCzFrXrAtjNX8rQL4hE6xU/ND2kifqmMRtkNvjYwAVECJ3aBf7kvWiG0T79abAl
         ttXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995192; x=1781599992;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1J30wpRr/zoxFVY10vvN98wpm4s2FZR/qZwrLhfn4I=;
        b=FLgiJu4rBPIOpL2R3CxhujRFNMY3JeM+ICkFbbrCbywz+pJwf4YK+iANfttVd0W/jl
         5STgvutWjKInVol1Arbz0eSDA6Fz1nLpiXIRy2iCYVwwjdzvBrTYhsedWTNFicTkzVed
         aovqAZSEnd0xx6zs9GY09Bb1X1TakwZhI/fFWpdk/2GRdOdvnhjek5TyS3yMfhBe1H7R
         flAr8ULTdg1ETqtNcuYl+abZy5gPqn9wmUO7f3DW9vsAUAYseQCkThdqUAGuaUfE4S8o
         gYD95BiG2CPRBBC1pn5r1Pa8Pgp8BnK44CSvZ3/xhoSZMhorK4jsoGawCTavgYQujlou
         OKHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/j4bRJ9RjHaTkQdmGIPHJ3ocYoaKqA4CJnGKHHBsaU1GtH3jfP6TLVvfsoQfRPRjn1dFUJ8AIBjzI9Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04vNU21srORKq/2NUz8uPl0BB2pT/mbiikrDowQgzNRADHZHA
	7Lm/aYpmvcum5IoikertwMjOl1h49wK22zr+Py0BEoWivvoxbwylFe2O65/tucXatM8=
X-Gm-Gg: Acq92OEwkEuLJri3rUB6zrMUMspIfVsKknBmcNPBsMgDRVsM115tVw+/M6rDrKDTRTM
	skhPfPecIEFu5IyeMXnqFtyXws0gu5K6VK6ZlLjVi3pUYzSXcKsIWXG6dd3COHnTTg5HoTzzKOC
	oZMAdQGJJuuLBbUXHApCwInevox6VFDMJlKBUma8nucT0nFpzKrcoqS5vmhLxT3zClNPS9YTuES
	aFJHx015NPhYO71wnrdg+fLIH/SptwTB5CYFBkuuL+pq8o5/oNHEQL8cnI5XqxDiZ6UGjhZouqE
	fRVY6F602UjHsxDwdhDn6NtjrKuzZ/utCApoRYr8Kxs6gBzhdaS3c304qtRUxz0lii8PF3Q7I6q
	U+LsiuOZ3v2erx8Ssyq7tlXOTsZ+lAS7OyQuDi8o0V4b5Q87oZeHySFIi2fTdBwBRYjSod23VSs
	fqoF8ywz1zceSzUYT9ff+GOL/xR7HXbHFLWJpxdpBOHWiF
X-Received: by 2002:a05:6402:4506:b0:68a:88cd:eb22 with SMTP id 4fb4d7f45d1cf-68fa535d734mr8754916a12.26.1780995192260;
        Tue, 09 Jun 2026 01:53:12 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c722sm8240110a12.22.2026.06.09.01.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:11 -0700 (PDT)
Message-ID: <11db2b96-975d-40df-b902-c1772f83a1fd@linaro.org>
Date: Tue, 9 Jun 2026 09:53:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
> platform-specific compatible string, using qcom,qcm2290-camss as
> fallback.
> 
> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
> single IOMMU context bank instead of four.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -14,8 +14,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,qcm2290-camss
> -
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss
> +          - const: qcom,qcm2290-camss
> +      - const: qcom,qcm2290-camss
>     reg:
>       maxItems: 9
>   
> @@ -76,7 +79,14 @@ properties:
>         - const: sf_mnoc
>   
>     iommus:
> -    maxItems: 4
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS VFE non-protected (VFE only)
> +      - items:
> +          - description: S1 HLOS VFE non-protected
> +          - description: S1 HLOS CDM non-protected
> +          - description: S1 HLOS OPE read non-protected
> +          - description: S1 HLOS OPE write non-protected
>   
>     power-domains:
>       items:
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
