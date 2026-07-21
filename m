Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FA43955F4
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649505; cv=none; b=jpmzKD0k51WDWf/IVX4Wrbmcd5Cfi0K7mim+ZXHdLGwlVrBNycVlLyRlcMDa4kZBL66YyIGXb6srjVptttfySFpOfSspj+hxDBOUkY6bGJHfvf2TzcbkU2e7/rBOw1tqTsMxPSabb/R9ksc4aPvu6oxMv9Ir3b9+KYPy4WmmFOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649505; c=relaxed/simple;
	bh=PErj2t1QZ/sC/PnJU1cH1l5ZqftPIxI9CTQ/ClmSMMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAMptfz1z9vSa6K3BOAirRp/D/ux0UOvOFGdwmaTFxreXJWKjMAhBJeRpBTwLiLn5k/x1QdXoeJLUBP5PcbQk+U54bYvE7GapOEDdPPbHqjfvgXXmzVocSXzkQ6njlRoXtm5QkSZHaQ8d7WjKg7J9CMcGgFeMAx1NY9BZnYCi7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PjjgDDH2; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PjjgDDH2"
Date: Tue, 21 Jul 2026 17:57:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784649501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=55Q81c9qYfGtRRmWyxNfD42Ky5dxmWO+LrRsXBaxWAw=;
	b=PjjgDDH2T5MWQnf+8vgtUes4apg/LE9IFDBU9B4lFhMQQIu7Axtog+HC0SA9XicjwQMSDH
	qkpo4yNIDoU9dOPSuVeFI1zhYXA8IR4giubChuht2D0WdIhkUbcECbet0taiYZQibPZ2Oj
	PzpmFI55hepHzMNGx+y06IRmWgENPTE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ov9282: enable single-read I2C transactions
Message-ID: <al-WUYpCxdxfXBlS@bombadil>
References: <20260721-cci-single-v1-0-8485171e1393@linux.dev>
 <20260721-cci-single-v1-2-8485171e1393@linux.dev>
 <2422477.ElGaqSPkdT@steina-w>
 <al-Jw_O8faK3oqqB@bombadil>
 <20260721153212.GP50424@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721153212.GP50424@killaraus.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

On Tue, Jul 21, 2026 at 06:32:12PM +0300, Laurent Pinchart wrote:
> Hi Richard,
> 
> On Tue, Jul 21, 2026 at 05:15:06PM +0200, Richard Leitner wrote:
> > On Tue, Jul 21, 2026 at 03:38:26PM +0200, Alexander Stein wrote:
> > > Am Dienstag, 21. Juli 2026, 15:25:29 CEST schrieb Richard Leitner:
> > > > Some OV9282 camera modules, such as those from Vision Components, fail
> > > > multi-byte register reads with the default CCI I2C regmap access pattern
> > > > and only work when single-register read transactions are used. This
> > > > results in the driver being unable to probe due to a chip id mismatch.
> > > > 
> > > > As the driver has no reliable way to identify affected modules enable
> > > > use_single_read for OV9282 unconditionally when creating the CCI regmap.
> > > 
> > > What about a property in the DT instead? In DT it should be clear if a
> > > Vision Components camera is used.
> > 
> > I've talked to Laurent about this topic (I guess a year ago or so...)
> > and he pointed me to his downstream work regarding the vc-mipi driver
> > (which I am currently also using):
> > 
> > https://gitlab.com/ideasonboard/nxp/linux/-/commits/v7.0/sensors/vcmipi
> > 
> > There is a new driver (and therefore DT compatible) for the controller
> > (without the sensor) on the Vision Components board implemented. This
> > separates basically the "regulator" part of the VC microprocessor from
> > the "forward I2C traffic to the sensor" part. AFAICT...
> > 
> > Talking about that separation I vaguely remember he argued against a
> > new device-tree property or compatible for the vcmipi variants of the
> > ov9282. Therefore I went for the "easy" approach of just enabling single
> > register reads.
> > 
> > Nonetheless if I understood this wrong or "things" changed, please feel
> > free to correct me.
> > 
> > Just to be clear: I'm also perfectly fine with introducing a new
> > "vcmipi,ov9282" compatible or something like a "quirk-vision-components"
> > property if that's preferred.
> 
> My main concern is that I don't want to see this being handled manually
> in drivers. Whatever solution we decide to implement (I proposed two in
> a separate e-mail in this thread) should not require modifying image
> sensor drivers to implement logic specific to the Vision Components
> module. I'm fine relying on drivers using specific helpers (for instance
> requiring drivers to be ported to regmap or v4l2-cci in order to support
> the quirk).

Sure. That makes perfect sense. I've answered that e-mail already.

Just wanted to share my current downstream solution to start the discussion ;-)

Thanks for those quick replies and feedback!

regards;rl

> 
> > > > Tested on an i.M8MP system with OV9282 modules from Vision Components.
> > > > 
> > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > ---
> > > >  drivers/media/i2c/ov9282.c | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > index 5b6f897a74fcd..8267a0a9c6f2d 100644
> > > > --- a/drivers/media/i2c/ov9282.c
> > > > +++ b/drivers/media/i2c/ov9282.c
> > > > @@ -1283,6 +1283,11 @@ static int ov9282_probe(struct i2c_client *client)
> > > >  	struct ov9282 *ov9282;
> > > >  	int ret;
> > > >  
> > > > +	const struct cci_regmap_config config = {
> > > > +		.reg_addr_bits = 16,
> > > > +		.use_single_read = true,
> > > > +	};
> > > > +
> > > >  	ov9282 = devm_kzalloc(&client->dev, sizeof(*ov9282), GFP_KERNEL);
> > > >  	if (!ov9282)
> > > >  		return -ENOMEM;
> > > > @@ -1301,7 +1306,7 @@ static int ov9282_probe(struct i2c_client *client)
> > > >  		return ret;
> > > >  	}
> > > >  
> > > > -	ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
> > > > +	ov9282->regmap = devm_cci_regmap_init_i2c_cfg(client, &config);
> > > >  	if (IS_ERR(ov9282->regmap))
> > > >  		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
> > > >  				     "Failed to init CCI\n");
> 
> -- 
> Regards,
> 
> Laurent Pinchart
