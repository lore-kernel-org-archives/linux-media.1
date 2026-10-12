Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370993EEAD7
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800951; cv=none; b=TZh9MXR5sdkci+9ka1kQdGmfj7z5GdhIggEmzbbRjk+KcY63vxz8iD3YL8A1ma8h8fTaoBO9dpYHdBeGOqYFGBQvuI7HBQUW0TN13Qf/iwTQoDXvLmhdqyyv9qOVEqN6V7c6qX47OOi014sktftKbERy9wa+gnkD/oM/kqunJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800951; c=relaxed/simple;
	bh=KlDi19p/kte59rEEhKK5kqg2VwXGzrc9Z3sqqwQqYys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gat8iInBbXHhFYIjmKkD/B7qpa9uZreXH0DyjRi0tJvxBPc0v0fgf72vHSTpjwMr4g8KwXMw/gm4OSDORIzfKix65We+16ra5KwqPH4xiDvKuRbEA2RxbVANMarAJ7PZGS9gquFpaYd6WWW9Toq5fEsB+2mc3sRTfEAaAagTdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpNaA+GP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpNaA+GP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791800941; x=1823336941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KlDi19p/kte59rEEhKK5kqg2VwXGzrc9Z3sqqwQqYys=;
  b=HpNaA+GPATquIvrr8M7kMwvbxJWtkAWzUxZ6NZKIAqx4uphIh4PkbLJK
   1wP5vGJQ2q0OBSxEshC2PmzPkzYeiWnPrjEAUpE+TgJghIMeYqYl4Gz7b
   qoD1kdPLpNSMiC2ayzYd5txw6qvUdKa9dzQFOwe37Y5S2cIyFIJefLxom
   H69Ke3ka3q3NfShDfc4bnAoSEXC8cjR+6b0gpPwKzDzof9vamz0yjBUNY
   wwpv/wGT6AgRRH77a2rZWbd5aPGdUdDkPARv5etVS06KLBOjz9BgnQKSe
   mUKgZqPZ3GsgjVLfXVPa7fMZJzJyUrceevbdIWaI1U136+/G/aREkZJ1p
   Q==;
X-CSE-ConnectionGUID: 7Y/hx7DkTbyWYCKutl6ONA==
X-CSE-MsgGUID: OuDK8ariQB22BOYnxvY9/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="514996"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="514996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:28:48 -0700
X-CSE-ConnectionGUID: JGhCnsKPTB+lXuOMAU/GJA==
X-CSE-MsgGUID: CPB/Oa1mR5ywX8+CgZtU9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="779194"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:28:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D0AC6121B9E;
	Mon, 12 Oct 2026 13:28:47 +0300 (EEST)
Date: Mon, 12 Oct 2026 13:28:47 +0300
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
Subject: Re: [RFC PATCH 09/12] media: ipu6: Add IPU4P ISYS ISR handling
Message-ID: <asy2X7Xz8uMTbXrn@kekkonen.localdomain>
References: <IjwPOnBdNsWTsYf7NDlmfUuA5tZHup4NghQDillGZMDTGjBqLo-kW3mUX-FSA71Gh_ZxtpS9hiyzBMGt3lqRWKsAn7ecN6zMmvSOTGqJpsA=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IjwPOnBdNsWTsYf7NDlmfUuA5tZHup4NghQDillGZMDTGjBqLo-kW3mUX-FSA71Gh_ZxtpS9hiyzBMGt3lqRWKsAn7ecN6zMmvSOTGqJpsA=@proton.me>

Hi Ruslan,

