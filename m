Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA75396B98;
	Fri,  7 Aug 2026 06:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085594; cv=none; b=ZcO9NHYYXWgEsw5y+bdL1k27hvzBy5tEVP0Xuo2lCB8TMJzePrVUAxTfUgNpwffC9yYW3HZigvlLFF1y84gI2PLH8SCMhnEK6MOdNlKDnajehcNWin2irSA7IMFAOp3sE1kqVpiUR+THf2vDoP5TszrgCDs43di6HGSiOSB3osw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085594; c=relaxed/simple;
	bh=yPepQZ6oX7LtGSx6O0n92dNYQdzhXiPzhp4KQHX32sw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KLv+uRwCi47SAY0Ettko2L2f/sifoBWWBpqK5cmcWFFTwELCwaKJd9rOWGAJaMO41Omhf7Z+lSv+GyZNShmYnt4GPSc/p1dla0NZZF33yiro9vbzplPpWfAzBSWNtgrY/EmDEaDrgPQrDAWX1WWfDBLD1+5XZu6P5BwPPj6r8zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KJ5w4QRU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KJ5w4QRU"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:4f4:b619:ec54:a907:a006])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E38C741;
	Fri,  7 Aug 2026 08:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786085516;
	bh=yPepQZ6oX7LtGSx6O0n92dNYQdzhXiPzhp4KQHX32sw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KJ5w4QRUm/dUolFprXl3dkXV05pNzbcEQfrIlnhKkToHE3b2+QoW36QuC83dZjx4N
	 xHOFmfhaytxLTcAWNEc/H0R+qEGn+TC0NvRBzNWmBwAGInqOi16AVHx7ZxLBP5aIr/
	 coN0BJjOj8WQx0IQwaGuzz6vEQBlnbKjYHc82aPM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260806070934.21764-3-lachlan.michael@sony.com>
References: <20260806070934.21764-1-lachlan.michael@sony.com> <20260806070934.21764-3-lachlan.michael@sony.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org, Lachlan Michael <lachlan.michael@sony.com>
To: Lachlan Michael <lachlan.michael@sony.com>, devicetree@vger.kernel.org, hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com
Date: Fri, 07 Aug 2026 12:23:02 +0530
Message-ID: <178608558219.4139729.1786136799159384307@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Lachlan,

Thank you for the patch!

The driver is mostly in good shape, except a few small things and requests
for information that Sony is in the best position to help us with.

Quoting Lachlan Michael (2026-08-06 12:39:34)
> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> with a MIPI CSI-2 output interface, configurable as either 2 or 4
> data lanes.
>=20
> Add a V4L2 sub-device driver for the sensor. The driver supports
> RAW10 and RAW12 output formats, exposure and analogue gain controls,
> horizontal and vertical flipping, horizontal and vertical blanking
> controls, window cropping and test pattern generation.
>=20
> HDR modes and RAW16 output are not currently supported.
>=20
> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
> ---
> Changes in v2:
> - Treat the pixel rate as a fixed sensor property (594 MHz, 8 px/clock),
>   read-only.
> - Compute HMAX from both the array and MIPI link floors.
> - Express HBLANK in pixels with a step of 8; keep HMAX fixed in crop
>   mode.
> - Drop struct imx908_mode; cache hmax/vmax directly.
> - Change the link-frequency table to s64.
> - Fix the probe error-unwind ordering.
> - Be silent on success (chip ID print is now dev_dbg).
> - Drop redundant comments.
> - Kconfig: fix a "module will be called" typo.

[...]

> +#define IMX908_EXPOSURE_MIN    1
> +#define IMX908_EXPOSURE_STEP   1
> +
> +/* ---- Speed of internal clock */
> +#define IMX908_XHS_HZ          74250000ULL
> +
> +/* Fixed pixel rate: column ADC reads 8 pixels per 74.25 MHz clock */
> +#define IMX908_PIX_PER_CLK     8U

Can you confirm if the hardware is actually doing this, or this is just a
guess like I had made for IMX678?

It's ideal to know what the hardware does to better calculate minimum HMAX
value for cropped modes for Starvis2/3 sensors in future.

