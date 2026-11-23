Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441602;
	b=VPqQl1v07DGF03sbsiJ79Mw0ig5TCNX2c+aKRjQvw3L6hruq27pDoIvVbHOoZXzJhVrn
	 /XEe1pL2qyfDi6dAxDqOvkeSy/BeGF9uQnvQuvND38DmLaWbU7SjRQun31xFMEXVb1z6u
	 JjdmVNEjin+cfRIIktp6Co3mT/awDDnFK2huYELP3KUHKYv3lFqXNLIBbSTVUanlcPOPx
	 AJ+DQlqHKr0OATW8qoF8KLmhkNvHlQDPFk4RXbx1PfMI6ZJu2Loyn5y9bD5aKp5lnxK04
	 +NinTVnWCMmIJ7B05AREQfxDdZpHTita1WDmvXdzl719gygj9ow64084E7mPxCbjtHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lsN4s6O7Xr+GMG16LhGLC6kalvFOTVR3XV/FNFkglY0=;
	b=uCLyLiveMvsACgSnO+DP1d75TlL2x9vLTUg74KhqSRRDA+gh/RER68Y36y4BycMH34QI
	 ajQlUE+WhzkJz1gRxG0deSiySUY82rjWqxxcoLKgeX3i8BkYhMnbEqA7WAdhliILdopyW
	 tw2R6HJ3OFfFyKw3gLMhSjEdZwW0R0ZSDj3qBwHqEw+hClSO8I8zwORFwLkhV9nOODzRh
	 ZCaRaBWMxkOSd0qjSKrBiHQZqd8+TfI008PctsmUVzhQfFvRsbGkqRcxhrVHdFvo3fXu+
	 ZfOn20DTwQw+rJtbOHNqUdASCT4nS0QlwlCYR9pS6eCF4d45MKh5e4oakdSFIysIiig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ccozpp3N;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04739606A321
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 13:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04739606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ccozpp3N
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso3756994a12.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795441600; x=1796046400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsN4s6O7Xr+GMG16LhGLC6kalvFOTVR3XV/FNFkglY0=;
        b=ccozpp3N5Byj4oTwgwYyuvOldNCFsY1t/OrR0Fq5MYx8mNcd4xBxCjKVWIgnyAQ9J5
         XwxoaxUZ01Egxu8d72jhW3VdACQGbCWBtVaMWIfCRcc2MSD9lJyIIYaXZzizZ1HO6ud+
         ML25HSLdxQiN19Dbq4GY7FXavhFhNLtnDrbbCTNmW/jQxL96WOaSw29ma482BaKpGrqk
         MmRmW3GBSa3ry6H0fNPaIr9VE289ia7Z8zaaqJDSZWS3x3/dkkuIdCYz8MZmdrGW3kih
         xmIGk4C3Vtv9ezw4dETbhA3It+i/E1O4md1/i3yBh9mYQoL2YkqOCQgtEN9LJS1FJc5S
         PCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441600; x=1796046400;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsN4s6O7Xr+GMG16LhGLC6kalvFOTVR3XV/FNFkglY0=;
        b=uA9YETyQMx6ce/1juWLJBexAaBxzOg5HjvWqkkQ4Ky8aSPtXhxmeKN4M9zWYslb/ut
         0jJjN+oInJsd9ezTrHJm/CDR879+wKIqTnheitjU2NxgAhmBKFrjgrn0q/PHGTe5Dy2S
         r5Ia/kCP79FXHh2BqA6GkwmqYt4sknxIzwvp/v17fTslABTjRLWMstmUoNQVjeTmhsbP
         mf+T+NCkz48PRKt1ePNGRur2FGQQAcROSzIbpWuto1lJRj/MIn1fCiN76z4EUcIbWINV
         +CaC9qz8sxullTzVA/3aOjWE3usnXonZpNl1OD8Gif3T8G7a7gfg3H7GGsQzTkVinv6I
         CKPA==
X-Gm-Message-State: APuU4Z9B3QtZCwTVeqVvvGL1wLYPUgCJ5GrhdUn6I9TNEmDEKEHrPfxo
	R8q8KqhYjA4XRBmhc+omcqfroDUt99geTE84nfxrpkMh4XIaTTFGpundzxsPNve0y2A=
X-Gm-Gg: AZFdTZcIka0fVgHP1enVsYJxBVBl9ZyDG+FNCdNSDq1hbSXhIsPti9w97SW6/dbWN+6
	s6MhzZdiW5OgoqA9KPVv2viS5WpLzbIB6rPcTNTJ59vKVxZACkv/Zy8+rJWs195URETGwzWWV6l
	l/Fn2HC3faG/4PJ+Ygewexwbio0SES3/2xJItCrPcwgqb1Dti+acSpVxfuY5t6vJyuPEaokfJgt
	OoQYnJyUUAp2gYA3F6Do32wtM+CSgBzJUxBlBE28dOP2DLrhaBt7CGZcfhOAv0y/6ksQl8V7a+G
	iJ2+wH+s+7VF+we27ZXi4EO93GXbdf/xHMgNsamSPVr2Kqmt7LLlFZSMXOh9/nt1m9n5ce9CBa/
	CKCItDJ2TknMI65nAfXmSAavJmh9QMjQ0JqsASLELaI34urwdml5+J0M+0Li2boEPfu/aCDGieW
	9JFtW7kkg0KvSx2XhQ6gyfUC9OeNMUtu3AKJO8b2ZQnccWJoWhDO95AVOkviXSB+6pJ/HOYqo+g
	0HaT4Rp5OkIpmbOZ9tDhhdsntZGtic3auLRox9me2Qh6J15U6shFWjXS2tPzj7kKNbq65Sd8Ay0
	dQGaOl66wzsre/d1gFTq0IYl9uzS1rwv0Gbglm7KuA==
X-Received: by 2002:a05:6402:23d0:b0:6b7:8aaf:5cc2 with SMTP id 4fb4d7f45d1cf-6ba37d5bdfdmr6955266a12.12.1795441600314;
        Mon, 23 Nov 2026 05:46:40 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm5457431a12.31.2026.11.23.05.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:46:39 -0800 (PST)
Message-ID: <e4e2e0ac-103e-4646-83d2-dcdb7a0a9c04@linaro.org>
Date: Mon, 23 Nov 2026 13:46:38 +0000
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
Subject: Re: [PATCH 1/5] media: qcom: camss: vfe-17x: check status1 for RDI
 SOF interrupts
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> In vfe_isr(), STATUS_1_RDI_SOF(i) is a bitmask for VFE_IRQ_STATUS_1
> (status1), not VFE_IRQ_STATUS_0 (status0). Checking status0 instead
> tests the unrelated STATUS_0_IMAGE_COMPOSITE_DONE bits (27..30).
> 
> Check status1 against STATUS_1_RDI_SOF(i) as intended.
> 
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe-17x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> index 62c2405..502a0d4 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -356,7 +356,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>   			vfe->isr_ops.reg_update(vfe, i);
>   
>   	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++)
> -		if (status0 & STATUS_1_RDI_SOF(i))
> +		if (status1 & STATUS_1_RDI_SOF(i))
>   			vfe->isr_ops.sof(vfe, i);
>   
>   	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
