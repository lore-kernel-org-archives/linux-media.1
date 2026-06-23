Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2793B6347
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200362; cv=none; b=LLMDkiUC+Y6C1EtpAQzDlKCbeHtCnTdRphs4Qcwmx7U2k9TGxefeefJa8v1OVOtDVSgRR+2GqvH5cksaayiUgSo6CvkMv7wSE2T6IX8v15PHC/e/oROYWxrqKoIiXuzhcJHYNabRstOVpyrmn3OutfZrQbQ6WWiBAVZFuV+Bqvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200362; c=relaxed/simple;
	bh=KKtMuH/sXLmTH09HrsZ3uNZ86/jePH5vzK83U95UUeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+SoOoRU7HcuAaSHsNXWY9LuzPywYn/ctWJHuPnggvitkBmdP01ISo5HngKLCW4WQp61dd5MTW/9RK0PwCF1WLyCXva1rx9OSMoPCkcDU6QwlWUoyw8xXbYqhEdYBK3RztZDZeLjU+nOtyszsB0BtqwtFPlKKn+xXeCkoeMCftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZQbnwEi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZQbnwEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782200361; x=1813736361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KKtMuH/sXLmTH09HrsZ3uNZ86/jePH5vzK83U95UUeE=;
  b=CZQbnwEicbgAznurV0b6pEzpk5t/U57gMl1l5nvrDW4DJkY/d+jQMr6q
   O/MqohOggVIFyyMcaxol5SbliaHVb/eWM9Irs382k7vDgisN+OccP6Kbm
   Y9c+OHXsBpmBfWjUS/E4skbksvNep0Nm7RfbnRGqX7V5QdK44foBxoPS6
   AG1u/j3HPMid87dEZTy946suBEWre6fPyvnxcYlD+zgEGUoKqkU8Foark
   uhRHiD+CkRJ5xb6/j4+avBvSbcRAc7cG/6GEAE3RFGWZ6eud0kZByJTTy
   wnxnFj6MehPSm3fW9/7OULNbxbobzGuI3RdmTG+AFXr+d1E0m8d4EfUn4
   A==;
X-CSE-ConnectionGUID: aGQ5SzqWT3mbD7+g2Gzq+w==
X-CSE-MsgGUID: cloi1gTpT/qFuyXuNrfDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100364396"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100364396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:39:21 -0700
X-CSE-ConnectionGUID: +5ticuOHS6WDGr3f2rD3Yw==
X-CSE-MsgGUID: VVBGn1mZR2uDbbIlf+QMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="251381868"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.1])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:39:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B03891206D5;
	Tue, 23 Jun 2026 10:39:16 +0300 (EEST)
Date: Tue, 23 Jun 2026 10:39:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 00/17] Rework frame descriptors
Message-ID: <ajo4JPUmRvtn2VQM@kekkonen.localdomain>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <65ab9804-d6ac-4110-9bed-e259195d8f26@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65ab9804-d6ac-4110-9bed-e259195d8f26@ideasonboard.com>

Moi,

On Thu, Jun 11, 2026 at 03:49:13PM +0300, Tomi Valkeinen wrote:
> Hi Sakari,
> 
> On 18/05/2026 19:43, Sakari Ailus wrote:
> > Hi folks,
> > 
> > This smallish set makes frame descriptors dynamically allocated and
> 
> Is there a real-life requirement for this? 8 frame-descs per pad has been
> more than enough for my uses so far.

Imagine cameras producing four streams each, and putting a number of them
behind CSI-2 aggregators (or some serdes device). It does happen in
practice.

> 
> > implements a single-entry frame descriptor based on the device's format,
> > using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
> > do not obtain their frame descriptor from upstream are converted. The
> 
> Hmm, what does this mean? Don't all the drivers modified here already get
> their frame desc from upstream? Or did you mean "all drivers that obtain
> their frame desc from upstream..."?

This was meant to say that the drivers that called get_frame_desc()
directly but did not implement .get_frame_desc() pad op are converted while
the rest aren't. I'll rephrase this for v3.

> 
> > helper also obtains a frame descriptor for the desired type (parallel or
> > CSI-2) and checks there's at least one entry there. These checks are
> 
> What does this mean? In patch 3, the desc says "If the remote sub-device
> does not support frame descriptors, v4l2_subdev_get_frame_desc() creates
> one".
> 
> So does v4l2_subdev_get_frame_desc() just check, or does
> v4l2_subdev_get_frame_desc() implement a fallback mechanism, if the upstream
> subdev does not implement .get_frame_desc?

Correct.

> 
> If it does, some of the drivers implement their own fallback. E.g. rpi cfe.c
> calls cfe_get_vc_dt_fallback() if it gets -ENOIOCTLCMD, which just
> constructs a default single-stream frame desc with virtual channel 0.

This fallback can be then removed, yes. I'll check the drivers again in v3.

> 
> It also looks like you only modified platform drivers. Did you check the i2c
> drivers? Some call get_frame_desc().

I guess they all use various frame descriptor pass-through functions
nowadays.

> 
> > removed from drivers that currently perform them. (Some drivers also check
> > there's exactly a single frame descriptor entry but I think in most cases
> > this check could be loosened. That could be done after this set.)
> 
> Hmm, isn't that strictly tied to the multi-stream support? Or do you mean
> that frame desc could contain multiple entries, but the receiver would only
> use one (if multi-stream is not supported)?

It's not strictly tied to multi-stream support. Most receiver drivers can
receive a single stream even if the source generates more than that. The
only one that can't do that which I'm aware of is some Xilinx device; I
recall Laurent knows more about it.

-- 
Terveisin,

Sakari Ailus
