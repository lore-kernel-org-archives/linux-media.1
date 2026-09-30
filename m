Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B6650254F
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786300; cv=none; b=dwSS/1UWhYtSPmhB5imETGLhf97QtXhK5K5ezRVRInPi/XKedujAtvQY0m5L/UqA8dow8jCF/NQEeRyIb3bezzy/hUNIX8B6cKvMJwM87phBHzn1oO4wv4vRzczeMRq3hlrwBWWHpZ07nQ7a0j93Kz0jljhnYGL2FzgJW2AqqsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786300; c=relaxed/simple;
	bh=Qyoi04nmSsZFxtNGfUgDaJrGdlUVCIjC/tS0V2sRhTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anWHFxkKUew/ahVJW7ihNsdUVLegwuMfJKz6QuAWpwDCvq1V/PWyRj3a/C+wnUHglKWWmXlskwtVFYTC79aJhb/65l7lcw7k8FXkYJjz6W/z0hAJ9RaxGW20R+i1SsA9O1KUvodQ+T1WHM1U//6YEw+p+Y7FDDtDeTpJiWoI8Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtpg7IZY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtpg7IZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790786299; x=1822322299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qyoi04nmSsZFxtNGfUgDaJrGdlUVCIjC/tS0V2sRhTg=;
  b=jtpg7IZY+Yz7fjkIzT7GyDFXO44zAzVD4mYiEf2XHJITJJ5vr7gy3t7u
   51XmoVAIw2Ym885/ty90pRpbwrCOAXgtlfue7AbFyRLbd2DvuiJD31wtV
   U8xvXK3dUpWMwNIY4+L6MseqG7amlp60g8UaTe6ptjWNDyjGCx/tmN6kZ
   dMq57dPyrScONr5J3vOY8WdDhKoF08PD/ttiAzgpkYr5ne26uQOIZto8m
   qFUOyjpr+SPIkXObXfqkmXMnsNsLPyFmI++6RlFGKpMTMkJ2B4sCEM9SB
   eow4DoJdo9Oi38NThCzMpwE2RBJod0BJpvwDKQBpBxeCdO2L8IsdKNVss
   g==;
X-CSE-ConnectionGUID: n5b/O+SJQQqePrS4vPPAUQ==
X-CSE-MsgGUID: 9OpIoqk+SDWBL3Zo54Dvmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91393110"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="91393110"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 09:38:19 -0700
X-CSE-ConnectionGUID: /LWqtAdqQnOVmzMX+O4HAg==
X-CSE-MsgGUID: wMvVx8GXRlad1j4fZY5ECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274854242"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.213])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 09:38:16 -0700
Date: Wed, 30 Sep 2026 18:38:07 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com, 
	hao.yao@intel.com, dongcheng.yan@intel.com
Subject: Re: [PATCH 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Message-ID: <ar06tx536kSEzEK-@mdjait-mobl>
References: <20260929121802.2516868-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929121802.2516868-1-sakari.ailus@linux.intel.com>

Hi Sakari,

On Tue, Sep 29, 2026 at 03:18:02PM +0300, Sakari Ailus wrote:
> From: Hao Yao <hao.yao@intel.com>
> 
> Add a driver for the Omnivision ov05c10 camera sensor. This driver
> implements a single mode only.

[..]

> +/* This function tries to get power control resources */
> +static int ov05c10_get_pm_resources(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov05c10 *ov05c10 = to_ov05c10(sd);
> +
> +	ov05c10->img_clk = devm_clk_get_optional(dev, NULL);

Please use the v4l2 clk helper here.

> +	if (IS_ERR(ov05c10->img_clk))
> +		return dev_err_probe(dev, PTR_ERR(ov05c10->img_clk),
> +				     "failed to get imaging clock\n");

--
Kind Regards
Mehdi Djait
