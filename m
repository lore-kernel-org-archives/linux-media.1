Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435611;
	b=aWnyvMrAO1V6x3rJg7zSDwQN+omPZBlpCoY4Q6MSwewu1kryoh4vLKhE5OaIKTEsoyUC
	 UQ+b57biCszdoPEam4oKS96IWYuXZQkhzyWQSJN4mcgEYwlMgz0bpu6geam7q1ndcLsbI
	 aqOYM4YrfEC6F5NSBvnUilDk1dIj0FjC4Y/RCd6OvkaOoys6sOH+Zt6JsQIDdHyY15pWG
	 LVr9AFbJQzgFqRv+AHZWkOxvMHqu8aOzgxFtoyMvWXLbBicD8w+v3H2FVhjG8FPP/xdQ2
	 6Ty45OYcgU9HvzLCgZGe/gzxslq9wWC/LrVyLCQaNQchydfZdj5cIjpUKdEg+xE2tRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435611;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=RbOBeOqRVePbn0UND3rpLU8dyxwzzNyczxKi/hoVT9M=;
	b=uykroWGpOTTFfrW4Dc0XVDpEaqDX6rcGhJ5QIzn1h6K6H9xqpKCrnMzicN9A2HkBUHpa
	 PndzzfJcIjaluw+sZ7XKSXCkJhoD8ViFNCdAgb/fueQg00LG72OjGHxcZzNe4W6VeEbhQ
	 eJYljFIKAz+kk9zNs5EBVJ3PcN9ZFWGs6yoBerWxlGjNDRdMC3EshbZCNqGrNldjxuilQ
	 7GG7bh3F5coRUF8i3rjjjBWHWKKR+MOe9mXML1btI6C1uTzBzZPebrBvUypwyjZHSQNDB
	 M7M5eaml4GsbAlcGEwYUYjIcjH65lk18C13OA53J9Zb4MYFEFzv6h2BJGHGZb+7qqhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6vw69vA;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D0D606A327
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D0D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6vw69vA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795435610; x=1826971610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=doMzYxcXcg/7BK2TDlq+rZDmj5ZAt/sDQZgBkhZDx70=;
  b=O6vw69vABDno4xpx9IMuoyp+Zzq8Ci7VvyutyF/SFSsOibUPb3Vuuhir
   YjwB4IgSq90lRwrl8bC20cHcOrImqEYCGgeNlk5BXL0xkl7cppPU1LFB/
   NtWc/F6M4FHjJh0H+J90sdQoJup7RwOgDGsZj/GO7HYhHxQPT1itTo9Me
   sPkpWTBSEV+9PlgX/RGjqsQatQ5pzCeff9BE9U/x0zXWX1og1n8QTdcPw
   B1Z+09WHRyoFlcRmRmohr0d7uvYJPx+tVRriE6vUz1RNPzhkvZr84Hb2i
   VeUT3F7Oe7aFXM68SCPhixkbnmB4Yp1M5Kwrf0yB9tLoncyT86/5AVz1m
   Q==;
X-CSE-ConnectionGUID: XZxg1znGQwCvXDzEcmYGtg==
X-CSE-MsgGUID: +G18fLHQS6eI4CZZ4WVjRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4252048"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4252048"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:04:09 -0800
X-CSE-ConnectionGUID: iu39tx38TSyBENy/bsgtyA==
X-CSE-MsgGUID: lok0a7xpT12q25MYhb0kFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11381616"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:04:06 -0800
Date: Mon, 23 Nov 2026 14:04:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: vunny.sodhi@intel.com
Cc: linux-drivers-review@eclists.intel.com, linux-media@vger.kernel.org
Subject: Re: [linux-drivers-review] [PATCH 2/3] media: i2c: max9296a: fix
 video pipe status register offset
Message-ID: <awQrtJK6ft0NA98v@ashevche-desk.local>
References: <20261122234313.327866-1-vunny.sodhi@intel.com>
 <20261122234313.327866-3-vunny.sodhi@intel.com>
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
In-Reply-To: <20261122234313.327866-3-vunny.sodhi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 07:43:12AM +0800, vunny.sodhi@intel.com wrote:
> 
> Correct the VPRBS base address used for pipe 0 status reads.
> 
> Per the MAX9296A datasheet, the video pipe status register block has
> pipe 0 base 0x1DC and a stride of 0x20 between pipes, so pipe 1 is
> 0x1FC. Using 0x1FC as the base for pipe 0 reads the wrong pipe.
> 
> Signed-off-by: Khai Wen Ng <khai.wen.ng@intel.com>
> Signed-off-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Sodhi, Vunny <vunny.sodhi@intel.com>

The previous patch lacks of your SoB. And the other ones should be checked why
(I understand the author's one, but the rest).

-- 
With Best Regards,
Andy Shevchenko


