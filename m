Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D8442BC5C
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558261; cv=none; b=Ay1mynM+g/nCtU18T1I5XL5urils9jCq5CStHXl7DXtY08FxKsaUPeoqRmhSbBZdAafeMUmhpmxMxCiZPCwUrj8UTGvEZzq00X4txu61fj024Sbdc3gGP/3fNYz8ojv/wKThaf1k4m6BhanQDlBqGtGWZAU+n3kT0zr22rq5UbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558261; c=relaxed/simple;
	bh=Arv91AgL99OfhbwYhRTCoMc0jynxEjEcXC1LB/Vcuiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aP0rrPDix3pxZ28N75Z3MUrZZs9opSQdgaaR6YgxTBEAPJXnygCaj/Guhgjs52ArEj0lN/Z3LsUw+CPdN/EkbttZzsddg/zVm3vaXQlyK9lee8kBUqzYVLKObqF539W3fuRwjyEASk/Fyq3bHiAnYLEF1bOltARLogIYk81qV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UHt+FWKL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UHt+FWKL"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA48161;
	Mon, 20 Jul 2026 16:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784558197;
	bh=Arv91AgL99OfhbwYhRTCoMc0jynxEjEcXC1LB/Vcuiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHt+FWKLRLIEmmyK/wOwLV5qAoUUBTZmBnh5pIloJS5xjivEVMSPj3DdVXVkmYa0c
	 BMisu3Y1jpEAGnTAxqe8WWXhw6Z3Le/51q8OCydbXIAAToV8rX90lp3Dky2IVuzErJ
	 uRdAnTae5q703hlPUg3mPNsoyOkEjGERi+YqIw28=
Date: Mon, 20 Jul 2026 17:37:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: hans@jjverkuil.nl, linux-media@vger.kernel.org,
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
Subject: Re: [PATCH v6 13/16] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <20260720143734.GB9442@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
 <20260720084553.GD3679@killaraus.ideasonboard.com>
 <al3hi3-oTj1CCxaD@kekkonen.localdomain>
 <20260720124651.GA9442@killaraus.ideasonboard.com>
 <al4tC7BsVWiVBqOg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al4tC7BsVWiVBqOg@kekkonen.localdomain>

On Mon, Jul 20, 2026 at 05:13:31PM +0300, Sakari Ailus wrote:
> On Mon, Jul 20, 2026 at 03:46:51PM +0300, Laurent Pinchart wrote:
> > On Mon, Jul 20, 2026 at 11:51:23AM +0300, Sakari Ailus wrote:
> > > On Mon, Jul 20, 2026 at 11:45:53AM +0300, Laurent Pinchart wrote:
> > > > On Wed, Jul 01, 2026 at 03:26:30PM +0300, Sakari Ailus wrote:
> > > > > Add v4l2_subdev_call_ci_state_active(), and
> > > > > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > > > > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > > > > cannot be called using v4l2_subdev_call_state_active() or
> > > > > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > > > > state argument.
> > > > 
> > > > Is there a reason why the state argument can't go first ? This patch
> > > > then wouldn't be needed.
> > > 
> > > The client capabilities are constant as is the sub-device itself (at least
> > > in terms of this call) whereas the callback operates on the state, followed
> > > by its arguments. That is a more natural order of arguments IMO.
> > 
> > At the cost of lots of complexity when calling operations. Is it worth
> > it ?
> 
> There's only a single implementation of the macros whereas the callers are
> spread out in the framework and all the drivers. I prefer keeping the API
> nice for the drivers and the rest of the framework, and in this case that
> does indeed bring some complexity.

I won't fight strongly for this, but I'm getting concerned about the
complexity of the macros in v4l2-subdev.h.

> I wonder what Hans thinks.

-- 
Regards,

Laurent Pinchart
