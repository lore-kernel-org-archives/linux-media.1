Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657426;
	b=nZeaE17UcppyBAeeH8HZD05JcBbl79ZtxcXgL0dAXczt86xyzcpMvLZRpDmKrHBrUBn0
	 Y1HPs1U2cQIeJsVKey9+C9mWFQuoRNLXE+HFnB08tmIm3IVqh0u/4Kp29Byt+urciVVqt
	 3Yf9MNHioo21RrpYNzNi1F1vyjId/j8egcnBNgikP+t3he14ouel8nbvQC2DqpIsd9F2k
	 lgCG7AqKjas+yxAAcuPux8t6LETjp/uW0HbEsEEY0FcnTYtS7egd8+ozM/A2cnBxk1pAz
	 cw4UuNQHKSrscCMgfA/P3efBL3sNWFILayLMMO4rr4Z9eMJ8QgC7TMotozaflafMlWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657426;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Ok/F/RXIBKF6hYelWLlJo/lN8NdkYF2ZyVFd0L3+UvU=;
	b=muW58y3sWlRHbZJKPNdi8dFkmqd7JfB2IgwutyQPhV1oB6slaTjB/79LsfvtzC9XKASy
	 275dSiQOjSrKFN8bizpgyScek4kanCgSNKcuDatIn7YD4I1RhfP3mjpMPeP3BSYg3UFLI
	 6k3Rh/SEgXJHPIY03cikv9rUxP+Ix6Sv4OnU4VVtWZTE2dgE/6bWJF9rFmDODmKjrcOqa
	 A+IHuIzaUQdHq9KC9QoN2fWTfIFeXaFHfEj6fUYqTcEwWBPhHysu3vbh35UNs6TH07gUF
	 vgkiOLGWdFxikTNWPbxZkkasXGIaixTnefMo166IcT3EoZa5g0nB56Y8cBRF5CqU77w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nTWfKw1G;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18D606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 22:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC18D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nTWfKw1G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793657426; x=1825193426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D1JBcU0SB2P+FA2R1gOLPfNeamBKV6/vuw9ci1YiPsQ=;
  b=nTWfKw1GxDhvVy6Xg3PM6LRim9CX1mDk4WWsQsWhQEpk824DYW5Hkq/U
   13ZTZJv7Ns4k6HOn7U6YZAC1pnj1XlAvGqWVbRwAXvWjJ/F+wRL6LVAJN
   u5gvlF8oAtTqqI5J9rw8BwHHwlG41UxGjCSpd9izFt7CQVnOFJEVgWSra
   9zulDCm6/r6sX+tCMyNe145ViIYe3W9/Kn8Rh0PAomWZl7kb5XXIO0EFx
   WwSE42dzFeQdK60w6QjrXeyJg0UFWC4e476vJzO71uz33SDyJccdAg4BT
   8hoRWxvOLIO1y2cj30gTGRRja+BCKgU2kwH8/zPSMhgmtfYqcGCMYC2Pb
   Q==;
X-CSE-ConnectionGUID: DVIIY+lMT1W5m1qNvS6m1w==
X-CSE-MsgGUID: 045TUfZuSriGfXjLlU7UlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2381439"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2381439"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:10:26 -0800
X-CSE-ConnectionGUID: fCnzvpVPT3ycbZZ1kbl3kQ==
X-CSE-MsgGUID: baVB97EyTK+VKGpIekCQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="8023986"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:10:21 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5CFA41202C4;
	Tue, 03 Nov 2026 00:10:30 +0200 (EET)
Date: Tue, 3 Nov 2026 00:10:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 11/12] media: ipu6: Fix Surface Pro 7 CSI-2
 capture timing
Message-ID: <aukKVmDyeqCUPqxx@kekkonen.localdomain>
References: <ElC-F7kGAuGuGMVkVhXXoaOAwPg9xWLwWxnihXLHEfX1R_urhMZo3nI7oN2CzRMAeZOGpussj-09mGxFf_7md1p-WPNW_H5WlmSIffLkZpU=@proton.me>
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
In-Reply-To: <ElC-F7kGAuGuGMVkVhXXoaOAwPg9xWLwWxnihXLHEfX1R_urhMZo3nI7oN2CzRMAeZOGpussj-09mGxFf_7md1p-WPNW_H5WlmSIffLkZpU=@proton.me>

Hi Ruslan,

On Sat, Oct 31, 2026 at 12:38:34PM +0000, Ruslan Bay wrote:
> The calculated D-PHY timing causes capture errors on the Surface
> Pro 7 front camera.
> 
> A shifted data-lane timing was observed on a Windows system and
> reverse-engineered from its camera driver. Apply the resulting
> 1269-tick value to both lanes on IPU4P CSI-2 port 2.
> 
> Keep the existing timing path for other configurations.
> 
> Tested on Microsoft Surface Pro 7 with the OV5693 front camera.
> 
> The Co-developed-by tags will be updated with the contributors' actual
> names and email addresses in the final patchset.
> 
> Co-developed-by: supermepsipax <supermepsipax@github>
> Co-developed-by: thisiscamk <thisiscamk@github>
> Co-developed-by: ConsultingFuture4200 <ConsultingFuture4200@github>
> Co-developed-by: georgemihaila <georgemihaila@github>
> 
> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>

Have you received my comments on an earlier version of this patch?

-- 
Regards,

Sakari Ailus
