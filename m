Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F88313E32;
	Tue, 10 Mar 2026 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143040; cv=none; b=nB6uYCjtpT2OPdnT0gCaCvbKKwS3skFdggRQuxjYnKwdV7DJwg3rvCUtpD0rOooVkBL8QMgDCkaiMrgDiE6lrnY+5B3q+lj1S7/zvmmXGBFqv/fWh4wDezlVrfBrss9culOiNnobJmQW6fnPWLN0Vkw1f1XrQ62JNSeX6hicFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143040; c=relaxed/simple;
	bh=meQnDIM+FWgDMnoMdra1kISKA7GfiCfpXRo6nFqd71g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpIqXWwHH/bgZILgpK0uk1REuINKOkk6qni7QtPJZoE5nMxvIS4WGkXlf7QJn+kLse51S++1eW6q/BjMqcvuiP2uQodD2E78Ae3GFwljo7tsSmSYIHh/yPzVKiDqkBez9w/0SKOQ+FVlapjPfkax8KEmxoZ0acWIktQYADzLziU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed0xpZBO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed0xpZBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773143039; x=1804679039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=meQnDIM+FWgDMnoMdra1kISKA7GfiCfpXRo6nFqd71g=;
  b=ed0xpZBOjRTI8hwjn+Q45R0YRqZJlylj94zkoMRlVlBSEPSjNtOrCOAr
   AATOOg7+EO6RHcQ8GNHtj2uV4RdDIdUt66N1TnKHwsP8PiFUmeOzYN3Ma
   x7C7IM/zQ+ej3Rt5YKUgenvq5uk8tBKtkq9X3wqJgLAEWoffW2OIgbbno
   NZ/xvbTlKaIItZNWaUQdV8pBW/GzVjriJi10eTDTY7fbpax2yvGMRtE8n
   JVe2AeAVyyEIco2sT/pdGJMvJr/UAhHeNwfHuoL8joLs9mpktniwkCcQ8
   YO514gKNMfzradSb3JWtpbQh8WTj99zgt8fT8/59VfHn6b41dTI15f08N
   w==;
X-CSE-ConnectionGUID: XU46LDTDSzmriFnd0aliHg==
X-CSE-MsgGUID: ssjzs7jyRsymhEj93KMJWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84820649"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="84820649"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:43:59 -0700
X-CSE-ConnectionGUID: taMSd3FORBeeARBLb3qbZg==
X-CSE-MsgGUID: zri/bMhMR42ANxQj5ff6hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="257995771"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:43:56 -0700
Date: Tue, 10 Mar 2026 13:43:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: replace msleep with usleep_range in
 atomisp-gc2235.c
Message-ID: <abAD-WCn4c-6wXaN@ashevche-desk.local>
References: <20260309231445.7000-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309231445.7000-1-rayfraytech@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 10, 2026 at 12:14:45AM +0100, Oskar Ray-Frayssinet wrote:
> Replace msleep(5) with usleep_range(5000, 6000) to avoid sleeping
> longer than necessary. msleep() with values less than 20ms may sleep
> for up to 20ms due to timer granularity.

Use () in Subject, use fsleep() in the code.

-- 
With Best Regards,
Andy Shevchenko


