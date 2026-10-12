Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB262BD0B
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791518; cv=none; b=uLSnhjMlwzk0ripnTAzJt6FS5aen48tR+IucirtgH5mDnGhOUGrP46G/+bPFcsuXpMWnOWiSE6UyqhLziljpWtZ5oYh8DpzberR9VaAvSAwA6hHyZoKIy+v+RYGqFYsP3EgoX82/DsE6FVgjX5QMjEr6NURVkOWVuZflyei5xmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791518; c=relaxed/simple;
	bh=RrOZY8WwJCZpeX7YFa3bFVnxjRpRc5yqIm1BKes1x+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmZNpY0fIAXS1oB7vvO8Q9FAfkVx/0Fb6E+1Ha83PlBV3xocwXlTc+ZcqqB07EBYLeetJup0d4MQhBJjQ6M89FMdrOw8WwRnNadnVzdUdAEdj0l6yx7FZTW431uqL6m3B9CgAEN3V0gN7TZOjL/N9mRPQOCKKtalLtl/QH5bQYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qxn8Yb+N; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qxn8Yb+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791791516; x=1823327516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RrOZY8WwJCZpeX7YFa3bFVnxjRpRc5yqIm1BKes1x+E=;
  b=Qxn8Yb+N7wqY0kt+POVHpUbdSgXFPxgjQHeaamaRJNs1+j8yXrcoi1uT
   n2vWHnYHYZ7YKDWi+UBBPdGIh0j0dIq51uBg0OZivPVSBOAZyKZHFfNfx
   UVr5zRJwe4NgICK9Bgag6C8NAwQglZrwhUAiD21IBCkdyWBLLUbUwlo10
   vGpMtXPyltdfXpR+nb7fXHxKqWRYNfsclWCFuVVdjsU2KoicunTD3rQUF
   xUzNNFjlPSTy4ya6ncP7Gm9HVOlp+L2TWkOb0D2Xlo/nfSk+PZzIAb+2g
   U9k65wrAHKGDjqv480JXdMdtqrtpGI+OcEDs1eAwbaz0a8/C2Ps2bdbUB
   g==;
X-CSE-ConnectionGUID: iaKisFH/Q9G9adKeLYC4+Q==
X-CSE-MsgGUID: Cit+YzUdTuWa42KL41Dr8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="483710"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="483710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 00:51:55 -0700
X-CSE-ConnectionGUID: dsxxKi74TjWOl7917MSqig==
X-CSE-MsgGUID: Gt4EzATvTcKP/XcsN0MFjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1018196"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 00:51:52 -0700
Date: Mon, 12 Oct 2026 10:51:50 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <asyRlrnPTLmfYVn-@ashevche-desk.local>
References: <5oAFQQK4aV42L5EWnypG-lloKyb1XF33Qcd8JU3xf9Ik0JjBNXuPkx0f5mvFZzd4jDkt7orjqgppZJJUrH2UePK9HvAfIYfxyWVG4HYl7rU=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5oAFQQK4aV42L5EWnypG-lloKyb1XF33Qcd8JU3xf9Ik0JjBNXuPkx0f5mvFZzd4jDkt7orjqgppZJJUrH2UePK9HvAfIYfxyWVG4HYl7rU=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 11, 2026 at 02:24:15PM +0000, Ruslan Bay wrote:
> This series adds IPU4P support to the upstream IPU6/IPU7 driver.
> 
> Most of the groundwork was done by Antti Laakso in the IPU7 support
> series [1]. I added the IPU4P-specific parts, using Intel's downstream
> driver as a reference [2]. Development was assisted by GPT-5.6 Luna.
> 
> Image capture works with front and rear cameras, but a
> rear-camera stream-off timeout remains under investigation [3].
> 
> The media device name is intentionally kept as "intel-ipu6" so the
> unmodified libcamera Simple pipeline handler can recognize it [4].
> 
> Tested on a Surface Pro 7 (Ice Lake, i5-1035G4).
> 
> Review and feedback are welcome.
> 
> Thanks to the linux-surface community and the libcamera developers for
> testing the downstream driver and sharing their findings.

Your patch series is broken. Please, use appropriate tools with the expected
parameters when preparing and sending patches. The

	`git format-patch -v<N> --cover-letter --thread ...`

(and --subject-prefix if required) where <N> is the version, usually does
the correct formatting.

-- 
With Best Regards,
Andy Shevchenko


