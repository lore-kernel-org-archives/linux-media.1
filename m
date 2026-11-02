Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657148;
	b=T6Je2TBVOTx0KVngOfUqfNAFGPqNh//p7FfUsW9dZ1tfUcI79e5m9O+DqFQlddlyld89
	 feR0C65Vax6m+XJfJ/EIyJ5KPwng7vDwopOVii912RE2FsFTJV9I2TiOz6h1nFnuX9V2L
	 +BcBJ/UVnVW9Jf1aPGidC2gbcu5dYjApskdKJ6N8CV1NH7a1nNnXZu5eTPzA9j0fWIh/L
	 JkUIEc94PT3Tpuqse53nSMvvecY/XaKUXQt+OKcU8adCLnx/382wuuzCGembwf8xFH6de
	 gheHdCqVP02j1sylPjfqeUA7ByqjWOC/6lH+t7VxBzbelGmYGk/mkLeR3H+qfJmuSow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657148;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qsi4uY1AtKKhDU8twBREcKjA8+71fHyEOgzbQMVjcB8=;
	b=L1qz3NRE7DiBoQsLwDWDjCD6AxbmLKpGQtgPJrjH5rGpvckWJm4Gvu8AuIWCVb77/Hom
	 GGkm/Jmft0Yd2dxHPwkNgxWAmOiAvePdQwvh+nPSDuf838I3S0kENTe7BNWXRMI6qzNfN
	 Z7SRODZ+e1REa7Qil6lBRM+nxzOjB3+RRPsMS9IICsJq5psi2lsKG4/HWRAJy0lmhdm1M
	 cRSFEji2FlF6YgM1Y7PREb/ivYIUauzzoGDFcqiBSuBa+HE6mEYDDTnZRoJSZ6kI5Thwc
	 AJdJmJ01zWOHxVdzxNUOT/s4zM8KKlcEeSZ787B78pHSPU6umevV8Q+7m+CMnbDNyeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mrVQ6jX2;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E119C606A32C
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 22:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E119C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mrVQ6jX2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793657147; x=1825193147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AfF+tE8MSNm3cMZofJrKMB0E5A+DMfdYZKR3t3FI8Eo=;
  b=mrVQ6jX2eYei3IgfL3OytT3gle9IZvvSLzCqrrPZeMpsD/I3J9Zojt2N
   AkY1bbIaNb+zJjhCe3HpEIj9nf9rrxe4T66lEYKKp21grArdV/9EmW8MM
   W4qhDUwZ4mQ7KHgY/ROszIWxnVGFm3FEPp/2mbLg4Wu6ZQwqhWLtrHqF+
   Hat7fBMfT2Yx5fIRcgNIMW9KcKgjIE9HmYXpoz/m9xmRWJT1xhM+y20B+
   rpKYHj7uB6TcYLvhtC78P1P4AiPOCFY/DwQVMtk+zrv1PhtcQMZdeH4p/
   OxJPlTg/mwyoDtfFqcJF0Fo0G+MrY1nIDZw28sXVQVjYDTpaMlKy8ANbQ
   A==;
X-CSE-ConnectionGUID: q8FpmeNfRManIHMTQcNNKg==
X-CSE-MsgGUID: xDibu+74RF6dVK8rAvjsYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2380940"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2380940"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:05:47 -0800
X-CSE-ConnectionGUID: KXgl63nbSkSZ+EQv34+Mug==
X-CSE-MsgGUID: xzTXHG2oS9e6p4pmeu6jnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6622437"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:05:43 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1C9AF1202C4;
	Tue, 03 Nov 2026 00:05:52 +0200 (EET)