> +#define IMX908_PIXEL_RATE      (IMX908_XHS_HZ * IMX908_PIX_PER_CLK)    /=
* 594 MHz */
> +
> +/* ---- Subdev Pads */
> +#define IMX908_SOURCE_PAD      0
> +
> +#define IMX908_DEFAULT_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
> +
> +/*
> + * IMX908 total area includes active area height plus
> + *  4 pixels effective pixel ignored area
> + * 10 pixels vertical direction effective OB
> + * 10 pixels OB side ignored area
> + */
> +static const struct v4l2_rect imx908_total_area =3D {
> +       .top =3D 0,
> +       .left =3D 0,
> +       .width =3D 3856,
> +       .height =3D 2200,
> +};
> +
> +static const struct v4l2_rect imx908_active_area =3D {
> +       .top =3D 0,
> +       .left =3D 0,
> +       .width =3D 3856,
> +       .height =3D 2176,
> +};
> +
> +/* Recommended 4K recording area centered within the active area */
> +static const struct v4l2_rect imx908_recording_area =3D {
> +       .top =3D 8,
> +       .left =3D 8,
> +       .width =3D 3840,
> +       .height =3D 2160,

If I understand correctly it's better if the sensor captures common
resolutions like 1080p or 2160p with some margin, as some ISPs might need
to discard a few pixels during de-bayer color processing.

Another comment on this below in imx908_get_selection().

[...]

> +struct imx908 {
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +       struct device *dev;
> +
> +       struct regmap *cci;
> +
> +       struct clk *xclk;
> +       struct gpio_desc *reset_gpio;
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx908_supply_name=
s)];
> +
> +       u8  inck_sel;

nit: extra space

> +
> +       u8 num_lanes;
> +       unsigned long link_freq_bitmap;
> +       unsigned int link_freq_idx;
> +
> +       /* Cached current sensor timing */
> +       u16 hmax;       /* clocks per line */
> +       u32 vmax;       /* lines per frame */
> +
> +       struct {
> +               struct v4l2_ctrl_handler handler;
> +
> +               struct v4l2_ctrl *pixel_rate;   /* fixed, read-only */

You can drop this as it is not used by the driver after init.

> +               struct v4l2_ctrl *exposure;
> +               struct v4l2_ctrl *vblank;
> +               struct v4l2_ctrl *hblank;
> +               struct v4l2_ctrl *test_pattern;

Same here.

> +       } ctrls;
> +};
> +
> +static inline struct imx908 *to_imx908(struct v4l2_subdev *_sd)
> +{
> +       return container_of(_sd, struct imx908, sd);
> +}
> +

[...]

> +static u32 imx908_calc_link_min_hmax(struct imx908 *imx, u32 width, u8 b=
pp)
> +{
> +       u64 link_hz =3D imx908_link_freqs[imx->link_freq_idx];
> +       u64 num =3D (u64)width * bpp * IMX908_XHS_HZ;
> +       u64 den =3D (u64)imx->num_lanes * link_hz * 2; /* DDR */
> +
> +       /*
> +        * den can exceed 32 bits (e.g. 4 lanes * 720 MHz * 2 =3D 5.76 GH=
z), so
> +        * DIV_ROUND_UP_ULL / do_div would truncate the divisor to u32. U=
se a
> +        * full 64/64 division.
> +        */
> +       return DIV64_U64_ROUND_UP(num, den);

Have you tested the lowest values generated here on the sensor? I tend to
agree with Dave's comment on the missing margin, but I don't know enough
about the sensor internals.

It would be helpful if Sony can provide info on the interface between the
pixel array (producer) and MIPI (consumer), if there is a FIFO in between,
and if they have separate PLL clock trees and pixel rates, or use the same
74.25 Mhz clock as your code suggests. And of course what kind of margins
are needed on the blankings.

Does Sony have some internal spreadsheet or tool to figure this out and
populate the recommended values in the "4. Operating Mode" table in the
SRM? We could do the same calculation in the driver directly, this would
help us support free-configuration of crop and HBLANK values for different
usecases.

> +}
> +

[...]

