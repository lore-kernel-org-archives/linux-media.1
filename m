Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4F1386C9
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536241; cv=none; b=mqg2rXZDjgSsIvvmCHYqJg/CwrTJ6yVWQHR+GTL5Wk/lL1N4MfqO4YSYvOxzW4CyQ0nVCQW0ObMGYePFEZTtfH9LXIirkDRGoaCA4WyjE6ZBZhfozqiA6i+pXA+PYxah+viqWhYFV45p5ddusE8JzRrCtObBsJ0B93dvMkRd+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536241; c=relaxed/simple;
	bh=0jUvkZJaWVtCe0nLkar49KVq3+rYDfaP3127NVkB2zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MH1HMEbBzbHU/VoejmvcBUr8kBgshULHC6cprJKGBx0PYvWmn++tYCkuxcT601KcIhsSjB2bbvJxj7Kv2QD3kvFxlJlrz3h6U2DicSsVHQ9vkmwQQY0DJVG4p12dFEpli3gQvOBr21n7O7+TKBsbxjk3dovrWoFFlzWNswgAB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bhm3TLH/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bhm3TLH/"
Received: from killaraus.ideasonboard.com (85-76-78-183-nat.elisa-mobile.fi [85.76.78.183])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E35D9289;
	Mon, 20 Jul 2026 10:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784536180;
	bh=0jUvkZJaWVtCe0nLkar49KVq3+rYDfaP3127NVkB2zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bhm3TLH/+p3Vedq/ubgAzZ/lmt1NcVR6P6s0ci5gsGo/4lj0Noj/wx1XcyegENoRW
	 prUjXCW8rrf+W42G6MqvFSrI30y0/fiLZ4XRA/YLCsmfQ9boMlMNp+B+RAtAIIAmQ4
	 oqgRxvzCCS+e+eqIJVk1Cx78UOho9/fU8uCohxkw=
Date: Mon, 20 Jul 2026 11:30:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
Subject: Re: [PATCH v6 04/16] media: imx219: The horizontal blanking step is 8
Message-ID: <20260720083035.GB3679@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-4-sakari.ailus@linux.intel.com>
 <20260720062836.GB2208631@killaraus.ideasonboard.com>
 <al3LmaU1AcKw7MGU@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al3LmaU1AcKw7MGU@kekkonen.localdomain>

On Mon, Jul 20, 2026 at 10:17:45AM +0300, Sakari Ailus wrote:
> On Mon, Jul 20, 2026 at 09:28:36AM +0300, Laurent Pinchart wrote:
> > On Wed, Jul 01, 2026 at 03:26:21PM +0300, Sakari Ailus wrote:
> > > The step for horizontal blanking on imx219 is 8. Take this into account in
> > 
> > I'd write "for the LINE_LENGTH register" or something similar here,
> > unless the constraint is really on the blanking.
> 
> I'll use FRM_LENGTH_A.

FRM_LENGTH is vertical.

> > > creating and modifying the horizontal blanking control. The minimum line
> > > length in pixels as well as the horizontal blanking values are already
> > > divisible by 8.
> > > 
> > > Fixes: cd5e2fd89923 ("media: i2c: imx219: make HBLANK r/w to allow longer exposures")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!

-- 
Regards,

Laurent Pinchart
