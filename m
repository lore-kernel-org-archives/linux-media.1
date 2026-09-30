Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A2314D1A
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772552; cv=none; b=SiHEqxQPEI3QYJwaTz2ZaTyq3m3+sgA7Rp8l3yNz+gWu4n4nJEXB9t3O0Y74+gpxzqHxynuAtkmhahPypwqVw+7oPXFnXxA3ndvLVtJ+UodY8eY/jDdmLLkOvunAh2tygtQimqK381bW8SYfx96VJ27q+5VwxufIiuDQ5PuyYUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772552; c=relaxed/simple;
	bh=F1MhoLbsvBoThWshBTqDLDTvYs8AZAm/8ZMivKiU7UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogC0FKfpkxRb4/BPG5iSRHEh5/CA8FSRMNEztKAnFYXwOSpAo4/J0DZeNwfpt3hms/v/QBKfhpfE6tisJ0+KflaQmeGVVewNNOdz7uy44Vs79yGCAvVk9zJfEikfytYs/XNNZ36pF/U8pOfVey4z6HHr23u/CHivMJKf/L7WsQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0ybWhgH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0ybWhgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790772545; x=1822308545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F1MhoLbsvBoThWshBTqDLDTvYs8AZAm/8ZMivKiU7UM=;
  b=l0ybWhgHINjI237CY6Ls+T5lcCiOh7x/wVOi0hxUXMNNXKHKf/5ENxZ1
   pGfWP0qEBSFkGoexfUYcjDknmDAEzwoAn11DHMAD1N4tvtY78ljwL6kYa
   O+KojGs3dtqr4us38spRv8meh0WPlS9BvxRahbxN2h/6Anf9Cv2o4BKOp
   HyZ/Kvu9HarGQg3mVlUR0Tl+bCiZ0rCZILttuyLYd/LxTSSnLY1eRoGNk
   HX9uLGNi8ZhZUrF4fzSBTp4bsXscmlBc2pK3UZFy2pLwEk7C65sL3lmbn
   AYGZ69Cj3Dq6gdBAUDQwiXKv3Hw+hu5ONK/Iuj75NqvQBQN/FTnlhO1+C
   Q==;
X-CSE-ConnectionGUID: ocZTIVPJQESdEBbjuDdr1A==
X-CSE-MsgGUID: bU3pJuVEQeKBSeQAFv7yHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102034529"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102034529"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:49:00 -0700
X-CSE-ConnectionGUID: NK5+XAjfShaP6mu8A4AUHw==
X-CSE-MsgGUID: 8zSfD1tESKOR/pqiKGErcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274301077"
Received: from jmaxwel1-mobl.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.180])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:48:58 -0700
Date: Wed, 30 Sep 2026 15:48:54 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hao.yao@intel.com, dongcheng.yan@intel.com
Subject: Re: [PATCH 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Message-ID: <ar0FNjatXOfRCBVB@alaakso-desk>
References: <20260929121802.2516868-1-sakari.ailus@linux.intel.com>
 <ar0AOud9uEPuUAMr@alaakso-desk>
 <ar0BZ4MAut3fnS86@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar0BZ4MAut3fnS86@kekkonen.localdomain>

On Wed, Sep 30, 2026 at 03:32:39PM +0300, Sakari Ailus wrote:
> Hei Antti,
> 
> Thanks for the review.
> 
> On Wed, Sep 30, 2026 at 03:27:38PM +0300, Antti Laakso wrote:
> ...
> > > +static int ov05c10_parse_fwnode(struct ov05c10 *ov05c10, struct device *dev)
> > > +{
> > > +	struct fwnode_handle *endpoint;
> > > +	struct v4l2_fwnode_endpoint bus_cfg = {
> > > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > > +	};
> > > +	int ret;
> > > +
> > > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> > > +						   FWNODE_GRAPH_ENDPOINT_NEXT);
> > 
> > Should this return -EPROBE_DEFER in case endpoint is not found?
> 
> v4l2_fwnode_endpoint_alloc_parse() will return that if endpoint is NULL.
> 

Ah, indeed.

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

> > 
> > > +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > > +	fwnode_handle_put(endpoint);
> > > +	if (ret) {
> > > +		dev_err(dev, "parsing endpoint node failed\n");
> > > +		goto out_err;
> > > +	}
> 
> -- 
> Regards,
> 
> Sakari Ailus
