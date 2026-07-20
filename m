Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0FE39E6E4;
	Mon, 20 Jul 2026 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556594; cv=none; b=llSZlTPXr3VQwrYTWPDKW9vaAdC54nx0DzV85Ru66HOakFycT6K9aJySJzfBaRQOyG6tocC1RU+pYP3zGuvwdCKq/oVYbkyYREVqdmcrsSUQcTLm1/O72HYiMK3juKnp7F6yu0Ji4DPT78wQPSdn7k47lpR/nCB3eb2E8tDkDuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556594; c=relaxed/simple;
	bh=WtEKzBj92icm3glOh11ZSj1p5BEixv+6gTBXlS2CbdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZWvW3chqixydvydkNlGOOReoo12G6qaOOv04CWdOL4NSdTy6uFezI7S524lSEgwj2Sn5t3Yt4XZygGY3t4RZy9A6oCy2k1gt3SSzSYfLYTgZg+Hd6cV6jSLbEMvm5N46DJrOenbHX9m41vpL/LK67/lgGJzIhHpRw1X/+SI/eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLjbIDCG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLjbIDCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784556592; x=1816092592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WtEKzBj92icm3glOh11ZSj1p5BEixv+6gTBXlS2CbdE=;
  b=ZLjbIDCGbndIVlT+1NRAi54CXD0nV7IYYcCtlKk/a+fhfPJypWQ4ug9S
   doDzkQmN5mEf+mkiOhI5EPp8g0HLgAswlAQ3OtXJJY7Ue5JD4QV8PH0uX
   lfLZVjXrqLpNmWuWwMKZPoWpvydKrM/fLcyqHMC4NPlG1fJud1Jhz04Dc
   OmrF75Ovm+qL2lWTvDGqWB8PoPo9rL/byQKgmw09X5iWE5YRbhas2hAHf
   Ooo/F9XtQEK1I+gWEofmwizaqQ2GDD6Zkl9Q5k4qhAYLnA5F8/X2ZETJV
   +uD3icPUR7U0aXC5vVUhTEU+61OELa1ZipNoYe/rFGEbx5gcoIbHNyeyh
   A==;
X-CSE-ConnectionGUID: EM/aWnl+Rui+2TVemx7hUg==
X-CSE-MsgGUID: XXGfXca3SdazeKLAHGtlhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72672398"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="72672398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 07:09:51 -0700
X-CSE-ConnectionGUID: B3670YTuRFy2PGlusv6PNQ==
X-CSE-MsgGUID: Z6gD2n6sTjyzsraRYMM/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="254845250"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 07:09:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 84D98121C2B;
	Mon, 20 Jul 2026 17:09:51 +0300 (EEST)
Date: Mon, 20 Jul 2026 17:09:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: shravan kumar <shravan.chippa@microchip.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	praveen.kumar@microchip.com
Subject: Re: [PATCH V2] media: i2c: imx334: add new link frequency
 configuration
Message-ID: <al4sL1ML1hQ1a3cJ@kekkonen.localdomain>
References: <20260526044051.2946362-1-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526044051.2946362-1-shravan.chippa@microchip.com>

Hi Shravan,

On Tue, May 26, 2026 at 10:10:51AM +0530, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Add support for a new 222 MHz link frequency configuration to the
> IMX334 driver and dynamically generate the supported modes array
> based on the link frequencies specified in the DTS. When multiple
> link frequencies support the same resolution, the driver selects
> the first matching entry; therefore, the link frequency must be
> explicitly defined in the DTS to avoid resolution conflicts.
> The link frequency is a read‑only parameter and is automatically
> set based on the selected resolution and DTS configuration.

E.g. the CCS driver calculates the PLL configuration based on the input
parameters, one of which is the link frequency. There are other drivers
that do the same. Improving the driver to calculate the PLL frequency
dynamically could be problematic from UAPI point of view. Therefore I think
it'd be safer to require the user to pick the link frequency right from the
start.

I probably wouldn't allocate a separate array for active modes but just
loop over the existing array as needed.

