Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498734A4407
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859297; cv=none; b=OfPF/7VROEgseTEy1k2uDJ229as6TBmxsd+Dy96eXFYsJ7ZjvsMPqtDB1yvo+5Nit00KlxX0BooAspAS74GFXDHRdBBMQuvy2J1Nj8nEo0GVJOL97laXfWOJMoVETVN5Sv1CAiKte27nGN34nXimiRZdEW17FjiOCdMMiNiAcxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859297; c=relaxed/simple;
	bh=xWrOOxVsxRN3LXDfi0keZT2OgReFcmiltrMhNLeizkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lylvdJkPTixekL6vWZ9ZQLho4eWNH94fV1JocY3RR/qzqbjt2mnOjGxPF2lnwkb/+UJoYXpzpTXvC1xA0Fu2ZpLLDLSqRT9dZzRh+Vo4+Q3PAWnGUiE/QD6lBRGNk1+Hdnvo6QJecdnFuXI52YQV8E3tQus0kJgR9XgqzXEied8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4Ubfyga; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4Ubfyga"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c28eef361f0so314342666b.2
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788859294; x=1789464094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYr9afLBfDRHtvCbBMbwszzMr+ByUO2IiAiD43JF+WI=;
        b=P4UbfygaZnDE8QULn5D3dOsXxZvwHs8ygU38XHpkL4C4iIwc1gVQkjwP+J/ibZL5ps
         Ypac9tSbdjPuAZu36uddG6JrBhPGI6Te11m+w1sqKylsViiKvCJOxj1/mM1Ar/fIyIuy
         h0aEqYkjFoCm+1OevL1ePcxcVOkiIixYr8z3zcM4Tfpi9wDz2TlZWHVsu4zEZOFgAAkz
         JY23UZ6M4da+rb+5mzdeX31YGXExybATN1cVOn0Q9ZYKwbUDczFoEzlfFHLBcP529otD
         wwnnVBIGoZ/J8sSxg8teKwq9igjLTflediwHfOUeUObQT/FS/nsT4qJtF32rpEypB229
         2d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859294; x=1789464094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYr9afLBfDRHtvCbBMbwszzMr+ByUO2IiAiD43JF+WI=;
        b=TLqrzj7gKQPXhNFt5Cyxcacg9tUQIiaFP1ffoorm0jXG09tpIyLJasExoqO5gavsqt
         ByOYbsLXmY/jIWlj9Xe6bboc0AjtWWL7DbRCHCeIPaxJHGdAi6Gf9sNMsT9YGWpv2n3E
         64YlUvwbuW7TG+hobx0NOwQ1tFOMZ/Nfvqp7P+3VLjd8P1N7hr12uQiyVdquY0znXYxT
         1ll4cunyq5BMQ9FFQ000RM+kcKCRzEcsRTn7GTMjgREi+S2H3Zx/FWClcBPbqXs5Tkts
         RVZ5h6rwkOHYLaf7qS4czZAEg33s53fGgb183PwaNNJ7GzNopAMOpJ5ChPg4YKPkB5Gw
         5CBw==
X-Forwarded-Encrypted: i=1; AKwUvBxqAqdPgoKUasMEqkd7e2gteacQDWhidmRnsWCQVYays2lNc50MuNGvT0FbXHz0sNmkLBCVo1lGu7nSEw==@vger.kernel.org
X-Gm-Message-State: AFuF++mUC9ioahpBEG0WgclbH2D7HEzZsa3IZ/EuIHfgosQi2FYaiDbT
	6UvWmR5ElATzfSKgWkKrdVcDQg+StHf80ODhb50MlPtd3X9zjG+Pct+lgSANRqqeF8Y=
