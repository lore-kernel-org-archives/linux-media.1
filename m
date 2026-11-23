Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444834;
	b=R6zisHH+0XOyQ74Yc5VHfprkM62QNvC0crQuZEGKf8szC/tF4ey1EWZZ3cDen6H/EeRQ
	 NwUjp2eQ+4cT32DHiWFI8BbLLZ4UzuBouLcIXYQ9UxGybFnKGaJ66+ZUdyO8FhNq8KCp8
	 Un3C9Jrfw3CxXoj4qFS6Zhdu/D2HJpdjmW7jCD74YpxDQMf+tHxU1wex6JT6nOtgx8lz9
	 9jwnM64D9/DpJijHixke1tgwU08NskcAQO11eib8LUfu9iplRZuB0Jy5Vmu8p2rap1jcJ
	 S8LC2fXIAvf7N57J3NEZMXYfhUg/GMKPLgr4pafubDOwwJ2vOV6jbHB3ZjFvRFLdevg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aMYXL7EonhTOs209JASQvI9ehnglaVQ947Zpfa+X+7k=;
	b=RdqyIblKNyW0VZfvAiyuCZG2RaUaB9k0/7rvtfA90t2gmQ20ZBAsQqSWl5qaZx5DD45L
	 Lvj4U1xXNSzkDFXOQqyUPKF/CGulRUKbUCAgn86UOoCEUZf8WPDh2sMfU3B/O1mxo6vxX
	 OHY9Zy91uhkQgypaKy+Afd82fpGg1Ka1avUN5KyTQD3onSlW5Px6cn3W9YtiE5pFyJcV/
	 E6//mKQbKY+lOHG5QgJrzmB+uKhpgiVdi2EST3zzEY9/QdiQUmb5VgbeyYLybKpQZbtno
	 v5Lt2U3ziKv30BVajVH24mynAPzcxX4uLo/ueeNVkwtlEQPM6t6i0cz8EZwTY2IvV9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Xz/9lDZg";
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3FB606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 14:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3FB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xz/9lDZg
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so3802824a12.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795444832; x=1796049632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMYXL7EonhTOs209JASQvI9ehnglaVQ947Zpfa+X+7k=;
        b=Xz/9lDZgTsFzA1LqJOSthRgb6ouD89i+1VlpyK8e5KROmVyCRY0C/414jV4ayO45xg
         IbZ32k6q6VGU8ziQVlvvAoI6EX1sLg6tdGfOIrqo5SZClLp6fw3ReRGgyGJ+DJ22e/WM
         TMZA0rrRZriHODZ4jJqiKJBB8xlCCd2vhyA3wCvwVpL21+Qn83ZEaYOQRWn4bDuq9mHx
         q2Hh7ftU4siUfCEYgOKTCmOglYnunbPywKKuCainCzhcaghDh/QHCsPT/a0aJ7zz8WyR
         C8rB59SLXyUQlnSEVt5rKJs1foS34OUAYkR6nz5ZLy8zjtx5Ci7qnB5mfRWE+iAlxvRL
         du/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444832; x=1796049632;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMYXL7EonhTOs209JASQvI9ehnglaVQ947Zpfa+X+7k=;
        b=I4cMYr0TTaXOHBrtPAVvfWD6BxBtdytWNce09BLE0TcWostIW46C7LoaQIS7SJs9mz
         JK6D/6j8kgJYYG2d0Rm0CU6wHrJoSfjjPGBpOteGZ2v7tyuB3qIeyg1gQzEUR7TYOZI0
         Q34R5Ht5lQuCOpEDhB9PRovq/m1ucxQzmHWA0jsZVJWMlX9CzTT50eTGwMqcj5oRldIz
         4klMpmfxKVzMKG2DpGAeIKgTuVQDiw6BTFjTU2586F/CsuS/emynYpsYK4ra2Iz9X6KH
         ViiaA6nlybAgCb9+CYs/aF6S1EneaFyZBNPSusY8xvwLOswczE6ihQtPETqbsilWXSl4
         nBYA==
