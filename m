Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62220376475
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094033; cv=none; b=WyhvDL4peZXDPNdI9uHBKvY/1tbwKZTRMbiItH7OPRK4cZEoQghMdfH5Yc11YVJoDZQIMyqGDqKQuD78SseJh6rqhGkuWWmx0hkeCCARQGAQcyu5paDE8YtjTP6pliBx6fBnBK/ZR6W/49DgX0TeYjPtZmXS2Jv7XZZq9RjKibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094033; c=relaxed/simple;
	bh=r01UNiJ5t+QQ9v0MNroLwd2ymcO66a+NVdwEtdbq5hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOiCbF4c/JGMZ6u5wOt5MdRbIL4OxCUaKkbvUAYE4ccbmYmEy4Hg56Mqn7CxoFUDH6hGGcX7i7NfLsd3zxp/QYFL3cc6nyieDrbjZ3I53ViT/ykkuNhZeTvG0QzDVtMgRK7/jSB2PDcWGacTgvyDASMQKmk0nf5y9bKoLEUfvho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZ63UmkR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZ63UmkR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso75178315e9.2
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 15:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780094031; x=1780698831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ymjm8eNHpxcDzNBbywPMho5NaL6tCXYzCbWJlV5z4Gg=;
        b=oZ63UmkRRUV1DNuCUs5V/nJ3clNAs88gUrGkZV5uFnOFtZCpuY6tLSyUKOQahvgotn
         Z0iqxMkjoL0J/51E/QzYH8lTyhB4QmwP2rJeGee7xlM3eUroWS/wtkUzniohlSxLNX/H
         I2Hf1dpAY7VAb9NghulNZvls2P/ZPBb4BvbnsYQcCIqMeQdpRzE4sGIPXHiJCIkcQotB
         Ulu2uck9kpr/MJ5LjkfzKgEDbkpRIGVk7CKPyRHplUyVC7kjlFOO87Ww+bdqXTiajlvJ
         rSjtWFbIIoM4uTtBlBcrJUEbF5845ODVFHakAak/2pn8TLZRLfYXeQ4XSWNncvpH/K7t
         +jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780094031; x=1780698831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ymjm8eNHpxcDzNBbywPMho5NaL6tCXYzCbWJlV5z4Gg=;
        b=cDcj4lET4r3YtjmIvu7P4H0SBHZF8mWyvsI+1Ket/xe+CRFqSLgRUXBTwnU/SO3NI/
         wI2kJNkMlKH1Ivz1GPGxp00wjg313RFtv35+4mP9uhAR/B9AF4Kz2hHbPrDc4ziXN1aO
         3nCwyQzcUnOt6T7Rwui6Fb2yKAggCxJzo5YNRyEG3tJ5omjqCLFqYG4+q+lrxXX/+9kH
         Cx4jVQ1GdXqiC5Yq9TlV+Hd5VUnq0WKdi3kWckugnFykdVrX/DusULh0hTxKmgsapAVx
         b547TP0EpR8jFuLozAlDF/azVQoWtB8LMJU/pG/HymYpBXgJa89C6g6q1ifkx2JGiZzY
         fhWg==
X-Gm-Message-State: AOJu0YxA3+7DhmN53lidyKd1FGNDOUpjpR4sAoi8mtiemPrjJMveuQfT
	ZiI+TuutB3+wy5Hx7UBaYOviMl2g2V49jHFuuQeFN41KnSL/8LGnVCPIHmvJTw6bKoI=
X-Gm-Gg: Acq92OHH6IDMvFb68L4Y32j+JFdtlFj2EEdO+RWTE5W7dhHx9l9r2WqigTgDvoCSEF9
	wXUNcFlMHP+Q8qj47rYtugvCNmHzzUSVa5W48M/BOtQiYXyl9W38S8lBkudD9N45mt2StlIf88U
	wA71gcfu90YfKLiLe3esGrb1cm750WELQWhfUMwKNEWEEkyedMiVxHOwhel/RrWQAqy/dj87YOU
	XK0y5QkPUdh4FVEPlthLUzxUQ/VVflVMoU4GDHf8BaNZL8IR7Q+Lq8KMcSgMgD2oh44G/VTCnNB
	a5W5qtVNzvVux6nyYeV/JKzw+E4Pam0/WWSSHaknWDCjRDpLuWDDndO2HLFUUQdODP8MLdyAf+I
	/Akcn1DOuI6MwvxiPoFO4W+rmzPcNPZi9NeCVtl1UscDoBHMqON7m/OxZDZL5CRcA9gHnkK/khI
	QFEk6Yn2BqGPmYnq0rbxYum6npxozFzZSVUdU=
X-Received: by 2002:a05:600c:8508:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-490a2915bc8mr25060585e9.10.1780094030708;
        Fri, 29 May 2026 15:33:50 -0700 (PDT)
Received: from [192.168.17.180] ([89.205.36.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c09ab75sm22726955e9.6.2026.05.29.15.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 15:33:50 -0700 (PDT)
Message-ID: <9727b97f-7838-4d5f-bd8a-e26dabf1d38f@gmail.com>
Date: Sat, 30 May 2026 00:33:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522031121.11968-1-hpa@redhat.com>
 <20260522031121.11968-2-hpa@redhat.com>
Content-Language: en-US
From: Damjan Georgievski <gdamjan@gmail.com>
In-Reply-To: <20260522031121.11968-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 05:11, Kate Hsuan wrote:
> The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
> was displayed upside-down. Add the DMI information of Lenovo X9 to
> resolve the issue.
>
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>   drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 32cc95a766b7..1c3364451fa3 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -118,6 +118,20 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
>   		},
>   		.driver_data = "OVTI02C1",
>   	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-14"),

Isn't this going to be an issue in the future if/when a "Gen 2" appears?

Just extrapolation from my older laptop, it shows "ThinkPad X1 Carbon 
5th" for "/sys/class/dmi/id/product_version"

> +		},
> +		.driver_data = "SONY471A",
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-15"),
> +		},
> +		.driver_data = "SONY471A",
> +	},
>   	{} /* Terminating entry */
>   };
>   
