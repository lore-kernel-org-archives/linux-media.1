Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195402BD587
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 03:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924250; cv=none; b=Fnrj7zBsbbrkPPlbkH1TwdcIfgj2wbRO0RSVwaA/a9rmdAufDXQdMBSKmVBDk69F2N0E4/PEY3oz5A4Y0AicMJ3RT3siFMbYRv9jLOIgZA0Ygvwb5Pa7/PVRL/orvObmsXxHcTGtm0iBPgfYgxD855mmQNzJWy4weSuncpqCyqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924250; c=relaxed/simple;
	bh=ghefzVK9zElCxcqLApLBVE4Y6uMlXOc8juyeNHYwYhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYv8XXB2G0S7qJIZ/As3Qm0Mo3A8fvHUtIfmS/M0CeK8o1cvqVPF6gFpt3TGAYT9q8AHpkwgVQO23nbppMj789247/GbCMf1gTc090BAUecZ0FH7gBsLDKOe1a98V0SIJq4Qxziumh5Gd9schtCNgzzpzQrFFt9orUtQjUVBhLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llNQrKF4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llNQrKF4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso3755537b3a.1
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 20:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788924247; x=1789529047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1FUeGkvQagUdN35q+3jlHISdBp4xaWpmc1Bwfe0TEA=;
        b=llNQrKF4p9NkyYRvX3xdMhKTvvWqU4ldjnkEB05s5ZBvijIt8TXuu1hzfmVgho36jg
         LUMgqKIXBgKav7v84X+8XeLwW1wzmYthnun9RfoSU1QVIcFCanIqbibxwi86SIHKb05V
         FOleQ6YsKte/f0I56XYorBd2puR7Y2HpOeVEBAmb1/y/0kZOOb1vP3vIb/upAa3881YU
         Q+WON2a1ShxzZUQrhOgwIK9QkLht2rgZ8LBWOGVIV5LoXdVooOTg2/bjtdO9Pe9L5j9s
         60dlgOSEEFW4aeRioU7MEuZ113sIPpFDszVThhll8ZkJJgwrY9l/qiFoLo6XVCUCiIc+
         GG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788924247; x=1789529047;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1FUeGkvQagUdN35q+3jlHISdBp4xaWpmc1Bwfe0TEA=;
        b=DFiQTP9yb5x/YCtluQ9Sm1g6ymgKWqb+A6TxnRM5KZQvqhJocUB92LcK6Q9gbP3PES
         4KWuccO2y1+PDYFdmhVTQXdmZjJMqQvuIZu2fnsPpGkJ9/42iwKsF7IW1T89ZR26zTDF
         S72ai2Sm+P/sXTy8mEDqU/cPoMUatXFU1T8BUPWOECxa9gaRPpkC3rxFLJZqyn0UBjz+
         LS/YpwBgl88mwKIrPFJYxGevbqmhC12w8DeKQN/7ckAtMSzq9VzSfr9ldD9qspQe/SYq
         9c960C5swA2ZTNZyGm9joOb2Wp9eSucntOO7J8fyAjzin3HnxdHZIdSMoL7fgERPRWgD
         lz6Q==
X-Forwarded-Encrypted: i=1; AKwUvByZe90f/Y8etIIQGBozIGIIcy2ciNW0me76LMVi2XubaGMdZ5AvPiyt7HtL7tI0EV8Z/ALyvDGNe4NTmA==@vger.kernel.org
X-Gm-Message-State: AFuF++kpMvAJD/J+ckVDtigbSlADaHnK/eKkXKt2ezUtul2oes2RqM6y
	BZIJ0CVO51oIcWwRT0W60Jsr03it10JJSJTXqfp1pEfw5+4vq8E9Cbku
X-Gm-Gg: AYBFou1XGbgDhEJZZ1XarnI19ePXj8VC2tO88D5p1MDSWZO0nkw9QT1Rsi+DM9079Pu
	dH2d+KTwHq0Q0B++D3yUlpyCYTDDW7/9rxjDr2UtYHKUgjJ9BzWlAc6xLqTy1BfJ6kNDkWCAd8V
	A5OcBn923yJ5Js96FINy6gGFKyLhtDmw7MP/OHWBDvMzS6El+vtM7CwveOLQg9aQLdyqJh7KLdd
	ddyj/UKgnmRTbqC9s2o7z3TJ/3dRQalZcMaxG2di3Eo1fBY3TVCVpFgsAs7gAdHbd3EPMhd+unG
	ESNuIFixzPksvnnp/r61a6Jooa2UuqS9EVSfJhaK3xqURUHFPfCjtpmHDARhJmT853lh3rbfx1+
	9+1Ufku7vHkK//uKIaOMl5K1KdOWgJ61U1vz1Guci05Sah3HPINs8UEOMsEEycZ5P+W5qrp+LRc
	s1GcJar+PP5zrA5ms/qD52v33jFW9v0KFk3rrz3cfHWZC+Dys1p0AI7lDA/1OvFbFvneVojOMlJ
	SHD5/GaBm+9R26lyDj2IgcZbeWu
