Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A56238150
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917117; cv=pass; b=E50tmj5Z3ARd9bvgqJ+D+RQ0I4ZK3JUndEqCveA1b2RilwAKdBT7zblN6+TFeUa3V+bQ/FuC3u5DOtPVTNf/bmTqtkw0IWo6GqfNCse2wq4LVPutJjdRfe1OHz5QFYVUaf1ogMYneS1i8tuMOrO80FuZafH1NEgsOYAQz8k+oxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917117; c=relaxed/simple;
	bh=h/EHnUr7lunz5Db+KPTar0ziC2d6S7/v6vFWOk9+/Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3o+tDuC2dTX5N9GBlzgOrnQkkGD7JaX3/bMSHwecMtYLhvkMPWgY3DG7WaGLhzO8373T620b8exUlx8BqfH98I3RR9Gwof9WdZ2aOr/9B61KFLfZ8RValgNDvnfjAK7gT3WmNyPUObB1cpFslRa4lHVX/2E8yb3BGe+seuNb1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjZe4Ntg; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjZe4Ntg"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4896ae35be9so288022b6e.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784917114; cv=none;
        d=google.com; s=arc-20260327;
        b=btuwRka8SjPkT+B11GSUVYOdhT+iuuRGAxCJWojdgnWKHOdD9bX+JKTkwnWaWCpsWM
         KtHegs7NTtQBGzH7PBftIHo4QKs+vYfxFAfr74d0RhXKGGt/l7EHY5qUcm/5wvUqVRAz
         74uzT1l122vZ6Igvr8Vwd8MT2KTKt1ibUse75zW5msqoFQbfw15FNrjJ/i7H2QXoGhBD
         uwSS1VvzvpFyEPH2FK9rd34XIBSJoYHQfuK3xk2gP/TYiRJ7tB2pz0EKSrd0uzwsU2mO
         URlspDYmwh7ClU9jO+GLFUbl/JVi/F3f3PmDysFEoGCeHu/cB9LFCsC1fFMXBpB79xh5
         qfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sX1KDNxM9OiXTvNDmoD8ot6nH9bARF44QBDDUnFOimQ=;
        fh=jkXwi4pA7zCxDPO5qYCvtvUA77sZ8IvoxuEdAWzNVXs=;
        b=gjrx4AT7ToDtk42/7rzHTddGKbDXiF7TQ0OMV6yylvMTsr0LnEoJxs0iJBvZ6CTcMp
         +4VvHcs6RqdWX0e+Vn9avXpTQyR++MA7xLiCs+WGOdDS4c9KBfDcu67fh5EyvW4Q3/HZ
         307+0+7f6UTgUeKRvMeDdwti+ZWly27z9rh0b6jDfzyQAvbaE5L8RpW/Bmgnv5XQMJQi
         HXwPdJxQiAiKJLlBEjwjjw5bBVt6Jc5gmNOOMlU4TqmtETM/P4px0wXh0vmIKnpmaaBK
         Bt0wUcbhLU6xl4IYKNCqUafIe+kt/vGNorXKExSnAsD/xixl7tFNSbVKCrwW6z3e+QdJ
         qc7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784917114; x=1785521914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sX1KDNxM9OiXTvNDmoD8ot6nH9bARF44QBDDUnFOimQ=;
        b=DjZe4NtgX5/CF5e7nZeT+jsUt/Hd3xpEVVEoA3s6pX/ChfPoljaTCDxoPAFV54VIVF
         POC1MeSEOMIT8KGN7Sp6OT6BFQXEy6uoXbDce/XmqYG/PkDNXN9tZ44ezoCuQxIidwfZ
         p+7vlWirab6QZS8oFvoqaOaFbYhT/xp0i/xzjnivYytc7XCiFoZowlTjJC7lpuQ8v4fA
         0kFB7PRR8rE9h3qBbHWDh/0f6VwRcKwgIRjg8BYdnDKv7Bq0QDAOeJ7BDxgbGsONdGlQ
         xkvZqxmraTUsSmpFVkNhjj1BlGDptOf3c7CHKZwLQ8/NgcuX3WiiX/wF1SI5/34rg1Rh
         Hmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917114; x=1785521914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX1KDNxM9OiXTvNDmoD8ot6nH9bARF44QBDDUnFOimQ=;
        b=hn3Z50Jv0SofXZ8V2jc54Z0sha3KcNY7U3L4u8vobzCIDf6joKpC/37fen4U2zw6mh
         /9ijavWeVjbzZRCXrEg6tDYoVGkmzT7CJdGNX59HZuREz/+4twIAyfU3Km9nlpLCm+ad
         o4MUwP5wBdxr9PaHzV2A62zZd9LZXzQU1rDU6CJXJMcxU7nowDNZR/G5HXCgo9vCwO2d
         M1qhYU3MOi0vorZtcQFZxwtnkB3BUoFz+oVLDyLp5zjqK3JsVkTySpThpsAO8n/QEo03
         Vr4JpXZ7/ZMK/hP5+bihfsV7HR9qYbFITHzdcu172SS7dtLDD5FplBAnNs570QN3teS7
         zt/w==
