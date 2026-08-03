Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD0364045;
	Mon,  3 Aug 2026 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750403; cv=none; b=jJekHLn7JzUAqF3dDVFzEe5MepVvnQ3WZO2P/UNiTYj6AkdMpN+CHjSNm86LlaqnXZGoFV/vljM+QW4YhH0BMMufdSj81GXMBkpzBRbjcUZIMAtLqP3W21N3CyatmyALRtwcqxMbgtKWuPPtR9PmJhN1BqsVUCgzHWaORGTNQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750403; c=relaxed/simple;
	bh=6ALtOujw6qZIb44eE/l7YNKk/ganU26gj9bvK0lIFrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWYd9dpPa7vnQLgs8IsH8SfC7xKNqus7sliTC+7K+5OlyKocRXmHYZQYMEHvtoht9u3JNfX+fWBzBIkITVXuZJnyX0AC9Y8voD2SdH/ZqaAkZVrUnlTiAs6ZrhZ5RaQIPeQFfHZH1JFDPnx4JBXCi4QadTGaHjIOlAi0vKmPXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdysqdjJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdysqdjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785750401; x=1817286401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ALtOujw6qZIb44eE/l7YNKk/ganU26gj9bvK0lIFrU=;
  b=UdysqdjJ2yiaF8AKQB+bQrwdkn44axXbMed2nxtzJcXSpaLfuGjQKOzE
   zKxMxTlA1idWoD0xz6zCo8NnjvSmeuoAU2AGg4Ni+dErivtmkp9OpRCKU
   5OOZ5d9RGiGZDAdoQmDaGTjMbhXRgObmaUBB8a3hL8GODwRgyaRD7HlRd
   PNVeJBY6UJpdC1xX3XHoKVEOEdWDjj25VCjsuSzJOvaSc4mXMRtmEQ0lK
   Mn4bz5DfRhuEeMdallMWqu8TVtxTTg/Hu7pp4vLAjwVUjCkcItsW67c7g
   BJJIzCvYOvwD8OSkKoQOE61ddKYrgprSitwXJ/GJ/iWP1FZfCihP/w8MX
   A==;
X-CSE-ConnectionGUID: VWFYl0orSpypZJ3OE6/73g==
X-CSE-MsgGUID: SxRVQ8hYRN6VDV6rAQBaiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="103682375"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="103682375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 02:46:39 -0700
X-CSE-ConnectionGUID: mLxF4kesSumxOGYoYjzwvw==
X-CSE-MsgGUID: kF2i+zThQYuOUeFe+D8Dww==
X-ExtLoop1: 1
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.14])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 02:46:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BD3F61205B0;
	Mon, 03 Aug 2026 12:46:39 +0300 (EEST)
Date: Mon, 3 Aug 2026 12:46:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <anBjf2YS91Ycw1Ja@kekkonen.localdomain>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178548368547.4139729.2328103728639267380@freya>

Hi Dave, Jai, Laurent,

On Fri, Jul 31, 2026 at 01:11:25PM +0530, Jai Luthra wrote:
> Hi Dave,
> 
> + Sakari, Laurent
> 
> Quoting Dave Stevenson (2026-07-30 16:42:01)
> > Hi Jai
> > 
> > On Tue, 21 Jul 2026 at 06:06, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
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
> > 
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
> > 
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

I agree.

> 
> > And the imx908 Starvis 3 driver that has just been posted [2] is also
> > looking incredibly similar.
> > 
> 
> The flyer for IMX908 mentions some extra HDR modes. If there are some other
> big architectural differences in Starvis 3 I couldn't immediately make them
> out from the posted driver.

I wouldn't worry about this too much. If there are still shared features,
the differences can be usually well compartmentalised and it's not a
problem if only some supported devices implement these features. Think of
e.g. the CCS driver. I recall the i915 driver supports more than 10
generations of Intel GPUs, with quite a bit of differences in features and
implementation. Also the ipu6 driver will soonish gain support for IPU7 and
IPU7.5, albeit the functionality of these is roughly similar.

> 
> > So the big question is whether it is better to have separate drivers
> > for all these sensors, or one combined Starvis2/3 driver? Do we shoot
> > ourselves in the foot when we come to add functionality and find that
> > it only applies to some models?
> > The awkward part would be testing all variants when patches are
> > submitted, as I suspect there won't be one person that has access to
> > all of them.
> > 
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

I'd suggest implementing a single driver. Using helpers requires defining
APIs and you'll have lots of users of these APIs, too, like we have for
e.g. V4L2 sub-devices. If you don't assume a common data structure, e.g.
"starvis" struct that pretty much would assume what the device can do
(compare with a single driver!), this easily becomes cumbersome.

> 
> > Thoughts appreciated.
> > 
> 
> Given we don't support HDR modes or the DSS feature today, and probably
> lack proper APIs in the framework for both, I feel like having a shared
> module of helpers will be quite an effort and a bit of premature
> optimization for uncertain gains.
> 
> So, I am leaning towards having a common driver for all the Starvis 2
> drivers with multiple maintainers. I lack enough information on IMX908
> (Starvis 3) to be sure if that can also be squeezed in.
> 
> If it does get hard to maintain in a single driver in future, we could
> split out common parts at that point without losing the effort we put
> today.
> 
> But let's see what Laurent and Sakari think as well.

-- 
Regards,

Sakari Ailus
