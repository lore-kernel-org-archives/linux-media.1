Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18973BCD3A
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144942; cv=none; b=LMh146EeFWRxh55vAgJXVFWObcamVL0RiVsXXdKD2klFSFVF3IoceWrZmtJX5+3QciypISjpMC11X3MrUzdVpJQc4uIs0i9K+ZyqyPc9rgE91YyevqD6nm7gLw4MT02geV8YZHAsVApS8dTZcHovA8LWC7lY75X5I4AuNeHAtGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144942; c=relaxed/simple;
	bh=Mnh9EX1MPi02/aqRn+2FG1DdIwep7oFaGFX3ZF/xyBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3FS3ALifYd+j6jVLk0CzNeK8sUmarRIsiQgaPfvEj1nKAWuHmOHC62qFu/Ep1cqHyf5L1vQ8TgvIxvunAmANJwlNRtRliNOoHnmdOs8SJdbKZ4uywqk6qMdzOgG5vz95wLXGjoxGSlJVdwm+v4sB6E81/Zd09DSVzlt93x0gEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVCSjEfw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVCSjEfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792144941; x=1823680941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mnh9EX1MPi02/aqRn+2FG1DdIwep7oFaGFX3ZF/xyBc=;
  b=RVCSjEfw+SnfQnXjc+VHARuTLshyZvZuSnpSuortXH6XBCrmm2eMPPMT
   9bcFFJ9SdnfCmlXAeb1XwDoXWBDS079fqCGgf4SHTA9vthGZ+j9Ge2HGc
   D6swZLDW+JP/ypdOopN2deVWfBlp2j6gLuThUJT4pjFwQYjWWZj0XW4eC
   1o+KHYnYfOjseO+j+Zt/xPJ8RoJEfqU6U+gceVb4YN6SZktBsrlX3VRoY
   rIuiDn0p1l8VTt/1mofKL2Hrf7Otgd5tchiL2AQQ3LmDhUhclpjeDEhwe
   cpO5JJk/mHTV/nwsVH0aYHDd+hacPuXaHO7p6ZVPJNUo/Q2WmQfsDJN88
   g==;
X-CSE-ConnectionGUID: H0VGD+XIQVe4K1IPEgHj2g==
X-CSE-MsgGUID: keqYLwmaQomvJqwno/Vaqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="807830"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="807830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:02:20 -0700
X-CSE-ConnectionGUID: 2f6mb2MiSr27fg0ZlkmZTw==
X-CSE-MsgGUID: s90MctrzTkOwuFtZAPLhHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2395559"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.49])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:02:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3B3B2121BCC;
	Fri, 16 Oct 2026 13:02:22 +0300 (EEST)
Date: Fri, 16 Oct 2026 13:02:22 +0300
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
Subject: Re: [RFC PATCH 03/12] media: ipu6: Add IPU4P buttress support
Message-ID: <atH2LqXVEtmZI5_c@kekkonen.localdomain>
References: <-QUv20vwP_Fvyx8GMeVsgtsHb5NwrrqqQdutzA6KHdba6DCLA3iNDRYsFUVx-_Ja9j0ak-LPvEIkN63hKhkdr2WvlTYBP5jh38cAyc6tuFU=@proton.me>
 <asyYdEXPE7F5Wy8k@kekkonen.localdomain>
 <mGk1vEGdr5XvRZa1yzgTN831cR2a9_UdQs7oMQBBfWPBBg-fcdffI3Xdgcf_qXgrqxvNBn_hCawbXtOTMTwoqdoodbp3jmE1QMgH4kMZ4mk=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mGk1vEGdr5XvRZa1yzgTN831cR2a9_UdQs7oMQBBfWPBBg-fcdffI3Xdgcf_qXgrqxvNBn_hCawbXtOTMTwoqdoodbp3jmE1QMgH4kMZ4mk=@proton.me>

Hi Ruslan,

