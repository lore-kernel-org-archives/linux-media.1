Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1863515F2
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814290; cv=none; b=nTNmAyWxYQ5NmjGriTJ3PO0PgUEuMB/Tc6Ec9h23TELSBARCEjSbX+wFB87blKU02X4bMRM/LIcxid+IemlRSPwUz/YNn256EmhUJzfdFYoWKbUKfIFlWhL/0h/3IGmzICsUBR97Dx/kqvYkZh/O3NK20dQvrf14DT2xTJYQHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814290; c=relaxed/simple;
	bh=aNOm/+TxAFaiqKxomJt7ACqEyLnaG9Nha0d2kUD/kl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFOvgvzZFEUyEQ3iR6rLi2TJiOg9FVfwgzKjtpuMld3ciJGDaPSsOo8lvoxljPthhPTTZ+nMUgWQU0SCqCN3wmD4OKLe5Ds0yD7januJ9X2dTtfRylxX925xV74oMT1RhPJY0Y3ssJ0w94LM+vV+2vkidKhkbTEPDdsJwSw0GFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cs1jhVqx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cs1jhVqx"
Received: from killaraus.ideasonboard.com (i68975AE2.versanet.de [104.151.90.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D45E2F8;
	Mon, 12 Oct 2026 16:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791814163;
	bh=aNOm/+TxAFaiqKxomJt7ACqEyLnaG9Nha0d2kUD/kl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cs1jhVqxaBwSkOES3U9GrnPTaYrf1U05WkyHMMFXx7vh2yy5dePUWhgh9e1ABGq0l
	 JmYuusiSrRvT7RwtTpHmP5e+b3K5t4tFewaCNnIsMQmLUo7k7/fq0lcmpxtjSMErgm
	 QHaNI/lLxs6kn03BkBc3f7aEszM4bf5tTcnIKYcI=
Date: Mon, 12 Oct 2026 16:11:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: Ruslan Bay <ruslanbey@proton.me>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
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
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 11/12] media: ipu6: Work around IPU4P CSI-2 port 2
 timing
Message-ID: <20261012141122.GB4214@killaraus.ideasonboard.com>
References: <wHlhg4wMna8LgQHoqgFJxsJ3dL0clAd63yzOzr-vjRpkqq6WSPuzlLeYRGYHKwdl17CXzPVLFCWD6CNkI-BTMTd33QepNGnNWJZX6yvPAV4=@proton.me>
 <asy4k-Muh1acgU6s@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <asy4k-Muh1acgU6s@kekkonen.localdomain>

On Mon, Oct 12, 2026 at 01:38:11PM +0300, Sakari Ailus wrote:
> Hi Ruslan,
> 
> On Sun, Oct 11, 2026 at 02:43:16PM +0000, Ruslan Bay wrote:
> > Use fixed timing values for the verified Surface Pro 7 front-camera
> > configuration (CSI-2 port 2, firmware source 7, two lanes), including
> > the lane-count programming order observed in Windows. Retain calculated
> > timings and the existing initialization order for other configurations.
> > 
> > Tested on the Surface Pro 7 front camera; other IPU4P systems need testing.
> > 
> > Co-developed-by: supermepsipax <supermepsipax@github>
> > Co-developed-by: thisiscamk <thisiscamk@github>
> > Co-developed-by: ConsultingFuture4200 <ConsultingFuture4200@github>
> > Co-developed-by: georgemihaila <georgemihaila@github>
> 
> Signed-off-by: is also required for these. But this isn't just about adding
> the tag; please see Documentation/process/submitting-patches.rst on what it
> means. A proper e-mail address is also required here.

As well as a real name.

> > Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> > ---
> >  .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 50 ++++++++++++++++---
> >  1 file changed, 42 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > index ec0a36069b01..ffa7d80cd5f2 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > @@ -69,6 +69,22 @@ void ipu4p_isys_phy_setup(struct ipu6_isys *isys)
> >  		ipu4p_isys_configure_phy_bb(isp, &ipu4p_phy_bb_configs[i]);
> >  }
> >  
> > +/*
> > + * Use fixed timing observed in Windows for the SP7 front camera:
> > + * IPU4P CSI-2 port 2, firmware source 7, two-lane D-PHY.
> > + */
> > +static void ipu4p_isys_apply_fixed_2lane_timing(struct ipu6_isys_csi2 *csi2)
> > +{
> > +	writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> > +	writel(1155, csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(0));
> > +
> > +	for (unsigned int i = 0; i < 8; i++) {
> > +		writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(i));
> > +		writel(1269,
> > +		       csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(i + 1));
> > +	}
> > +}
> > +
> >  static void ipu4p_isys_csi_irq_enable(struct ipu6_isys *isys,
> >  				      unsigned int port)
> >  {
> > @@ -118,6 +134,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
> >  	struct ipu6_isys_csi2 *csi2;
> >  	void __iomem *base;
> >  	u32 value;
> > +	bool fixed_timing;
> >  
> >  	if (!cfg || cfg->port >= isys->pdata->ipdata->csi2.nports)
> >  		return -EINVAL;
> > @@ -146,14 +163,30 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
> >  	if (!timing)
> >  		return -EINVAL;
> >  
> > -	writel(timing->ctermen, base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> > -	writel(timing->csettle, base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> > -
> > -	for (unsigned int lane = 0; lane < cfg->nlanes; lane++) {
> > -		writel(timing->dtermen,
> > -		       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> > -		writel(timing->dsettle,
> > -		       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> > +	writel(timing->ctermen,
> > +	       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> > +
> > +	fixed_timing = csi2->port == 2 && cfg->nlanes == 2 &&
> > +		       csi2->asd.source ==
> > +		       IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + 7;
> > +	if (fixed_timing) {
> > +		ipu4p_isys_apply_fixed_2lane_timing(csi2);
> > +		dev_dbg(&isys->adev->auxdev.dev,
> > +			"using fixed SP7 timing for CSI-2 port %u, source 7, two lanes\n",
> > +			csi2->port);
> > +
> > +		/* Windows configures the lane count before RX_CONFIG. */
> > +		writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
> 
> Doesn't Surface Pro 7 work without these?
> 
> I can't recall if I commented this issue already, but I think this
> information should be passed to the driver in form of endpoint properties,
> stuffed in ipu-bridge based on DMI information.
> 
> The bindings for this should also be specified for DT, but perhaps that's
> out of scope of the set -- as there remain a kernel interface only, changes
> later on will be possible and fairly trivial.
> 
> > +	} else {
> > +		writel(timing->csettle,
> > +		       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> > +
> > +		for (unsigned int lane = 0; lane < cfg->nlanes; lane++) {
> > +			writel(timing->dtermen,
> > +			       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> > +			writel(timing->dsettle,
> > +			       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> > +		}
> >  	}
> >  
> >  	value = readl(base + IPU4P_CSI2_RX_CONFIG);
> > @@ -162,6 +195,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys,
> >  	writel(value, base + IPU4P_CSI2_RX_CONFIG);
> >  
> >  	writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
> > +
> 
> Unrelated change. You could place it in the patch adding the adjacent
> linest.
> 
> >  	writel(0, base + IPU4P_CSI2_RX_ENABLE);
> >  
> >  	ipu4p_isys_csi_irq_enable(isys, cfg->port);

-- 
Regards,

Laurent Pinchart
