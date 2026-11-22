Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369741;
	b=pPFDRSYbc0gLoeVECpTlyUsFamKFSQ4nrhX7a/poPRjeZteQUH9M74YSQv9RxMynKlYY
	 wET1sZ50ya07xRMMtmg1gFJtn+FhltIFlmESfeEIRql0AGgO/dfEwJijjdGc4uGzX1C45
	 RIpM8PxFpy1V58YfbDaoP3h1XVZlb5PrzEVV1pwH5rlcjpWPqOyMaqH0/dC6aLcCo/6ur
	 gICZ/Bss2tnGneQPZ2rxwOp12BMdBcewUfbCOGRKOBBbV9yWPDXAbzK+fe+KsqjRGoy1K
	 2ccANtD0Ipc6CwuhaggOjytT8HnpYwIMj7/qsqpnNWq2tP15yDQG7cg3jRjH/HJ7J1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369741;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=jhWW+kJ2ECwied9c9jbdzaZaNyOlWvuDb69ULztgqnw=;
	b=iviDgjqIv8+EfdakpJ/11ZfmjUffuroS48TpnMsIuSXJiDUbJxSEfJ/Bgx3eoHl2xFqs
	 KZcML5Gzy0uEb+TaH83fRekLDubs0Eg9KjM2+4/rs5ktB5npoc6HM98XoWpAbOwZS1auj
	 oG230Yqq5lPWKhoh3QwsLrxBpX/Q5+zDAGtXrDhc/UlDCC3rClbMK0LWkLTKrhZZ7wf21
	 MhiT/EBheFOm3wvDYbF/VBofo7/j/WNLaKI+6LPPHNJ38dNRk+lpbvsoqlGXLYkV/izdk
	 mGb1oSL+vwq39MeCm8u1onnhqj0/o2DZD1NbLLN5zT23Diy2AVOLZlT9K4YRh5Q2mYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=JEpaaNU9;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56A606A337;
	Sun, 22 Nov 2026 17:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE56A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=JEpaaNU9
Received: from ideasonboard.com (mob-5-92-38-150.net.vodafone.it [5.92.38.150])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E6C15E;
	Sun, 22 Nov 2026 18:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795369587;
	bh=1FEhLBDHlPa+Gz66pFGciWJsxQUbBFEcy379JEySN8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEpaaNU9OLu3uYXVB2LWje0ru7Jq2CppKdkxwvs2fXyd387qlCWg8v9RxTy9RN5Gy
	 VPHa25ySRK2yukM8ZLMz1ladMaJ4wz2Mzc29vSQvi3n1eQdCtCeN4qa/RS/wLLCxCF
	 9n4jzn3+EE3etd1/9PieFiK1fygFP+kKjurpFWGY=
Date: Sun, 22 Nov 2026 18:48:54 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: jacopo.mondi@ideasonboard.com, philippebaetens@gmail.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: mira016: Fix analogue gain range for the
 default format
Message-ID: <awMqfTOFAiwUcxGs@zed>
References: <20261121195010.820752-1-devnexen@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261121195010.820752-1-devnexen@gmail.com>

Hi David

On Sat, Nov 21, 2026 at 07:50:10PM +0000, David Carlier wrote:
> The analogue gain control is created with a 1..1 range, and the range is
> only updated when an active format is set. The default 8-bit format is
> applied by init_state as a TRY format, so the gain cannot be changed
> until userspace sets the active format.
>
> Create the control with the 8-bit gain range to match the default format.

I'm surprised I used the 8-bits format as default. I thought it was 12
and clearly overlooked it.

Honestly, I would use the 12 bits format as a default as higher
bitdepths are maybe preferable ?

>
> The issue was found by code inspection with an LLM, build tested only.
>
> Fixes: ab4a4c39c611 ("media: i2c: mira016: Add driver for Mira016")

Do we need one ? The driver didn't land in any published kernel yet.


> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/media/i2c/mira016.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> index 082442ffad28..076e8a22be82 100644
> --- a/drivers/media/i2c/mira016.c
> +++ b/drivers/media/i2c/mira016.c
> @@ -1917,9 +1917,11 @@ static int mira016_init_controls(struct mira016 *mira016)
>  					      MIRA016_MAX_EXPOSURE, 1,
>  					      def_exposure);
>
> +	/* The gain range matches the default 8-bit format set in init_state. */
>  	mira016->gain = v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
> -					  V4L2_CID_ANALOGUE_GAIN,
> -					  1, 1, 1, 1);
> +					  V4L2_CID_ANALOGUE_GAIN, 1,
> +					  ARRAY_SIZE(mira016_gain_lut_8bit),
> +					  1, 1);
>
>  	/*
>  	 * Changing VFLIP requires re-programming the top point, hence we
> --
> 2.55.0
>
