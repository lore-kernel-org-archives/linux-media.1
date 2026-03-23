Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC45E378D64
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255146; cv=none; b=d/VJ1FHdxf5vEg0pfGqbKpJAHPZuCdgQ+7tMSq0GfkBlgT98VM+/yvn94NFmdVWiWjM0XF7qui43eiKhTa+TO8AB4b4sxsEyKY1ur8vJCarEtsM6yAezE/16uzPWwBXUhtpPs5RivB6EZuqomfZEeXzaYexW0PdwG0iXIqcqRuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255146; c=relaxed/simple;
	bh=kYcwuJtFsBGBKjqjxcALQ3akbeYCuBxGzlUccPLsIH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzZAVauLIi9iRXI4LVPROPgFZsFZEjk79zYWzNADE3USv89detneBCMMROzsrSAPkKbxc5wqEmHSQslpA4PipdeHDrsajN8MfgVeclAJQo2plBBUCMvakhuydg5jwr1dhqbernjQo2jBOM2N/eq3QuNDZeJXiuz0wYAM6/YuIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZSqROIM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZSqROIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774255144; x=1805791144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kYcwuJtFsBGBKjqjxcALQ3akbeYCuBxGzlUccPLsIH0=;
  b=nZSqROIMfGBQkIKxUhn+dX5gIM3OZBNi4ScYU46fiMGwZjYMmRC/rWPY
   lS5MP6k2GKrRamHWYIEjRRWkYFkQGVTyx6Mx8QMTEyJnsAWu1ANxAJEVh
   jyVZlYuPPDQ9/okSs9xNuyUKOONtAXEHvW8x7khJ3ml3tm/RzQGGSPpNh
   zFuNskSiq6xuy739kxGjUDrNFN3WSmzU+VKrMWfk/g4r1i/o7MSDWHt7k
   VuKS/K+3Ks42qew4O25sWPrgy5dyrXialdEGjBh3aLuVYVxTl29pqa0ly
   MKS5EUIwBrxo/MsPCY/t1ycpzi7+qS/AsAtcHc/zOuNGJ7d9SsTQ9XuzY
   g==;
X-CSE-ConnectionGUID: tW1dCUHyQJWunFsLS2Lybg==
X-CSE-MsgGUID: BSLxF8GbSRKEJqePFxlc8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75368870"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75368870"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:39:03 -0700
X-CSE-ConnectionGUID: 5r3aZmZXQx2u9Lh8JHSvlQ==
X-CSE-MsgGUID: WKVO5/6XR7K+lMQllvqC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="223029645"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:39:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0553311F94F;
	Mon, 23 Mar 2026 10:39:04 +0200 (EET)
Date: Mon, 23 Mar 2026 10:39:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: v4l2-subdev: Return an error from set
 streaming if not supported
Message-ID: <acD8JxYVl5CP0Tb0@kekkonen.localdomain>
References: <20260322223016.741370-1-sakari.ailus@linux.intel.com>
 <45deae7a-d197-49b6-8c22-f8c1b403223f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45deae7a-d197-49b6-8c22-f8c1b403223f@ideasonboard.com>

Moi,

On Mon, Mar 23, 2026 at 08:33:08AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 23/03/2026 00:30, Sakari Ailus wrote:
> > If a sub-device sets neither {enable_streams, disable_streams} pad ops nor
> > s_stream video op, v4l2_subdev_s_stream_helper() calls
> > v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.

This should have been:

If a sub-device does not set {enable_streams, disable_streams} pad ops
but assigns s_stream video op to v4l2_subdev_s_stream_helper(), both call
each other recursively, exhausting the stack.

> > Return -ENOIOCTLCMD if neither op is defined when enable_streams or
> > disable_streams is called to handle the situation gracefully.
> 
> How does this happen? I can't right away see where the recursion comes from.

v4l2_subdev_s_stream_helper() calls v4l2_subdev_enable_streams() and
v4l2_subdev_enable_streams() in turn calls the s_stream() video op, which
is assigned to v4l2_subdev_s_stream_helper(). This is not a regular
configuration but still the failure should happen in form of a returned
error code, not a system crash.

-- 
Terveisin,

Sakari Ailus
