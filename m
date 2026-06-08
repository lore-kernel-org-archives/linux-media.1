Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8877F38A72C
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914480; cv=none; b=G1J8OXjyRIyLhgrZ36Sc9FLnV2xrX+nz3pCwzLg2o4prm5xglaqwCSVFnKyphZyxfXMrpy1IOjQEfoP/7kBgYCOPIw/+hobE9AfIMBVCLHTucy8PfmEFWYIIhFlU/cNyvYydtaHIDiWqUAnTCYoIsFMKhVWGlV8c0Trrjcuh9UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914480; c=relaxed/simple;
	bh=OjxmPgc8q+PMU+AeEHMxgJ/vr8XGFr2t/YAvJPIvQAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uS5++auIx6HmPoprPdMN+F7G5KUGS9O5zhOthLZfSEnuOJetNI/KIw+kXA9PRz/hS5ms4zCTD1dJ1FkTO0uDwRpjsoTYnsURoTojXfcnxTJPSw3XxjSxyCEdBHcLZCM/fS/opZJnbO7W4EuiFu1MzuDrM+zet8mPsib5fw6ViE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ufrwgJeJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ufrwgJeJ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E235163;
	Mon,  8 Jun 2026 12:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780914449;
	bh=OjxmPgc8q+PMU+AeEHMxgJ/vr8XGFr2t/YAvJPIvQAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufrwgJeJrxtU01QIQ1bqwsP5WQQxKaXvRdTyiuPg7dwNVEwFuK3Iv1r8APypM9mwy
	 ee2a1dA2tiiP3NgZGlWoIer9m+kUOBN881xDKE5fj63D2Sfe4usBUOdpf9svvGlj3u
	 kuiUE1jXDzTb/1DMDxInXya/LF/YZHJG3wE/6PGs=
Date: Mon, 8 Jun 2026 13:27:55 +0300
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
Subject: Re: [PATCH v5 04/10] media: imx219: Make control handler ops for
 PIXEL_RATE NULL
Message-ID: <20260608102755.GF772117@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-5-sakari.ailus@linux.intel.com>
 <20260608073653.GD370380@killaraus.ideasonboard.com>
 <aiZ0a3nGqp6N7GD3@zed>
 <20260608080338.GF370380@killaraus.ideasonboard.com>
 <aiZ56IgNJ2FeXN0o@kekkonen.localdomain>
 <20260608082426.GA380394@killaraus.ideasonboard.com>
 <aiaXotTu4l4ZWzkd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiaXotTu4l4ZWzkd@kekkonen.localdomain>

On Mon, Jun 08, 2026 at 01:21:22PM +0300, Sakari Ailus wrote:
> On Mon, Jun 08, 2026 at 11:24:26AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 08, 2026 at 11:14:32AM +0300, Sakari Ailus wrote:
> > > On Mon, Jun 08, 2026 at 11:03:38AM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 08, 2026 at 09:53:17AM +0200, Jacopo Mondi wrote:
> > > > > Hi Laurent
> > > > >   sorry if I reply in place of Sakari but I got this fresh
> > > > 
> > > > Thanks :-)
> > > > 
> > > > > On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
> > > > > > On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> > > > > > > The PIXEL_RATE control exists to convey the value to the userspace and has
> > > > > > > no configuration that would need to be programmed to the sensor. Make the
> > > > > > > control handler ops for the PIXEL_RATE control NULL and avoid a warning
> > > > > > > (as well as returning an error) from the driver.
> > > > > >
> > > > > > I thought the standard way to handle pixel rate being read only was to
> > > > > > set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
> > > > > > V4L2_CID_LINK_FREQ. Is that not correct ?
> > > > > 
> > > > > PIXEL_RATE is RO by default
> > > > > 
> > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
> > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
> > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;
> > > > > 
> > > > > The purpose of setting the ctrl_ops member to NULL is to avoid having
> > > > > to handle RO controls in the driver implementation of .s_ctrl().
> > > > 
> > > > Shouldn't the V4L2 control framework avoid .s_ctrl() calls for read-only
> > > > controls ? I thought it did already.
> > > 
> > > The control may be read-only on the UAPI but the driver could still do
> > > something about it in its s_ctrl() callback. I don't know if any driver
> > > depends on this though.
> > 
> > It seems to be one of the many areas where control handling should be
> > simplified for drivers.
> > 
> > In any case, the imx219 driver creates the V4L2_CID_LINK_FREQ control
> > with a non-NULL ops pointer, sets the V4L2_CTRL_FLAG_READ_ONLY flag, and
> > does not handle V4L2_CID_LINK_FREQ in imx219_set_ctrl(). If there's an
> > issue for V4L2_CID_PIXEL_RATE there is also an issue for
> > V4L2_CID_LINK_FREQ.
> 
> The ops should be set to NULL for link_freq as well.
> 
> > Maybe the best short term fix would be to drop the dev_info() in the
> > default case of the ctrl->id switch in imx219_set_ctrl() ?
> 
> Any reason why not to set ops NULL instead?

Because that seems to be a hack. Drivers shouldn't have to set a NULL
ops pointer for read-only controls, when there's already a read-only
flag. I'd like to simplify the code on the driver side and handle this
in the control framework, not adding yet another arcane rule that most
driver authors will not be aware of.

-- 
Regards,

Laurent Pinchart
