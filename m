Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535D38F65B
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904903; cv=none; b=WfFoRkjYBCmXThgNK9JLnoD0mDO78XsmjoFjqoezhuz25zQoQC7lg+qVW2D0vLrOW3p21JaU+JaCbsOWQvPFWJwyWUkY0XYT5MFKg+dP99z6sOtQbWNfkjXtIGlo3Kfijm5rXJjwXvBJP2ki/MPydVdY4dgLStK2BQlYudT/pME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904903; c=relaxed/simple;
	bh=rPlSCH07k7beK7rTmyI4fW8Cg88ntrqLKOxRrbRum/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOv6tmAzG+6W1opAqfRQlyf45PEC8O/MqjiKsYOopP7ijpi5URTg5/lVg8KHrh+mcBe3zTqAdVzy4lPVouJj2lRgVZWqpNKSlAwD0nImHirK1qwjlfJsxQd5PkuQwFBPk+fdZ+rGP+Qr7MnnnXEADfrlXENUkkhBzXDWt2Zdvgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=esuMs882; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="esuMs882"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93505447;
	Mon,  8 Jun 2026 09:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780904871;
	bh=rPlSCH07k7beK7rTmyI4fW8Cg88ntrqLKOxRrbRum/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esuMs882NYAGXJV5kf8VaBqCz6MBuCIq51wrNEtv9Utf9n4VxuQvoBua0ewJUjxSa
	 +xmBn/eBulXs9doyVmKLCor5WRYLndb9JZLFmgS4mbo0HVZp1pxLZY026Ol8VM6imT
	 frTDi+EASMGDCru+xcGEcWXIs44bskxJs96uHYCs=
Date: Mon, 8 Jun 2026 10:48:17 +0300
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
Subject: Re: [PATCH v5 09/10] media: v4l2-subdev: Add v4l2_subdev_get_fmt_ci()
Message-ID: <20260608074817.GE370380@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-10-sakari.ailus@linux.intel.com>

On Mon, Jun 08, 2026 at 12:53:55AM +0300, Sakari Ailus wrote:
> v4l2_subdev_get_fmt_ci() is just as v4l2_subdev_get_fmt(), but it also
> takes const struct v4l2_subdev_client_info * as its second argument. It
> can be used as set_fmt() pad op callback that simply returns the format
> from sub-device state.

If the sole purpose of this function is to be used as a .set_fmt()
handler for drivers that don't support setting the format, I'm wondering
if we shouldn't instead simplify drivers and allow .set_fmt() being
NULL. We could redirect .set_fmt() to .get_fmt() in the call_set_fmt()
wrapper. Except that v4l2_subdev_call() returns -ENOIOCTLCMD when the
operation is NULL. We could swap the two conditions in the
v4l2_subdev_call() macro:

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f84..5392eca46a24 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1935,12 +1935,12 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		int __result;						\
 		if (!__sd)						\
 			__result = -ENODEV;				\
-		else if (!(__sd->ops->o && __sd->ops->o->f))		\
-			__result = -ENOIOCTLCMD;			\
 		else if (v4l2_subdev_call_wrappers.o &&			\
 			 v4l2_subdev_call_wrappers.o->f)		\
 			__result = v4l2_subdev_call_wrappers.o->f(	\
 							__sd, ##args);	\
+		else if (!(__sd->ops->o && __sd->ops->o->f))		\
+			__result = -ENOIOCTLCMD;			\
 		else							\
 			__result = __sd->ops->o->f(__sd, ##args);	\
 		__result;						\


and add a NULL checks in the call_*() wrappers in v4l2-subdev.c.

Would that be too complex ?

> To be squashed to the previous patch.

Why so ?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c |  9 +++++++++
>  include/media/v4l2-subdev.h           | 18 ++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e4ac6981e950..c1e1fb9d6773 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1953,6 +1953,15 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>  
> +int v4l2_subdev_get_fmt_ci(struct v4l2_subdev *sd,
> +			   const struct v4l2_subdev_client_info *ci,
> +			   struct v4l2_subdev_state *state,
> +			   struct v4l2_subdev_format *format)
> +{
> +	return v4l2_subdev_call(sd, pad, get_fmt, state, format);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt_ci);
> +
>  int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *state,
>  				   struct v4l2_subdev_frame_interval *fi)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e83ef88fe12c..e29defed6409 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1488,6 +1488,24 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format);
>  
> +/**
> + * v4l2_subdev_get_fmt_ci() - Get pad format using get_fmt pad op
> + * @sd: subdevice
> + * @ci: client info
> + * @state: subdevice state
> + * @format: pointer to &struct v4l2_subdev_format
> + *
> + * Obtain the sub-device format by calling the sub-device get_fmt pad op. This
> + * is intended to be used as the set_fmt callback when the callback just needs
> + * to return the format.
> + *
> + * Returns 0 on success, error value otherwise.
> + */
> +int v4l2_subdev_get_fmt_ci(struct v4l2_subdev *sd,
> +			   const struct v4l2_subdev_client_info *ci,
> +			   struct v4l2_subdev_state *state,
> +			   struct v4l2_subdev_format *format);
> +
>  /**
>   * v4l2_subdev_get_frame_interval() - Fill frame interval based on state
>   * @sd: subdevice

-- 
Regards,

Laurent Pinchart
