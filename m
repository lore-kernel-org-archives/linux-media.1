Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141FB156661
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935912; cv=none; b=D/wmMvwiRBk5Blso1HCMUPrfnWBwu+Fhx3xOChBcfGhumMHnLfKKrZuesDKQ+aw3DnpR9J7jfPUZepopjuxv2X7vPK/n0x1SbFeto6tzE8LA30PILBhp++twroXTLvpq44raQ1T1NN5FPKo1K2FfVV0idknsRSCwKV3PN9/Trow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935912; c=relaxed/simple;
	bh=GTZmRTGjvf4Szef25RFFkEIFVatv/+hKtpaK4xFUoqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boLfmt9OsxstHMZIgV5ISV4Y5XlvSROLbiCsdX+chk/QK0PSBSu3Nh76mE50UfpU+sOpMOTzh9YFzPJAp0fgjcLdgbRNEsH5WQpaYW9iUerX5lwL6XR241L65p8i+AjvYOLGiQrWWTuIp5dwSGMy46CNpS9MwazxrF6nBalm7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rzVcsak7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rzVcsak7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so82935565e9.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776935908; x=1777540708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NLJTBjQdXh413mrTdcE95r75pYedydwaciRYMhFjQA=;
        b=rzVcsak7DlgwOP3yO9Q0yAEHJTa6Q3VkQiwYINxarUEIQTNuVg6hhVkpzI2ulZ60Gk
         cU65yRx42uO0CHfrA3ARuHFrnxKfGfjPh4oFO/t8HG3nlDbHcdWaGtFlVJ9Xy9GqVnij
         H235RbM/UkUg4g/jRp//DJIXX2J+zzlMbSJvbGdcxlTme9JGfrKhH3q+hZCEiWdccdBF
         /6mEzSPUMUobPnoMLnNEvkg5ZvzoF9JA6ApsnM1vbeBUKtQtG81SBINjXO3B9pj2sK+O
         xVx+B5vJyHUJw4dMduYckw0Uw9Q0sEgwSFqwcOXe8LNwpVeeIQUxhzd0P1KsSRAI5KIG
         vofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935908; x=1777540708;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NLJTBjQdXh413mrTdcE95r75pYedydwaciRYMhFjQA=;
        b=YWU2TqNG31sUnR29Sqw3TYsHMjdDnVopwUPilBX3p5bvjzdnYDk9xkMC/XmEhzxHa6
         n/oF50O0srlzjjwQb4vk6n6x8isEA1Ivs3iNHmyI1rVurrT9po3LFt0nelTSnIKHzrGJ
         a3JdciTnpe1kv/rJ4RNuKg8SsMBKxfD4IfDMOv/65VvwV4kd+13Sni3IP8VboS+drohQ
         FzmMhH2sIyoGk8lWgFzqETIFK+vQiWCTG2p+1f2lQBv1Hz9DmW4ST7EnDlsHDmTNWyw9
         8xndloIplQUF/rujg7H9LbZfb0dH7qlAhxdg0nkgDhHoSopN8e8ljujX/P0nnbYkh5vv
         zpJQ==
X-Gm-Message-State: AOJu0Ywtv45zJLpAaSpW28DVmqXhVdBQac8csLAKPVA2TIMPUtzuv9iA
	hPkJlvT3y8s0U+e3mXTy7ykTXQk5kJNJ1xrbokFZu/HtGQLLKQ6sRLXu+wjYoUZxy3Q=
X-Gm-Gg: AeBDiesPdmA54STX5ZIOikFjqAUdQlCzS6CgpN8XQRSYWzY2FlgIXetNCcQC/MmbURu
	r/I34nl6qAIlQHPpu5e5id7lZ8Lbc0jbHkcPnQnJcraf/652H0VjBYssQzX2uxey6yLxmv6c/qY
	J3UJCy4A7ifInRDeglotz1FquwXSzvC1Oml7c1EhAZz+ATVr7mPYy0SBo654P61mJGpRV9rTO2T
	ihPp68Gd46A+/10EMdWyD5kQ+oHtCYQK9QiRutRxHNYkyiuX9T9MiqaiZuj8MfQIbvSKdxMZXew
	IfHYkppKJ/agxCOabIaOfq7F8eZbkjgGTJSkG4WClQmCr6MK1FKC4FyBxDLP/MPzjkl7Ixm3mn0
	zUkrLBNYGDTZRIzuk2styRzyawuMHuKicqAQk/AGM4eI0V6Y8a4jLqbFVGj+Zd6D+NVGzhXgnck
	7QwNJW/1GL0j52VT3n1plHBaOBLvg22npJQYdNzNCPgcrW
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488fb7880camr376050235e9.23.1776935907788;
        Thu, 23 Apr 2026 02:18:27 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.41.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489201cde98sm266100545e9.7.2026.04.23.02.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:18:27 -0700 (PDT)
Message-ID: <66253ee8-24b8-49a0-a141-e520c0486ab2@linaro.org>
Date: Thu, 23 Apr 2026 10:18:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <clmo5TM6l-TrI29LpBVlbWN4TBp2xlkDVsrJGus1QypS99Yc1dAEnEwqjlNweGLoS_GPZHAXH-YqnaU-hAuRVw==@protonmail.internalid>
 <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/04/2026 12:16, Dikshita Agarwal wrote:
> The state‑change debug log in iris_inst_change_state() always prints the
> same value for the old and new state, rendering it useless for
> debugging. This happens because the state is updated before the log is
> emitted.
> 
> Log the transition before updating the state so the previous value is
> preserved, consistent with the existing sub‑state handling.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_state.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index d14472414750dc7edc4834f32a51f2c5adc3762e..e991f34916ec6e74f3d2cf98bd61b8b1e12a3ca8 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -60,9 +60,9 @@ int iris_inst_change_state(struct iris_inst *inst,
>   		return -EINVAL;
> 
>   change_state:
> -	inst->state = request_state;
>   	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
>   		inst->state, request_state);
> +	inst->state = request_state;
> 
>   	return 0;
>   }
> 
> --
> 2.34.1
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
