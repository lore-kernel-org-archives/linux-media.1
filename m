Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3754A3D45DE
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449680; cv=none; b=JCjYhCRiM6d98VVwmdt6eohl791Sj+hd03hKV/WpRqkeLioNhVwC4tRlhVLJHfIeickfAcO2lwLQMkAV59oMF0tF6aiV+pUzQyicv74dTFj3xI7+GGLkBBYmCibC+pb5Qw9AMEKO+OsXPYFfbyXGqbYbZd1CCTQDE9zG/h8lNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449680; c=relaxed/simple;
	bh=LpvjJEWQ6iSxNdRR/eJIpTESV9K0suz8v13bB2/k0YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKsWNDXOv6mShXK8JdPkzGTgKXmgKA/nL+VtmliBbKEOWCe4QqYRhkhXjYGWUfI1QA4i0sA67lYZ1DbiwEiesRWZApO3O9qfVfsFLozO+CFUAdAeDsVxqpt2j/pFtyG4OgsZtpwg7GyFilKoCK9QFxOw1vcLwWFo9ceK8aGjemA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhEM4lhI; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhEM4lhI"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a02551822eso419787a91.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449678; x=1792054478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1CLI891HA9GloyCGaHpQr3cg+u13igfS3Jo5XNHR5c=;
        b=YhEM4lhI+nzhPLDj6t0kqHa1UfGxB43RuSGI4XHYTPgUhZ3mAUer1zUH+zcSbwPeyN
         PTpo6N5JtP7PLwm8cFUim3idKULEcLLaxmACJvIDDd+AYOJfBJeZHomQjmM3EaP9p332
         jAO0vXH091YADqcsLVU254Gj2w26GwRBMbYA4LB9SkQLDz0zceP2P94MeWBKYqKFuTtS
         Krp1e477zatmY0soY1lhEvPv5E+2bJ2+XNVSal/cHiBsxyocAq4rYKOR9NO63fWZivVA
         Cn+7JA+c4D4VSLZvnt2AB6wCUDXMGt703HwlHbEC7+2CT1NxqXX5ANPMHj/RkCkI0VMw
         kqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449678; x=1792054478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1CLI891HA9GloyCGaHpQr3cg+u13igfS3Jo5XNHR5c=;
        b=ZX/FIc/FcU7pT5L741ahvIYpNYuhegzXAOpSZzeLGN/nxwkdBW1YaWydXqqrSKwaIJ
         6Zk3O6o+PNWTM3f5Lc85j2hUbLTc6XA4CzFNvhTz9pjmu6DoEZ9M/YuVzx7u5f1JlShb
         h1kHuAiyw7X1pIN6+KakGI1j8rE0JPTF1YWI1wKpqKogHxfil1yVedWZo69pxrCY7dHR
         2vThu3u5TobmFz8JJy0398vQOB6uum81TsqOBgcdg3mjbOp80ezYO1cY92JRq/usQ38F
         E0zxfHvBVWDbTw1uDCjVCDi/OekYrJLtinxvY8F+Kwdypnfo0fRst93soUDuHtWIK+zq
         pELg==
X-Gm-Message-State: AFq9FYKR9AJmF5Z3tPvLjO88Bjnnrkq2i/BYsTsx2zCNgjpyFLC9JDCm
	sROKkT+KsLbAeUHLnzdPOL4b091ab8+1sQFF5g+OVUIqXRKhEdPOuuCpL+c8Ig==
X-Gm-Gg: AYBFou3zoLYPWOEvM+1gF+IxgvCOPUuAr9KV2u7/n/uu1pAlnm8XZxJCKhulvQqcui+
	4hVFN7bf6Xdo6fNdDntxcgrQcw6S5VWBunsS/7FKRKDXF7A07z6+NoYA5mryCvwcBAz2hnLDj/9
	zND+1I/Ng5PLv9OTxW1FFn+ihwno0Ieubhdh0hRJIFbiOg9LcbaM3IoPnKycyUCK4XP9vm2A3Te
	yn2sNRwQKfeK6n2rULImx9z3LR20ZCCi4d8eCUS1Q5vLeGKcEwAAw9FfEziI1jyeiq1WSkxFa9f
	8shBDpA2AZXuEbRCnhWuvN8nNQ1WNhajtpcSB97UHMFURxekjOJJ3lSLjOPB24uBd4AXhnvrPbw
	j5qyoM/rE0QTFFXJBA9WPSDWui7E3sSINFySG3Bcj2AqKmIckhmEHZjvqJnxsDIIL8hYjiQaRLW
	DScOR5KKBojNJDikEiIYq166UZZ3ttjfVq4Hu08XTgbjfyz8IU/kaE3i7zrlWznrEk6YaYwm0w2
	FfwAmCNB9i39o9GvKlEo8XroD8WMh7K8/Cx1Gq2qnPnGtrhVrQmzUwZFsf1sMxb11Xa7js=
