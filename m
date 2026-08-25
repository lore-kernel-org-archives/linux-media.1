Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932E3D3CE2
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 07:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643355; cv=none; b=fS1LUEAumPv+e3EnVDq1gG72liTdsar6fQJIqLU8pbcLF6OxaVY7B7cBEO2/wQxhtFAptOa8Fp5VQXqu5QdSny/NsVP3B6bTmcrfQrP5DSo7EqRVaR+WZMv8mKFyLzyztjLlYulELRDIdZxFT4cqqjISZQPR8InurTIYSpozY/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643355; c=relaxed/simple;
	bh=xXs48YmoUEJ/R7OZvNKIGzQomAC+YgOnaTpQbhhjLBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yc09tGl4JgnPv7JxA0LXY9vpknodMoSMu7muxNcLc592e3MUpRKuLCuVVL7RcMh2eCN4F5ZJ/TGCJYhR/SK8e6Q7FPSfoisBq451GQV9s9G2ZYw1p6UQufg0UIw5MBUc8exJ9E951MRWVJmA769hBODSDj950umBV8llF4CFihQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTysDP+L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTysDP+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787643353; x=1819179353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xXs48YmoUEJ/R7OZvNKIGzQomAC+YgOnaTpQbhhjLBU=;
  b=XTysDP+LO9JDWPwA135dtS5rPNLhAdZ/Gi9O1zepW3LeSwipmKRsieNz
   kwW0ABimIszQiEaMJ+PEyrXCGb0XEFxpORGTkX/xqt7igy8Zdc43ScCer
   ZZeau87OT/ZB17gtx+mC6YNx/AGd6tL5Nm9KstoyZggZ/xbMoXt8oa/19
   kKYNBZssU4l4EK4Bao20zFnlR6frjjTpihgYvbFrf6WVPdr7ygGlkVi7l
   vMTq+lFRnDy27EYqqpQT1HR3GTwERgMB88zdbynsNEuMDnjnIy89LVDCi
   8CEwAGM+5JS7BRToxDQWa0nvVtOU07tlWvEdxYAWycRRO4jixrQCA1FXr
   w==;
X-CSE-ConnectionGUID: BilXO3R3Rb6Yk76PW1L5oA==
X-CSE-MsgGUID: X5nkL9FmQhifsSH/oYO/zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105633777"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="105633777"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:35:51 -0700
X-CSE-ConnectionGUID: 9J3VVumCT+ST7GwoXYsdHQ==
X-CSE-MsgGUID: RfhdvC5xSTeE1l/T6Ei88g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="266667539"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.50])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:35:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B4B7412033D;
	Tue, 25 Aug 2026 10:36:00 +0300 (EEST)
Date: Tue, 25 Aug 2026 10:36:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 15/29] media: v4l2-subdev: Return dynamically
 allocated pass-through routes
Message-ID: <ao1F4LMQ9FjCl7-z@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-16-sakari.ailus@linux.intel.com>
 <aoyw4BDB21IgUc3V@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyw4BDB21IgUc3V@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Aug 24, 2026 at 05:00:16PM -0400, Frank Li wrote:
> On Mon, Aug 24, 2026 at 03:14:37PM +0300, Sakari Ailus wrote:
> > Count the number of pass-through routes, allocate memory and then return
> > the full table to the caller.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 61 +++++++++++++++++++++++----
> >  1 file changed, 52 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index c9f38b0313eb..d34704aad88e 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2561,13 +2561,42 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >  	struct media_pad *local_sink_pad;
> >  	struct v4l2_subdev_route *route;
> >  	struct device *dev = sd->dev;
> > -	int ret = 0;
> > +	unsigned int num_entries = 0;
> > +	int ret;
> >
> >  	lockdep_assert_held(state->lock);
> >
> >  	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
> >  		return -EINVAL;
> >
> > +	/* Count the number of entries first */
> > +	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
> > +		if (!(local_sink_pad->flags & MEDIA_PAD_FL_SINK))
> > +			continue;
> > +
> > +		for_each_active_route(&state->routing, route) {
> > +			if (route->source_pad != pad ||
> > +			    route->sink_pad != local_sink_pad->index)
> > +				continue;
> > +
> > +			num_entries++;
> > +
> > +			if (num_entries > V4L2_FRAME_DESC_ENTRY_MAX)
> > +				return -E2BIG;
> > +		}
> > +	}
> > +
> > +	if (num_entries > V4L2_FRAME_DESC_ENTRY_MAX)
> > +		return -E2BIG;
> > +
> > +	if (num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> > +		fd->entry = kzalloc_objs(*fd->entry, num_entries, GFP_KERNEL);
> 
> nit: Default should be GFP_KERNEL, needn't GFP_KERNEL when call kzalloc_objs()

I'll drop that in v4.

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thank you.

-- 
Regards,

Sakari Ailus
