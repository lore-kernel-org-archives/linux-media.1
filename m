Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736813EF0A8;
	Mon, 29 Jun 2026 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746592; cv=none; b=dQrCOIwQDYxKjNYS6yqaN7TSbGREJhDIxzCRJ6LhsHhFCDK7jPNBe/NCYfogUJHMOx3cTMS1fR0rfe6hv0Yf0vofcOYsWMX25J9+7cGS7vE4Nwc7EyDks093fNChm8M4rWPgXM/nCyZu0Ir5jGvnklsbBhlCwNlTYWsZdIVKnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746592; c=relaxed/simple;
	bh=Hmw1lJtqV0z5faRyMSz7VQliHrWd+hlBXRedsAOCRvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqsq0yug1oNjk3c8vlLWHfcaVf7Bf7+kmZUvWmIABiCKVXXLcrnrCoZB2e9XFTygDyuMKTqQbZi0vRMd6a0oE90a1JOGa6kZvnIncMba1RftvFHun52lO2X15Ly56fGZU1VHJXzeGZF+qHeVMNTTiBOc+NexfEOsHoTVkJS0CCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFHMvkvL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFHMvkvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782746590; x=1814282590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hmw1lJtqV0z5faRyMSz7VQliHrWd+hlBXRedsAOCRvE=;
  b=oFHMvkvLubD1FixRaXWTxNW+YSH5zE2tqtScxHtGqTr1xbtWO34RE9rr
   LJYLzH/uBXKQXYCWwzlUmURilVH9VnRYPbVUCsGm1OG2satjww23AGo8E
   ZhSaCXbhNgxqmqpHm7brQbFn14gRrAtrAlkmAJsYsky2/Ns7CviFBKC1n
   et9SQGle5xLOPVujGQcMEMJ6d19Fqqlv7cLp1S3fJT/jl/i1pfeP5etpS
   TwKDxVZEEin4uRZJtpelcQJ38j9WFJy09aRWYnkBB9UMTQJLzGqjp3ROW
   abTSQjNVbxlRrl/w1rLIQR8sFRmOVlvvrQOFyQ4anRDTzwCuiokICxFkn
   w==;
X-CSE-ConnectionGUID: TONsXjJQR9u28wVyk5m6pw==
X-CSE-MsgGUID: HQgha/hRSVqEJkIjoM0/dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83469266"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83469266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:23:10 -0700
X-CSE-ConnectionGUID: rFSmfhwZSi+DllYgefUacg==
X-CSE-MsgGUID: tvIRMopLRzuj/M9fo1u/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="247531687"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.82])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:23:07 -0700
Date: Mon, 29 Jun 2026 17:22:57 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/15] media: i2c: os05b10: drop unused group-hold
 programming
Message-ID: <akKNsGUaG6xsjVAT@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-3-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-3-tarang.raval@siliconsignals.io>

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:48PM +0530, Tarang Raval wrote:
> Register table included group-hold (0x3208) sequences for
> groups 6/7/8/9 that only stage alternative tuning values in SRAM but are
> never launched by the driver. Remove these group-hold blocks.
> 
> Also remove a duplicate register entry for 0x37bf.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

--
Kind Regards
Mehdi Djait
