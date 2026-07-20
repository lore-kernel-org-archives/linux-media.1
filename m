Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD5446828
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 17:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784569196; cv=pass; b=iX0JJ0/GZxnsIKYeHRxqlcxf9PM3zBDVMg14WzkKGbkBhFbv1uYst7VI/p32VeMJguMtDMEG86qwy5bVBNO4FXF8i2TJMMKHQbYJ9tMtWwTMm3zJLLJpN199u53iOj5GK0mQcZCncjeeZMMN4vBLJ6WrGGJjGc52LEcK0tMTdRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784569196; c=relaxed/simple;
	bh=BxvyqAlxxHNtMrGACF1RkPO899OmYHXPbPq46pqE2eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5hf4VJgVskmt/QU0Y/rRFgJnjyT4syKDsOxQcSNUB9eOm47VbTPhczI4XkwyvKdu162w9Pc2pO3VWKayNqJtS990Prj6IemMPdVQKBaOPHFfkumf0DNe80NdEJ9gcBJbI4c23Ap5/uCnN4UVW8aagx35UBaoCujRa8GrZywg/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=RBrQ7+Xk; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="RBrQ7+Xk"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4569e871502so930905fac.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 10:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784569193; cv=none;
        d=google.com; s=arc-20260327;
        b=awSd8VgACuvqOwkio6AsqjQft3B3W1CgINiW22CWB0PlY6RXLujW9amH9cx5P2KlWg
         WM5MGYta/VVye/4gyGibH7aWJucTNLt8EE4qfPlwnc79jQoSvefGxgc3FbQQQ9fv91Ta
         +DAoqL/HC/tRFE9/S1rJlJT8IoyQwsIymUxtVP8u4lWzImktF/21q49fqEt8mU9R7QM0
         U01MTKTJZRmWCK6F+WT81VXYXyMhhzoSzVoPsoNB0ybfA0vc/qx9JYubeNri+CVyCPA6
         pibu2VMZXDy6Q1aMESd6O/a5mluQBVwgv1DOq5h/d1qsGcIAJYWPZOM3VSQ3BUo5yjvY
         BvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3lKAeinKY7QQ7aApRoqVHwNvB8IJpXz6tyJrSSgZ8Gg=;
        fh=i+5gB6cErDDqg1nDK9qkUtAx8yy66Bxvj+wfpkhvLQw=;
        b=ZugI3PRV8zODlZKq5H9Mez+igJBxvEkBrUkD939SvQwUisy+QZTorIyrjyCv6cMfj0
         /K3NKYplv4UNlJa4BqVXX6pBNoGOhVUcsI/iXmUPQDH9I3CVCzKMFKOc5ay9hQDC4zwe
         r6/O+X6jXiPGOEyIik44IkubndSgERAW5Oe4B8K+wz5vnSzSQlyNQnG3MVITtyiFXrWN
         W1v/M2ZyIX21BLyKhj5BidNqKtU3vYJOCuE6JLnWGR+A+wMmp50k6CI6QnwAYi6aH+Ql
         OJ+E+8eZUWXgmq+y3uiECHY4Nto6jUYjDnQGbKv1b0ppiGfexseNaKYX6AbL31Caw4pI
         HIaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784569193; x=1785173993; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lKAeinKY7QQ7aApRoqVHwNvB8IJpXz6tyJrSSgZ8Gg=;
        b=RBrQ7+Xkuhz+G6sltUGrrdpEIAj4B7eqRMMSsnlRpOqwzWicBpreYFzIuXsGfYmlvS
         w8H6JL7rIjg8+XaU8uj8miQbvls9+MNHUDXw76NxLbykWSwNueX74EZeTQAneUry5gQ4
         5a6zmAoJYKJZZU+e3iqR/QmEqAWQB+HAJX0lnQOJJXQ61SKohtUKhezz9z6qEegvYAaI
         84BT5qyaVwOXUjpNrS8etDofGPsv2+46dAeHTvDJD0hQ5L457rOkRLxQ0kwqpkRgIfIy
         KnLRfwYMyTgLyLeDlg2l/Y+xG46kbs+zbN82BVIVmNJT0Od7qLdhu4A9LGrJ2N/c1ODn
         JpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784569193; x=1785173993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3lKAeinKY7QQ7aApRoqVHwNvB8IJpXz6tyJrSSgZ8Gg=;
        b=syhpaP+MEbKRp3BeYitHABxqMUlubVcjMZaPRIC9/6xlU+7q/dteb4zDgErdzjuAz8
         JJ5FX05mh40vKA+we+5e2KcMK26XLhjaAvpjkRWA8KaP40JUhzIONFcQ5qOuPCgUKQfo
         KhjbuxccPPfoX0bIHKaGhocjdJhzenOub0iMhm2W8h1RKbxTQBQFkO+KAgFPrKGIq3Re
         VTi8bUzU6p1a+Xc35ihzXnojvjaXFYWgG4WU+e+rPgonEnOwEIhVjLHdsaIeAp8K1SoX
         A15QdJOJWA//Ye+ezdO4olDr/gbZjuZEVMHcIQVIH4pPjWJ6g8LvzKxSmCkHCF9MDjxt
         aZRA==
