Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82C530F92E
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 03:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924285; cv=none; b=W/jexLdLF6xT4k8XxtvUMRYCDS98BU0SxonEoFyhxZoS7MFe10k7qqpbxAWbbpB/bUZypv1Zzzkme2zAD/GPCGL7SmMent5rh39ehtkRJP3kP/Q2/TSVfO6HrozOQC9LZkKaSVRz9jplXD0mwqMjjvfaxEtSUjXXxbbXXO4mrkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924285; c=relaxed/simple;
	bh=/jP3mHTH5BIVwVyKeHMr2s4OFPUoIcbazsD9x8qX6ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/eNfUPsT3bW6wK3Knz3qvQUgNP2cWoCicreEobMeCcsgJO1PHxYQaMaGm4xMunAcI4T1c6XT3y+Nrf7utDPsFp4m6MYxg7Cj8Gxn/i/l/RvXgMVdWSw2yJyZsMofN56tOu/AVm1Q7MxLX8KHY04UeUfv/8YUWnwIyTB74TWrIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1fRsTCN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1fRsTCN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d9004f39d3so64517155ad.2
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 20:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788924283; x=1789529083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5HwPXfl1lDwU7i8igvyJ9trv0hFhIKTFZrrxIBiG1ac=;
        b=q1fRsTCNp9NvGjuroeOSlz4SzD/8/1GrSNF/bvkGJhh3lN0WRSiLtO+68EZuOOJcWG
         Tntc45o+q26CApiA1aGjDwsQgV3HG1qZDV9GXgummBd3MIxf4YtF451mZX4q1HWF6bS2
         MXzrQkl0KZwiBwNpMRlaWL0QCk4UwRU10TwLTxFf3pwNfwN4LuX5S5BxrZcVZVRs5ojT
         s8zP5OXNdyO3+G3GPqNgTKyGdbzZUNSgQWrsRSh842n5dVLM7s+QzJK6VLAYbxDwq8a2
         fmXRLudjyHC4dZBUPFiZ+UnaFMAEUXbsi/mtdKArCEMTuMuSxKLvO8mqoG8D3MBdSvPY
         FwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788924283; x=1789529083;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HwPXfl1lDwU7i8igvyJ9trv0hFhIKTFZrrxIBiG1ac=;
        b=qRnY7eORNTu0/lVFiMKmmatX8oenERwyWrJ4Tduh/Y0+HOx5Y7M3+p0h60fW1TR6rK
         yoFJEqtBTp5RhoLJAGqsDwNShH+yjUeKgMLJCa8VxZE6kFpYm4kodfbEPZXlQ7MnGn6T
         Zbi9SznDsXhgA/e+35K04KOCqhFm8IdtHHVDcOXLq/lMfLQUIKdOnMO3aEykQs/vn6iK
         hK40mnuRhWHmA4nvHRB/qyWy1mk9FagFC2J9aF+nF4fAuFe8yk2bmTI8lRVodOl8odoN
         wiKqvmHC6PSqR9ic+N0VAFMwbOfKtazCLubt+YrGekVJxCrSyTWN9SYrEyWJD4uxzfJ4
         fP7g==
X-Forwarded-Encrypted: i=1; AKwUvBzTHseWRLPHMVVpWqe/5FCaOkyJHGFJZ0qq4FBbj1CNR11yWAtjwln8LO8e9dKU4bmvJsHQPpAcIBbl9A==@vger.kernel.org
X-Gm-Message-State: AFuF++l8gFRaqsA1CtY8lrCRaKReVwxHxb7IezEcTFDaAJRbr2Hbs1nU
	IM6inkV5qYfDHavJ66Cqc3YBblPPncjSBqK1UBmvUXu1Kxad5oU5OByK
X-Gm-Gg: AYBFou3vVbWRNor8fYEN/9zSSGZosDvSe2Op9SJqmApAX8qmKckhqTByYpTQEYIO4Vh
	NzXhH59h5lxEQnsFfDV+nri6x3ykWc3FlCk+OVxuXJqCM1cuf/cGmmY3upcJv4rqvcO3ddlfXLA
	rl8EFcwo06nqeMnMBfLuSF3dDC7mxtsdpbnfe1HJMg5QIolMylOEw0BVXXbyR6IEJEPuw5lScFU
	VZGwK2TwYwxIucazVYhOzYzTv9lO8UFQQse+Vb/xpoS210L2H3eyKBDhqpQw4kljr79sngTBo3R
	rCHG5kLWTSh2KhGqwPJBMfc3yjcWNG5EywqVeXTB70ibrwW7MnvfaXA9Q6tqf9YsPygvS3+n+HG
	rkKpNH3cVD8Kfd67XO4vevM+dvGpTAJ0fW65X+9tNhKexafxIJKZuWJZyYFgFBcNc4fDORzteYl
	z3TRYjNgsNpxW1udgGFauME3wqwsWHwuDztiGd1DVuQ6D3fu+Cj1/ByJreCoZScGqX/PzbuzCYq
	StmjdKdTRQVVToBjshVPNTrdZH7
