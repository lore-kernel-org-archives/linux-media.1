Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBC733F37A
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801494; cv=none; b=pGFbR1+n4P7s5m06LactpebEfhrzM6BgCjSIO77CgRheQY41SJY6lzs4HtKBRcuNnxW+pg7+w2flXFBrr3c/QriXO2sfCzqMg4XK1jQtQGrO35zE+HJHzexMwL3i0d4MMvjHQ5QcCAy/HfCzz/qXS/vqO9BUbM/jQD7K/fuUUj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801494; c=relaxed/simple;
	bh=o+WmGbINUCrnuZc5rPL32gGit5nAnVk4pmYOqEPeT+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msP+6d7MCdTnLzN970va9OE/1xHvk0Qq2k1w3lrGivjZXiaoLu5+X1kXOiRjTGKDVwq3DjixtVuMZwEXfQRbWItGZPSE+aC5YOH2lfnx5tZ9dkLCAjLJWne6kN7XL0GQfOUt3MHHZ6G7DShLpWQJM35uY0jFGea0KKsRA/jcDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2X0/NB2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2X0/NB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791801492; x=1823337492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o+WmGbINUCrnuZc5rPL32gGit5nAnVk4pmYOqEPeT+c=;
  b=V2X0/NB2XcrmOzfzVXSfYrvq3BDaqstgPBLcWduZ/KvHkL3Cxy1PZLBY
   /dsdhUZRlbxgTQlNoI8trw+dzfnwtf1ebnUlraedbShH76rh9orNtvM2t
   IfoaYa31+xGRgnPvfVtOWpcnPr0JeyecpEg9jTKh6hNKJ38TAg1sBzfUt
   TIytfTtXHRvOn26HJzJm9RhMSXKg8E8LHf4Wro7/sSmXPoJboqRyd0Ibe
   1WO/7677sxQ3Arwx2HJSELi4KKoWLa3cGozl55NRuU+nhUI50m5hMyySY
   NY76B5NbO+eUHNRT+gzepTj/XWV2eQ2qLPCk3arf5GjsXYYrwHE79VFsQ
   g==;
X-CSE-ConnectionGUID: 7W8VJU6HRveoACS+pTPDyA==
X-CSE-MsgGUID: zXfPYIhDQdu2nEOVEu2EXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="498020"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="498020"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:38:11 -0700
X-CSE-ConnectionGUID: PcraALUTRdSHQ9Em9LFvbA==
X-CSE-MsgGUID: 1zI09JGTRQSRLrzR0s/Www==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1051792"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:38:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D2729121B9E;
	Mon, 12 Oct 2026 13:38:11 +0300 (EEST)
Date: Mon, 12 Oct 2026 13:38:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
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
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 11/12] media: ipu6: Work around IPU4P CSI-2 port 2
 timing
Message-ID: <asy4k-Muh1acgU6s@kekkonen.localdomain>
References: <wHlhg4wMna8LgQHoqgFJxsJ3dL0clAd63yzOzr-vjRpkqq6WSPuzlLeYRGYHKwdl17CXzPVLFCWD6CNkI-BTMTd33QepNGnNWJZX6yvPAV4=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wHlhg4wMna8LgQHoqgFJxsJ3dL0clAd63yzOzr-vjRpkqq6WSPuzlLeYRGYHKwdl17CXzPVLFCWD6CNkI-BTMTd33QepNGnNWJZX6yvPAV4=@proton.me>

Hi Ruslan,

On Sun, Oct 11, 2026 at 02:43:16PM +0000, Ruslan Bay wrote:
> Use fixed timing values for the verified Surface Pro 7 front-camera
> configuration (CSI-2 port 2, firmware source 7, two lanes), including
> the lane-count programming order observed in Windows. Retain calculated
> timings and the existing initialization order for other configurations.
> 
> Tested on the Surface Pro 7 front camera; other IPU4P systems need testing.
> 
> Co-developed-by: supermepsipax <supermepsipax@github>
> Co-developed-by: thisiscamk <thisiscamk@github>
> Co-developed-by: ConsultingFuture4200 <ConsultingFuture4200@github>
> Co-developed-by: georgemihaila <georgemihaila@github>

