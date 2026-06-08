Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE73B14D2
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955538; cv=none; b=kDQZduXMEPIFyZBDBMsdxEsvnNsCAEsd3Oo4n5mFx/dqvz7Y2DZ2eUH+7aolQnO7K73TlfSFTsFl+RHj1tPMLwqAfqQ9H+Kvx59M7XbpMBlVojExEmYfv2PNtWlp/UzS6AvpeFW2SbcI0rwdZGvrvgL47OSRQWrhgVp2xLAVrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955538; c=relaxed/simple;
	bh=t67853bHKpWnNvFI0e7UBcuVI3UfKCQN5149lfMds54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpulJM6ekN4dhw8Zykefge1teklVxrKb2PIvQt9MXKYUYoNKg7BMFYgActxP3z+/s1Vgf6+f1f7t15lqFcc1NBsz9fvgL2QTdyEYiObQF3AKx4e8xx+F7PprcArKRbrILdrABzbwQsHQd24c7iIQYFvoU4XVzS4SMaZUTFVuh0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KVEW05PH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KVEW05PH"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE1688F;
	Mon,  8 Jun 2026 23:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780955506;
	bh=t67853bHKpWnNvFI0e7UBcuVI3UfKCQN5149lfMds54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVEW05PHgpIxVcu+hpG1F+5AOfQra4t6S/Z6tZxEi7LVIp0zXKy8cxrvkQPb87eQS
	 zdh5dV7E7phyVBrq6iW6i6CHSI8ZgAGWUuGpqIa4ZKY3MAgng3on9Yq84C+sQqilSH
	 dahJ4B8nwtI5fh65ClnRYW/j9DanjyJvLCYTyjQ4=
Date: Tue, 9 Jun 2026 00:52:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
	"Yu , Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <20260608215213.GC944266@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <20260608091026.GB772117@killaraus.ideasonboard.com>
 <aibMpvdVNraURHIE@kekkonen.localdomain>
 <178093582619.19620.15016359616261234139@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178093582619.19620.15016359616261234139@freya>

On Mon, Jun 08, 2026 at 09:53:46PM +0530, Jai Luthra wrote:
> Quoting Sakari Ailus (2026-06-08 19:37:34)
> > On Mon, Jun 08, 2026 at 12:10:26PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > > 
> > > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > > When vertical analogue binning is in use, the minimum frame length in
> > > > > lines decreases to around half of the normal. In relation to the sensor's
> > > > > output size this means vertical blanking can be negative but that's not an
> > > > > issue as control values are signed. Remove the workaround for this
> > > > 
> > > > Didn't we just discussed two weeks ago in media summit how negative
> > > > blankings are a bad idea, and of all drivers one could decide to play
> > > > with imx219 is probably the worse due it's large use base and the fact
> > > > libcamera doesn't support negative blankings ?
> > > 
> > > I also think that negative blanking values are a bad idea, for this
> > > driver or any other driver. I still haven't seen any compelling
> > > argument.
> > 
> > Note that the blanking controls haven't expressed blanking in other
> > configurations than those that do not use binning, either analogue or
> > digital, or cropping. The fact that negative values would result due to
> > sensor configuration does not mean the values would be somehow incorrect,
> > they simply do not reflect actual blanking configuration on the sensor.
> 
> I agree.. although what is the actual blanking configuration on the sensor
> in this case?
> 
> I've been banging my head for a while to figure it out (my best guess in
> the sibling thread)
> 
> > In retrospect, we should have always had frame length in lines and line
> > length in pixels controls instead, or possibly besides the blanking
> > controls. But as the two blanking controls have been in use for conveying
> > frame length in lines and line length in pixels, relative to a reference
> > size,

What's the reference size ? The controls are documented as

``V4L2_CID_VBLANK (integer)``
    Vertical blanking. The idle period after every frame during which no
    image data is produced. The unit of vertical blanking is a line.
    Every line has length of the image width plus horizontal blanking at
    the pixel rate defined by ``V4L2_CID_PIXEL_RATE`` control in the
    same sub-device.

``V4L2_CID_HBLANK (integer)``
    Horizontal blanking. The idle period after every line of image data
    during which no image data is produced. The unit of horizontal
    blanking is pixels.

This is compatible with usage of the output size as a reference. And
doing so wouldn't require negative blanking, would it ?

> > we can't re-purpose them for something else anymore without breaking
> > pretty much all userspace.
> > 
> > Multiplying the pixel rate and either frame length in lines or line length
> > in pixels by a constant does not make the blanking controls magically
> > correct.

The multiplication of the pixel rate may be the core of the issue. It's
getting late, I'll try to look at that tomorrow.

> Sure.. but the sensor must be reading out pixels along with non-negative
> blanking internally. If that happens to not match the register values, do
> you object to multiplying LLP or FLL with a constant?
> 
> Also what do you think of sensors like IMX678/IMX283 where the HTOT (LLP)
> register is not in units of pixels at all?
> 
> > I hope the above summarises my position in an understandable way.
> > 
> > I believe removing the rate_factor is necesary if we want to add support
> > for the Common Raw Sensor Model to the imx219 driver. Otherwise, we'll be
> > left with a single example driver only, the ov2740, which is an entirely
> > register list based driver.
> 
> Agreed.

-- 
Regards,

Laurent Pinchart
