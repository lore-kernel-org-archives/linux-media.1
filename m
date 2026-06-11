Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F223B9D95
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176183; cv=none; b=a8gEKQxZLYB+5Bus9yCiveSU5iv4AOalfQyV2XPSWiNIPxDQ5SIgpeSSyBVlMf2j85Vr0Sh4FTRF0veSs4aIQ6t6bv4wSZHlCTOug1MSr6LmPhxsQ3p01ktyvEwnctj7nwn8hGlN+JD2rhWb9Hx2kwZDJ2puguSxCFODei2RTT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176183; c=relaxed/simple;
	bh=4Qu/gooxwi23wVm00341ILwEWyAGlrWU3SGCTKENbSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwEqaOMtZLm8ogbvp3TeaO7toRWbTVYd7A45cJZgFptUJD3ysW5VwLJuEWd3Hbxan5hnH5NCEQC+QINdBm1pgOqVkw/D0ZfD9RuiH5gTgPDzSQwgNh5APkNlFi/GsR2JmRS7U2iCHPwpb41tdLdy39D5/PWVveKF14ZEPD4OwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itQAhFPT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itQAhFPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781176181; x=1812712181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Qu/gooxwi23wVm00341ILwEWyAGlrWU3SGCTKENbSI=;
  b=itQAhFPTo+2cSmiiXkqv8aVAwQjPsXfy+H9MLDjjrdZG41ciq02qZasb
   j0n1X/uVe/E2egbDcjLFVFPs+JKQ6QYNYsrumMZ6AWT3/XWTxB7yQYyUl
   gMeegowN9NeCgFckzOSr0upptF7NZfS+BAbW6ypf+L2+YgYS15eZurZKx
   4l6LeIJJY6toz83NGazRrI0MJaP9nRtM2l8/c+1aDhbdUwM5d7snYYrLp
   /Ecd5uj2wxEgcS0DklCkLLZFY+Wjvp39jWhOprGcKSLDlbcWw7DkI5wF2
   ieg5WlO54U/4KXElfJ3P3ulDJgY0k1BaQxObF5ApC0JpFbQx/25vc1heq
   w==;
X-CSE-ConnectionGUID: AOnkCxWyTo+f+ZBeveUP5Q==
X-CSE-MsgGUID: ZdmlYmIiTd69O0YQpbX94g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82030509"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82030509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 04:09:40 -0700
X-CSE-ConnectionGUID: NzJxgyncSSaT0sD7ZMaTBQ==
X-CSE-MsgGUID: 00CFkzCFTy+azPfqV/1LOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240110467"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 04:09:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0CCDE121C39;
	Thu, 11 Jun 2026 14:09:31 +0300 (EEST)
Date: Thu, 11 Jun 2026 14:09:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hoc k" <ong.hock.yu@intel.com>,
	" Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 33/86] media: uapi: Add new controls for camera
 sensor FLL and LLP
Message-ID: <aiqXajyu1w9bfaAM@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-34-sakari.ailus@linux.intel.com>
 <178115623672.1799417.2005627235315487289@freya>
 <aip4HgMfEnidvlPN@kekkonen.localdomain>
 <178117276804.1799417.8559157915944888952@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178117276804.1799417.8559157915944888952@freya>

Hi Jai,

