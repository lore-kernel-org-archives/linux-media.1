Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622518;
	b=41iezrFubBvqnRiFQjR+Sp0dqY4lIhISr3y5ZZsaMSagRG0ZwbrQvefuaj81v77tn8So
	 KJAYXVLJ5WbkuFnCUb4BVHFXrDgjLY7W/7Ny1L1v4EBKtYPyJWJdYLWCOBuQtr8eYnYWq
	 7MgOmKtbZFhvwkXpPVrYO6TglE7iiipEzA/5/O0k8icCJhdjSqN+CLGZmES8PRFiZOSXT
	 Ot7NDOyuxG36xJHe7Y166RRkvGe9dJUfw1ovJ40BNQ+S91oKXSFbe4ylEGImkyNhPLA4R
	 E8PqoY0ZTjtU5UDzNvv6pxNCZ90/jzkujNTkww9YEp/hJ+hOUXdHIaoVWuvuPgnc9/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
	b=ANrbauYANwsHp+xodOQb1PJ/3s+3QbVbOb5EFeubZYNKW346c+HfRLq68J5RXkFpwfIj
	 iSGdPb3Mb1LV8Awcn623+YaN61QKBW/0ox3JIVIV0t3W7GEo5ItoKA6cb2uaYPymJj6iL
	 doHaSWlTae305mwSO2yg5ECQ/JZ3T0cdR8zyaWNLp+s/GG5cMKKurs9hi6HFxmo7GlaTb
	 0iujAhGMF6TcFMFe1j0EgXepktTzNV6ga/t/FqLbK46HWensSSjOOQCkz9ypXk55G5hU4
	 r8qfjpDHZUjurtqEvQGGHxHILTqIBAr+X7K/ztecCxXfvvEhahSWwUBogwb0Oggf7UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fbcyOIkU;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C791E606A32C
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 12:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C791E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fbcyOIkU
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso3990546a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 04:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793622516; x=1794227316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
        b=fbcyOIkUCz0TGl1DajcSVL74qDJ8dEfsmuoLiH2eVZ7u7Q5DIgP0CL1WHMYVnRFtn6
         wX1ySB8VCnR+BQBPNPNeX5MOi9aQ6RD4iKkmB81GPjJqqx8TGjJGCkMaA+P9xmkmB+6Z
         xuOIWXP04IimooIF50ZrsBxN0SxP0qxl88z7wFBXKaj6QK0KEy8/eT6Iv1uVZag3xPju
         b/Kubb4a/THgn/wwAuJZqo/iB1dztxp9qvJB0um3EZHQkfKi5wJLS/VdJy6faXzoFK2M
         2gZL9uwJTYJZlo+RKFkPDeX4yg2TP60XLUaFeegqjTykCtFwvK5B+D0Yu3SUTYaPv2Kp
         7sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622516; x=1794227316;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
        b=ZTcSJpEmlNwvFMi1LDaxIF7fgd/jtFsGRkwoLqiKIS3hkgAF97O/9q/kSieL3HWEmc
         xe1iwIgnwQwFbXy6hERqYWanDAq2+ls5gEkMwnKVBOtULAA+iSzdfIOXdxj0PBTQG/Uc
         qjERejUxJfTdPdBMd12pm48LBLi4XK8RyApBw0uQVykZgm65hVwVrBJdSm/2xsFwmPiQ
         tHRj3EKos+9Dd5p1xK2DPk98/Idyyjmg+cBwJG515BqwwS7OZoq1mpResXGzVDpS6bEj
         JF09oeAn87hmdIIYO9vh+BIlY9lYqTcUV4LtJlDt3u2VRMDdK28As9yY5eAjmAEFkrlM
         Um1Q==
X-Forwarded-Encrypted: i=1; AKwUvByF063OMHg1IBvI+hUbVov2JVbmMYKk+leis2+pN0VMjOgxV7n8opwKz6qEZEKTEyq4FLY7+O7gQq4neA==@vger.kernel.org
X-Gm-Message-State: APuU4Z84OkxYlGn5v2M6c3zu++uT06OWpzA2X3AeFglNG/42qxBN/18+
	Wk+NK+Zil0GOjpFeI4KqpOglaCSHpyR/IepsKcOBfyNVmF5u0MrMo4frp/Nz8CKbwjc=
X-Gm-Gg: AYBFou3NZf19gZGNyCYOAFv1p1+H06glijg2zvj8K7Ox2tcVhUnQG2sgvhK1I206YFE
	ldPnd+iq1jgKSO9FplsCf0AdmmRMkhJ382MqgtToEzsNTen2jL2gIWrPVAVcCVn7boR9/eQdINb
	fNe32NL9h+WMtR/sdkZpOSViaVe1cqo77jzALUQXaYHUAwLWmZM2AlkwwBz/gJwR9lImh8XR8b7
	GWrtXtWRz5GS4cWEz5Aahp/cDsvM91HE7jRwRnFbuXncZYG93cFn62yn3NlPrexf6QeHhpBfXDY
	Jlez7TodouFdiiCWhiBuo0hZcg82qqnLvzjRluyrkRVVMphbv4WqJfha+npLrh/7v1DnrVdsI8P
	b03zgw4fBPAuWkUTWuH8GJz3aWsJhSqLcGfRI8VkxgG5SrjKLI/kx1Te0hsNEGO8pHfZ/g1aYcr
	Y/pl6RpSS1XkOF+GSzCESy7inRYZUayp2PRp+oDWAZDh8l04YRB8JiJtlJfnmu0mVgJUPhA5sbC
	/W59RLh1rgaEth0AvANhaxLYBSTAEm4apymXgwCXxw77JUOGJGcdoym0+YWGv/qXvHbQXVNBCLc
	gYmxMkydrvu+osY6LU50+vYza6oW3l1A7alSOg==
X-Received: by 2002:a05:6402:11d3:b0:6af:dc4c:5f28 with SMTP id 4fb4d7f45d1cf-6b4d4f71386mr7121197a12.37.1793622516124;
        Mon, 02 Nov 2026 04:28:36 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eebb0sm3172063a12.8.2026.11.02.04.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:28:35 -0800 (PST)
Message-ID: <b59981c1-e98b-4c20-8e12-2c5298c0cad3@linaro.org>
Date: Mon, 2 Nov 2026 12:28:34 +0000
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
Subject: Re: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not
 described
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/2026 11:21, Vladimir Zapolskiy wrote:
> -	for (i = 0; i < camss->res->tpg_num; i++) {
> +	for (i = 0; camss->tpg && i < camss->res->tpg_num; i++) {

this change is OK.

>   		for (j = 0; j < camss->res->csid_num; j++) {
>   			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
>   						    MSM_TPG_PAD_SRC,
> @@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
>   	if (!camss->csiphy)
>   		return -ENOMEM;
>   
> -	if (camss->res->tpg_num > 0) {
> +	/* TPG register spaces may be not described in old device trees */
> +	if (camss->res->tpg_num > 0 &&
> +	    platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +					 camss->res->tpg_res[0].reg[0])) {
>   		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
>   					  sizeof(*camss->tpg), GFP_KERNEL);
>   		if (!camss->tpg)

This seems reasonable too.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