X-Forwarded-Encrypted: i=1; AHgh+Rqcy+CraymRbUXQN4Ck9iWcG+Wos8Hj/TRWUr/rT58v1Kenf8nzLFxkwsK0cHsFG9bf+G6MNzD67t5BUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfraVzH2pV0HEQOdE/LbzwYlx2QOPNLE1EjWyiLzMtSiMofQUA
	bldAdN4gaQuFcReYesO4cjxnP/Y3gIG4V/Uw1zbNFb7vA30nrnnZsI5k152+wRBuoutBxr4SQ97
	ltnvI6XLONoQ646AUWvpgJhZeX+Az3bd+HqVtppEG26qB4UbwzRnLwfA=
X-Gm-Gg: AfdE7ckaagxoWNCA5aowRriCUf0MeTwbvgGH8qpeyh2nMCn1KH7stb4OOfiJYJFOWJh
	PQfO4Rnnh0y6N413GxeZkMefI4If1GEr7MgQ+vPPmDrjF9J/dHZWZ9z4JDbJoahMoa5qF00cK2J
	+/ppdg/Y2vNjZEnQcRCngZ0a/3ityjuFV+eE/t21XsKwgoYwZ/b9HL5v0F53VBzqGJ4HvJEQVNu
	SmoDACfGQqnxGDUhotlMSGm1vhI+YWimiOwlun56XOykAUD2fTbLtyE64cI9IfAZdUXJsBriVSr
	SPbdVXV0TrafZzemZ+aUg8p0ByPXozmyvxA6eCcwZO7mwVs8USOUkj/Ej2MmHvIYuZMP897Mkdv
	amA==
X-Received: by 2002:a05:6870:8254:b0:456:d5fa:bfe1 with SMTP id
 586e51a60fabf-456d5fac634mr4827048fac.42.1784569192722; Mon, 20 Jul 2026
 10:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
 <178455866124.1426769.18237320419273419942@freya>
In-Reply-To: <178455866124.1426769.18237320419273419942@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Jul 2026 18:39:34 +0100
X-Gm-Features: AUfX_mwpOIng_BFh3kYkWf_FCMi_rQtTB4ZRhlF7keb__qhna7dnplSCDXZuDro
Message-ID: <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Mon, 20 Jul 2026 at 15:44, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave, Alexander,
>
> Quoting Dave Stevenson (2026-03-13 01:20:15)
> > Hi Alexander
> >
> > On Thu, 12 Mar 2026 at 15:11, Alexander Shiyan
> > <eagle.alexander923@gmail.com> wrote:
> > >
> > > This patch adds a V4L2 subdevice driver for the Sony IMX662 CMOS image
> > > sensor. The sensor has a native resolution of 1936x1100 (effective
> > > 1920x1080) and can achieve up to 90 frames per second depending on
> > > the configuration. The driver supports:
> > > - MIPI CSI-2 with 2 or 4 data lanes.
> > > - RAW10 and RAW12 formats (both colour and monochrome).
> > > - Controls: exposure, analogue gain, horizontal/vertical blanking,
> > >   horizontal/vertical flip, brightness.
> > > - A placeholder V4L2_CID_HDR_SENSOR_MODE control for future Clear HDR
> > >   support (the actual HDR modes are not yet implemented).
> > > - Runtime PM.
> > > - Cropping via the selection API.
> > > - Multiple link frequencies selectable via device tree.
> > >
> > > Tested on ARM64 Rockchip RK3568 platform with a 24 MHz external clock
> > > and various link frequencies.
> >
> > Interesting timing as I've been looking at IMX662 too, but on a Raspberry Pi.
> > FWIW my driver is at
> > https://github.com/6by9/linux/blob/rpi-6.12.y-imx662/drivers/media/i2c/imx662.c
> >
>
> I saw libcamera patches for IMX676,

