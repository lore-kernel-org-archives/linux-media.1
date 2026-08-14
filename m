Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0D41B366;
	Fri, 14 Aug 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693400; cv=none; b=HayPWamHWKuzWY8RhH5ervK7ixmNbcuItJe6yk4HhkmsyHJwdZRWS41FjxCfOD6RdEQU4Im2I62PSQx9PgW9UvuQpWXIhmjEDFCjCBHlOJg31ZtOBjiWjhcxH4L4y3JhsK6bZ28eP/eEhvmk1ZkgJQuTAxUFwc3im0BFU6PnXqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693400; c=relaxed/simple;
	bh=XFfUVU43t9uA7NhVKcYlFHb3bbrazee/jiS7Tobci5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TpNgl5dqDsH3qCFJU7xsVO74PfTE6G9a6aT/+iotSuGwq9E5ZEkwXSI2SPcoK7Os/H6OA3b+px956cV+SxyT16fZJgv5mynpxeO/Yatkb/Df22xaJ0TndcUtvb4E8OlusqhJe5w2FtpwI1vbO1UbXSoe2VYFKFRl3ReqMgCV2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWjBSyUT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWjBSyUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8C81F000E9;
	Fri, 14 Aug 2026 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786693389;
	bh=Ml655NV4XLxcpqiomtzeZ7c76CDuUeFIwpXGTfPEJFk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FWjBSyUTPwB9WtlfFgUvNMzgACF+MCZU4pP1kvOTsk9leycF0oFaHHSBOfPT/ZQmD
	 LL2wkczqjxOMyfNOaK/0KMomIf5ma7HBJY3d9JfXipgjCl+t+er997DD7U8MlP5qAu
	 oTSOyufu+gu5+OW5NuFSLn3Q8aqIAGvaVAWC6vn6+d72nkUTrYKtYt5KrrFqhMRl8X
	 td+rcEwi8O45g0hGAnW+xLKS7RTiRNN8YS2TG4FMWAiont+Bp150S4GUubGkNWU9LE
	 hFVMkuFwHteEEZeQVq9+OYgk+5Q6mFRGx7ZMPR/UJfhXgme5dLHIYdiubif5xGX75L
	 I1/TIEmm5JWBg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: imx219: Report streams using frame descriptors
In-Reply-To: <20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com>
References: <20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com>
Date: Fri, 14 Aug 2026 09:43:06 +0200
Message-ID: <87se4h171x.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Tomi,

Thank you for the patch.

On Thu, Jun 11, 2026 at 12:13, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Implement the .get_frame_desc() subdev operation to report information
> about streams to the connected CSI-2 receiver. This is required to let
> the CSI-2 receiver driver know about virtual channels and data types for
> each stream.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> [tomi.valkeinen: picked from "Generic line based metadata support, internal pads" series]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> This patch that adds .get_frame_desc() support to imx219 driver has been
> circulating for a few years, and is currently posted in "[PATCH v12
> 00/86] Generic line based metadata support, internal pads" series.
>
> However, as some bridge drivers require modern drivers that support
> .get_frame_desc, specifically ds90ub960.c, let's pick the patch and
> queue it separately from the huge metadata series.
> ---
>  drivers/media/i2c/imx219.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)

Note: I understand that this is not the preferred solution because there
is [1]. I still found value on testing this so:

Tested-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

Details:
This is the only patch I needed on top of linux/master to get camera
working on a TI AM69-SK.

I used a AM69-SK with the Arducam FPD V3Link[2] using
the following device tree overlays:
  ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo

See TI's documentation about this [3]

[1] https://lore.kernel.org/linux-media/20260518164318.3367888-1-sakari.ailus@linux.intel.com/
[2] https://www.arducam.com/arducam-v3link-camera-kit-for-ti-development-boards.html
[3]
https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-am69/11_00_10_01/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Camera/CSI2RX.html

Some review comment below.

>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753cc93..7829ddc115a0 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -23,6 +23,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -661,6 +662,24 @@ static void imx219_free_controls(struct imx219 *imx219)
>   * Subdev operations
>   */
>  
> +static unsigned int imx219_format_bpp(u32 code)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		return 8;
> +
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	default:
> +		return 10;
> +	}
> +}
> +

Do we need this function when we already have imx219_get_format_bpp()
which does the same thing?

>  static int imx219_set_framefmt(struct imx219 *imx219,
>  			       struct v4l2_subdev_state *state)
>  {
> @@ -969,6 +988,30 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>  	return -EINVAL;
>  }
>  
> +static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +	u32 code;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);

Do we need error handling here? v4l2_subdev_lock_and_get_active_state()
can return NULL.

> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +	code = fmt->code;
> +	v4l2_subdev_unlock_state(state);
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	fd->entry[0].pixelcode = code;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8 ?
> +		MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
> +
> +	return 0;
> +}
> +
>  static int imx219_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *state)
>  {
> @@ -995,6 +1038,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>  	.set_fmt = imx219_set_pad_format,
>  	.get_selection = imx219_get_selection,
>  	.enum_frame_size = imx219_enum_frame_size,
> +	.get_frame_desc = imx219_get_frame_desc,
>  	.enable_streams = imx219_enable_streams,
>  	.disable_streams = imx219_disable_streams,
>  };
>
> ---
> base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
> change-id: 20260611-imx219-frame-desc-9cc223b1fbd5
>
> Best regards,
> --  
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