X-Gm-Message-State: AOJu0YxAT0DCWm0ZMFWU7KIW5VhryHr2YqA9hhZ86kX9pg4ld/qxNwjd
	+ZKNSs9ZopgcziIKFYAx8+ucuatWFSok4tJ5pwYpswUKa4wcJo/LweO1ysxM/d/NUoAmLKOusoV
	Qm1h7wtxntgHCQ6wjNOXhoSV6k9jXvFfgYOR11EId5Q==
X-Gm-Gg: AR+sD12+E35gYWqsTw/aQH/5YWzEATGbb8tABfIJ/WrpCw4qPjYWj+x4RV46jDArr1e
	F9Iq4NdFzbuoxiOsHKOfv/MWC54TbKurP9qPBn1Qm8QFzzkBuEMYnXRtIqFPTsKEciYAN3jcrxx
	NZYxoj4zkHqul051TST++CxA4JYru3XKu6ndXWbWEQPrFMTc9ZuHqxxF0mfG4VSamy+hRkCV0OS
	qmfiL+Biu0b2rNyo1JBh05vS0rsMJCuaGYnXE5h13VKuHS5rPFhSOSNnsLpATVd4Dr+VIiVIHN+
	vZwS322LxIJdhfAcNQkAaba28/aZe43lgFngu8CfJ9U6JMY=
X-Received: by 2002:a05:6808:14d0:b0:494:9c17:c336 with SMTP id
 5614622812f47-4ab3560424emr5473315b6e.34.1784917113746; Fri, 24 Jul 2026
 11:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214050943.6306-1-arash.golgol@gmail.com> <afx-yCUZAvWfMNEe@collins>
 <CAMxPZkia0_xHtaQfcfmizPz_AX-tLA7g+nC2FhgKtATiMUkfLA@mail.gmail.com>
In-Reply-To: <CAMxPZkia0_xHtaQfcfmizPz_AX-tLA7g+nC2FhgKtATiMUkfLA@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 25 Jul 2026 21:48:06 +0330
X-Gm-Features: AUfX_mzL9LQI71UhGymklcqxGxTDFX_f-A4Y8x1IQAzLfmvOSMg_5L9ySjMf0lI
Message-ID: <CAMxPZkgi+-2tTABJFb3Ec7v+_2nJe5vFXSzxGxWTZM0RqaRKyw@mail.gmail.com>
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, linux-sunxi@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Thu, Jul 9, 2026 at 8:04=E2=80=AFAM arash golgol <arash.golgol@gmail.com=
> wrote:
>
> Hi,
>
> On Thu, May 7, 2026 at 3:30=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
> >
> > Hi Arash,
> >
> > Le Sat 14 Feb 26, 08:39, Arash Golgol a =C3=A9crit :
> > > Use the V4L2 subdev active state API to store the active format.
> > > This simplifies the driver not only by dropping the bridge mbus_forma=
t
> > > field, but it also allows dropping the bridge lock, replaced with
> > > the state lock.
> > >
> > > The sun6i-mipi-csi2 hardware does not perform any format conversion.
> > > Enforce identical formats on the sink and source pads in the set_fmt(=
)
> > > and init_state() callbacks.
> > >
> > > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Looks very good. Feel free to let me know if you'd like to do the same
> > with A83T (I could test it on my side), otherwise I will take a look at
> > it later. The driver has essentially exactly the same structure.
> >
> > Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> > Tested-by: Paul Kocialkowski <paulk@sys-base.io>
>
> This is a gentle ping for this patch.
> As far as I understand, the patch has received the required reviews and t=
esting.
> If there are no remaining issues, could it be considered for merging?

This patch currently has no delegate in patchwork (you were the
delegate on an earlier version).
Link: https://patchwork.linuxtv.org/project/linux-media/patch/2026021405094=
3.6306-1-arash.golgol@gmail.com/

I appreciate your feedback.