X-Gm-Message-State: APuU4Z9Y7OgjhgdqwhLxFTf7KfL7D4As/62xkEohSM41CvwJhRTYg0wa
	oycJVOSu7S7ZFbVcfzgSX7BI+SIszmx8SMntttTwb0uQuUyxkDOyvKUP1mkYeOrgMPU=
X-Gm-Gg: AZFdTZd9PnJ/hpI8N3inkFw8HaUOvS0+1yrOGpC7hBcjOp8i2NlLIbbs4sWTfLPpF9o
	DFLDtZWZOh1mxsGob66WAlsp9KuE937zM3Ny0pM/UnOo+e4IOvNJQU04VAQqiQAA/lOQPFUf0ng
	QJZqkxnaAenuK8vmx0gUfAfyGI75nSJlBMb/HbPzaywYQyWjStAh3dSQz9AYRLjmDYeyCU47o42
	NrLOxDGIUpPRewzXgHjL9j+JMkCiwYZCg++0jRmkqMxmEckFmjGCsjuGYax0gIozX3sRmAMHcuJ
	ZMZkGb5w/anax/cYMyCTqoM6P6yIvnOxZz8frSdDSF2gAkyKke0p+Al2JQFP/HZxDK6rCDpydMj
	wbD9nuACyIXL4Xe2veWelEhSapAVPDWG/Vacdkz82znQX/ChKodf0eoy2nFRdmmipZwpQH9Ubwd
	Dssa04vF4GYtt97OqsnkH0MT5T7/r0BIMQ9a7jDqIc43wIU2AiDz8JL0n4hHZCLbeMirK5HBUQZ
	dw4zVO1NM3fKKKhXfEBZ3yPfyPAINRQEZuljlvOKFUVtFzNqOiPP2gUjl1pEKffH3iH1tZ7PWBa
	lBfHtppA7j/L23SDJN+hnkgJ05vbP5O3avCDQrTXyw==
X-Received: by 2002:a05:6402:270f:b0:6ba:a614:2fa0 with SMTP id 4fb4d7f45d1cf-6baa6145b28mr2877843a12.32.1795444832491;
        Mon, 23 Nov 2026 06:40:32 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm5538942a12.31.2026.11.23.06.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:40:31 -0800 (PST)
Message-ID: <60d0212d-717c-4776-a6f1-fc8c9661c408@linaro.org>
Date: Mon, 23 Nov 2026 14:40:31 +0000
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
Subject: Re: [PATCH 2/5] media: qcom: camss: csid-gen2: fix RDI enable bit
 manipulation
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> In __csid_configure_rdi_stream(), shifting the u8 parameter `enable`
> (promoted to signed int) left by RDI_CFG0_ENABLE (31) shifts into the
> sign bit, and bitwise ORing never explicitly clears the enable bit when
> `enable` is zero.

Sign bit is irrelevant to this patch please drop from the commit log.

> Use BIT(RDI_CFG0_ENABLE) to explicitly set or clear the bit depending
> on `enable`, matching camss-csid-680.c.
> 
> Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for CSID 170")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f..804c8fe 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -318,7 +318,10 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	writel_relaxed(val, csid->base + CSID_RDI_CTRL(port));
>   
>   	val = readl_relaxed(csid->base + CSID_RDI_CFG0(port));
> -	val |=  enable << RDI_CFG0_ENABLE;
> +	if (enable)
> +		val |= BIT(RDI_CFG0_ENABLE);
> +	else
> +		val &= ~BIT(RDI_CFG0_ENABLE);
>   	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
> 

The bug is that val |= 0 does nothing, not that the sign bit matters

u32 val;
u8 enable = 0;

val |= (int)enable << 1;

enable is still zero => two's complement zero is still zero.

and

enable = 1;

val |= (int)enable << 31;

sets the sign bit but that's bit 31 => 0x80000000 which is what we want 
to set...

What's legitimate is

enable = 0;

val |= enable << ANY_INT;

will not twiddle any bit in val so please just stick to the bug 
description in the commit log.

Once fixed you can add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
