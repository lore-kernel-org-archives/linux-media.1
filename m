Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0D3546F7
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146673; cv=none; b=sNhwpNWSWA0vANtGpp6Msnd4komL4+rUkqRufBFxbl3aumMN0N6bQo6YglGUgl/Pcu/6Z1Z4L22VOP9lEbAMD1iajDoisPfjZgh77uabHJttjdKfcXdZFRFnEj8c4x/jXaJjS+0l++fKJ6BNPtMm5NXSvfXJ2meSTLO9Y/y8iEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146673; c=relaxed/simple;
	bh=m7HpFHXBMyl5N1Su2DdmE1mXHA2VJHsyhfkSw6yEIko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dh2Lt6MphrOIGopOP6noNTjPbTgjC04iODNbYlMnT9V1qJ7dd2x6lF1l8IlkSLWNuSY1tBRR1hWUrNUDWfMGgXrt3Fz8CeMD7lPYQk4pGTjZWdbTuUYzfanYcWHKka7+Q6vOAfk0B6Tstw+q4g29Nm7REn6bsJru9W3GKtYaxW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCmsAUV5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCmsAUV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792146672; x=1823682672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m7HpFHXBMyl5N1Su2DdmE1mXHA2VJHsyhfkSw6yEIko=;
  b=RCmsAUV5akjQLMJKrFLNs3A8w8be3RywuP3JA9MHEGpMGbavlxyy8spu
   5JlfwiSvbfYJ06EdAU+NS4+U62hhR7ZpigqOdfUXKnqm7ADJNxm48MrqY
   w57/anZ503o+s/Z5Z0GWCEMpwRmSe2h4yiH8FRN5/MOxYepirMMOfbx+H
   FS/TVXG9mYjspFHgaBkjSaBa0hEHeU9utoEqSGDRcDUUEEJNdlikicb9Z
   BYsvXb2gq5/Yuk4RfXZTvnloYg9zb0Weau3G3B3kPsUVEAOUFRd8WmqXj
   TSJZoStMKeZBYncShcOdQk2XTUMUEk7N5vkx/44uR9A/s2xqco+CFyukG
   A==;
X-CSE-ConnectionGUID: B4+vqc2gStyvUByCb0zyXA==
X-CSE-MsgGUID: BUTGDVkpR+iX3CSzSxnMYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="831955"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="831955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:31:12 -0700
X-CSE-ConnectionGUID: YWNT+nCkSqOCvWYkgrkwlQ==
X-CSE-MsgGUID: XnbtrUbjTsuV1r5vrfyiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2332554"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:31:08 -0700
Date: Fri, 16 Oct 2026 13:31:05 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: Ruslan Bay <ruslanbey@proton.me>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 03/12] media: ipu6: Add IPU4P buttress support
Message-ID: <atH86Y6VcOs9-svA@ashevche-desk.local>
References: <-QUv20vwP_Fvyx8GMeVsgtsHb5NwrrqqQdutzA6KHdba6DCLA3iNDRYsFUVx-_Ja9j0ak-LPvEIkN63hKhkdr2WvlTYBP5jh38cAyc6tuFU=@proton.me>
 <asyYdEXPE7F5Wy8k@kekkonen.localdomain>
 <mGk1vEGdr5XvRZa1yzgTN831cR2a9_UdQs7oMQBBfWPBBg-fcdffI3Xdgcf_qXgrqxvNBn_hCawbXtOTMTwoqdoodbp3jmE1QMgH4kMZ4mk=@proton.me>
 <atH2LqXVEtmZI5_c@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atH2LqXVEtmZI5_c@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 16, 2026 at 01:02:22PM +0300, sakari.ailus@linux.intel.com wrote:
> On Tue, Oct 13, 2026 at 06:29:18PM +0000, Ruslan Bay wrote:
> > On Monday, October 12th, 2026 at 10:21 AM, sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com> wrote:
> > > On Sun, Oct 11, 2026 at 02:34:16PM +0000, Ruslan Bay wrote:

...

> > > Please keep the order, i.e. 4P should be first.
> > 
> > Will do! It feels a little awkward to put IPU4P_ before the
> > generic IPU6_ definitions, though. I know I've asked before, but
> > is there any plan to use IPU_ instead of IPU6_ for code shared
> > across IPU generations?
> 
> Good question. This has come up multiple times.
> 
> In fact this driver originally was written as a driver for IPU4 and through
> a number of turns was upstreamed with IPU6 support only. IPU4P is a bit
> newer than the IPU4. Unfortunately, IPU6 is used by the driver as a generic
> prefix and in some cases the definitions could apply to a wider selection
> of IPUs than just 6 but still if not all, so naming is probably bound to be
> imperfect in any case. I'm not sure the naming matters much, as long as the
> code does the right thing.
> 
> If we are to rename things, I think the non-IPU version specific code could
> have ipu_ prefix, but globally visible symbols should then use intel_ipu_
> prefix to avoid symbol name clashes. Still, anything with firmware or
> hardware register dependencies should use IPU version specific prefix.
> Probably there wouldn't be any such generic register definitions with IPU
> 4P and 8 supported, they're so far apart.
> 
> I wonder what others think.

With my IIO official reviewer hat on the experience and practice is that.
Use whatever name based on part number the driver comes for first. Id est
leave IPU6 for the generic cases, unless they are not exceptionally specific
to the rest *excluding* IPU v6.

> There are quite a few places in the driver where IPU versions are checked
> and I wonder if moving these behind an ops struct would make sense. Maybe
> we could get back to this once the IPU4P support is merged.
> 
> I'd postpone renaming after this set in any case.

...

> > > > +#define IPU4P_FIRMWARE_NAME		"intel/ipu/ipu4p_fw.bin"
> > >
> > > This may sound like a silly question, but where do you obtain this? It's
> > > not part of linux-firmware currently.
> > 
> > I forgot to mention this in the description. The IPU4P firmware
> > binary was extracted from a Windows driver package available in
> > the Microsoft Update Catalog:
> > https://www.catalog.update.microsoft.com/Search.aspx?q=42.18362.3.16827
> 
> I'll figure out whether we could get this to linux-firmware.

That's would be nice! Do you think we can do it faster for this (in comparison
to AtomISP v2 case)?

-- 
With Best Regards,
Andy Shevchenko


