Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567883F825B
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244551; cv=none; b=TfHhC1k3H5b/BpQ/waJkdAQhY8C9Xms9fmgVLahbI9WyXEE0IbnKmilKkqWOYSCj5vlTzDEcPKakGyrsNOf+HGrMVA82tqvO8u3fjmy782rmcJTD6I556zyuty7tTdESr0ftbNxSR4cjXlWO8Oqb/kd7j6k84Qt4TbJThvUMIT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244551; c=relaxed/simple;
	bh=00q0aNwdmOg6Et5qu0O52+EkBuplSsck0mqjSRMWME8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cw32ZZaohNIRfnk8U5xGypo6MDY5BzkV8VNhlvQ7+GcqWYKzO5LkScc8yH50YfDxbb57L1k1ycUITB3Pjidp+jBIb33HHENTGSYzDN0Mq4gtnWwAypgVnRey5gASB1qYOElSHZeiZpakdiYJgqgkXDv+rl2MTQOWXrqZDfEpAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zcr4a0XM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zcr4a0XM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so608077666b.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785244548; x=1785849348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OdVxKmahjOeWv4mCr7IV2pAwr1j5bRzwVh+tCNucKsc=;
        b=Zcr4a0XMrcFa9rAmpfK1dkdHKxcMPISArrmEGC5lbiZzrOTVE5Vhftotewk1UbgTrM
         GvFBlA0QY1L693rflRbQqs2XfEXB4fyLlPcaAsmEasb0jRzU367NqRmcTCt+qOw2uxOH
         9Te/t4eZVNnA23iNLeHpaMg7bv4pDOlqNz4Bya5h0x9S4Ro7HEVJRCHyJhdfvUHLUooh
         QoRqUCP50brydGU3674MZQtwTewyAUbI2MJd8x+KwPQetQiLfTsB7+isOaOJIvYciBBz
         AOwbMimeqkY4C/SdZTu1pMH68fAHHJEeKVwLbSEgruIUnTeCSBaZ/TxEvmDqEGMMbOb6
         STPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244548; x=1785849348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OdVxKmahjOeWv4mCr7IV2pAwr1j5bRzwVh+tCNucKsc=;
        b=n165dWpps6iFlkjPgLdgdwyISnf44/sfCRLN1vOdUorT7KHXSmUTE5yFRpGOyT4FhA
         YkCV5SgYFUNinOKWMT/gDV1UjXSCQO8b9t2A4jrp5z1ZJxE7jQjDYkuVcN3Ooy4qo5+f
         HriMGrgyLR3BbUYdsJweqVOFOjPFSw035+tcOFZtviRcw/onmxnrrwwZMjDnUF8Fi0LR
         /TWqYS6EzqExFeo9o6KJ3KGh10PuKlQ+UttC98jZnF5zkmBSn3/kOxUv+saAyaL85s6M
         nehBxnMUFtx4FE9ryDQekPIUHWgFkcMXZ4JdPUWeubkWfw/zfa5L/xZjlsn3jHwSI2GB
         Nk9A==
X-Forwarded-Encrypted: i=1; AHgh+RoANXbCwNhWyRnWcdrRjUqh+WpMl9nu6dJz026rjDoA1hO4mlfby20TpXeXjukk+82AefJtgAGbtsk7TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzovKhcLfzcimgFnPwIllxyB8FZ5+f0IEQ7VSklv4Av5ycp08ai
	Xm6gpALXtWLYx2X2bLLTHseF9Fu1hbwYsv+juk2+FKfEodAyis93+tuGwny3Zr4420s=
X-Gm-Gg: AR+sD134rQyPrNosk+BAgusebcxIZYRVAJ6CjqzYgIpC5qKjV2isfv9pmNkBIR/pw8x
	Mu0iwtwZeb6VYA7t5Su3SSp/T1mtk8dtaQ9/XLVEOcmbov4Dh3jVTKB/YmeULu/zlvAb6MBxGED
	9VzQR002SFYZ9BHpzcWleXrNfEZ8U5WHZWKpxK62ll4Vqtk77cmntfYAjSk+XQNVK45ogyWPpfa
	IJJus9sG6wIoF7x0Vh1kSsLHzJHBt1rjydyAVdao/uDSaPbEqvTN/HU4lGQc0Wym1YF/q9ZSJuZ
	MUh0V61WFHseSJvQbYvDnsf49INEosrym+Ui2vGTZcNezFMLHAk1aGz+KpgNIrX6lLuZFcEW92t
	wo+zzCnrb0KSrQFkHnFgGjtzHsd3litCP5wgzMCkC3e4zRcX8lC3KxI4d9QGyMMHHezKWQ+lzWn
	gVtYcW3y9F10kRuQ==
X-Received: by 2002:a17:907:1c2a:b0:c12:6d25:2c7a with SMTP id a640c23a62f3a-c1f71eb0390mr110717066b.17.1785244548180;
        Tue, 28 Jul 2026 06:15:48 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebb385sm767508666b.52.2026.07.28.06.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 06:15:47 -0700 (PDT)
Message-ID: <a04ddd8c-ce8a-4543-8276-9252447e80a3@linaro.org>
Date: Tue, 28 Jul 2026 14:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: iris: initialize OPP pointer at
 declaration
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com, mchehab@kernel.org,
 linux-media@vger.kernel.org
Cc: abhinav.kumar@linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <p8NSmvECOk-_jIx5uEArAnQfJobHR1C_jG70cWLVtkRStz0rvBYXIAo_84HqPEqAcXpiSbAxVuyosr4vkDMjWQ==@protonmail.internalid>
 <20260608120531.83459-1-dennylin0707@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260608120531.83459-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 13:05, Hungyu Lin wrote:
> Initialize the managed OPP pointer at declaration rather than
> assigning it in a separate statement.
> 
> This avoids a checkpatch warning about a potentially uninitialized
> managed pointer.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Initialize the managed pointer directly at declaration as suggested
>    by Dmitry Baryshkov.
> 
>   drivers/media/platform/qcom/iris/iris_resources.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..fd643cbff8d2 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -61,9 +61,9 @@ int iris_unset_icc_bw(struct iris_core *core)
> 
>   int iris_opp_set_rate(struct device *dev, unsigned long freq)
>   {
> -	struct dev_pm_opp *opp __free(put_opp);
> +	struct dev_pm_opp *opp __free(put_opp) =
> +		devfreq_recommended_opp(dev, &freq, 0);
> 
> -	opp = devfreq_recommended_opp(dev, &freq, 0);
>   	if (IS_ERR(opp))
>   		return PTR_ERR(opp);
> 
> --
> 2.34.1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
