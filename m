Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81EA3CEB9E
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536582; cv=none; b=RBH73KZQ74Tp57YTDCy/dePQPT8MrXWBfnNvoaEM1Qd26ONy78lXrkbZK/gTz6r3G7RFhaXwMPfJ+dNxC+kyl1l363X+4XnLdF2sJuaLQljfO2u4/sJHX/z0K1ZxBEDurJzncNOLvExnulMJclAtlZX/uevZ9lOqK+qYNtA/eHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536582; c=relaxed/simple;
	bh=FZhNRzxNgnXB2cMvsAfOpTGIqrzrbchBlbuCNtMDYqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzHD6A5BpqZ4dGttW6ZwjqTAwldRphaWpS9MdotV5Z5o8i+EV4wLdIHIsdd9chDmSqjtoY7gbDhw0znEMwGv+uxWLbgFROzsXfQhYmfElVwSk8EQXfRtcsb5qdykWAycBIsweJy1ytCagz5HwDa0Wdyk55LlUOKgBbLiNw1pRd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKXybiCG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKXybiCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784536581; x=1816072581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FZhNRzxNgnXB2cMvsAfOpTGIqrzrbchBlbuCNtMDYqo=;
  b=LKXybiCGVvDucwJzApiKQQahQx7Ux51wKR4BRm46Y6SUAaJPcKYmYTeT
   mKyyltHO8WB/elHbI5XfXVcJKmtEq3LBm+ifhMKowgP6QR6yldBR7PO4v
   8kBnQjpmPG3KPRpY9D2KQYaDeFHg4jGtWAWvX3AC0Rg1DdyEahaQht2hC
   CAniG8D5hlXT9zmh+Zn8SR8NUW9ODvqPTUlagVxLpW1lTcq+oZpAHAoe2
   OdjoEdBAalj95yVS/14GUpj6LXVGCYGONiAHiTunOw9vSKXWVvLvTl2dE
   knnZ/bGWOroerxBVeX12dNxuDSd9LlcnXHFIg/MvgYI6rSSH7HMmxXz5V
   Q==;
X-CSE-ConnectionGUID: wKJ725RFSd6GSEX7e0lA3g==
X-CSE-MsgGUID: DlaHOCueRf6NzVahpM3e8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102661993"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="102661993"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 01:36:20 -0700
X-CSE-ConnectionGUID: raydDqUXSk+/3j4ISmuX6A==
X-CSE-MsgGUID: DFmkcoyUT42ox0tdsUYl+Q==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 01:36:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5DEFD121C02;
	Mon, 20 Jul 2026 11:36:16 +0300 (EEST)
Date: Mon, 20 Jul 2026 11:36:16 +0300
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
Subject: Re: [PATCH v6 09/16] media: v4l2-subdev: Always call get_fmt() if
 set_fmt() is unavailable
Message-ID: <al3eABfXasSzWFxk@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-9-sakari.ailus@linux.intel.com>
 <20260720065337.GG2208631@killaraus.ideasonboard.com>
 <al3Ry7tmWX0dnVpz@kekkonen.localdomain>
 <20260720082947.GA3679@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720082947.GA3679@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Jul 20, 2026 at 11:29:47AM +0300, Laurent Pinchart wrote:
> On Mon, Jul 20, 2026 at 10:44:11AM +0300, Sakari Ailus wrote:
> > On Mon, Jul 20, 2026 at 09:53:37AM +0300, Laurent Pinchart wrote:
> > > On Wed, Jul 01, 2026 at 03:26:26PM +0300, Sakari Ailus wrote:
> > > > Many drivers implement set_fmt() pad op that simply returns the format
> > > > just as get_fmt() would do, usually because the driver only supports a
> > > > single one. As a driver should always implement set_fmt() either on its
> > > > own or via get_fmt(), call get_fmt() in case set_fmt() isn't implemented
> > > > by the driver. This allows removing a fair amount of boilerplate code as
> > > > well as ensures that set_fmt() works whenever get_fmt() does.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 86be4d51c9a5..c2be59e4c4a7 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -260,8 +260,11 @@ static int call_set_fmt(struct v4l2_subdev *sd,
> > > >  			struct v4l2_subdev_state *state,
> > > >  			struct v4l2_subdev_format *format)
> > > >  {
> > > > -	return do_subdev_call(sd, check_format(sd, state, format), pad, set_fmt,
> > > > -			      state, format);
> > > > +	return check_format(sd, state, format) ? :
> > > > +		sd->ops->pad->set_fmt ?
> > > > +		sd->ops->pad->set_fmt(sd, state, format) :
> > > > +		sd->ops->pad->get_fmt ?
> > > > +		sd->ops->pad->get_fmt(sd, state, format) : -ENOIOCTLCMD;
> > > 
> > > This changes the behaviour: if neither operations are implemented, and
> > > the format check fails, userspace will get an error from check_format()
> > > instead of -ENOIOCTLCMD. It's probably not an issue in practice, but...
> > 
> > Indeed, that needs to be addressed.
> > 
> > > Also, the code becomes really unreadable.
> > 
> > I guess it's up to the reader; similar patterns are also used elsewhere in
> > the file -- and I don't think I've written them. :-) I'm fine with the code
> > you suggested below, too, and I'll use it for v7.
> 
> Thank you.
> 
> > > 
> > > 	int ret;
> > > 
> > > 	ret = check_format(sd, state, format);
> > > 	if (ret)
> > > 		return ret;
> > > 
> > > 	if (sd->ops->pad->set_fmt)
> > > 		return sd->ops->pad->set_fmt(sd, state, format);
> > > 	if (sd->ops->pad->get_fmt)
> > > 		return sd->ops->pad->get_fmt(sd, state, format);
> > > 
> > > 	return -ENOIOCTLCMD;
> > > 
> > > There's no tax on the number of lines of code.
> > > 
> > > If you want to avoid changing the behaviour, write
> > > 
> > > 	int ret;
> > > 
> > > 	if (!sd->ops->pad->set_fmt && !sd->ops->pad->get_fmt)
> > > 		return -ENOIOCTLCMD;
> > > 
> > > 	ret = check_format(sd, state, format);
> > > 	if (ret)
> > > 		return ret;
> > > 
> > > 	if (sd->ops->pad->set_fmt)
> > > 		return sd->ops->pad->set_fmt(sd, state, format);
> > > 	else
> > 
> > This else isn't useful.
> 
> It's not required, but I find it useful as it more clearly conveys the
> meaning here: if the set_fmt operation exists, call it, otherwise, call
> get_fmt. I think it's different than a
> 
>  	if (sd->ops->pad->set_fmt)
>  		return sd->ops->pad->set_fmt(sd, state, format);
> 
> 	return -ENOIOCTLCMD;
> 
> where the last statement is a "catch all".

I'd think the overall consensus would prefer to drop else -- whether or not
the statement related to it is directly related to the test. In fact, one
could say the get_fmt() call here is the remaining catch-all case, now that
we know get_fmt() exists and set_fmt() doesn't.

One solution could be of course to re-introduce the use of the ternary
operator here. :-)

-- 
Kind regards,

Sakari Ailus
