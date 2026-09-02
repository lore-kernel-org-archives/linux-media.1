Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4B636C9D0
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350169; cv=none; b=SuIP15Buf+R0zcH/f+EhMlliz+AShrjqiXAczfG3QbOAq5jRrd0g8ISIcRXoz3bi0M9892ajXPtpMYo2PXb1d5RnwGXtnVECjuAtJbj8EqS8kAfnYSsFadfqTHG3H5/TTGPdUAYDnL4qZuSLTZmOvUj5B1sO5yi0F6CZFUAYDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350169; c=relaxed/simple;
	bh=KFTIeJwhnd2fBN6FfJMbvwZieEh7To0bj5uAqepWjPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm/5MCfPXF2inxYIwf0ERX9o+xXneRijSP1M0kDWNNxrXm2Nc23ynXvHIDyQuWRvR15/zocZNw/IPL5HrAuHPx4RqiU85xk2R84Xp+2Nkn2sPr33SS6uuHx4bA8JljHqmxOD1zZB9wacS8VvnpoUhu4V3vRW5mfxH7dyjLm4elA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gw9sKUY9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gw9sKUY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788350165; x=1819886165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KFTIeJwhnd2fBN6FfJMbvwZieEh7To0bj5uAqepWjPE=;
  b=Gw9sKUY9hJSQfi8wd38IDSiys9ipnTTNV+NpSNIqt4C+7Ljj3whnz6BG
   f35MLe4mCZQUTuMfsEXRBhmXxWMjoCdCAOHMLh6vei2KVjzdQpNNI/Z5m
   hvlI0k9AYUEZ9lExAs33P0r/7BivaLdwN/fy7eJ00YsYWNlRtUxF1oGvY
   ANA8O8ddl6Ot7v7lm5JAdTS6bf2tzRaJc3tgqOTlEjSPJ2lz18N/Qe2/E
   xKP0DjaLTNs/x0rOw6GXYTDpxpSCLRBAsBHxwcz5pmoi1gBdBYCoHqPYB
   tU2Q7KDL7fXeP4dp5o/6aHRFOlritv5titRiGD9qDItBOtCcv+JxdS4Sr
   g==;
X-CSE-ConnectionGUID: LDgCzJMDTLmnf2GLmfDifA==
X-CSE-MsgGUID: pAME/RRVQRWYf/jIj30EiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106173520"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="106173520"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:56:01 -0700
X-CSE-ConnectionGUID: Lm3jAS9ES3++diNB12cAhg==
X-CSE-MsgGUID: oQ/hVTP9SgmNevej0eoDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="292900059"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:55:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D73212150E;
	Wed, 02 Sep 2026 14:55:54 +0300 (EEST)
Date: Wed, 2 Sep 2026 14:55:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 03/29] media: v4l2-subdev: Prepare for changes in
 getting frame descriptors
Message-ID: <apgOyqUqaWvSBp3E@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-4-sakari.ailus@linux.intel.com>
 <CAD++jLniX0z41jCDZCpzE-LxuU3WPhDTWjYTAOeBGwmvAQH2uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLniX0z41jCDZCpzE-LxuU3WPhDTWjYTAOeBGwmvAQH2uw@mail.gmail.com>

Hej Linus,

On Mon, Aug 31, 2026 at 02:43:09PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Introduce v4l2_subdev_alloc_frame_desc()
> 
> The patch doesn't introduce this _alloc_ thing? Rather _get_ and _free_.

Right, this got renamed on the way; I'll fix it for v4.

> 
> > and v4l2_subdev_free_frame_desc()
> > to both facilitate implementing drivers that need frame descriptors as
> > well as prepare for having a larger number of frame descriptors.
> > If the remote sub-device does not support frame descriptors,
> > v4l2_subdev_get_frame_desc() creates one (with a single entry)
> > opportunistically, thus avoiding the need to add frame descriptor support
> > to sensor drivers the device for which only generates a single stream, or
> > managing the situation on the caller side.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> (...)
> 
> > +struct v4l2_mbus_frame_desc *
> > +v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +                          enum v4l2_mbus_frame_desc_type type)
> > +{
> > +       int ret;
> > +
> > +       if (type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> > +           type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > +               return ERR_PTR(-EINVAL);
> (...)
> > +
> > +       struct v4l2_mbus_frame_desc *desc = kzalloc_obj(*desc, GFP_KERNEL);
> > +       if (!desc)
> > +               return ERR_PTR(-ENOMEM);
> 
> I'm not used to this style of C where you declare variables in the
> middle of the code, but I suppose if this is common in the media
> framework I just have to get used to it.

It is the recommended way to declare objects that are to be released using
__free(), but I don't see an issue in doing that elsewhere either.

> 
> > +       struct v4l2_subdev_format subdev_fmt = {
> > +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > +               .pad = pad,
> > +       };
> 
> Ugh even inline struct variables.
> 
> > +       struct v4l2_subdev_state *state =
> > +               v4l2_subdev_lock_and_get_active_state(sd);
> 
> This can return NULL according to the definition:

Right. Actually this isn't even needed, the subdev call wrappers handle
this already. I'll drop it.

> 
> /**
>  * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active subdev
>  *                                           state for the subdevice
>  * @sd: The subdevice
>  *
>  * Returns the locked active state for the subdevice, or NULL if the subdev
>  * does not support active state.
>  *
>  * The state must be unlocked with v4l2_subdev_unlock_state() after use.
>  */
> static inline struct v4l2_subdev_state *
> v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> {
>         if (sd->active_state)
>                 v4l2_subdev_lock_state(sd->active_state);
>         return sd->active_state;
> }
> 
> > +       ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
> > +       v4l2_subdev_unlock_state(state);
> 
> ... and this call isn't gonna tolerate state being NULL because
> it will directly dereference state:
> 
> static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
> {
>         mutex_unlock(state->lock);
> }
> 
> Just some
> 
> if (!state)
>     goto err_free;
> 
> ?
> 
> Maybe you can just use v4l2_subdev_call() or v4l2_subdev_call_state_active()
> because they seem to be dealing with NULL already?

Yes.

-- 
Med trevliga hälsningar,

Sakari Ailus
