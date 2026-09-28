Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B284BEE39
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601957; cv=none; b=iVPU4iknjL17a5YA7NkPSwe6OKLO24kDCW/IlPKLuUU7fWlu59k+/fepGeJYYrha3XUOFht2y4EPDO/fqskJMv1r6MZk9LXQ/Lo/TRBBzFE3cGIZS/aPVn34HDjCcI4+Ze4eJtmnPdohzJmGQd8saU9mKSwk3xsqRR7BFQD/EIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601957; c=relaxed/simple;
	bh=XeTqlOGO5UJpA5Y/ixti2g+j5EuJrE8Ky8E8O1CBHsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Te/kIefF5+bqWHT3HDy+BCPfPOvLFynmS8TOrRwDQGACTUMQsbx2JujY8PuN0SqDDzrWiLgp9du7ZPkNtGmRm7RlZpymQYQJLUTMrzgUEUv0AfE8/4qwQxD2LPhLybHMp7vS/sOxExKjXlFbOW4XWimUkucE/SEmBtVQuJ90YUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNzDdE8A; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNzDdE8A"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso7315066b.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790601953; x=1791206753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zVAGtWsSkfmenTzIW3+TUh6amDiHnEAZ63ReFuJwGY=;
        b=uNzDdE8AmNvXPq6K8MMxhHXPNO5wOXOwyRh8BxcUPCQANOOFQrOnm69tdjjAuQJXix
         LjNyztpTUGBq76ro/IgRvMeH8YHSqGz9/V0cZO5zmXa0iPg8QwkXQw8nnEMNT1ZDjl5r
         qeMZcsRDyDQowl+ETuu1zOUjz1FNeacEG+vlqxg7zbmSDDD6NCCul6fjaVf31vHji2gV
         enFXYFavNJnu3sKpiUWBnfC793cLmdkb6F6eVtP5VCUVSlQJ6eyDobwEoOJRcgCxMDZq
         Lhn7D4CePvyOWHInZ9ViGvnag90GXr+gyV0iGAEtt8FpFDwZMVKbcyHqhGxpUYsAYqIP
         nE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601953; x=1791206753;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zVAGtWsSkfmenTzIW3+TUh6amDiHnEAZ63ReFuJwGY=;
        b=WDTJHlMJeFmBEQLRNGFYqF6pd3g18rGym3lbdFnXYVttFly+DKrwshKjiqJRcz20zm
         zRmEvUgLRX/nZ3tH+BJmTg5WIV7FZrSQsqFO0Fc2X168KgJZHfcSsMRBn7l3KYr4daQ9
         mYQLsyBlzd63ZqHWTAA2ghTG64ke6lHCvYfuIOhYKE1dgNtgMR2wBSlhOgahnV1s0AN2
         1Qxl9UrkcRpPD+OO2CNbmJ9JRPImvG6uYT6SJuf1oTIf0wQ7XrLLA84oGo9hAjDDmB+2
         hwyvEANCJwgYzIxADuTdB3m3SncEd2bGessmPb6a8EU2vkc3T2lOOWiKU779ntdZpbdM
         wTSA==
X-Forwarded-Encrypted: i=1; AKwUvBzwEexR7ewFUqa64Yx5nhPtYuUfc73VswWn18ekceLVUJvcUAvM7k+zm3IFLzCIkWVwn+/lZ2eQGjCERw==@vger.kernel.org
X-Gm-Message-State: AFuF++kkmyWk0fkmYasfoZCiJ0Hhp0+YVmQ5rkcnNtpjnCXtmf8vwYGQ
	Y7ZvOEr04ekB22c3F5VpOHT3xTsKMMuih1Ta0xvTMy56Cu7CCkqPa5RCrfXB29s7oz0=
X-Gm-Gg: AYBFou0uRDwfz4rb6qH0RffNJLkHLJwZ5y+dUP7Tb9Lvd8ZSN2eUiY2hYAM6RbW4Mld
	csfsksKpDMG8EZHysIp+oe21dW+cP1HR18XV8Y5wgz9DgfJXmNv51fRY8qzqW2IBSQc0FkSEfvT
	5SXmYlxy63VJEdda7SLd9LtbbjiREdDBMRolT45IAhB8KCTbuWzDfkrSFOacw6Eg7AEGleg6azZ
	lkAabA43DM46lIPvHbcLG67yJLeO2jp7KJsJ2z13TOxZYVFLwhBKY6Aoy5AQ66WrVlHsE6KDzzG
	csBLn5mC+m5CI+eEL765LAmdGsiPull92udBPHabc0ZmKpg1mT1NH9rx2dcnYeNgSjcoTvBZQrF
	TyElZOUYloNga1N6UCygVr6dhL3CQq6mGnNOwrBOxEA5INH2OFUCxmnTHUN4r07LhLqXdmA8fOl
	F+Xjd693Ukn/P0JhqOFVVHSxYUGLF1x5eycRrCvMz0PUZOxJ2yEPGzHrnpbwUvSYgPw9p+SUD6O
	+BgCoy/2Ch2
X-Received: by 2002:a17:907:db18:b0:c2a:880d:777c with SMTP id a640c23a62f3a-c2ac2245724mr1069641566b.10.1790601953464;
        Mon, 28 Sep 2026 06:25:53 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.243.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357cf3sm475547466b.17.2026.09.28.06.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:25:52 -0700 (PDT)
Message-ID: <15ab286e-23d5-46c2-a952-0be1d93409ad@linaro.org>
Date: Mon, 28 Sep 2026 14:25:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] media: qcom: camss: vfe: Fix VFE reset while
 another line is streaming
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ravi@ebytelogic.com
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
 <0udzjudr45cAD9iLLoskmn10mElRgfZYq9Ir2wzfaY_qUhAb9W4CfL3Gr7_j95UJI4vC_CMphfJmwiFoYiwmNQ==@protonmail.internalid>
 <20260928121508.1404808-4-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260928121508.1404808-4-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2026 13:15, Hitesh Patel wrote:
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index c14d97a131..d20cd4dfb9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -821,7 +821,7 @@ static int vfe_disable_output(struct vfe_line *line)
>   	output->gen2.active_num = 0;
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> 
> -	return vfe_reset(vfe);
> +	return 0;
>   }

This method should be void now, I'll fix it when applying.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
