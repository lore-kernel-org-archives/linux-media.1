Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E32F0C74
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243136; cv=none; b=jfxy8CEeronwcGQWNGvXxCVqFeDaHdLPcEw43o9gtPlxx0B7/pICet1RvECOd9sTs2/HwUlGdhcmAgSuggvZNi68OQaU5Yuhl/0HtCj5TI12708sQoWHrTN1k5Dh7b0hjLKsAprDxJthnzhufejxyyjRGz/78tOHLwBMzJH4bSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243136; c=relaxed/simple;
	bh=FMdMDb1hsRT2zerT6pupP/XGqPrIeGTpfhSoF7SeLBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSULy888tVwokUSFk+e7BZI0H+2MW990nhWzKyj7bi3KA1ty3qQQ0Ir6WVVAYtAv7YZ83TbcEP1u2eWzb/yMI9TVPWiNmXFoposCz5gltjkCEDG6pszTaT5d+diol2v4XNG8xjc9A4XeNWkW1X1hzsS43sDT2gpXSw0FjjEMpRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVuEeVgv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVuEeVgv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c160420289bso497994166b.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785243133; x=1785847933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CEzrLHR91J0dNl9cxgDm1rKeXDnUWpCXkb68sIs8ng=;
        b=lVuEeVgvaH6RZ8PTiEAncKufX/MFlrRTYav1+NEPLJwhc/TpTZKzuvPo5avKNuPA8r
         nA5PeMln1hGBBqiD994YNDE4d7i8AmIzKLlyzwPpjNvvmJA1tGy05T7KYQVs+4JOYZ6G
         L7S29FQdKfdtS8JK/nex1/ywtCMX+hkqdVVtNaf5HgFOwzB9EgDGdi5H0BH33WnXLZYD
         Fu/20JOyKV77I8Czubto2j5hlM+ifbhcJ3m0/7Dk4Qglvd1KeNnks7XnVCpkrk6XPQAS
         ZGiolDVKP7vNv4xsCr2q17oLlPS2v3UVihnLUIwHdOXQYSOVglVXwCq8V8jcTHbAvzYh
         pwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243133; x=1785847933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CEzrLHR91J0dNl9cxgDm1rKeXDnUWpCXkb68sIs8ng=;
        b=sX83BWS/FJ9kNPtZi5JDGt4aIlmcYHTMmNTYOx514ZK7Nwzn8uIp1/VMk9XJzSOgrR
         khjCZ0i5rYDUOBS6NB6HeHbT8ksqHoxDzXkjZs6aDlvtIlrb7mZW3WL65ltpLeoespjf
         z+xeX5ljwOZY8/CK9yZZozhIdV3o8ZUY9LjJT3d0JVOj+HYJVg/Kmv1y7v4lGuJQBDKN
         rnRe4gxBwW+MDS78Kr5XaWdxu71XrhLO5Om19GlbHBGApEep3+v2aSQGQBp6BlSL0LEg
         OPwjAlMYVpTSMEhz5bfvpzCWoqGFxA2iT6f7DXOAqwpQFZx6SRiVuxoiGFcohlPkS35B
         HLpA==
X-Forwarded-Encrypted: i=1; AHgh+RrGkgM3/+mlV1ei4UFqaSlfS0oqeWsnzDvxO+/wV0ikJttpgyno23po6dZqfPAgsAHW6n5WUiiyVn9/kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LyW6gdKu0Nq3LOOH6+JDhCEjUDOuv2+EGH+3faAMQ95Yh3Kk
	6MT8fiA8zMUF/L+0/rUOlm6LdY4pN7gofHq/PLxdJixzDo7sCXKl/SqQlYXaxwjeedk=
X-Gm-Gg: AR+sD12G+WFO67PPAsb881GTcGMeApq4P05WyNAZGrELOZo8AF3VlGISqaUzQH1y2RV
	yTXJDH9goUKwRsI8PPQJNr6n5dt7PqgknFID7B0tHOkSinNl9c6TDLH2+M8VcHOa/wFHY+ahN6/
	5hTTDQNaalg+G6DxJVGpGE6/TiUYf9iqAX2rgntoS6ubLEqAhuVVM6FZXMRQn3KIvC8e1fUnoff
	9FpSR6Ct6Y+sB4dSmF8AXpX0bU4Jjm1PZ5o5PSkD50dfijxEDuLCFB467I5HORF+IKFJyAEAQCg
	XwlcyaCUuMnkNK49nsuFy4LlfCy5FlcN+uHLPE/gaOTqNOXL+poLzmapwWSw2VnSpCxLLHZ2yAY
	mNrFX5DObXDa2L+6kIGaHJYAqXFwt1oSJ8hPP25E7BSHQRELT31zBLs+cWajZiJFUau0YWV1DFq
	E8QDUZqjr0eUjvWA==
X-Received: by 2002:a17:906:6a18:b0:c1c:254c:16c1 with SMTP id a640c23a62f3a-c1f719f4dbemr120090466b.0.1785243133082;
        Tue, 28 Jul 2026 05:52:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f151fbsm773063966b.56.2026.07.28.05.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:52:12 -0700 (PDT)
Message-ID: <cfd2e58c-e42b-44e3-a901-2048e496fb08@linaro.org>
Date: Tue, 28 Jul 2026 13:52:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: iris: handle runtime PM resume failure in
 core deinit
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com
Cc: dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
 mchehab@kernel.org, stefan.schmidt@linaro.org, hverkuil@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tR8w2GUkOUcarBSbnLxQsLPJsDQrGHIxWcizc8oRS0vu5wWNbeqYLWN5I8JKOpgJg61rd7q3XoGBl0KeV4V9JQ==@protonmail.internalid>
 <20260604050451.41583-1-dennylin0707@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260604050451.41583-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2026 06:04, Hungyu Lin wrote:
> Check the return value of pm_runtime_resume_and_get() in
> iris_core_deinit().
> 
> If runtime PM resume fails, skip hardware power-off operations but
> still perform software teardown and state transition. Also skip the
> corresponding pm_runtime_put_sync() call to avoid unbalanced runtime
> PM references.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Keep software teardown and state transition when runtime PM resume fails
> - Skip only hardware power-off operations and pm_runtime_put_sync()
> 
>   drivers/media/platform/qcom/iris/iris_core.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index dbaac01eb15a..bf3c7f722490 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