> +/* --------------------------- V4L2 controls ---------------------------=
--- */
> +
> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct imx908 *imx =3D container_of(ctrl->handler, struct imx908,
> +                                         ctrls.handler);
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *format;
> +       int ret =3D 0;
> +
> +       state =3D v4l2_subdev_get_locked_active_state(&imx->sd);
> +       format =3D v4l2_subdev_state_get_format(state, IMX908_SOURCE_PAD);
> +
> +       /* Update exposure control limits even if the sensor is not strea=
ming */
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               const struct v4l2_rect *crop;
> +
> +               crop =3D v4l2_subdev_state_get_crop(state, IMX908_SOURCE_=
PAD);
> +
> +               u32 min_vblank =3D imx908_calc_min_vblank(crop);
> +               u32 max_vblank =3D imx908_calc_max_vblank(format->height);
> +               u32 vblank =3D clamp_t(u32, ctrl->val, min_vblank, max_vb=
lank);
> +
> +               imx->vmax =3D imx908_calc_vmax(format->height, vblank);
> +
> +               __v4l2_ctrl_modify_range(imx->ctrls.exposure,
> +                                        IMX908_EXPOSURE_MIN,
> +                                        imx->vmax - IMX908_MIN_SHR0,
> +                                        IMX908_EXPOSURE_STEP,
> +                                        imx->ctrls.exposure->default_val=
ue);
> +       }
> +
> +       /* Hardware writes only when powered; cached ctrls applied on res=
ume */
> +       ret =3D pm_runtime_get_if_in_use(imx->dev);
> +       if (ret <=3D 0)

This should early return only in the case of ret =3D=3D 0, as the function
returns negative error code if the PM framework is disabled (CONFIG_PM=3Dn),
in which case we should proceed to update the sensor registers below.

I believe what you did in v1 was correct, but maybe got misled by the LLM
bot? I have opened a bug report for it:
https://github.com/sashiko-dev/sashiko/issues/396

> +               return ret;
> +       ret =3D 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               ret =3D imx908_set_exposure_lines(imx, ctrl->val);
> +               break;
> +
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               cci_write(imx->cci, IMX908_REG_GAIN, ctrl->val, &ret);
> +               break;
> +
> +       case V4L2_CID_VBLANK:
> +               ret =3D cci_write(imx->cci, IMX908_REG_VMAX, imx->vmax, N=
ULL);
> +               /* SHR0 derived from VMAX, re-apply exposure after change=
s */
> +               if (!ret)
> +                       ret =3D imx908_set_exposure_lines(imx,
> +                                                       imx->ctrls.exposu=
re->val);
> +
> +               break;
> +
> +       case V4L2_CID_HBLANK: {
> +               const struct v4l2_rect *crop;
> +
> +               crop =3D v4l2_subdev_state_get_crop(state, IMX908_SOURCE_=
PAD);
> +
> +               /* HBLANK drives HMAX only in all-pixel; crop HMAX is fix=
ed */
> +               if (v4l2_rect_equal(crop, &imx908_active_area))
> +                       imx->hmax =3D imx908_calc_hmax(format->width, ctr=
l->val);
> +
> +               cci_write(imx->cci, IMX908_REG_HMAX, imx->hmax, &ret);
> +               break;
> +       }
> +
> +       case V4L2_CID_PIXEL_RATE:
> +       case V4L2_CID_LINK_FREQ:
> +               break;
> +

You can drop the above block. RO controls should never reach here.

> +       case V4L2_CID_TEST_PATTERN:
> +               ret =3D imx908_update_test_pattern(imx, ctrl->val);
> +               break;
> +
> +       case V4L2_CID_HFLIP:
> +               cci_write(imx->cci, IMX908_REG_HREVERSE, ctrl->val, &ret);
> +               break;
> +
> +       case V4L2_CID_VFLIP:
> +               cci_write(imx->cci, IMX908_REG_VREVERSE, ctrl->val, &ret);
> +               break;
> +
> +       default:
> +               dev_warn(imx->dev,
> +                        "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +                        ctrl->id, ctrl->val);
> +               break;
> +       }
> +
> +       pm_runtime_put(imx->dev);
> +       return ret;
> +}
> +

