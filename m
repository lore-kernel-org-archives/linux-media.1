Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA80F3939A9
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904219; cv=none; b=XMVDcS3E4MHEu23KOW1XuY0nI7YRXQIInZs/Us7McDOH5cKwZspcbUNRNVmonKJX+8EikKjMwiQTmYKB6YHEoMPK1RRdhMEuAJVmo4sulgxcSuYu4708RSvD0J0hBzmplMr+IBHnA1F4n4FrIoL0tBNC5fHWEK5sGKwN7n04ecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904219; c=relaxed/simple;
	bh=PZQvRJK30qb104hI20Kp2LsZLtk4UEgxjtlJxHz8j68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyer2Rrs2T03uFWm1XrH0kPmMHgptjCXdwf+6uFSpkl7YLDWqoUr+CfCQOOHn89rHPg/5QSGwg9Vnw9wX22CvksPVgB+cjH3WjSzd27VtYooe4Z15dIWYfN9+e2LHKIekjNRp1U5g++dqKsTA2V8rx2tIm2XMGI0KDK7B5zLljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mqSRSsN7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mqSRSsN7"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F892447;
	Mon,  8 Jun 2026 09:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780904187;
	bh=PZQvRJK30qb104hI20Kp2LsZLtk4UEgxjtlJxHz8j68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqSRSsN7JfZn98Hyrd/diwtCNFfRA6Zk9Ok0cYXspfjDsXCWt6/1Tt66DZxD7PNEO
	 w9oFA4J1P9IlsbSmErtRQGbn0/hGWMCsVSGVdgcKNelYI26ZqsBxouReWZmydwHykI
	 QEbwBu4TKtWJDMF1x7aeYYSMBYohodTVB73an/tM=
Date: Mon, 8 Jun 2026 10:36:53 +0300
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
Subject: Re: [PATCH v5 04/10] media: imx219: Make control handler ops for
 PIXEL_RATE NULL
Message-ID: <20260608073653.GD370380@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-5-sakari.ailus@linux.intel.com>

On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> The PIXEL_RATE control exists to convey the value to the userspace and has
> no configuration that would need to be programmed to the sensor. Make the
> control handler ops for the PIXEL_RATE control NULL and avoid a warning
> (as well as returning an error) from the driver.

I thought the standard way to handle pixel rate being read only was to
set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
V4L2_CID_LINK_FREQ. Is that not correct ?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e681f80f9e3e..86683fe8a79e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -556,7 +556,7 @@ static int imx219_init_controls(struct imx219 *imx219)
>  		return ret;
>  
>  	/* By default, PIXEL_RATE is read only */
> -	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> +	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
>  					       V4L2_CID_PIXEL_RATE,
>  					       imx219_get_pixel_rate(imx219),
>  					       imx219_get_pixel_rate(imx219), 1,

-- 
Regards,

Laurent Pinchart
