Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5A151C06B
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789340; cv=none; b=gcDxZAVv4JlLWUeLWjPtAMu8SdmKmbGwBS/nvh3P+tuNwEDhqNLhVn6DWs9qOVebZIXPFgNy1bAJvVjxSavghrvDhlbGQZcrfZXbGy/LKAW2t0DdLw9VR7Afzu1QmW5lEzNSOKyzUJk5rwvFwvUHqrqJMNkcg8IOB1v24cKkAQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789340; c=relaxed/simple;
	bh=wX5+mdi7jJxuJQaoN8nPv8cPPe/1CxxYtuzwrfKem+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpx0wdSeHAyza1CqzfWE8XsE6rmJ55Fl+xCtIdwmG7a2RUrDEs8qAjYAvBAVk+xUANHU2GAO2ZiAmySKLie1vspbREcRidIbn4HDbzBtroRDw8LIyFzc8h3UHUtcmx+pdM7Ww7Aii4VxU3BFFsDesTu6XtXSsU2t5Q6ngAL3uGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxxI/y1/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxxI/y1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789338; x=1822325338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wX5+mdi7jJxuJQaoN8nPv8cPPe/1CxxYtuzwrfKem+o=;
  b=jxxI/y1/aOt3MH4XoXBVZKcvxnw6LkojJ6CGM0wu2GjAzejvy0DRMLhb
   D7mptYVe9P/yikg1cNkkorn2UEOjWA3KXa9TNCN+cWa6Y+Ww05Q7Jz269
   m8HJLPsGtvee5u9bSwsPTtPC5SR6DIGAsxWrdu8+eiHfngeWmChL8QZLF
   q2wjOFNngFcgRJWi8iFDbeEq2gy3+iCNkRPyO2N25AUjvCzoH4G1vHQ5M
   KMmdKtluSqApmTMZKk4wecefcAAr+Wc2wHzbAV/abrvkwm/f+tkME6LRu
   SomK/c0uN6hYXEJ3jvmgmOzG1fewc1TV2P1iWsrD+OBtvEniSu1mDmjB2
   g==;
X-CSE-ConnectionGUID: Scm9irzxQLWuaUerE1Y3zw==
X-CSE-MsgGUID: szT5HnV/RdWVsrdXShgSVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102107088"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="102107088"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:28:57 -0700
X-CSE-ConnectionGUID: Q6ofUelUSZuRPzew2Omnmg==
X-CSE-MsgGUID: lN6pzjHlTw+d783jC0qTdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275299800"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.217])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:28:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 85DB1121B9B;
	Wed, 30 Sep 2026 20:28:59 +0300 (EEST)
Date: Wed, 30 Sep 2026 20:28:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
	hao.yao@intel.com, dongcheng.yan@intel.com
Subject: Re: [PATCH 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Message-ID: <ar1G25QYx6GpxyhR@kekkonen.localdomain>
References: <20260929121802.2516868-1-sakari.ailus@linux.intel.com>
 <ar06tx536kSEzEK-@mdjait-mobl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar06tx536kSEzEK-@mdjait-mobl>

Hi Mehdi,

Thanks for the review!

On Wed, Sep 30, 2026 at 06:38:07PM +0200, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Tue, Sep 29, 2026 at 03:18:02PM +0300, Sakari Ailus wrote:
> > From: Hao Yao <hao.yao@intel.com>
> > 
> > Add a driver for the Omnivision ov05c10 camera sensor. This driver
> > implements a single mode only.
> 
> [..]
> 
> > +/* This function tries to get power control resources */
> > +static int ov05c10_get_pm_resources(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct ov05c10 *ov05c10 = to_ov05c10(sd);
> > +
> > +	ov05c10->img_clk = devm_clk_get_optional(dev, NULL);
> 
> Please use the v4l2 clk helper here.

Oh dear, how did I miss that...? I'll fix this for v2.

-- 
Regards,

Sakari Ailus
