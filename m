Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63673A5E71
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753109; cv=none; b=acbRHHNHsGnzZUkoZCjlXADy0bXrrfqE3KnceXrlhlsrB6HAGqo9R2DoLgx7gKy5+4LF12bOnaZkYHqegJ2HZohcH+IOG9TqD1Rt7y6tDMJLB3wrqTG2P5d2je0o9zBzBP/lw3FFpOCdLunsbUMk85VbObX2latovOxsUCncmpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753109; c=relaxed/simple;
	bh=HMLEkcbZRa5/MpqWAQTVqAmI/OC33jbQdqUlDKn52K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JinWr1ICdILg7wdXNTzO+aKAXUJDNHfNalk1KSFLyHXztbXTNQM8MGRvHygw+7PoXJYScf3rGtO7hRSGRKEdxxzH8t8PrMrOlTk7Om4F8adrP7yvfMVUtglfEu7s1pkIY3+eI8ionmHvlHdFuTrHbfAHZm42MJ39UYUZd749jg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyvaNeOh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyvaNeOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753109; x=1805289109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HMLEkcbZRa5/MpqWAQTVqAmI/OC33jbQdqUlDKn52K0=;
  b=kyvaNeOh8+TySQ3L0QUQLmWdZShQsfZ8SX7ECL2hHem8Pl3Lq4uk+eBE
   M2Zq+uu43zUEcVYZe2az2rA5TP9FJeqifJfkVJLuk9tlLdYdlIWW/f6yq
   nuHKe9GS9tFr0eeLSe3dDwtAy/8JRiWHDFp0bOLKDDgbkFIp3OJXVCXOT
   BpTIXxwiRM+tE83NG68xHBdTqGm2IzzdMFhPgBziYeQZfzoK1fOnTJwLd
   mEXWB+HcK9koNO8HptOuA2ySZ3LfAsDe5bkZrQ3YRyl6bZg1jKwH+J9RX
   wDhO7n+drCG9oZikCcfdTIA5FpnFpPsSJZbwRl6+LsLKHOX1O+5mPaQYs
   w==;
X-CSE-ConnectionGUID: qsC3S7UzSqeeiA7QfPVoMA==
X-CSE-MsgGUID: u4O4rIeeSJOuGNIp5XKQfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74697703"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74697703"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:11:48 -0700
X-CSE-ConnectionGUID: wXW49sFBSm+SoHCKuAPaog==
X-CSE-MsgGUID: VfbFazvxSfeji4WqNKqiJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="245279770"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:11:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 19B8B11F870;
	Tue, 17 Mar 2026 15:11:46 +0200 (EET)
Date: Tue, 17 Mar 2026 15:11:46 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 2/7] Check we have a supported format first before
 allocating memory
Message-ID: <ablTEn2GTCkeZwfN@kekkonen.localdomain>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-3-sakari.ailus@linux.intel.com>
 <20260317105400.GC302774@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317105400.GC302774@killaraus.ideasonboard.com>

On Tue, Mar 17, 2026 at 12:54:00PM +0200, Laurent Pinchart wrote:
> On Tue, Mar 17, 2026 at 11:57:57AM +0200, Sakari Ailus wrote:
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  raw2rgbpnm.c | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > index 121f0e0272e4..8aa7258218ad 100644
> > --- a/raw2rgbpnm.c
> > +++ b/raw2rgbpnm.c
> > @@ -370,20 +370,7 @@ static void raw_to_rgb(const struct format_info *info,
> >  		src_width &= ~3;
> >  
> >  		const struct format_info *old_info = info;
> > -		unsigned int new_stride = src_width * 2;
> > -
> > -		tmp_src = malloc(new_stride * src_height);
> > -		if (!tmp_src)
> > -			error("can't allocate memory for the temporary buffer");
> > -
> > -		for (src_y = 0; src_y < src_height; src_y++)
> > -			for (src_x = 0; src_x < src_width; src_x++)
> > -				raw_put(16, tmp_src, new_stride, src_x, src_y,
> > -					raw_get(info->bpp, src, src_stride,
> > -						src_x, src_y));
> > -
> > -		src_stride = new_stride;
> > -		src = tmp_src;
> > +		unsigned int unpacked_stride = src_width * 2;
> >  
> >  		for (unsigned int i = 0; i < SIZE(v4l2_pix_fmt_str); i++) {
> >  			if (v4l2_pix_fmt_str[i].fmt == info->compat_fmt) {
> > @@ -395,6 +382,19 @@ static void raw_to_rgb(const struct format_info *info,
> >  		if (info == old_info)
> >  			error("no supported format found for %s",
> >  			      old_info->name);
> > +
> > +		tmp_src = malloc(unpacked_stride * src_height);
> > +		if (!tmp_src)
> > +			error("can't allocate memory for the temporary buffer");
> > +
> > +		for (src_y = 0; src_y < src_height; src_y++)
> > +			for (src_x = 0; src_x < src_width; src_x++)
> > +				raw_put(16, tmp_src, unpacked_stride, src_x, src_y,
> > +					raw_get(info->bpp, src, src_stride,
> 
> info now points to the format_info for the compat format. I think you
> should now use old_info->bpp here.

Yes, makes sense.

> 
> > +						src_x, src_y));
> > +
> > +		src_stride = unpacked_stride;
> > +		src = tmp_src;
> >  	}
> >  	}
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
