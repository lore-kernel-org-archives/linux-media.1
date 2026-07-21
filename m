Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24037881D;
	Tue, 21 Jul 2026 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646746; cv=none; b=B/i/PAw4JPxhNcw482b8wwcYsQmF6NlukScGGm5V4ROa++WQfoSyvxxAoVGWnLJM8RTyC9xX8ZEoVolIktSYkS35KKktsIU/GOFuiTlV+cXfae4kXEVWub8hDwMq8OAbpFQ6qfMHUmQz7rJmA2kcxBTGtX5ryOjBFPiKgvz0hnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646746; c=relaxed/simple;
	bh=WrcaDKB2Ri9OMrVab+Ec/tqUSpaEs4nKG8J8TsX4CjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV4tPBQChrRu/6xyVJWwtKdrNeyUKPEJOTS59qFbaC6aCW4ljMioLJYQFos9q8cVMdqVkqfyfCoCxv6tQBO5ll/fxuFsK/7OTgvnNX8X9MdAi7cFx3HY9835yrUX2TgRPS/WpnqwqdR6kg67PKl62LTNSprgpDG2X1t7wKaRTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fRTFro0y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fRTFro0y"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4507CC1;
	Tue, 21 Jul 2026 17:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784646683;
	bh=WrcaDKB2Ri9OMrVab+Ec/tqUSpaEs4nKG8J8TsX4CjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRTFro0yNk3Xckmx78zzH+JUBlO7gBKu/NH0XQ4O2jLin0TAuJm42ONP/nsJUF7W+
	 ToVyWhsljzwn98l6/SolYSBFH0EwaVamP7rGgeC8uTteTZB8/iemDJG2/3kdFTe7w/
	 fAsmsHTfUheRXHlRp+E0O3QHIGIPYJBqHAnqDi/c=
Date: Tue, 21 Jul 2026 18:12:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Richard Leitner <richard.leitner@linux.dev>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ov9282: enable single-read I2C transactions
Message-ID: <20260721151221.GM50424@killaraus.ideasonboard.com>
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
In-Reply-To: <2422477.ElGaqSPkdT@steina-w>

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

Yes, this should not be done by default, or we'll have to do the same
for all sensors used in any module from Vision Components.

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

-- 
Regards,

Laurent Pinchart
