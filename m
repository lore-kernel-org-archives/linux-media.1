Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2134404E
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643245; cv=none; b=t7BFEZXfAnZufyrG6Qx+9vo3jBTifU6AoSAwr4z68lNCTVE+Itb4jHLJZmW1iHP/hCyaYIa/OHe8ioHrF+1uNskgxAIf+QCixFTnjWQHRWjgSMr1vbCiuugtthNSDiu1E7GfX8OobfLr1TOdYuwMqy5/9R63aCgPAw7SL6qa/VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643245; c=relaxed/simple;
	bh=Sal6T08EbwzV4/LeEzfhekoVfNtkaAYnfyB01YeUK6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPdq6T75n1tlSL5qBb5toOk2jhHdxVbmEVsUcwqNdxJX9SSX9/DPhdZ98m2Rdn2Xq0qEqX453nNRBoL16mmM6XEcD9Q5psPI4ONy0FLxz7FqoQi9jSXaD7rKmdg0e7JXN0hM/pZwWb9dK5TZKjsJ1STBZc92GgosMelnQajUJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhAePQ4i; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhAePQ4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787643244; x=1819179244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sal6T08EbwzV4/LeEzfhekoVfNtkaAYnfyB01YeUK6g=;
  b=GhAePQ4iGM7yF65SpAPHjX3OUWOTtEHlQUid0QcFgSkpkx4gBApNHcjV
   +vV+5POa7BdE8p8vjVH9e1EizsXnaFU7rVSWrIzhFNstqtbohgV24jd0C
   rYIcjBVkiUox21D4U90Z3lxbKOhfoPnEQrEBEUf0//8qit+w7OWgr5yHJ
   Euv0T+0UFq1dmfbioiV/pPdCV3HKuaRuad6sgD5jfu1M+o9PUPz5+7Zc6
   akyLuMCNDoKv/hx8qCeAL9KPsnE7uK8W638CS9cvZ42zYBBwUyzMChtWu
   CVvwBpRwZP3hdudXHBVZsYt+2nmkO22cB9XVMElMBxd/dB238BHCXnXQw
   g==;
X-CSE-ConnectionGUID: PeQm8F6ETeO5wPLFISrA2Q==
X-CSE-MsgGUID: AnPh01IaT+21PhHbhqGVHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105483944"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="105483944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:34:03 -0700
X-CSE-ConnectionGUID: RkqWjf+sQjiXpLS00Z0/BA==
X-CSE-MsgGUID: ji+5n5t/QSqF5YrESmHsoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="290741016"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.50])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:34:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5C6CE12033D;
	Tue, 25 Aug 2026 10:34:12 +0300 (EEST)
Date: Tue, 25 Aug 2026 10:34:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 28/29] media: v4l2-subdev: Use
 v4l2_subdev_get_frame_desc() for passthrough
Message-ID: <ao1FdDPwuOOb0sPY@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
 <aoy5oEnNS7z_Dcby@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoy5oEnNS7z_Dcby@lizhi-Precision-Tower-5810>

Hi Frank,

Thank you for the review.

On Mon, Aug 24, 2026 at 05:37:36PM -0400, Frank Li wrote:
> On Mon, Aug 24, 2026 at 03:14:50PM +0300, Sakari Ailus wrote:
> > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor in
> > __v4l2_subdev_get_frame_desc_passthrough(). This is preferred over calling
> > the get_frame_desc() pad operation directly.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 34 +++++++++++++--------------
> >  1 file changed, 17 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 8c3c5b6e4ee8..2172bb8313ec 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2558,6 +2558,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >  					     unsigned int pad,
> >  					     struct v4l2_mbus_frame_desc *fd)
> >  {
> > +	struct v4l2_mbus_frame_desc *source_fd = NULL;
> 
> why not use auto cleanup like other patches? look like only use in loop
> media_entity_for_each_pad()

That would be doable but I think it's cleaner this way. The recommended
usage of __free() is to declare the variable to be __free()'d to a non-NULL
value where it is needed and we can't do that here as we only find out from
routing whether we need to obtain any frame descriptors (or we could, but
that would involve going through routes twice).

-- 
Kind regards,

Sakari Ailus