IMX676? I assume that's a typo.

> does the below branch have the latest
> driver you plan to post as v2?
>
> https://github.com/6by9/linux/blob/rpi-6.18.y-imx662-mainline-clean/drivers/media/i2c/imx662.c

That's a downstream Pi tree. My mainline branch is
https://github.com/6by9/linux/tree/mainline_imx662 and is basically
the patches I intend to send.
There is one niggle to resolve first in imx662_ctrls_init. There is
currently a catch-22 in setting up the state vs initialising the
blanking and exposure ranges as they refer to each other. I need to
come back and look at that one.

> > Comments are based on brief testing and reading of the code. This is
> > not a full review.
> >
> > > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
>
> [...]
>
> > > +static int imx662_set_selection(struct v4l2_subdev *sd,
> > > +                               struct v4l2_subdev_state *sd_state,
> > > +                               struct v4l2_subdev_selection *sel)
> > > +{
>
> Can we keep cropping and binning out of the initial driver,

There is no binning currently implemented in this driver, only cropping.

> and implement
> it using the common raw sensor model directly?
>
> I did it for IMX678 [1] on Sakari's suggestion [2]. The two sensors are
> quite similar, so I'm happy to help in whatever way I can on getting this
> working with the new model too :-)

Is this effectively saying that linux-media is closed to sensor
drivers not adopting the common raw sensor model, even though AIUI
that isn't ready yet? I can accept that for a period, but how long is
it reasonable for that to be the case? A year?
With all due respect to those involved, the series has been around so
long in various guises that it's a case of I'll believe it when I see
it merged.

There are already a number of sensor drivers in the tree that support
set_selection (imx296 being the main one I care about). Presumably
there is a plan for how to migrate those to work with the common
sensor model without regression for existing users. Is there a reason
that plan isn't also valid for imx662 and imx678?

I would offer to review the common raw sensor patches, but as so much
of it is core framework stuff and so is outside my area of knowledge.
I guess I can do the same as your imx678 branch and give it a go for a
Tested-by, but that feels fairly limited in scope.
Have you got a libcamera branch that supports the new model for imx678?

Thanks
  Dave

