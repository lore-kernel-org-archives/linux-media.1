Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF929408;
	Sat,  4 Jul 2026 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783172731; cv=none; b=gZuAtqFUzn+FSXWRqKb/ymsVKFRZII/0NdfciLK8SAZaCxFBx1w1V/vgyFqzhySHQpp8CJILMt9GlEi10efd8PwxgPlP9NUXlUj3zkLi7dYP7FQZLppHvjyraIo2sfpywEpPWdLt/ThcFrNbFuj7Ri2iWeuJ0gJ80N7P0Sg/4eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783172731; c=relaxed/simple;
	bh=jqHtxjhUBP/2grYMg1hxVyeRBnpFzBP7XCLUmgOyz9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI0/XNTOeEvn7oV+dI9qImq1oAm6vVzM5MVQAZ029N8uZpet/PdbxrtXNprimk6s5+mJ4pcVyVYvwYB1ThxFxKxTsGxxYPwndbTndsZ3wM4j9zf8fvbsiMMERDrSEa0ZkXRemWJTkqgHVTXK34sMDV0J5CQzYW+diMWAg52wGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDYMKmxn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDYMKmxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783172731; x=1814708731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jqHtxjhUBP/2grYMg1hxVyeRBnpFzBP7XCLUmgOyz9Q=;
  b=bDYMKmxnX6x+KuEa5/Jv48S50Xz4KgBtu1GwYO1YC+XoEOx+kpS6wEoZ
   hfzB7d/9V/mrMlQ7QCsXGOfU5ghR1G7w9D0f710cvSujABvY9B58KQBDL
   fxhmjSeS2fOcprkldLkqudS4Wy2o6VgZ5+PRGMGjoAhVd7pbLjoC0/tbc
   2EW7/hyWlkmi1mni049gtaDz4MI0wp/b72NIpszJp5P/2NvQywEAQopnq
   5Q1j6i/zr0TSSyto0K7camarkl1qEkOrAbT0OHbjH1GOnJDkwRpdJvRx2
   ut739C6M7A+slj8AaK0BQ2/woAzLeEgAN2OQl1Q31a4gQFgSYm73W81vU
   g==;
X-CSE-ConnectionGUID: 0EwToWTlRui9mTQTMpJKKQ==
X-CSE-MsgGUID: mTHSa37KQmWN4GeyN/teLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="95385925"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="95385925"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 06:45:30 -0700
X-CSE-ConnectionGUID: R+/J0dhkSp2E0Gl/LvCeHQ==
X-CSE-MsgGUID: MjXbyDKkRkGN5ggbe2AYLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="249333714"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.218])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 06:45:27 -0700
Date: Sat, 4 Jul 2026 16:45:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com, error27@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after
 return
Message-ID: <akkOdQ1oT0hIc0tz@ashevche-desk.local>
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jul 04, 2026 at 05:31:13PM +0530, Dileep Sankhla wrote:
> Remove unnecessary else clause after return statement as the else branch
> is not needed when the if branch always returns.

Is this the only place (of a such kind) that can be amended
in the entire driver?

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


