Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B27399D0D
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909592; cv=none; b=boWeP2WQ/uf2MuxAT0ms9TdsTv9EONvSazPVIUQxd61ipam7Pl8/PgSUEj1lIzufqvy1To+2/Tc1ZpPuDnot1+D8O4+MCHjDbt3vYLr+gHQIp0kF4JiNXfxSVSxwpXiOmnLdJKkBswwqG2ceDfu9fDdMg7nOhtXE+1hy22u9cBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909592; c=relaxed/simple;
	bh=1aOT+JOyZOzGTsPoRYCisF/ck9WVMU9hMcKpX9D55kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSe6vLEuzqtW2+I2zJTYpYCdh8N8ogfcLQ9cMG4yg3kMXp5c1IyGI7iyuXVzGfM5gktSx0rJQjiSnlDhi8+1Vpug3U+EQ81QhfyQgeoOQxAEYA0VFQRmWLW0jCdyltWc4F8Qf+v/PCjmQVLuGDbdiYk2fHbxzdaTnEmSlxp6Ijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vQ02ty1X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vQ02ty1X"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 858028F;
	Mon,  8 Jun 2026 11:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780909559;
	bh=1aOT+JOyZOzGTsPoRYCisF/ck9WVMU9hMcKpX9D55kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQ02ty1XrTCjI4aWpr4ao20oglS1HwOVqbnMqqADLcX5effiLnEUa2x9kq/OlZjjk
	 RKeOPzjCFMd1pDSNNY1bt38vNTMetpnkYZQrElzU7+B07S/AAa6sSV7UJwLHUJqD00
	 /aJ5yIcZVUpsjvsvtrkSjYsD0rfXYlMzI9WS4Ezw=
Date: Mon, 8 Jun 2026 12:06:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 03/10] media: imx219: Account rate_factor in setting
 upper exposure limit
Message-ID: <20260608090625.GA772117@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Jun 08, 2026 at 12:53:49AM +0300, Sakari Ailus wrote:
> The rate_factor multiplier is used to multiply a few values in the
> sensor's timing configuration and the exposure time is one of them. This
> also needs to be taken into account in exposure time margin: multiply it
> by rate_factor so that sensor's exposure time margin is respected.
> 
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index d8fe7db18b6c..e681f80f9e3e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -451,7 +451,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		int exposure_max, exposure_def;
>  
>  		/* Update max exposure while meeting expected vblanking */
> -		exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
> +		exposure_max = format->height + ctrl->val -
> +			IMX219_EXPOSURE_OFFSET * rate_factor;

I'm not sure if this is quite right, I need some more time to research.
Regardless of that, isn't the same change also needed in
imx219_set_pad_format() ?

>  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  				exposure_max : IMX219_EXPOSURE_DEFAULT;
>  		ret = __v4l2_ctrl_modify_range(imx219->exposure,

-- 
Regards,

Laurent Pinchart
