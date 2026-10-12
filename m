Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BF6369D64
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812631; cv=none; b=uEAfZ4AQ2VL/jwLiXNSfKvklOS0r/IWdsZEfKB23e/6eXr744bJXOJ5deOXKufpdRbzKwYftTitSlCO5zsY1ZQVlFmL5O7VddOvFeJ0Bmb8cPwmZSYvJtfMnqrdXwtq1oAKA1BAgij24nS/wx49EUCZsiLoAxrR/hrRojh6Q8JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812631; c=relaxed/simple;
	bh=klYpvtSOAIez44kpWs1v0eOeO3eNpRfwfPOMbeNagbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fN1TQ+F+Mczk1eIS56gxMpxxaCZI4UiNa9NmgEOPxMO33ch8vXl0qqkyXv9gZDQkJm/DhS1sXSjCiQWj8ItHEHYd5oEIRcaBiq9jSi0JMfQRFnNR3CGl+pjuDnuV0D+z6nrz2WDXwml5+crSQ+e1ikhu6qSefqj8N5BOYNmXe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=svmyrrrU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="svmyrrrU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso259534466b.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812627; x=1792417427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGwPh++pWh8JXmtP/Z4yTF2OlJIVwWazwmaj6HsGs3U=;
        b=svmyrrrUo3IBwVUrHUz5XOIRL6IR4SKFPpuJiXCQocCfRp2ykDDOQxpdLn/6csAZs8
         3snMICySepg7Usag21gkcq/lEWG8CPCQlQKbk5r/PrfRCCsMSTSsiSGolqAVdL5fw94b
         eG3p8KkwqSZ8eEVJ6epsxq/tKief/HN6hotKiG7uZxZTnNtzDC6VVK3NCl0VOe5CqwnC
         ZdQlUDrkS4T2A9sCLQzuQ4qWKGEBMUER16VTe5AzukvKY1579jmyIzZCzbHKWCof+6gF
         xodnr6RguTZtOfamTlgIjp/Aiy641NmtRcW5rm+TKnXFYGQ74sVJBVFPXfSrCwz3zjIq
         T6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812627; x=1792417427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGwPh++pWh8JXmtP/Z4yTF2OlJIVwWazwmaj6HsGs3U=;
        b=BrfO191L3/6ZBfNEu8fFFBZOjNl05pRemPtVl0Ary1WMYQ21OwjKxExhZ2tTRrxQTK
         K0i3FixHasmHX/MfQkcx2qb4Jx/dZOpimh7NTHLHz0iazH5BPtPysVsdEPT/6WxTRwvQ
         ru90byDJrzpNiiQ/foj6BGAiEDSDF+THsmdzXY5M5bfamVoX/C9KmvRhyNs4dao47yuB
         8VxeNMKiKs4DKyJmqYbdpIULkxPzii9ALnR0ExPlzHr+tPCWMGmBD4VmaWVaQIC6YVTV
         UGAc0PSw/IQICzmYSi2EJ9M3zydXQ7xEXmptbycQN4DdElk0ifJZJrI9l7iD5Z8GUqTn
         babA==
X-Gm-Message-State: AFq9FYLSRIZykbsTIgaVwi/mum+jXm8kslY1jKPNj9bV0AgjgmK82jfG
	957ArWmzIeNXs9sK7QeNtNfOmbUf7irmtD1dGbeffwjkpVEfVSQPbC+hggULnqqW0XqIMwWTplv
	mlGnDid4=
X-Gm-Gg: AYBFou2ngEMNRcU57ouFmvgdR5xwab8R/V+Q60GfP9bprUHubxf1Obfr99391cDG+O+
	K2G4Swhm3h+wjNxveGLYUN9pDfBh06CfYSIBBFLdHO66klHMaURMbKfFNN2w1wQDliuTZ3jMNGN
	jmEcGz65FopLFI0kUxrkC028qr8z1L2mlDGywdSjZn0caRNqJVekCReESuM+7zX0BYhIBcuiJAz
	EsXycN7BQSRzn4kF60e2YmkjsnF74C5s/mRH5GgdGvLRVrhq2sBiUKS6Dsy4xFmwrmuQvjmObEY
	KoI6de7HjKzvK50dsgIaPsf6pUmXgR3UKkdIuJE4P3ROQ8NZE7om5hqVlrGUMcO1xFyOC+oUDEm
	2D1D5Lt8v2Vg8cPhOIl531AtNVjQGSkaMttoOOE5C3pVk70RcjD5njHyrrrR03gPg6DMgq0LAA3
	qsNpQqv3uplKext/0QCkXSq8qmSosqmigB8PkMfRc9aIRHVdRi4PyP1fVBsMJy6ETZbww8ySXXn
	WVRujQRsGo/13IcB05a/Us=
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr897992966b.21.1791812627292;
        Mon, 12 Oct 2026 06:43:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3456933dd1sm168189366b.50.2026.10.12.06.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:43:45 -0700 (PDT)
Message-ID: <4ba1f9b2-c300-4942-b686-4bd690c57418@linaro.org>
Date: Mon, 12 Oct 2026 14:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
To: William Bright <william.bright@imd-tec.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
 <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 14:03, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs.
> Allow their register regions as optional trailing entries.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> index 4b9ab1352e91..05101dc97711 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> @@ -17,7 +17,8 @@ properties:
>       const: qcom,sm8550-camss
>   
>     reg:
> -    maxItems: 19
> +    minItems: 19
> +    maxItems: 22
>   
>     reg-names:
>       items:
> @@ -40,6 +41,10 @@ properties:
>         - const: vfe2
>         - const: vfe_lite0
>         - const: vfe_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +    minItems: 19
>   
>     clocks:
>       maxItems: 36
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