X-Received: by 2002:a17:903:910:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2db5c0b1641mr207897155ad.17.1788924282897;
        Tue, 08 Sep 2026 20:24:42 -0700 (PDT)
Received: from [192.168.1.13] ([106.37.146.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db25ea9bdfsm54747985ad.75.2026.09.08.20.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 20:24:42 -0700 (PDT)
Message-ID: <c43c24ca-7add-4197-811c-19b42aff7a95@gmail.com>
Date: Wed, 9 Sep 2026 11:24:37 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov5645: Fix CSI-2 CRC errors on RK3576 after
 init sequence
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: hverkuil+cisco@kernel.org, mehdi.djait@linux.intel.com,
 u.kleine-koenig@baylibre.com, jacopo@jmondi.org, p.zabel@pengutronix.de,
 ezequiel@vanguardiasur.com.ar, mchehab+samsung@kernel.org,
 festevam@gmail.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
 <ap_gCH1AnciFIEoa@kekkonen.localdomain>
 <20260908103600.GF1672293@killaraus.ideasonboard.com>
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20260908103600.GF1672293@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

Thank you so much for your review.

在 2026/9/8 18:36, Laurent Pinchart 写道:
> On Tue, Sep 08, 2026 at 01:14:32PM +0300, Sakari Ailus wrote:
>> On Wed, Aug 26, 2026 at 08:54:32AM +0000, Xiaolei Wang wrote:
>>> On the RK3576 platform, after ov5645_global_init_setting completes and
>>> before stream on, the CSI host reports a high rate of CRC errors:
>>>
>>>    MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)
>>>
>>> These errors occur exclusively in the window between init completion and
>>> stream on. Once preview starts and the sensor outputs valid HS data, no
>>> further CRC errors are observed.
>>>
>>> Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
>>> the power sequence to properly enter LP-11 during power-up. As part of
>>> this change, the SYSTEM_CTRL0_STOP (0x42) write in s_power() was replaced
>>> with usleep_range(500, 1000), leaving the sensor in wake state (0x3008 =
>>> 0x02) from init through to s_stream. Reverting this commit resolves the
>>> CRC errors, confirming it as the triggering change.
>>>
>>> Restore the power-down state after init by appending { 0x3008, 0x42 } to
>>> the end of ov5645_global_init_setting[]. This powers down the sensor core
>>> after MIPI configuration is complete, while keeping the MIPI PHY active in
>>> LP-11. The sensor is then woken up only at s_stream time.
>>>
>>> This preserves all LP-11 compliance improvements from
>>> commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") while
>>> eliminating the CRC errors on RK3576.
>>>
>>> Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
>>> Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
>>> ---
>>>   drivers/media/i2c/ov5645.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
>>> index c772ef6e51d2..be85e0155b81 100644
>>> --- a/drivers/media/i2c/ov5645.c
>>> +++ b/drivers/media/i2c/ov5645.c
>>> @@ -351,7 +351,8 @@ static const struct reg_value ov5645_global_init_setting[] = {
>>>   	{ 0x3008, 0x02 },
>>>   	{ OV5645_IO_MIPI_CTRL00, 0x40 },
>>>   	{ OV5645_MIPI_CTRL00, 0x24 },
>>> -	{ OV5645_PAD_OUTPUT00, 0x70 }
>>> +	{ OV5645_PAD_OUTPUT00, 0x70 },
>>> +	{ 0x3008, 0x42 }
> While at it, please use the register macro.
Will do in v2.
>
>> Is the earlier write of 0x3008 still appropriate?
> There are four earlier writes of register 0x3008. The whole
> initialization sequence likely needs a cleanup.

The ov5645_global_init_setting register may come directly from

the manufacturer.

  I gave this a try. Three of the four writes can simply be dropped,

   leaving only the { 0x3008, 0x42 } near the beginning of the table:

         { 0x5a24, 0x00 },
   -     { 0x3008, 0x02 },
         { 0x3503, 0x00 },
         ...
         { 0x0601, 0x02 },
   -     { 0x3008, 0x42 },
   -     { 0x3008, 0x02 },
         { OV5645_IO_MIPI_CTRL00, 0x40 },

I tested this change on the Rockchip 3576 and IMX8MP platforms and found 
no problems.


>   It's not clear why
> software suspend needs to be disabled briefly during initialization.

Yes, I noticed that the driver was configured with software suspend upon

power-up at the initial commit.

thanks

xiaolei

>
>>>   };
>>>   
>>>   static const struct reg_value ov5645_setting_sxga[] = {