[...]

> +static int imx908_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *sd_state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state,
> +                                                    IMX908_SOURCE_PAD);
> +               return 0;
> +
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r =3D imx908_total_area;
> +               return 0;
> +
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +               sel->r =3D imx908_recording_area;
> +               return 0;

Kernel doc "8.1.1 Selection targets" for V4L2_SEL_TGT_CROP_DEFAULT:

    Suggested cropping rectangle that covers the =E2=80=9Cwhole picture=E2=
=80=9D. This
    includes only active pixels and excludes other non-active pixels such
    as black pixels.

I believe this means CROP_DEFAULT should include the active non-black
pixels that are supposed to be used as a margin.

In init_state() the driver configures the rectangle to imx908_active_area,
which is the correct thing to do.

Maybe you can drop imx908_recording_area altogether?

> +
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               sel->r =3D imx908_active_area;
> +               return 0;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int imx908_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                u32 pad,
> +                                u64 streams_mask)
> +{
> +       struct imx908 *imx =3D to_imx908(sd);
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(imx->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D imx908_start_streaming(imx, sd_state);
> +       if (ret) {
> +               pm_runtime_mark_last_busy(imx->dev);

Drop.

pm_runtime_put_autosuspend() calls pm_runtime_mark_last_busy() for you.

> +               pm_runtime_put_autosuspend(imx->dev);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx908_disable_streams(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *sd_state,
> +                                 u32 pad,
> +                                 u64 streams_mask)
> +{
> +       struct imx908 *imx =3D to_imx908(sd);
> +       int ret;
> +
> +       ret =3D imx908_stop_streaming(imx);
> +
> +       pm_runtime_mark_last_busy(imx->dev);

Same here and anywehere else.

> +       pm_runtime_put_autosuspend(imx->dev);
> +
> +       return ret;
> +}
> +
> +static int imx908_init_state(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *sd_state)
> +{
> +       struct v4l2_subdev_selection sel =3D {
> +               .which  =3D V4L2_SUBDEV_FORMAT_TRY,
> +               .pad    =3D IMX908_SOURCE_PAD,
> +               .target =3D V4L2_SEL_TGT_CROP,
> +               .r      =3D imx908_active_area,
> +       };
> +       struct v4l2_subdev_format fmt =3D {
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,
> +               .pad   =3D IMX908_SOURCE_PAD,
> +               .format =3D {
> +                       .code   =3D IMX908_DEFAULT_MBUS_CODE,
> +                       .width  =3D imx908_active_area.width,
> +                       .height =3D imx908_active_area.height,
> +               },
> +       };
> +
> +       imx908_set_selection(sd, sd_state, &sel);
> +       imx908_set_pad_format(sd, sd_state, &fmt);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops imx908_core_ops =3D {
> +       .subscribe_event   =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};

Drop.
See 17971a430ff9 ("media: i2c: Drop HAS_EVENTS and event handlers")

> +
> +static const struct v4l2_subdev_video_ops imx908_video_ops =3D {
> +       .s_stream =3D v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx908_pad_ops =3D {
> +       .enum_mbus_code      =3D imx908_enum_mbus_code,
> +       .enum_frame_size     =3D imx908_enum_frame_size,
> +       .get_fmt             =3D v4l2_subdev_get_fmt,
> +       .set_fmt             =3D imx908_set_pad_format,
> +       .get_selection       =3D imx908_get_selection,
> +       .set_selection       =3D imx908_set_selection,
> +       .enable_streams      =3D imx908_enable_streams,
> +       .disable_streams     =3D imx908_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx908_internal_ops =3D {
> +       .init_state =3D imx908_init_state,
> +};
> +
> +static const struct v4l2_subdev_ops imx908_subdev_ops =3D {
> +       .core  =3D &imx908_core_ops,
> +       .video =3D &imx908_video_ops,
> +       .pad   =3D &imx908_pad_ops,
> +};
> +
> +/* ----------------------- Power management ---------------------- */
> +
> +static int imx908_power_on(struct imx908 *imx)
> +{
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(imx908_supply_names),
> +                                   imx->supplies);
> +       if (ret) {
> +               dev_err(imx->dev, "failed to enable regulators\n");
> +               return ret;
> +       }
> +       msleep(200); /* IMX908 power ok after 200ms */

If there is a required delay for stabilization after the power supplies
come up, that delay is usually modeled as `startup-delay-us =3D <200000>` in
the device tree node for the regulator(s) so that regulator_bulk_enable()
includes it.

> +
> +       if (imx->reset_gpio) {

Not needed as the below function handles optional GPIOs.

> +               gpiod_set_value_cansleep(imx->reset_gpio, 1); /* XCLR low=
 */

Drop, the reset is asserted because it was initialized as GPIOD_OUT_HIGH.

> +               udelay(1); /* >=3D 500ns T_low */
> +               gpiod_set_value_cansleep(imx->reset_gpio, 0); /* Sensor s=
tart */
> +       }
> +
> +       ret =3D clk_prepare_enable(imx->xclk);
> +       if (ret) {
> +               dev_err(imx->dev, "failed to enable xclk: %d\n", ret);
> +               goto err_reset;
> +       }
> +
> +       /* T_1 >=3D20us delay before initial SDA/SCL */
> +       usleep_range(20, 25);
> +
> +       return 0;
> +
> +err_reset:
> +       gpiod_set_value_cansleep(imx->reset_gpio, 1); /* assert reset */
> +       regulator_bulk_disable(ARRAY_SIZE(imx908_supply_names), imx->supp=
lies);
> +       return ret;
> +}
> +

[...]

> +static int imx908_parse_fwnode(struct imx908 *imx)
> +{
> +       struct fwnode_handle *ep;
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> +       };
> +       int ret =3D 0;
> +
> +       ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(imx->dev), NULL);
> +       if (!ep) {
> +               dev_err(imx->dev, "failed to find endpoint in device tree=
\n");
> +               return -ENXIO;
> +       }
> +
> +       /* Only data-lanes and link-frequencies are used from the endpoin=
t */
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +       fwnode_handle_put(ep);
> +       if (ret)
> +               return ret;
> +
> +       imx->num_lanes =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
> +
> +       if (imx->num_lanes !=3D 2 && imx->num_lanes !=3D 4) {
> +               dev_err(imx->dev,
> +                       "only 2 or 4 CSI-2 data lanes are supported (got =
%u)\n",
> +                       imx->num_lanes);
> +               ret =3D -EINVAL;
> +               goto out_free;
> +       }
> +
> +       ret =3D v4l2_link_freq_to_bitmap(imx->dev,
> +                                      bus_cfg.link_frequencies,
> +                                      bus_cfg.nr_of_link_frequencies,
> +                                      imx908_link_freqs,
> +                                      ARRAY_SIZE(imx908_link_freqs),
> +                                      &imx->link_freq_bitmap);
> +       if (ret) {
> +               dev_err(imx->dev, "failed to parse link frequencies from =
DT\n");
> +               goto out_free;
> +       }
> +
> +       if (bitmap_empty(&imx->link_freq_bitmap, ARRAY_SIZE(imx908_link_f=
reqs))) {

Isn't this handled by -ENOENT retval of v4l2_link_freq_to_bitmap() ?

> +               dev_err(imx->dev,
> +                       "no common link frequencies between driver and DT=
\n");
> +               ret =3D -EINVAL;
> +               goto out_free;
> +       }
> +
> +       imx->link_freq_idx =3D __ffs(imx->link_freq_bitmap);
> +       dev_dbg(imx->dev, "using %u lanes at link freq %llu Hz\n",
> +               imx->num_lanes, imx908_link_freqs[imx->link_freq_idx]);
> +
> +out_free:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +       return ret;
> +}
> +
> +static int imx908_init_controls(struct imx908 *imx)
> +{
> +       struct v4l2_ctrl_handler *hdl =3D &imx->ctrls.handler;
> +       struct v4l2_fwnode_device_properties props;
> +       struct v4l2_ctrl *link_freq_ctl;
> +       int ret;
> +
> +       ret =3D v4l2_ctrl_handler_init(hdl, 11);
> +       if (ret)
> +               return ret;
> +
> +       imx->ctrls.pixel_rate =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +                                                 V4L2_CID_PIXEL_RATE,
> +                                                 IMX908_PIXEL_RATE,
> +                                                 IMX908_PIXEL_RATE, 1,
> +                                                 IMX908_PIXEL_RATE);
> +       if (imx->ctrls.pixel_rate)
> +               imx->ctrls.pixel_rate->flags |=3D V4L2_CTRL_FLAG_READ_ONL=
Y;

Not needed, PIXEL_RATE is marked as RO by the control framework

> +
> +       link_freq_ctl =3D v4l2_ctrl_new_int_menu(hdl, &imx908_ctrl_ops,
> +                                              V4L2_CID_LINK_FREQ,
> +                                              ARRAY_SIZE(imx908_link_fre=
qs) - 1,
> +                                              imx->link_freq_idx,
> +                                              imx908_link_freqs);
> +
> +       if (link_freq_ctl)
> +               link_freq_ctl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       imx->hmax =3D IMX908_HMAX_DEFAULT;
> +       imx->vmax =3D IMX908_VMAX_DEFAULT;
> +
> +       u32 min_vblank =3D IMX908_VMAX_DEFAULT - imx908_active_area.heigh=
t;
> +       u32 max_vblank =3D imx908_calc_max_vblank(imx908_active_area.heig=
ht);
> +
> +       imx->ctrls.vblank =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +                                             V4L2_CID_VBLANK,
> +                                             min_vblank,
> +                                             max_vblank,
> +                                             1,
> +                                             min_vblank);
> +
> +       u8 bpp =3D imx908_bits_per_pixel(IMX908_DEFAULT_MBUS_CODE);
> +       u16 min_hmax =3D imx908_calc_min_hmax(imx, imx908_active_area.wid=
th, bpp);
> +       u32 min_hblank =3D imx908_hmax_to_hblank(min_hmax,
> +                                              imx908_active_area.width);
> +       u32 max_hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_MAX,
> +                                              imx908_active_area.width);
> +       u32 hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_DEFAULT,
> +                                          imx908_active_area.width);
> +
> +       /* Default HMAX can be infeasible at low link freqs; clamp into r=
ange */
> +       hblank =3D clamp_t(u32, hblank, min_hblank, max_hblank);
> +
> +       /* Keep cached HMAX consistent with the clamped default */
> +       imx->hmax =3D imx908_calc_hmax(imx908_active_area.width, hblank);
> +
> +       imx->ctrls.hblank =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +                                             V4L2_CID_HBLANK,
> +                                             min_hblank,
> +                                             max_hblank,
> +                                             IMX908_PIX_PER_CLK,
> +                                             hblank);
> +       u32 max_exp =3D IMX908_VMAX_DEFAULT - IMX908_MIN_SHR0;
> +
> +       imx->ctrls.exposure =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +                                               V4L2_CID_EXPOSURE,
> +                                               IMX908_EXPOSURE_MIN,
> +                                               max_exp,
> +                                               IMX908_EXPOSURE_STEP,
> +                                               max_exp / 2);
> +
> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +                         IMX908_ANA_GAIN_MIN, IMX908_ANA_GAIN_MAX,
> +                         IMX908_ANA_GAIN_STEP, IMX908_ANA_GAIN_DEFAULT);
> +
> +       /* Set test pattern. Menu (13 entries: Disabled + 12 patterns) */
> +       imx->ctrls.test_pattern =3D v4l2_ctrl_new_std_menu_items(hdl,
> +                                                              &imx908_ct=
rl_ops,
> +                                                              V4L2_CID_T=
EST_PATTERN,
> +                                                              ARRAY_SIZE=
(imx908_tpg_menu) - 1,
> +                                                              0,
> +                                                              0,
> +                                                              imx908_tpg=
_menu);
> +       if (imx->ctrls.test_pattern)
> +               imx->ctrls.test_pattern->flags |=3D V4L2_CTRL_FLAG_EXECUT=
E_ON_WRITE;
> +

