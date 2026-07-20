Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA42E35DA6F;
	Mon, 20 Jul 2026 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547647; cv=none; b=FVgaMPBs3UDU40kLuUJxc2e4oBgJ7VaGlf2EFw2oLSbi+Ct+edwXIfUQhRUAI6M8WvgjMyOtfyr4gj+PB2HpBLIy9uqFquubO/RYf9oFyvQF97eH1EsR5rSt6auJmgWmavMuC0pJyWCnd6hvLUbnCSwDnYju8neoqBbEswb9NR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547647; c=relaxed/simple;
	bh=NsHQ6elIAxn8nF8i5Zx/7RqguhUbcd8/6GctSEOdaRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/zu56th2tidRTxpEqGAeLBzmPkdjj3dtGP2MK0Qq9N38bciFR14Kmu5yUU6ygidH63mRuY04RifiJuMtDEGTIzYBwFu5pXNl6XXBtCvpLPPk95zbeIvVfIKeAQ7e0EKRIlJFj66CRpmVF3CK9a29wHeEteb9ZYDymARWxJMdLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agZx0ysQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agZx0ysQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784547644; x=1816083644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NsHQ6elIAxn8nF8i5Zx/7RqguhUbcd8/6GctSEOdaRk=;
  b=agZx0ysQO191rXaznbLD4Bq2nhXXjcO1SlOxamvpLL5OsADeB5mCq5mI
   i9TfKbSiTewc9fZCv65JQgIveCzcZNrWWUTHcH2R/miHtAddCew5rWx8b
   BZk2BVRYh9mVeuLhiHqRW9X0JlhBETsUve5Y4uowY9TNbaRPrRFRVKHEb
   Q+Iy7Z10p+9Dg1/Gw8eqKFIpcPGN6C8O11biAXGrVxHIS4s3f2HuIP1xB
   Fe/sHAblSFD6wrWLohwkOspPjrmGxevdd4ylKHfJcHdMjUL1iMnkR3cRT
   YgeKDAQg4Qyf6S498SJIxIaeOEXA7SCKObWvL8ArWlEyg+eh3mXO6hS45
   g==;
X-CSE-ConnectionGUID: G/nI4FJ/STyw6E2TkqgGqQ==
X-CSE-MsgGUID: J6/gLohaQh+DLFtWKrzjYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="96638262"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="96638262"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:40:43 -0700
X-CSE-ConnectionGUID: 9PTX6jbsSvq+y6eb/VPJ6Q==
X-CSE-MsgGUID: qOPEd7mgTyiZ20O+Dr2XBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="262394579"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:40:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8DE3D121C2B;
	Mon, 20 Jul 2026 14:40:41 +0300 (EEST)
Date: Mon, 20 Jul 2026 14:40:41 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: [PATCH 2/2] media: i2c: Add a driver for Sony IMX708
Message-ID: <al4JOfnFAi9SdG5j@kekkonen.localdomain>
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
 <20260715-imx708-v1-2-1f36f54e14d4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-imx708-v1-2-1f36f54e14d4@ideasonboard.com>

Hi Jai,

Thanks for the set.

On Wed, Jul 15, 2026 at 11:01:29PM +0530, Jai Luthra wrote:
> Sony IMX708 is an 11.9 Megapixel CMOS sensor with a 16:9 aspect ratio.
> It is a quad-bayer sensor with support for remosaicing the output to
> a normal 2x2 bayer pattern.
> 
> This basic driver adds supports for capturing the full active-area of
> 4608x2592, up to 14.35fps. The following features are supported by the
> driver:
> - MIPI RAW10 output
> - Fixed quad-bayer correction
> - Multiple link frequencies (different IOP_PLL_MPY)
> - VBLANK control for flexible frame-rate
> - Analogue gain and exposure control
> - Extremely long exposure time with LONG_EXP_SHIFT
> - Test pattern support

How close is this sensor actually to CCS? A lot of the registers look like
they're CCS registers while there are some MSRs set programmatically by the
driver, too.

-- 
Kind regards,

Sakari Ailus
