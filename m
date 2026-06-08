Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3F2BDC0B
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929362; cv=none; b=AvUp1Rm7FBu+GVHLyPE8lTrx524XcFcM2MINd2Wr2t6240lNlUXC1Ojr4Wnua0G1yPoKflpj2gasgWo8P91LRAmkIWbA6RaL3FOFzmq5eA6stOaJGuXeuiKCW7p/eXWttIB6ZSpyR1DzZaig4bbFzaaz6qOH0woV8qPYhYxcDSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929362; c=relaxed/simple;
	bh=S9qNJ2BT7QSCRKrLQsy5wRD1ra40CIHwTTxAHe+ySek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrkdxQ/bbNdE1sS1SrrS9uvOgvySyKaDP9eFtvs1iWe9pYg5sGnA376k+9ECWDe2O2ef1425F+EVbSZHOle+x42uAPrU/GNpWLPSI0XVrQ3/MND1RirlQzg5W3PdwCVUlR2/oHJbjxMovoKsjI+rgkRZbxxDtExH0/Venb8Ekks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mANTwFy1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mANTwFy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780929362; x=1812465362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S9qNJ2BT7QSCRKrLQsy5wRD1ra40CIHwTTxAHe+ySek=;
  b=mANTwFy1RaLxxtBjPUUFNSInyCLBl/j0R6gCwoS4+TmDV0vkFpZ/MylN
   mVDSUfXhgCN0bzq9ut816h15rf/kCJTxnb45bQOcYNxvc0yrJ31+wqYSI
   C4mqqbu8tWsDzDGg8euOUtnVbOhuQT0ZEJ0yGxRxX8KD8nHl+NXgQHrKL
   /82reSqRzgX7YEfd6XmJzWhzdT5f+oyDXm6e6BF4V5thhBXTrVCU247fv
   k4Hct/DTnBF0czvO6PMoKmJjmOdPLtkkjr9nSdEuygWsO3Qffuu7HQmCS
   oR/hUEIpe9teIjHo8r0Sk8HRUj/mFxK/6dAYyCHtO0smiZKt/MuGmfswl
   A==;
X-CSE-ConnectionGUID: y7ZDkT85Rlqfd37ASPPzHg==
X-CSE-MsgGUID: X72UE6Y0TYmC4wXRfJ658w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="107106220"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="107106220"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:36:01 -0700
X-CSE-ConnectionGUID: B9qnfXqcR2SRyIPtQq/YaQ==
X-CSE-MsgGUID: 5mpgzmKzSYqKzaTXjN30lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="239233707"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:35:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EA0BC121C67;
	Mon, 08 Jun 2026 17:35:52 +0300 (EEST)
Date: Mon, 8 Jun 2026 17:35:52 +0300
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
Subject: Re: [PATCH v5 08/10] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <aibTSBhb4nxDgGq4@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-9-sakari.ailus@linux.intel.com>
 <20260608093436.GD772117@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608093436.GD772117@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Jun 08, 2026 at 12:34:36PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Jun 08, 2026 at 12:53:54AM +0300, Sakari Ailus wrote:
> > Add struct v4l2_subdev_client_info to hold sub-device client capability
> > bits that used to be stored in the client_caps field of struct
> > v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> > pad operation callbacks for capability information. The main reason why
> > this is a new struct instead of a u64 field is that modifying the callback
> > arguments requires touching almost every sub-device driver and that is
> > desirable to avoid in the future, should more than the client capability bits
> > need to be known to the callbacks.
> > 
> > To be squashed to the previous patch.
> 
> This seems to be a leftover, patch 07/10 is unrelated.

Yes, I'll drop it.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
> >  include/media/v4l2-subdev.h           | 12 ++++++++++--
> >  2 files changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index dc4ac08c210f..e4ac6981e950 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -634,7 +634,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> >  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
> >  		struct v4l2_subdev_frame_interval *fi = arg;
> >  
> > -		if (!(subdev_fh->client_caps &
> > +		if (!(subdev_fh->ci.client_caps &
> >  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
> >  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >  
> > @@ -673,7 +673,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> >  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
> >  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> > -	bool client_supports_streams = subdev_fh->client_caps &
> > +	bool client_supports_streams = subdev_fh->ci.client_caps &
> >  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> >  	int rval;
> >  
> > @@ -1133,7 +1133,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
> >  		struct v4l2_subdev_client_capability *client_cap = arg;
> >  
> > -		client_cap->capabilities = subdev_fh->client_caps;
> > +		client_cap->capabilities = subdev_fh->ci.client_caps;
> >  
> >  		return 0;
> >  	}
> > @@ -1153,7 +1153,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
> >  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
> >  
> > -		subdev_fh->client_caps = client_cap->capabilities;
> > +		subdev_fh->ci.client_caps = client_cap->capabilities;
> >  
> >  		return 0;
> >  	}
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index a25234befbe9..e83ef88fe12c 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -741,6 +741,14 @@ struct v4l2_subdev_state {
> >  	struct v4l2_subdev_stream_configs stream_configs;
> >  };
> >  
> > +/**
> > + * struct v4l2_subdev_client_info - Sub-device client information
> > + * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> > + */
> > +struct v4l2_subdev_client_info {
> > +	u64 client_caps;
> 
> As this is now part of a structure called *client* info, maybe the field
> could be named just "caps" ?

Sounds good.

> 
> > +};
> > +
> >  /**
> >   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
> >   *
> > @@ -1144,14 +1152,14 @@ struct v4l2_subdev {
> >   * @vfh: pointer to &struct v4l2_fh
> >   * @state: pointer to &struct v4l2_subdev_state
> >   * @owner: module pointer to the owner of this file handle
> > - * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> > + * @ci: sub-device client info related to this file handle
> 
> I'm not a fan of "ci", I would write client_info to make the code more
> explicit.

Shorter names are typically used for function arguments and I'd prefer to
use the same name here. I don't have a strong opinion about this though.

> 
> >   */
> >  struct v4l2_subdev_fh {
> >  	struct v4l2_fh vfh;
> >  	struct module *owner;
> >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	struct v4l2_subdev_state *state;
> > -	u64 client_caps;
> > +	struct v4l2_subdev_client_info ci;
> >  #endif
> >  };
> >  
> 

-- 
Regards,

Sakari Ailus
