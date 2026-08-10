Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED3241834A
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375571; cv=none; b=juazqtAa/38AcvWRJ2YjH8x82ePMpFuCbMp6yu50np0chuCYjdwWKNqBuCggOIDrwB0Qqbhbga6izLhvS8iEZSvapixLmKycJ2aYMKZmrrHGbn2Iovd8IU36ZBg2Ayy/34CpSVO4MATZvzY8DB3GwJ+MSP69jAzgmLGTj7/Bg8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375571; c=relaxed/simple;
	bh=anIEJ6iooTgY1mXvenbYwdySJpsXKuEt19Cv4PMbzZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEbh/U6qCHFPY4WeEkCTdHHktVJXNmJ+Dj2IXSuhNZe/QOqKg/HBvLRGXY6Ido4Y6i5+Q99NKroM1TdKm7d8nRmKddnidSrPsS00APGz908JzzungB5+DRr0penR3bgNAhtP+7Wf4hk2VchV/oYJecI8zcZBAXZe9MNQCiCXtLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L7nbkel7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L7nbkel7"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79851BB;
	Mon, 10 Aug 2026 17:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786375492;
	bh=anIEJ6iooTgY1mXvenbYwdySJpsXKuEt19Cv4PMbzZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7nbkel7m3Bzp5+t3tWEH8vMt63sOXim5z4M2ZZnZKR1XdcEq6NmdFubb8euQqpY4
	 hx1uTiJTJpYuSqL6ywXQoqTkLaFEV0XJ1HQZmI6EVg30Aec3Tl4zsBlNfvOR6YhitE
	 tE5AHTUjUPFkV9xhRmEMuiS6V3W53aLTzdBcqBcM=
Date: Mon, 10 Aug 2026 18:26:05 +0300
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
Subject: Re: [PATCH v7 09/14] media: v4l2-subdev: Always call get_fmt() if
 set_fmt() is unavailable
Message-ID: <20260810152605.GA3011310@killaraus.ideasonboard.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807122409.45807-10-sakari.ailus@linux.intel.com>

On Fri, Aug 07, 2026 at 03:24:04PM +0300, Sakari Ailus wrote:
> Many drivers implement set_fmt() pad op that simply returns the format
> just as get_fmt() would do, usually because the driver only supports a
> single one. As a driver should always implement set_fmt() either on its
> own or via get_fmt(), call get_fmt() in case set_fmt() isn't implemented
> by the driver. This allows removing a fair amount of boilerplate code as
> well as ensures that set_fmt() works whenever get_fmt() does.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index f53bac995822..58e50d9442e7 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -260,8 +260,19 @@ static int call_set_fmt(struct v4l2_subdev *sd,
>  			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> -	return do_subdev_call(sd, check_format(sd, state, format), pad, set_fmt,
> -			      state, format);
> +	int ret;
> +
> +	if (!sd->ops->pad->set_fmt && !sd->ops->pad->get_fmt)
> +		return -ENOIOCTLCMD;
> +
> +	ret = check_format(sd, state, format);
> +	if (ret)
> +		return ret;
> +
> +	if (sd->ops->pad->set_fmt)
> +		return sd->ops->pad->set_fmt(sd, state, format);
> +
> +	return sd->ops->pad->get_fmt(sd, state, format);
>  }
>  
>  static int check_which_pad_state(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
