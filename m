Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8322E1F06;
	Tue, 21 Jul 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649698; cv=none; b=aYZ3V9jtVwmjkai0mdPIuMrLgz5NLmwE4GQMhHAkyGkaJkRWa2vYHc7YYBS9PIQSwQ6iCw6ClkFU4EBsxBwRKN5mc+zpWJnOYNhSByp8kAW+f394/U9WapPBqH5MDsw1CjexRsyRdQ/jGahoafY2ufDEezwWVIU/ZXdVzZ4YKF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649698; c=relaxed/simple;
	bh=HIlFykM+aU0w04oZ1TxF/xznHCRRKSbrYIfTc5+x6ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIK/wcAsENjIpwfnFjuL0vq++swXUqjx1f4UJLwsazKO8afwexrNRFWPoaeqSjAJ4ZufYrlxk4ltjWjDeoXlA+p0a5U6N0YKmZyajr1kCVDHG5w/G88fIRPf45NiYcNmhp5XnukYIL3uKHBsXnL5dTpQx7LyIjNa8jsDtCgfSk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ussrbNWz; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ussrbNWz"
Date: Tue, 21 Jul 2026 18:01:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784649694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eys/4Qe9QDzUBYysnEj0pqqrB6eil2IcXI5qwah6udo=;
	b=ussrbNWzBVn+GgvkioZvHj5ok85wxaUW1WsjIacELNqhDll7G7vMfzdxTDBGzzVdv8S4Xt
	n+UsYRXHnFPCovhbrxOtytp1TeW4w3gagd7xY4PYYg2vlWjMRqzF8k3cFPVlESgzV8pgLC
	HkJCIxOpoF1h0N/VOJmL+UpcIIRVqbw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ov9282: enable single-read I2C transactions
Message-ID: <al-XSDYrEfMmaEqR@bombadil>
References: <20260721-cci-single-v1-0-8485171e1393@linux.dev>
 <20260721-cci-single-v1-2-8485171e1393@linux.dev>
 <CAPY8ntBUntw3DDRMfoCnr69yKfCMPcrPyqL2k8_-rGfr5tY8gg@mail.gmail.com>
 <20260721151614.GN50424@killaraus.ideasonboard.com>
 <al-OpcU5M8UL_c8f@bombadil>
 <20260721155822.GB536385@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721155822.GB536385@killaraus.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 21, 2026 at 06:58:22PM +0300, Laurent Pinchart wrote:
> On Tue, Jul 21, 2026 at 05:44:21PM +0200, Richard Leitner wrote:
> > Hi Laurent,
> > 
> > thank you very much for your quick feedback!
> > 
> > On Tue, Jul 21, 2026 at 06:16:14PM +0300, Laurent Pinchart wrote:
> > > On Tue, Jul 21, 2026 at 02:39:46PM +0100, Dave Stevenson wrote:
> > > > On Tue, 21 Jul 2026 at 14:25, Richard Leitner wrote:
> > > > >
> > > > > Some OV9282 camera modules, such as those from Vision Components, fail
> > > > > multi-byte register reads with the default CCI I2C regmap access pattern
> > > > > and only work when single-register read transactions are used. This
> > > > > results in the driver being unable to probe due to a chip id mismatch.
> > > > 
> > > > Those damn stupid Vision Components modules with the MCU that prevents
> > > > you reading registers.
> > > 
> > > There's good news, the situation is improving with recent modules. We
> > > still have to handle the other ones of course.
> > > 
> > > > I seem to recall Laurent had a plan for how to handle those without
> > > > having to patch all the drivers, however I can't find that thread
> > > > quickly.
> > > 
> > > I'm thinking of two options:
> > > 
> > > - We can introduce a new standard DT property for I2C device that will
> > >   be parsed by regmap or the I2C core directly, and switch to single
> > >   reads.
> > > 
> > > - We could model the MCU as some sort of I2C mux, sitting in DT between
> > >   the I2C controller and the image sensor, and translate multi-byte
> > >   reads to single-byte reads in that driver.
> > 
> > I'm basically fine with both. Personally I would prefer the first
> > option, as this would be a generic approach which other devices could also
> > use. Furthermore it's IMHO the simpler solution. But that's just my 2 cents.
> 
> The next step is to then write and send an RFC, to get feedback on the
> idea from the DT and I2C maintainers (and possibly regmap, if we handle
> the quirk at that level). Is that something you could work on ?

Sure. I'll take a more detailled look at it tomorrow.

regards;rl

...

> -- 
> Regards,
> 
> Laurent Pinchart