On Sun, Oct 11, 2026 at 02:41:16PM +0000, Ruslan Bay wrote:
> Handle IPU4P ISYS software and CSI interrupts and dispatch firmware
> responses and CSI receiver errors to the appropriate handlers.
> 
> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c  | 90 +++++++++++++++++++
>  .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     | 38 ++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 74 +++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  2 +
>  drivers/media/pci/intel/ipu6/ipu6-isys.c      | 14 ++-
>  drivers/media/pci/intel/ipu6/ipu6.c           |  1 +
>  6 files changed, 217 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
> index dfab6e570e51..6fbbe6376ef7 100644
> --- a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
> @@ -4,8 +4,10 @@
>   */
>  
>  #include <linux/cacheflush.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/io.h>
>  #include <linux/slab.h>
>  
>  #include "ipu6.h"
> @@ -17,6 +19,7 @@
>  #include "ipu6-isys-video.h"
>  #include "ipu6-platform-regs.h"
>  #include "ipu4p-fw-isys.h"
> +#include "ipu4p-isys-csi2-regs.h"
>  
>  static void start_sp(struct ipu6_bus_device *adev)
>  {
> @@ -596,3 +599,90 @@ const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops = {
>  	.dump_stream_cfg = ipu4p_dump_stream_cfg,
>  	.dump_frame_buf_set = ipu4p_dump_frame_buf_set,
>  };
> +
> +void ipu4p_isys_irq_setup(struct ipu6_isys *isys)
> +{
> +	static const u32 irq_offsets[] = {
> +		0x00, IPU4P_ISYS_IRQ_MASK_OFFSET,
> +		IPU4P_ISYS_IRQ_ENABLE_OFFSET,
> +		IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET,
> +	};
> +	const u32 isys_irq_mask = IPU4P_ISYS_UNISPART_IRQ_SW |
> +		IPU4P_ISYS_UNISPART_IRQ_CSI2(0) |
> +		IPU4P_ISYS_UNISPART_IRQ_CSI2(1);
> +	const struct {

static const for all these?

> +		u32 base;
> +		u32 mask;
> +	} irq_config[] = {
> +		{ IPU4P_ISYS_UNISPART_IRQ_EDGE, isys_irq_mask },
> +		{ IPU4P_ISYS_ISA_ACC_IRQ_CTRL_BASE, 0 },
> +		{ IPU4P_ISYS_A_IRQ_CTRL_BASE, 0 },
> +		{ IPU4P_ISYS_SIP0_IRQ_CTRL_BASE, IPU4P_ISYS_SIP0_CSI2_IRQ },
> +		{ IPU4P_ISYS_SIP1_IRQ_CTRL_BASE, IPU4P_ISYS_SIP1_CSI2_IRQ_MASK },
> +	};
> +	void __iomem *base = isys->pdata->base;
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(irq_config); i++) {
> +		for (unsigned int j = 0; j < ARRAY_SIZE(irq_offsets); j++)
> +			writel(irq_config[i].mask,
> +			       base + irq_config[i].base + irq_offsets[j]);
> +
> +		writel(0xffffffff,
> +		       base + irq_config[i].base + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
> +	}
> +
> +	writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_REG);
> +	writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_MUX_REG);
> +}
> +
> +irqreturn_t ipu4p_isys_isr(struct ipu6_bus_device *adev)
> +{
> +	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
> +	void __iomem *base = isys->pdata->base;
> +	u32 status, sip0_status, sip1_status;
> +
> +	guard(spinlock)(&isys->power_lock);

Note that the power_lock went away recently. Please rebase.

> +
> +	if (!isys->power)
> +		return IRQ_NONE;
> +
> +	status = readl(base + IPU4P_ISYS_UNISPART_IRQ_STATUS);
> +	sip0_status = readl(base + IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS);
> +	sip1_status = readl(base + IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS);
> +	if (!status && !sip0_status && !sip1_status)
> +		return IRQ_NONE;
> +
> +	do {
> +		writel(status, base + IPU4P_ISYS_UNISPART_IRQ_CLEAR);
> +
> +		writel(sip0_status, base + IPU4P_ISYS_SIP0_IRQ_CTRL_CLEAR);
> +		writel(sip1_status, base + IPU4P_ISYS_SIP1_IRQ_CTRL_CLEAR);
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
> +	return IRQ_HANDLED;
> +}
> diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> index 7f41bdb4150a..1e1423869e21 100644
> --- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> +++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> @@ -4,6 +4,44 @@
>  
>  #include <linux/bits.h>
>  
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
> +#define IPU4P_ISYS_CSI_IRQ_CTRL_BASE(port)		\
> +	({ typeof(port) __port = (port); \
> +	   __port ? (0x6cb00 + 0x800 * (__port - 1)) : 0x66300; })

You don't need this trickery to avoid a checkpatch.pl warning. Same
elsewhere.

> +#define IPU4P_ISYS_CSI_IRQ_CTRL0_BASE(port)		\
> +	({ typeof(port) __port = (port); \
> +	   __port ? (0x6cc00 + 0x800 * (__port - 1)) : 0x66400; })
> +#define IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET		0x08
> +#define IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET		0x0c
> +#define IPU4P_ISYS_CSI_IRQ_ACTIVE			BIT(0)
> +/* CSI-2 frame events occupy bits 16-31 in the shared ctrl0 status. */
> +#define IPU4P_ISYS_CSI_ERROR_MASK			GENMASK(15, 0)
> +#define IPU4P_ISYS_CSI_ERROR_BITS			16U
> +
>  /* CSI receiver registers */
>  #define IPU4P_CSI2_RX_ENABLE				0x00
>  #define IPU4P_CSI2_RX_ENABLE_ENABLE			BIT(0)
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 9e87750269d0..ea3817ef8ac8 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -25,6 +25,7 @@
>  #include "ipu4p-fw-isys.h"
>  #include "ipu6-isys-subdev.h"
>  #include "ipu6-platform-isys-csi2-reg.h"
> +#include "ipu4p-isys-csi2-regs.h"
>  #include "ipu7-isys-csi2-regs.h"
>  
>  static const u32 csi2_supported_codes[] = {
> @@ -83,6 +84,25 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
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
> @@ -210,6 +230,39 @@ void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2)
>  	csi2->receiver_errors |= irq & mask;
>  }
>  
> +void ipu4p_isys_register_errors(struct ipu6_isys_csi2 *csi2)
> +{
> +	void __iomem *base = csi2->isys->pdata->base;
> +	u32 offset = IPU4P_ISYS_CSI_IRQ_CTRL0_BASE(csi2->port);
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
> +	u32 offset = IPU4P_ISYS_CSI_IRQ_CTRL_BASE(csi2->port);
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
> @@ -217,6 +270,27 @@ void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
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
> index dbaaf00af623..b3eb702f1996 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> @@ -75,6 +75,8 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream);
>  void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream);
>  void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2);
>  void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2);
> +void ipu4p_isys_register_errors(struct ipu6_isys_csi2 *csi2);
> +void ipu4p_isys_csi2_isr(struct ipu6_isys_csi2 *csi2);
>  int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
>  				   struct ipu6_isys_csi2 *csi2,
>  				   struct media_entity *source_entity,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index 1f9809d1b138..6d10a427b4b6 100644
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
> @@ -202,6 +203,10 @@ static void isys_csi2_unregister_subdevices(struct ipu6_isys *isys)
>  
>  static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
>  {
> +	static const u32 ipu4p_port_offsets[IPU4P_ISYS_CSI2_NPORTS] = {
> +		0x64300, 0x6c000, 0x6c100, 0x6c200,
> +		0x6c300, 0x6c400, 0x6c500, 0x6c600,
> +	};
>  	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =
>  		&isys->pdata->ipdata->csi2;
>  	unsigned int i;
> @@ -217,6 +222,9 @@ static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
>  
>  			isys->isr_csi2_bits |= mask;
>  			isys->csi2[i].legacy_irq_mask = mask;
> +		} else if (IS_IPU4P(isys->adev->isp)) {
> +			base += ipu4p_port_offsets[i];
> +			isys->isr_csi2_bits |= IPU4P_ISYS_UNISPART_IRQ_CSI2(i);
>  		} else {
>  			base += CSI_REG_PORT_BASE(i);
>  			isys->isr_csi2_bits |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
> @@ -892,6 +900,8 @@ static int isys_runtime_pm_resume(struct device *dev)
>  
>  	if (IS_IPU7(isp)) {
>  		ipu7_isys_setup_hw(isys);
> +	} else if (IS_IPU4P(isp)) {
> +		ipu4p_isys_irq_setup(isys);
>  	} else {
>  		ipu6_isys_setup_hw(isys);
>  		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
> @@ -918,7 +928,7 @@ static int isys_runtime_pm_suspend(struct device *dev)
>  	isys->phy_termcal_val = 0;
>  	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
>  
> -	if (!IS_IPU7(isp))
> +	if (!IS_IPU7(isp) && !IS_IPU4P(isp))

I think we should add IS_IPU6() macro that matches with all IPU6s.

>  		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
>  
>  	ipu6_mmu_hw_cleanup(adev->mmu);
> @@ -1177,7 +1187,7 @@ static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data = {
>  };
>  
>  static const struct ipu6_auxdrv_data ipu4p_isys_auxdrv_data = {
> -	.isr = ipu6_isys_isr,

I don't think this should have been added in the first place by the earlier
patches. As you don't have the IPU4* PCI IDs listed for the driver yet,
this won't end up used yet in any case.

> +	.isr = ipu4p_isys_isr,
>  	.isr_threaded = NULL,
>  	.wake_isr_thread = false,
>  	.fw_ops = &ipu4p_fw_isys_ops,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index 417978bef3f7..3ebf2ff76200 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -399,6 +399,7 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
>  	}
>  
>  	if (IS_IPU4P(isp)) {
> +		isys_ipdata.csi2.nports = IPU4P_ISYS_CSI2_NPORTS;
>  		isys_ipdata.num_parallel_streams = IPU4P_ISYS_MAX_STREAMS;
>  		isys_ipdata.max_streams = IPU4P_ISYS_MAX_STREAMS;
>  		isys_ipdata.sram_gran_shift = IPU4P_SRAM_GRANULARITY_SHIFT;

-- 
Regards,

Sakari Ailus
