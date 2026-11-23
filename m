Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451104;
	b=is7ydDBR4ephyRZODQmClF9XaKZJUrWNvSDG4n/sJ0/Nnk+l8iGXJF73LpKfqjs50rcZ
	 k/hmQ3xcVbSPvPIPzNObOMKqnzhghga3xRlWM0gxdjpsn74y8/tUMOnVwFuqAyGFsk3eS
	 DOBvMujfBSmBLDrF3mIS7pPMtcpYt9Y/bWLE0NR9rrCtMj1v5CO4yJAY69nN1YAKvNzLo
	 8eAufOL/eZI++iv5/uFTljrum+e62kQthBaNj7wlSTrj0w5z9NB/2oYp9yAp81abvpqx1
	 wxj/1lwr79dtUCVrigKaHbvHkz/M5Put3I4FYrZLWdoeUVKPhcI+5NquHpfeEQp8ALQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451104;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=j/3kbrH99PE4PwaLUUHdPahwKMK6ntpa6NPocr60VWY=;
	b=tjsZmhKPh9BIXQABSLUb7G9b3xn3NvnefcZad8AxogAJmqH1J+rEVYbIiI3NqnztWktk
	 mUgyLsqdduZAlLyrWdpEqEYOqioqjZ3umCrnewaOROLhyN62o8/cV1NU7RZYls6N/vvrC
	 qd63u+tVg0IOFDG90jTYJj91Nx2dunYlDAahbFHeCbqK9a7yk7fXZ6QVLzgJwr8BHS33E
	 +X6v7Kf8x3ZTuG0gu8V9v5h2Z8fi6p9JCd2L1TrNN10ypsv6rwgNJNaKd0aQ++knC+FRE
	 dNk5nZbKDLFWrvH6KzsoqyP8nVz6zvrjlvXCyNizY70U5FEaEOaH5iAeaxGnB04Sy3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DZX1CFj0;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7093606A31A;
	Mon, 23 Nov 2026 16:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7093606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DZX1CFj0
Received: from ideasonboard.com (mob-5-92-38-150.net.vodafone.it [5.92.38.150])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDF07524;
	Mon, 23 Nov 2026 17:22:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795450950;
	bh=K4brBUJxbNbf85GJhU0zYprIz6udL+ZFgRDszYCGEaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZX1CFj0GsGXPUzc2caybHEPjTzUrewGIXFI0mLeDecAYp7ehpkCKWJ+HnrWYdmc1
	 AJpXgC0HDsAaQbaVELmMN8L/GAwz4fJDVJFAmtPz7cGRNihYIru/jie8KPRAdrBFm1
	 G797AKqrrToC6B0tJIgmc15sogy8JNwV9VlwtwUM=
Date: Mon, 23 Nov 2026 17:24:58 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: jacopo.mondi@ideasonboard.com, philippebaetens@gmail.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: mira016: Use the 12-bit format as default
Message-ID: <awRou1TctcbkSnv0@zed>
References: <20261123053212.212169-1-devnexen@gmail.com>
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
In-Reply-To: <20261123053212.212169-1-devnexen@gmail.com>

On Mon, Nov 23, 2026 at 05:32:12AM +0000, David Carlier wrote:
> The analogue gain control is created with a 1..1 range, which is only
> valid for the 12-bit format, while init_state applies the 8-bit format.
> The gain cannot be changed until userspace sets the active format.
>
> Make the 12-bit format the default, and initialise row_length to the
> matching value so the blanking, pixel rate and exposure limits are
> computed for it.
>
> The issue was found by code inspection with an LLM, build tested only.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>

Thanks, I'll make sure it gets in together with the driver in 7.5

Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>
> Notes:
>     v2: make 12-bit the default format instead of widening the gain range,
>         drop the Fixes tag (Jacopo)
>
>  drivers/media/i2c/mira016.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> index 082442ffad28..d6db922f01b6 100644
> --- a/drivers/media/i2c/mira016.c
> +++ b/drivers/media/i2c/mira016.c
> @@ -1630,7 +1630,7 @@ static int mira016_init_state(struct v4l2_subdev *sd,
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  		.pad = 0,
>  		.format = {
> -			.code = MEDIA_BUS_FMT_Y8_1X8,
> +			.code = MEDIA_BUS_FMT_Y12_1X12,
>  			.width = MIRA016_PIXEL_ARRAY_WIDTH,
>  			.height = MIRA016_PIXEL_ARRAY_HEIGHT
>  		},
> @@ -2254,7 +2254,7 @@ static int mira016_probe(struct i2c_client *client)
>  	 */
>  	mira016_pll_calc(mira016);
>  	mira016_timings_calc(mira016);
> -	mira016->timings.row_length = 1062;
> +	mira016->timings.row_length = 1504;
>
>  	ret = mira016_power_on(dev);
>  	if (ret)
> --
> 2.55.0
>
