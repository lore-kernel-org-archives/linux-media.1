Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23AD21D3F5
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 06:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784530422; cv=none; b=FNgWbeYIY7kD7Ao7rYm2/j9D18D/EwFVUsAA0sIAdkQvSvHUSbCSu779cXH9PWRVIvhlVdFBIhCVcJRW+9tS1T+zeOv4FWqrXbp6cHxVme3XiYyfkPX5AGd5Cg/EMoGEyiP8lAo2xjCJoX0JdRwVFlznXXuC0u/91+zx//wbKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784530422; c=relaxed/simple;
	bh=imsUhZ4HtTzV1T/PzjVR65ka+wazCsrZQt/iCp09rxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njuVhJbm0ASHlu5LXNRAPNmP1iyR1Ft3SgzS6Fkax5yBVsYPjVjMQFDU1TZZqQL2YPsDe12PD0poizcR1L73TSBEINfI9oU/BIQngfcvEtH0Io7UBkZsU3VvdTeRcFUd2ChIRyZJPJz1etOdJB3nkDc6aiuG3cPau2V7xlUPhRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tcbQ0ZW5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tcbQ0ZW5"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7B33C1;
	Mon, 20 Jul 2026 08:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784530359;
	bh=imsUhZ4HtTzV1T/PzjVR65ka+wazCsrZQt/iCp09rxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcbQ0ZW5x5KA4FGVPdB1SXZVxV9z6hRugiw+UI4/nmcsV3AsO2JGVbWJTI3QePhak
	 RgOhAPVPkhPyr0PQ0D2S9dvX90nOnecbewFXYSh4FfX90YtmZaYGMKiB+k8zRimcY5
	 zn4AanDz+SRaCPJ3ovwW3psTD4rrwFsL9BejS5ic=
Date: Mon, 20 Jul 2026 09:53:37 +0300
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
Subject: Re: [PATCH v6 09/16] media: v4l2-subdev: Always call get_fmt() if
 set_fmt() is unavailable
Message-ID: <20260720065337.GG2208631@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-9-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Jul 01, 2026 at 03:26:26PM +0300, Sakari Ailus wrote:
> Many drivers implement set_fmt() pad op that simply returns the format
> just as get_fmt() would do, usually because the driver only supports a
> single one. As a driver should always implement set_fmt() either on its
> own or via get_fmt(), call get_fmt() in case set_fmt() isn't implemented
> by the driver. This allows removing a fair amount of boilerplate code as
> well as ensures that set_fmt() works whenever get_fmt() does.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 86be4d51c9a5..c2be59e4c4a7 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -260,8 +260,11 @@ static int call_set_fmt(struct v4l2_subdev *sd,
>  			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> -	return do_subdev_call(sd, check_format(sd, state, format), pad, set_fmt,
> -			      state, format);
> +	return check_format(sd, state, format) ? :
> +		sd->ops->pad->set_fmt ?
> +		sd->ops->pad->set_fmt(sd, state, format) :
> +		sd->ops->pad->get_fmt ?
> +		sd->ops->pad->get_fmt(sd, state, format) : -ENOIOCTLCMD;

This changes the behaviour: if neither operations are implemented, and
the format check fails, userspace will get an error from check_format()
instead of -ENOIOCTLCMD. It's probably not an issue in practice, but...

Also, the code becomes really unreadable.

	int ret;

	ret = check_format(sd, state, format);
	if (ret)
		return ret;

	if (sd->ops->pad->set_fmt)
		return sd->ops->pad->set_fmt(sd, state, format);
	if (sd->ops->pad->get_fmt)
		return sd->ops->pad->get_fmt(sd, state, format);

	return -ENOIOCTLCMD;

There's no tax on the number of lines of code.

If you want to avoid changing the behaviour, write

	int ret;

	if (!sd->ops->pad->set_fmt && !sd->ops->pad->get_fmt)
		return -ENOIOCTLCMD;

	ret = check_format(sd, state, format);
	if (ret)
		return ret;

	if (sd->ops->pad->set_fmt)
		return sd->ops->pad->set_fmt(sd, state, format);
	else
		return sd->ops->pad->get_fmt(sd, state, format);

Re-reading patch 08/16, I think it would also be more readable without
quite a few of the ternary operators. I'll leave that one up to you as
the code is already hard to read before 08/16.

>  }
>  
>  static int call_enum_mbus_code(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
