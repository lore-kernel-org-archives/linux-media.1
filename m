Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494442CB09;
	Mon, 20 Jul 2026 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558670; cv=none; b=t+Pags6CAfhzLwNoYBLrXyqo4wh264OnYV0TdbvezvHpUSMgYgvAZW8ogZmy4+yMFtT7JrVVXFNEztdEZv0R7OsFnwaC/Bh6w5OHz7o14uXJw/EfbWQVz4zPMuxQNuOr4kbCKIhBGGCm9miWgLX9Xmoms9yz53Ptk7bkuuNuBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558670; c=relaxed/simple;
	bh=a3VOGkH58Jx/h25Gt0mMTXhlHl4dYcPEWnFqKN7VmFw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=U5jm0rK5HkD8Lii13UxTjxYnqlP5B4IYure3gFd7zQCjL5esMP5U0uq0XI2/UA5tCDSbkm686RfEb/rBmeenMs3Nh5Tft+XPMnH6l/fdIShSaV7hqywVRNhDLwMU4TFpv2Mm1UlSn2jSDM3zMafSzwxLAYwR6fjQKqSX4AKIXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i0REGxk5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i0REGxk5"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40DBE270;
	Mon, 20 Jul 2026 16:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784558607;
	bh=a3VOGkH58Jx/h25Gt0mMTXhlHl4dYcPEWnFqKN7VmFw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i0REGxk5dgSn9rFm+wkulm2Yqg/IdEkUeEjuHVtT06xd4U31u4S3kJ/sF4NDSsbkp
	 CQMbQcWT2sSEi5s2k+6GnB9XfehsWbndRuRn9zusHl42eGNC09yHWsHEvGFyW+pNJk
	 mHBZZJm8to2FVW5H9rltXt4kutnjjBjhl5jcAKjA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com> <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Jul 2026 20:14:21 +0530
Message-ID: <178455866124.1426769.18237320419273419942@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Dave, Alexander,

Quoting Dave Stevenson (2026-03-13 01:20:15)
> Hi Alexander
>=20
> On Thu, 12 Mar 2026 at 15:11, Alexander Shiyan
> <eagle.alexander923@gmail.com> wrote:
> >
> > This patch adds a V4L2 subdevice driver for the Sony IMX662 CMOS image
> > sensor. The sensor has a native resolution of 1936x1100 (effective
> > 1920x1080) and can achieve up to 90 frames per second depending on
> > the configuration. The driver supports:
> > - MIPI CSI-2 with 2 or 4 data lanes.
> > - RAW10 and RAW12 formats (both colour and monochrome).
> > - Controls: exposure, analogue gain, horizontal/vertical blanking,
> >   horizontal/vertical flip, brightness.
> > - A placeholder V4L2_CID_HDR_SENSOR_MODE control for future Clear HDR
> >   support (the actual HDR modes are not yet implemented).
> > - Runtime PM.
> > - Cropping via the selection API.
> > - Multiple link frequencies selectable via device tree.
> >
> > Tested on ARM64 Rockchip RK3568 platform with a 24 MHz external clock
> > and various link frequencies.
>=20
> Interesting timing as I've been looking at IMX662 too, but on a Raspberry=
 Pi.
> FWIW my driver is at
> https://github.com/6by9/linux/blob/rpi-6.12.y-imx662/drivers/media/i2c/im=
x662.c
>=20

I saw libcamera patches for IMX676, does the below branch have the latest
driver you plan to post as v2?

https://github.com/6by9/linux/blob/rpi-6.18.y-imx662-mainline-clean/drivers=
/media/i2c/imx662.c=20

> Comments are based on brief testing and reading of the code. This is
> not a full review.
>=20
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

[...]

> > +static int imx662_set_selection(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_selection *sel)
> > +{

Can we keep cropping and binning out of the initial driver, and implement
it using the common raw sensor model directly?

I did it for IMX678 [1] on Sakari's suggestion [2]. The two sensors are
quite similar, so I'm happy to help in whatever way I can on getting this
working with the new model too :-)

[1]: https://lore.kernel.org/all/20260703-imx678-meta-v1-0-7c4924a0df05@ide=
asonboard.com/
[2]: https://lore.kernel.org/all/ag7oq5jO5G0rwvzb@kekkonen.localdomain/

Thanks,
    Jai

> > +       struct imx662 *imx662 =3D to_imx662(sd);
> > +       struct v4l2_rect rect =3D sel->r;
> > +       struct v4l2_rect *try_crop;
> > +       struct v4l2_mbus_framefmt *try_fmt;
> > +       u32 max_left, max_top;
> > +
> > +       if (sel->target !=3D V4L2_SEL_TGT_CROP)
> > +               return -EINVAL;
> > +
> > +       max_left =3D IMX662_PIXEL_ARRAY_LEFT + IMX662_PIXEL_ARRAY_WIDTH=
 -
