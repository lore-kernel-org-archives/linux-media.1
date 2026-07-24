Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCEB30675C
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784899147; cv=none; b=bh5fz8Yh2NkuT57vGrM2flfepb0s4R8SlDJ+Vz4ozXveQBuvnUQqeKgy0YRTmTeWSvtSXs2wtmfDeQsu7YQOSIvfMU9FO9ebeTmyw+PlEbT1i8sdKJHOxn6QBLdunxCSfkAmUvaI4kYxGI0AsPW5g7NRPShMFgEjI4HsBfp+8gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784899147; c=relaxed/simple;
	bh=y96u64ErtA/bg8tEggAjTrhFnPK5Yt0gF2V7ZgCPuaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYVAZtWS1gI5XabKSRfMpS3UxeGA7UtcNlFMHETSk2kd/rrGoHFGZNYLRTBiSHSeJ+sZKOXQZUzAlSQrY8mu/D0Q9XJJhCNCHYIlOG/Im+IvX/zGPKsGHbifkK0mYoj1BaZcFj0F0uLakUq3kF6NnEoVHoSsyXWI0vQZKmM2fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lQaOCqLv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQaOCqLv"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b014810feeso63648e87.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784899144; x=1785503944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5UuJhAikCadaYJiJSU/kID0E8iIJqj6Edvilo/p0kO4=;
        b=lQaOCqLvl4LK5twe99KXJRjTc1diUhGf9y+BV6LMYcV3VcUnMoIrlL/pO1QW8Ft99O
         wJEYKGmb1lh48K5mxSvjN+55xsKR+W5S85h0vume2fdKwuVHVc6TleF8eKbK1bVjGlIt
         t1YeaRVQle8p9mN77l+f9e3Ro1WLSUusNjZaGV7daWQbLzlsHu3ijF9HdyLAQlNHSEGW
         CDll710tvjE+mxzc8KXpSvLMu63ngkf4r9efciggCBTBlY2DrqOUNytvhWt9DsYInDk+
         r0go8intWeRWmwTuLwL5eiIGk697+HSr5UpbDNWssgKY6j0HtsTQ0DcnZ7kqq8BRapp9
         pUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784899144; x=1785503944;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UuJhAikCadaYJiJSU/kID0E8iIJqj6Edvilo/p0kO4=;
        b=hp4Yz5ZNWwXAw671jjk6MDNhgUPDUUs4yY32PKlka3GEFGJ1W7EzWKkqAFT72gu8vq
         3wMypwQR/0EvyK3OW5IyTvzyO3Nvn9X+dMN87UqVPnCd+qL35FK/d3VAsLg/LBzqDYVx
         zBm/AVp5AbDD9FHj0xKP14UStwF0FQ7a4QUEzIVOFFAFJhA0Vdpf1du6t+1BJtdjRPFV
         158H+mjvUegvahjPaA4+bXgHG1RYhu8/jR/oO1Qv1mvy5uri7EygiNbtnM/QgS0QIsbW
         CPiAdVWXxe/IWwM1FodXbSYjuAcWm6po6oYoSqIDlsjQ5nhUXxrMUH2FfdKl4en3BJgf
         q30g==
X-Forwarded-Encrypted: i=1; AHgh+RqGfPeWyGuagpNP8XEc2x095wX8KQ8/Ns4EArtbrPihGx0Q5aqdnNEot/mJTf29cVWz/lbzySHth9sdKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVbJlWoJlmorKm+I3HUcwCZvdL/7/IMfo81GHfFC1AVwx6dRg
	iogWbI53l3SoiCuFpEIGVRZ5cftXhME1P7HRfLG5z4A4A2yiJgoaoAHM2z4I4Osc0eU=
X-Gm-Gg: AR+sD13Y/S1KZLxPnxokD+yroBAYj/fJlygIEHLJ6B4ozNmXFsX9Sn287SNgx5sTnsV
	Fd/O0C6eTE3rtFGdjVmWCa3N3qOjbrLaeIz6i0Vxb7r/pHITARsekTUM6xBeXDWfl2CWYdX1yt+
	Mebj/roTVWjcxxw2U28qjFrxu9tdZDn8H2N3pkPN589iXHOMQQUwve10d8wAjtVZbY48VlqG46E
	l1LOhkCJl7cHZwHtq0zCOcrjabJJyTboofAq078CTFaXsmPwvC6EhXJ5EUKqqo87dfgs2T+37B4
	2e+zmFxNdH9syj+qEItugBWwZLbafRGxFQz/AxXAACV43K2qghL5zQApeRyFG2hKmQA2h9JaPX2
	mKXkPjJ0F1ix4/BnIZx1QQhtVQsUhOGnWKeoR0chMQePBVkDDrLgaz71vnhEv48MJXws91YYqys
	faC2Y9CY3g8l2z0x2z+PFZfar44JiBmOjZdyStC3lmUpKb4PfFR0KKuGT6
X-Received: by 2002:a05:6512:3404:b0:5b1:5b44:c4cb with SMTP id 2adb3069b0e04-5b2b2f7c2acmr894270e87.7.1784899143652;
        Fri, 24 Jul 2026 06:19:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bafdf5sm1500376e87.35.2026.07.24.06.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:19:03 -0700 (PDT)
Message-ID: <fb9b5132-e5b6-405f-b930-8d2b44c3740c@linaro.org>
Date: Fri, 24 Jul 2026 16:19:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/17] media: i2c: os05b10: add V4L2 digital gain
 control
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-6-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-6-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:08, Tarang Raval wrote:
> Stop programming digital gain in the common register sequence and expose it as
> a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
> in the ctrl callback.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>   drivers/media/i2c/os05b10.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 12c4e2610d6f..abf3d2970900 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -138,7 +138,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>   	{ CCI_REG8(0x3503), 0x88 },
>   	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },
>   	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
> -	{ OS05B10_REG_DIGITAL_GAIN_SHORT, OS05B10_DIGITAL_GAIN_DEFAULT },
>   	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
>   	{ CCI_REG8(0x3600), 0x4d },
>   	{ CCI_REG8(0x3601), 0x08 },
> @@ -549,6 +548,10 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>   		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
>   				ctrl->val, NULL);
>   		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		ret = cci_write(os05b10->cci, OS05B10_REG_DIGITAL_GAIN,
> +				ctrl->val, NULL);

OS05B10_REG_DIGITAL_GAIN_SHORT control is removed, but
OS05B10_REG_DIGITAL_GAIN is left in the long sequence and rewritten here.

If OS05B10_REG_DIGITAL_GAIN_SHORT control is just not needed, please
remove it from the long sequence in advance, and then this change will
touch the remaining OS05B10_REG_DIGITAL_GAIN control only.

> +		break;
>   	case V4L2_CID_EXPOSURE:
>   		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
>   				ctrl->val, NULL);
> @@ -925,7 +928,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   	int ret;
>   
>   	ctrl_hdlr = &os05b10->handler;
> -	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
>   
>   	pixel_rate = os05b10_pixel_rate(os05b10, mode);
>   	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
> @@ -967,6 +970,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   					  OS05B10_ANALOG_GAIN_STEP,
>   					  OS05B10_ANALOG_GAIN_DEFAULT);
>   
> +	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
> +			  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
> +
>   	if (ctrl_hdlr->error) {
>   		ret = ctrl_hdlr->error;
>   		dev_err(os05b10->dev, "control init failed (%d)\n", ret);

-- 
Best wishes,
Vladimir
