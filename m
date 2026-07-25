Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A32F1FE3
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784964392; cv=none; b=dzVD6/6lOxPb4CF49ZqYDtwt3huKX2XIxWtOrilclcKRMLwsWWTJEQDbGMzoDTj3nYqeZ4+zhdfiUXdQtsxMvQIG7uoYIRcoKQE9XahXdcSj23Y1xLVe5Lt13T4inxAB5SM8GevJA+SuoaX7tqf3cO0x8FilMEyjpSjfMaiXyKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784964392; c=relaxed/simple;
	bh=JwuYd1PjxTGHBuK5DrCRPpaMYWiKVaO6QsHugbeVwhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeHckuG5AIdSQNrfFkPaoeuyvCc+Yi4IQDjbP81qI98GNlOVEdLxUDaRS5tJ7ZKvU7X7/mUl1Oo/I4WkHWPdzoXW4m2gvkobJSELSkPLpDdhImEo91KLLawRiFVSTFMEaxfVshjP4MkM1Sp+tsNMXXnL1bT0kWTc5l9J9ua6mVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnlkrMwt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnlkrMwt"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so182441e87.0
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784964389; x=1785569189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uGfhai15ej7eeqcYQ02MSzDv34PdM1UDcRFgJ2X/k6s=;
        b=xnlkrMwt2QyJr25/7jd4zQjzYA3qNQ/lP01N88uaBXl34wIyJ3IMf5V74UrScJXAKt
         C927lw/fJPQBkoYlXUka8GlNFSN7vp3dJxmcMRdT98KBjYH1r1DXBy88WfCa+lLHyFb0
         /8NGx01LqiepUcRB92wpGzABaqlZhwqZffZnxce00Sz51KThWYU70WIMgmvbQjdWtUzV
         lMTUpGTu8PGjB74BryQAhzMBai/XsZS73PRVL+Muo+elTJw0Sq/Fq1E+MOXu3Dq1e2lf
         O4pOOI5YyIlvEE3HPSyq64qoIVDmWqLFcc7aTP1Kzy5NUzV6dry63EJ2Z6Ss6KYvxeVU
         +Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784964389; x=1785569189;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGfhai15ej7eeqcYQ02MSzDv34PdM1UDcRFgJ2X/k6s=;
        b=YPqAoXH7XVSnHMwPSw0kCzE8SjitjEcqHJoq8JdUw5fO93UhJQXCH/Phcrzj4EWazh
         nG5btRVyQN1aQN1+xvs1Ogu9nZkfaB5baXGPB5+skvPGEtWSDW/22NtzoUaNVncX4W4J
         uf0C+tiv4xKOSTIOK1lc57G2SP+s8GM2auN40ewlWDOj2rLxSELfzcGtx6flf+Hagxw3
         ++23BrUlv1CAtia/eJIds4hFfBT7a2y5+zDDwpE9UV+xdcsBdXOh+X93eICYRRXHyN6S
         JkgB16EsKmSuxC4H/CKXAKLf0xCAJ8O8eiS4n0MzvOGiacFyDnKESPVAeETKrzQkzOOF
         ljBg==
X-Forwarded-Encrypted: i=1; AHgh+RrquDFPlP1r2uNGTMrU+WDwv2dnx0C1Y2HJDGzSA2v+aCx16lJy7i3fZZmVSTTgDt2tEyyVstt2+9o5sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGMVrhV0vHHvkapowBRntlAiNh3IO2nRuCNmj4ZhI//3o4SZb4
	ovftEf3jdE3e89sj56Bk+CAOLh16gWdPdSPca/g6D+gokW1hCYy4YX39NtODTxHCp1Pkx54w5j7
	fyDmZ7J8=
