Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616481;
	b=GSRL9XZN7w/o6HfnZYrWT7k8FmoEGt+iyDfrTrojjsgI8qZuF06LFspi7Lc8ez0I+voy
	 QAKbgp7iYFhhdX9fesPeGXfXdNdohsT35OIlhhKaNsVKpidPmPfWZyy0onmxxVq8qgGOA
	 Q7najujEYfkXIZY6y2a5JmVQarB3o4dRcJCJ+1g4AKL99WaxdH2IkbODHzl68RcwCibgT
	 iwfk5/ENa8ZgLIY2LXgameNQfBRwYby5ycsfQPZlAgQDAb0EhN2V6k17+PYKUy++K3+qx
	 N0qXQ4VWNiP1rr3Ta/J8yoUg8oXfK7bnFBcVpCkx2+id5NWFjxXjkzYeKirW05KtgGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
	b=LDIsxOuixH9wb0Bb8AVSqN9ZFP2yUxVEiMHMPKK495XJwrcnYLVlKYq0liorgQ0fVeGi
	 8bDNURv++A4Mmwp4c1BedjAWCOKCE9fW+JITFtJeTlN1eFH4iDOgqk7RwPBPoK7O/1NEf
	 R3cDokNMP+tAs44H8kuWT4a+5Xxp9FSndc/vSymh/MiG/oDvoouzGnUHb3d4AgBkPS0ZE
	 O/7DR52cSp1+CdW4wVtVruzgQCaxERzqVsrmckLRVPuL3IbuiElL3nsVtLRPjWXO3KDRF
	 ZRuL89fYsP5SlPgAfq9dYPGOKGx++k1BbRJcGuAshqps+dK/zBoOK0xreOWXc4+ws0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZP4cszJX;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53B606A33D
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F53B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZP4cszJX
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso444655e87.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616479; x=1796221279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
        b=ZP4cszJXmUZlMGJtbZ8PlmAsjUZ6rzmMVf8KPM3mYZ3Ns9WTxIMJQFQ7gtv10yYVG4
         0CgaUMFucTfAEE1Z4x4SfeIuKqa+CwB0FrnIcJXHvuoyNam+aUvUnr0KvwPsaVr6jMon
         Vlj2PwIRSIOSXGX8j4rWov2YJUxkCnEz5ccDZGiL5SIXVD0qq8U0mX2CFCaGlMRXYiGn
         FsxDARH41XcEj/7c1tAsIlU4D+CpX0lyDuht4nfDjc+6TDwfa1eAazA+yBsoEIMjPdNg
         bQAZYuKxqdpjQJpGRMg5n/uJIGq3fKGuH5GgqD7KJEyg9c/meRTlLh+beVP0lZQ+8LC8
         fzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616479; x=1796221279;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
        b=y9pwGUA1DMnr0l5n9bv4m6zUCXVRLmHINcbfrnFedCq3KcHfY2MZ2AxQ764zMRefq9
         bYbmHkp3tnfpOJIVdIpOkXYf7HiPB/GVE/cVJDcDiQ+f5+pAAXn4ItFcXjM7p7l2iJG8
         04zesoN/Rdh4PJUYdlM0iAJvRFCb+mjEC5KwMLaVPj5aRCV+e9o8BN/nQV0OwW0Z/3wb
         5nCVdh/mQJQmdUKFa4FqtaycTp4VZK7vpy6XziqwZ9WDZhMR8Y1yT7XMkITdi7mv+l3T
         H2i6+PUcGhomjCcrbAoL++Tg+plG69d1PgsfcK4EBnn788NV0zhtk27L+5k88TVm9Yay
         Xggg==
X-Forwarded-Encrypted: i=1; AL+hErE3mMYGkAd7dr1pYLXMjWqLpZ25ZziQ46cBYtkKVbLjldGS47V4XbIbE+q9rCi+6sBqMS954u0yodiHVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z80SG9WRsM+D6rUqHLgipswyT3pG4Uag0qJvw+m4J4+C4NbUYKb
	OxF2+UbUgj8Q6/PvteaQ9L5//8RbjnZnHkFc+BfQq3EDsWgN+98zpsinc5N71p/74ndSt9iDHKy
	fV0MjALQ=
X-Gm-Gg: AZFdTZe6plMoZ57AV2xP5PBRGPxeHbDQEBya2JqxqQfNNkSj6ucRoymtdHNPk6i20Cd
	Li3ZulNSTiaNlXTjwQsBqq8Edn1VcHRUsHx6hQbMkaCuGi9DZ1vPCyOig6sIwZpCN5a8lCp7ZDi
	9emQEafQqTUZLRtZRvxCOQmXOGwPr4TmYnFbkRTUHgMAH18CDYlVVSJmIW3e1ORr7bKKpRXeEoH
	Gl4+Y47Lz4cvS5+zCVGhdX20unz/OVYB3rgOeHeJpmjk6HR76wUYPhquthyu3EMh2zhUNqDljtg
	+4IORF6N1IkwrzAfn9F85Yn3fEylR7hB0b3KBkPnr79yZBSWVODXaoCnnR3z/zl8oV95Zquec1J
	mr6/A3EDD3/6SccRyQmVZgLGML560bHuwyz0zvsF827VqaId+0xgCwOpBuMZTWtQtNwwsr5bEWh
	MPnX+2wppk1nt6Dv8rI+UkYZIQhA55KZNdqSeFi9UcgldcUWMAaGctg4r9LBKeAjLk/h2CtyAcV
	w5VJbAbsdNY7F906sZgaNFaSC76N3Sh1apUd4uE/dIVW2H9j+KahmC0NjsfXoK9jLk55EH9nih1
	AS4S68P3wNf5naxI48r3MI9t13YH42f32qGh1YR0bMJJL9nRW1vl6kUHeVhTOw6vXGWxINROQOx
	seRJhbc51U+xO1EnKrvHg8x5GciVF
X-Received: by 2002:a05:6512:31d5:b0:5bf:f87e:3d25 with SMTP id 2adb3069b0e04-5c1bc6b22b3mr6618657e87.2.1795616479393;
        Wed, 25 Nov 2026 06:21:19 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0171c7sm4541303e87.31.2026.11.25.06.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:21:18 -0800 (PST)
Message-ID: <aa0a99e8-1c49-4417-9a1a-8653cfb3585f@linaro.org>
Date: Wed, 25 Nov 2026 16:21:18 +0200
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -16,7 +16,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>   
>     reg:
>       maxItems: 1
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