> [1]: https://lore.kernel.org/all/20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com/
> [2]: https://lore.kernel.org/all/ag7oq5jO5G0rwvzb@kekkonen.localdomain/
>
> Thanks,
>     Jai
>
> > > +       struct imx662 *imx662 = to_imx662(sd);
> > > +       struct v4l2_rect rect = sel->r;
> > > +       struct v4l2_rect *try_crop;
> > > +       struct v4l2_mbus_framefmt *try_fmt;
> > > +       u32 max_left, max_top;
> > > +
> > > +       if (sel->target != V4L2_SEL_TGT_CROP)
> > > +               return -EINVAL;
> > > +
> > > +       max_left = IMX662_PIXEL_ARRAY_LEFT + IMX662_PIXEL_ARRAY_WIDTH -
> > > +                  IMX662_MIN_CROP_WIDTH;
> > > +       max_top = IMX662_PIXEL_ARRAY_TOP + IMX662_PIXEL_ARRAY_HEIGHT -
> > > +                 IMX662_MIN_CROP_HEIGHT;
> > > +
> > > +       rect.left = clamp_t(u32, rect.left, IMX662_PIXEL_ARRAY_LEFT, max_left);
> > > +       rect.top = clamp_t(u32, rect.top, IMX662_PIXEL_ARRAY_TOP, max_top);
> > > +
> > > +       rect.width =
> > > +               clamp_t(u32,
> > > +                       round_down(rect.width, IMX662_CROP_WIDTH_STEP),
> > > +                       IMX662_MIN_CROP_WIDTH, IMX662_PIXEL_ARRAY_WIDTH);
> > > +       rect.height =
> > > +               clamp_t(u32,
> > > +                       round_down(rect.height, IMX662_CROP_HEIGHT_STEP),
> > > +                       IMX662_MIN_CROP_HEIGHT, IMX662_PIXEL_ARRAY_HEIGHT);
> > > +
> > > +       if (rect.left + rect.width - 1 >
> > > +           IMX662_PIXEL_ARRAY_LEFT + IMX662_PIXEL_ARRAY_WIDTH - 1)
> > > +               rect.left =
> > > +                       IMX662_PIXEL_ARRAY_LEFT + IMX662_PIXEL_ARRAY_WIDTH -
> > > +                       rect.width;
> > > +       if (rect.top + rect.height - 1 >
> > > +           IMX662_PIXEL_ARRAY_TOP + IMX662_PIXEL_ARRAY_HEIGHT - 1)
> > > +               rect.top =
> > > +                       IMX662_PIXEL_ARRAY_TOP + IMX662_PIXEL_ARRAY_HEIGHT -
> > > +                       rect.height;
> > > +
> > > +       if (sel->flags & V4L2_SEL_FLAG_GE) {
> > > +               if (rect.width < sel->r.width) {
> > > +                       u32 new_width = rect.width + IMX662_CROP_WIDTH_STEP;
> > > +
> > > +                       if (new_width <= IMX662_PIXEL_ARRAY_WIDTH)
> > > +                               rect.width = new_width;
> > > +               }
> > > +               if (rect.height < sel->r.height) {
> > > +                       u32 new_height = rect.height + IMX662_CROP_HEIGHT_STEP;
> > > +
> > > +                       if (new_height <= IMX662_PIXEL_ARRAY_HEIGHT)
> > > +                               rect.height = new_height;
> > > +               }
> > > +       }
> > > +
> > > +       if (sel->flags & V4L2_SEL_FLAG_LE) {
> > > +               if (rect.width > sel->r.width &&
> > > +                   rect.width >= IMX662_MIN_CROP_WIDTH +
> > > +                                 IMX662_CROP_WIDTH_STEP)
> > > +                       rect.width -= IMX662_CROP_WIDTH_STEP;
> > > +               if (rect.height > sel->r.height &&
> > > +                   rect.height >= IMX662_MIN_CROP_HEIGHT +
> > > +                                  IMX662_CROP_HEIGHT_STEP)
> > > +                       rect.height -= IMX662_CROP_HEIGHT_STEP;
> > > +       }
> > > +
> > > +       if (rect.width < IMX662_MIN_CROP_WIDTH ||
> > > +           rect.height < IMX662_MIN_CROP_HEIGHT)
> > > +               return -EINVAL;
> > > +
> > > +       if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
> > > +               try_crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
> > > +               *try_crop = rect;
> > > +
> > > +               try_fmt = v4l2_subdev_state_get_format(sd_state, sel->pad);
> > > +               if (try_fmt) {
> > > +                       try_fmt->width = rect.width;
> > > +                       try_fmt->height = rect.height;
> > > +               }
> > > +       } else {
> > > +               if (imx662->streaming)
> > > +                       return -EBUSY;
> > > +
> > > +               if (imx662->crop.left == rect.left &&
> > > +                   imx662->crop.top == rect.top &&
> > > +                   imx662->crop.width == rect.width &&
> > > +                   imx662->crop.height == rect.height) {
> > > +                       sel->r = rect;
> > > +                       return 0;
> > > +               }
> > > +
> > > +               imx662->crop = rect;
> > > +
> > > +               try_fmt = v4l2_subdev_state_get_format(sd_state, sel->pad);
> > > +               if (try_fmt) {
> > > +                       try_fmt->width = rect.width;
> > > +                       try_fmt->height = rect.height;
> > > +               }
> > > +
> > > +               imx662_set_framing_limits(imx662);
> > > +       }
> > > +
> > > +       sel->r = rect;
> > > +
> > > +       return 0;
> > > +}
>
> [...]