X-Gm-Gg: AR+sD116Far39iOb3kGBpkiIy3btTHoi53IIR3QGe3mmfhAI42ts0AtfCUwsBI9x8TU
	qGfLiB+N8lCEiyGVDkbMb1b/skruPNl7WXmM9srtSttGVZYUJ+3bgVnHvdvdvoOuNH4buOsbuyj
	ek8ZlLPiIR38Ro1TxRlFJjuW4zSqGbY2f4PkUaQPYakw5pNu/3Vu54RP9mQzyG+SfRpGCgOvWWQ
	sH+RR5lkJYAi5xfVhP7bQAJuEgQY5+ueHmLjIawMwv6eqIBawSYQcEw4usqL6f3LrL2nUVSTCYz
	Nr+29iiiineaFT9anHTLgNThdMH+G+8Hhy7cFkdU4szUonZRFThB8OmwrfNdRx5Apmnff54KhB5
	ba3q9sgv58rcej/0GibAeA9+WRZlUmbezZ9pyU+RSyx+ARKlw0eUAEFjdSftwHRSeg5nMpL4STI
	miy2MXxbqAAOJmX8b2XamxLhNpfueYSsuEADk6TkvtZkRyEJAfvm64EZR4
X-Received: by 2002:a2e:a592:0:b0:396:6bd5:a9c5 with SMTP id 38308e7fff4ca-39f287a50dfmr987381fa.4.1784964388963;
        Sat, 25 Jul 2026 00:26:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f221739c1sm3731201fa.6.2026.07.25.00.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 00:26:28 -0700 (PDT)
Message-ID: <086dc0cf-e94f-479d-9db8-9aff7bc3e948@linaro.org>
Date: Sat, 25 Jul 2026 10:26:27 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/17] media: i2c: os05b10: update pixel rate on
 10/12-bit mode switch
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com, mehdi.djait@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-10-tarang.raval@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260718200912.16001-10-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/26 23:09, Tarang Raval wrote:
> After adding 12-bit RAW support, the pixel rate depends on the selected
> mode bpp. Store the V4L2_CID_PIXEL_RATE control pointer and update its
> range/value when the mode changes so 10/12-bit switching reports the
> correct pixel rate.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>   drivers/media/i2c/os05b10.c | 41 ++++++++++++++++++++++++-------------
>   1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index e11a3c308299..3fd788bd8b20 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -473,6 +473,7 @@ struct os05b10 {
>   	/* V4L2 Controls */
>   	struct v4l2_ctrl_handler handler;
>   	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
>   	struct v4l2_ctrl *hblank;
>   	struct v4l2_ctrl *vblank;
>   	struct v4l2_ctrl *gain;
> @@ -704,12 +705,35 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
>   	return 0;
>   }
>   
> +static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
> +			      const struct os05b10_mode *mode)
> +{
> +	u64 link_freq = link_frequencies[os05b10->link_freq_index];
> +	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
> +
> +	dev_dbg(os05b10->dev,
> +		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
> +		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
> +
> +	return pixel_rate;
> +}
> +
>   static int os05b10_set_framing_limits(struct os05b10 *os05b10,
>   				      const struct os05b10_mode *mode)
>   {
> +	u64 pixel_rate = os05b10_pixel_rate(os05b10, mode);
>   	u32 hblank, vblank, vblank_max, max_exp;
>   	int ret;
>   
> +	ret = __v4l2_ctrl_modify_range(os05b10->pixel_rate, pixel_rate,
> +				       pixel_rate, 1, pixel_rate);
> +	if (ret)
> +		return ret;
> +
> +	ret = __v4l2_ctrl_s_ctrl_int64(os05b10->pixel_rate, pixel_rate);
> +	if (ret)
> +		return ret;
> +
>   	hblank = mode->hts - mode->width;
>   	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
>   				       hblank);
> @@ -1070,18 +1094,6 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
>   	return ret;
>   }
>   
> -static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
> -			      const struct os05b10_mode *mode)
> -{
> -	u64 link_freq = link_frequencies[os05b10->link_freq_index];
> -	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
> -
> -	dev_dbg(os05b10->dev,
> -		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
> -		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
> -
> -	return pixel_rate;
> -}
>   
>   static int os05b10_init_controls(struct os05b10 *os05b10)
>   {
> @@ -1095,8 +1107,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>   	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>   
>   	pixel_rate = os05b10_pixel_rate(os05b10, mode);
> -	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
> -			  pixel_rate, pixel_rate, 1, pixel_rate);
> +	os05b10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> +						V4L2_CID_PIXEL_RATE, pixel_rate,
> +						pixel_rate, 1, pixel_rate);
>   
>   	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
>   						    V4L2_CID_LINK_FREQ,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
