Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F398736C9D5;
	Thu,  2 Apr 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134479; cv=none; b=fHtwOG4tgV+YvLLFYqGMbG+wQOIUiV+x0/24vMMByh4JYGDHd+TsJf+NSReFmlJtU8WmuX3n1y2Z7JpWzKigQXlYxjdEgURbun4xn/TRs41mqq5QJt+oReuRQLjf4GeJ+wiIN8nIXxwlSO0EWZYR0i+AYqxU2rSQDOPki7eBxsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134479; c=relaxed/simple;
	bh=XIzQXlwe0ecgXVx2mdaWJeeWQsRZyyfoRUDP4A5qqd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMahRcFN1kbcuswBp5K2quYwuJ8c2Plmbhx21X6BRJPaRS8YZ8zR49rZ/Z9QzjEYhT7Y5hdzoSzGtgnjbWGyK8BBJbAqMpQbE7+XpQh2v+03+CIClPOB0HWak4VLxCokPfXIvrovhyc3ogVNfhoTP4NW2UIgsJYsSdm8RmPJ46o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KY8dXVsJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KY8dXVsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775134475; x=1806670475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XIzQXlwe0ecgXVx2mdaWJeeWQsRZyyfoRUDP4A5qqd0=;
  b=KY8dXVsJx6I8Y5B09fY3PDqrBHwNUPUiBDeNKE5i6EuD+a7BAOP6r7pr
   1/xFzraUCpThpm5OXQAV1OO756tAZxRIZF4rSZgpzNxEQNjQavoXUPkkn
   pO24paESPj5xe6neADuO161zmeklssXrQVDog16X6JnNNBsG/tKKoI7KW
   SkM9h7IL9+v72Mv+JQfdL9UhV1CcdCJ3cjyXojiEcf0dUOeGTh6o5jvXd
   f4GwBRgi1eO3wEYtC86VUI1c6ZMjMe/JNedoRnxMo2cHvOtkyMZw/O7GE
   T56A3VpJED0XpxdcpAv7gIjCEVgjuEDsJWEnBHex93HwGMdY4cs3kcoRe
   Q==;
X-CSE-ConnectionGUID: PVjkqh+OR82ztuMwixyFKA==
X-CSE-MsgGUID: kWBu0oqCSiC7dIlx1uB1og==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63742162"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="63742162"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:54:34 -0700
X-CSE-ConnectionGUID: diIh6MnOT6qDXNsDPleNcg==
X-CSE-MsgGUID: pjnn8Xn+Q5GxoceFCwqaMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226136324"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:54:31 -0700
Date: Thu, 2 Apr 2026 15:54:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	grondon@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: atomisp: fix alignment in function signature
Message-ID: <ac5nBB8unILvfl4P@ashevche-desk.local>
References: <20260402122333.1336-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402122333.1336-1-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 02, 2026 at 12:23:33PM +0000, Joshua Crofts wrote:
> Fix alignment checks in function signatures
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
> v2:
> - Rebased patch onto the staging-next branch to resolve CI merge conflict.

Wrong branch for this driver, you need to use one from git.linuxtv.org.

> - No functional changes to the code.

Also the comments I gave against v1 are still valid.

Plus now the request you to read Submitting Patches and other process
documentation, so you will know that it is required at least 24h between
versions of the patch to give a chance others to review.

-- 
With Best Regards,
Andy Shevchenko


