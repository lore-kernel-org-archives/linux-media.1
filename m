Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F037DEAA
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928929; cv=none; b=taYePZ20CaFncvvLNSsoiWe1W6qNu/qcXSw7A0TghLntoGnC4W9maXV9utjlF5/CudGhqKLaJEFOEkejuv2eaGmyutjRrtJtFvpKm+hvWn49mFfpyWlDCNLy+Eeve9I6QTeTMwaxbNPu6SXddFhM+wpqJ5zlFGQrBYUe6cTzzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928929; c=relaxed/simple;
	bh=isdBuVGUzycA2a+WkH7EfnC7E35xb302PEHo/nMT/Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkDcn9HlYd4hkRwXHZt7rRLf3JOmR1ahvdQHtDtUIomH8Tcga4nUxRWkAFMnGIDF4qZmZzEd5EKNJ+roOoRdjIM0/WuaoDWr4gWjXrxsXD1nWMKEa94tpTWzudIVR3cDmfj3OxnkS/pjaLSrr8obbGqB+xWxEwcZDuzdkzr+w2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcOcqkP3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcOcqkP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780928928; x=1812464928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=isdBuVGUzycA2a+WkH7EfnC7E35xb302PEHo/nMT/Dw=;
  b=EcOcqkP3aIvEXfug7FJhZz+/H+Aw40UeGl+NE7eDWvI02KmwOikq8Xnp
   KVawmdRG0dL/LI1a2731jyx2cAy23hFZahsPnYVGALP/XdmlGNBs0tdxw
   Tzf+EYS+kFRMzYTig4Zmu94GRgZhH/gRL0aVMEoWzlc4XXYACQURd5u19
   No/sxJk6p+ZRi4NEw7u2/57eyTutPYpT7+gsCMwB2dEAI7VidbL3efJX4
   KgjEMVyCMoaHA3JafAEV/uhIXdNi6yp31iiaUX3ZSGtbe1jbQBZfU9fdS
   z4NEN9MtbhJ5e+26lCwIYuVgHeKsYYL+VhW+jB8d/xidCTKZiF5zKayss
   Q==;
X-CSE-ConnectionGUID: IToOexb+S8eADAIZAwRLeQ==
X-CSE-MsgGUID: b3DIsvZ1RrGs/q8MsSBJvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="69197622"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="69197622"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:28:47 -0700
X-CSE-ConnectionGUID: IBXBxtt/Scy4TwyBLy3JiQ==
X-CSE-MsgGUID: 8VTpLQgZSUOV/jY6DxyfJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="245426090"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:28:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 47D78121C67;
	Mon, 08 Jun 2026 17:28:37 +0300 (EEST)
Date: Mon, 8 Jun 2026 17:28:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
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
Message-ID: <aibRlZ1uK5-SsO__@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-8-sakari.ailus@linux.intel.com>
 <20260608092916.GC772117@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608092916.GC772117@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Jun 08, 2026 at 12:29:16PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Jun 08, 2026 at 12:53:53AM +0300, Sakari Ailus wrote:
> > Document that enable_streams may start additional streams and
> > disable_streams may not disable requested streams if other related streams
> > are still enabled.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >  include/media/v4l2-subdev.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 0361c8bbee38..a25234befbe9 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -828,6 +828,10 @@ struct v4l2_subdev_state {
> >   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> >   *	argument.
> >   *
> > + *	Starting the requested streams may require starting additional
> > + *	streams. Streams that are started and stopped together due to hardware
> > + *	are called a stream group.
> 
> This is too vague. "may require starting additional streams" can be
> understood as the driver starting more streams than the requested ones,
> or as the caller having to start more streams before the requests
> streams are effectively started.
> 
> Here's a proposal to clarify the documentation:
> 
>  * Due to device constraints, starting the requested streams may result in
>  * additional streams also being started by the driver. Streams that are started
>  * and stopped together due to the nature of the hardware are called a stream
>  * group.
> 
> "hardware" may be a bit restrictive, I wonder if those constraints could
> also sometimes come from the software implementation instead of being
> pure hardware constraints. I think it's fine for now though, we can
> clarify this later if needed.
> 
> > + *
> >   * @disable_streams: Disable the streams defined in streams_mask on the given
> >   *	source pad. Subdevs that implement this operation must use the active
> >   *	state management provided by the subdev core (enabled through a call to
> > @@ -837,6 +841,10 @@ struct v4l2_subdev_state {
> >   *	Drivers that support only a single stream without setting the
> >   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> >   *	argument.
> > + *
> > + *	Stopping the requested streams may be delayed due to other enabled
> > + *	streams in the stream group, where all streams are started and stopped
> > + *	together.
> 
> This is better. I would have written
> 
>  * When the requested stream are part of a stream group, they will be stopped
>  * once all streams in the group are stopped.
> 
> to make it clearer that the streams won't be stopped immediately ("may"
> in the original text implies they may or may not be stopped
> immediately), but I'm also OK with your text.

I'll use your text in v6. I presume Jacopo and Mirela agree. :-)

-- 
Regards,

Sakari Ailus