On Tue, Oct 13, 2026 at 06:29:18PM +0000, Ruslan Bay wrote:
> Hi Sakari,
> 
> Thank you for looking into this.
> 
> On Monday, October 12th, 2026 at 10:21 AM, sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com> wrote:
> 
> > Hi Ruslan,
> >
> > Thank you for the set.
> >
> > On Sun, Oct 11, 2026 at 02:34:16PM +0000, Ruslan Bay wrote:
> > > IPU4P uses different power FSM controls and frequency divisor
> > > placement from IPU6, and has a different bootloader status register.
> > >
> > > Add IPU4P-specific power management and firmware authentication handling
> > > to the IPU6 buttress driver.
> > >
> > > Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> > > ---
> > >  drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 48 +++++++++++++++++--
> > >  .../intel/ipu6/ipu6-platform-buttress-regs.h  | 20 ++++++++
> > >  .../media/pci/intel/ipu6/ipu6-platform-regs.h |  6 +++
> > >  drivers/media/pci/intel/ipu6/ipu6.c           | 40 ++++++++++++++++
> > >  drivers/media/pci/intel/ipu6/ipu6.h           |  1 +
> > >  include/media/ipu6-pci-table.h                |  1 +
> > >  6 files changed, 113 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > index 105de1744dff..ae63a9238771 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > @@ -601,6 +601,43 @@ static int __ipu6_power(struct device *dev,
> > >  	return ret;
> > >  }
> > >
> > > +static int __ipu4p_power(struct device *dev,
> > > +			 const struct ipu6_buttress_ctrl *ctrl, bool on)
> > > +{
> > > +	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
> > > +	u32 pwr_sts, val;
> > > +	int ret;
> > > +
> > > +	if (!on) {
> > > +		val = 0;
> > > +		pwr_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
> > > +	} else {
> > > +		u32 shift = (ctrl->subsys_id == IPU_ISYS) ?
> > > +			    IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_SHIFT :
> > > +			    IPU4P_BUTTRESS_PS_FREQ_CTL_RATIO_SHIFT;
> > > +
> > > +		val = BUTTRESS_FREQ_CTL_START |
> > > +		      (ctrl->ratio << shift) |
> > > +		      FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK, ctrl->qos_floor);
> > > +
> > > +		if (ctrl->subsys_id == IPU_PSYS)
> > > +			val |= BIT(IPU4P_BUTTRESS_PS_FREQ_CTL_OVRD_SHIFT);
> > > +
> > > +		pwr_sts = ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
> > > +	}
> > > +
> > > +	writel(val, isp->base + ctrl->freq_ctl);
> > > +
> > > +	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
> > > +				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
> > > +				 100, BUTTRESS_POWER_TIMEOUT_US);
> > > +	if (ret)
> > > +		dev_err(&isp->pdev->dev,
> > > +			"Change power status timeout with 0x%x\n", val);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  int ipu6_buttress_power(struct device *dev,
> > >  			const struct ipu6_buttress_ctrl *ctrl, bool on)
> > >  {
> > > @@ -615,6 +652,8 @@ int ipu6_buttress_power(struct device *dev,
> > >  	if (IS_IPU7(isp))
> > >  		ret = on ? __ipu7_power_on(dev, ctrl) :
> > >  			   __ipu7_power_off(dev, ctrl);
> > > +	else if (IS_IPU4P(isp))
> > > +		ret = __ipu4p_power(dev, ctrl, on);
> >
> > Please keep the order, i.e. 4P should be first.
> 
> Will do! It feels a little awkward to put IPU4P_ before the
> generic IPU6_ definitions, though. I know I've asked before, but
> is there any plan to use IPU_ instead of IPU6_ for code shared
> across IPU generations?

Good question. This has come up multiple times.

In fact this driver originally was written as a driver for IPU4 and through
a number of turns was upstreamed with IPU6 support only. IPU4P is a bit
newer than the IPU4. Unfortunately, IPU6 is used by the driver as a generic
prefix and in some cases the definitions could apply to a wider selection
of IPUs than just 6 but still if not all, so naming is probably bound to be
imperfect in any case. I'm not sure the naming matters much, as long as the
code does the right thing.

If we are to rename things, I think the non-IPU version specific code could
have ipu_ prefix, but globally visible symbols should then use intel_ipu_
prefix to avoid symbol name clashes. Still, anything with firmware or
hardware register dependencies should use IPU version specific prefix.
Probably there wouldn't be any such generic register definitions with IPU
4P and 8 supported, they're so far apart.

I wonder what others think.

There are quite a few places in the driver where IPU versions are checked
and I wonder if moving these behind an ops struct would make sense. Maybe
we could get back to this once the IPU4P support is merged.

I'd postpone renaming after this set in any case.

> > > +		isys_ipdata.hw_variant.offset = IPU4P_ISYS_OFFSET;
> > > +		isys_ipdata.hw_variant.spc_offset = IPU4P_ISYS_SPC_OFFSET;
> > > +		isys_ipdata.hw_variant.dmem_offset = IPU4P_ISYS_DMEM_OFFSET;
> > > +		psys_ipdata.hw_variant.offset = IPU4P_PSYS_OFFSET;
> > > +		psys_ipdata.hw_variant.spc_offset = IPU4P_PSYS_SPC_OFFSET;
> > > +		psys_ipdata.hw_variant.dmem_offset = IPU4P_PSYS_DMEM_OFFSET;
> > > +	}
> > >  }
> > >
> > >  static struct ipu6_bus_device *
> > > @@ -631,6 +662,15 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >  	psys_ctrl = &ipu6_psys_buttress_ctrl;
> > >
> > >  	switch (id->device) {
> > > +	case PCI_DEVICE_ID_INTEL_IPU4P:
> > > +		isp->hw_ver = IPU_VERSION_4P;
> > > +		isp->cpd_fw_name = IPU4P_FIRMWARE_NAME;
> > > +		isp->cpd_metadata_cmpnt_size =
> > > +			sizeof(struct ipu6se_cpd_metadata_cmpnt);
> > > +		isp->buttress.regs = &ipu6_buttress_regs;
> > > +		isys_ctrl = &ipu4p_isys_buttress_ctrl;
> > > +		psys_ctrl = &ipu4p_psys_buttress_ctrl;
> > > +		break;
> > >  	case PCI_DEVICE_ID_INTEL_IPU6:
> > >  		isp->hw_ver = IPU_VERSION_6;
> > >  		isp->cpd_fw_name = IPU6_FIRMWARE_NAME;
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
> > > index 2afbd70cae74..84a50fba1466 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6.h
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6.h
> > > @@ -26,6 +26,7 @@ struct ipu6_bus_device;
> > >  #define IPU6EPADLN_FIRMWARE_NAME	"intel/ipu/ipu6epadln_fw.bin"
> > >  #define IPU7_FIRMWARE_NAME		"intel/ipu/ipu7_fw.bin"
> > >  #define IPU7P5_FIRMWARE_NAME		"intel/ipu/ipu7ptl_fw.bin"
> > > +#define IPU4P_FIRMWARE_NAME		"intel/ipu/ipu4p_fw.bin"
> >
> > This may sound like a silly question, but where do you obtain this? It's
> > not part of linux-firmware currently.
> 
> I forgot to mention this in the description. The IPU4P firmware
> binary was extracted from a Windows driver package available in
> the Microsoft Update Catalog:
> https://www.catalog.update.microsoft.com/Search.aspx?q=42.18362.3.16827

I'll figure out whether we could get this to linux-firmware.

-- 
Kind regards,

Sakari Ailus
