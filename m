Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBBC29AB02
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264185; cv=none; b=fJjcaLxPco/rub9iy6H0JTJNb4eL+xC5ZS3wMbwGrxouJMMQbc3dm+/bU62EcrM6zQcFmQyidTBqSTyMHN2K3x0uQoYQk7pVDt2xEItwhn2jUbC4Dd3wtY5EqkMLx94NHeMgoSf2LDoxBYEn7PL+w3xxgMVHetdHOZNU86xuVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264185; c=relaxed/simple;
	bh=QH9a/hsCmnygjoolPL+pJuJHDm7IiP7Ksx6iqImPIlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MagJ9FJgJZL3XvaPRaABBmEkW41ZTMPxzIggKq3NODDA/myai2mxa6IaCTa7mpe8waUSr7pqgNypCfL6ry+fpUxM4kFnBtJa7aloz74bFIIcPbVe9JlqBluw4VeMqFU7M6hTt4Nj2jrmpnVScOrOJPhXtcaoeDOZc+W9aKkrXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewHGfzzM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewHGfzzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774264185; x=1805800185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QH9a/hsCmnygjoolPL+pJuJHDm7IiP7Ksx6iqImPIlk=;
  b=ewHGfzzMBH4HoymEAXJSRFd3xgpESfysJfJvAjPz8pLY/c7YseRrKMkf
   7USPXYX6XKZnYwB/rhFmzVmruk+98qQpcp4oaVpRtEA+nW+WnrdGLIyUN
   dRwL+yh9W+c5R29h154bdHiXoYo4ULBeJoNm/vxLEL//kCv85rzR6oUaQ
   AsZ6FcuFEoo4XYI+Bwx9nr7DC+JzF532+CGS3/+aHlmoD40b8gg8bRSkw
   gHCJX7pmlPgoRnsy6uHu17VjJHqyx2m5yJIy/N9L75RIFOIp95wj94X7v
   JBP0SDiZdKVjv/uR52INpnScSqQGfklXtU/tdKE9oMgXu5scScLq2A4X6
   Q==;
X-CSE-ConnectionGUID: Q7fFLJ9wQ0mkpN2Vz7lmtw==
X-CSE-MsgGUID: pKHyTaNMT96TqERWC5SHsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="92831015"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="92831015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:09:44 -0700
X-CSE-ConnectionGUID: bPdoBAgNQQm2Dd8FMRQsmQ==
X-CSE-MsgGUID: SPLOtgpmQMyPzdly5MUBCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="254470744"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:09:42 -0700
Date: Mon, 23 Mar 2026 13:09:39 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: dan.carpenter@linaro.org, andy@kernel.org, gregkh@linuxfoundation.org,
	hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] staging: atomisp: vf_1.0: fix open brace placement
Message-ID: <acEfc4Mzg1TsD92w@ashevche-desk.local>
References: <acENTtTMsD-xca2O@stanley.mountain>
 <20260323102104.44021-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323102104.44021-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 03:51:04PM +0530, Anushka Badhe wrote:
> Fix open brace placement on function definitions and control statements
> to comply with kernel coding style.

...

>  sh_css_vf_downscale_log2(
>      const struct ia_css_frame_info *out_info,
>      const struct ia_css_frame_info *vf_info,
> -    unsigned int *downscale_log2) {
> +    unsigned int *downscale_log2)
> +{

The indentation of the entire function is broken and needs to be fixed.
And IIRC there were already 3+ patches on the same, so please try instead
helping with reviewing existing stream on AtomISP patches.

-- 
With Best Regards,
Andy Shevchenko


