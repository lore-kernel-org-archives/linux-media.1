Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DCA3EEAF9
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900633; cv=none; b=K+Fg5mDVIvLdEkXny1rrFfAZ7UCZmP56QJm/qk4p1a5YvhML9xeAsO7QAP7JIS3pkXpOEZjrWYbkrgRhHavSmSBDs9nmIGdEuPa9EJY9vN1ym91AaQCmloVMUTlN4MFX+bdpDuW/9eDVOv7z08HmyDNWG/BRSwiElWM/zOxSscs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900633; c=relaxed/simple;
	bh=7rKr8+DrxOVUTRG754FKdDz4YxLx99k2TRqYvtiwVck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E6tqcycKiwyWqRwYxLghkhZKOmzmDJb/2ZvKgZ0JdcNTddrGGWb9+k5z2J7nH+opSb5uvcYhPK7uraJpT205X9KC5LO4lmHUJ2lkXKSkAViZZ4+z2vN8vnlt/zLFSy8JiX5hN5QMILnYRteV48GbAnyxDBUf975MOvdAZQ59Vio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u07MjkkN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u07MjkkN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebe49b227so104823e87.2
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784900629; x=1785505429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=idJUlieRLjgB9AQfn+Reki5FvFaXB/Lvpwq2VVswqrE=;
        b=u07MjkkN87EhvYmuOgzXJMISa4xKubWD/mZqUaZFOhf4XuAjz5koJIBxTn5jjmFUI5
         daEKRRtH3KC50zeSA3WjYV5VyVj06+pFWSzzSVYxyhnWE+hxXCB74Jkvm1LypLhwc7Lo
         1U1v1kqip8Zcjsx8D61UgZBpsXHHldRpruPZa/DViZAhYZE30YUGIlG6G6UcCVRJRcn1
         8X3pk8FoMh+EldcR1GBmoeGul1M47Zz2hI9vGyxaJzQVPgn3wuz3K7SWrGpKuWWYnetv
         FmUApdcqL/MIcW129T5Xw5/ROCvK3ToLcPl0wgmt+aM+OspUMzmsYo/aW75wDW55QiW4
         xgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784900629; x=1785505429;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idJUlieRLjgB9AQfn+Reki5FvFaXB/Lvpwq2VVswqrE=;
        b=okDsgfVEz04d0Nsl/EzG5vslcCj6J4+mtRVkcFKnjUKclOiZ5kJe8cItOY5tjIo9X1
         2cuNsdiM78uU57BvO7cuCSNVYqA5W3ryNpPf5R8azATyBonbPux8T3aOgQD7kUk5Kjqw
         D0vLgsYb6Vkg3VB2Ftb/PRErRFrvwSh7hpJ1r4sNEjZzjYweDxVEkgOEhddnD4A3FwHy
         uhwDU/InyIMKHcpIUNdaTAZz9IB0ohwODoP5kJKYILx6AyNTO3m5Qnw+jIrucGuX1vcw
         jge7u/5oZdvaeGrXPm2f/nScAyaANHXVVpQ8dPsbB+Lj8+Jkq6wkkrdO7HiMiNr5O29u
         IfXA==
X-Forwarded-Encrypted: i=1; AHgh+RrINL9Z3X54Xer0maflzItMw4N3Mped55V0iEDvV7lIZgskuDlo4Bid6YW/Kr8bgW1/KTDZTj/vfwuv3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3XC9op88EAR6BPrgN2V8DGazzGAtc+F8NyzxtCAW1fD0C+CUD
	mhsILN74eMWIBxKVxsqcqub6NFzwOft92FLtv96KKDSGyi1XuDyr8Istrvgew0qs+Tw=
X-Gm-Gg: AR+sD134L4PPRIjeZtLnIdXi+CwDS9k0rMIllaqsYdbgrIOk6+0FJ7vDCd5bRpOmig2
	6tm5hCa7me+xwHAmiosw4wa7hP4UCIjcsF5TdFTTdAkQxpmZdVcS9OQX2WKihjwQS82nwiDDIjB
	QUKW14mJwPoiQVjw9g1RYeHnF2evVyzbZqgSOEiF66Kp8XTlFadxiyiOAg6HRkiIGRNju5oqtkw
	vs475oJBSwRy1ecHco5TDnVvPQDEY9z4w6DpsVOt+g6sd9jkuycUmY3tNXPFBVnTbwzlvOc6R26
	Y7mnDPMdyOGKv4SvoD0NsYwPeTY6Euqlb96xzogDi3jiwYXbf/bxZhQfY2PcdlvMn9iwDkxG2Ko
	ZPmllG0LfWVKcEsh5RqNr4X+z92i5gPr1u7OlF18CAXFFh9JKeyYKt5ML7+YGwTWiqyDnV+gvBB
	Lm5DuyP3YaJz5AsKWyzNnuJynQhLqA4XeRQbl9wD2N1xCAeegd9I8UZXdg
X-Received: by 2002:a05:6512:1256:b0:5b0:6aea:cdb5 with SMTP id 2adb3069b0e04-5b2b7ad323amr500833e87.1.1784900629495;
        Fri, 24 Jul 2026 06:43:49 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9b68fsm1503254e87.24.2026.07.24.06.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:43:48 -0700 (PDT)
Message-ID: <a410f20e-2dbd-4923-8835-f9c5dc595d09@linaro.org>
Date: Fri, 24 Jul 2026 16:43:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/17] media: i2c: os05b10: Add test pattern options
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-8-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-8-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:08, Tarang Raval wrote:
> Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
> and program them via register 0x5080. Drop the fixed 0x5080 setting from
> the common register sequence so the pattern is selected only through the
> control.
> 
> Removing the default write of 0x04 to register 0x5080 does not change the
> sensor's default behaviour. The value 0x04 leaves the test pattern enable
> bit (bit 7) cleared, so the sensor remains in normal streaming mode. It
> only programs the color bar style field, which is ignored unless a test
> pattern is enabled.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
>   1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 61c51844a91e..4e177eacc815 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -102,6 +102,17 @@
>   
>   #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
>   
> +#define OS05B10_REG_PRE_ISP_20_0       CCI_REG8(0x5080)
> +#define OS05B10_DISABLED               0x00
> +#define OS05B10_COLOR_BAR_1            0x80
> +#define OS05B10_COLOR_BAR_2            0x84
> +#define OS05B10_COLOR_BAR_3            0x88
> +#define OS05B10_COLOR_BAR_4            0x8c
> +#define OS05B10_COLOR_SQUARE           0x82
> +#define OS05B10_BW_SQUARE              0x92
> +#define OS05B10_TRANSPARENT_EFFECT     0xa0
> +#define OS05B10_ROLLING_BAR_EFFECT     0xc0

I'd rather split the values into 0x80 "enabled" mask and a specific
mode value, but this is also good as it is.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
