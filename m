Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735617;
	b=QTx9PmsPhgeIgUgJlq5i/BHHrbcjZ7kqukNDgWcUkx5ZwjtXCqD2raOivP4uJqrFD/z4
	 XYJjEQ4bSSGZWnLlykPcYMex6qTQB2FOpjFjRhw5bDCq2LjslMQgfquqdBUwS7orfePYf
	 tUFnKiuatS+GapreE2ZDWqeEJcgFkjRZPkt8xh31DGpZsdQk+XA1FufG2L/sCwMCRaFvJ
	 DHVHlOUWmpWBUO7Ri42vxvy1iM7KMz7TemDEmXtXyvq+3q5xelUVqdZmuTyNKxAkVcu9M
	 cAK/Wg0jCshIrSwNdy3P8j6hmMRyM6nm3dxBzo+xDMYypKUdq1uivb3iEnEiMFQsntg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735617;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=V3TlmWmJ2YZrUh4OcA1KwreSIqG5atldvCO/yL+C7r8=;
	b=rINwTeUrTTS13Hz4RtuyzO2FYJSei5iMe/91rB8ZVbpu1d7hU50WbJYZWwEVZEbK6SXH
	 s4gq0mXLGFWr0nnNlC5X+ENzG5picUDgCYTkAPUrpFIlBzssz8VQGW9kdiYbJoSgl602C
	 QghbJWcqXeWxFgDSrYJqUA31V33ADu7NE4bElBuh8pbVpu16IlCb2ZxH0HFkNDq/PcMWR
	 1N/WvyoFwNpW+I3bEhgRoqzDF0akoU6OMCW22LrAePdUc3fpi+Zr3XnQVj+9rARhWCZxA
	 RmmqX9qDPgmoP1d573Pe1ZZVGu8SwpX7GfaQnB7hn8PgxVCjsRHubK1OHV+jpCMO4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XveJbBtg;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E43606A33F
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 19:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E43606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XveJbBtg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793735617; x=1825271617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3YtjttFALIBSr9m4nsZO4vm3FbQTmGb4u2NX2Hs8Tjo=;
  b=XveJbBtgWt/R/6xTCV+pnQQHdSLHA4fX1/qctB/ohKlDmZGmge2DQKIJ
   xjikabZ9j9N6If8mald4KZ61w28R9tjaiNjYxeNk+VVetn1GGygh8sLEg
   osYpK82bAXGJtXo9dV04+rQrO8rGQWxSWg29rgrQSxVoKaXglFbYwNbzM
   H3L0WdSrzidecqrXT+7AZiQhnbJFfuAo49Me+Lu+Hte8AmXJP53TVEPCz
   w9iievKL27rRydP2T86D7TJ3IiSIe18M/Vga6F3w0oPdzYWIPubueVK6o
   X+XVSuM+OMx5L3/h5pnNvwTlGYODwb0tp0HuGSP917/tP45IyA3/3m6Yj
   w==;
X-CSE-ConnectionGUID: CT+JUgQURze9ANJiZ1GfVg==
X-CSE-MsgGUID: 6KPJwlXSRIyHClwWKO4AzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2487113"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2487113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:53:36 -0800
X-CSE-ConnectionGUID: FgQ2ecu6SNmOO8A3vp2f0A==
X-CSE-MsgGUID: ELNai9BSQTWS8KU1WjeA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6842541"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:53:34 -0800
Date: Tue, 3 Nov 2026 21:53:30 +0200
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
Subject: Re: [RFC PATCH v2 03/12] media: ipu6: Add IPU4P buttress support
Message-ID: <auo7uhyMyAAunZ0v@ashevche-desk.local>
References: <dxiseBxpo43MCJmKSifa4B3wCb7LUo8rIpVr0mGqSQ3iY_uJubyeh5YTLLMkcwddOe1imYnPpQdC5Cjy-_8zCU1_rbfqaQF2hnx4YkX2Mzw=@proton.me>
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
In-Reply-To: <dxiseBxpo43MCJmKSifa4B3wCb7LUo8rIpVr0mGqSQ3iY_uJubyeh5YTLLMkcwddOe1imYnPpQdC5Cjy-_8zCU1_rbfqaQF2hnx4YkX2Mzw=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 12:31:28PM +0000, Ruslan Bay wrote:
> IPU4P uses different power-state fields and frequency-control layouts
> from IPU6, and has a different bootloader status register.
> 
> Add IPU4P-specific power management and firmware authentication
> handling.

...

> +static int __ipu4p_power(struct device *dev,
> +			 const struct ipu6_buttress_ctrl *ctrl, bool on)
> +{
> +	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
> +	u32 pwr_sts, val;
> +	int ret;

> +	if (!on) {

Use positive conditional.

> +		val = 0;
> +		pwr_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
> +	} else {

> +		val = BUTTRESS_FREQ_CTL_START;

Just duplicate and unite under the branch

> +		if (ctrl->subsys_id == IPU_ISYS) {
> +			val |= FIELD_PREP(IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_MASK,
> +					  ctrl->ratio);
> +			val |= FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK,
> +					  ctrl->qos_floor);

			val = FIELD_PREP(IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_MASK,
					 ctrl->ratio) |
			      FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK,
					 ctrl->qos_floor) |
			      BUTTRESS_FREQ_CTL_START;

> +		} else {
> +			val |= FIELD_PREP(IPU4P_BUTTRESS_PS_FREQ_CTL_RATIO_MASK,
> +					  ctrl->ratio);
> +			val |= IPU4P_BUTTRESS_PS_FREQ_CTL_OVRD;

Ditto.

In this way it's easier to see what exactly is put into val without browsing
the code.

> +		}
> +
> +		pwr_sts = ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
> +	}
> +
> +	writel(val, isp->base + ctrl->freq_ctl);
> +
> +	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
> +				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
> +				 100, BUTTRESS_POWER_TIMEOUT_US);
> +	if (ret)
> +		dev_err(&isp->pdev->dev,
> +			"Change power status timeout with 0x%x\n", val);
> +
> +	return ret;
> +}

...

> int ipu6_buttress_authenticate(struct ipu6_device *isp)
>  {
>  	struct ipu6_buttress *b = &isp->buttress;
>  	struct ipu6_psys_pdata *psys_pdata;
> +	void __iomem *base;
>  	u32 data, mask, done, fail;
>  	int ret;

Reversed xmas tree order.

-- 
With Best Regards,
Andy Shevchenko


