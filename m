Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC2C390CB2
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529251; cv=none; b=cWLophJDfwlHqVEM8eCcBg5FDnt9R1R70Rsqflc9xkxJk+xGqhqf99u8I94m33lo93XL2knYda6Q1+wpwho7kTX5XwVlMShkp3m5JPlv88N8s1WETa535DVTXLHQG+qPQTMw85C97ziLBm2fKz9DH6HgsF68PFkSkm/iuufAyrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529251; c=relaxed/simple;
	bh=Vm4o7nWqcGxeFQ0nZC867PltdGPy5HZSHaWxwr+TqUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyR2cLeAvxK5iQ+/MwKib+g1ga+DKiLBzDBpXazCQrCLdqhNSI8MhdkXOWQxi2vTWhOtm5hIbvz5eZTokFjCPOXV+8hrile/HW9y4/gi6Moz5d7gUz+uuh81/StrQ254PyZQNXxbWgXELU1qdz2OzD9A+zA54SVbQvPFB1gFnzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QvC1vliU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QvC1vliU"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B1EEC1;
	Mon, 20 Jul 2026 08:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784529188;
	bh=Vm4o7nWqcGxeFQ0nZC867PltdGPy5HZSHaWxwr+TqUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvC1vliU5A8io3KF+xfyB89iM1h3uHPnpWOz7ijto7Hvqq8czcWCQ6vZTI60v39/o
	 vw7AR+Yx1elLkxPy04viI57r77xBF0uEDw6LRJpjwUo2V3YBG3MNpN9M87OKi07vaq
	 ruy7IxNqbTDWaS6Lisj/tx7qChGEzoJKSNy60KOQ=
Date: Mon, 20 Jul 2026 09:34:04 +0300
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
Subject: Re: [PATCH v6 06/16] media: Improve enable_streams and
 disable_streams documentation
Message-ID: <20260720063404.GC2208631@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Jul 01, 2026 at 03:26:23PM +0300, Sakari Ailus wrote:
> Document that enable_streams may start additional streams and
> disable_streams may not disable requested streams if other related streams
> are still enabled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/v4l2-subdev.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d256b7ec8f84..d9dca6905b33 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -814,6 +814,11 @@ struct v4l2_subdev_state {
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
>   *
> + *	Due to device constraints, starting the requested streams may result in
> + *	additional streams also being started by the driver. Streams that are
> + *	started and stopped together due to the nature of the hardware are
> + *	called a stream group.
> + *
>   * @disable_streams: Disable the streams defined in streams_mask on the given
>   *	source pad. Subdevs that implement this operation must use the active
>   *	state management provided by the subdev core (enabled through a call to
> @@ -823,6 +828,9 @@ struct v4l2_subdev_state {
>   *	Drivers that support only a single stream without setting the
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
> + *
> + *	When the requested stream are part of a stream group, they will be
> + *	stopped once all streams in the group are stopped.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
