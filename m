Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792795388;
	b=eanrBIbmTrcqq0K0yFWgJMs0NJD0Kfby22TV+Vb+33tT0wFmj06/wJsAIHGhSoWlEKKH
	 2BdqvKGMH+36Pc/L/H2ZuK3vf+323SPxw7qbrmiHUqbWcGVFFeEvpNe/tk/AMWloYCjQR
	 j5jBCkYGnULh1zo0gK5rbwxvlntvpPhLj3akF5O7+mf0m6BTwqk/g20wuxxAnRxboGpnn
	 NLVG2uMpBnJ7ba98MAj8wfVAQZ6GxbUoz6+oByIikSQEdzr+ojMRtW+Q8PHaJss32gkzj
	 o3M41gBQlAVpZ92Z4N89W6yaElxkyT0BBhKpJiNDicnDB3dlIi9xdlsKPIhrNamt3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
	b=p7V1wMGnM/myxE2Kayb2MlJqfJ0poboxDJpgJlzH2mdaAnnKCMFgFrJhC7AFBULJyLAe
	 6FEqYI1Mpklyq1orExtRNrV6xh7PmN0Akq5pgPdSZnz8fEXRBeQbdRd+M73YzMHi76BtR
	 Ja4MzHBVoM5Td8S+w6Oc6QkYCIkDRMFQi/w7Fgc7gbEiAIKLAQjMhpBemdbQfvfRSRp0B
	 K2Xtb1tCHnv/cdBaSs/1JgTgF4MraeEffakJ9PpgBRNIoLsQv+ZomSKWdszQbnSvt7dq6
	 ZM+o/neNiNuG37oPvl5jKbyvNXjeBLFQ34Z/eFd2+1Th10fIYhlZ3cP3hRmAwxuLXCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qWQcWGRE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882A8606A31A
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 22:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 882A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qWQcWGRE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214af2076so8132235e9.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792795386; x=1793400186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
        b=qWQcWGRE26epRvhdKbyIh87aCmJkyDJV5cwB/scQQmyfO1sfK2JHtXYblWIS1yryU7
         nJ49caCLbmHN0pUpe9ChYkb7k2L35KVVNaABfCTbGhXpcZw9mX+N9n/KSKMKDn1MpkA8
         GZIDPtkqCJRMOCxndovyFWB7adcBs973+he/lN/yCF6G5NBX2+MSRSjnesz65gDhns/Y
         Huv+Ytga4FPSUTmHdFzNEUvrvZ2ufP499FbJhRtoDSk72Ow9E+voC/vVLYjhdQqkUxdZ
         NHijy1YxKbY+PLx6HMvPmmLUmnvceDe/Sw7c1VvbxBhYROJMi3Pl5EgYGxIL1bw/Ndy1
         N0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795386; x=1793400186;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
        b=qmqRhox2lYv54K2NkKRiC7EhyZb+vpFghQor2biDmRDuZCHo+F9amlaZjkTXkZFLiI
         YBSjKh0EoOejCw21SkVL/RY5rG/f/eJmyOytfQnTbbR3q/l1jpbb8Pb4z3mRaqygNycR
         zdEbB2TDOXh3Mm0yGdyaDzyGEIBZnrEYedJlzQ5Ky69gQymvPT1n0We+WJEgWLkaFUiZ
         KtQS4vkMrcqodvizTd8CagLQDKuypTszi0angHUyv2nRfJ2K03aTQcl2xJq94GPVQBKQ
         6cb8yTlBGKqA+0Ltqg63pwPLOC6lg3FDLn2MGdkZHDD2dZ1z24lmqmn17ZBaEXMq991d
         mSow==
X-Forwarded-Encrypted: i=1; AKwUvBy/Kepa/EmiR6U9DfUfIoiBtiEq/OtLY2FHPp5rI79rWVGtKTb18szIEtikucs1oAgPdGT/omypF2Ni3Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIO21RcS6nUnZiMjAsYD5JocDKiy1eNMM4zuGLKbXxvoy/rTe+J
	WAHEvEJTdwwhoyaRrtRQEAG5J5viiWLzRU8UsgeKUCj/8rB7IasCaz5ru3DOcczXTnk=
X-Gm-Gg: AYBFou00lUo6qpyHkpgf7xnoRqwytpddSVvKro3BdjJl7Nfi0z9bQGfStDWH27E920w
	873Z3IrCHG5MUUDJmpaVt+fyoIoyiDdaQTfShrCiRScR9lYDFJaZ7aqOV01A8okUrj8Hr8BvZyX
	Al+QQmq98wyO4Z3jgxFueTiOVv7dTmAHe53WDGmfiChyEF+de/rQAduHy3yQ6G0b5dWYEi8cfjO
	+oMDP5UcuQUmobPgPaFcvqItK2Y7xj7q1l8Drx65KriHwklAynSOoNxb0hIx07PP5le5ntAmlPR
	kk78/DrSQK6TTIU6C51kUGZa116JQpPgJIIIzI3TQhWzXvzBRI9QhvdQAVTfRbxk325WVQxAozO
	+LRXAdzbNZEPA7/1PFKcfYIVUcYhOp4Ao/dvTfBBz/Z3PFUgDIsN7sHJ1ibyVppe/18qn90BEFh
	Vthv/XquD4xWlJu23PM7CaArpK92YPJ2g0u9IAVTkEfJUsSuJz8Ud1QrL/rA6rMBZUxJd2IIl1L
	p60hn4VqXp0Q1dmYhjcP3Diowe/H+JoZC3v7Jk7B8Z2vIIq4hZ7CnKJT1HnyqGnF4fo
X-Received: by 2002:a05:600c:4e42:b0:4a2:16c0:f5e with SMTP id 5b1f17b1804b1-4a35ac8b429mr4136005e9.10.1792795385869;
        Fri, 23 Oct 2026 15:43:05 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm787610f8f.38.2026.10.23.15.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 15:43:04 -0700 (PDT)
Message-ID: <3dd8d329-a25a-4afb-935c-311cb8ddf094@linaro.org>
Date: Fri, 23 Oct 2026 23:43:03 +0100
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
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Waipio
 compatible
To: Vladimir Zapolskiy <vz@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <OlcKP8HHAIXkRzYX6vdMrXfEbLNpOVLfNZytB-qiRopju0IaQ_xxKo-mlzphnAO1Pdg-y8mu0lcw0UsQZC0ZuQ==@protonmail.internalid>
 <20261023163057.775917-2-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023163057.775917-2-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 17:30, Vladimir Zapolskiy wrote:
> Qualcomm Waipio SoC has six CSIPHY IPs, which are compatible with Hamoa
> ones:
> 
>      qcom-mipi-csi2-phy acec000.phy: CSIPHY 3PH HW Version = 0x40010000
> 
> Hardware supports up to three different 0.9v level power supplies for
> CSIPHY0/1, CSIPHY2/3 and CSIPHY4/5, but there is just a single 1.2v
> power line VDD_A_CSI_1P2, which supplies all CSIPHY devices.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>   .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 1f1e2a4993b2..2a11ca7c7d11 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -19,7 +19,9 @@ properties:
>       oneOf:
>         - const: qcom,x1e80100-csi2-phy
>         - items:
> -          - const: qcom,glymur-csi2-phy
> +          - enum:
> +              - qcom,glymur-csi2-phy
> +              - qcom,waipio-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
> 
>     reg:
> --
> 2.53.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
