Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C82D2397;
	Tue, 11 Aug 2026 04:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421268; cv=none; b=RF/m8F013G5GbigWg0d6Yw1LNDtNty71efoTznazdMxE1wSLbkq99DXXbdL7HqjZoOO6k+m7elJkajTKg1nMaUHnNTN1H8wvm79xzUNUWCcbQr+Ct4qwU+5EY/BGSrDCrKQECU5nXi+ZLGWO2VQd9d6Uweg645OB5+ACTVn54uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421268; c=relaxed/simple;
	bh=VSaqpGJ1S2xRdavC3Lp7ejFIj2BFAkOzoN3y4IeD2iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cz2tfAJemBdZlJzyMRxJSOGL0+HWTKHLWOkhtTKQ2Dsx323o+5UVKW8hZK/uFrU0lrRSUGjYv4CSkLOVwMvBTGSc+XU2s9CYeYNVTK81+ClJhdy1drhhk6i45MqNWLtBHXLQWzkIvDwb/NP2w4XxiYuOlQD22pDQke3g8wSMs6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=imJdrcnp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="imJdrcnp"
Received: from killaraus.ideasonboard.com (unknown [95.214.66.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50D5A18C0;
	Tue, 11 Aug 2026 06:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786421189;
	bh=VSaqpGJ1S2xRdavC3Lp7ejFIj2BFAkOzoN3y4IeD2iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imJdrcnpjnAWdTL0lVZkEdwUsiTWUkBiAPc7HIGmFNtlg9+pA6XfenkIC/1I/ODSM
	 z14CAJjrEBjxXJ0e3GEiVV8HV1FbZjExaSU/yb+iPOEtiYRIJdKqKvzvobxvwlqUFM
	 JuMw3nZKSN6EJTuQmEI3m8dVhgwxkopvohv48m+4=
Date: Tue, 11 Aug 2026 07:07:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
Message-ID: <20260811040742.GA1825378@killaraus.ideasonboard.com>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-3-eagle.alexander923@gmail.com>
 <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
 <178455866124.1426769.18237320419273419942@freya>
 <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com>
 <178461038136.1426769.8068222330738680407@freya>
 <CAPY8ntDk+4aseGqijPz8Y9cGFzN=4zHPEj3HiHgetn=O_ufh_Q@mail.gmail.com>
 <178548368547.4139729.2328103728639267380@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178548368547.4139729.2328103728639267380@freya>

On Fri, Jul 31, 2026 at 01:11:25PM +0530, Jai Luthra wrote:
> Quoting Dave Stevenson (2026-07-30 16:42:01)
> > On Tue, 21 Jul 2026 at 06:06, Jai Luthra wrote:
> > >
> > > Hi Dave,
> > 
> > <snip>
> > 
> > > > > and implement
> > > > > it using the common raw sensor model directly?
> > > > >
> > > > > I did it for IMX678 [1] on Sakari's suggestion [2]. The two sensors are
> > > > > quite similar, so I'm happy to help in whatever way I can on getting this
> > > > > working with the new model too :-)
> > 
> > I'd also noticed that all the Starvis 2 sensors are very similar, to
> > the extent that it seemed worth a very quick test to see how much
> > needed to change for the imx678 driver to work with imx662.
> > 
> > The answer turned out to be really not much:
> > - PIXEL_RATE
> > - PIX_PER_CLK
> > - ID
> > - native and active areas
> > - min_hmax
> > - common_regs (culled nearly all of them, although I do have the
> > spreadsheet from Sony which needs to be added to my next version)
> > - VMAX_DEFAULT setup if you want the full frame rate.
> 
> Great! I was hoping for similarities too, but if you got IMX662 streaming
> already with the IMX678 driver that's quite good news.
> 
> > Those would all parameterise quite easily.
> > 
> > I also have an IMX675 module from Soho Enterprises which is a 5MPix
> > Starvis 2 sensor. I don't have a datasheet for it at present.
> > That streams OK at the requested rates by just updating the active
> > area to 2608x1960 and ignoring the ID. However I can only receive test
> > patterns as all the active images I get are pure black :( I'm hoping
> > it's a faulty module, but will keep poking.
> > 
> > There is also IMX585 as an 8MPix Starvis2 sensor. I'd hoped Naush had
> > one to test, but it seems not. In the meantime I've compared against
> > the driver Will Whang sent to linux-media a while back [1] and that
> > also looks largely the same.
> 
> Indeed looking at the documentation for IMX676, IMX678 and IMX662, I see
> the features are mostly same, except minor differences:
> 
> IMX676 and IMX678 support 8 and 4x2-lane (with XSIZE overlap) features, but
> IMX662 does not (probably because it's only ~2MP).
> 
> IMX676 supports dual-speed streaming (DSS) using MIPI VC1 for sending
> 2x/4x/.. FPS data for a smaller region-of-interest.
> 
> The registers otherwise look identical, so a shared driver would make
> sense.
> 
> > And the imx908 Starvis 3 driver that has just been posted [2] is also
> > looking incredibly similar.
> 
> The flyer for IMX908 mentions some extra HDR modes. If there are some other
> big architectural differences in Starvis 3 I couldn't immediately make them
> out from the posted driver.

IMX908 as a new ClearHDR architecture. It isn't implemented in the
driver posted to the list, but will come in future patches. I expect
important differences there.

> > So the big question is whether it is better to have separate drivers
> > for all these sensors, or one combined Starvis2/3 driver? Do we shoot
> > ourselves in the foot when we come to add functionality and find that
> > it only applies to some models?
> > The awkward part would be testing all variants when patches are
> > submitted, as I suspect there won't be one person that has access to
> > all of them.
> 
> Honestly, I have the same question. I would love to share as much code as
> possible so we only do the painful things like moving to new APIs once,
> which I've already done for IMX678, and it was not a quick exercise.
> 
> I haven't deep-dived enough on the different HDR modes (DOL, ClearHDR,
> and Starvis 3 hybrid HDR) or the DSS feature to know how easy it would be
> to test and maintain all of those in a single driver. The HDR modes support
> using MIPI VC 0,1,2 or line-data to distinguish between short/long
> exposure/gain frames, and DSS also uses VC 0 and 1, so the book-keeping
> around the combinatorial possibilities of what is allowed or not allowed
> across different sensors may make a single driver a bit messy.
> 
> An alternative could be to create a common starvis2.c module with helpers
> for shared boilerplate that separate sensor drivers can use. Even if we go
> the helper route, we would still need multiple people testing or acking
> patches that touch the shared code. But I see that in the same way as other
> common parts of the framework that effect multiple drivers.
> 
> > Thoughts appreciated.
> 
> Given we don't support HDR modes or the DSS feature today, and probably
> lack proper APIs in the framework for both, I feel like having a shared
> module of helpers will be quite an effort and a bit of premature
> optimization for uncertain gains.

What I'd like to see if a framework to make implementation of raw sensor
drivers much easier. There's lots of boilerplate code in the drivers,
with opportunities for code sharing.

> So, I am leaning towards having a common driver for all the Starvis 2
> drivers with multiple maintainers. I lack enough information on IMX908
> (Starvis 3) to be sure if that can also be squeezed in.
> 
> If it does get hard to maintain in a single driver in future, we could
> split out common parts at that point without losing the effort we put
> today.
> 
> But let's see what Laurent and Sakari think as well.

I'll reply to Dave's RFC when I'll be back from holidays.

> > [1] https://lore.kernel.org/linux-media/20250816055432.131912-1-will@willwhang.com/
> > [2] https://lore.kernel.org/linux-media/20260730021525.166811-1-lachlan.michael@sony.com/T/#t

-- 
Regards,

Laurent Pinchart
