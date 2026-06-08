Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42843B4EAB
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910962; cv=none; b=mpM+iHyC1PumiqcbHpao2JkIntteU5pI0oy8G/9/vblEzH75pKQ9zJ+f5GrV1WEymgnPIzGhBlKCazr8T70yZkr/RKpk0hEVd9We8vOPUMwHhhS3dpbMAHgVKtmzM1P4aRDvgWJIsFkKa2CPxS0Z87pFEzpw6QXjLF/QPfGVIKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910962; c=relaxed/simple;
	bh=YMbphauo4ulRjqySEBCfY+b9QqGpDXjkD2V2cDTynUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYa3S/C8ftKWJEHG27WcEnnyFZHDfomY78BRJoQntysLCaA44VzqHKv4bF54kELMjFWjMAjb/0qsMlCkQPZzTY1Owwvxhdi3XzGGEZMWYi/jjo2UAWkXmNTy+xuDoAgMEoPIiig9YQ86Ptti/aAj0hjr65v2faOzY1DjCQTFq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QN6HUd0B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QN6HUd0B"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A72B2D7;
	Mon,  8 Jun 2026 11:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780910930;
	bh=YMbphauo4ulRjqySEBCfY+b9QqGpDXjkD2V2cDTynUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QN6HUd0Bs62wvlJEmXOa1nJvu0h1nWZPL6DvAkMypH3h72t8+xHlDuWjMRzQKekcj
	 AUNNmnZP1aFsDM/9hjIgEFLSKrqqwr8dB7EYvE4eagPlAMRe0n5HyLeH7XGMKfOUwJ
	 Pt/xJwPbmam1G5c/kVQjl1RWFJ84W+0TvHoiaJz4=
Date: Mon, 8 Jun 2026 12:29:16 +0300
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
Subject: Re: [PATCH v5 07/10] media: Improve enable_streams and
 disable_streams documentation
Message-ID: <20260608092916.GC772117@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-8-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Jun 08, 2026 at 12:53:53AM +0300, Sakari Ailus wrote:
> Document that enable_streams may start additional streams and
> disable_streams may not disable requested streams if other related streams
> are still enabled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  include/media/v4l2-subdev.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 0361c8bbee38..a25234befbe9 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -828,6 +828,10 @@ struct v4l2_subdev_state {
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
>   *
> + *	Starting the requested streams may require starting additional
> + *	streams. Streams that are started and stopped together due to hardware
> + *	are called a stream group.

This is too vague. "may require starting additional streams" can be
understood as the driver starting more streams than the requested ones,
or as the caller having to start more streams before the requests
streams are effectively started.

Here's a proposal to clarify the documentation:

 * Due to device constraints, starting the requested streams may result in
 * additional streams also being started by the driver. Streams that are started
 * and stopped together due to the nature of the hardware are called a stream
 * group.

"hardware" may be a bit restrictive, I wonder if those constraints could
also sometimes come from the software implementation instead of being
pure hardware constraints. I think it's fine for now though, we can
clarify this later if needed.

> + *
>   * @disable_streams: Disable the streams defined in streams_mask on the given
>   *	source pad. Subdevs that implement this operation must use the active
>   *	state management provided by the subdev core (enabled through a call to
> @@ -837,6 +841,10 @@ struct v4l2_subdev_state {
>   *	Drivers that support only a single stream without setting the
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
> + *
> + *	Stopping the requested streams may be delayed due to other enabled
> + *	streams in the stream group, where all streams are started and stopped
> + *	together.

This is better. I would have written

 * When the requested stream are part of a stream group, they will be stopped
 * once all streams in the group are stopped.

to make it clearer that the streams won't be stopped immediately ("may"
in the original text implies they may or may not be stopped
immediately), but I'm also OK with your text.

>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
