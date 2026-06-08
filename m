Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6355F394498
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905206; cv=none; b=YHP3Uim1pZ5F/n2ip6KooRuSKouXj88GLzUpQgn540Ahz2S1Gvbid24myzKMVGkAlRtGzJxP5C4weTrezDJZU/tksUKNsf8PBDr24rLoEhYGw/RtsIgEEB2OClPMHiVf1KM24MN2LrOeZnkybOJ1U4PTQf549GOhPc9ftSb5kuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905206; c=relaxed/simple;
	bh=AwC+tEgoLEiTa+OWK46p/WwS2qBV9tzCDyfLkUwlJm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NormK+IsgvXIArT2GPzCwZaWl5n1GGDwXyBYbOla6SKD5wqf596s1XpUCu8s0aCPGpqBUA3crhKE5MxnBc+X/QU2m4Sc+DHdKCSP5O9zhu0PEZKTzAoK0R7pziM8jxPtuvHOUvZy5FrYDBq90BDSji2geAKz4IWyVAohT8nIfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U28C6QTm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U28C6QTm"
Received: from ideasonboard.com (mob-109-113-12-30.net.vodafone.it [109.113.12.30])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79096447;
	Mon,  8 Jun 2026 09:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780905173;
	bh=AwC+tEgoLEiTa+OWK46p/WwS2qBV9tzCDyfLkUwlJm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U28C6QTmntNIICm/QC3RrRipY4mIlhinbUJghCtP4mZNY0zLSZSJZaIlkCMsGXF35
	 iHvwPbf01SA5UkQg+W+uxELzjlQ+w81arCwHiWS6IxOqjGZN5omfKI65vmTnWjrsOA
	 ngNXNO5LKmqgVYJwhkaKEZars+QmSSqJ/+HPKK4I=
Date: Mon, 8 Jun 2026 09:53:17 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 04/10] media: imx219: Make control handler ops for
 PIXEL_RATE NULL
Message-ID: <aiZ0a3nGqp6N7GD3@zed>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-5-sakari.ailus@linux.intel.com>
 <20260608073653.GD370380@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608073653.GD370380@killaraus.ideasonboard.com>

Hi Laurent
  sorry if I reply in place of Sakari but I got this fresh

On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> > The PIXEL_RATE control exists to convey the value to the userspace and has
> > no configuration that would need to be programmed to the sensor. Make the
> > control handler ops for the PIXEL_RATE control NULL and avoid a warning
> > (as well as returning an error) from the driver.
>
> I thought the standard way to handle pixel rate being read only was to
> set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
> V4L2_CID_LINK_FREQ. Is that not correct ?

PIXEL_RATE is RO by default

drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;

The purpose of setting the ctrl_ops member to NULL is to avoid having
to handle RO controls in the driver implementation of .s_ctrl().

>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx219.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index e681f80f9e3e..86683fe8a79e 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -556,7 +556,7 @@ static int imx219_init_controls(struct imx219 *imx219)
> >  		return ret;
> >
> >  	/* By default, PIXEL_RATE is read only */
> > -	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> > +	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> >  					       V4L2_CID_PIXEL_RATE,
> >  					       imx219_get_pixel_rate(imx219),
> >  					       imx219_get_pixel_rate(imx219), 1,
>
> --
> Regards,
>
> Laurent Pinchart
>
