Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3AF33FE05
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994911; cv=none; b=C6OQ+DHzY0WZZoihu1mKfjaLYKoyyZfsqDQqFIq5AM006Yg1A8OIlEkJMIZNp3BLc1AajUeRGFCNr+Z6rtK5tKMOSRyQwgZrb8qWLCgL55nY63V6Opg6AtvpKLK8HMpW0aA+aCI9URNsDRBUKBq0Za4n1dDNpzJx537GO1/2P2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994911; c=relaxed/simple;
	bh=VQwymPV3vaTOOjfnGHE+QgGR8PGzLRzu8nR9Ve7U8qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoI+EWJtvaSYap9j/c87UmBFwqHK2Ak4yYt1cMTZAjBiN8l1jX9WUKtlUo6iFfLx3w/Q994GhdtbzccqVoFV0Mg6vREKVgyv47LKCA3QEKXgboPcBnXJvMfA58AeNUNlCTPyl4Xg4OaVQkPzi1PEKruQfAHWA/3y+3XG/H52oBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SDK9OhfE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SDK9OhfE"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C0D7CF5;
	Fri, 13 Feb 2026 16:00:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770994856;
	bh=VQwymPV3vaTOOjfnGHE+QgGR8PGzLRzu8nR9Ve7U8qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDK9OhfEjx3iuFrsTwZTgfrqWis9nqRegD4uablHjNQEXspIMWC3pJJkNmenP8slF
	 4tXnsVP0XIwnMYJ1qi0kmRiFPeCsxFaJ+LVrgXUvVJO5GVAYIDy16PoTLwGrHajZx2
	 XQsrdLuJoXxUjIZRq7jLHhfWPtqqxdWfza8jRLuE=
Date: Fri, 13 Feb 2026 16:01:41 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 05/14] media: v4l2-subdev: Refactor returning routes
Message-ID: <aY87XgH0avmszN3-@zed>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211090920.1851141-6-sakari.ailus@linux.intel.com>

Hi Sakari

On Wed, Feb 11, 2026 at 11:09:11AM +0200, Sakari Ailus wrote:
> Refactor returning the routes by adding a new function that essentially
> does a memcopy and sets the number of the number of the routes in the
> routing table.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++------------
>  1 file changed, 22 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b2105c34478e..8a433d074587 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -629,6 +629,19 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  			     v4l2_subdev_get_unlocked_active_state(sd);
>  }
>
> +static void subdev_copy_fix_routes(struct v4l2_subdev_routing *routing,

or just subdev_copy_routes()

> +				   const struct v4l2_subdev_route *src,
> +				   u32 copy_routes, u32 num_routes)
> +{
> +	struct v4l2_subdev_route *routes =
> +		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> +
> +	for (u32 i = 0; i < copy_routes; i++)

Shouldn't this copy the min(copy_routes, num_routes) as the callers
used to do ?

Even better, shouldn't we just accept one 'dest' and one 'source'
v4l2_subdev_routing arguments and make sure we don't copy more than
min(dest->num_routes, source->num_routes) ?

Having the number of routes being passed in by the caller opens the
door for memory errors.


> +		routes[i] = src[i];
> +
> +	routing->num_routes = num_routes;
> +}
> +
>  static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  			    struct v4l2_subdev_state *state)
>  {
> @@ -1000,7 +1013,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>
>  	case VIDIOC_SUBDEV_G_ROUTING: {
>  		struct v4l2_subdev_routing *routing = arg;
> -		struct v4l2_subdev_krouting *krouting;
>
>  		if (!v4l2_subdev_enable_streams_api)
>  			return -ENOIOCTLCMD;
> @@ -1013,13 +1025,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>
>  		memset(routing->reserved, 0, sizeof(routing->reserved));
>
> -		krouting = &state->routing;
> -
> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -		       krouting->routes,
> -		       min(krouting->num_routes, routing->len_routes) *
> -		       sizeof(*krouting->routes));
> -		routing->num_routes = krouting->num_routes;
> +		subdev_copy_fix_routes(routing, state->routing.routes,
> +				       routing->len_routes,
> +				       state->routing.num_routes);
>
>  		return 0;
>  	}
> @@ -1090,11 +1098,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		 * the routing table.
>  		 */
>  		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> -			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -			       state->routing.routes,
> -			       min(state->routing.num_routes, routing->len_routes) *
> -			       sizeof(*state->routing.routes));
> -			routing->num_routes = state->routing.num_routes;
> +			subdev_copy_fix_routes(routing, state->routing.routes,
> +					       routing->len_routes,
> +					       state->routing.num_routes);
>
>  			return 0;
>  		}
> @@ -1108,11 +1114,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (rval < 0)
>  			return rval;
>
> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -		       state->routing.routes,
> -		       min(state->routing.num_routes, routing->len_routes) *
> -		       sizeof(*state->routing.routes));
> -		routing->num_routes = state->routing.num_routes;
> +		subdev_copy_fix_routes(routing, state->routing.routes,
> +				       routing->len_routes,
> +				       state->routing.num_routes);
>
>  		return 0;
>  	}
> --
> 2.47.3
>
>
