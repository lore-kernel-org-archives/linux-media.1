Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7334D3B0
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810680; cv=none; b=cSm10apqVvIbmYg5vxFk0atradzjSzzP+xrN4F+QEayY109604n5DKT7DpWY7WKrfrTbljC5Yv7X5kuPqCdtD72OIeN6Dr/DFEui98qD697+pCLyAnbPK2yPWUekr5F3NMMKgmJWWYbDjygHqSOjGucWoPDOEKi0EX4lH+1yd/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810680; c=relaxed/simple;
	bh=FQNpgIEpZV5346ATnWrwwW1NIJNph44+snICPANvAqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZTLKZx5rfrnrdGXoCn0SfGbW61JewFlN7+8Lipu7C2gGeRPM1YEsbHJU75pzw1nyNLgTZ6FVvdPMlSwUf0tg7RCd0f3g7V6i94j92B0rea88QtmahWBAoBQ1FKv9ai5CBg3/+tcr795pjsHbE9Zw6fFNyOyOS/nsZYnx+y4cJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=er1e+7Ct; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="er1e+7Ct"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 092E51BA;
	Fri, 10 Apr 2026 10:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775810587;
	bh=FQNpgIEpZV5346ATnWrwwW1NIJNph44+snICPANvAqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=er1e+7CtzU5fjavpVGZfJTnln9maUsCxsbQFXGJzNvPTJfErSifxk0TTtPOv+oegC
	 cVeiQuglpDqKYfuXkSjlBAmUYygU9VXm63FlMsnwqMBf5X/2bI61KB678FTV7EtJkh
	 PHPZPs0SDh78k3CwqntlgwN7kqQN+0YzTQjHiR10=
Date: Fri, 10 Apr 2026 10:44:33 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 06/29] media: imx219: Don't update exposure limits
 while setting format
Message-ID: <adi4VeDEtQzBCuXy@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-7-sakari.ailus@linux.intel.com>

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:15PM +0300, Sakari Ailus wrote:
> Don't update exposure limits explicitly while setting format. This is
> already done through the s_ctrl() callback.

already done through the s_ctrl() callback for the VBLANK control.

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index a72630ad1561..ca6a5939773d 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -867,8 +867,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		int exposure_max;
> -		int exposure_def;
>  		int llp_min;
>  		int pixel_rate;
>
> @@ -887,18 +885,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  		if (ret)
>  			return ret;
>
> -		/* Update max exposure while meeting expected vblanking */
> -		exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
> -		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> -				exposure_max : IMX219_EXPOSURE_DEFAULT;
> -		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> -					       imx219->exposure->minimum,
> -					       exposure_max,
> -					       imx219->exposure->step,
> -					       exposure_def);
> -		if (ret)
> -			return ret;
> -
>  		/*
>  		 * With analog binning the default minimum line length of 3448
>  		 * can cause artefacts with RAW10 formats, because the ADC
> --
> 2.47.3
>
>
