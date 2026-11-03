Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732779;
	b=l/lWCrOZWhEgcIia3dmJsYGpQ7MaxoaB1g7YPT3i5iANlhYYzC+Md9mulWJREwYE7EGo
	 5oAgaah/hPAzScbiqEWjYJUddfnFrySbI4HhdK9+fQ/MKUjhdLhLlqYSLZ2sMiC+EeU2N
	 ZvHdS8g+dtGxxP/K+5PKdfZ/j641oxaAqH9H+jtPrX/CwvjutCoToxPPoEEwYa5WsEMlt
	 Aymt9v9Tjk2PwFBm+GQpwpXsb02F9jmCm0ubZeJaLeoLmtxpNYM7k6xcrVEjEN+oWLq1j
	 kJNM4I5sQK7WnKsB539MQKp1vBDEmPQBEBGNrVRmbHBNJD4AyQX9sgLoGu88F++joyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732779;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=mepq/9HOnRKlNWuEdT3dEMebWpW+8umN+H0oHwSQITA=;
	b=PL8CVxxucdsF3Uxh/MLcef26Ap4w5jYV7ptamtivA3gTBNWF+7HYqnodP26hN7i4CE4e
	 TQ9WZDe7HXsUEpIZ0qTek7Q5STffRQEq0WqaXZ2CawQxjmT76dhxeb+IeMKnRVnb9BZPh
	 Vo62UeFEcqgTACxSt9tsn6X29G3xGt3NLlFHALv+qXWyW6tGZBUNvNK1FOXLWxOOG3HEE
	 4hU4EWNysQxuS0aIMmSSbrWee5vuFqiqyzWNpDfnPPblb8vLsWvyPxyQ56Nk36ibAUyyd
	 S1ZmPArdlZ9S0UnodmMv6kI4sn3Mwtwbm7uruByNB+Iw52wSGx0pdKPkPvHNEPwwpew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uv0lpvOJ;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E4B606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 19:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E4B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uv0lpvOJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793732778; x=1825268778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wsOOlq3BWtgLhLDp4qy2mxGvX73ZuxPLLmYBmkqob+Y=;
  b=Uv0lpvOJu6yU4gLMGkUEo8GMFxibGtN0XO1fu+eYukaal5QcVzxi0LMI
   +QzcsE3hjWi8SwkYOrt1op+GYbEmktGU8LEpWGiAjE0W66+IGohsUv8kx
   ktQTXAjBHG4CbVEeEjF61UjPhYssqF5ZaCfYG9Onvl400UircJpESwtbg
   5dzpN8SKIcTWAX8Yn5JaezdLetbl7ZnoOvilPtHU7UEnMc/32SJUK0JWT
   5KSwf9syTtUIAzzkKVmjwxPJv7qObgbOe5Tq8zh0q3d6ooxN8Ik/nAI5C
   4aFZ0/RpjwNryYDCZFOg7bEiT6e7ap4/AvVQGRIv5Z4Cos6+kq7TAF/+M
   w==;
X-CSE-ConnectionGUID: 0+bofVUySTyLJIJFsLqwMw==
X-CSE-MsgGUID: JJEUwXk+Q/i7N5rwdwvTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2353018"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2353018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:06:18 -0800
X-CSE-ConnectionGUID: gr0m0/ztR5SuF1QjCltAEg==
X-CSE-MsgGUID: lIAM95LoSNWG5QmYhkqQWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6354602"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:06:16 -0800
Date: Tue, 3 Nov 2026 21:06:13 +0200
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
Subject: Re: [RFC PATCH v2 10/12] media: ipu6: Add IPU4P CSI PHY driver
Message-ID: <auowpWOZpBtJxsEA@ashevche-desk.local>
References: <gFA4p9lGPPkGxkbDnbfblvYfNhZOjJLgwimit_oxwNrKdJ7bITmNPWCXOoNN_KHKD3EqjISrPd4NS4VqchOpYZNHqsiE_0UxIbGTs7rUAyo=@proton.me>
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
In-Reply-To: <gFA4p9lGPPkGxkbDnbfblvYfNhZOjJLgwimit_oxwNrKdJ7bITmNPWCXOoNN_KHKD3EqjISrPd4NS4VqchOpYZNHqsiE_0UxIbGTs7rUAyo=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 12:37:45PM +0000, Ruslan Bay wrote:
> Add IPU4P-specific CSI PHY initialization and power management.
> 
> Configure the PHY building blocks during ISYS resume, and handle
> receiver lane timing and CSI error interrupts when streaming.

...

> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/dev_printk.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/types.h>

