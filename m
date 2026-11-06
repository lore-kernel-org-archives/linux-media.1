Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964455;
	b=1qLRKbF6e/asPxD2n4qILzfaLBMhFc0Nh4mjbjULqWkf2aOXwYwBRpmIoKJgk9KdaCdm
	 c/B6kWIisLl2FGQOlAmUrmWUoVZHYLvb9Xjprn5DhC+cIbxTVnY70b1IEgu4ic6J9MzFr
	 1Df96svj2zcRu9XZ3UY8hCkqoNgZai3hGWe0ClUKK2SQIkKftqP52CC2YdM3RMtrBUfog
	 8PhFCNLZQUSjouTMyroQ1oOX7/DtwLAoyF7LXasQWSRP3WoiWJQo9QYs/QKrEN2MZsyD8
	 6Yttt/O15Lm5MLyFSDXxUS2X7GhzEqYcyrls9BeJjv+SwRN5ytblWpVIUpajsoriq7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
	b=iTAyV4e1UyTeWIq3jw2WBOTOG5AzfOJKKQ76pGiKKk7OfvxOvmEyBb7vz48lkQXW7IVX
	 sJg9VJhMDdyrO4d+mXj9DcasIIP5N0r1XTM0OKRNlZuQ81j9bqGXwVNwfNTWto2Hx8HE1
	 bQPhFcsaRPTUbbQD5Pz4jaU0gOeKXRp3aPIQF+AogkHNFDwlAQbw1utHYckq5efZWe35t
	 Y8zs+KFg8SRpRDT7MIJMOSe9Zj6dy1VVSx+IBJhqwMyXAD7zbJQwjHm0AYJzkm9vAhB3L
	 W83daj9HkaCQBWZF0p99tJQVyRotzer6GW1tELQlrtlfcitVrPZ6WHRDLr77q26OxFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="zXO+/C32";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609B606D812
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 11:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2609B606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zXO+/C32
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso364125f8f.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964453; x=1794569253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
        b=zXO+/C32AlStvgI0+EYAWE2/Lakk51WyJPlKb6utiwbTK9+74CTcnXu12Wf+J/7NuB
         BdOoD4ctlP0nDHnnTAP14y2UXjeKB14fwhpho2iJ6q3ClTWXfFk6Cj7nJ3WNYSFpcTMg
         jbCSpb8ga0BL23ipmALQoFILzAVZewCiMgRMMW2zkFbS9UT+Qybk7Io3KpC7M1GZdodh
         a4QITzKhwTU1iA4HYSCnhVhpR2eMx2R+icRk2lyGDB+DtlyGJoVlMLPk2lzYyA7Btcjt
         I/jJS3hmHNXqxs01UtHPwjiHIwg+VofbkfZQOarqN7o6L2TO6HQavWc368QZ0IZdGvhP
         iBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964453; x=1794569253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
        b=o4m1w3KOPG7k3XaOaPxZZEe6KEQTT35A04ZX5J6gWaNbz3KRfU7YdxZG71OK4E4Qk6
         YrCfO6MgTDF9hCFnpehoGruncH1WpacqUADsEZQtrh+IUXuLwZMR/yBH8AkJdDspX/aJ
         vdjSAW1hmxFQj4u/+5MXvBNevKBPnqiwYLm2oFfWLUKle8czUVs2XMSHzJXycBTB8J8B
         0Xqx+T3iLlLWzgZjlJ+NMWQNmGjFUChcegXVHv1dhiucvW9zJzVQq/zgRqiJXo5W/khX
         i5qzDFhlqYFsMMlUJRuuVqhw9hk6jqxf3e85vMrDchUojxZsO8pvIkXHab0RMnb11H5l
         7WWQ==
X-Forwarded-Encrypted: i=1; AL+hErG3hHi4f21qsx/CrbrfliYc3coPkRD+rPKbNuqntdSnNaRtvaPnsjMUqmABW6gkRPV8P/6iIgg9UeFE3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+l6LEsyJ0ZCHNIcMHAOdFxMj/rf0a0ve+Tn6EOvppvC0gcYEVp
	SSlK+fmoS444g1kHbZL1BJGRXaMECDCDehamvkzLEjqcS8vOrF7UoxEQQLQbS+5uzkk=
X-Gm-Gg: AYBFou1WVj2IVHXXRNCr/mmY1cAapRrw4cr5toGQPeziP0EpIghnGCi9hQOiEOkWTBJ
	k9TJZBYukUyIzL3e9g5nLQeLlrAc3abNjuX72PdQDPwWvi8U4mC6Gwr8loI/hhyn58zD49zqc8b
	KqHTdfYLEUxYCFPsBeLBRZraTo0cfakAXN1+uFL93TGFZseZYfS1J7nDLlzN9q4UibAp+dXtlUv
	AacBLQ9y4fUv31FoQHvLIpL4/8JF2PpEgp4MIsN/YNE5OgCrylmPeg93SAhZBQilBezwqp0F7BB
	ZHMsU1gvhvXROa7GBd+zLyuY2s84a+KQeb8h2QNVY7Ks3gsgFOmvQi94HQgDYOPtAyuqe6uNZDv
	zJN//mMnMnNJAfsrKL/tJl0JqXGqqASaGj4Gq7gLWC6LcTfwYgVSNTuSnsHFRZ9tDTa9BVlXxeM
	q9kYSUAYe4xrQZ/adS75/DDLH7Q4/D76CywdRmAnrO/Ii+Wzje+8bzlt8+BQxfjPqa0+mY6NcRW
	DMwejuNl9hO9B2/JrNBWUN42SSjTl32GL1KB7gogcTP2vROGVUe7TC52bTCXcfnOPOPr3WcdqUF
	/x4w9LDxh7CcAjpgf7WUah3d1jK3nC5A2sQbGWJrrKIvdx5Kpc0bGd1KX4OeaRw=
X-Received: by 2002:a05:6000:3c7:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-4911906d185mr9499122f8f.6.1793964453377;
        Fri, 06 Nov 2026 03:27:33 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm2941196f8f.28.2026.11.06.03.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:27:32 -0800 (PST)
Message-ID: <e210c5f1-6a93-4387-ad1f-66d4ed35e00b@linaro.org>
Date: Fri, 6 Nov 2026 11:27:31 +0000
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
Subject: Re: [PATCH v2 4/5] media: qcom: camss: Add support for SM8150
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
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-4-39ee37787b00@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-4-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:24, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> subsystem contains four CSIPHY, four CSID (two full and two lite), two
> VFE and two VFE-Lite instances.
> 
> The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> layout. Add CAMSS_8150 to the version enum and to the shared code
> paths, then add the per-block clock, regulator, power domain,
> interrupt and interconnect resources.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