> > All the best,
> >
> > Paul
> >
> > > ---
> > > Changes in v3:
> > >     - link to v2: https://patchwork.kernel.org/project/linux-media/pa=
tch/20260209055529.16644-1-arash.golgol@gmail.com/
> > >     - Keep error path jumping to error_v4l2_notifier_cleanup on
> > >     bridge setup failure
> > >
> > > Changes in v2:
> > >     - link to v1: https://patchwork.kernel.org/project/linux-media/pa=
tch/20260206123455.46476-1-arash.golgol@gmail.com/
> > >     - Simplify control flow by dropping the else at end of s_stream()
> > >     - Call v4l2_subdev_cleanup() on bridge setup failure before
> > >     notifier registration
> > >
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++-------=
--
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > >  2 files changed, 53 insertions(+), 56 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_=
csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > index b06cb73015cd..682bdd82098c 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_=
mipi_csi2_device *csi2_dev)
> > >                          SUN6I_MIPI_CSI2_CTL_EN, 0);
> > >  }
> > >
> > > -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device =
*csi2_dev)
> > > +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device =
*csi2_dev,
> > > +                                    const struct v4l2_mbus_framefmt =
*mbus_format)
> > >  {
> > >       struct regmap *regmap =3D csi2_dev->regmap;
> > >       unsigned int lanes_count =3D
> > >               csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mb=
us_format;
> > >       const struct sun6i_mipi_csi2_format *format;
> > >       struct device *dev =3D csi2_dev->dev;
> > >       u32 version =3D 0;
> > > @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >       struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_s=
ubdev;
> > >       union phy_configure_opts dphy_opts =3D { 0 };
> > >       struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mi=
pi_dphy;
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mb=
us_format;
> > > +     struct v4l2_subdev_state *state;
> > > +     const struct v4l2_mbus_framefmt *mbus_format;
> > >       const struct sun6i_mipi_csi2_format *format;
> > >       struct phy *dphy =3D csi2_dev->dphy;
> > >       struct device *dev =3D csi2_dev->dev;
> > > @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
> > >       unsigned long pixel_rate;
> > >       int ret;
> > >
> > > -     if (!source_subdev)
> > > -             return -ENODEV;
> > > +     state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > > +
> > > +     if (!source_subdev) {
> > > +             ret =3D -ENODEV;
> > > +             goto unlock;
> > > +     }
> > >
> > >       if (!on) {
> > >               v4l2_subdev_call(source_subdev, video, s_stream, 0);
> > > @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >
> > >       ret =3D pm_runtime_resume_and_get(dev);
> > >       if (ret < 0)
> > > -             return ret;
> > > +             goto unlock;
> > >
> > >       /* Sensor Pixel Rate */
> > >
> > > @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >               goto error_pm;
> > >       }
> > >
> > > +     mbus_format =3D v4l2_subdev_state_get_format(state,
> > > +                                                SUN6I_MIPI_CSI2_PAD_=
SINK);
> > >       format =3D sun6i_mipi_csi2_format_find(mbus_format->code);
> > >       if (WARN_ON(!format)) {
> > >               ret =3D -ENODEV;
> > > @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >
> > >       /* Controller */
> > >
> > > -     sun6i_mipi_csi2_configure(csi2_dev);
> > > +     sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
> > >       sun6i_mipi_csi2_enable(csi2_dev);
> > >
> > >       /* D-PHY */
> > > @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >       if (ret && ret !=3D -ENOIOCTLCMD)
> > >               goto disable;
> > >
> > > -     return 0;
> > > +     ret =3D 0;
> > > +     goto unlock;
> > >
> > >  disable:
> > >       phy_power_off(dphy);
> > > @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >  error_pm:
> > >       pm_runtime_put(dev);
> > >
> > > +unlock:
> > > +     v4l2_subdev_unlock_state(state);
> > >       return ret;
> > >  }
> > >
> > > @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2=
_mbus_framefmt *mbus_format)
> > >  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> > >                                     struct v4l2_subdev_state *state)
> > >  {
> > > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > > -     unsigned int pad =3D SUN6I_MIPI_CSI2_PAD_SINK;
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D
> > > -             v4l2_subdev_state_get_format(state, pad);
> > > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > +     unsigned int pad;
> > >
> > > -     mutex_lock(lock);
> > > +     /*
> > > +      * This subdev does not perform format conversion,
> > > +      * initialize both pads identically.
> > > +      */
> > > +     for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> > > +             struct v4l2_mbus_framefmt *mbus_format;
> > >
> > > -     mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> > > -     mbus_format->width =3D 640;
> > > -     mbus_format->height =3D 480;
> > > +             mbus_format =3D v4l2_subdev_state_get_format(state, pad=
);
> > >
> > > -     sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +             mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_c=
ode;
> > > +             mbus_format->width =3D 640;
> > > +             mbus_format->height =3D 480;
> > >
> > > -     mutex_unlock(lock);
> > > +             sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +     }
> > >
> > >       return 0;
> > >  }
> > > @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subd=
ev *subdev,
> > >       return 0;
> > >  }
> > >
> > > -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > > -                                struct v4l2_subdev_state *state,
> > > -                                struct v4l2_subdev_format *format)
> > > -{
> > > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > -
> > > -     mutex_lock(lock);
> > > -
> > > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > > -             *mbus_format =3D *v4l2_subdev_state_get_format(state,
> > > -                                                          format->pa=
d);
> > > -     else
> > > -             *mbus_format =3D csi2_dev->bridge.mbus_format;
> > > -
> > > -     mutex_unlock(lock);
> > > -
> > > -     return 0;
> > > -}
> > > -
> > >  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> > >                                  struct v4l2_subdev_state *state,
> > >                                  struct v4l2_subdev_format *format)
> > >  {
> > > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > +     struct v4l2_mbus_framefmt *fmt;
> > >
> > > -     mutex_lock(lock);
> > > +     /* The format on the source pad always matches the sink pad. */
> > > +     if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> > > +             return v4l2_subdev_get_fmt(subdev, state, format);
> > >
> > > -     sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +     sun6i_mipi_csi2_mbus_format_prepare(&format->format);
> > >
> > > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > > -             *v4l2_subdev_state_get_format(state, format->pad) =3D
> > > -                     *mbus_format;
> > > -     else
> > > -             csi2_dev->bridge.mbus_format =3D *mbus_format;
> > > +     /* Set the format on the sink pad. */
> > > +     fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > > +     *fmt =3D format->format;
> > >
> > > -     mutex_unlock(lock);
> > > +     /* Propagate the format to the source pad. */
> > > +     fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD=
_SOURCE);
> > > +     *fmt =3D format->format;
> > >
> > >       return 0;
> > >  }
> > >
> > >  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops =3D =
{
> > >       .enum_mbus_code =3D sun6i_mipi_csi2_enum_mbus_code,
> > > -     .get_fmt        =3D sun6i_mipi_csi2_get_fmt,
> > > +     .get_fmt        =3D v4l2_subdev_get_fmt,
> > >       .set_fmt        =3D sun6i_mipi_csi2_set_fmt,
> > >  };
> > >
> > > @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct su=
n6i_mipi_csi2_device *csi2_dev)
> > >       bool notifier_registered =3D false;
> > >       int ret;
> > >
> > > -     mutex_init(&bridge->lock);
> > > -
> > >       /* V4L2 Subdev */
> > >
> > >       v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > > @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct s=
un6i_mipi_csi2_device *csi2_dev)
> > >       if (ret)
> > >               return ret;
> > >
> > > +     /* V4L2 Subdev finalize */
> > > +
> > > +     ret =3D v4l2_subdev_init_finalize(subdev);
> > > +     if (ret < 0)
> > > +             goto error_media_entity_cleanup;
> > > +
> > >       /* V4L2 Async */
> > >
> > >       v4l2_async_subdev_nf_init(notifier, subdev);
> > > @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct su=
n6i_mipi_csi2_device *csi2_dev)
> > >  error_v4l2_notifier_cleanup:
> > >       v4l2_async_nf_cleanup(notifier);
> > >
> > > +     v4l2_subdev_cleanup(subdev);
> > > +
> > > +error_media_entity_cleanup:
> > >       media_entity_cleanup(&subdev->entity);
> > >
> > >       return ret;
> > > @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_=
csi2_device *csi2_dev)
> > >       v4l2_async_unregister_subdev(subdev);
> > >       v4l2_async_nf_unregister(notifier);
> > >       v4l2_async_nf_cleanup(notifier);
> > > +     v4l2_subdev_cleanup(subdev);
> > >       media_entity_cleanup(&subdev->entity);
> > >  }
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_=
csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > index 24b15e34b5e8..d72dfbd6a993 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
> > >       struct media_pad                pads[SUN6I_MIPI_CSI2_PAD_COUNT]=
;
> > >       struct v4l2_fwnode_endpoint     endpoint;
> > >       struct v4l2_async_notifier      notifier;
> > > -     struct v4l2_mbus_framefmt       mbus_format;
> > > -     struct mutex                    lock; /* Mbus format lock. */
> > >
> > >       struct v4l2_subdev              *source_subdev;
> > >  };
> > > --
> > > 2.34.1

--=20
Regards,
Arash Golgol
