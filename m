Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832072;
	b=zAowDQClvHTUDgl96i4nUPEk/2Tr/MLbIgb6ItaAWMY+b8U+gTS4PmZr8ufohlFruSqh
	 k0uebjGPXBfbmsLxGSBbjZMkwj1f8iFI5yFlbv7zaHlY1XghJ3tXcT4xtZMNLIzSxR0J1
	 ouCzRr1djtqfXTRh67dCl8B0Hmww+JXmET/+sdoRjph24+mkXoZcx8Mqk07wFt2MC0bfU
	 p0xoTmz0YnUtctTR6lDQF1NwPfdQoQxRW/YTdo8bFpc5efxL1Hjm65DB+zAB3KysUOmTI
	 v3g/0xvfiT0trWMxQzO4q2KF26SqzgVivdCPHb1WGvOfOY/1K+oVl9kybDOAQLj1gcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
	b=OitZRqVMW13PQamcR0W8YDryVp42ZpInXBqrfnKXgs6EKTLrsWfRoKKxk6RqyS00Iggf
	 MIjE9NEe/2VAuXhgbLXa+MI9sCe5cld35vBbVueTd3T9txTqNbYksZ9VhnR8rPC9PsJ6Q
	 Bu/2CUJ2S0w2y2ZIyeGkzCPrNEkUrVLj/t0jNfvRy6eQzEaZx8LLjPI0Zj9aMojaBddRQ
	 0o+iVD8pigy/vSeGOSNNFxCVhELwiDFmmnoLeabFUMBL1p0rWFld/juHhDsHOjs3FJsER
	 PDN4HuwgFV4Y9DpQ1fschtz/5+1bJXVqJRFPJ9YvgN8b1xMFOBpryAmssTOTOcyHxhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VblTHW8t;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAE4606A32C
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 22:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAE4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VblTHW8t
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8518735e9.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 14:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793832071; x=1794436871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
        b=VblTHW8tFX/DEh57e325ubcAiELluEymaW2vTWJuEEHyAuM3tm7KpOyqmWbQG/Op3f
         Msw0b1pJGBWgfSh66KmwWzwckkRp6IePhYqHGIkYUFna08m/hgJZd6QQDswNo0PXVObu
         3CpiTQiXj5E4+WZdskOIi7h0GjU40neX6tFnJ8NY1Sd2YVcZ12618lqLKskZg/T6dbYn
         mYxG36peURPv7BA0Mr/ughxR+KzpZXsw9r8R5fYIME9yNHAVdz8a9PRP1fQI38oKuPrd
         TvSa2T9416wZnCTTXJcP9uSG4Dwf2kTo0XZoaNmbIxIBmJpoHEd7hhkaTpqcR0TqdV4M
         46Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832071; x=1794436871;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
        b=vqvzCX/EkX87Tif5I3DH7S2ZEmoVi292jY4ucluca1ngXSP7nNKNep5KXCpSZSZfMf
         VVWyCiYxCQIdwmGH1yKiJOAC/EhOw/VLbH0KgyCDB1gMxpipVbCK//WkujeQffhEVr0n
         xcn+gix8paSZOXJ50EJyUHHDA+fZ1zWXh59wK8d8uJsDFktAbWD6dnaccVawVAzt6jrh
         bomqDgSJ/puHDvqvMkzpyqgNI8AubQ4GfE96bQ3ePlkws1N1Vnobs6nClNzjKy2i4XSF
         MPR2V2ekq/TPUCodmNhz0pFwP6xgLt1lw7xpYNUNYrpIt7Pf8+ZLozlAyxc1vJtzPgMn
         EAHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSdkl+uYx38QfJFaDAivLPSXRNFqQhi9f1Vy18gvTvSQ2avG8Q0BmRndzNla4Vr9XdfdDXXHoxKPSmdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/NHpiusqS/G5ZA998stBBEoht8bEVy9U7+N5rIdfSo6UJ/Kix
	WTLi0wdxGjc7DVf87ndsbCNb7p1Hn1fpPbnNcJQjJmZnaLZs5ERn5eldp0L79IMP5CU=
X-Gm-Gg: AYBFou1iEC5R9HfItQdWqWunfg3OifRl7UHTIFF/tlm6oeG3hvaGWxvkQ6v6e5q+ujd
	hVnstz4I/Pay75n9UcGJ/JRHie5FSxpzkO48fhZBcCamB7uEUdiMn53joKwsw3KzFjWgjN/2nIh
	Iz9z51yTHljrWWNPkIGdfrfjbIDnKNhRsFZ4t0ipJFTfUT7P9blJFlU20kKJprzNtlhtpDZRgqo
	0npnvhNF5GCz1qCxabWXZaZFqZqfDlpCdbVAeE92IyMg5Z4X3/h5GamqmRh7rv8DNuhkW+kidNB
	2ViVcveLBYQN9plGEn7c393xr7Jxym9LJ8USN2ywvSYp745UERra6VD4kX94BbIyGEt+Wx60/AI
	yDLdchYpoULFm5e0EWUMJRYNiWFkiD3a0eSpjD2E82FMqZDhhk+XTkNy9Kw0P+LKZ//pdwO54GF
	Y2bVBX8FcYcrCisUai1XODXSM9XZNSHduIf8mZp/S8JeJ5wJmzQy0PQULYpS8jvxtbRWFBDOWPW
	0q2o24tmR+BNpQRevaZIVqVIm/4nXI4v/KgG+FTjmh9DUXD+c8hukgDI1nTffnTF3nRcOvi5yZz
	5vFRRog5gEh/5Fr2BWYI7gL0PYsNT32Vv12ZMf9iHlVyOQuh6ejNqC5TTatLx0I=
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4ac175669d8mr428288325e9.14.1793832070829;
        Wed, 04 Nov 2026 14:41:10 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65c8sm16013915e9.12.2026.11.04.14.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:41:10 -0800 (PST)
Message-ID: <ca9d806b-567d-41fd-95a6-daa6aa14d7cd@linaro.org>
Date: Wed, 4 Nov 2026 22:41:08 +0000
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
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..b545fd2378da 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
