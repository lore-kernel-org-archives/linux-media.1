Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D4E3CE49F
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855289; cv=none; b=Sl2+0U9Xe49GlP9nN1NncxYAbKqaYyVjrJXZgs9/BtehswdYgWX3FAs+HH/rmIC/fvT8zOAvnrHW0f4/aNesyBkY2v0rTYXmrMVEfLNjIWmJvVXSdS4XlG1dQG3lmVcN/63h416frLLV3jZSisJMXCkiruOOQT1PdsflmhwaAeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855289; c=relaxed/simple;
	bh=t+uuTImEkbEOI3ce1Jrrqtq/UpnHcZaX5K8Q5+ED68A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzewYMONBL1cHNqCHgJ9Zml7pmrnZ8eTmXO/YvfjWJSnS+2Xw8pit1cECf9ZX5CIS+zoHWpiVqGKJVer96iQ7LqDw0iEZaNGdsjigItB4gg2k4Ufswp4GOZaMFfxAGrKDA+32F+vtJ9yND4uvq6YgUYIO5FECQp3jo5cDp6IsQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aQqFPu2I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aQqFPu2I"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21AF0227;
	Wed, 22 Apr 2026 12:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776855185;
	bh=t+uuTImEkbEOI3ce1Jrrqtq/UpnHcZaX5K8Q5+ED68A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQqFPu2IVwfMvGM62c3bW/wV2NFBSxr3Sr7Ma7KGUXmmTwuujNQqaUHl6TdbYdiYG
	 oSF/kqXjPBJsQYuMYnVgCF9nqH2/KmfBRM8QLTKVDev9TAuPjbtJG2RmudGR1TfXJE
	 bYuDulySlIubmwflSyPZBlFhZ8EKTgqNT5BnCm7k=
Date: Wed, 22 Apr 2026 13:54:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 24/29] media: v4l2-subdev: Introduce
 v4l2_subdev_get_frame_desc()
Message-ID: <20260422105442.GH2315844@killaraus.ideasonboard.com>
References: <adjWaqk9qO7CWM5W@zed>
 <adykK0JxoIoZjWUT@kekkonen.localdomain>
 <20260416161654.GC1823068@killaraus.ideasonboard.com>
 <aedrEm-Mh21TnJ4N@kekkonen.localdomain>
 <20260421221817.GF2315844@killaraus.ideasonboard.com>
 <aeiGUIFh3UOp6ksw@kekkonen.localdomain>
 <20260422090256.GA2807981@killaraus.ideasonboard.com>
 <aeicuM9S6_x1zNpb@kekkonen.localdomain>
 <20260422104729.GG2315844@killaraus.ideasonboard.com>
 <aeinmhXvBnVMvpQS@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeinmhXvBnVMvpQS@kekkonen.localdomain>

On Wed, Apr 22, 2026 at 01:48:58PM +0300, Sakari Ailus wrote:
> On Wed, Apr 22, 2026 at 01:47:29PM +0300, Laurent Pinchart wrote:
> > On Wed, Apr 22, 2026 at 01:02:32PM +0300, Sakari Ailus wrote:
> > > On Wed, Apr 22, 2026 at 12:02:56PM +0300, Laurent Pinchart wrote:
> > > > > > > > > > > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > > > > > > > > +			       struct v4l2_mbus_frame_desc *desc)
> > > > > > > > > > > +{
> > > > > > > > > > > +	struct v4l2_subdev_format subdev_fmt = {
> > > > > > > > > > > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > > > > > > > > +		.pad = pad,
> > > > > > > > > > > +	};
> > > > > > > > > > > +	int ret;
> > > > > > > > > > > +
> > > > > > > > > > > +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > > > > > > > > > > +		unsigned int type = desc->type;
> > > > > > > > > > > +
> > > > > > > > > > > +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> > > > > > > > > > > +
> > > > > > > > > > > +		if (desc->type != type)
> > > > > > > > > > > +			return -EINVAL;
> > > > > > > > 
> > > > > > > > I'd add a dev_err() here. There are .get_frame_desc() callers that check
> > > > > > > > if the returned type matches what they expect and log an error
> > > > > > > > otherwise. When using this helper the check can't be performed in the
> > > > > > > > callera any more, leading to possibly hard to debug issues if no message
> > > > > > > > is printed.
> > > > > > > 
> > > > > > > dev_err_once()?
> > > > > > 
> > > > > > Is there a need to limit it to printing the message once only ? It will
> > > > > > only occur if an incompatible source is connected, which shouldn't
> > > > > > happen in normal circumstances.
> > > > > 
> > > > > Yes, but still enables filling logs with that message. A single one in this
> > > > > case should be enough.
> > > > 
> > > > Is it user-triggerable without a serious bug in drivers ?
> > > 
> > > No. But one message still tells about the problem, doesn't it?
> > 
> > Yes, but it then means a reboot is necessary during development every
> > time this error occurs. It also means that if two errors originate from
> > different callers only one message will be printed, which is also not
> > optimal for development.
> > 
> > If this error was triggerable by userspace in normal circumstances then
> > I'd still avoid _once() but go for dev_dbg().
> 
> Presumably anyone debugging this would have dynamic debug enabled here.
> 
> So dev_dbg()?

I proposed dev_err() as that's what some existing drivers do, but I'd be
OK going for dev_dbg(). You may want to ask maintainers of the drivers
that will be affected.

-- 
Regards,

Laurent Pinchart
