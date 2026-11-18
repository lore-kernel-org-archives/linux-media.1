Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995497;
	b=JWRPvVgjBl0dtjVmeSh6lRobePB49x9joFfICZIP8FHpXRmsx/KztvST8hxHDKwHGIbT
	 xrFeZfGE/veOkgqCAMc1IIRzjpnCig0tIhv0U4ECiBN4F4raWlvgOGy2ZeVu3TIWRisJw
	 NTl9tkp9aLrbFVXbG7ppVi2pZxrmsDnCqj6FN2w8CshTYQj+GZz8Znugg5K1Px3EPnnP/
	 kLbebkMDXmqhggTcCX1GEwEG5Um35Tl8h6Jf1N26h+GR2DNCgIpiDkGcDd1Dg42RNr8SQ
	 5frWuB/t39B0IbFcJzmiOVQX3yE5bYo9gWbmcYpfhNI/3aR0JNrdYyDBfcGCzmVxLBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995497;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=SPLZHyzGwmyB6tV53wdX0nn0Xe6yutwY92+CwxQ6WDo=;
	b=NcAcWGKGxw3Gb8GZ346MC71eeMI7Gkx9ge6cmf0FlAKGQ/eaF8TUT0D93fhLRsXaTsTE
	 5PV7UxVbg67g30oA/NrD37I9tBo+XrugMTHXj4AHIr+r5plp3AL5R4QCkW2rCwK4JiJi2
	 naro+uYXg7qkRnzJLdnSjRn0AWNT3BSQtIAwxtnFaGOdo/rr0rUqDp6IayYxOT93MIvPS
	 0iqwaUGC8HvMSSdI/pRbUzHy7qKOwhpxC1fPfdKFswutX7H8ef9X8t9aADRXBEEMDF43y
	 6OALQYf0PExqNCkuEr7lNY9gTy4tBZpXlI+b2mg5hi+jR+eUu9rMRedpM7VuBu+tBjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MiSo58oM;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB8606A33E;
	Wed, 18 Nov 2026 09:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCB8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MiSo58oM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794995497; x=1826531497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3QrsWSza1jym5uWm0xeQ341okiDTHtK0dfzeNi10C7c=;
  b=MiSo58oMYumwmnLEvN2DWIDqD+b/41OFTJ4txQgiA/RZSNZ/bS7XpwnL
   CPcVxCJX2XfT28vrgFg0hqz9cx1nxr9w1tiTu80SYJyn72BamBG0UFlpH
   7mz4NxOK+hsV2JLLJB5DbyNQoTJ1EFurGSi7moorIrxHE1Y/uc6dZ97iQ
   GskU63Q9NDvcG/o4KCJvwV/j/FGUQoipeiW2gD2piUMDNiX3mHDcHyPf4
   ZMsD4ENu4RCDLefa6HiTVlIiQcvFVGbXFuFwtRkqyypY9W87zj3cFCdjo
   cTvtEV4Q9jFPomFrGT8uHgSo9Jie0ThpJ/G6iMCL7rebdW0vQbBa2oiXq
   Q==;
X-CSE-ConnectionGUID: G3DsNle1T8Sb4mjCJXMPNg==
X-CSE-MsgGUID: o5c0T4zmQCe5KwRp/SKGjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3837852"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3837852"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:51:16 -0800
X-CSE-ConnectionGUID: P2XiFKnKTFOq/jKWbzMQhA==
X-CSE-MsgGUID: YfBoIbK+QnShwm3bFaRYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10434684"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:51:14 -0800
Date: Wed, 18 Nov 2026 11:51:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the
 preview pipe can't output
Message-ID: <av11D183z21CosFd@ashevche-desk.local>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
 <20261116175750.21905-2-volodymyrchapman@gmail.com>
 <avwtA3b3XMkGXPfZ@ashevche-desk.local>
 <20261117175635.11790-1-volodymyrchapman@gmail.com>
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
In-Reply-To: <20261117175635.11790-1-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 05:56:35PM +0000, Volodymyr Chapman wrote:
> On Tue, Nov 17, 2026 at 12:31:31PM +0200, Andy Shevchenko wrote:
> > So, what makes us stop implementing the crop support there?
> 
> atomisp only uses its crop path for sensors whose driver supports the
> NATIVE_SIZE, CROP_DEFAULT and CROP selection targets
> (atomisp_init_sensor()). The IMX175 driver does not yet: in his review of
> it, Dave Stevenson suggested that binning, and possibly cropping, should
> wait for the Common Raw Sensor Model. Once the sensor supports cropping,
> atomisp takes the atomisp_enum_framesizes_crop() path and this code
> is not used for it.

Personally to me the above sounds like "we don't accept more raw sensors until
CRSM will be implemented". Because I don't see the point in implementing this
hack just because something is pending. Perhaps we need to push people to tell
what the estimations are for that to appear?

> Even with crop support, preview mode would list nothing larger than
> 1920x1440: that is the largest entry in the frame_sizes table of
> atomisp_enum_framesizes_crop_inner(). This patch applies the same limit
> to the non-crop path.

This confuses me. Would this code be still in use after CRSM be implemented?

> > No need to repeat these two paragraphs, make sure they are in the cover letter.
> 
> Of course. I will keep them in the cover letter only in v2.
> 
> > TBH, this feels like a hack, but I'm not v4l2/media reviewer/maintainer,
> > so I don't know if this approach is legit.
> 
> The intent is to make VIDIOC_ENUM_FRAMESIZES match what
> atomisp_try_fmt() returns, which already clamps the size to 1920x1440 in
> preview mode. Without this patch the IMX175 lists 3264x2448 and
> 1624x1216, and TRY_FMT for 3264x2448 returns 1624x1216. With it, the
> IMX175 lists only 1624x1216 and the OV2722 lists 1916x1076, 1616x1076
> and 1436x1076. Every listed size is returned unchanged by TRY_FMT, and
> for the other sizes I tried (640x480 up to 3264x2448) TRY_FMT
> returned only listed sizes.
> 
> Hans, Sakari, would you prefer this, or a different approach for the
> non-crop path?

-- 
With Best Regards,
Andy Shevchenko