X-Gm-Gg: AYBFou2O4ieDvV1P7X9nI7qsWVTinzFyEEX5SB0+WcvHoJ07p1iWsMacr/RXyoTAH4C
	9fJi1k0M/IY7dG6ru0O0I9DnQfYdUujFr3YDXP+arFOr17lGnjvA/gRj69Xt/lEVCFbYw63UxEu
	Lu7XkrbuYbhGOU9a2QfS0DcDS5ESq5I+O34phdZsILh/y6D1cv9p0nA2XhlISj7EpLuBcYN/JDM
	IVGLubXnVcsAVeFo8Ln1yu9cYJSKhTXiZigQ7KZZukK/iWkBKh4IYMBvB/yLEcS3W9taapoxZjy
	EkHn0fR5JDHUB+CojyLjNBd9HTSZmXBcyHivFuHQv8fiqIDW+2Sy7TjvgWi19UeETbfBfvkAnX/
	LESNoOOfdNaSrcomPp7TtOhX/yp9CUl82nXoeTth4/0zVHpKFQklCeVroW7NG1c+llQctpM5Mog
	dvuiOFIBf2CX67vZ1VR+BCJp9W+141G/Jc+578VXtg7fCb1pMf9exYTkKzvUNsghiIAQz/WBEP
X-Received: by 2002:a17:907:d0c:b0:c26:1691:b36e with SMTP id a640c23a62f3a-c261691b966mr907855166b.39.1788859294292;
        Tue, 08 Sep 2026 02:21:34 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.78.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5375d9sm577411766b.30.2026.09.08.02.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:21:33 -0700 (PDT)
Message-ID: <5d00f6f9-43ce-434c-9036-aacd4724e65c@linaro.org>
Date: Tue, 8 Sep 2026 10:21:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: ov02c10: Accept a 26 MHz external clock
To: Felipe Calliari <calliarifelipe@gmail.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <VOpCLJBQy3XN6uCqoTmAGSKx_vojTrQAmOODetFqbzl990ejy1WA1gHcca4T8beBdtKK-BcDC3-YupQEpxZvTw==@protonmail.internalid>
 <20260905030732.39196-3-calliarifelipe@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260905030732.39196-3-calliarifelipe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2026 04:07, Felipe Calliari wrote:
> Several Meteor Lake / Lunar Lake designs (e.g. the Samsung Galaxy Book3/4
> series) wire the OV02C10 to a 26 MHz external clock instead of the
> 19.2 MHz assumed so far. The IPU6 ipu-bridge forwards the rate from the
> ACPI SSDB verbatim as the "clock-frequency" property, so probe() just
> rejects it today:
> 
>    ov02c10 i2c-OVTI02C1:00: external clock 26000000 is not supported
> 
> Rename OV02C10_MCLK to OV02C10_MCLK_19_2MHZ, add OV02C10_MCLK_26MHZ and
> accept both.
> 
> The PLL register tables are the 19.2 MHz ones; OmniVision's 26 MHz PLL
> programming is not publicly available. With a 26 MHz input the same
> dividers make every internal clock, and therefore the MIPI link, run
> 26/19.2 = 1.3542x faster: a ~541.7 MHz link and ~40 fps instead of the
> nominal 400 MHz / 30 fps. Rather than leave link-frequency and
> pixel-rate describing the 19.2 MHz case, add a second
> V4L2_CID_LINK_FREQ menu entry (400 MHz * 26 / 19.2) and select it when
> the external clock is 26 MHz. pixel-rate is derived from the link
> frequency and scales with it, so the frame rate and exposure times
> reported to userspace match the hardware, and the IPU6 CSI-2 receiver
> programs its D-PHY high-speed frequency range and bandwidth budget for
> the rate the sensor actually transmits.
> 
> The ipu-bridge fwnode only lists the nominal 400 MHz link frequency
> (keyed by ACPI HID, not by clock rate), so v4l2_link_freq_to_bitmap()
> still matches on the 400 MHz entry and the 541.7 MHz index is selected
> explicitly for the 26 MHz case.
> 
> On a Meteor Lake test machine a single CSI-2 "frame sync error" may
> still be logged by the IPU6 receiver at stream start, after which
> capture runs cleanly; this looks like a sensor PLL settling transient
> and is not addressed here.
> 
> While touching the clock check, terminate its error string with a
> newline.
> 
> Signed-off-by: Felipe Calliari<calliarifelipe@gmail.com>
I don't see how this gets handled with Intel's downstream work

https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c

So perhaps it just isn't handled. Seems a bit odd that several ODMs 
would use the 26MHz clock but there is no update to the ipu sensors 
drivers to match.

Absent the real init sequences for a 26 MHz xvclk, this solution is 
better than nothing.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
