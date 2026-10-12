Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C68456DE9
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793272; cv=none; b=QE42MPVyCxZCEb98nStfO6niiFMTOZKrTCvK6cztnBJaUjZP4dnDQxFawDcc5g4eo6BghdpzCtP4Xlal2iUkcanGjCXEPHdiTVhiJN5GyViDkLX7xo55OVTJEX9vdAt4b81q/jWW1W838WC5CzTUgm4jy6Yu23kDQHkea1iTU3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793272; c=relaxed/simple;
	bh=1r1VXntgDxaY10OhKvueybPsqSAAsQZ3OJsrjWUjsjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQLPbhTDZh1gpDOg5CeFeoG7BnOfIkrvkOPZy5MeoSeiRVLISJ1YQtnXa2tDaMsysTQAXsSmj6Y4Rn5nAZDf2zslHYqHKUyqR5e97zNOmW/Fy1QB6vgD2FUDyEd/CyIs1n3rUADdOKPTR5sISX0fnfzm2RNAuMFn+Ed94hMEs5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8poCUP+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8poCUP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791793269; x=1823329269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1r1VXntgDxaY10OhKvueybPsqSAAsQZ3OJsrjWUjsjs=;
  b=U8poCUP+S/XgipJj+wCKisfOKlA/ZJ+Vao/9jpBqAfCmRhvYf8pzOHK2
   P5h9ghy92QLYt/gZfb4xr+/3le5nC/PFb/0/WmWIcnGGnbhwhtrNarN5l
   jomRdm3W5pB60wlbYP/5+0ntt484k0IX3lgodPrS/kXKFS/PKt/SDiLHG
   ZOQ4ZfvqUi5sCdrAX8O1a2/OHtaI5fnRFSdJqPoYWPcNNOkZu7FhGfCWD
   wsdt/PPk902+xIG2Bc8A7X1Jb23XDbeM8cdQ/LLSA7HY9gdLDE/39XvZC
   qcadOFrWx88iO+xNTXpw5KZF4Her1/pdifYfc4eXsMxvKBgjuVd4HAB+f
   g==;
X-CSE-ConnectionGUID: WO8TsNI2S+62fVpQvaXuyg==
X-CSE-MsgGUID: 7g9ptdViScuY8/jwGv+fqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="394215"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="394215"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 01:21:08 -0700
X-CSE-ConnectionGUID: G2ekDaIxSbWxlylq1cyl7w==
X-CSE-MsgGUID: FF0YDwoRSmKYqaa2CBnFfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1140549"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 01:21:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2F646121B9E;
	Mon, 12 Oct 2026 11:21:08 +0300 (EEST)
Date: Mon, 12 Oct 2026 11:21:08 +0300
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
Message-ID: <asyYdEXPE7F5Wy8k@kekkonen.localdomain>
References: <-QUv20vwP_Fvyx8GMeVsgtsHb5NwrrqqQdutzA6KHdba6DCLA3iNDRYsFUVx-_Ja9j0ak-LPvEIkN63hKhkdr2WvlTYBP5jh38cAyc6tuFU=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <-QUv20vwP_Fvyx8GMeVsgtsHb5NwrrqqQdutzA6KHdba6DCLA3iNDRYsFUVx-_Ja9j0ak-LPvEIkN63hKhkdr2WvlTYBP5jh38cAyc6tuFU=@proton.me>

Hi Ruslan,

Thank you for the set.