X-Received: by 2002:a05:6a00:338f:b0:857:4dea:e1dd with SMTP id d2e1a72fcca58-8616987667emr45679188b3a.14.1788924247208;
        Tue, 08 Sep 2026 20:24:07 -0700 (PDT)
Received: from [192.168.1.13] ([106.37.146.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f8bsm6492826b3a.15.2026.09.08.20.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 20:24:06 -0700 (PDT)
Message-ID: <323da6bf-1e7b-476b-8369-a64f1a707778@gmail.com>
Date: Wed, 9 Sep 2026 11:24:02 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov5645: Fix CSI-2 CRC errors on RK3576 after
 init sequence
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: hverkuil+cisco@kernel.org, mehdi.djait@linux.intel.com,
 u.kleine-koenig@baylibre.com, laurent.pinchart@ideasonboard.com,
 jacopo@jmondi.org, p.zabel@pengutronix.de, ezequiel@vanguardiasur.com.ar,
 mchehab+samsung@kernel.org, festevam@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
 <ap_gCH1AnciFIEoa@kekkonen.localdomain>
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <ap_gCH1AnciFIEoa@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thank you so much for your review.

在 2026/9/8 18:14, Sakari Ailus 写道:
> Hi Xiaolei,
>
> On Wed, Aug 26, 2026 at 08:54:32AM +0000, Xiaolei Wang wrote:
>> On the RK3576 platform, after ov5645_global_init_setting completes and
>> before stream on, the CSI host reports a high rate of CRC errors:
>>
>>    MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)
>>
>> These errors occur exclusively in the window between init completion and
>> stream on. Once preview starts and the sensor outputs valid HS data, no
>> further CRC errors are observed.
>>
>> Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
>> the power sequence to properly enter LP-11 during power-up. As part of
>> this change, the SYSTEM_CTRL0_STOP (0x42) write in s_power() was replaced
>> with usleep_range(500, 1000), leaving the sensor in wake state (0x3008 =
>> 0x02) from init through to s_stream. Reverting this commit resolves the
>> CRC errors, confirming it as the triggering change.
>>
>> Restore the power-down state after init by appending { 0x3008, 0x42 } to
>> the end of ov5645_global_init_setting[]. This powers down the sensor core
>> after MIPI configuration is complete, while keeping the MIPI PHY active in
>> LP-11. The sensor is then woken up only at s_stream time.
>>
>> This preserves all LP-11 compliance improvements from
>> commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") while
>> eliminating the CRC errors on RK3576.
>>
>> Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
>> Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
>> ---
>>   drivers/media/i2c/ov5645.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
>> index c772ef6e51d2..be85e0155b81 100644
>> --- a/drivers/media/i2c/ov5645.c
>> +++ b/drivers/media/i2c/ov5645.c
>> @@ -351,7 +351,8 @@ static const struct reg_value ov5645_global_init_setting[] = {
>>   	{ 0x3008, 0x02 },
>>   	{ OV5645_IO_MIPI_CTRL00, 0x40 },
>>   	{ OV5645_MIPI_CTRL00, 0x24 },
>> -	{ OV5645_PAD_OUTPUT00, 0x70 }
>> +	{ OV5645_PAD_OUTPUT00, 0x70 },
>> +	{ 0x3008, 0x42 }
> Is the earlier write of 0x3008 still appropriate?
You're right,  I tested removing the { 0x3008, 0x02 } write
and the MIPI PHY still enters LP-11 correctly without it. The CRC errors
are also gone.

The 0x02 was a leftover introduced by commit 092e8eb90a7d when it moved
the 0x42 stop out of s_power() — the sensor doesn't need to be explicitly

woken in the init table since s_stream handles that later.

thanks

xiaolei

>>   };
>>   
>>   static const struct reg_value ov5645_setting_sxga[] = {