Date: Tue, 3 Nov 2026 00:05:52 +0200
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
Subject: Re: [RFC PATCH v2 09/12] media: ipu6: Add IPU4P ISYS ISR handling
Message-ID: <aukJQObOf4bqkhJn@kekkonen.localdomain>
References: <jOEzBw2ECU9AA_KzYm_zUSZQxW7zz8tdnehLqJjbfgdIUcEzq887D0k-YktMFFcVrXH54foWpSzUPcjmK1nSbSDN03m_8wUh_xTBrhNXJ4w=@proton.me>
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
In-Reply-To: <jOEzBw2ECU9AA_KzYm_zUSZQxW7zz8tdnehLqJjbfgdIUcEzq887D0k-YktMFFcVrXH54foWpSzUPcjmK1nSbSDN03m_8wUh_xTBrhNXJ4w=@proton.me>

Hi Ruslan,

On Sat, Oct 31, 2026 at 12:37:06PM +0000, Ruslan Bay wrote:
> Handle IPU4P ISYS software and CSI interrupts, dispatch firmware
> responses, and report CSI receiver errors through the common ISYS code.
> 
> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c  | 116 ++++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h  |   1 +
>  .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     |  43 +++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  74 +++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   2 +
>  drivers/media/pci/intel/ipu6/ipu6-isys.c      |  14 ++-
>  drivers/media/pci/intel/ipu6/ipu6-isys.h      |   3 +
>  drivers/media/pci/intel/ipu6/ipu6.c           |   1 +
>  8 files changed, 252 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
> index 2c0b08ecaf8..b82053f1545 100644
> --- a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
> @@ -14,6 +14,7 @@
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/minmax.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
> @@ -25,6 +26,7 @@
>  #include "ipu6-isys-queue.h"
>  #include "ipu6-isys-subdev.h"
>  #include "ipu4p-fw-isys.h"
> +#include "ipu4p-isys-csi2-regs.h"
>  #include "ipu6-platform-regs.h"
>  
>  static const char send_msg_types[N_IPU4P_FW_ISYS_SEND_TYPE][32] = {
> @@ -878,3 +880,117 @@ const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops = {
>  	.dump_stream_cfg = ipu4p_fw_isys_dump_stream_cfg,
>  	.dump_frame_buf_set = ipu4p_fw_isys_dump_frame_buf_set,
>  };
> +
> +void ipu4p_isys_irq_setup(struct ipu6_isys *isys)
> +{
> +	static const struct {
> +		u32 base;
> +		u32 mask;
> +	} irq_config[] = {
> +		{ IPU4P_ISYS_UNISPART_IRQ_EDGE,
> +		  IPU4P_ISYS_UNISPART_IRQ_SW |
> +		  IPU4P_ISYS_UNISPART_IRQ_CSI2(0) |
> +		  IPU4P_ISYS_UNISPART_IRQ_CSI2(1) },
> +		{ IPU4P_ISYS_ISA_ACC_IRQ_CTRL_BASE, 0 },
> +		{ IPU4P_ISYS_A_IRQ_CTRL_BASE, 0 },
> +		{ IPU4P_ISYS_SIP0_IRQ_CTRL_BASE, IPU4P_ISYS_SIP0_CSI2_IRQ },
> +		{ IPU4P_ISYS_SIP1_IRQ_CTRL_BASE, IPU4P_ISYS_SIP1_CSI2_IRQ_MASK },
> +	};
> +	void __iomem *base = isys->pdata->base;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(irq_config); i++) {
> +		const u32 irq_base = irq_config[i].base;
> +
> +		writel(0, base + irq_base + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
> +		writel(0, base + irq_base + IPU4P_ISYS_IRQ_MASK_OFFSET);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(irq_config); i++) {
> +		const u32 irq_base = irq_config[i].base;
> +		const u32 mask = irq_config[i].mask;
> +
> +		writel(mask, base + irq_base);
> +		writel(mask, base + irq_base +
> +		       IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET);
> +		writel(0xffffffff,
> +		       base + irq_base + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
> +	}
> +
> +	writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_REG);
> +	writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_MUX_REG);
> +
> +	/* Keep the top-level source disabled until its child controllers are ready. */
> +	for (i = ARRAY_SIZE(irq_config); i > 0; i--) {
> +		const u32 irq_base = irq_config[i - 1].base;
> +		const u32 mask = irq_config[i - 1].mask;
> +
> +		writel(mask, base + irq_base + IPU4P_ISYS_IRQ_MASK_OFFSET);
> +		writel(mask, base + irq_base + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
> +	}
> +}
> +
> +irqreturn_t ipu4p_isys_isr(struct ipu6_bus_device *adev)
> +{
> +	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
> +	void __iomem *base = isys->pdata->base;
> +	u32 status, sip0_status, sip1_status;
> +	int pm_status;
> +	irqreturn_t ret = IRQ_HANDLED;
> +
> +	pm_status = pm_runtime_get_if_active(&adev->auxdev.dev);
> +	if (!pm_status)
> +		return IRQ_NONE;
> +
> +	status = readl(base + IPU4P_ISYS_UNISPART_IRQ_STATUS);
> +	sip0_status = readl(base + IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS);
> +	sip1_status = readl(base + IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS);
> +
> +	if (!(status & (isys->isr_csi2_bits | IPU4P_ISYS_UNISPART_IRQ_SW)) &&
> +	    !(sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ) &&
> +	    !(sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ_MASK)) {
> +		ret = IRQ_NONE;
> +		goto out;
> +	}
> +
> +	do {
> +		writel(status & (isys->isr_csi2_bits |
> +				IPU4P_ISYS_UNISPART_IRQ_SW),
> +		       base + IPU4P_ISYS_UNISPART_IRQ_CLEAR);
> +		writel(sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ,
> +		       base + IPU4P_ISYS_SIP0_IRQ_CTRL_CLEAR);
> +		writel(sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ_MASK,
> +		       base + IPU4P_ISYS_SIP1_IRQ_CTRL_CLEAR);
> +
> +		for (unsigned int i = 0;
> +		     i < isys->pdata->ipdata->csi2.nports; i++) {
> +			bool port_irq = i ?
> +				(sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ(i)) :
> +				(sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ);
> +
> +			if (port_irq && isys->csi2[i].base)
> +				ipu4p_isys_csi2_isr(&isys->csi2[i]);
> +		}
> +
> +		writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_REG);
> +
> +		if ((status & IPU4P_ISYS_UNISPART_IRQ_SW) &&
> +		    !adev->auxdrv_data->fw_ops->isr_one(adev))
> +			status = IPU4P_ISYS_UNISPART_IRQ_SW;
> +		else
> +			status = 0;
> +
> +		status |= readl(base + IPU4P_ISYS_UNISPART_IRQ_STATUS);
> +		sip0_status = readl(base + IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS);
> +		sip1_status = readl(base + IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS);
> +	} while ((status & (isys->isr_csi2_bits |
> +			    IPU4P_ISYS_UNISPART_IRQ_SW)) ||
> +		 (sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ) ||
> +		 (sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ_MASK));
> +
> +out:
> +	if (pm_status > 0)
> +		pm_runtime_put(&adev->auxdev.dev);
> +
> +	return ret;
> +}
> diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
> index 15a5dc7c938..416a877a1c8 100644
> --- a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
> +++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  #define IPU4P_ISYS_MAX_STREAMS			8U
> +#define IPU4P_ISYS_CSI2_NPORTS			8U
>  #define IPU4P_MAX_IPINS				4U
>  #define IPU4P_MAX_OPINS				6U
>  #define IPU4P_NOF_SRAM_BLOCKS_MAX		8U
> diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> index 7f41bdb4150..4e2f31048ff 100644
> --- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> +++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> @@ -3,6 +3,49 @@
>  #define IPU4P_ISYS_CSI2_REGS_H
>  
>  #include <linux/bits.h>
> +#include <linux/types.h>
> +
> +/* ISYS UNISPART and SIP interrupt registers */
> +#define IPU4P_ISYS_UNISPART_IRQ_EDGE			0x7c000
> +#define IPU4P_ISYS_UNISPART_IRQ_STATUS			0x7c008
> +#define IPU4P_ISYS_UNISPART_IRQ_CLEAR			0x7c00c
> +#define IPU4P_ISYS_UNISPART_SW_IRQ_REG			0x7c414
> +#define IPU4P_ISYS_UNISPART_SW_IRQ_MUX_REG		0x7c418
> +#define IPU4P_ISYS_UNISPART_IRQ_SW			BIT(22)
> +#define IPU4P_ISYS_UNISPART_IRQ_CSI2(port)		((port) ? BIT(4) : BIT(3))
> +#define IPU4P_ISYS_ISA_ACC_IRQ_CTRL_BASE		0xb0c00
> +#define IPU4P_ISYS_A_IRQ_CTRL_BASE			0xbe200
> +#define IPU4P_ISYS_SIP0_IRQ_CTRL_BASE			0x66d00
> +#define IPU4P_ISYS_SIP1_IRQ_CTRL_BASE			0x6ed00
> +#define IPU4P_ISYS_IRQ_MASK_OFFSET			0x04
> +#define IPU4P_ISYS_IRQ_CLEAR_OFFSET			0x0c
> +#define IPU4P_ISYS_IRQ_ENABLE_OFFSET			0x10
> +#define IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET		0x14
> +#define IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS			0x66d08
> +#define IPU4P_ISYS_SIP0_IRQ_CTRL_CLEAR			0x66d0c
> +#define IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS			0x6ed08
> +#define IPU4P_ISYS_SIP1_IRQ_CTRL_CLEAR			0x6ed0c
> +#define IPU4P_ISYS_SIP0_CSI2_IRQ			BIT(3)
> +#define IPU4P_ISYS_SIP1_CSI2_IRQ(port)			BIT((port) - 1)
> +#define IPU4P_ISYS_SIP1_CSI2_IRQ_MASK			GENMASK(6, 0)
> +
> +/* ISYS per-port CSI interrupt controls */
> +static inline u32 ipu4p_isys_csi_irq_ctrl_base(unsigned int port)
> +{
> +	return port ? (0x6cb00 + 0x800 * (port - 1)) : 0x66300;
> +}
> +
> +static inline u32 ipu4p_isys_csi_irq_ctrl0_base(unsigned int port)
> +{
> +	return port ? (0x6cc00 + 0x800 * (port - 1)) : 0x66400;
> +}
> +
> +#define IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET		0x08
> +#define IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET		0x0c
> +#define IPU4P_ISYS_CSI_IRQ_ACTIVE			BIT(0)
> +/* CSI-2 frame events occupy bits 16-31 in the shared ctrl0 status. */
> +#define IPU4P_ISYS_CSI_ERROR_MASK			GENMASK(15, 0)
> +#define IPU4P_ISYS_CSI_ERROR_BITS			16U
>  
>  /* CSI receiver registers */
>  #define IPU4P_CSI2_RX_ENABLE				0x00
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index ea21ce9b814..b78e4b6af26 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -26,6 +26,7 @@
>  #include "ipu6-bus.h"
>  #include "ipu6-isys.h"
>  #include "ipu6-isys-csi2.h"
> +#include "ipu4p-isys-csi2-regs.h"
>  #include "ipu6-isys-subdev.h"
>  #include "ipu6-isys-video.h"
>  #include "ipu6-platform-isys-csi2-reg.h"
> @@ -87,6 +88,25 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
>  	{ "HSIDLE detected", false }
>  };
>  
> +static const struct ipu6_csi2_error ipu4p_csi2_errors[] = {
> +	{ "Single packet header error corrected", true },
> +	{ "Multiple packet header errors detected", true },
> +	{ "Payload checksum (CRC) error", true },
> +	{ "FIFO overflow", false },
> +	{ "Reserved short packet data type detected", true },
> +	{ "Reserved long packet data type detected", true },
> +	{ "Incomplete long packet detected", false },
> +	{ "Frame sync error", false },
> +	{ "Line sync error", false },
> +	{ "DPHY recoverable synchronization error", true },
> +	{ "DPHY non-recoverable synchronization error", false },
> +	{ "Escape mode error", true },
> +	{ "Escape mode trigger event", true },
> +	{ "Escape mode ultra-low power state for data lane(s)", true },
> +	{ "Escape mode ultra-low power state exit for clock lane", true },
> +	{ "Inter-frame short packet discarded", true },
> +};
> +
>  s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
>  {
>  	struct media_pad *src_pad;
> @@ -214,6 +234,39 @@ void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2)
>  	csi2->receiver_errors |= irq & mask;
>  }
>  
> +void ipu4p_isys_register_errors(struct ipu6_isys_csi2 *csi2)
> +{
> +	void __iomem *base = csi2->isys->pdata->base;
> +	u32 offset = ipu4p_isys_csi_irq_ctrl0_base(csi2->port);
> +	u32 status;
> +
> +	status = readl(base + offset + IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET);
> +	writel(status, base + offset + IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET);
> +	csi2->receiver_errors |= status & IPU4P_ISYS_CSI_ERROR_MASK;
> +}
> +
> +void ipu4p_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
> +{
> +	void __iomem *base = csi2->isys->pdata->base;
> +	u32 offset = ipu4p_isys_csi_irq_ctrl_base(csi2->port);
> +	u32 status;
> +
> +	status = readl(base + offset + IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET);
> +	writel(status, base + offset + IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET);
> +	if (!(status & IPU4P_ISYS_CSI_IRQ_ACTIVE))
> +		return;
> +
> +	/*
> +	 * Frame SOF/EOF notifications are delivered by IPU4P firmware.
> +	 * Do not also report the CSI frame-event interrupts here, as that
> +	 * would account every frame twice and corrupt vb2 sequence numbers.
> +	 *
> +	 * Keep the CSI IRQ path for receiver error collection; errors are
> +	 * consumed by ipu6_isys_csi2_error() when a firmware response arrives.
> +	 */
> +	ipu4p_isys_register_errors(csi2);
> +}
> +
>  void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
>  {
>  	struct device *dev = &csi2->isys->adev->auxdev.dev;
> @@ -221,6 +274,27 @@ void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
>  	u32 status;
>  	u32 i;
>  
> +	if (IS_IPU4P(csi2->isys->adev->isp)) {
> +		ipu4p_isys_register_errors(csi2);
> +		status = csi2->receiver_errors;
> +		csi2->receiver_errors = 0;
> +
> +		for (i = 0; i < IPU4P_ISYS_CSI_ERROR_BITS; i++) {
> +			if (!(status & BIT(i)))
> +				continue;
> +
> +			if (ipu4p_csi2_errors[i].is_info_only)
> +				dev_dbg(dev, "csi2-%i info: %s\n", csi2->port,
> +					ipu4p_csi2_errors[i].error_string);
> +			else
> +				dev_err_ratelimited(dev, "csi2-%i error: %s\n",
> +						    csi2->port,
> +						    ipu4p_csi2_errors[i].error_string);
> +		}
> +
> +		return;
> +	}
> +
>  	/* register errors once more in case of interrupts are disabled */
>  	ipu6_isys_register_errors(csi2);
>  	status = csi2->receiver_errors;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> index 1620ac16f90..76c5d2cbbf9 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> @@ -84,5 +84,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream);
>  void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream);
>  void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2);
>  void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2);
> +void ipu4p_isys_register_errors(struct ipu6_isys_csi2 *csi2);
> +void ipu4p_isys_csi2_isr(struct ipu6_isys_csi2 *csi2);
>  
>  #endif /* IPU6_ISYS_CSI2_H */
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index 037eb0a52d4..12320ea2f49 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -41,6 +41,7 @@
>  #include "ipu6-platform-buttress-regs.h"
>  #include "ipu6-platform-isys-csi2-reg.h"
>  #include "ipu6-platform-regs.h"
> +#include "ipu4p-isys-csi2-regs.h"
>  #include "ipu7-isys-csi-phy.h"
>  #include "ipu7-isys-csi2-regs.h"
>  #include "ipu7-platform-regs.h"
> @@ -201,6 +202,10 @@ static void isys_csi2_unregister_subdevices(struct ipu6_isys *isys)
>  
>  static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
>  {
> +	static const u32 ipu4p_port_offsets[IPU4P_ISYS_CSI2_NPORTS] = {
> +		0x64300, 0x6c000, 0x6c100, 0x6c200,
> +		0x6c300, 0x6c400, 0x6c500, 0x6c600,

The rest of the offsets are in the header, I think it'd be good if these
were, too.

> +	};
>  	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =
>  		&isys->pdata->ipdata->csi2;
>  	unsigned int i;
> @@ -216,6 +221,9 @@ static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
>  
>  			isys->isr_csi2_bits |= mask;
>  			isys->csi2[i].legacy_irq_mask = mask;
> +		} else if (IS_IPU4P(isys->adev->isp)) {
> +			base += ipu4p_port_offsets[i];
> +			isys->isr_csi2_bits |= IPU4P_ISYS_UNISPART_IRQ_CSI2(i);
>  		} else {
>  			base += CSI_REG_PORT_BASE(i);
>  			isys->isr_csi2_bits |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
> @@ -823,7 +831,9 @@ static int isys_runtime_pm_resume(struct device *dev)
>  
>  	if (IS_IPU7(isp) || IS_IPU8(isp))
>  		ipu7_isys_setup_hw(isys);
> -	else if (!IS_IPU4P(isp))
> +	else if (IS_IPU4P(isp))
> +		ipu4p_isys_irq_setup(isys);
> +	else
>  		ipu6_isys_setup_hw(isys);
>  
>  	if (!IS_IPU7(isp) && !IS_IPU8(isp))
> @@ -1127,7 +1137,7 @@ static void isys_remove(struct auxiliary_device *auxdev)
>  }
>  
>  static const struct ipu6_auxdrv_data ipu4p_isys_auxdrv_data = {
> -	.isr = NULL,
> +	.isr = ipu4p_isys_isr,
>  	.isr_threaded = NULL,
>  	.wake_isr_thread = false,
>  	.fw_ops = &ipu4p_fw_isys_ops,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> index 9f521fefef4..c15de43dccc 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> @@ -247,4 +247,7 @@ int ipu6_isys_jsl_phy_set_power(struct ipu6_isys *isys,
>  				struct ipu6_isys_csi2_config *cfg,
>  				const struct ipu6_isys_csi2_timing *timing,
>  				bool on);
> +void ipu4p_isys_irq_setup(struct ipu6_isys *isys);
> +irqreturn_t ipu4p_isys_isr(struct ipu6_bus_device *adev);
> +
>  #endif /* IPU6_ISYS_H */
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index 10827ababfd..2e79b4a0078 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -370,6 +370,7 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
>  	isys_ipdata.csi2.fw_access_port_ofs = CSI_REG_HUB_FW_ACCESS_PORT_OFS;
>  
>  	if (IS_IPU4P(isp)) {
> +		isys_ipdata.csi2.nports = IPU4P_ISYS_CSI2_NPORTS;
>  		isys_ipdata.num_parallel_streams = IPU4P_ISYS_MAX_STREAMS;
>  		isys_ipdata.max_streams = IPU4P_ISYS_MAX_STREAMS;
>  		isys_ipdata.sram_gran_shift = IPU4P_SRAM_GRANULARITY_SHIFT;
> -- 
> 2.56.0
> 
> 

-- 
Sakari Ailus
