Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B203DDDA2
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250813; cv=none; b=Gl+oJemza2G2KKlEuMLZzSljwu6jsbM4qpNLyJYZhunJDufYr13c1n1zMGuwFbzu+XxapNDP9W7zMCpgqiDwN1p03abrlrgvzojfquy6N8cBq63FQhYngW0+GVvvcPtlfQZNwdiApfocl1pmcG5uLKtTKTxLD6vRyAcIAzpRr7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250813; c=relaxed/simple;
	bh=/oZQN6CLyIMffYWm3DYjqjp43iZSlTeBEiYorOde5DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEu3vLIfXEIJJcJ1R6T/Z34HNugh+DoHvpiLgTQw7m9YmvM0pEC0ULkeFG+UYdzl2CtF0l73Z9gDFtdO53IaTOUifBT2nelVVEQML3pm9SKv3QlrXC2bjn0JSJARDknQJrc8rB3sYKydkNqGfGZDgsNL9wH57SLRrkxWkqH1kk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ce3gqpem; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ce3gqpem"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-396aa835272so356261fa.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781250809; x=1781855609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=;
        b=ce3gqpemPOhLIiozeWiDvK4SKSxpcsNzFsE7a0IITQaN1T2Udpx5u9iAKze2XnUTRM
         /a5N1yUrD2q/jXd71nR2YfgvtVqqoxTiApaOoV1zBqDkUNWINhHjirumqSqwTSm9/XcP
         KmRAN6ZYZRK3yeK7470HY3tEWGbKwMu2UmJ6ymSCbN8Vt3X16IiX0FG4539kcAaPBuEe
         wFlWEbvPA9bkM5dD1j6kUko5YdVrbhz4h9WBls3h4GVTtCReDb6/OMmOwyJq8zxSsEfx
         6YUKTlo1gweG/9C8x2Ggdwrc58D6ehVQNqk08IRnfywwGNtkARD9rfWrdyaRAczRWPHO
         R1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250809; x=1781855609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=;
        b=VqltjKntMAw03nj6edQ9ttn8/Pun/aGFQXVAXVZZjvngsSKh0LWN3PtUUMK6jOpmUP
         6445yFouuenoWQ/skxfOjW/5BcTesxnEMG30uqEa4ProY8tA+mQZDLuwNlEl96Wn3IiL
         2hNBMLdhmSe+zyk6w0Kda2QYN0WwsTYnbRDEPVvzsNaG5v/aUjAFr725YvAH24oGnH5H
         VGUjyFzaD8CczuWtnJUCG05qwNgDk3OhWAz0Dvy3uT8J7L/2SVlleJIF+U8dg/hCJsMj
         oEfSD3XyAKfkjYJ/Qjfvmr/BBBaTZVI+VgzRQmFvzci6xIBqf9D45EzJpslqWxN0MoJ0
         0C4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8P9sxIEukUNiFCK0G5U4wM8jBvJU65yo4MBuSNVCmgaTkKYepuzydILX2JfKPvw8wPMZacB1PdOFs/lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhXjRX/0NFLzBVPXsfzy2N34tzgPlKrrfWdtIWxGON/xJZ2WJ
	IxXJdZtt+Q5ph0SAq8cZ5Tp78sLFicIHkHV/qy9QaePylvNR0DU8Rh7SgKddKmhZIxg=
X-Gm-Gg: Acq92OFsLbdwZZYWNBwI1RF8eKN4ls5w/LvGIj51q9U0yLMrcnRbqp3kmGo3lvUZ3CP
	aComuG7UDkf5+ARVWgOru0JJ3ISsgBYIpukQAWv/U2+TQmwizvx3Ku445TzdjPBWe/v/POs3M3x
	Fh85jltleumvVHrFTLtzf3HZPfA9ryxidPkrrzX8vTmgZ+rT+gclFwLlr64p1WSfFMYJW0kDUXD
	l7awDSVXeELT9swYFhb5n6+zg5YBsUxQIe9w13rKuW/ObpkcOYe5kPE+VfMHn0M41VF8lJBsQNl
	Ukz4G9qkQhGMOJ25uEj69CMiCf/FrwK7punxXDV227DrtF+Oc/FaXlXUHFPNaaAnphtuqWUfJhz
	pFR/zHfiLyisnPX9XCuM5kcatk+Kuybp9ffE+F6c87ylDl5kZAtssVlFsUQfYXegqkpeCIM/CbH
	9LgU7kzR/33Lvk40VuyY6KFE49BG3yhDLf2Y0PB7rNGoNtXVwXrozEBOZZzk4F57ooczyhtmOrh
	u46MA==
X-Received: by 2002:a05:651c:890:b0:396:7fd1:f574 with SMTP id 38308e7fff4ca-3992b03d73emr2255821fa.3.1781250808762;
        Fri, 12 Jun 2026 00:53:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f1891asm4038351fa.21.2026.06.12.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:53:27 -0700 (PDT)
Message-ID: <a63182bf-ba40-414b-a630-511e97938529@linaro.org>
Date: Fri, 12 Jun 2026 10:53:26 +0300
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
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