On Thu, Jun 11, 2026 at 03:42:48PM +0530, Jai Luthra wrote:
> Quoting Sakari Ailus (2026-06-11 14:25:58)
> > Hi Jai,
> > 
> > On Thu, Jun 11, 2026 at 11:07:16AM +0530, Jai Luthra wrote:
> > > Hi Sakari,
> > > 
> > > Quoting Sakari Ailus (2026-04-10 01:44:08)
> > > > Add new controls for camera sensors, V4L2_CID_LINE_LENGTH_PIXELS and
> > > > V4L2_CID_FRAME_LENGTH_LINES, to convey the combined size of the analogue
> > > > crop rectangle and horizontal and vertical blanking.
> > > > 
> > > > The reason for adding the new controls is that they're much easier to use
> > > > as the user doesn't have to be concerned of the analogue crop in the same
> > > > context. Secondarily, the newly added common raw sensor model uses
> > > > different values for the same.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> > > >  include/uapi/linux/v4l2-controls.h                     |  3 +++
> > > >  3 files changed, 15 insertions(+)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > index 63e53c883db6..fb4dee1b4f94 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > @@ -201,3 +201,13 @@ For instance, a value of ``0x0001000300020003`` indicates binning by 3
> > > >      Sub-sampling is used to downscale an image, horizontally and vertically, by
> > > >      discarding a part of the image data. Typically sub-sampling produces lower
> > > >      quality images than binning.
> > > > +
> > > > +.. _image_source_control_frame_length:
> > > > +
> > > > +``V4L2_CID_FRAME_LENGTH_LINES (integer)``
> > > > +    Frame length in lines. The value of the control is the number of lines
> > > > +    captured in the sensor's pixel array added to the vertical blanking.
> > > > +
> > > > +``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
> > > > +    Line length in pixels. The value of the control is the number of pixels per
> > > > +    line captured in the sensor's pixel array added to the horizontal blanking.
> > > 
> > > In IMX219 driver in this series, we are exposing frame length in two-lines
> > > and two-line's length in pixels, which doesn't make sense with respect to
> > > these control definitions.
> > > 
> > > Similarly, for sensors like IMX283, IMX678 and others, the register is line
> > > length in internal clock units, while the control is line length in pixels.
> > > 
> > > So I think we should add a small note to prevent these awkward units from
> > > propping up in the userspace:
> > > 
> > > ``V4L2_CID_FRAME_LENGTH_LINES (integer)``
> > >     Frame length in lines. The value of the control is the number of lines
> > >     captured in the sensor's pixel array added to the vertical blanking.
> > >     Some sensors may have an internal register for the total vertical size
> > >     that is in units of 2 lines or some other unit. But the control value
> > >     should always reflect the number of lines in a frame.
> > > 
> > > ``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
> > >     Line length in pixels. The value of the control is the number of pixels
> > >     per line captured in the sensor's pixel array added to the horizontal
> > >     blanking. Some sensors may have an internal register for the total
> > >     horizontal size in units of some internal clock instead of pixels, or
> > >     the total pixel count for multiple lines. But the control value should
> > >     always reflect the number of pixels in a line.
> > 
> > The details are important here: these are really configuring timing on the
> > sensor; reading "a line" may in fact mean combining data from multiple
> 
> In that case these controls shouldn't use words like pixels or lines at
> all.

These are the terms used in sensor documentation, including CCS, which
leave this area effectively an implementation specific detail.

> 
> > lines. I think it's the "captured" that's problematic in the original
> > description.
> > 
> > How about:
> > 
> > ``V4L2_CID_FRAME_LENGTH_LINES (integer)``
> >     Frame length in lines. The value of the control is the number of lines
> >     processed from the sensor's pixel array added to the vertical blanking.
> >     This control determines how many times lines are separately read per
> >     frame from the sensor's pixel array and the control's value may be
> >     related to e.g. the height the analogue crop rectangle in lines or the
> >     number of lines output after sub-sampling or binning. Thus this value
> >     should be understood to be primarily related to sensor internal timing.
> > 
> > ``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
> >     Line length in pixels. The value of the control is the number of pixels
> >     per line processed from the sensor's pixel array added to the
> >     horizontal blanking. This control determines how many times pixels are
> >     separately read from the sensor's pixel array per line and the
> >     control's value may be related to e.g. the width of the analogue crop
> >     rectangle in pixels or the number of pixels per line output after
> >     sub-sampling or binning. Thus this value should be understood to be
> >     primarily related to sensor internal timing.
> > 
> 
> For example, how do you think someone working on a sensor where the HMAX
> register is in units of an internal clock which processes multiple pixels
> per cycle interpret this paragraph?

I think we need a new timing model for that. Everything apart from few odd
exceptions (e.g. a few Omnivision sensors) have used lines and pixels for
timing. These controls are a poor fit for that.

> 
> LINE_LENGTH_PIXELS implies a "pixel" is the unit. So does PIXEL_RATE. And
> EXPOSURE control is interpreted in units of "lines" as well.

Yes, it indeed comes down to what these "pixels" and "lines" mean. They're
not necessarily pixels or lines in the pixel array as such.

Do note that we also consider what is sent over the CSI-2 interface pixels,
even if there's no direct correspondence between those and the pixels on
the pixel array.

> 
> You are proposing to repurpose those human-readable names that make sense
> to most new developers to mean some internal units of a sensor, like 1/8th
> of a pixel. IMHO that's a bad idea. More importantly, it's not even clear
> from the names and descriptions, so a NAK from my side.

As I said, please suggest better terms if you don't like these. The
alternative is to leave a rather obvious, but non-problematic, gap between
the documentation and the actual implementation. But the bottom line is
this: this is about timing, not about actual pixels or lines of pixels on
the pixel array.

-- 
Kind regards,

Sakari Ailus