Signed-off-by: is also required for these. But this isn't just about adding
the tag; please see Documentation/process/submitting-patches.rst on what it
means. A proper e-mail address is also required here.

> 
> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> ---
>  .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 50 ++++++++++++++++---
>  1 file changed, 42 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> index ec0a36069b01..ffa7d80cd5f2 100644
> --- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> +++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> @@ -69,6 +69,22 @@ void ipu4p_isys_phy_setup(struct ipu6_isys *isys)
>  		ipu4p_isys_configure_phy_bb(isp, &ipu4p_phy_bb_configs[i]);
>  }
>  
> +/*
> + * Use fixed timing observed in Windows for the SP7 front camera:
> + * IPU4P CSI-2 port 2, firmware source 7, two-lane D-PHY.
> + */
> +static void ipu4p_isys_apply_fixed_2lane_timing(struct ipu6_isys_csi2 *csi2)
> +{
> +	writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> +	writel(1155, csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(0));
> +
> +	for (unsigned int i = 0; i < 8; i++) {
> +		writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(i));
> +		writel(1269,
> +		       csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(i + 1));
> +	}
> +}
> +
>  static void ipu4p_isys_csi_irq_enable(struct ipu6_isys *isys,
>  				      unsigned int port)
>  {
> @@ -118,6 +134,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
>  	struct ipu6_isys_csi2 *csi2;
>  	void __iomem *base;
>  	u32 value;
> +	bool fixed_timing;
>  
>  	if (!cfg || cfg->port >= isys->pdata->ipdata->csi2.nports)
>  		return -EINVAL;
> @@ -146,14 +163,30 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
>  	if (!timing)
>  		return -EINVAL;
>  
> -	writel(timing->ctermen, base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> -	writel(timing->csettle, base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> -
> -	for (unsigned int lane = 0; lane < cfg->nlanes; lane++) {
> -		writel(timing->dtermen,
> -		       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> -		writel(timing->dsettle,
> -		       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> +	writel(timing->ctermen,
> +	       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> +
> +	fixed_timing = csi2->port == 2 && cfg->nlanes == 2 &&
> +		       csi2->asd.source ==
> +		       IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + 7;
> +	if (fixed_timing) {
> +		ipu4p_isys_apply_fixed_2lane_timing(csi2);
> +		dev_dbg(&isys->adev->auxdev.dev,
> +			"using fixed SP7 timing for CSI-2 port %u, source 7, two lanes\n",
> +			csi2->port);
> +
> +		/* Windows configures the lane count before RX_CONFIG. */
> +		writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);

Doesn't Surface Pro 7 work without these?

I can't recall if I commented this issue already, but I think this
information should be passed to the driver in form of endpoint properties,
stuffed in ipu-bridge based on DMI information.

The bindings for this should also be specified for DT, but perhaps that's
out of scope of the set -- as there remain a kernel interface only, changes
later on will be possible and fairly trivial.

> +	} else {
> +		writel(timing->csettle,
> +		       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> +
> +		for (unsigned int lane = 0; lane < cfg->nlanes; lane++) {
> +			writel(timing->dtermen,
> +			       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> +			writel(timing->dsettle,
> +			       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> +		}
>  	}
>  
>  	value = readl(base + IPU4P_CSI2_RX_CONFIG);
> @@ -162,6 +195,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
>  	writel(value, base + IPU4P_CSI2_RX_CONFIG);
>  
>  	writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
> +

Unrelated change. You could place it in the patch adding the adjacent
linest.

>  	writel(0, base + IPU4P_CSI2_RX_ENABLE);
>  
>  	ipu4p_isys_csi_irq_enable(isys, cfg->port);

-- 
Regards,

Sakari Ailus
