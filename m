Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2773859DA;
	Thu, 30 Jul 2026 07:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397591; cv=none; b=U86dTuDF92q7YGPPdNQsESBlkFPlRF0xLGDza5NV7hvmgQGDt0LBmq7LTqJ3z+DFjgI71ReLz7plfd1LGfIOT/UAhq5OexSaYF7gTN1CfNl9hmHsupOZGr1Q3cor9aQryNgHnlvrLe9Nj+EYhQXQKtkVqgyjGU2Iq4hNJzpMw4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397591; c=relaxed/simple;
	bh=La5hnYzfS5iMZIaQahrT6S3uiuCLnPaFEXw3zkSLAkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GalHZH05YLZHJ31KlN80VC3wVjq+vSN2kT5F2t0ZH2mrkO071+JscLgAZIfUaeqfq+XjjJ+QS03123w8ZNJdE0a9M+1OzN95XJ6N1BWc4xPvDgkhxdVXbNzNl3Sp0KszXEYW41wS/OYPyZnhtglDcP/xwsYho/RF/Qc/cfGCN/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COXk2q97; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COXk2q97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785397589; x=1816933589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=La5hnYzfS5iMZIaQahrT6S3uiuCLnPaFEXw3zkSLAkk=;
  b=COXk2q974PLP3k70MeoAHgdhFsz1o3cGrsmnWyg/nZ7PJrFsQXir268v
   /OlB0cAYPT+zMk5kbTgoT1gMa8Pex8rirOlsFwJnLH7VvDN8hgluoSKdd
   LKzT4KIogiA0varpNRBTuFE2BOPttJZv6M8xe8WL7iHt4/VkxZBaDWcAu
   j/69+SxhNesxZvDvuGk8Xgu0IRRYsWsveA1UVZXBPlsFxM9iPOpFrUNcI
   YOMqqRymvX12X5xqKXc25WKmXtfd//mfJJ0ohjukooj7UNFDGYvZz2hN7
   gpj/Xjjh16zKC3NuX2Ca9HXNNkuhDWQwsBeKPl7hkXg4xommVpWJx2MG5
   w==;
X-CSE-ConnectionGUID: IOzRQA1GSCmkbVTgmSCNRw==
X-CSE-MsgGUID: KEuRsUE8SwK3HgJYIQiE7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85136589"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85136589"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 00:46:29 -0700
X-CSE-ConnectionGUID: NSYlxZr+R4eEybAazvirRQ==
X-CSE-MsgGUID: o9zuZONbRXya9LOwUMQ7AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="258990807"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.137])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 00:46:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 55778121C09;
	Thu, 30 Jul 2026 10:46:27 +0300 (EEST)
Date: Thu, 30 Jul 2026 10:46:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: i2c: ov5693: Gate the MIPI clock lane for
 non-continuous clock
Message-ID: <amsBU-5t8pmSLXBr@kekkonen.localdomain>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-4-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720163819.104130-4-fernandorimoli11@gmail.com>

Hi Fernando,

On Mon, Jul 20, 2026 at 06:38:18PM +0200, Fernando Rimoli wrote:
> The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
> power-on default (free-running MIPI clock). The IPU3 CSI-2 receiver
> tolerates this, but the IPU6 receiver (e.g. on Microsoft Surface Pro 8/9
> and Surface Go 4) fails to lock onto the link, so the sensor streams but
> capture times out with "stream stop time out" and no frames arrive.
> 
> Parse the "clock-noncontinuous" endpoint property (which sets the
> V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag) and, when it is present, gate
> the clock lane while idle (bit 5) and keep the bus in LP11 (bit 2) at
> stream on, matching the approach ov5647 already uses for the same
> register. When the flag is absent the register is left at its reset
> default, so IPU3 and other users are unaffected.
> 
> Gating the clock lane was determined to be necessary and sufficient by
> sweeping the register at runtime on a Surface Pro 9 (IPU6): every value
> with bit 5 set streams (300/300 frames, steady 28 fps), every value with
> bit 5 clear fails with the CSI-2 timeout; register read-back confirmed
> the power-on default is 0x00. Bit 2 (bus idle in LP11) is set as well,
> matching ov5640's value. Note that unlike ov5647 the line-sync bit
> (bit 4) is deliberately not set: adding it collapses the IPU6 stream to
> a couple of frames, so this value differs from ov5647's - the IPU6 D-PHY
> behaves differently, consistent with these settings being PHY-specific.

This paragraph fits better to the cover page than to a commit message.

> 
> The "clock-noncontinuous" property is supplied by the ipu-bridge for the
> affected IPU6 variants in a subsequent patch.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/2171
> Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> Tested-by: Jakob Berg Jespersen <dev@berg.pm>
> ---
>  drivers/media/i2c/ov5693.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 02236f3db..5468e89d6 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -35,6 +35,14 @@
>  #define OV5693_STOP_STREAMING			0x00
>  #define OV5693_SW_RESET				0x01
>  
> +/* MIPI transmitter control */
> +#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
> +/* bit 5: gate the clock lane when idle; bit 2: keep the bus in LP11 when idle */
> +#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
> +#define OV5693_MIPI_CTRL00_BUS_IDLE		BIT(2)

How about calling this OV5693_MIPI_CTRL00_LP11?

Didn't IPU6 work with this sensor without setting the 2nd bit?

> +#define OV5693_MIPI_CTRL00_NCONT_CLOCK		(OV5693_MIPI_CTRL00_CLOCK_LANE_GATE | \
> +						 OV5693_MIPI_CTRL00_BUS_IDLE)
> +
>  #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
>  /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
>  #define OV5693_CHIP_ID				0x5690
> @@ -144,6 +152,9 @@ struct ov5693_device {
>  	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
>  	struct clk *xvclk;
>  
> +	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
> +	bool clock_ncont;
> +
>  	struct ov5693_mode {
>  		struct v4l2_rect crop;
>  		struct v4l2_mbus_framefmt format;
> @@ -611,6 +622,19 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
>  {
>  	int ret = 0;
>  
> +	/*
> +	 * When the CSI-2 link is configured for a non-continuous clock, gate
> +	 * the MIPI clock lane while idle (bit 5) and keep the bus in LP11
> +	 * (bit 2). The power-on default of MIPI_CTRL00 is 0x00 (free-running
> +	 * clock): the IPU3 CSI-2 receiver tolerates that, but the IPU6 one
> +	 * fails to lock onto the link and capture times out. Only touch the
> +	 * register when the endpoint requests a non-continuous clock, leaving
> +	 * the reset default in place otherwise.
> +	 */
> +	if (enable && ov5693->clock_ncont)
> +		cci_write(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
> +			  OV5693_MIPI_CTRL00_NCONT_CLOCK, &ret);
> +
>  	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
>  		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
>  		  &ret);
> @@ -1259,6 +1283,9 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
>  		goto out_free_bus_cfg;
>  	}
>  
> +	ov5693->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
> +			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> +
>  out_free_bus_cfg:
>  	v4l2_fwnode_endpoint_free(&bus_cfg);
>  

-- 
Kind regards,

Sakari Ailus
