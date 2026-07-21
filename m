Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE53D4DA537;
	Tue, 21 Jul 2026 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646935; cv=none; b=VMEkXD1Of+73k7BG/kS9xfGrxw8krgcN6H/bJOojSavcKh7auPJ6eOL+Eh3BSKdRdEKapS2AtsbAQqUJLsYbjQgpWHzRQmgtqwc3YzlaDI5Z9a+s8qQ6LeGalJuL1KL28/v6wVTuPZQSxb3U9MNOG9xyyvqcQDMdEGD16lqRVyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646935; c=relaxed/simple;
	bh=Bn8pdBCphfaoRE6ia4ccvYbqJ0SNBdCTdh7QdU86jOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLWo5IiQk6kKSBi34u4AE1G3jPrvaarlKT4YAfM3iwoTbX3ExryAxgExOUqjp9MUKU5F4FafrGZhl5M+9X2hEjten4Cch4X7zAMDjI12abLmek3wFv1Oqm6ZiAfB6bzhoY7eou4y0mjbSyFsrTLwCQHPkw1YtG449rmEVc18z84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a9qwNjSC; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a9qwNjSC"
Date: Tue, 21 Jul 2026 17:15:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784646930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1de3W7Rs24fvXvZyRaaR3DK376Zv4eG5d/LRkVgE2hU=;
	b=a9qwNjSC7DWzFQ/FybWLPnFWiK1jpuhacMM+sUKfS2obAEgmzWfS+jYkzTpBMWF9GkQWSD
	rPFTE4v3GGP14aLujjCB2Sbkvn2lYl6tf+d2SZI4BIjMltRHvUnIPxYUuW08KsWk7az6o7
	jfHdnDnOF7JSsIjqkpJrZ854ShzNqSQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ov9282: enable single-read I2C transactions
Message-ID: <al-Jw_O8faK3oqqB@bombadil>
References: <20260721-cci-single-v1-0-8485171e1393@linux.dev>
 <20260721-cci-single-v1-2-8485171e1393@linux.dev>
 <2422477.ElGaqSPkdT@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2422477.ElGaqSPkdT@steina-w>
X-Migadu-Flow: FLOW_OUT

Hi Alexander,

thanks for your feedback!

On Tue, Jul 21, 2026 at 03:38:26PM +0200, Alexander Stein wrote:
> Hi Richard,
> 
> thanks for addressing this long-standing issue.
> 
> Am Dienstag, 21. Juli 2026, 15:25:29 CEST schrieb Richard Leitner:
> > Some OV9282 camera modules, such as those from Vision Components, fail
> > multi-byte register reads with the default CCI I2C regmap access pattern
> > and only work when single-register read transactions are used. This
> > results in the driver being unable to probe due to a chip id mismatch.
> > 
> > As the driver has no reliable way to identify affected modules enable
> > use_single_read for OV9282 unconditionally when creating the CCI regmap.
> 
> What about a property in the DT instead? In DT it should be clear if a
> Vision Components camera is used.

I've talked to Laurent about this topic (I guess a year ago or so...)
and he pointed me to his downstream work regarding the vc-mipi driver
(which I am currently also using):

https://gitlab.com/ideasonboard/nxp/linux/-/commits/v7.0/sensors/vcmipi

There is a new driver (and therefore DT compatible) for the controller
(without the sensor) on the Vision Components board implemented. This
separates basically the "regulator" part of the VC microprocessor from
the "forward I2C traffic to the sensor" part. AFAICT...

Talking about that separation I vaguely remember he argued against a
new device-tree property or compatible for the vcmipi variants of the
ov9282. Therefore I went for the "easy" approach of just enabling single
register reads.

Nonetheless if I understood this wrong or "things" changed, please feel
free to correct me.

Just to be clear: I'm also perfectly fine with introducing a new
"vcmipi,ov9282" compatible or something like a "quirk-vision-components"
property if that's preferred.

Thanks & regards;rl

> 
> Best regards,
> Alexander
> 
> > 
> > Tested on an i.M8MP system with OV9282 modules from Vision Components.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 5b6f897a74fcd..8267a0a9c6f2d 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1283,6 +1283,11 @@ static int ov9282_probe(struct i2c_client *client)
> >  	struct ov9282 *ov9282;
> >  	int ret;
> >  
> > +	const struct cci_regmap_config config = {
> > +		.reg_addr_bits = 16,
> > +		.use_single_read = true,
> > +	};
> > +
> >  	ov9282 = devm_kzalloc(&client->dev, sizeof(*ov9282), GFP_KERNEL);
> >  	if (!ov9282)
> >  		return -ENOMEM;
> > @@ -1301,7 +1306,7 @@ static int ov9282_probe(struct i2c_client *client)
> >  		return ret;
> >  	}
> >  
> > -	ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
> > +	ov9282->regmap = devm_cci_regmap_init_i2c_cfg(client, &config);
> >  	if (IS_ERR(ov9282->regmap))
> >  		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
> >  				     "Failed to init CCI\n");
> > 
> > 
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 
