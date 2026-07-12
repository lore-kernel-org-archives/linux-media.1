Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C82374A15;
	Sun, 12 Jul 2026 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783852508; cv=none; b=cgGH6RCop5V2rz4WTfn4DMh2HEtC7OOAHGRw1r9/aEGpFyoxsRoIHbFt1GBYwU18KsUH0gSXRLy7GWsHIFi9Iwkte37wOG31cByTUxUUsRmUMcfPYO1C/yEBKmjfa+TE/XifEKlHXktWGiTaY2OBcaWzYt2dWLi6+E98wS8CLBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783852508; c=relaxed/simple;
	bh=tI3CaQx3mFIZX4RZm8bMvWEnnlKPPcY6zG2lneI0Bew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jd3whgq2kj0xnmCUhSESKOKp+XzNZrg8scW/bfS3aIBSZ7oDvoimKT24H4vm79z/9ubJXXLa1Lsl6lCeHfY//reiqHEBPN4EPfQNA5EvCD/FSjrVUwncV2IPjCdMHkJRbybEkxu6kbLbG5ZORuZ7xLGiT4w09CEXs02y20Be0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnrkuDb8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnrkuDb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783852507; x=1815388507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tI3CaQx3mFIZX4RZm8bMvWEnnlKPPcY6zG2lneI0Bew=;
  b=EnrkuDb8Vd/uNOOX1dDZX77j0cHUJdBKsIxj6xswGlQxwXubk4Ff05WN
   5X2bFpVuJsV5Jo7MFY3ZR4eJriK22aG40DBxUp718TdGTgOZz11+k1k2d
   m97ZZLsADExyHIY9UgZHakV5Qnp7J5wvGOKb9d88iCcCMRzziafAtCGrs
   11lRi61EBINIiHReeQypI/TP0davDroTDZX2IHfJfgSE8svKybK10y6IE
   /acv+JmH6tcN7n8RahoaX32JthwO7RT4Pt0TRPkVRknduKvrneAd7Go19
   fOaBToxbsJJSkqkpsU3e2Uspl1c2IxU00u5TBCr4fMboa1MRfygx20o73
   A==;
X-CSE-ConnectionGUID: /XXSKA2BSj2HCsLCwX4RCA==
X-CSE-MsgGUID: 4LB0dMC7Q0GTlK9zid/ueQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95134951"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95134951"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 03:35:06 -0700
X-CSE-ConnectionGUID: DKblHr9LQfm+hYHVpq0d8A==
X-CSE-MsgGUID: WRLMbcWSRZqM9D+C8tvFhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248920919"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 03:35:04 -0700
Date: Sun, 12 Jul 2026 13:35:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: media: atomisp: fix grammar and
 punctuation in inline comments
Message-ID: <alNt1gjWB_dAeRkp@ashevche-desk.local>
References: <20260710120254.23565-1-bohdandmarcus@gmail.com>
 <20260710120254.23565-3-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710120254.23565-3-bohdandmarcus@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 10, 2026 at 03:02:54PM +0300, Bohdan D. Marcus wrote:
> Update inline comments in atomisp_cmd.c to comply with kernel
> coding style and maintainer expectations. Specifically:
> - Capitalize the first letter of sentences.
> - Add missing periods at the end of statements.
> - Ensure proper spacing before closing comment tags.

Nice, but the same question as per previous patch.

-- 
With Best Regards,
Andy Shevchenko


