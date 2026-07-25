Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9F31E821
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 07:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784964767; cv=none; b=rkkrIonKbVBEkCzRRE/T9kx8AHyZcxSa3DfA9BZyDhTBjOODvnaKtWaL1zO5teKkGKuUspOY2R/5oTC/L0KtTUhZzfc+6mQltg2pUcC6Ta/q5cDxTxHoGBGRRH0Vkrt5UXziN3I968+PmRes7OeTYjR863bs8V2mQzJy7mhGCrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784964767; c=relaxed/simple;
	bh=ISNiLlzbBIN1cNfO53+tFyj2q5vGd9wWiUFlb/jKmRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsaQratop9cap6jz1t0yx0FtSl7Y36376C9WqCFzlj/RNMrMBLqUBqECCE3VwawtKzuyF2VxYESZWj8H5/IohSsmtWMYn9kgcf5G92KOGfDX0tp6hRaMYqOkwcEUGcX+dskwwieWRCRvRKsQirQYfazgUZ4zq6YenfeXLRZCzkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fc6yUYsp; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fc6yUYsp"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aec090da14so87451e87.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784964764; x=1785569564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SlGbODmTnTj5crUJcYH6Lgn3M5IBqL6iL2YhZzeM6GM=;
        b=fc6yUYspRSNyWFzJLMEibOCf1BrjE5PebqqMslxgMS0bICZ1vtemRQfps0JoSm9jPX
         DKoIcAu2wOayPbLA/0iFIYBF/nnh9VZpFp1iTna8vyr3TbBhDjtkvzu6MYxbS0GP3idS
         2IKlF1aLqmzOBV2zD1parsXbHt7QkApft4ms6HdlRgRSi3PyEVRjpLGwtiTDWcxPDdTQ
         moXolm2K5G3BlZZgBJltx2ZARmxX3OKhAgE9a61iZnVW3rIR/Od+tv4chQjOOERw/BPy
         iy8n0wEsVH1m1Sfnyt/OSG7zmki/zQJHLdCFwpDGrRILcp+/VeYemfEZjxiIcA3jw6XS
         x5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784964764; x=1785569564;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlGbODmTnTj5crUJcYH6Lgn3M5IBqL6iL2YhZzeM6GM=;
        b=m49fmWdtN1X8mA5d4YVl9qjGTQ3R1tgu9PrR7s9ojgH7jgY72Smnp2m2eaJTS+9+GL
         JXoCliixxtGQ7OP7131F6pNe9NnX2E0NTjUm8ajD1d/sOM76Nagg3Dti1oYFs7+lwJee
         mk1Daz564MaKr/67wVjuvcGOq1kl9dglADHyTiSCc56IrbYmr+tVJ88SPX8JZdXwOwDS
         lhIwwmhsaN0+Ku5Uq9OP+14dMig/NgYuSQow+/5lZ8IUaOxR2vLSNJ9Vwe0vP+/HaONu
         MaJeZVqofxU9/e/F0JtKiXXUNZJF1dfb0VeW04oMjDxfNcqmdd+nPHQZrcofAh6WRRJs
         7HBg==
X-Forwarded-Encrypted: i=1; AHgh+RrbYVc6bU1E4kqIZkgM9ovZ6H0LmJ4rO12Mt7CBEyd5Haooa+Rx+K8fGiQEJWlYPfeWzeP9N8jzMm314A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVAihd7BcCQqCQqONBYj8C6hULLxocRyuB6RUUYob4+r5m48Vi
	vOJvaXECVsi79B0ByZg6gJ0t8Dh18ar6t0JxqVR+rr78JsMyEnuBlVPhI3UJ7DKS4rU=
X-Gm-Gg: AR+sD13AuOtHH57EFXBvro7g/sdPmP4YHJRhQr+n/O353m2XF5T/7iloH+3rtm7XDvh
	ITJnWZxGoj2baRtWXDsRtxYzK+aTeOZItLGynN+Ru8Fg3haPKpYG2SUOuTGl58mHytDUBXtV31o
	QdLumPySpc92EqQFHb0zBkpVi0XwivPei+0JBCDh0eFgQiXndPszArQE5cNbFQ7x5jThLuDk6e7
	qKKg0bLB9qBC+lAsEGajEa0nUR2oEE2HOZy4u9fNaw8+iNOSM/962RHcRvplbHXqesYsAEM4HmL
	LplT4WceV+dB7LFVtzcPhkp2vLcQDVGcPZou8GaBmFqMv8HuCebUc0Gq9oXBQZ5Kd9kqmAAVu0l
	+Vrgz4Qg1ZRMhNCo7w5nSBOZ7IYHrabXKlhXUjiCZpKu+ajq9jVAKMVzfj0VVC/nVaRrRi0tNxm
	nW4RqTIcacGcJZRtShorSLCb8Ks15WcN9mk1jM3uxgf0YRzSkdZedYqbE0VesAEPhLiuU=
X-Received: by 2002:a05:6512:3c99:b0:5ae:cf48:bd37 with SMTP id 2adb3069b0e04-5b2c1b0201emr130838e87.1.1784964763762;
        Sat, 25 Jul 2026 00:32:43 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d84fesm297418e87.47.2026.07.25.00.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 00:32:42 -0700 (PDT)
Message-ID: <0769346d-b49a-4043-a2fb-60c9e5f6b6cf@linaro.org>
Date: Sat, 25 Jul 2026 10:32:41 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/17] media: i2c: os05b10: Update active format before
 adjusting framing controls
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-13-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-13-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:09, Tarang Raval wrote:
> os05b10_set_pad_format() calls os05b10_set_framing_limits() before updating
> the ACTIVE format. As a result, the VBLANK control handler uses the old
> height when recalculating exposure limits, causing -ERANGE when switching
> to a larger resolution.
> 
> Update the ACTIVE format before adjusting framing controls so control
> callbacks use the correct dimensions.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index d124db74766c..82a96081fe21 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -907,14 +907,14 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
>   
>   	format = v4l2_subdev_state_get_format(sd_state, 0);
>   
> +	*format = fmt->format;
> +
>   	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>   		ret = os05b10_set_framing_limits(os05b10, mode);
>   		if (ret)
>   			return ret;
>   	}
>   
> -	*format = fmt->format;
> -
>   	return 0;
>   }
>   

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
