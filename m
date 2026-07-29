Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998DA488DA1;
	Wed, 29 Jul 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331143; cv=none; b=bCVyoTdom/f6Uat4cXYpdfE+7Q8bGb1VqlyxThNeu7turdmnjZSjumjm9Y+5v0c6eiCZFQfVD3qpdvG3PJs1u03uxevMjjx3FTbtl8gqWmEz/Dl8uRwatLcuG1Xp5SkQHmykR0b0SQdaTRucBTlOE+/LhvLV/dhYJ1nXxMZG5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331143; c=relaxed/simple;
	bh=opruNpJ5zCVfUgxsG2g46uCvvg9RnaG39nQTtPaNLq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sri/HK15E+2IgYd9o2GylH/renxL08+lUeg8q6LMEViEoXdcq5n0w6sXx8rz8clFs+WGg1ryAKr4f938uuIp/GNMbNhtj0yh70zLn/C3SZj6cAq/YFqzXYDoEsYYXfj30o5UeQuoiNByjObzrx0HXELoaAeAOpbhlDjVM9cgsy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSTkC2e9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSTkC2e9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4672A1F00A3A;
	Wed, 29 Jul 2026 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331142;
	bh=hE4iV96Faa1QoWGdgp7h4CvXQCY9Nn6x6JXpj/VXqVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PSTkC2e9duLFimpkVSCctNA00BiwIuf+Hl9I4T8nCbh0acMvwprJVthDjZPjB5bAL
	 sgTLXPBVau5xj+E7OUXaGVRC4vbUSC/TIVa1q39KZsyOrJpN+HeoCRJcWcgfXIPyZU
	 l+SxoxZV8PYmvtyu9rj3XmXV7xFlEE1upCgTDXZ/ga6UwstRidXRA3wXbV/H87VmUy
	 wVo+++QY8XqGgMXMzAlrrOc1ZE+JBWd5c92Myz3quNFxFrAFkrbbWmu1a0CtyaUuaS
	 e0BmSWmq+EJLo4O/24eovHvNfsX2MR8xk0NIv3VbSx0sBVV/YoSMiT//Hipj0KC8ZW
	 Wg4jxPib8YC2w==
Message-ID: <c7abd512-0dc3-45f3-92fb-2efba944c1f9@kernel.org>
Date: Wed, 29 Jul 2026 15:18:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] media: i2c: ov5693: fix horizontal flip polarity
 and Bayer phase
To: Jakob Berg Jespersen <dev@berg.pm>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
 Tooraj Taraz <tooraj.taraz@yahoo.com>, "Joseph V. Lavigne"
 <jlavig88@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260720-sp7plus-ov-flips-v1-0-5f345b0673de@berg.pm>
 <20260720-sp7plus-ov-flips-v1-2-5f345b0673de@berg.pm>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260720-sp7plus-ov-flips-v1-2-5f345b0673de@berg.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Jul-26 16:28, Jakob Berg Jespersen wrote:
> Like the ov8865 (see previous patch), the ov5693's native readout is
> horizontally mirrored and the FORMAT2 FLIP_HORZ bits (reg 0x3821)
> un-mirror it: with the bits cleared the image is mirrored, with them set
> it is not. The vendor init table sets the bits by default (0x3821 =
> 0x1e). The driver maps V4L2_CID_HFLIP=1 to setting the bits, so
> requesting a flip produces an unflipped image and vice versa.
> 
> This is user-visible on the Surface Pro 7+ front camera (mounted with a
> 180 degree rotation, SSDB degree=180): libcamera requests HFLIP=1+VFLIP=1
> to undo the mount rotation and gets a horizontally flipped image.
> 
> Verified the same way as the ov8865, with a live 4-state flip/image
> matrix on the streaming sensor giving the same result: an inverted HFLIP
> with a correct VFLIP.
> 
> Invert the polarity so HFLIP=0 yields the unflipped image (bits set) and
> HFLIP=1 the flipped one (bits cleared).
> 
> Clearing the bits also shifts the Bayer sampling by one column: the
> fixed SBGGR10 mbus code the driver reports is only correct for the
> bits-set orientation, so the HFLIP=1 state has the wrong colors.
> Compensate by shifting the ISP output window (reg 0x3810) one column in
> that state only: OFFSET_START_X = 1 when HFLIP=1, 0 otherwise. There is
> a spare column to shift into because the crop end is programmed
> inclusively (crop end = crop start + width). Validated on the SP7+:
> correct geometry and colors in both flip states.
> 
> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
> ---
>  drivers/media/i2c/ov5693.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 4cc796bbee92..95dc6af45125 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -375,8 +375,28 @@ static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
>  		  OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN;
>  	int ret;
>  
> +	/*
> +	 * The sensor's native readout is horizontally mirrored; the
> +	 * FLIP_HORZ bits un-mirror it. Map the control so that HFLIP=0
> +	 * yields an unmirrored image (verified on Surface Pro 7+ front
> +	 * camera by a live flip-control/image matrix test, matching the
> +	 * same behaviour found on the ov8865).
> +	 */
>  	ret = cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG, bits,
> -			      enable ? bits : 0, NULL);
> +			      enable ? 0 : bits, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Clearing the FLIP_HORZ bits shifts the Bayer sampling by one
> +	 * column relative to the orientation the init table (0x3821 = 0x1e)
> +	 * and the reported SBGGR10 mbus code assume, which corrupts colors.
> +	 * Offset the ISP output window by one column in that state to keep
> +	 * the BGGR phase; the crop window always has one spare column
> +	 * (crop end = start + width, inclusive).
> +	 */
> +	ret = cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG,
> +			enable ? 1 : 0, NULL);

Both the commit message and the comments here could be a bit less
verbose.

Otherwise this looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans

