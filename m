Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763B33B6D6;
	Sun,  2 Aug 2026 23:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785711837; cv=none; b=VKkuNF3DN2BLY6WvEInVDAmVHiua09z95cA/1YwcR4QCC6IhYS1gVhwjba+yKj6f+kuSvNwl29eVcd96gJIxeerUzTLdN795/uzfclfWYITl11X6KgfydF+PAzfAKYV9yFXObT9ImqHk6BV8s1AwEWYTP6xjtU5M698cNQORRas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785711837; c=relaxed/simple;
	bh=3PKTW17d3xHdFJLpj2sMmDHQUUD6O1H+5bikwfmRrH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpsKBmQ/G3wQdceDSCZOau2bcC5UjplC5Dv+AhSly/AMt38Rq1vus5T8IFLTO4j72SjX7JZqIiWWSoQViO+K7CNxWyXfSwsVzFj3mXJ4bu4lbWhW9W410auDKX8A7pFqwmVl/VELZgx1us1ZRcAJEglu7R1cmmKW5fHnMnBbMig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d3CJbjdW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d3CJbjdW"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8193312F;
	Mon,  3 Aug 2026 01:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785711757;
	bh=3PKTW17d3xHdFJLpj2sMmDHQUUD6O1H+5bikwfmRrH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d3CJbjdW2kRPn7dq2YCqL6FVFLbHQfafh307OrInpl92cPihptqpxuNT1AMqzV4X0
	 +sKxQA/3o69et6SrU/tyDhY6PG8gWLOeU331e3xyMZJXWoM5EQy5tZa2JfuSv2uqop
	 0A0W36PaBSqvR8U51PH7nv34nsCqykzvABm2g9cc=
Date: Mon, 3 Aug 2026 02:03:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
	Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
	Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
 bindings
Message-ID: <20260802230344.GD1927055@killaraus.ideasonboard.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-2-lachlan.michael@sony.com>
 <20260730-elastic-amaranth-urchin-4b8bbf@quoll>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730-elastic-amaranth-urchin-4b8bbf@quoll>

On Thu, Jul 30, 2026 at 11:06:09AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 11:15:24AM +0900, Lachlan Michael wrote:
> > The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> > with a MIPI CSI-2 output interface.
> > 
> > Add device tree bindings for the sensor.
> > 
> > Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
> 
> You need to test code before you send it, not with our infra.

I have provided guidance to Lachlan on how to test DT bindings (and have
submitted a fix to dt-schema as part of that work) before he submitted
this patch series. Unfortunately, we missed an issue in the
configuration of his development environment which resulted in the DT
bindings check not being run. Mistakes happen, it will work better next
time :-)

> To spare you one sending cycle:
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
> > ---
> >  .../bindings/media/i2c/sony,imx908.yaml       | 107 ++++++++++++++++++
> >  MAINTAINERS                                   |   7 ++
> >  2 files changed, 114 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> 
> ...
> 
> > +++ b/MAINTAINERS
> > @@ -25264,6 +25264,13 @@ T:	git git://linuxtv.org/media.git
> >  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> >  F:	drivers/media/i2c/imx415.c
> >  
> > +SONY IMX908 SENSOR DRIVER
> > +M:	Lachlan Michael <lachlan.michael@sony.com>
> > +L:	linux-media@vger.kernel.org
> 
> Drop

Why so ?

> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> > +F:	drivers/media/i2c/imx908.c
> 
> No such file.

Lachlan, that line belongs to patch 2/2.

> > +
> >  SONY MEMORYSTICK SUBSYSTEM
> >  M:	Maxim Levitsky <maximlevitsky@gmail.com>
> >  M:	Alex Dubov <oakad@yahoo.com>

-- 
Regards,

Laurent Pinchart