On Sun, Oct 11, 2026 at 02:34:16PM +0000, Ruslan Bay wrote:
> IPU4P uses different power FSM controls and frequency divisor
> placement from IPU6, and has a different bootloader status register.
> 
> Add IPU4P-specific power management and firmware authentication handling
> to the IPU6 buttress driver.
> 
> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 48 +++++++++++++++++--
>  .../intel/ipu6/ipu6-platform-buttress-regs.h  | 20 ++++++++
>  .../media/pci/intel/ipu6/ipu6-platform-regs.h |  6 +++
>  drivers/media/pci/intel/ipu6/ipu6.c           | 40 ++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6.h           |  1 +
>  include/media/ipu6-pci-table.h                |  1 +
>  6 files changed, 113 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> index 105de1744dff..ae63a9238771 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> @@ -601,6 +601,43 @@ static int __ipu6_power(struct device *dev,
>  	return ret;
>  }
>  
> +static int __ipu4p_power(struct device *dev,
> +			 const struct ipu6_buttress_ctrl *ctrl, bool on)
> +{
> +	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
> +	u32 pwr_sts, val;
> +	int ret;
> +
> +	if (!on) {
> +		val = 0;
> +		pwr_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
> +	} else {
> +		u32 shift = (ctrl->subsys_id == IPU_ISYS) ?
> +			    IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_SHIFT :
> +			    IPU4P_BUTTRESS_PS_FREQ_CTL_RATIO_SHIFT;
> +
> +		val = BUTTRESS_FREQ_CTL_START |
> +		      (ctrl->ratio << shift) |
> +		      FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK, ctrl->qos_floor);
> +
> +		if (ctrl->subsys_id == IPU_PSYS)
> +			val |= BIT(IPU4P_BUTTRESS_PS_FREQ_CTL_OVRD_SHIFT);
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
> +
>  int ipu6_buttress_power(struct device *dev,
>  			const struct ipu6_buttress_ctrl *ctrl, bool on)
>  {
> @@ -615,6 +652,8 @@ int ipu6_buttress_power(struct device *dev,
>  	if (IS_IPU7(isp))
>  		ret = on ? __ipu7_power_on(dev, ctrl) :
>  			   __ipu7_power_off(dev, ctrl);
> +	else if (IS_IPU4P(isp))
> +		ret = __ipu4p_power(dev, ctrl, on);

Please keep the order, i.e. 4P should be first.

>  	else
>  		ret = __ipu6_power(dev, ctrl, on);
>  
> @@ -824,6 +863,8 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
>  
>  	void __iomem *base = IS_IPU7(isp) ?
>  			     isp->base + IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7 :
> +			     IS_IPU4P(isp) ?
> +			     psys_pdata->base + IPU4P_BOOTLOADER_STATUS_OFFSET :
>  			     psys_pdata->base + BOOTLOADER_STATUS_OFFSET;
>  
>  	ret = readl_poll_timeout(base, data, data == BOOTLOADER_MAGIC_KEY, 500,
> @@ -1089,9 +1130,10 @@ int ipu6_buttress_init(struct ipu6_device *isp)
>  		ipu7_buttress_setup(isp);
>  		b->ref_clk = 384;
>  	} else {
> -		dev_dbg(&isp->pdev->dev, "IPU6 touch 0x%x mask 0x%x\n",
> -			readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
> -			readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
> +		if (!IS_IPU4P(isp))
> +			dev_dbg(&isp->pdev->dev, "IPU6 touch 0x%x mask 0x%x\n",
> +				readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
> +				readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
>  
>  		writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
>  		writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
> index 57e661cc2177..6679a7d35e89 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
> @@ -330,4 +330,24 @@ enum {
>  /* IPU7.5 */
>  #define IPU7_BUTTRESS_SEL_PB_TIMESTAMP		BIT(9)
>  
> +/* IPU4P */
> +#define IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_SHIFT	20
> +#define IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_MASK	GENMASK(24, 20)
> +#define IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_IDLE	0x0
> +#define IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_IS_RDY	0xc
> +
> +#define IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_SHIFT	25
> +#define IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_MASK	GENMASK(29, 25)
> +#define IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_IDLE	0x0
> +#define IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_PS_PWR_UP	0x10
> +
> +#define IPU4P_BUTTRESS_IS_FREQ_CTL_RATIO_SHIFT		1
> +#define IPU4P_BUTTRESS_PS_FREQ_CTL_OVRD_SHIFT		7
> +#define IPU4P_BUTTRESS_PS_FREQ_CTL_RATIO_SHIFT		8
> +
> +#define IPU4P_IS_FREQ_CTL_DIVISOR			4
> +#define IPU4P_PS_FREQ_CTL_DEFAULT_RATIO			0x12
> +
> +#define IPU4P_BOOTLOADER_STATUS_OFFSET			0x8000

Ditto.

> +
>  #endif /* IPU6_PLATFORM_BUTTRESS_REGS_H */
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> index f08e7e8fd87d..526b02309277 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> @@ -16,10 +16,16 @@
>  
>  #define IPU4P_ISYS_IOMMU0_OFFSET		0x000e0000
>  #define IPU4P_ISYS_IOMMU1_OFFSET		0x000e0100
> +#define IPU4P_ISYS_OFFSET			0x00100000
> +#define IPU4P_ISYS_SPC_OFFSET			0x00000000
> +#define IPU4P_ISYS_DMEM_OFFSET			0x00008000
>  
>  #define IPU4P_PSYS_IOMMU0_OFFSET		0x000b0000
>  #define IPU4P_PSYS_IOMMU1_OFFSET		0x000b0100
>  #define IPU4P_PSYS_IOMMU1R_OFFSET		0x000b0600
> +#define IPU4P_PSYS_OFFSET			0x00400000
> +#define IPU4P_PSYS_SPC_OFFSET			0x00000000
> +#define IPU4P_PSYS_DMEM_OFFSET			0x00008000
>  
>  #define IPU4P_MMU_L1_STREAM_ID_REG_OFFSET	0x0c
>  #define IPU4P_MMU_L2_STREAM_ID_REG_OFFSET	0x4c
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index 43d951735f72..789477e3829b 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -140,6 +140,28 @@ static const struct ipu6_buttress_ctrl ipu7_psys_buttress_ctrl = {
>  	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
>  };
>  
> +static const struct ipu6_buttress_ctrl ipu4p_isys_buttress_ctrl = {
> +	.subsys_id = IPU_ISYS,
> +	.ratio = IPU4P_IS_FREQ_CTL_DIVISOR,
> +	.qos_floor = 0,
> +	.freq_ctl = BUTTRESS_REG_IS_FREQ_CTL,
> +	.pwr_sts_shift = IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_SHIFT,
> +	.pwr_sts_mask = IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_MASK,
> +	.pwr_sts_on = IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_IS_RDY,
> +	.pwr_sts_off = IPU4P_BUTTRESS_PWR_STATE_IS_PWR_FSM_IDLE,
> +};
> +
> +static const struct ipu6_buttress_ctrl ipu4p_psys_buttress_ctrl = {
> +	.subsys_id = IPU_PSYS,
> +	.ratio = IPU4P_PS_FREQ_CTL_DEFAULT_RATIO,
> +	.qos_floor = 0,
> +	.freq_ctl = BUTTRESS_REG_PS_FREQ_CTL,
> +	.pwr_sts_shift = IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_SHIFT,
> +	.pwr_sts_mask = IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_MASK,
> +	.pwr_sts_on = IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_PS_PWR_UP,
> +	.pwr_sts_off = IPU4P_BUTTRESS_PWR_STATE_PS_PWR_FSM_IDLE,
> +};
> +
>  static const struct ipu6_buttress_registers ipu6_buttress_regs = {
>  	/* Registers */
>  	.irq_status	= BUTTRESS_REG_ISR_STATUS,
> @@ -375,6 +397,15 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
>  		isys_ipdata.csi2.gpreg = IPU7_IS_IO_CSI2_GPREGS_BASE;
>  		isys_ipdata.csi2.nports = 4;
>  	}
> +
> +	if (IS_IPU4P(isp)) {

Here, too. There are probably other locations as well.

> +		isys_ipdata.hw_variant.offset = IPU4P_ISYS_OFFSET;
> +		isys_ipdata.hw_variant.spc_offset = IPU4P_ISYS_SPC_OFFSET;
> +		isys_ipdata.hw_variant.dmem_offset = IPU4P_ISYS_DMEM_OFFSET;
> +		psys_ipdata.hw_variant.offset = IPU4P_PSYS_OFFSET;
> +		psys_ipdata.hw_variant.spc_offset = IPU4P_PSYS_SPC_OFFSET;
> +		psys_ipdata.hw_variant.dmem_offset = IPU4P_PSYS_DMEM_OFFSET;
> +	}
>  }
>  
>  static struct ipu6_bus_device *
> @@ -631,6 +662,15 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	psys_ctrl = &ipu6_psys_buttress_ctrl;
>  
>  	switch (id->device) {
> +	case PCI_DEVICE_ID_INTEL_IPU4P:
> +		isp->hw_ver = IPU_VERSION_4P;
> +		isp->cpd_fw_name = IPU4P_FIRMWARE_NAME;
> +		isp->cpd_metadata_cmpnt_size =
> +			sizeof(struct ipu6se_cpd_metadata_cmpnt);
> +		isp->buttress.regs = &ipu6_buttress_regs;
> +		isys_ctrl = &ipu4p_isys_buttress_ctrl;
> +		psys_ctrl = &ipu4p_psys_buttress_ctrl;
> +		break;
>  	case PCI_DEVICE_ID_INTEL_IPU6:
>  		isp->hw_ver = IPU_VERSION_6;
>  		isp->cpd_fw_name = IPU6_FIRMWARE_NAME;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
> index 2afbd70cae74..84a50fba1466 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6.h
> @@ -26,6 +26,7 @@ struct ipu6_bus_device;
>  #define IPU6EPADLN_FIRMWARE_NAME	"intel/ipu/ipu6epadln_fw.bin"
>  #define IPU7_FIRMWARE_NAME		"intel/ipu/ipu7_fw.bin"
>  #define IPU7P5_FIRMWARE_NAME		"intel/ipu/ipu7ptl_fw.bin"
> +#define IPU4P_FIRMWARE_NAME		"intel/ipu/ipu4p_fw.bin"

This may sound like a silly question, but where do you obtain this? It's
not part of linux-firmware currently.

>  
>  #define IPU_VERSION_6		BIT(0) /* TGL */
>  #define IPU_VERSION_6SE		BIT(1) /* JSL */
> diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
> index cacb8a3170d0..7369d46621af 100644
> --- a/include/media/ipu6-pci-table.h
> +++ b/include/media/ipu6-pci-table.h
> @@ -16,6 +16,7 @@
>  #define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
>  #define PCI_DEVICE_ID_INTEL_IPU7		0x645d
>  #define PCI_DEVICE_ID_INTEL_IPU7P5		0xb05d
> +#define PCI_DEVICE_ID_INTEL_IPU4P		0x8a19
>  
>  static const struct pci_device_id ipu6_pci_tbl[] = {
>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },

-- 
Kind regards,

Sakari Ailus