> +static void ipu4p_isys_configure_phy_bb(struct ipu6_device *isp,
> +					const struct ipu4p_phy_bb_config *config)
> +{
> +	void __iomem *base = isp->base;
> +	u32 value;
> +
> +	value = readl(base + IPU4P_BUTTRESS_REG_CPHYX_DLL_OVRD(config->bb));

> +	value &= ~GENMASK(6, 1);

Useless duplication.

> +	value |= FIELD_PREP(GENMASK(6, 1), config->crc) | BIT(0);

You want FIELD_MODIFY().

> +	writel(value, base + IPU4P_BUTTRESS_REG_CPHYX_DLL_OVRD(config->bb));
> +
> +	value = readl(base + IPU4P_BUTTRESS_REG_DPHYX_DLL_OVRD(config->bb));
> +	value &= ~GENMASK(6, 1);
> +	value |= FIELD_PREP(GENMASK(6, 1), config->drc) | BIT(0);

Ditto.

> +	writel(value, base + IPU4P_BUTTRESS_REG_DPHYX_DLL_OVRD(config->bb));
> +
> +	value = config->afe | FIELD_PREP(GENMASK(30, 29), 2);
> +	writel(value, base + IPU4P_BUTTRESS_REG_BBX_AFE_CONFIG(config->bb));
> +}

...

> +{
> +	void __iomem *base = isys->pdata->base;
> +	u32 offset = ipu4p_isys_csi_irq_ctrl_base(port);
> +	u32 offset0 = ipu4p_isys_csi_irq_ctrl0_base(port);
> +	u32 mask = IPU4P_ISYS_CSI_ERROR_MASK;
> +
> +	writel(IPU4P_ISYS_CSI_IRQ_ACTIVE,
> +	       base + offset);

Perfectly a single line.

> +	writel(0, base + offset + IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET);
> +	writel(0xffffffff, base + offset + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
> +	writel(IPU4P_ISYS_CSI_IRQ_ACTIVE,
> +	       base + offset + IPU4P_ISYS_IRQ_MASK_OFFSET);
> +	writel(IPU4P_ISYS_CSI_IRQ_ACTIVE,
> +	       base + offset + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
> +
> +	writel(mask, base + offset0);
> +	writel(0, base + offset0 + IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET);
> +	writel(0xffffffff, base + offset0 + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
> +	writel(mask, base + offset0 + IPU4P_ISYS_IRQ_MASK_OFFSET);
> +	writel(mask, base + offset0 + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
> +}

...

> +/* PHY settings persist until ISYS is power-cycled. */
> +int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
> +			     struct ipu6_isys_csi2_config *cfg,
> +			     const struct ipu6_isys_csi2_timing *timing,
> +			     bool on)
> +{
> +	struct ipu6_isys_csi2 *csi2;
> +	void __iomem *base;
> +	u32 value;
> +
> +	if (!cfg || cfg->port >= isys->pdata->ipdata->csi2.nports)
> +		return -EINVAL;
> +
> +	csi2 = &isys->csi2[cfg->port];
> +	base = csi2->base;
> +
> +	if (!on) {
> +		value = readl(base + IPU4P_CSI2_RX_CONFIG);
> +		value &= ~(IPU4P_CSI2_RX_CONFIG_DISABLE_BYTE_CLK_GATING |
> +			   IPU4P_CSI2_RX_CONFIG_RELEASE_LP11);
> +		writel(value, base + IPU4P_CSI2_RX_CONFIG);
> +		writel(0, base + IPU4P_CSI2_RX_ENABLE);
> +
> +		ipu4p_isys_csi_irq_disable(isys, cfg->port);
> +
> +		return 0;
> +	}
> +
> +	if (cfg->nlanes != 1 && cfg->nlanes != 2 && cfg->nlanes != 4)
> +		return -EINVAL;
> +
> +	if (csi2->phy_mode != PHY_MODE_DPHY)
> +		return -EOPNOTSUPP;
> +
> +	if (!timing)
> +		return -EINVAL;
> +
> +	writel(timing->ctermen, base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> +	writel(timing->csettle, base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> +
> +	for (unsigned int lane = 0; lane < cfg->nlanes; lane++) {
> +		writel(timing->dtermen,
> +		       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> +		writel(timing->dsettle,
> +		       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> +	}
> +
> +	value = readl(base + IPU4P_CSI2_RX_CONFIG);
> +	value |= IPU4P_CSI2_RX_CONFIG_DISABLE_BYTE_CLK_GATING |
> +		 IPU4P_CSI2_RX_CONFIG_RELEASE_LP11;

The same bit combination is used twice. Perhaps a helper macro?

> +	writel(value, base + IPU4P_CSI2_RX_CONFIG);
> +
> +	writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
> +	writel(0, base + IPU4P_CSI2_RX_ENABLE);
> +
> +	ipu4p_isys_csi_irq_enable(isys, cfg->port);
> +
> +	writel(IPU4P_CSI2_RX_ENABLE_ENABLE,
> +	       base + IPU4P_CSI2_RX_ENABLE);

One line.

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


