Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421697;
	b=ZxV8Dx+xenPLqA1be8MLvKtizV8cRhONn12IGliyHD5f+QO/H5AL9PrHo8kY2Hq8M6Ca
	 wN/xL3bo+JIC5/UUhIwtxd+GUCTJ1c78Tqa3c0UCFnNBeTlvxJwvpUNh1TBirNb43KmOi
	 4IWla20bV5UuTBMnd4SdATtt7GwXG5sTpiojFIUK3XTxOEhd60dxmpf0aupJMtsE8tR/O
	 OMShDDiS/d/3JRrzXuiFtUUn9qtcucxGgHsB1CHwJfdfDdOTm+1YIhPpRAQgJ5tKc19Xc
	 gTK375DqU5cUtR7x2iOrL3YZxnD08fZ7ncS9B1pRg9dSsRg4ZLeHpMv78OoUkRUenoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421697;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=jM/6JVbobDRmCf45+MFMYZ/SL9MMvwKPogohXIiiHBw=;
	b=I0EeuBDOwOiSUONOdmmRK8fOElqDF0RHLJnzU9WicjQjcAtLmOnokYEz+gwQKHSMPFex
	 0GZWJVIsn3aCrHyTsih7Kj4iutlsxiLlt54KR7sz7qkD9XqCWlGa7c+05+zrqRXGeJf/0
	 77cfUKKwhWJq/rN3fcOfuQn1t1xZyuPrPWnO3HMQB99z6m/dW6O63E/bIVkCJ6jftGS2e
	 u6PJ7UiA51116rnIdM9dcnVipljH1O4m2HLdRWIMyiNxiQIJD0kwEpWWQNNJCkKMFfOsB
	 +xBMz4VCmL/7AizgCS8MI+2OKI1dVXuxUnNQIf0fRaM7I7lANV2OAIlzvjJY6fftPZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bR6vQdRn;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A78606A321;
	Mon, 23 Nov 2026 08:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A78606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bR6vQdRn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795421696; x=1826957696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hwuoL4O9UmiZoRvxwxIeG7CphJsVLt3GfOEkNhPNSMc=;
  b=bR6vQdRnPLiE9qK0xIqkMW3sI3cihTvbsV6E4mE2OtG26X9OnjLQvUzh
   qIIJ19Q+SEw+ghPMYI01rzIBm9lMF8FCM5JJhSrf4SS7sIe7r/OXwhpjU
   UriQ8omBTyNOtwcPHagB6inyzLGrPOGaJlvuDGY4p9dOWBkmePge5l47H
   9oXD3uG9hjXpdTDzQ8TdQ0FfxUVPnlmB8hksDkxwhzLMDxgNpO7BBx2LM
   W6YoZsmO+/B/JMgb8MvKtxAWSpZ0OM5WeAjNAlW/9TAtg1Z/eR0m19+U7
   EIwZUwAYAbu8NMBmDsePuo780l5I6U9ydeU8x9MM1GCmgfCh5wSwDLuTL
   A==;
X-CSE-ConnectionGUID: 38fSrhF3ROuvFkhqc34Gpw==
X-CSE-MsgGUID: N9At0fwAQcOUAXKkSbFlNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4228912"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4228912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:14:56 -0800
X-CSE-ConnectionGUID: 2dEsCZphQfiVhTji56VSfQ==
X-CSE-MsgGUID: CmvcWljeQzOyISOT7QH+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11111400"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:14:54 -0800
Date: Mon, 23 Nov 2026 10:14:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Remove unused ISP state control functions
Message-ID: <awP1-9CEdLzjDI4Z@ashevche-desk.local>
References: <20261121122544.428-1-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121122544.428-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 21, 2026 at 12:25:44PM +0000, Avishek Chaulagain wrote:
> 
> isp_is_ready(), isp_is_sleeping(), isp_start() and isp_wake() are
> defined in isp.c and declared in isp_public.h, but have no callers
> anywhere in the tree. Remove the four unused functions along with
> their prototypes.
> 
> isp_wake() was the only user of udelay() in this file, so drop the
> now-unused linux/delay.h include as well.

As long as it compiles,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


