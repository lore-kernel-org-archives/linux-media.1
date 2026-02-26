Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87D6309EF2
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099362; cv=none; b=FiWGfLCsaprlZ+IQjmQqf43fBr0KQfAXNbrQoApCbolwjbOahcZ8EbTv0PK2V+9H12HHKZW2AkzV2CVkDgb+zBsLbZAPM/HkuUzd+Z+r6Yp/e0lYQCyBf/RwVqUvuVSBqQUFmjYNO9+y1gZ7wveDj+5zn6WtL9RhdqoVE+r4AGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099362; c=relaxed/simple;
	bh=5LxrDUiTWb3lYbAjHa2TP4M+9YeZUu3TK1A/DINGCq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnzn5b55VSufXksG5nHDurZBPIIKxJW65PwreolfR49auTHsLHeyR3wqk5r9EEYQ02Y2ypYHgaWv5pJA/9uHGagYOyG41TjEUGWnRGqSL4E+eMamIp4+Cyw78PVsjWvh5eCEFlAzEBCFOGDPRbI3HWgdelQLEx4y6FYA2hLrikI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZ+Q4uvT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZ+Q4uvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772099361; x=1803635361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LxrDUiTWb3lYbAjHa2TP4M+9YeZUu3TK1A/DINGCq8=;
  b=KZ+Q4uvTFY5jFeU4bvG2UKBtaGxiuCCKHc9+jS6WrxozdS+s4NOqTnu2
   F4v1RI29qWwwuEDmKZKUEEx2gNHV1TE2gU84YMxokx8lTzmcL1/8DuZMp
   67k46nnx0IbOl3fEcBYl5k4Y1guwHZo+bl8aNgHQK8+RFSBZhjzJ18i7Y
   ZjfM5gwn2r9vRk6OxpAESnMsnKI+ErqAhhJkwkxKZeL4et/xoJuz21y63
   vbyZUusVyCUZ6mYbZskUQh2itDhH/vnQZTITYWHevotNf9PQ/5xQm9Gka
   Vim//VPkPf47bu6MN4YAq0g9UMb8NppxaKSKeS5EbnHm+rQemX8M8XpGw
   A==;
X-CSE-ConnectionGUID: e6JCNo8tST2PDAtQ64XvBA==
X-CSE-MsgGUID: tzqH1JLaSaauhBAWzPLTPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84511840"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="84511840"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:49:20 -0800
X-CSE-ConnectionGUID: tEu3kINASW23OkahsFhwCA==
X-CSE-MsgGUID: OFPDT3otQuCI8BgGHcxehg==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:49:18 -0800
Date: Thu, 26 Feb 2026 11:49:15 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: tomasz.unger@yahoo.pl
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: media: atomisp: replace sprintf() with
 strscpy()
Message-ID: <aaAXG3KCmKufRgBB@smile.fi.intel.com>
References: <20260226085510.65038-1-tomasz.unger.ref@yahoo.pl>
 <20260226085510.65038-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226085510.65038-1-tomasz.unger@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 09:55:10AM +0100, tomasz.unger@yahoo.pl wrote:

> Auditing calls to sprintf(). This code is fine because we are
> copying 9 characters into a 52 character buffer. But it would
> be cleaner to use strscpy() instead.

Not only cleaner, the strscpy() 2-argument version has an additional check for
dst to be an array.

Is it the only place in the whole driver like this?

-- 
With Best Regards,
Andy Shevchenko


