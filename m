Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE2336212D
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168170; cv=none; b=tinHwn5SyGaVfeTJoGI16T3HvKliWgcQbxwMkoPgxykgq5CXXlry1LgE0XPMdanRfReLKrMnwprh/aPtMIBFRflYGY2MP4y3A14cpN9Gjr1USE4s8JtSwJWgOhCD5eMJrwdzrWDA5imx3Mjbv7SkuEXwCAfoDf5IgMw2VcSXFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168170; c=relaxed/simple;
	bh=eFdvmPb/GtoVKj2jUng8gFNOMY1piiX2k90vUuYvQoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+m44DwF3hRRb05qGZ5Rvcjdk3B/4kcCOi51f4gY73EpvLnLCBhW1x2pFgoNuH9jUqTRRZqp1VV/O4ots2QAkAI3OmR7lZSBvsQwL/N0O+VdpWEoHoflpZVYt72IHxY59Ff2iIIhyuxO63txISP40/opdqD/Ejp1SU8ri4N4CsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIRbA5I7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIRbA5I7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781168169; x=1812704169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eFdvmPb/GtoVKj2jUng8gFNOMY1piiX2k90vUuYvQoQ=;
  b=KIRbA5I7O3X3Yr6IJXRcsU5WXRbZBus3N0U3VRAm0qFMgW4CdsZ+P3yk
   RxiFnsXFihU6RH3XoY5uagWcsmPRapHiQHkGEY6xa7uCLVXPKdNnoXy+Y
   q2llTrFnIpcRCBDYvnCMTPbIULvoidb3kXRpXeTGfdXB10r0IEFGANMbx
   t6c6I7j7u8CG/OaLxmNgXH7UskuhXpcKhq8sPZ1ITlEl6+bXTa8/Ufaqw
   s7mLdTLU543oRXmGTv/xttiSkJFj7UWu+X3JazZ/vGLzMwkZnd1BfQ+0V
   45XcZ7fy+qYXxc5/7Yk68kdCtVSNdn+tw+/PejJ1u+17J/wQUSD/2jh5T
   g==;
X-CSE-ConnectionGUID: dc/EhR6sRgmpYPeE6r+g4w==
X-CSE-MsgGUID: TQgczVtmR4CsML3LpCoxRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92653189"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="92653189"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:56:08 -0700
X-CSE-ConnectionGUID: Ycj/g+GNTnaIuVR+SUfZgw==
X-CSE-MsgGUID: 0960U8t1S7qyT3WWtb0VUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="245300052"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:56:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 867ED11FB16;
	Thu, 11 Jun 2026 11:55:58 +0300 (EEST)
Date: Thu, 11 Jun 2026 11:55:58 +0300
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
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	" Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 33/86] media: uapi: Add new controls for camera
 sensor FLL and LLP
Message-ID: <aip4HgMfEnidvlPN@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-34-sakari.ailus@linux.intel.com>
 <178115623672.1799417.2005627235315487289@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178115623672.1799417.2005627235315487289@freya>

Hi Jai,

On Thu, Jun 11, 2026 at 11:07:16AM +0530, Jai Luthra wrote:
> Hi Sakari,
> 
> Quoting Sakari Ailus (2026-04-10 01:44:08)
> > Add new controls for camera sensors, V4L2_CID_LINE_LENGTH_PIXELS and
> > V4L2_CID_FRAME_LENGTH_LINES, to convey the combined size of the analogue
> > crop rectangle and horizontal and vertical blanking.
> > 
> > The reason for adding the new controls is that they're much easier to use
> > as the user doesn't have to be concerned of the analogue crop in the same
> > context. Secondarily, the newly added common raw sensor model uses
> > different values for the same.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> >  include/uapi/linux/v4l2-controls.h                     |  3 +++
> >  3 files changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 63e53c883db6..fb4dee1b4f94 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -201,3 +201,13 @@ For instance, a value of ``0x0001000300020003`` indicates binning by 3
> >      Sub-sampling is used to downscale an image, horizontally and vertically, by
> >      discarding a part of the image data. Typically sub-sampling produces lower
> >      quality images than binning.
> > +
> > +.. _image_source_control_frame_length:
> > +
> > +``V4L2_CID_FRAME_LENGTH_LINES (integer)``
> > +    Frame length in lines. The value of the control is the number of lines
> > +    captured in the sensor's pixel array added to the vertical blanking.
> > +
> > +``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
> > +    Line length in pixels. The value of the control is the number of pixels per
> > +    line captured in the sensor's pixel array added to the horizontal blanking.
> 
> In IMX219 driver in this series, we are exposing frame length in two-lines
> and two-line's length in pixels, which doesn't make sense with respect to
> these control definitions.
> 
> Similarly, for sensors like IMX283, IMX678 and others, the register is line
> length in internal clock units, while the control is line length in pixels.
> 
> So I think we should add a small note to prevent these awkward units from
> propping up in the userspace:
> 
> ``V4L2_CID_FRAME_LENGTH_LINES (integer)``
>     Frame length in lines. The value of the control is the number of lines
>     captured in the sensor's pixel array added to the vertical blanking.
>     Some sensors may have an internal register for the total vertical size
>     that is in units of 2 lines or some other unit. But the control value
>     should always reflect the number of lines in a frame.
> 
> ``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
>     Line length in pixels. The value of the control is the number of pixels
>     per line captured in the sensor's pixel array added to the horizontal
>     blanking. Some sensors may have an internal register for the total
>     horizontal size in units of some internal clock instead of pixels, or
>     the total pixel count for multiple lines. But the control value should
>     always reflect the number of pixels in a line.

The details are important here: these are really configuring timing on the
sensor; reading "a line" may in fact mean combining data from multiple
lines. I think it's the "captured" that's problematic in the original
description.

How about:

``V4L2_CID_FRAME_LENGTH_LINES (integer)``
    Frame length in lines. The value of the control is the number of lines
    processed from the sensor's pixel array added to the vertical blanking.
    This control determines how many times lines are separately read per
    frame from the sensor's pixel array and the control's value may be
    related to e.g. the height the analogue crop rectangle in lines or the
    number of lines output after sub-sampling or binning. Thus this value
    should be understood to be primarily related to sensor internal timing.

``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
    Line length in pixels. The value of the control is the number of pixels
    per line processed from the sensor's pixel array added to the
    horizontal blanking. This control determines how many times pixels are
    separately read from the sensor's pixel array per line and the
    control's value may be related to e.g. the width of the analogue crop
    rectangle in pixels or the number of pixels per line output after
    sub-sampling or binning. Thus this value should be understood to be
    primarily related to sensor internal timing.

-- 
Sakari Ailus
