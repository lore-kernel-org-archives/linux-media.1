Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED53AEB39
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 06:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528926; cv=none; b=KiAGtNKiQqYJg9VN/GQuW39uMgkFJfZA1PbyberX5s0sdUWsf8JUHh79cmZsi/+W0MK2VZI7Mv5IdsnYvvyocEk/VEggwWoK6M9GeGFSHTPHIMstwx0V9EU8u43FqgqMtKJo9sf8fON3XZoB/zhWPlftFSsqSqCu2kFM1pVE0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528926; c=relaxed/simple;
	bh=mtOsOeI6DczUvIhI5DQRTSoIBOxwBe4Caq3Ky6AjmYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7+wINA23cCj81QKbt8o7KdY2bkX/Y6+GNwiBQSivOJoA2oEVrzWcAt5Bye12TNDDnBH/NIRiL3TSUeLNP+Q/h3tr/3ye/zv2wjxt+bZAqXV5mq+IJeG/rURfdkTsK5ozKIwSPYvqQSmVI6OjjtWL1FeGsZk8z0c0qf6LiWxv58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rb2Q56EV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rb2Q56EV"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00BA5289;
	Mon, 20 Jul 2026 08:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784528859;
	bh=mtOsOeI6DczUvIhI5DQRTSoIBOxwBe4Caq3Ky6AjmYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rb2Q56EV5pCc45Q9Jwrt9xHypcGTvUSUdlZK0JOYxoJvx4QJBhTkocRf59qY2fJuG
	 nz7x+0YnPY4aFEJBQp4Vx4Yw6ZZdMH92eV3NsdvsFblReDxxIkJvCulvSXyJ3LrRxy
	 9ebIKJN+5BEjSoA5FE+2hsH4MPJXDU8fSURyTns0=
Date: Mon, 20 Jul 2026 09:28:36 +0300
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
Subject: Re: [PATCH v6 04/16] media: imx219: The horizontal blanking step is 8
Message-ID: <20260720062836.GB2208631@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Jul 01, 2026 at 03:26:21PM +0300, Sakari Ailus wrote:
> The step for horizontal blanking on imx219 is 8. Take this into account in

I'd write "for the LINE_LENGTH register" or something similar here,
unless the constraint is really on the blanking.

> creating and modifying the horizontal blanking control. The minimum line
> length in pixels as well as the horizontal blanking values are already
> divisible by 8.
> 
> Fixes: cd5e2fd89923 ("media: i2c: imx219: make HBLANK r/w to allow longer exposures")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 2aab6e7180d4..52a4bd9c4fd3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -78,6 +78,7 @@
>  #define IMX219_LLP_MIN			0x0d78
>  #define IMX219_BINNED_LLP_MIN		0x0de8
>  #define IMX219_LLP_MAX			0x7ff0
> +#define IMX219_LLP_STEP			8
>  
>  #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
>  #define IMX219_REG_X_ADD_END_A		CCI_REG16(0x0166)
> @@ -578,7 +579,8 @@ static int imx219_init_controls(struct imx219 *imx219)
>  	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>  					   V4L2_CID_HBLANK,
>  					   IMX219_LLP_MIN - mode->width,
> -					   IMX219_LLP_MAX - mode->width, 1,
> +					   IMX219_LLP_MAX - mode->width,
> +					   IMX219_LLP_STEP,
>  					   IMX219_LLP_MIN - mode->width);
>  	exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
>  	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> @@ -920,7 +922,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
>  		ret = __v4l2_ctrl_modify_range(imx219->hblank,
>  					       llp_min - mode->width,
> -					       IMX219_LLP_MAX - mode->width, 1,
> +					       IMX219_LLP_MAX - mode->width,
> +					       IMX219_LLP_STEP,
>  					       llp_min - mode->width);
>  		if (ret)
>  			return ret;

-- 
Regards,

Laurent Pinchart
