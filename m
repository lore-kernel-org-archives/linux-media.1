Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783811;
	b=mqri3fMNRA4SdynOn0SKQnmGGnz0alozNryJ0FNexyFGfbTyvLbWZVoY2ZjFEiK62FK0
	 JJQofQHh0b780rAEGGmo5MHLfjEa181Z4iEwfdytr4IZWlvWWVlPUI+LxjWggg88v8hne
	 UTyMufKzNSEMyZcNEnTpaYN5oQWY4M/V0nZg7gPbdSNvOWJ+zHPcqz9/IylAN147PUsCA
	 9ZsIefFh1moih1p0aFE7tj6aXuGN4pTS64jF0JPnLEthtqu8+XTUKxs2KvMS+lbZNDLHs
	 L35F1qXrurjUMLWS7oahPpnELJeL6eqRGT6ZpSSy/dS2xV+99ZuKsRMgh1b8DzGlrOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783811;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IEQnXYOO+T6jwapkWvDlhqM4gjEfSwiND/1h85JcKWw=;
	b=rLmdfTXWrwrdg0rBTPqp0LttqVgViPqiq6DAkTmaoylF9svi7FVb1fSHD9l8eDFSuLP6
	 BQroLa9twANLKJnS6Tjzi+KKycFqJEpMt2l0t0ug/oXqGDQOmcTosZ8Jg2jj9u7wAuj1j
	 pxHOF3XALgxLGzg5TK91UVlEthyr7fuBK5Zm9yJM2fMzH+kY3MHzU2du0oJSmnXsDaY9m
	 l4uJk7s0f1SVG7bEQGBl58oykY5JRnR8XeJH8j1nx+oTOBHAI22I8VjdAaevGVmM05QiD
	 mz0ousZaitqOjd2e+uTtKpEHCVYbQOQJUqBI2LU3FQ5YRzoA/ZVpWueKOSZlsD/cXWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MWuasuzz;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B03606A328
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 09:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B03606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MWuasuzz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793783811; x=1825319811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTf2O+jinMKiepChThjDXSEKE/z9wK977Ko4bN10J1E=;
  b=MWuasuzza6WlptSohnPMr2QTelYgV4PM5MKxKjzRJRLNf1rg7LPGBL+V
   8Klm3Cx82enbDjCZRJLMGGSGJNHPbEsasPlq5m2mNt8h8KqP2Uwm1UEvI
   EXV4s+IGJg+c9JCrJzZHR2D0b9RPI8xxyoQ4jGWekI/jplxxXGOWb7W0+
   9zEPRmzcpsRz+L8p9GdooncyT/54cX0/vnt95AI6/b7CShd5kxjUPtBeQ
   phVvADsyizA+0fNVIE3mSkwCKM6G0mk8taiEAU6+Nk7zExi4jr+uK+1U3
   D8In+Woj48A8GXDMoWve4DRRAeTmAcrUgDJdKuWE7YiY/Hqz9T+YYX+5g
   w==;
X-CSE-ConnectionGUID: yv7Dyn4DT9S/LgP2nKrwbw==
X-CSE-MsgGUID: AUJXRBczQ0+d+Wm+11HWYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2561632"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2561632"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:16:50 -0800
X-CSE-ConnectionGUID: E11pF1eaR+qtMrvF8MxfHQ==
X-CSE-MsgGUID: lhnt3h08Tq+h9Cg5E/93+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6772995"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.19])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:16:46 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32A1D11F83D;
	Wed, 04 Nov 2026 11:16:56 +0200 (EET)
Date: Wed, 4 Nov 2026 11:16:56 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 12/12] media: ipu6: Enable IPU4P PCI device
Message-ID: <aur4CH6Fs-N85xVM@kekkonen.localdomain>
References: <-VmuiglzUKRQZr-LsGrxgUOui_lD6A5MFZSUaqydvel67SrRKztah31JBIbpXna3-DHv20o_UoRPGoRRaM8JylV21MwjO-VMYJk-TuSCD34=@proton.me>
 <aury3n59VFnmKprr@ashevche-desk.local>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aury3n59VFnmKprr@ashevche-desk.local>

Hi Andy,

On Wed, Nov 04, 2026 at 10:54:54AM +0200, andriy.shevchenko@linux.intel.com wrote:
> On Sat, Oct 31, 2026 at 12:39:09PM +0000, Ruslan Bay wrote:
> > Add IPU4P to the PCI device ID table now that the required MMU,
> > buttress, firmware, ISYS and CSI PHY support is in place.
> 
> ...
> 
> >  	help
> > -	  This is the driver for 6th, 7th and 8th Gen Intel Image
> > -	  Processing Units, found in Intel SoCs since Tiger lake and used
> > -	  for capturing images and video from camera sensors.
> > +	  This is the driver for Intel IPU4P, IPU6, IPU7 and IPU8 image
> > +	  processing units, used for capturing images and video from camera
> > +	  sensors.
> 
> Make the text user-friendly, almost nobody understands this cryptic text. It's
> unuseful. On top it's inflexible to the further possible expansion. Compare to:
> 
> 	  This is the driver for Intel image processing units,
> 	  used for capturing images and video from camera sensors
> 	  on the following devices:
> 	  - Ice Lake, ... Lake (IPU4P)
> 	  - Tiger Lake, ... Lake (...)
> 	  - ... Lake (...)
> 
> As you may see the user who is going to buy a laptop may have a clue
> of the Ice Lake and other code names and zero understanding what the heck
> IPUxxx means.

I guess also the original could be improved; Tiger lake doesn't necessarily
say much to the layperson anymore. I'll post a patch, IPU4P support can be
added on top.

-- 
Regards,

Sakari Ailus
