Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881302;
	b=yDkpFfCCu+CiF2Cu2wo9NvI45BPxW+uCk+86GnEj1Yxv+g/oStD0fA4mG3VFo47GOsGE
	 1u/YOVTWUPR1JbZVp4hNi4EowJ/sioudxnaJvfZTTRtuaXJaNLbUaNRU+a28NtUyCaeEt
	 oU+cN1milQkhd9NLsJXug9Sbu50dBYFoLcyTYE03cebcYvrqvuDO2lpblFe+me1Ew3K0j
	 WlO7+zeVsEfPYlfFSFv3HefYpYsRjq95Hk3Omj5nCwnre8PvYjwTV1670acSm1C1CFobM
	 v0CcByz4w+fpfgtCub8OKh8pNw+2cZvf7P6f0doc49On5WBQS1C+H4PdV2UkcQA6hcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881302;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=vIsSiwvekVWg/e/dKdzyP6fBu2IXZHxNkPqLsWzTCgI=;
	b=LfP0NI0QJKKfyg8jfXUlihbhCnYH3GUEg0bpEuCTD4+EuB0MyihwOEKejq2OUOl42/8A
	 9YJFfPF+RsVlQiR8e487Uu2IbgjyfDcSEvJ8ZuruoI4cU0bPwCKoSYtYYeGEbowRgSpd/
	 icwsGxGj7ayt/V0n4DrA55Bp80UhOcMl8dZVOnKuOTShmurfKSLRLMnDG0ndvN9c9hNLK
	 YXM+RiVjtCaHtvQFvmHdbhhUbBlGMcXU3fMn8MKw+f00xWxkB8SmeZ76M7SE3Hps2xTSp
	 OdbA4cUhq5IkluEL3v333+Jjs59MuRDpS8CMqp8RItLQAAmcNVj3c3fNP83Ez2BtOEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=emBi7rKl;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C0606A335
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 12:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 598C0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=emBi7rKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793881302; x=1825417302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7a/BpVhBG7KhhYF/q3MAMPwbLP0Ylrew+bgXWjiOlxU=;
  b=emBi7rKl4jsWEf0DkO1vW8eMLFWQrXLmEtAVJB6H/+dCJKwpHhfka9p9
   YohMIO6ikIsxKxjXxu3bChoBTGvWFG8fTXBuZnCVAOnCy7aYw6o/rakye
   AhU1pj3QnKKbPsRI17kwk/OkNy89SHo6OulrxQ1zBccbbZWERlNwF21HM
   Sl6eIwqJfN56+Rcy4cx2PFWoEEDX92dXeABn1gmGBDL9d8ZCfVZWTRjyM
   +J8SUaaDN3bnZDcgiZX7St58Mhg16uzUwon5BAznxntjS572BaldS49rL
   KIRCKFGCE1f9v732DoEgiN0HVSWZKSUDYCF4wVBRpJzc/CZm4fi4oeBgM
   w==;
X-CSE-ConnectionGUID: +Mh4fflkTyOp4/rAvMfuGQ==
X-CSE-MsgGUID: 2ye+LT9YT+eQ+tgnt41JhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2565912"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2565912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 04:21:41 -0800
X-CSE-ConnectionGUID: 6QdQk0lrQSGwHkYz9A70oQ==
X-CSE-MsgGUID: bQVUJB3BTpWdluHGhkIzzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7011204"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 04:21:37 -0800
Date: Thu, 5 Nov 2026 14:21:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] media: ipu6: Improve Kconfig help text
Message-ID: <aux0z2WslDMb60BX@ashevche-desk.local>
References: <20261105094403.3165245-1-sakari.ailus@linux.intel.com>
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
In-Reply-To: <20261105094403.3165245-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 11:44:03AM +0200, Sakari Ailus wrote:
> Add IPU 7.5 to the menu item name and list the supported variants and the
> SoCs they're found in.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	  This is the driver for 6th generation and newer Intel IPUs (Image

(Assuming IPU4 patch simply replaces 6th with 4th.)

> +	  Processing Units).

...

> +	  - IPU 6 EP (Alder Lake, Raptor Lake and Meteor Lake)

Oxford comma, please?

	  - IPU 6 EP (Alder Lake, Raptor Lake, and Meteor Lake)

-- 
With Best Regards,
Andy Shevchenko