> 
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> 
> ---
> 
> Changes from V1 -> V2
> 
> 1. Fix: Default mode selection bug
>    - Problem: Used __ffs(link_freq_bitmap) as index into the compacted
>      active_modes array. This index corresponds to a bit position in the
>      bitmap, not an array index in the filtered modes list.
>    - Fix: Use index 0, which is always the first valid mode in the
>      filtered array.
> 
> 2. Fix: Rename fields for clarity
>    - Renamed struct fields:
>      * new_supported_modes -> active_modes
>      * new_modes_size -> num_active_modes
>    - Updated kernel-doc header for struct imx334 to document new fields.
> 
> 3. Fix: INCKSEL2 register write - add error handling and switch-case
>    - Location: imx334_enable_streams()
>    - Problem: Original code only handled 222 MHz case with no error
>      checking (passed NULL to cci_write).
>    - Fix: Replaced with switch-case covering all three link frequencies:
>      * 891 MHz -> INCKSEL2 = 0x02
>      * 445 MHz -> INCKSEL2 = 0x06
>      * 222 MHz -> INCKSEL2 = 0x0a
>    - Added proper error handling using &ret accumulator pattern with
>      dev_err and goto err_rpm_put on failure.
> 
> 4. Fix: Use BIT() macro
>    - Location: imx334_update_supported_mode_array()
>    - Replaced (1 << i) with BIT(i) for kernel coding style compliance.
> 
> 5. Fix: Use devm_kmalloc_array() for overflow-safe allocation
>    - Location: imx334_update_supported_mode_array()
>    - Replaced: devm_kmalloc(dev, n * sizeof(struct imx334_mode), GFP_KERNEL)
>    - With: devm_kmalloc_array(dev, n, sizeof(*temp_ptr), GFP_KERNEL)
>    - Provides overflow-safe multiplication and uses sizeof(*ptr) idiom.
> 
> 6. Cleanup: Condensed copy loop
>    - Location: imx334_update_supported_mode_array(), second loop
>    - Simplified the struct copy with post-increment:
>      temp_ptr[size++] = supported_modes[j];
> 
> 7. Fix: Updated function kernel-doc comment
>    - Location: imx334_update_supported_mode_array()
>    - Reworded: "Search for the supported modes add them in the new list"
>    - To: "Build filtered modes array based on DTS link frequencies"
> 
> 8. IMX334_LINK_FREQ_222M changed from 222500000 to 222750000
> 
> ---
> 
>  drivers/media/i2c/imx334.c | 128 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 121 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 9654f9268056..b6ef314ee717 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -109,6 +109,7 @@
>  /* CSI2 HW configuration */
>  #define IMX334_LINK_FREQ_891M		891000000
>  #define IMX334_LINK_FREQ_445M		445500000
> +#define IMX334_LINK_FREQ_222M		222750000
>  #define IMX334_NUM_DATA_LANES		4
>  
>  #define IMX334_REG_MIN			0x00
> @@ -187,6 +188,8 @@ struct imx334_mode {
>   * @again_ctrl: Pointer to analog gain control
>   * @vblank: Vertical blanking in lines
>   * @cur_mode: Pointer to current selected sensor mode
> + * @active_modes: Pointer to modes filtered by DTS link frequencies
> + * @num_active_modes: Number of entries in active_modes array
>   * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
>   * @cur_code: current selected format code
>   */
> @@ -209,6 +212,8 @@ struct imx334 {
>  	};
>  	u32 vblank;
>  	const struct imx334_mode *cur_mode;
> +	const struct imx334_mode *active_modes;
> +	int num_active_modes;

unsigned int?

>  	unsigned long link_freq_bitmap;
>  	u32 cur_code;
>  };
> @@ -216,6 +221,7 @@ struct imx334 {
>  static const s64 link_freq[] = {
>  	IMX334_LINK_FREQ_891M,
>  	IMX334_LINK_FREQ_445M,
> +	IMX334_LINK_FREQ_222M,
>  };
>  
>  /* Sensor common mode registers values */
> @@ -486,6 +492,45 @@ static const struct imx334_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_640x480_regs),
>  			.regs = mode_640x480_regs,
>  		},
> +	}, {
> +		.width = 1920,
> +		.height = 1080,
> +		.hblank = 2480,
> +		.vblank = 1170,
> +		.vblank_min = 45,
> +		.vblank_max = 132840,
> +		.pclk = 297000000,
> +		.link_freq_idx = 2,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
> +			.regs = mode_1920x1080_regs,
> +		},
> +	}, {
> +		.width = 1280,
> +		.height = 720,
> +		.hblank = 2480,
> +		.vblank = 1170,
> +		.vblank_min = 45,
> +		.vblank_max = 132840,
> +		.pclk = 297000000,
> +		.link_freq_idx = 2,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> +			.regs = mode_1280x720_regs,
> +		},
> +	}, {
> +		.width = 640,
> +		.height = 480,
> +		.hblank = 2480,
> +		.vblank = 1170,
> +		.vblank_min = 45,
> +		.vblank_max = 132840,
> +		.pclk = 297000000,
> +		.link_freq_idx = 2,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_640x480_regs),
> +			.regs = mode_640x480_regs,
> +		},
>  	},
>  };
>  
> @@ -713,7 +758,7 @@ static int imx334_enum_frame_size(struct v4l2_subdev *sd,
>  	struct imx334 *imx334 = to_imx334(sd);
>  	u32 code;
>  
> -	if (fsize->index >= ARRAY_SIZE(supported_modes))
> +	if (fsize->index >= imx334->num_active_modes)
>  		return -EINVAL;
>  
>  	code = imx334_get_format_code(imx334, fsize->code);
> @@ -721,9 +766,9 @@ static int imx334_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fsize->code != code)
>  		return -EINVAL;
>  
> -	fsize->min_width = supported_modes[fsize->index].width;
> +	fsize->min_width = imx334->active_modes[fsize->index].width;
>  	fsize->max_width = fsize->min_width;
> -	fsize->min_height = supported_modes[fsize->index].height;
> +	fsize->min_height = imx334->active_modes[fsize->index].height;
>  	fsize->max_height = fsize->min_height;
>  
>  	return 0;
> @@ -792,8 +837,8 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
>  	const struct imx334_mode *mode;
>  	int ret = 0;
>  
> -	mode = v4l2_find_nearest_size(supported_modes,
> -				      ARRAY_SIZE(supported_modes),
> +	mode = v4l2_find_nearest_size(imx334->active_modes,
> +				      imx334->num_active_modes,
>  				      width, height,
>  				      fmt->format.width, fmt->format.height);
>  
> @@ -914,6 +959,23 @@ static int imx334_enable_streams(struct v4l2_subdev *sd,
>  		goto err_rpm_put;
>  	}
>  
> +	/* Override INCKSEL2 based on the active link frequency */
> +	switch (link_freq[imx334->cur_mode->link_freq_idx]) {
> +	case IMX334_LINK_FREQ_891M:
> +		cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x02, &ret);
> +		break;
> +	case IMX334_LINK_FREQ_445M:
> +		cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x06, &ret);
> +		break;
> +	case IMX334_LINK_FREQ_222M:
> +		cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x0a, &ret);
> +		break;
> +	}

