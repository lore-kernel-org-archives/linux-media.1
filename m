Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A04949B21D
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162869; cv=none; b=uG4FODblXWfXXD/0jgx8Kw2rB85MdT167RmKaSsolj71s+FSRy2AGMzVAelJ8gNJtOpSvqgkkgwATyltvoe2nqjUjRTFHf3pKX2LCrBqYDBYBOJXfUlpR/5QjhLlASoPYZQMl7kHesTXnnKVfDKuUBtVlWOOzKvGvTG4DewwygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162869; c=relaxed/simple;
	bh=baRxkTEPeQvB44RF7rkxpB7ol7wuaumLy8U7pR4DmjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFB86Qb/5QBPTlCjckCHKK2zIt+XPfH0uhd6NuUQTPGALfxD2jk3RV/YOzsL0ScnV4m5mHCD8fp8fwNvwhvp1/NPhqBsfJ/Ah7H5HsyHmHYNu6m4cUTs0+0W6Auiq7WK4yYqwNsuSjTZNfKE/wzxGJqUWnXFgHym7NOj9u/i6Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjLxULql; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjLxULql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790162866; x=1821698866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=baRxkTEPeQvB44RF7rkxpB7ol7wuaumLy8U7pR4DmjQ=;
  b=hjLxULqliqUL96BufC2+eahw5u5o5OQVQF2vgE2hMH8YhvLvN9niA6SL
   wgXcFXMSw446FU+AN+r1pt4aOFYxVbePZkE5gOBIuUZnNo1vWWeyCcU9n
   zBFWCj883HDl40J2hZknMZNCFi1LbAZwEfcZnKAmDEaKOYZzpd+aD/r71
   8kVgRMVX1j/VaS7qvIXdFi0pLaoLQ8b+K/lhlyseSLzUFrJXq4He/BWeX
   URirUEpCcScAFZOFLR6QCUQhuG78NYYxcbvXmfTzmX2PiEqTFBCkgs3aC
   DaZrfpaR529WnOjJ4ymfeoNtNyqm9EbMBX6+jPJI3K1dLr/2+xDjxFkaF
   g==;
X-CSE-ConnectionGUID: y5JV2jo9RbKxLdXz9XKk9Q==
X-CSE-MsgGUID: z0JEgdgBTxKkT/aDREQM0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102202995"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="102202995"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:27:45 -0700
X-CSE-ConnectionGUID: ThnTeHcnTEW5Jna6cOanKQ==
X-CSE-MsgGUID: BG5HuZxHQPKqH/adJ5ewDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="299808263"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:27:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E4E4B12080C;
	Wed, 23 Sep 2026 14:27:41 +0300 (EEST)
Date: Wed, 23 Sep 2026 14:27:41 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 01/29] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <arO3rTf4vRD4OfxC@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-2-sakari.ailus@linux.intel.com>
 <CAD++jL=kHg-rMyQJ5_Rb0RKMq8dM4yt4HRkMG5qZ5A2J=wAQLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=kHg-rMyQJ5_Rb0RKMq8dM4yt4HRkMG5qZ5A2J=wAQLw@mail.gmail.com>

Hej Linus,

On Fri, Aug 28, 2026 at 12:29:36AM +0200, Linus Walleij wrote:
> Hi Sakari/Frank,
> 
> one more thing which might be a rookie mistake on my side though:
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> In this example:
> 
> > CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> > See section 9.4.
> >
> > Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
> > MIPI defined data type and avoid below duplicated static array in each CSI2
> > drivers.
> >
> >         {
> >                 .code = MEDIA_BUS_FMT_UYVY8_1X16,
> >                 .data_type = MIPI_CSI2_DT_YUV422_8B,
> >         }
> 
> The way I read the CSI-2 spec YUV422 8bit has this byte order: U Y V Y
> (this is in section 11.2.4 in my copy of the spec, figure and all)
> so this looks correct if you just look at that string: UYVY no problem.
> 
> I tried to understand the MEDIA_BUS_FMT_* conventions...
> I looked here:
> https://docs.kernel.org/next/userspace-api/media/v4l/subdev-formats.html
> 
> And in the table in the docs:
> 
> Word 1: bit 15..8 is U, bits 7..0 is Y
> Word 2: bit 15..8 is V, bits 7..0 is Y
> 
> I *think* 1X16 should be understood as 2x16bit words (samples?) where
> each 16bit word is in LSB, MSB ("little endian") order, i.. bits 7..0 (Y)
> are transmitted *first* then bits 15..8 (U) correct me
> if I misunderstood!
> 
> Then UYVY8_1X16 becomes the *byte* order Y U Y V.
> 
> But YUYV on the other hand becomes U Y V Y !
> 
> Isn't this then MEDIA_BUS_FMT_YUYV8_1X16 ?
> 
> I'm reading the spec and Linux format codes until my eyes fall out...

Good question. The practice has been to use mbus codes ending _xXy, where y
is the pixel depth, to denote MIPI CSI-2 data types. Presumably, if a
driver uses these formats with CSI-2, then this is the MIPI CSI-2 data type
employed, even if the pixel order is different.

The entries are used to convert the mbus codes to MIPI CSI-2 data types, so
I expect no issues even if we have a data type for an mbus code that
doesn't have an exact match with the MIPI spec pixel order-wise.

> 
> It's there in the code though:
> 
> > +       { .code = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> > +       { .code = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> > +       { .code = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> > +       { .code = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> 
> all four of the related encodings, I don't know if this works in practice
> but it seems off. Three of them must be wrong since MIPI_CSI2_DT_YUV422_8B
> is very determined?
> 
> Obviously I didn't check the entire table like this, but if there is something
> to what I'm saying then we have to...

-- 
Med trevliga hälsningar,

Sakari Ailus
