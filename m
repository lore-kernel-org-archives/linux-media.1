Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637F485CD0;
	Wed, 29 Jul 2026 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330820; cv=none; b=jwsMBZLco9qBgq9DfZ5JKsDOMMkPnfYbSxULq1O34hRs71OFna1YByiPidIH1GeqjOSDwULk7SUZUUwAmQtarVJvEseEWTOI8JASv4X6As0jGKroMXPM3yY3kCnDrnJqpYKwb4nD5j8Brz/6gW6AlP4zqGpd2QbissLUEnJMUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330820; c=relaxed/simple;
	bh=KlG4UfBNwQEy0fSI0H4q5k2/hpesAGjE+qS+xeX7UgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrKV4KzGzaU6y2qDLkTYDS8HYI5J4l43ezc2w1E4CbmoCnPZtKixABblFJkticmluwap8WI++TJjtkiXIhgx5f0HcpYBDIIcR3mIZo6zALG9mIXpHzBp/oVjHCSNF5P1mPIgsh7wNulltXwohbzzP3X5FwJpCxrTBWnZkMvR95Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6efidrb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6efidrb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15421F00A3A;
	Wed, 29 Jul 2026 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785330819;
	bh=Wth232qSj1DscjpOL8qKzdNtiPb5OkwfVMaSPuFZA+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D6efidrbC6FD/T7F/sEAw+vu3pP8u5GlPUthfEho/1LKAGGJ/DfZOt8//4RZcxX6r
	 GUEoZT+SYMeE3cF9jWaej3w/L33Z/g0PoIyiQH+Eopjd9hrFwxXy8GEOL/UEyQszAq
	 tOmjDD4pV6GbokWRIY4xMjr5qoz7ZVb3OGiGAhUNljcUFptd//x0xf34JnLG7rDiXy
	 NNitN8A87I+LzHEfWLQIVtvMpQX3qHux77uU07jruWHkwqFCLf6ip9W7b2AyGTB7dC
	 gkFQAiMTDuXxBzUydsslrNIHFC6v2OzlIhJrtcxVOAPio/wtw0waOsseYAZyP3E3bu
	 gteRM1Oxwvr5w==
Message-ID: <ee5dc08e-0ce3-4ef4-aea4-57d9db4909aa@kernel.org>
Date: Wed, 29 Jul 2026 15:13:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] media: i2c: ov8865: fix horizontal flip control
 polarity
To: Jakob Berg Jespersen <dev@berg.pm>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
 Tooraj Taraz <tooraj.taraz@yahoo.com>, "Joseph V. Lavigne"
 <jlavig88@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260720-sp7plus-ov-flips-v1-0-5f345b0673de@berg.pm>
 <20260720-sp7plus-ov-flips-v1-1-5f345b0673de@berg.pm>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260720-sp7plus-ov-flips-v1-1-5f345b0673de@berg.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Jul-26 16:28, Jakob Berg Jespersen wrote:
> The ov8865's native readout is horizontally mirrored and the
> FORMAT2 FLIP_HORZ bits (reg 0x3821) un-mirror it: with the bits
> cleared the image is mirrored, with them set it is not. The driver
> maps V4L2_CID_HFLIP=1 to setting the bits, so requesting a flip
> produces an unflipped image and vice versa.
> 
> This is user-visible on the Surface Pro 7+ rear camera (mounted with a
> 180 degree rotation, SSDB degree=180): libcamera requests HFLIP=1+VFLIP=1
> to undo the mount rotation and gets a horizontally flipped image.
> 
> Verified by a live 4-state flip/image matrix on the streaming sensor:
> 
>   hflip=0 vflip=0 -> 180 degree rotation (both flips)
>   hflip=1 vflip=0 -> vertical flip only
>   hflip=0 vflip=1 -> correct image
>   hflip=1 vflip=1 -> horizontal flip only
> 
> (vertical flip = reflection over a horizontal mirror line, as on water;
> horizontal flip = reflection over a vertical mirror line, as in a mirror)
> 
> which is only consistent with an inverted HFLIP and a correct VFLIP.
> 
> Invert the polarity so HFLIP=0 yields the unflipped image.
> 
> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>

Thank you for your patch. At first I was a bit worried about this
patch because sometimes people get confused that a camera is not
a mirror and they enabling mirroring because of this.

But testing on a Microsoft Surface Go with an older kernel shows
that indeed the image currently is mirrored, so this is another
OV sensor where the mirror bit in the format register is inverted:

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/i2c/ov8865.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index c6d53c3d55ca..901ea7c16395 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2204,8 +2204,14 @@ static int ov8865_flip_horz_configure(struct ov8865_sensor *sensor, bool enable)
>  	u8 bits = OV8865_FORMAT2_FLIP_HORZ_ISP_EN |
>  		  OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN;
>  
> +	/*
> +	 * The sensor's native readout is horizontally mirrored; the
> +	 * FLIP_HORZ bits un-mirror it. Map the control so that HFLIP=0
> +	 * yields an unmirrored image (verified on Surface Pro 7+ rear
> +	 * camera by a live flip-control/image matrix test).
> +	 */
>  	return ov8865_update_bits(sensor, OV8865_FORMAT2_REG, bits,
> -				  enable ? bits : 0);
> +				  enable ? 0 : bits);
>  }
>  
>  /* Test Pattern */
> 

