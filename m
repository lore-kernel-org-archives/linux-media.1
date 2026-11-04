Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834180;
	b=U+isouPNyvJrROIZFHZopHfQ26SwKxAPrDCpbCJzZYRdhUTU72F/T8XNEJFzr2V2Uwqg
	 nv3POzjUiJoXWcDwkzh9JqxmBIXlehZ4Ym70KISZL3CoTn63lYBWcmgPZuLdTkQ8QFig/
	 jZIwDxvL/eJqBVPkqaRzLBr8KgLjHfbfG9cpUQDHddeXHfet2mklX0LPGMnE1VAt3KY37
	 foqOa8qSQY3nWcAqrUjhQIVVd4jFDb/LIpt8Eor2HoEKr7DgRq46had5kwE2Pl9esf9v2
	 AyOCf3ci9aebonoROnrTcgYmgisSkpAovYspu2fm14tv+5yQgC68luCXgRQas8CWMIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
	b=3sckYqFql+i8qlGVYl4W2qKLYVAYEt15ZteR8LNaamfwByg9D5RVZ+k47onCprP3PawR
	 ySrlMSV/3aPM1O+vPbraE6NR36mxFTb4lvk2eosQwIOusprZziD79LkhQLYGAPki+Aaiq
	 swYBd7CBMip5NN3oEUZ9SJFXbKUMTK/dgva/9rHnPDg3bNjxDuz3RPajcx8yF2/zLOvPo
	 vBgiW78bSxkYnWGbXN/IdH/kkM6n1RnxBabRuPycseBR8UvW5dPjgoem4+VQr2hXy0/78
	 Bgo1R0zjP4tiPvlUO3P8mbpjZEeJIXZA5VtXnqLKvYRkMWIxX0fOYBoUAiTjJmQgfjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MaYfUrSx;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A335D606A32C
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 23:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A335D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MaYfUrSx
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3acd263d530so2339141fa.3
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793834178; x=1794438978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
        b=MaYfUrSxNAlGHW/moCDpL5dx1KkBp8SvB1mgsR5RSl3YCfz5pCNFJbBf95jzougjqY
         3K4uhPqKWhwHat31Ew6snmPNkN226ndz+bHT3x4mViR/RCa0pNpli+Sfj6yN+SeiNjYK
         lpY2CwrLM3kleG8LY9Qehd92WyD0u4NVaFktuJaXrf9FWYkRkUAE9P2A/W5lM95uAEFi
         hrH8ohl5VS2MRP5wz7D6Jq2bWrtcU0u0+xfkSKTFALPKSsH0aZK2BwRVMt2XPQJw8vor
         9icmWQSGsHKjuzumqm+SnEE+qUUbtVXw96HJ+WRwpmlQahi+iSWSCXss5UQ0zNKRhFST
         +3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834178; x=1794438978;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
        b=tPLwKZqZY4ulC8IysK4Ssh2puznFa/kB1McGJl4jXnC6TlU6Kj+1OuuRry6pGhxsCG
         wp+L0jzVLJ0wT9PogvJlzrgDcBDtkzM1g5fniXRPwvQ60Tp/PoQu0XQahdnY9n9tlGYk
         bwum/Uk0QNT9nmJEPqYiCnMeggqT4vOgDMaxksFPYUhNqC/Y3VZB8SmezqmKsEcGbZEG
         0ufa1xOZj9uy85oLxpc5XgB1EizSOjPlyB76LaK0zN+kgCadmlPSLVsTMB+zmcE5rr22
         XKSso5Kz98Q/8+zE/oyYN5AAVLALcKnuLmf/v2QdA14Ck+SSzNI29MO1afcKd5xfrw0Q
         1SjA==
X-Forwarded-Encrypted: i=1; AKwUvBzteBklqsb+lyhExKJMgIH+oxVp2JafMgnU45ner6nhKDXWeSMiu1tPxBeSqXNzKFOoVlmE8ycHjmZsSQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z87GKd15ZrYJvTCLFD8vkU8nEXRf2DFFSf3Z+RukmHfqddlfbqd
	HWmfKxrzAcxzKdHMCoO1PrV9HqpSGNYIo9rHrX146sVc/00MIvtMIuUPJLapazTfc/U=
X-Gm-Gg: AYBFou3nWOqbpNpUYzl1m4NM4R6MLjCpn+No8O1oXHJDQB73YlMW5mfgMGV0H3XTOPY
	b0W+5KAlNaV2Z0pNyNYDnPgTdq3EIvmW0phM96Y4o9HrGWfCCmNTE6k+/00KUDSdHLDnTw6b0U4
	EgyoN2RhiqZ5oy5ZOFT639QQL1+i1tWC0JsHFS+y6lzw6Zv5TVBlmX54KYEUWPLNXeKScJ+GtWL
	1JWYWl71ViY0gAZuD8iUdw+yv2fSa4gDwmmp/LwJWaQC1xF37oufoILlGvAAzQK6P2yy/zfXAoU
	c8Nu+kj/ZMRQJ2PP61m0srZxeFbdwYIlyIVZPGB/qrhRc63mtIkdWbayC7AmYzvX51Jhb+kEOyB
	hpCkoiCLO/1dp3OvnUk6bHbZOIC5IiIrgI7Y7jQNOMFox5NYVz6U1nk1PuD0eINbhpmU2jqN62n
	OprnCS5sgOr3dAyPc6BvclGepPfu2K/jqmwU7J7/ZWeGVryfSShqiONGpmyTQg+IbURoUaDVfD1
	gkCXDzym6PF0hMuEyjNOZPQhtw/b0J31N+8tDrgPiMmpNJinIDOp0hv1r/bjFnbIwPmOQZQsqoN
	tVHn/r0SLxc5GbBk5BnYSSC+kbSYqoGd1nW4jscrybBr1Wl4DaS3GMKBpHJnHsjc6YDe0wDt92u
	iM4Q/Xw==
X-Received: by 2002:a05:6512:39d1:b0:5bf:d00a:b6c0 with SMTP id 2adb3069b0e04-5bfd95510cdmr7238038e87.3.1793834177876;
        Wed, 04 Nov 2026 15:16:17 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38de44bsm580359e87.84.2026.11.04.15.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:16:17 -0800 (PST)
Message-ID: <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
Date: Thu, 5 Nov 2026 01:16:16 +0200
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
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
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 22:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 42 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 477 +++++++++++++++++++++
>   1 file changed, 477 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..a65067352b58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,477 @@
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
> +    minItems: 42
> +    maxItems: 42
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src

Please switch to the new model of describing and exploiting
the stand-alone CSI2 PHY devices.

Any CAMSS drivers based on the legacy description of CSIPHYs
should not be accepted into the upstream.

-- 
Best wishes,
Vladimir
