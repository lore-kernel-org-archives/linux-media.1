Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3575C34DCD2
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532716; cv=none; b=kIiZY/3CviGSTQpwE5YCQCkLsy6KV6ZcK7G9EUZ7+0xefa4tZEJnZ67tSeceqOuDpMhQIniuKG5oraup2IdkV8XAFAd89gOuPjG2V8DS3ZrPlTmp3ewGVr0UrMZRKoH3htdIu50Bb/Vt8EMp6ZCDv1aPW/3GEnFi2mKpWkSiyQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532716; c=relaxed/simple;
	bh=1ElOTal8uzB9pbOiUrKjyapJe6QHK5YfhraTugcjhG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWtgykwgk9RGyRLybneP/mDji4oVPfFgo/eAw2vE2K2yU6TkrZmZ0HfBQengvyS4I2xiaR4goYFZHOiYEI+tI7G+LJq4WxxDcRZf3RLHmSUV+a8Yn8dlVNRJQx7Iap55dbycv1PCYg6bGutfnw0BscY/sDFDrp4AbWf3tpzWZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iFkThyuE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iFkThyuE"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DFA1161;
	Mon, 20 Jul 2026 09:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784532655;
	bh=1ElOTal8uzB9pbOiUrKjyapJe6QHK5YfhraTugcjhG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFkThyuEXUEwqswVzqh7el4XyJgFvZq/jcUzxOqMpZelW4f6PrJyHnzMmfrM5gIZ8
	 kYQwb514nCrPaxLRNBcZyRh86pzVpkipSFpde/RRTDYUQlzI3E+YLUVWjB5He3DVtk
	 iXUgkDcRB5ApXnC5K6RTSc3Kj0o4iZ7xzhF3XEDA=
Date: Mon, 20 Jul 2026 10:31:52 +0300
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
Subject: Re: [PATCH v6 10/16] media: rdacm20: Don't assign set_fmt()
Message-ID: <20260720073152.GB2259915@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-10-sakari.ailus@linux.intel.com>

On Wed, Jul 01, 2026 at 03:26:27PM +0300, Sakari Ailus wrote:
> Do not assign set_fmt() as it is the same as get_fmt(), which will be

s/will be/is/

> called by the framework now in absence of set_fmt() op.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm20.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 52e8e2620b4d..0179508626b5 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -442,7 +442,6 @@ static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
>  static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
>  	.enum_mbus_code = rdacm20_enum_mbus_code,
>  	.get_fmt	= rdacm20_get_fmt,
> -	.set_fmt	= rdacm20_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops rdacm20_subdev_ops = {

-- 
Regards,

Laurent Pinchart