X-Received: by 2002:a17:90b:4a43:b0:3a4:93c3:9365 with SMTP id 98e67ed59e1d1-3aaed95f778mr1027685a91.34.1791449678421;
        Thu, 08 Oct 2026 01:54:38 -0700 (PDT)
Received: from ?IPV6:2409:8a00:8523:230:32c5:99ff:fed3:40a2? ([2409:8a00:8523:230:32c5:99ff:fed3:40a2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1d10867sm3756075a91.13.2026.10.08.01.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:54:37 -0700 (PDT)
Message-ID: <c90bc935-5e78-41a3-a05b-cedb1331b84c@gmail.com>
Date: Thu, 8 Oct 2026 16:54:32 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: ov5645: Keep the sensor in software
 power-down during init
To: hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
 mehdi.djait@linux.intel.com, u.kleine-koenig@baylibre.com,
 laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
 p.zabel@pengutronix.de, ezequiel@vanguardiasur.com.ar,
 mchehab+samsung@kernel.org, festevam@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20260914024240.152741-1-xiaoleiwangxiaolei@gmail.com>
Content-Language: en-US
From: xiaolei <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20260914024240.152741-1-xiaoleiwangxiaolei@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Humble ping...

thanks

xiaolei

On 9/14/26 10:42, Xiaolei Wang wrote:
> On the RK3576 platform, after ov5645_global_init_setting completes and
> before stream on, the CSI host reports a high rate of CRC errors:
>
>    MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)
>
> These errors occur exclusively in the window between init completion and
> stream on. Once preview starts and the sensor outputs valid HS data, no
> further CRC errors are observed.
>
> Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
> the power sequence to properly enter LP-11 during power-up. As part of
> this change, the SYSTEM_CTRL0_STOP (0x42) write on the power-up path was
> replaced with usleep_range(500, 1000). Since ov5645_global_init_setting[]
> ends with SYSTEM_CTRL0_START (0x02), the sensor core is left awake from
> the end of initialisation all the way to stream on, driving the data
> lanes while the host is not expecting any traffic. Reverting the commit
> resolves the CRC errors, confirming it as the triggering change.
>
> ov5645_global_init_setting[] writes SYSTEM_CTRL0 four times: STOP at the
> very beginning, then START, STOP and START again near the end. Register
> writes are accepted over I2C while the sensor is in software power-down,
> so there is no reason to leave it briefly, and the three trailing writes
> serve no purpose. Drop them and keep the sensor in software power-down
> for the whole initialisation sequence. It is woken up only by
> ov5645_enable_streams(), once the host is ready to receive data.
>
> This preserves the LP-11 compliance improvements from commit
> 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence"), as the MIPI PHY
> stays powered and parked in LP-11, while eliminating the CRC errors on
> RK3576.
>
> While at it, use the register macros for the remaining SYSTEM_CTRL0
> write.
>
> Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
> Cc: stable@kernel.org
> Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
> ---
>
> Changes in v2:
>    - Instead of appending another SYSTEM_CTRL0_STOP write, remove the three
>      redundant SYSTEM_CTRL0 writes at the end of the init sequence, so the
>      sensor simply stays in software power-down from the initial STOP until
>      stream on
>    - Use OV5645_SYSTEM_CTRL0 / OV5645_SYSTEM_CTRL0_STOP instead of raw
>      values for the remaining write
>
> Link to v1: https://patchwork.linuxtv.org/project/linux-media/patch/20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com/
>
>   drivers/media/i2c/ov5645.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index c772ef6e51d2..2985966ab09f 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -115,7 +115,7 @@ static inline struct ov5645 *to_ov5645(struct v4l2_subdev *sd)
>   
>   static const struct reg_value ov5645_global_init_setting[] = {
>   	{ 0x3103, 0x11 },
> -	{ 0x3008, 0x42 },
> +	{ OV5645_SYSTEM_CTRL0, OV5645_SYSTEM_CTRL0_STOP },
>   	{ 0x3103, 0x03 },
>   	{ 0x3503, 0x07 },
>   	{ 0x3002, 0x1c },
> @@ -198,7 +198,6 @@ static const struct reg_value ov5645_global_init_setting[] = {
>   	{ 0x5a00, 0x08 },
>   	{ 0x5a21, 0x00 },
>   	{ 0x5a24, 0x00 },
> -	{ 0x3008, 0x02 },
>   	{ 0x3503, 0x00 },
>   	{ 0x5180, 0xff },
>   	{ 0x5181, 0xf2 },
> @@ -347,8 +346,6 @@ static const struct reg_value ov5645_global_init_setting[] = {
>   	{ 0x3a11, 0x60 },
>   	{ 0x3a1f, 0x14 },
>   	{ 0x0601, 0x02 },
> -	{ 0x3008, 0x42 },
> -	{ 0x3008, 0x02 },
>   	{ OV5645_IO_MIPI_CTRL00, 0x40 },
>   	{ OV5645_MIPI_CTRL00, 0x24 },
>   	{ OV5645_PAD_OUTPUT00, 0x70 }