Any particular reason to use this?
I've never needed this for test pattern control before.

> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1,=
 0);
> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1,=
 0);
> +
> +       /* Read rotation and orientation properties from the firmware nod=
e */
> +       ret =3D v4l2_fwnode_device_parse(imx->dev, &props);
> +       if (ret)
> +               goto err_free;

nit: You could move this section before v4l2_ctrl_handler_init() to
simplify error handling and get rid of the goto.

> +
> +       v4l2_ctrl_new_fwnode_properties(hdl, &imx908_ctrl_ops, &props);
> +       if (hdl->error) {
> +               ret =3D hdl->error;
> +               goto err_free;
> +       }
> +
> +       imx->sd.ctrl_handler =3D hdl;
> +
> +       return 0;
> +
> +err_free:
> +       v4l2_ctrl_handler_free(hdl);
> +       return ret;
> +}

[...]

> +static int imx908_probe(struct i2c_client *client)
> +{
> +       struct imx908 *imx;
> +       int ret;
> +
> +       imx =3D devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);
> +       if (!imx)
> +               return -ENOMEM;
> +       imx->dev =3D &client->dev;
> +
> +       v4l2_i2c_subdev_init(&imx->sd, client, &imx908_subdev_ops);
> +       imx->sd.internal_ops =3D &imx908_internal_ops;
> +
> +       imx->cci =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx->cci))
> +               return dev_err_probe(&client->dev, PTR_ERR(imx->cci),
> +                                    "CCI regmap init failed\n");
> +
> +       imx->xclk =3D devm_clk_get(imx->dev, NULL);
> +       if (IS_ERR(imx->xclk))
> +               return dev_err_probe(imx->dev, PTR_ERR(imx->xclk),
> +                                    "failed to get clock\n");
> +
> +       ret =3D imx908_get_inck_sel(imx, clk_get_rate(imx->xclk));
> +       if (ret)
> +               return ret;
> +
> +       imx->reset_gpio =3D devm_gpiod_get_optional(imx->dev, "reset",
> +                                                 GPIOD_OUT_HIGH);
> +
> +       if (IS_ERR(imx->reset_gpio))
> +               return dev_err_probe(imx->dev, PTR_ERR(imx->reset_gpio),
> +                                    "failed to get reset gpio\n");
> +
> +       ret =3D imx908_get_regulators(imx);
> +       if (ret)
> +               return dev_err_probe(&client->dev, ret,
> +                                    "failed to get regulators\n");
> +
> +       ret =3D imx908_parse_fwnode(imx);
> +       if (ret)
> +               return dev_err_probe(&client->dev, ret,
> +                                    "device tree parse failed\n");
> +
> +       ret =3D imx908_power_on(imx);
> +       if (ret)
> +               return dev_err_probe(&client->dev, ret, "power-on failed\=
n");
> +
> +       ret =3D imx908_identify_model(imx);
> +       if (ret) {
> +               dev_err(imx->dev, "failed to identify model: %d\n", ret);
> +               goto err_power_off;
> +       }
> +
> +       pm_runtime_set_active(imx->dev);
> +       pm_runtime_enable(imx->dev);
> +
> +       ret =3D imx908_init_controls(imx);
> +       if (ret)
> +               goto err_pm_disable;
> +
> +       imx->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HA=
S_EVENTS;

Drop.
See 17971a430ff9 ("media: i2c: Drop HAS_EVENTS and event handlers")

> +       imx->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +       imx->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       ret =3D media_entity_pads_init(&imx->sd.entity, 1, &imx->pad);
> +       if (ret)
> +               goto err_hdl;
> +
> +       /* Share the ctrl handler lock so s_ctrl can access the locked st=
ate */
> +       imx->sd.state_lock =3D imx->ctrls.handler.lock;
> +
> +       ret =3D v4l2_subdev_init_finalize(&imx->sd);
> +       if (ret)
> +               goto err_entity;
> +
> +       pm_runtime_set_autosuspend_delay(imx->dev, 1000);
> +       pm_runtime_use_autosuspend(imx->dev);
> +       pm_runtime_mark_last_busy(imx->dev);
> +

Missing pm_runtime_idle(), and this whole block should probably go just
before the `return 0`.

[...]

Thanks,
    Jai
