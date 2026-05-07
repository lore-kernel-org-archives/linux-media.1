Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B5230BF68
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158444; cv=none; b=LRuBvoCCaAJtkGicaI6T5qbwzG8FBFUHJdhu7IYI+GWz3fCZjBUXA2c6lBtpVY+jNtBns1aWOr65b9nFdAxx1PmQtGE3jwZroSVdBG1N1G0e/bSJAfUPCH+MIxLhsgPuX19WHSqixEmiRG4+Ttq/9WcN75NQCJF2wWOxN+r0ZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158444; c=relaxed/simple;
	bh=sfY8wDEVtbOIui257lRdEaOX71eMESJ3H9NAXbXTgcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkcMi/U4IzAD5PlP7kkvO8ATvo+fFMaZ7FAju+MCONe8Yff5Ighv1j7rMNGMPpEgQPmKG6LCpKf97wfWY/U4FnwyOW9WUIhK+mixjwHwzUOgGmKZjZ/uqu2ckZ0LZFM68Xf/OOh7wPheUHBYq5zod3Cp9r14sQIENK5DyKP1dZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PG8+iT92; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PG8+iT92"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D023664;
	Thu,  7 May 2026 14:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778158437;
	bh=sfY8wDEVtbOIui257lRdEaOX71eMESJ3H9NAXbXTgcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG8+iT929M+Nam/p6sohZf03BAIPb61aYAyEExc79QQB2Lk8gPPxk1ddCAb5FZYhX
	 9HHOp6FF7hn3Ef6UH2CeCRvYWm+IcVC/HZ4AS7omXbXoeNAcIt8ntBvL+yMBS7OVq3
	 0u1JxLn+owjsONYrO2V3PxHWXKxpS+SP+EPNeYUg=
Date: Thu, 7 May 2026 15:54:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/2] media: mc-entity: Drop ifdef for
 media_entity_cleanup definition
Message-ID: <20260507125400.GC1938994@killaraus.ideasonboard.com>
References: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
 <20260506165438.1767378-2-laurent.pinchart@ideasonboard.com>
 <afyJk_qcsuTt8gxf@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afyJk_qcsuTt8gxf@zed>

On Thu, May 07, 2026 at 02:48:23PM +0200, Jacopo Mondi wrote:
> On Wed, May 06, 2026 at 07:54:38PM +0300, Laurent Pinchart wrote:
> > The media_entity_cleanup() function is defined in media-entity.h as a
> > static inline no-op when CONFIG_MEDIA_CONTROLLER is enabled, and as a
> > no-op macro otherwise. This complexity is unneeded. Use a static inline
> > function in all cases.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  include/media/media-entity.h | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index 904f61c14dc1..d9b72cd87d52 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -729,11 +729,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >   * zeroed but that has not been initialized with media_entity_pads_init() is
> >   * valid and is a no-op.
> 
> I wonder if the documentation really applies
> 
>  * Calling media_entity_cleanup() on a media_entity whose memory has been
>  * zeroed but that has not been initialized with media_entity_pad_init() is
>  * valid and is a no-op.
> 
> But a few lines above it says
> 
>  * This function must be called during the cleanup phase after unregistering
>  * the entity (currently, it does nothing).
> 
> Not that the documentation is wrong, but if the functions is a nop, of
> course it is valid to call it on non initialized entities :)

We could probably drop the "currently, it does nothing" part. It's true,
but not relevant. The function was added because we thought we will at
some point have to perform cleanup tasks, and patching lots of drivers
to add cleanup calls then would be error-prone.

> >   */
> > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > -static inline void media_entity_cleanup(struct media_entity *entity) {}
> > -#else
> > -#define media_entity_cleanup(entity) do { } while (false)
> > -#endif
> > +static inline void media_entity_cleanup(struct media_entity *entity)
> > +{
> > +}
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >
> >  /**
> >   * media_get_pad_index() - retrieves a pad index from an entity

-- 
Regards,

Laurent Pinchart
