Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C62609C5
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901942; cv=none; b=MKL4Y2LyrnL12aH2opywgZnZbzTOEDEv7RgiKi8R7MUnP3RXQmLLnr3sSTSxLSCPSdK5y7PJ5dmdZs4mWbijXhLcG/bwGF3sXkN0R9jH4qwkp+GQMQqwLLmvPW0uFJBQU4tUMvC/mMf4Xd0FCKKvZRxZvCZYafHMJ+FJPl21TOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901942; c=relaxed/simple;
	bh=pYPf2xIr+kx9nYthz7c4j6HDY0zfFC3WpGi3G/EFrlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C193YEB/PiOgbonnxD4lfONLRepJbUcGExWbL2SphreLedHS8C4tbVr/IEb5sYywNQH/tTMVoffkAkS4KY626Meg6+bCuOGsChUKWDAlJfUhzvtlSZxEjdQhzbG02xX5AzaFkWwj2LnOtIyPz3xPnF+9wXaUWWZKsL0W2ChX7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ihDbXs9b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ihDbXs9b"
Received: from ideasonboard.com (mob-109-113-12-30.net.vodafone.it [109.113.12.30])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 060D02EE;
	Mon,  8 Jun 2026 08:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780901903;
	bh=pYPf2xIr+kx9nYthz7c4j6HDY0zfFC3WpGi3G/EFrlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihDbXs9bZ5ZrRQq6DA6JS3A3cfohQCxA+uN2ahRTBS/jZPNG1vfJtiuykEIhDe9CD
	 uVb6vTdGT38JM5BKwUH+5I1tB5TEkCb4dU4fqN43vopQ2ud+jotbK1XxijR6S0V6mh
	 kqk14RNcrUneyiv961EnWfxHOLyKHNtbnbe/Tn7c=
Date: Mon, 8 Jun 2026 08:58:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <aiZnQgyEBkZH7er0@zed>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-7-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> When vertical analogue binning is in use, the minimum frame length in
> lines decreases to around half of the normal. In relation to the sensor's
> output size this means vertical blanking can be negative but that's not an
> issue as control values are signed. Remove the workaround for this

Didn't we just discussed two weeks ago in media summit how negative
blankings are a bad idea, and of all drivers one could decide to play
with imx219 is probably the worse due it's large use base and the fact
libcamera doesn't support negative blankings ?

Have I missed something ?

> non-issue that doubled the pixel rate, frame length in lines and exposure
> time.
>
> The resulting change also fixes the minimum, the maximum and the step
> values for the control.
>
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 37 ++++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 3aebcbaa3fcd..3cee31758b7e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -420,15 +420,6 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
>
>  }
>
> -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
> -{
> -	u8 bin_h, bin_v;
> -
> -	imx219_get_binning(state, &bin_h, &bin_v);
> -
> -	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
> -}
> -
>  /* -----------------------------------------------------------------------------
>   * Controls
>   */
> @@ -440,19 +431,17 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>  	const struct v4l2_mbus_framefmt *format;
>  	struct v4l2_subdev_state *state;
> -	u32 rate_factor;
>  	int ret = 0;
>
>  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
>  	format = v4l2_subdev_state_get_format(state, 0);
> -	rate_factor = imx219_get_rate_factor(state);
>
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		int exposure_max, exposure_def;
>
>  		/* Update max exposure while meeting expected vblanking */
>  		exposure_max = format->height + ctrl->val -
> -			IMX219_EXPOSURE_OFFSET * rate_factor;
> +			IMX219_EXPOSURE_OFFSET;
>  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  				exposure_max : IMX219_EXPOSURE_DEFAULT;
>  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> @@ -479,7 +468,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_EXPOSURE:
>  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> -			  ctrl->val / rate_factor, &ret);
> +			  ctrl->val, &ret);
>  		break;
>  	case V4L2_CID_DIGITAL_GAIN:
>  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> @@ -496,7 +485,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_VBLANK:
>  		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> -			  (format->height + ctrl->val) / rate_factor, &ret);
> +			  format->height + ctrl->val, &ret);
>  		break;
>  	case V4L2_CID_HBLANK:
>  		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> @@ -837,8 +826,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	const struct imx219_mode *mode;
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
> -	u8 bin_h, bin_v, bin_hv;
> -	int ret;
> +	u8 bin_h, bin_v;
> +	int ret, bin_hv;
>
>  	format = v4l2_subdev_state_get_format(state, 0);
>
> @@ -879,23 +868,25 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		unsigned int rate_factor = imx219_get_rate_factor(state);
>  		int exposure_max;
>  		int exposure_def;
>  		int llp_min;
>  		int pixel_rate;
>
>  		/* Update limits and set FPS to default */
> +		int vblank_min = ((int)mode->height * (1 - bin_hv) / bin_hv) +
> +			IMX219_VBLANK_MIN;
>  		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> -					       IMX219_VBLANK_MIN * rate_factor,
> -					       (IMX219_FLL_MAX - mode->height) *
> -					       rate_factor, rate_factor,
> -					       mode->fll_def - mode->height);
> +					       vblank_min,
> +					       IMX219_FLL_MAX - mode->height, 1,
> +					       (int)(mode->fll_def / bin_hv) -
> +					       (int)mode->height);
>  		if (ret)
>  			return ret;
>
>  		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
> -					 mode->fll_def - mode->height);
> +					 (int)(mode->fll_def / bin_hv) -
> +					 (int)mode->height);
>  		if (ret)
>  			return ret;
>
> @@ -932,7 +923,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  			return ret;
>
>  		/* Scale the pixel rate based on the mode specific factor */
> -		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
> +		pixel_rate = imx219_get_pixel_rate(imx219);
>  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
>  					       pixel_rate, 1, pixel_rate);
>  		if (ret)
> --
> 2.47.3
>
>
