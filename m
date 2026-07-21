Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9246D550
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648676; cv=none; b=UDKtWIDLGG3EAh6kYbMGA9Ze673iZvVWg/Spe/HakPfvJHVqjZbFXXDFBLw7RMg9wzhXVGLtFfMdoEzojowUb2A2uzvuvW4hd/E1C4gy2+zdi5n5HKkAeEreP73P9uH/Vfohm6AG/fDg+Us9cYNS5ZR1hncfPW/Bm81In0WB5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648676; c=relaxed/simple;
	bh=d5VF0nDCkZUCNbb/6YgLkHxPusmI8L4gzZLi9UaOMUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lF3EZXSpDMRof60WIEG2CTxGnaeItX77Qi2iyfcyx83pSlj/u5cCD3caUeBaPAeGLX6eKy007R3WPjXNKO2fHMngvl1qrFuOdznhtXSCWprBF0N8y3TvwkTcdxQf0xAS6El5mofjamnxNw18PjYu9t8iEeWehTto/R6Tys9WTio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R9PaVXfS; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R9PaVXfS"
Date: Tue, 21 Jul 2026 17:44:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784648671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3LUWgBFqyCO/G3DcagTHTM4+ZyH8JWUV5dnDyJoL2LE=;
	b=R9PaVXfSSdDH36xq2t3V3UnlhkkuQOTG8BWY/fR0/I84uNlaofAnPtra+v1e9EQY9mYfzM
	juvm6OaFMsKgeGc6eVV3fHj0QZ5URuU164KdwXe16W06IhB4YwbdDl8vUBjIFs09sfV7u8
	C37EkYyvUxCbeHIQ8xVX0eZS4xlWrPI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ov9282: enable single-read I2C transactions
Message-ID: <al-OpcU5M8UL_c8f@bombadil>
References: <20260721-cci-single-v1-0-8485171e1393@linux.dev>
 <20260721-cci-single-v1-2-8485171e1393@linux.dev>
 <CAPY8ntBUntw3DDRMfoCnr69yKfCMPcrPyqL2k8_-rGfr5tY8gg@mail.gmail.com>
 <20260721151614.GN50424@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721151614.GN50424@killaraus.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

thank you very much for your quick feedback!

On Tue, Jul 21, 2026 at 06:16:14PM +0300, Laurent Pinchart wrote:
> On Tue, Jul 21, 2026 at 02:39:46PM +0100, Dave Stevenson wrote:
> > On Tue, 21 Jul 2026 at 14:25, Richard Leitner wrote:
> > >
> > > Some OV9282 camera modules, such as those from Vision Components, fail
> > > multi-byte register reads with the default CCI I2C regmap access pattern
> > > and only work when single-register read transactions are used. This
> > > results in the driver being unable to probe due to a chip id mismatch.
> > 
> > Those damn stupid Vision Components modules with the MCU that prevents
> > you reading registers.
> 
> There's good news, the situation is improving with recent modules. We
> still have to handle the other ones of course.
> 
> > I seem to recall Laurent had a plan for how to handle those without
> > having to patch all the drivers, however I can't find that thread
> > quickly.
> 
> I'm thinking of two options:
> 
> - We can introduce a new standard DT property for I2C device that will
>   be parsed by regmap or the I2C core directly, and switch to single
>   reads.
> 
> - We could model the MCU as some sort of I2C mux, sitting in DT between
>   the I2C controller and the image sensor, and translate multi-byte
>   reads to single-byte reads in that driver.

I'm basically fine with both. Personally I would prefer the first
option, as this would be a generic approach which other devices could also
use. Furthermore it's IMHO the simpler solution. But that's just my 2 cents.

regards;rl

> 
> > > As the driver has no reliable way to identify affected modules enable
> > > use_single_read for OV9282 unconditionally when creating the CCI regmap.
> > >
> > > Tested on an i.M8MP system with OV9282 modules from Vision Components.
> > >
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > 
> > As regmap does provide a simple way to request this behaviour, and the
> > only read is the ID register from ov9282_detect, I'll give it an
> > 
> > Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > 
> > but it's not an ideal situation. Others can debate the alternative
> > approaches for handling VC modules.
> > 
> > > ---
> > >  drivers/media/i2c/ov9282.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index 5b6f897a74fcd..8267a0a9c6f2d 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -1283,6 +1283,11 @@ static int ov9282_probe(struct i2c_client *client)
> > >         struct ov9282 *ov9282;
> > >         int ret;
> > >
> > > +       const struct cci_regmap_config config = {
> > > +               .reg_addr_bits = 16,
> > > +               .use_single_read = true,
> > > +       };
> > > +
> > >         ov9282 = devm_kzalloc(&client->dev, sizeof(*ov9282), GFP_KERNEL);
> > >         if (!ov9282)
> > >                 return -ENOMEM;
> > > @@ -1301,7 +1306,7 @@ static int ov9282_probe(struct i2c_client *client)
> > >                 return ret;
> > >         }
> > >
> > > -       ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
> > > +       ov9282->regmap = devm_cci_regmap_init_i2c_cfg(client, &config);
> > >         if (IS_ERR(ov9282->regmap))
> > >                 return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
> > >                                      "Failed to init CCI\n");
> 
> -- 
> Regards,
> 
> Laurent Pinchart
