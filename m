Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C23C199E;
	Thu, 14 May 2026 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778744669; cv=none; b=UoGX48LH2k0+SvPLRWS52BL6gfre1/J0rBRKH3OCkFZ4jjmiWgDB69dZ/RL1+5mowc87DD6ReizB8sosN2/UnjQezxzm0iY1V9lZVRnBZC+k59Px/3KCMajZZjS969wYLFPUlMqJGcEaY/rKHeQjWAXjsS44LWefU7Kh9stjXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778744669; c=relaxed/simple;
	bh=21r+XvWh8diiNZpqF2KdRXzBwrvhOOgolF+o00jCKt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnfzLzoXS5OoDIuQWIRq7JXep5qq8DSPYpSoDHsOFZGp5DkmgQjRH9mO0/ZWPjd08MKtzt5SCDohCfjuVJkV4YkuphhVg9oxkDywEcoObL/EyAiSVWwt6aOia5kZVuYvJtN2D5Peol2DJXsAnJopovJCJbpXrlzMRwyLrXk5S4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KOxoQ/ex; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KOxoQ/ex"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9DBC6A2;
	Thu, 14 May 2026 09:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778744657;
	bh=21r+XvWh8diiNZpqF2KdRXzBwrvhOOgolF+o00jCKt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOxoQ/extKzYB4QWIzU6T+PWX2GUrYkf6ozN1PRVwSRl4n8xKoDYjF0MiR2To2YTz
	 TajAV0ISutrC3uVZyrsN8NuzeTCFORYGSXsGHmM7yLESxz4xoGmxFReBpx6OAT9ajM
	 qKj4jEX9nHTpiJMRGbbRvFit9zBnkk1nTB8mnVKw=
Date: Thu, 14 May 2026 09:44:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] media: i2c: ov5640: Set default WB gains
Message-ID: <agV8Pk_SHuS96NjC@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-1-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-1-0869a7802a33@ideasonboard.com>

Hi Kieran

On Fri, May 01, 2026 at 04:39:03PM +0100, Kieran Bingham wrote:
> The default values for the Blue and Red balance should be
> the same as the Green balance (0x400/1024).
>
> Update the values to ensure no change is applied by default.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 85ecc23b3587..01ea6b2bfeeb 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3470,9 +3470,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  					   V4L2_CID_AUTO_WHITE_BALANCE,
>  					   0, 1, 1, 1);
>  	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BLUE_BALANCE,
> -						0, 4095, 1, 0);
> +						0, 4095, 1, 1024);
>  	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE,
> -					       0, 4095, 1, 0);
> +					       0, 4095, 1, 1024);

The register format is not documented, but 0x400 is indeed the
default. Looking at the control max value and the register default which
is reasonable to assume represents x1.0, I presume it is safe to
assume unsigned Q2.10 for the WB gains.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>  	/* Auto/manual exposure */
>  	ctrls->auto_exp = v4l2_ctrl_new_std_menu(hdl, ops,
>  						 V4L2_CID_EXPOSURE_AUTO,
>
> --
> 2.52.0
>
>
