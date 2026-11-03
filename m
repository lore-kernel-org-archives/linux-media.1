Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736872;
	b=kRm4p93pLrN7RUe2AcO1aPZNo0dSjjbC4IVjKPZ7cUmqw8BfEFGaB6uyM+TNVp/LuBaq
	 glIMxJkf4596TlWT/I8EKdX9Y683TTgzjrS500H3pCAnkzJDXl5s7S3xnJhVPph6Pdkr/
	 BKkDqt6p5OaHXFEwXaoIqlW5Wjg/3X/q5Rc9xG6tP7j+4pQCxVoBboEFGnIcBeFSm/9zx
	 wN5RLHSnxHm/I3qCj6CvfQrRnzAX0BWRSmGAtnSi9VUrS2rysdTOBr+T0IEeafq4qL9nj
	 K1FFTbvsSwsBVQauK8bn1vacmMa4z9IMGzKSgkQ0vna9nPx3h4nG0Rzc/7G2BEF8lTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736872;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=K589POYySQtr1r2ZhJK2limt/sPK7C0lVSX8t3jCbPQ=;
	b=qM3u+iD1agVVjBwJN63KmCmN+WisCHs6WbJ7R+8KAdtZiF83VTuc7wLFoHhcgtQVaxep
	 +Qk8iBDt4PqtYpSmACfK6d2cHi8L8Njuo+POvg6+f6bvo6neCpdRKrMj1y27l/TBbrQJ2
	 09T3/7yJyz6nmXTS/iRQBlfnm1P2wcLv7JCpuEPsI3HrTsB2S+epifIFsfZXO+pi9xEOw
	 +CKozaFmV5AkjdTmMBanR3o9yAFFV0tOmzUkjAQrnhDCEAtNCaCssC9082aGfbiuQ5ZKE
	 9d0y4d4Wzt2uobFy34Zt/xqfRxM9R79ilpSawBWrk4kHXuyijWyImByaBw7WdycebkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kO8e9apB;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44450606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44450606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kO8e9apB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793736872; x=1825272872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0sbYGzYfZiXcQN3NK4uXbvuqtrna82HwtMsk40623hI=;
  b=kO8e9apB46RBekQifvX8h6qAnUXdOmP28MsmO8MPnOW33SpH6mLjMLhZ
   3VEDbDhHld+7jaX4q1HJUU4g2J8ifZZsZheS5uXQnvnspGk2mqUheJH1S
   jQ9VUQ/24hyjcbkvO4CbyG0QDUKlzKO8fEBdtuu9m+sy09FXsLHfekMwk
   z+DmrP8MLbnitdGdcXg9nKNynFYnqizBXj/+aGjTdYrmdocVg+X+iTOy6
   hR3tFXNzrkre60XPNv/oWLbGT9MT69lJ3MrxlKmuEsVdQf38Evnh9ZSFF
   PvjTemyW0P7S2dtrwwY3hhwCJiH3VR5SWqqRht022mLP+5rhR4TWH+f/z
   w==;
X-CSE-ConnectionGUID: XTVTFODCS7qdBXFu2Hrrbg==
X-CSE-MsgGUID: kdw+D8JFRrKqtbbHtfibzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2372045"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2372045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:14:31 -0800
X-CSE-ConnectionGUID: O6uTFehRTw+BmuW149Ow0w==
X-CSE-MsgGUID: cGBNyobnQaO3DMxJO8aWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6375614"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:14:29 -0800
Date: Tue, 3 Nov 2026 22:14:26 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 06/12] media: ipu6: Add firmware-specific ISYS
 response dispatch
Message-ID: <aupAokwvQgFAepbi@ashevche-desk.local>
References: <B4M1vUVEJG-bpgpO3B_4JKq2KUnJn56WFxEbA8byH4SjqblOQWrnG-O2WAzY-PnwccdL03yZzjS8VfD1CsZ-FFyQXbrpN3eB1K13Cp_o_Ok=@proton.me>
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
In-Reply-To: <B4M1vUVEJG-bpgpO3B_4JKq2KUnJn56WFxEbA8byH4SjqblOQWrnG-O2WAzY-PnwccdL03yZzjS8VfD1CsZ-FFyQXbrpN3eB1K13Cp_o_Ok=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 12:34:43PM +0000, Ruslan Bay wrote:
> Route ISYS response dequeueing through firmware-specific operations
> while keeping response handling shared.
> 
> Allow the common handler to skip message-buffer release when required
> by the firmware's buffer ownership rules.

...

>  leave:

I dunno how many of these goto:s your patch touched, but this error label has
no sense.

> +	return;
> +}

-- 
With Best Regards,
Andy Shevchenko


