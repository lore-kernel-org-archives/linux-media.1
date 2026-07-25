Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C303191BB
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784964804; cv=none; b=aH0QmERDvTGfgBY5hhxBFbaPvMHA8sMrNOAy2seYfA0I3tnj21P3w8ZUe+K9mDNA8iiz9mxLMZiF8SruHNLT5679sF2hn2cDm8offbY0xwvm57lJfgdmjWRSANJo0dF3qg2ZVwOWg2TrXRdHMH74qPwoT+PNABaF/L7b1oErAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784964804; c=relaxed/simple;
	bh=5onvvAp7MoblJLzc+xY3buk/lAVGDV8DBXmDBMpc3B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtMVsxdbyLusf53+GzkzTvfCEp5PW/ufzOuM+4VyyJW0vpmP6QlMgHx7yzdz7/ZOSrzlStDQl74uV/td7DHskzF/43NUZ+hR3Oj5fPtu+yFyc5Gyc0bZk06oPBqGojPjVCKBqIygCflW3zi5q9l1gUCZiNNgLjbGF7VhdOWbU18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kD/wnzFn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kD/wnzFn"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39dba1ea83bso342101fa.3
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784964801; x=1785569601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qEd62JOhMvZ8f0nax4W6v2TAohUglkbrBCfbHSXaf3I=;
        b=kD/wnzFniXSvkZPW7WGS1vp/l4Xw0Jp9n5STwV1X6w57jJetr7Yysj7w3EFzsFApw/
         Fd83hfxm07PKtMLNKAZS+Qv+S3ZyYX/ShPpEpAUVBULOGjXVBH624oYEIiRvzZMJHX3Z
         iCxdYymdRGHzvChCgsdT3mbN2RFn8wKbH1hVRx/GI6YAzjwUWndWUJ54seMlCRJVy7W2
         QO9n9TMm+N1LiS+5Ig+dCzgJQMQ24019DGdcYKmxJri/WUGneWEor9c2LGRz0NboeTgZ
         KJloJrcx9D6Oa2SL4sPwes1me616sJypfdNePp4m7qQ0fphZkO96rKBQAfyTV3L0ilkZ
         iO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784964801; x=1785569601;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEd62JOhMvZ8f0nax4W6v2TAohUglkbrBCfbHSXaf3I=;
        b=TUicQ4vTJizF2JdxmEzbbOz9oacsj/G4AqHSubYrs1B/wrDcxkUQvgLnfIlESSAzZd
         tw00cvSp5S3HgTIqphJR4azmW92KfBcfvGHSwcS1kOKM073HTzX/SqgaM4VLYdN6jk3L
         ijBzrm7abaFjTHFQNyWUn4JlTF6uXa9xkFpzMT/QdYDNtZI/EvVKtIXPaExmduVjdldE
         XN/DjsNmNHz5EQWyt/lyQqGcurPsJJmgQ0FRxYZNnjYWP1+c5lPBF71CMvI5CrfML6Nq
         Pr+BfU6WqLBZeppOSIqj8zS0a6UKBFAvgPkzvm8sQHSD/Icz/cqd8JOtd+PQMMDU+wT1
         paeg==
X-Forwarded-Encrypted: i=1; AHgh+RqqgjmeNbUs/b80rdE5CpiBcf8HTLM2x8kr5NfdYDGbPMZqvG/fUOu58t98UGiW9cOTv9RKKiud4N6OSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnSBWSIMs5sWwVc79Y/dX+h8LXOslrlf8DiLH+lXCZSdBGKPWQ
	oC1IbToqlnK8fb85CZgezbub0r+1x4Qo/tmNu63wDV3Bj0xUxQe5rIyBOOs2wtDRIbM=
X-Gm-Gg: AR+sD12Rrfp4Vsg5I5+xVvFkeFgrNVFu9+YlMDycySU7SFiYbSPhPDQMjv3/+f1hqgN
	Js4y+VCwnaIzEgqDFcK3tPS2M3xO1328fePH5TQNNZPLu2O2vXvIBnHBL4hDtXURa0JICGJLkoZ
	JDavwKhexHTAl7YYHahy0yIgzwLV2mjhPyeLKlJCfUTH2hFIERWpK2i/aQDzvnNk59UlXQvPQjY
	DqMttwMPAD1oR2MNUcemUbESty0XVvY1C21DjHf0SaPSoxdBgApfIePBdQxYXSHWBaDUZIuVK0F
	M2rTYX0EHjYvfmHdEtdMbk9KL9Z4Mg5gUV+DEsyoECYQNBqQmcXz4A2t+ol/yaXRQr9GAnwEQxE
	PD2vQlAU+/+PM2LetCEJnIwT2LG0IFiwRBOYbWoFiY271niU7uabFPncD8Sl8hulLymjGifk6iS
	7zyIu7qPmiHn0e3C/Jj0DcV8fau8CjgUo9eZ+m2Jn+9mYiZ5kSkrlXpVi+
X-Received: by 2002:a2e:be8c:0:b0:39c:a24b:f09c with SMTP id 38308e7fff4ca-39f28781e1fmr1650581fa.2.1784964800028;
        Sat, 25 Jul 2026 00:33:20 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f22186b8csm3403201fa.10.2026.07.25.00.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 00:33:19 -0700 (PDT)
Message-ID: <5ff5b423-1957-49d5-a95b-54eae8e66646@linaro.org>
Date: Sat, 25 Jul 2026 10:33:18 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/17] media: i2c: os05b10: Rename vmax variable in
 VBLANK control
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-14-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-14-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:09, Tarang Raval wrote:
> The VBLANK control programs the sensor VTS register. Rename the local
> variable from vmax to vts to match the register meaning and improve
> readability.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 82a96081fe21..876186b22f5f 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -750,7 +750,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>   	const struct os05b10_mode *mode;
>   	struct v4l2_mbus_framefmt *fmt;
>   	unsigned int num_modes;
> -	int vmax, ret;
> +	int vts, ret;
>   
>   	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
>   	fmt = v4l2_subdev_state_get_format(state, 0);
> @@ -779,8 +779,8 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>   
>   	switch (ctrl->id) {
>   	case V4L2_CID_VBLANK:
> -		vmax = fmt->height + ctrl->val;
> -		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
> +		vts = fmt->height + ctrl->val;
> +		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vts, NULL);
>   		break;
>   	case V4L2_CID_ANALOGUE_GAIN:
>   		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