Writing the register should be removed from the register lists with this.
No need for the comment either.

> +	if (ret) {
> +		dev_err(imx334->dev, "fail to set INCKSEL2\n");
> +		goto err_rpm_put;
> +	}
> +
>  	/* Start streaming */
>  	ret = cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
>  			IMX334_MODE_STREAMING, NULL);
> @@ -979,6 +1041,53 @@ static int imx334_detect(struct imx334 *imx334)
>  	return 0;
>  }
>  
> +/**
> + * imx334_update_supported_mode_array() - Build filtered modes array based on
> + *                                        DTS link frequencies
> + * @imx334: pointer to imx334 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_update_supported_mode_array(struct imx334 *imx334)
> +{
> +	int i, j, size = 0;

unsigned int for all, please. 

> +	struct imx334_mode *temp_ptr;
> +
> +	for (i = 0; i < ARRAY_SIZE(link_freq); i++) {
> +		if (imx334->link_freq_bitmap & BIT(i)) {

Perhaps

		if (!(...))
			continue;

?

> +			for (j = 0; j < ARRAY_SIZE(supported_modes); j++) {
> +				if (supported_modes[j].link_freq_idx == i)
> +					size++;
> +			}
> +		}
> +	}
> +
> +	if (!size)
> +		return -EINVAL;
> +
> +	imx334->num_active_modes = size;
> +
> +	size = 0;
> +
> +	temp_ptr = devm_kmalloc_array(imx334->dev, imx334->num_active_modes,
> +				      sizeof(*temp_ptr), GFP_KERNEL);

I think you could call temp_ptr active_modes.

> +	if (!temp_ptr)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(link_freq); i++) {
> +		if (imx334->link_freq_bitmap & BIT(i)) {
> +			for (j = 0; j < ARRAY_SIZE(supported_modes); j++) {
> +				if (supported_modes[j].link_freq_idx == i)
> +					temp_ptr[size++] = supported_modes[j];
> +			}
> +		}
> +	}
> +
> +	imx334->active_modes = temp_ptr;
> +
> +	return 0;
> +}
> +
>  /**
>   * imx334_parse_hw_config() - Parse HW configuration and check if supported
>   * @imx334: pointer to imx334 device
> @@ -1038,6 +1147,11 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
>  				       link_freq, ARRAY_SIZE(link_freq),
>  				       &imx334->link_freq_bitmap);
>  
> +	if (ret)
> +		goto done_endpoint_free;
> +
> +	ret = imx334_update_supported_mode_array(imx334);
> +
>  done_endpoint_free:
>  	v4l2_fwnode_endpoint_free(&bus_cfg);
>  
> @@ -1250,8 +1364,8 @@ static int imx334_probe(struct i2c_client *client)
>  		goto error_power_off;
>  	}
>  
> -	/* Set default mode to max resolution */
> -	imx334->cur_mode = &supported_modes[__ffs(imx334->link_freq_bitmap)];
> +	/* Set default mode to first entry in the filtered modes array */
> +	imx334->cur_mode = &imx334->active_modes[0];
>  	imx334->cur_code = imx334_mbus_codes[0];
>  	imx334->vblank = imx334->cur_mode->vblank;
>  

-- 
Kind regards,

Sakari Ailus
