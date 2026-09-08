Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9483223C8AE
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 02:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832910; cv=none; b=DDvbKSNnJYMjw/9r+a4N8hTKeAa0iG5egAb4Ohh+fvcnMq/UCLuyZ9pMZN8Xj2ME4IumMj/nfBjUGTQTMt6zX1FDELUiler52BnmuAuuZYEEaFMq4//QlK+p0ob6Mg0fb/NGr4bQYWbkY5cOgauVBG0hWhHvkXQag5/XGdIKQ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832910; c=relaxed/simple;
	bh=pTwMML0rgJe6+QkcJd/cTu44v9vw01mO7xfgtNsP9Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+eFtt5WgVA9KIVOM4zXzOhlK+T+Y9WUGMqAYdPmvyvSq2gU27VMkSDRx4jRtLD1HDA5JX28rs2iwtSD5yL9iAL9htw1BUQy8ZyX82GYvcSd8suA/I8Rnuj4z6szx5DDH8S+UfQLrCMenZF/QANscd39mZoPJ56inTQL4hM1gHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIYXkrHY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIYXkrHY"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2177626a12.2
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 19:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788832909; x=1789437709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lQtJgjCSof81+IM6z9nQ97DYMO5DHbxfkW0pYQM3/KU=;
        b=gIYXkrHYfiki1Ec4bwm+BRx5k9SwAb19CbkSonXZVGGROl3bhgmB/Tub2PNpJmOVkM
         yfiElqFKbzhLXsQUws5O9NUpelv4HcTd+j0akcHfMpaFRiRc75BgA00ELdOhFNOF7R33
         AGcbkWJInX8lf0juswb+7BP+mqsrpcAXzAht3B+8CiWWMVkNPcQYAEyNjtp0cWdJaqt8
         zX4Ga28kjFL0yLKTSMXId89/TQQGJO9v7PsvhqetZxST0IxzST6QdL8TQZmjUuWfb7u5
         1eockqKkoVu1Kqx6+PR0sv5WJcZ3YP4RpsRwq9/EWL7b/gdLHCocrN26SelGZy8hF0x3
         9oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788832909; x=1789437709;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQtJgjCSof81+IM6z9nQ97DYMO5DHbxfkW0pYQM3/KU=;
        b=LMG5wP5KAi97H2SxT7kacTahYCuRTJV3rUnaPRufGRZUKir2kOhKQUXKYXRd9mwtdy
         UIYwkcD+xPP72JECjRs97fqp8ryY6wIt7rwU0M5PaAzlrwjlHFoRf3+yiLkON6G2QZCQ
         Z1Sd0k/sTyPjkOqZJoa+NPv8txQ4f7GRWyhNBxLTHVRm79nCcpuFvk0N8b7Dh9Aub1En
         fFskfreEIUYSoBMMrqrQ4TKOH9yoFWTGSAJv310tUdw39sL6mk/s22kfy4DgZT9phkLW
         TUnhsYJhQTBW9FztS9LjrTPEW9fmsv2MPuapDm/qASOkZaNEdfA5mNPk838tM+uo+e3m
         oucg==
X-Gm-Message-State: AFuF++kfdiAMQ3q53SIMSSe/1xGDIwZzm6gcHpMJSIX7EO+rnPtX2cqT
	6IbpNc5Z589Od2n91Hazacrb8v5fhpoQS+VEXSvoNGgnIHQKeLN6/SRT
X-Gm-Gg: AYBFou2Cdr1Kpp8P5m5rShFqGCoyGpGXigxsNuSKttx19BRfTjskY64nO824xcrwRas
	o+TLzpeqakqohSvbliVhq/oEz/8dYLFqKbxplhTH8dTaM10T6OL+L9C+ZYx3wXpynmw8518gUP2
	+G9IROtVEV+aTaS9XrntQ8GZqjbw/RAYSLv/gSM9RYr+AEl6PiUTg8vqWWPPDZ7rAheZrTEZgf4
	AOITagAIhQYXqJMChdap+Ryp4WwJ1qdu+lUVMxt+7SCS6E5um0SjiU7se9Wqr15RtmX+lN6uIaj
	yfbNMEedzDob+cCBo4XNueIRqBef3kcOZ70ZSNokICnaSH7zf85FNT5r6xbO9Pna3wIgh6dzhhm
	lXk2rF+Gy53q9hhOm0/4QaGN/io7GeaarXrcvku9lU8JMSSBnSWWyjavQRn1u4yt/J3E0O4gkhW
	fwZ3yjbKgVh3GUjJYbVBY4mh0RTsFH9bXnPRkhFQwIEO+0t/rAshasjGACefzLGpLsHEIxYwzaN
	yDfH7+xsfoTE7uEYQ==
X-Received: by 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr42617218a91.2.1788832908836;
        Mon, 07 Sep 2026 19:01:48 -0700 (PDT)
Received: from [192.168.1.13] ([106.37.146.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db2d91341dsm36247545ad.39.2026.09.07.19.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 19:01:48 -0700 (PDT)
Message-ID: <7611bbd8-6241-46cb-b0bc-a4257277d98a@gmail.com>
Date: Tue, 8 Sep 2026 10:01:44 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov5645: Fix CSI-2 CRC errors on RK3576 after
 init sequence
To: hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
 mehdi.djait@linux.intel.com, u.kleine-koenig@baylibre.com,
 laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
 p.zabel@pengutronix.de, ezequiel@vanguardiasur.com.ar,
 mchehab+samsung@kernel.org, festevam@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Humble ping ...

Add linux-stable in Cc list


thanks

xiaolei

在 2026/8/26 16:54, Xiaolei Wang 写道:
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
> this change, the SYSTEM_CTRL0_STOP (0x42) write in s_power() was replaced
> with usleep_range(500, 1000), leaving the sensor in wake state (0x3008 =
> 0x02) from init through to s_stream. Reverting this commit resolves the
> CRC errors, confirming it as the triggering change.
>
> Restore the power-down state after init by appending { 0x3008, 0x42 } to
> the end of ov5645_global_init_setting[]. This powers down the sensor core
> after MIPI configuration is complete, while keeping the MIPI PHY active in
> LP-11. The sensor is then woken up only at s_stream time.
>
> This preserves all LP-11 compliance improvements from
> commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") while
> eliminating the CRC errors on RK3576.
>
> Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
> Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
> ---
>   drivers/media/i2c/ov5645.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index c772ef6e51d2..be85e0155b81 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -351,7 +351,8 @@ static const struct reg_value ov5645_global_init_setting[] = {
>   	{ 0x3008, 0x02 },
>   	{ OV5645_IO_MIPI_CTRL00, 0x40 },
>   	{ OV5645_MIPI_CTRL00, 0x24 },
> -	{ OV5645_PAD_OUTPUT00, 0x70 }
> +	{ OV5645_PAD_OUTPUT00, 0x70 },
> +	{ 0x3008, 0x42 }
>   };
>   
>   static const struct reg_value ov5645_setting_sxga[] = {
