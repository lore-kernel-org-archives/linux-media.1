Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9694C7558
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771558; cv=none; b=MAbx6mLaiO4n/DZkN07qdgWNuNGbARCFRRwnTlLc6YbgGTurotLy9Fzk2E2EVWmFVYMJpFzFQ4a21eAwdxYgVpbzbaoa5wbRrGnNK4MMFoC3aISy55W8F0xYKmkr7TcIbepcUE8aavEPllGlhk4s5rVZfXOCYLMrJciWeexKOAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771558; c=relaxed/simple;
	bh=uIr7S0aHlDG1dvnPRclRJg+sIqRDxLt4biMoth3vRiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJYYpHH3aC9IvIMFwlPuiBARa4VjHHk1QoOgKSNgGniJA3SOxBTkcnLgqoCcus91L/xPL7CP33Mw3GHg/ha992Mf2JxL5RRSdy/jk15EB+xV4aHDhGWsipb/8MAFso1TE9/M/IlWB+4o9hWGqYlfl0X34E3fN7ioYMEQ+tng6ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkSCRBHd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkSCRBHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790771557; x=1822307557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uIr7S0aHlDG1dvnPRclRJg+sIqRDxLt4biMoth3vRiQ=;
  b=kkSCRBHdN4/4xzhofFutWOvQH6XBASq7u7zuRtkLiFppIgBp+YMmzjB2
   XNAFa/mWxde1NLzBvEWUNoENF09sE9VTIM0kAaZNQpGFHY+6eRq12mPqO
   srGPWAFR3BcZvb0jueGKPBEe9w1nTZ0U4eN2FOhMe5dvdm2nbIp+cTRSH
   PTvUFCRelbrrWPLyMiRyWDgNSnUrJXmse5LIdOwAdbvw1DLD7ewzRDMn/
   s+eGR5hNKbgpKSnabKrVYdZTm6e47su9t28vS97tQlTVJJCJ5+Pb8gqPW
   Bh8RwePhQPS6k5xaBZLl4F5Z1tn/QUjWs7U0ZBkHBfyUB2vbSezaD2cFZ
   Q==;
X-CSE-ConnectionGUID: hxnSVYjKR1i2LS2of9TzGQ==
X-CSE-MsgGUID: vWqNOogIQ8e9YdLMbjpUwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90556809"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90556809"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:32:36 -0700
X-CSE-ConnectionGUID: HOXO+UbATmS4giVs59BN3A==
X-CSE-MsgGUID: Ud4L+WX7Tmq2pPTUthY2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275230179"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:32:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8BA5511F925;
	Wed, 30 Sep 2026 15:32:39 +0300 (EEST)
Date: Wed, 30 Sep 2026 15:32:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, hao.yao@intel.com, dongcheng.yan@intel.com
Subject: Re: [PATCH 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Message-ID: <ar0BZ4MAut3fnS86@kekkonen.localdomain>
References: <20260929121802.2516868-1-sakari.ailus@linux.intel.com>
 <ar0AOud9uEPuUAMr@alaakso-desk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar0AOud9uEPuUAMr@alaakso-desk>

Hei Antti,

Thanks for the review.

On Wed, Sep 30, 2026 at 03:27:38PM +0300, Antti Laakso wrote:
...
> > +static int ov05c10_parse_fwnode(struct ov05c10 *ov05c10, struct device *dev)
> > +{
> > +	struct fwnode_handle *endpoint;
> > +	struct v4l2_fwnode_endpoint bus_cfg = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > +	};
> > +	int ret;
> > +
> > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> > +						   FWNODE_GRAPH_ENDPOINT_NEXT);
> 
> Should this return -EPROBE_DEFER in case endpoint is not found?

v4l2_fwnode_endpoint_alloc_parse() will return that if endpoint is NULL.

> 
> > +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > +	fwnode_handle_put(endpoint);
> > +	if (ret) {
> > +		dev_err(dev, "parsing endpoint node failed\n");
> > +		goto out_err;
> > +	}

-- 
Regards,

Sakari Ailus
