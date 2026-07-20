Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76E37BE6D
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548956; cv=none; b=Dx0Yqu8nwuCUTveYp+62q+eUlLDVQY1BTJk5FD1ApNsv4nBqgLsoOHQzOq0VishfePSmcJf1wjkXb0S5PiqfVG4FywogZWKkY1o/535dRfUj+byHVsnrG54j7hVGpn+SB0aIFl0uoNz+gfZ8GlVWkIfaiYEPACcO0/+Ju4vHdhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548956; c=relaxed/simple;
	bh=EMiV4MIIs5RKJLQkedm4JS29+Ry1ayhbw8ZN6jGPCoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1gWNq2NJbIkOhd821uFBOmrELCa4KaHEkmQGv0ag7l/Lrp2gB/U2yUxun5Rrj3ZKq/ri7NZWgiJBuY2iTeT8jnZQVuanSJa9hq3vFR1WWxWs85we5x4uCbUIgrfEYODp8tPLrrbYQ1fn9WNxAkL/SM5VbqNMcDsw94MULevMVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzBLjJtl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzBLjJtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784548951; x=1816084951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EMiV4MIIs5RKJLQkedm4JS29+Ry1ayhbw8ZN6jGPCoI=;
  b=RzBLjJtln4BIO2X0TxQ2uRgRkoo9Gv3xJ+tWzzMzMkox1ztOl/ATcZNv
   FFp5eE8VNMhVno826g7EeyD/94+Zsu+S9xguj28MNhqxpTH6mz0rM32Hx
   t9zlKKnLVWDqn72QuWGEkFUpCq5ls08in7I89fMYFtj2va5PpuWOTzDAz
   M1Z4g0jHxE18cBssr7raEwpWmsN/GNADkpczBbkmIGCgloUPPfzoQV0nV
   j2qivtmfs8MKvCuNhpKsnn2vRqTjO1hpi5gDdRgj8sMWYL97mVpAz+cJu
   oaOXtzcDM3Y39BP9Vq+8flo3f9qOOw+IJa+/80oIrh3IIsxLZUncBzExm
   Q==;
X-CSE-ConnectionGUID: cZYolw8kTX6tJ/Dd0NbqVw==
X-CSE-MsgGUID: 3Mc0Llu3TJyjUIzY8gj53Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="87667132"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="87667132"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 05:02:27 -0700
X-CSE-ConnectionGUID: UMzNQ5JORPeRnYvnWDY8mw==
X-CSE-MsgGUID: uWy1oUsTTNmFinTlUK9x3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="261240843"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 05:02:25 -0700
Date: Mon, 20 Jul 2026 15:02:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: linux-media@vger.kernel.org, Linux Media CI <media-ci@linuxtv.org>
Subject: Re: [v1,0/7] gpiolib: kill gpio_request_one()
Message-ID: <al4OTwH4aUuG--dJ@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <6a57fbc2.20aff8f6.286553.85fe@mx.google.com>
 <alk8iQCjTHcdhbVs@ashevche-desk.local>
 <CAPybu_1h+dKxzst-GJgJRrJfhxUzEkmhn0wWu6KYH+6L_3JUBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_1h+dKxzst-GJgJRrJfhxUzEkmhn0wWu6KYH+6L_3JUBQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 10:55:23AM +0200, Ricardo Ribalda Delgado wrote:
> On Thu, Jul 16, 2026 at 10:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Jul 15, 2026 at 02:29:38PM -0700, Patchwork Integration wrote:

...

> > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > issues:

> > What is this?
> 
> Please ignore. Media-CI applied your patch to the fixes tree instead
> of the next tree and "fixes" has some issues with the rc-checks
> 
> Sorry about that.

I see, thanks for explanation. Can somebody Review/Ack the media patches,
please?

-- 
With Best Regards,
Andy Shevchenko


