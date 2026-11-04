Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781290;
	b=MkAaobdx+jGIKxg1pDNiUqZiDEn22Um5wDnnmVRto99DA/9gV2MO1CEGKX36Lp3bvKbz
	 MihsX87gee34VV0VgzPXrfpIHqbSwerbpw4JTr3WH4nCRTVfFA6l0RRCtG07bfxfEeOMG
	 0HVxw4G5k1cUzfueMlaO3fmd4YBaHzLgHqNESzJ/tIo9zMDnYcTWpALjJkYIRNWG0mLCa
	 K7pM4l7+DUwu4G2K3kfOO+tVFAgDjY2mpPxIswtz90/sy38KVqWbe4JJdnFrZTJTKdx4+
	 8DxTRXTEzccz0cl3g/vx7nudngaKlicuH1GCmB4xWMQ04kEz92SgXVa71r0oOPeCBIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781290;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=5v7+Bu/EskBD82YGCglivtDPgpPKKLB0vpYam9HeN3k=;
	b=5ku/ge1PcUjZIxZkOg4v08fASaJ3EN3l2kvnu4VchY1KoTZmG/UA/Yk85vjz7J2e8qYw
	 QiM45lSdz0AJq7J8XuPX8g7irWo9LX8WTvNXDjPz19fqScHA88qhiQtwHWn5ryTFa7esO
	 9y7eTeVpgNRs3W4nqczpg88Wo6r/IAviXJ0SEvZ4ZttwxMI0z2T4XYC0oxlyKRMRciL6h
	 AdydujVlLalSrFeRSV//x6/GBZ1Yx8IcGMbRKUH2McyqdU3G0QG3W0EAnmb6fgRv+9dLG
	 TUTqEx0xHbmirRJM1+Zq67pKfXHUZHgFoGpyyMcDv09HDeaod4Ei8gsa8FUBqNMOQxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W7UGyZHs;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CA0606A32C
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 08:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CA0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W7UGyZHs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793781289; x=1825317289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=agjIw00ZTp0oYszm8Lq9XP1CiuXKSA/mG60ROXjOWSA=;
  b=W7UGyZHs6VvRb2cuwHQs0FdeCv21HGgdZLnimwJPq+UiL+RypdYrANXl
   KAJF6nxBdch+Vhz0Q8TT1N5qRwzUjTC7ofibGJkEkgC2kjt5OPAt9bh84
   b0Atght9XVA+/TUXQXK/tVuk/3Z8nhPSiI7HO1v+wlbkkhsZjJqpVbn0n
   oE2FWedQlO5AYulGfWy73W12psfeE0rbpb0LPLAu4jE1g7//e82iubYAj
   KM7moEMfJE+bPQwv+juv3lJZG3/qZf37LO0/wXO/CkI9UlxIXf9m9FvJn
   XW5rQ5erldT+1hAvDN3PsMLm8YQm6tJGBeJ53ZZ5K4r/ST9jDji55PsIr
   Q==;
X-CSE-ConnectionGUID: Q9lAcChYTbGYoA9uQbdAqA==
X-CSE-MsgGUID: rogXFf8kRV2rgcjceshtDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2535414"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2535414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:34:46 -0800
X-CSE-ConnectionGUID: GHyj5HxSQ4CGURPj502+/A==
X-CSE-MsgGUID: a78ScOo6SNGUTdJjGUWlIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7022188"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:34:42 -0800
Date: Wed, 4 Nov 2026 10:34:39 +0200
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
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 11/12] media: ipu6: Fix Surface Pro 7 CSI-2
 capture timing
Message-ID: <auruH91t-VVZY-vq@ashevche-desk.local>
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
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

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

> The Co-developed-by tags will be updated with the contributors' actual
> names and email addresses in the final patchset.

Please do it now.

> Co-developed-by: supermepsipax <supermepsipax@github>
> Co-developed-by: thisiscamk <thisiscamk@github>
> Co-developed-by: ConsultingFuture4200 <ConsultingFuture4200@github>
> Co-developed-by: georgemihaila <georgemihaila@github>

All Co-developed-by should be accompanied with the respective SoB tags.

> 

No blank line in the tag block.

> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> ---

...

> int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,

>  			     bool on)
>  {
>  	struct ipu6_isys_csi2 *csi2;
> +	const struct dmi_system_id *dmi_id;
> +	const struct ipu4p_csi2_timing_quirk *quirk;
>  	void __iomem *base;
>  	u32 value;

Keep reversed xmas tree order.

...

> -	writel(timing->ctermen, base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> -	writel(timing->csettle, base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> -
> -	for (unsigned int lane = 0; lane < cfg->nlanes; lane++) {
> -		writel(timing->dtermen,
> -		       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> -		writel(timing->dsettle,
> -		       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> +	dmi_id = dmi_first_match(ipu4p_csi2_timing_quirks);
> +	quirk = dmi_id ? dmi_id->driver_data : NULL;

> +

No blank line here as the below is coupled with the above.

> +	if (quirk && cfg->port == quirk->port &&
> +	    cfg->nlanes == quirk->nlanes) {
> +		for (unsigned int lane = 0; lane < cfg->nlanes; lane++)
> +			writel(quirk->data_ticks,
> +			       base +
> +			       IPU4P_CSI2_RX_DLY_CNT_SHIFTED_DATA_TICKS(lane));
> +
> +		dev_dbg(&isys->adev->auxdev.dev,
> +			"using Surface Pro 7 shifted timing for CSI-2 port %u, %u lanes\n",
> +			cfg->port, cfg->nlanes);
> +	} else {

> +		writel(timing->ctermen,
> +		       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> +		writel(timing->csettle,
> +		       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> +
> +		for (unsigned int lane = 0; lane < cfg->nlanes; lane++) {
> +			writel(timing->dtermen,
> +			       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> +			writel(timing->dsettle,
> +			       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> +		}

Add a preparatory patch that moves this code to the helper function.

>  	}

-- 
With Best Regards,
Andy Shevchenko


