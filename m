Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F43B5841
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531160; cv=none; b=pTely/eX/Q3XTZmKV4+HCyPl39ts93xfQ7m5lAfoADrafKQ571xV7T+YDxw8gHwyyc+gpOtYiHDPM6QjzEyVhJkytP5KvgiQTznNg7v3cFHMK0vVMq5Mc3S4wIvUqRPwXO2k0N0yn3VYikhaqICs5vcGVHfRCPODhzAV2d+tFe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531160; c=relaxed/simple;
	bh=TdgszqTtSIYL5hGf6MuX+mP1+dBKe/QkGAs/9E4HmKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVJqgLuDEaF9rkiRMHoqqNifyYlNOTPtLIBnvYCvu060Q63y29/LwxZ1BSxV3P8WhpLL3R5ULtKmxrR8X12B4rkeetv6IZn023QHHKrQyKMkEGjf81UxHTQb53gUXJ/GENkbaVpddOLDZE06vqdoRAAYd9kjk4jqPtaSE8sIWU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rcCBZ7FE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rcCBZ7FE"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6BF2C1;
	Mon, 20 Jul 2026 09:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784531098;
	bh=TdgszqTtSIYL5hGf6MuX+mP1+dBKe/QkGAs/9E4HmKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcCBZ7FEczjBt1H9f4LZGKac+YOS+YW54k1fjFVNwE2hsaAxfK9RD9NyZBgF12ZyG
	 JrWWYDoD2FT3uZ/tYzyFHk6P7ANuZYq6MP8FQFsPZAHsrmH4QeOng13uYfITtb+3Kz
	 PewB1ukcKfYFOz4i7V6FF93ZWOZUbqEJo5vm6shQ=
Date: Mon, 20 Jul 2026 10:05:55 +0300
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
Subject: Re: [PATCH v6 14/16] media: mt9m001: Pass sub-device state to
 set_selection() callback
Message-ID: <20260720070555.GA2223472@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-14-sakari.ailus@linux.intel.com>
 <20260720070019.GA2218925@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720070019.GA2218925@killaraus.ideasonboard.com>

On Mon, Jul 20, 2026 at 10:00:20AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Jul 01, 2026 at 03:26:31PM +0300, Sakari Ailus wrote:
> > When the set_selection() pad op is called from the set_fmt() pad op, pass
> > the sub-device state to it instead of just a NULL pointer. This does patch
> > not fix a bug but simply passes the expected information to the
> 
> I think you meant "This patch does not fix a bug".
> 
> > set_selection() op.
> 
> This doesn't explain why this should be done. Frankly I don't think this
> deserves a separate patch, just squash it with whatever other patch
> needs it.

I've misread the patch, sorry. Let's keep it as a separate patch, but
improve the commit message:

----
When the set_selection() pad operation is called from mt9m001_s_fmt(),
it receives a NULL pointer for the state argument. As the function does
not use the state this does not cause any issue in practice, but it
could cause NULL pointer dereferences if the mt9m001_set_selection()
implementation is modified. Avoid future issues by passing the subdev
state.
----

Or something similar.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/mt9m001.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index 0ade967b357b..d8fffed0818a 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -343,6 +343,7 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mt9m001_s_fmt(struct v4l2_subdev *sd,
> > +			 struct v4l2_subdev_state *state,
> >  			 const struct mt9m001_datafmt *fmt,
> >  			 struct v4l2_mbus_framefmt *mf)
> >  {
> > @@ -359,7 +360,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
> >  	int ret;
> >  
> >  	/* No support for scaling so far, just crop. TODO: use skipping */
> > -	ret = mt9m001_set_selection(sd, NULL, &sel);
> > +	ret = mt9m001_set_selection(sd, state, &sel);
> >  	if (!ret) {
> >  		mf->width	= mt9m001->rect.width;
> >  		mf->height	= mt9m001->rect.height;
> > @@ -404,7 +405,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
> >  	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
> >  
> >  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		return mt9m001_s_fmt(sd, fmt, mf);
> > +		return mt9m001_s_fmt(sd, sd_state, fmt, mf);
> >  	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
> >  	return 0;
> >  }

-- 
Regards,

Laurent Pinchart