> > +                  IMX662_MIN_CROP_WIDTH;
> > +       max_top =3D IMX662_PIXEL_ARRAY_TOP + IMX662_PIXEL_ARRAY_HEIGHT -
> > +                 IMX662_MIN_CROP_HEIGHT;
> > +
> > +       rect.left =3D clamp_t(u32, rect.left, IMX662_PIXEL_ARRAY_LEFT, =
max_left);
> > +       rect.top =3D clamp_t(u32, rect.top, IMX662_PIXEL_ARRAY_TOP, max=
_top);
> > +
> > +       rect.width =3D
> > +               clamp_t(u32,
> > +                       round_down(rect.width, IMX662_CROP_WIDTH_STEP),
> > +                       IMX662_MIN_CROP_WIDTH, IMX662_PIXEL_ARRAY_WIDTH=
);
> > +       rect.height =3D
> > +               clamp_t(u32,
> > +                       round_down(rect.height, IMX662_CROP_HEIGHT_STEP=
),
> > +                       IMX662_MIN_CROP_HEIGHT, IMX662_PIXEL_ARRAY_HEIG=
HT);
> > +
> > +       if (rect.left + rect.width - 1 >
> > +           IMX662_PIXEL_ARRAY_LEFT + IMX662_PIXEL_ARRAY_WIDTH - 1)
> > +               rect.left =3D
> > +                       IMX662_PIXEL_ARRAY_LEFT + IMX662_PIXEL_ARRAY_WI=
DTH -
> > +                       rect.width;
> > +       if (rect.top + rect.height - 1 >
> > +           IMX662_PIXEL_ARRAY_TOP + IMX662_PIXEL_ARRAY_HEIGHT - 1)
> > +               rect.top =3D
> > +                       IMX662_PIXEL_ARRAY_TOP + IMX662_PIXEL_ARRAY_HEI=
GHT -
> > +                       rect.height;
> > +
> > +       if (sel->flags & V4L2_SEL_FLAG_GE) {
> > +               if (rect.width < sel->r.width) {
> > +                       u32 new_width =3D rect.width + IMX662_CROP_WIDT=
H_STEP;
> > +
> > +                       if (new_width <=3D IMX662_PIXEL_ARRAY_WIDTH)
> > +                               rect.width =3D new_width;
> > +               }
> > +               if (rect.height < sel->r.height) {
> > +                       u32 new_height =3D rect.height + IMX662_CROP_HE=
IGHT_STEP;
> > +
> > +                       if (new_height <=3D IMX662_PIXEL_ARRAY_HEIGHT)
> > +                               rect.height =3D new_height;
> > +               }
> > +       }
> > +
> > +       if (sel->flags & V4L2_SEL_FLAG_LE) {
> > +               if (rect.width > sel->r.width &&
> > +                   rect.width >=3D IMX662_MIN_CROP_WIDTH +
> > +                                 IMX662_CROP_WIDTH_STEP)
> > +                       rect.width -=3D IMX662_CROP_WIDTH_STEP;
> > +               if (rect.height > sel->r.height &&
> > +                   rect.height >=3D IMX662_MIN_CROP_HEIGHT +
> > +                                  IMX662_CROP_HEIGHT_STEP)
> > +                       rect.height -=3D IMX662_CROP_HEIGHT_STEP;
> > +       }
> > +
> > +       if (rect.width < IMX662_MIN_CROP_WIDTH ||
> > +           rect.height < IMX662_MIN_CROP_HEIGHT)
> > +               return -EINVAL;
> > +
> > +       if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +               try_crop =3D v4l2_subdev_state_get_crop(sd_state, sel->=
pad);
> > +               *try_crop =3D rect;
> > +
> > +               try_fmt =3D v4l2_subdev_state_get_format(sd_state, sel-=
>pad);
> > +               if (try_fmt) {
> > +                       try_fmt->width =3D rect.width;
> > +                       try_fmt->height =3D rect.height;
> > +               }
> > +       } else {
> > +               if (imx662->streaming)
> > +                       return -EBUSY;
> > +
> > +               if (imx662->crop.left =3D=3D rect.left &&
> > +                   imx662->crop.top =3D=3D rect.top &&
> > +                   imx662->crop.width =3D=3D rect.width &&
> > +                   imx662->crop.height =3D=3D rect.height) {
> > +                       sel->r =3D rect;
> > +                       return 0;
> > +               }
> > +
> > +               imx662->crop =3D rect;
> > +
> > +               try_fmt =3D v4l2_subdev_state_get_format(sd_state, sel-=
>pad);
> > +               if (try_fmt) {
> > +                       try_fmt->width =3D rect.width;
> > +                       try_fmt->height =3D rect.height;
> > +               }
> > +
> > +               imx662_set_framing_limits(imx662);
> > +       }
> > +
> > +       sel->r =3D rect;
> > +
> > +       return 0;
> > +}

[...]
