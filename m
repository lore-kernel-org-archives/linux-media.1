Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D530F92D;
	Tue, 11 Aug 2026 05:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786427689; cv=none; b=N+mRQVAtVcUWc4v9uAmn6fYOPEdannwJria7L2aNWhXcfFmznXgY/HjWpUAR7Qh2UH/q1In5U+iWa+wZPOdQ8bTC+t2IGpBAmUX3ZavAGzf7/22SlGIdlEsg9vDeRJMZAwHse9S81T7kLru/LpJajpsgPm4zsWEy9tF/7dKGl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786427689; c=relaxed/simple;
	bh=ylj7Jf/T7oyTJ/dnrUDkN16XHes08y/wdhl+AdKSMY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKAiohnyQ0eZaGZjdbb9V/ImKcyXO9N4nUGi3WcKHo1zSKmDg05kKIKPXVblcPaF48gvwcSaK0NqKXw/K4PN3Xe1NAOiUmDr8UJvr2P4xNWowpMUbbs6U2jdtCZ8ssun/TUX+jGmiZU1kgxbzCI/0vux9HqQZWPH9v9tUbfDwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pn8LuUSZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pn8LuUSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786427687; x=1817963687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ylj7Jf/T7oyTJ/dnrUDkN16XHes08y/wdhl+AdKSMY4=;
  b=Pn8LuUSZVg29CGnKMsoOepLOte3aanDElPfOkAR0icmFk4K5kqrAbqhw
   E+VsPvlp7ZNJ3l5ApPbSjwMu/RC/ZBfDZKZ7aS2kyKuFXgE+AH2agSiYb
   fYf0Sp4+YfmAdOEQReMACH+wlVgJoNfRERR2U6APhdTWP9jXyXF44qtgx
   svpija9YZXhFB0RzSSJhW/AHn/SNzdVbsjoq6p5ZhEwFrtv4mtlr/8KdV
   M8hwKf3/3UEFigzqzhprmGp7P+M8giKl91oA4k6v0yjrPYc1hqjVFFB3z
   G+MGh6usyXZVjYqeJGzpa7s9PnQ58oBjQM5XGR/h33Ro4E6HgqYdyl7l7
   w==;
X-CSE-ConnectionGUID: AAHUF9/YRda2m+/iq9w8jg==
X-CSE-MsgGUID: 11KGExzvQPCXQ7avtdcg0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87166175"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="87166175"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 22:54:46 -0700
X-CSE-ConnectionGUID: 4XWF1i0fTdqwdbnNryaPUQ==
X-CSE-MsgGUID: C+zf+Yd2QxSYyE5pCyd3MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="287949446"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 22:54:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 938D311FC6D;
	Tue, 11 Aug 2026 08:54:39 +0300 (EEST)
Date: Tue, 11 Aug 2026 08:54:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: jason98166@gmail.com
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: Re: [PATCH] media: ov5640: select the MIPI lane mode from the
 endpoint lane count
Message-ID: <anq5HzmP33fqWYEO@kekkonen.localdomain>
References: <20260811-ov5640-1lane-v1-v1-1-79699457ce13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-ov5640-1lane-v1-v1-1-79699457ce13@gmail.com>

Hi Jason,

Thanks for the patch.

On Tue, Aug 11, 2026 at 12:40:13PM +0800, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
> 
> ov5640_set_stream_mipi() always programs IO_MIPI_CTRL00 with 0x45,
> which selects the two data lane mode: the number of data lanes
> described in the devicetree endpoint only feeds the sensor's clock
> tree computations, so a module wired with one data lane starts
> streaming in two lane mode and the receiver never assembles a
> frame.
> 
> Select the lane mode from the endpoint instead. The one lane
> encoding is [7:5] = 001 per the current sensor manual (version
> 2.33). The 2.03 manual documented 000/001 for one/two lanes;
> OmniVision corrected the table in version 2.1, which is why the
> long-standing comment here found 001 unusable for two lanes and
> validated 010 instead.
> 
> The power-up path also programs a two data lane mode, but that
> value is overwritten when streaming starts, so it is left alone.
> 
> Tested with a single data lane module on an i.MX8MP board
> (imx-mipi-csis receiver), where the unpatched value produces no
> frames at all, and on an RK3588 board.
> 
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Cc: stable+noautosel@kernel.org # no in-tree 1-lane users

I guess there wouldn't be harm from backporting either.

> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---
> The three [7:5] encodings were exercised individually on the
> i.MX8MP board (v7.2-rc4, data-lanes = <1>) by patching the value
> and capturing with v4l2-ctl:
> 
>   001 (this patch): 30/30 frames, zero PHY error events in
>       steady state (3 x 300 frames)
>   000 (2.03 manual / NXP KB): same result
>   010 (unpatched two lane mode): no frames; the receiver logs
>       only start-of-transmission errors and never assembles one
> 
> The RK3588 run used the same module and devicetree (data-lanes =
> <1>) through a Rockchip CSI-2 receiver, streaming to natural EOS
> with a clean kernel log.
> 
> Happy to run additional tests on either platform if that would
> help.
> ---
>  drivers/media/i2c/ov5640.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8deb5f5501fa..ef731709bdc8 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1826,27 +1826,27 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  
>  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
>  {
> +	u8 val;
>  	int ret;
>  
>  	/*
>  	 * Enable/disable the MIPI interface
>  	 *
> -	 * 0x300e = on ? 0x45 : 0x40
> -	 *
> -	 * FIXME: the sensor manual (version 2.03) reports
> -	 * [7:5] = 000  : 1 data lane mode
> -	 * [7:5] = 001  : 2 data lanes mode
> -	 * But this settings do not work, while the following ones
> -	 * have been validated for 2 data lanes mode.
> -	 *
> +	 * [7:5] = 001	: 1 data lane mode
>  	 * [7:5] = 010	: 2 data lanes mode
> +	 *		  Encodings per version 2.33 of the sensor manual.
>  	 * [4] = 0	: Power up MIPI HS Tx
>  	 * [3] = 0	: Power up MIPI LS Rx
>  	 * [2] = 1/0	: MIPI interface enable/disable
>  	 * [1:0] = 01/00: FIXME: 'debug'
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> -			       on ? 0x45 : 0x40);
> +	if (on)
> +		val = sensor->ep.bus.mipi_csi2.num_data_lanes == 1 ?
> +		      0x25 : 0x45;

How about:

	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
			       on ? 0x5 | ep.bus.mipi_csi2.num_data_lanes << 5 :
			       0x40);

> +	else
> +		val = 0x40;
> +
> +	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, val);
>  	if (ret)
>  		return ret;
>  
> @@ -2535,7 +2535,7 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
>  	 *
>  	 * 0x300e = 0x40
> -	 * [7:5] = 010	: 2 data lanes mode (see FIXME note in
> +	 * [7:5] = 010	: 2 data lanes mode (see the note in
>  	 *		  "ov5640_set_stream_mipi()")

Do we need quotes?

>  	 * [4] = 0	: Power up MIPI HS Tx
>  	 * [3] = 0	: Power up MIPI LS Rx
> 

-- 
Kind regards,

Sakari Ailus
