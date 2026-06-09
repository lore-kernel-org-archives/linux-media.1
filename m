Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4D2CA4E
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 06:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986561; cv=none; b=tA5nBVniIhz3e5mZA9f2DUEKI6vEe1fY7PD6yCmnTuQCHIHrdnKqsJKIgIH2u9OCWdRU6NebmIgyJ9Iq1e3945wAZEE8RCpwl4rKsjm2S6aeGLN/LcXVZPuFkR3ZTqjXjkWILMNs2CPBF0beT8arUuLLSktDnQHEfg/jJmon3hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986561; c=relaxed/simple;
	bh=fFZb1LC7DcY797tSSsP0z+FIzp3MQTCV+pMWAcft1+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwuEuVMzpvM77KiOJPVrSQGfpWi3fb9ioroJA69VD5U024LQb6Ows5UfiIvCCrFKPJgsrlrSOC9vIAdr/3B16dSjZQzD4npEtbAelZ5ZiK940Hu9milA1Y3ZfGgfp0p17BcIKQ3JoFqCLX8SKOhNydihzCGQ8IZTY19Ewsb+bcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k4S+h/Jl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k4S+h/Jl"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3DA1132;
	Tue,  9 Jun 2026 08:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780986529;
	bh=fFZb1LC7DcY797tSSsP0z+FIzp3MQTCV+pMWAcft1+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4S+h/JlUBY4RdAjkPHR+bNGBzpHxdgfVzONFOJitf7CqS5igtqdzH7hCNrE1+v1T
	 ScfLmfGJjTX1SPJmmRcVsDhgh5SczUSn/opren8EkklfBnX1EQKtt96s0O0iiRJwAQ
	 dNVAgxOQL+cFVI66qWIHSBjGghpc70IQLAyGOE0w=
Date: Tue, 9 Jun 2026 08:29:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 04/10] media: imx219: Make control handler ops for
 PIXEL_RATE NULL
Message-ID: <aiex5gd6TnggN4wn@zed>
References: <20260607215356.842932-5-sakari.ailus@linux.intel.com>
 <20260608073653.GD370380@killaraus.ideasonboard.com>
 <aiZ0a3nGqp6N7GD3@zed>
 <20260608080338.GF370380@killaraus.ideasonboard.com>
 <aiZ56IgNJ2FeXN0o@kekkonen.localdomain>
 <20260608082426.GA380394@killaraus.ideasonboard.com>
 <aiaXotTu4l4ZWzkd@kekkonen.localdomain>
 <20260608102755.GF772117@killaraus.ideasonboard.com>
 <aibH1-5PxiHpVdsf@kekkonen.localdomain>
 <20260608144200.GB380394@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608144200.GB380394@killaraus.ideasonboard.com>

Hi Laurent

On Mon, Jun 08, 2026 at 05:42:00PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 04:47:03PM +0300, Sakari Ailus wrote:
> > On Mon, Jun 08, 2026 at 01:27:55PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 08, 2026 at 01:21:22PM +0300, Sakari Ailus wrote:
> > > > On Mon, Jun 08, 2026 at 11:24:26AM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 08, 2026 at 11:14:32AM +0300, Sakari Ailus wrote:
> > > > > > On Mon, Jun 08, 2026 at 11:03:38AM +0300, Laurent Pinchart wrote:
> > > > > > > On Mon, Jun 08, 2026 at 09:53:17AM +0200, Jacopo Mondi wrote:
> > > > > > > > Hi Laurent
> > > > > > > >   sorry if I reply in place of Sakari but I got this fresh
> > > > > > >
> > > > > > > Thanks :-)
> > > > > > >
> > > > > > > > On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
> > > > > > > > > On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> > > > > > > > > > The PIXEL_RATE control exists to convey the value to the userspace and has
> > > > > > > > > > no configuration that would need to be programmed to the sensor. Make the
> > > > > > > > > > control handler ops for the PIXEL_RATE control NULL and avoid a warning
> > > > > > > > > > (as well as returning an error) from the driver.
> > > > > > > > >
> > > > > > > > > I thought the standard way to handle pixel rate being read only was to
> > > > > > > > > set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
> > > > > > > > > V4L2_CID_LINK_FREQ. Is that not correct ?
> > > > > > > >
> > > > > > > > PIXEL_RATE is RO by default
> > > > > > > >
> > > > > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
> > > > > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
> > > > > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;
> > > > > > > >
> > > > > > > > The purpose of setting the ctrl_ops member to NULL is to avoid having
> > > > > > > > to handle RO controls in the driver implementation of .s_ctrl().
> > > > > > >
> > > > > > > Shouldn't the V4L2 control framework avoid .s_ctrl() calls for read-only
> > > > > > > controls ? I thought it did already.
> > > > > >
> > > > > > The control may be read-only on the UAPI but the driver could still do
> > > > > > something about it in its s_ctrl() callback. I don't know if any driver
> > > > > > depends on this though.
> > > > >
> > > > > It seems to be one of the many areas where control handling should be
> > > > > simplified for drivers.
> > > > >
> > > > > In any case, the imx219 driver creates the V4L2_CID_LINK_FREQ control
> > > > > with a non-NULL ops pointer, sets the V4L2_CTRL_FLAG_READ_ONLY flag, and
> > > > > does not handle V4L2_CID_LINK_FREQ in imx219_set_ctrl(). If there's an
> > > > > issue for V4L2_CID_PIXEL_RATE there is also an issue for
> > > > > V4L2_CID_LINK_FREQ.
> > > >
> > > > The ops should be set to NULL for link_freq as well.
> > > >
> > > > > Maybe the best short term fix would be to drop the dev_info() in the
> > > > > default case of the ctrl->id switch in imx219_set_ctrl() ?
> > > >
> > > > Any reason why not to set ops NULL instead?
> > >
> > > Because that seems to be a hack. Drivers shouldn't have to set a NULL
> > > ops pointer for read-only controls, when there's already a read-only
> > > flag. I'd like to simplify the code on the driver side and handle this
> > > in the control framework, not adding yet another arcane rule that most
> > > driver authors will not be aware of.
> >
> > I don't think I'd necessarily call it a hack.
>
> It's still yet another undocumented behaviour to will be copied through
> cargo-cult in a subset of drivers, making the code base more difficult
> to understand and maintain. The fact that this patch addressed the
> PIXEL_RATE control but not the LINK_FREQUENCY control proves my concerns
> are valid :-)
>
> I'd like to see one scheme clearly documented, and used by all drivers.
> Let's first focus on selecting one scheme and documenting it. Hans'
> opinion would be useful.
>

We discussed this very same matter a few months ago.

Before having the framework handling this, by not calling into the
driver's s_ctrl for RO controls, all users in-tree shall be checked to
make sure they're actually not doing something with those RO controls.

I even started a branch to check all drivers one-by-one and first set
they're ops to NULL. I quickly got discouraged by the amount of work
required and gave up.

> > The control may be changeable, but not by the user. If the driver is just
> > setting the value without going through the control framework, control
> > events will be omitted.
>
> --
> Regards,
>
> Laurent Pinchart
