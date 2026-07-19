Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F12296BAF;
	Sun, 19 Jul 2026 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784500932; cv=none; b=e0k62htfLHnU8vQ8j9qsHNv6NYpRkFiw31255qRGmrZWnbVrckSduG3VxmvGUCDGk4KJ2+2GBYVVs/VgblEnzk5AVjXnKSowoOgDl3w6z4oF3kmuEYcrYSGUAU2KoxbveknmuAF/saEVcRAIrxqc/xYradz3UpOeycBXwPRKITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784500932; c=relaxed/simple;
	bh=8w6+cY/MF/DUb44RyoBTRbXikJtakReBThyRrYhZVuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHvmvHERR4EyPyJzVcm8GrEhj1lQKlqrOYRtLwgJHW4QofZUN2BiRldQlRK5GC7hPeY/23Ij6qqJx9KMo8zNZKRtz7K2kb2/RllOi6FCtYOF6BqKxedH9ky6TXWXsnp7vlu0I8l4iMFXGxY5YlBIgIvIZvzF1boAFZRrk0MBpTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gr2r54DD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gr2r54DD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784500930; x=1816036930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8w6+cY/MF/DUb44RyoBTRbXikJtakReBThyRrYhZVuk=;
  b=Gr2r54DDSXqjEalsfm0xVW/03CT6TjJ6iJpEIn5VUV1I/c93ecLR0Fm9
   qf08bgVDS+J5c57DtSr+cWThrWTPGL6uTmS/Q1bZS9k3FFEtOVSU5O3fR
   oPKzk01U7oBt9TKq2oCwQHReEX25RMO2oGQ+W4+/z4FlE3fZhMXegEimm
   FFiLUJc04FfX9ksRSPc11G195BgZ8roQmsqljwt3AaCcP1gRgxA3p1hxe
   DivDQ5m95Amgr3/aBANr1IXGc6503dJCHQxIU9oUk6YeK4Vb6IyYTaySg
   9ZDBfTa4tMzOmeA/0OqyGFEI77c4A/zqe8oVEvwvPXv43khpmTIsS+0KP
   Q==;
X-CSE-ConnectionGUID: slrM3/8cTOi9urCE7B/ngA==
X-CSE-MsgGUID: wa9YpNoNRp+YbWy6obAWXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="96222904"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="96222904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:42:09 -0700
X-CSE-ConnectionGUID: nmKaMsJCT1KDo13svjPt2w==
X-CSE-MsgGUID: gpwTD5nEQtuvHWgW36RPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="253338346"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:42:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5B77D11F996;
	Mon, 20 Jul 2026 01:42:10 +0300 (EEST)
Date: Mon, 20 Jul 2026 01:42:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: i2c: ov5693: Gate the MIPI clock lane for
 IPU6
Message-ID: <al1SwrMDMnZA8LsW@kekkonen.localdomain>
References: <20260708213633.18392-1-fernandorimoli11@gmail.com>
 <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260717132021.18034-4-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717132021.18034-4-fernandorimoli11@gmail.com>

Hi Fernando,

Thank you for the update.

On Fri, Jul 17, 2026 at 03:20:21PM +0200, Fernando Rimoli wrote:
> The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
> power-on default (free-running MIPI clock). The IPU3 CSI-2 receiver
> tolerates this, but the IPU6 receiver (e.g. on Microsoft Surface Pro 8/9
> and Surface Go 4) fails to lock onto the link, so the sensor streams but
> capture times out with "stream stop time out" and no frames arrive.
> 
> Gating the clock lane when idle (MIPI_CTRL00 bit 5) makes the IPU6
> receiver lock. This was determined by sweeping the register on a Surface
> Pro 9 (IPU6): every value with bit 5 set streams (300/300 frames, steady

Nice find!

> 28 fps), every value with bit 5 clear fails with the CSI-2 timeout;
> register read-back confirmed the power-on default is 0x00. Bit 5 is the
> conventional OmniVision clock-lane-gate setting (ov5640, ov5647 and
> ov5648 all set it on every platform), so it is not an IPU6-specific hack.
> Bit 2 (bus idle in LP11) is set as well, matching ov5640's value; this
> was tested only on IPU6.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/2171
> Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
>  drivers/media/i2c/ov5693.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 02236f3db..d1b38348e 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -35,6 +35,12 @@
>  #define OV5693_STOP_STREAMING			0x00
>  #define OV5693_SW_RESET				0x01
>  
> +/* MIPI transmitter control */
> +#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
> +/* bit 5: gate the clock lane when idle; bit 2: keep the bus in LP11 when idle */
> +#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
> +#define OV5693_MIPI_CTRL00_BUS_IDLE		BIT(2)
> +
>  #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
>  /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
>  #define OV5693_CHIP_ID				0x5690
> @@ -611,6 +617,20 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
>  {
>  	int ret = 0;
>  
> +	/*
> +	 * Gate the MIPI clock lane when idle. The power-on default of
> +	 * MIPI_CTRL00 is 0x00 (free-running clock), which the IPU3 CSI-2
> +	 * receiver tolerates but the IPU6 one does not: it fails to lock onto
> +	 * the link and capture times out. Gating the clock lane (bit 5) is
> +	 * required for IPU6 and is the conventional setting for OmniVision
> +	 * sensors (cf. ov5640, ov5647, ov5648); also keep the bus in LP11 when
> +	 * idle (bit 2). Harmless on IPU3.
> +	 */
> +	if (enable)
> +		cci_write(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
> +			  OV5693_MIPI_CTRL00_CLOCK_LANE_GATE |
> +			  OV5693_MIPI_CTRL00_BUS_IDLE, &ret);

This configuration should in fact be dependent on "clock-noncontinuous"
property; parsing the endpoint sets V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK
flag when the property is present.

Could you use that in v3?

The interesting question is then why are other sensors working with IPU6
just fine without this? In general, the non-contiguous clock mode is
something you enable explicitly and enabling it shouldn't make anything
work but possibly you could save a little bit of power.

It looks like drivers used with IPUs generally don't even support
non-continuous clock mode. Ov2740 (on Thinkpads with IPU6) has similar
configuration but there the same register is written 0, i.e. free running
clock lane). Different IPU6 variants do have different PHYs though, so this
could be the reason here.

The ipu-bridge needs to set the property, too. I think this needs to be
enabled only for the IPU6 variant in question (I'd just check the PCI ID;
those are found in include/media/ipu6-pci-table.h).

> +
>  	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
>  		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
>  		  &ret);

-- 
Kind regards,

Sakari Ailus
