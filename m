Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C54F446839
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627129; cv=pass; b=BvXOi1mT/8Y6IavVRgXmnAoJU5HJGU8T9qN8yGHgyr+f1TD0pmvHAVJvhb+X52c2GDeq1for0hCAtHJeHFwVerIDwT7oG+GN2LlVQX6Bdaf8aiZyowt16FnUpuBTkgEaA7XoGPZ8YmXEqXp0AxGB+Cqb0lrtdYWFeI+WPguKv+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627129; c=relaxed/simple;
	bh=XchrFODCUSTk0Hozqy43QkoAzqZXaAPj6KG7wO7Ql9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QskZX3K0os4qqEi2Gi0HzKke1ThJHrTbQ6PyEqnaP3tpADp0SNE/o1j+/IR/p5yoZsPfvdoC0D5+9FGr+dTUEHIO2Z05JQ9XPQh9b1l9+ABGk0Ol16EvOpItwoRk5praPiBOF0r9fbCwA2nqGEMHVYNxHXXmBr/FODYnZ6U4TnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vidkg+C8; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vidkg+C8"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so8687155a12.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784627127; cv=none;
        d=google.com; s=arc-20260327;
        b=Rf045Kka9+gt76qHEuaQse3GlMZfuP5bk/7Zdsk1niDVqVYYcRWzjlGF+L6FQYEkg9
         fIIO/3npPHJ41wXxFtlIUIUt/tBwJsrP+Y3/FXpWO9ZPsMoPct5AytOoray6O0H8oY3c
         b8G0vJoa4L02+0hF6eJ5bur80YGuC6VGcy/2+W8HlcXY62daHEg1FE8DUR9CeclBK+F/
         DJv5IaTuQloyk753ynQpgjJHWLQ7ILgk4NfmDTG+KQa9VVqk7MF4fOQOL94fim/s7j4/
         Je3xCaqTzztbyisdZGbVwqpke/S+VRcg/9A8mXjOfR1f3fql9TMs5/G6wJ35TypnnpW1
         7LJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lhaTOMzoD32lDFFebGEk/tTq7bPp6JiL4J2BZ4SmDn0=;
        fh=30BJLag8VtfOUSkgD2b3tFExz8YMqa9xsfxcMNjZ3tg=;
        b=GGXXtoowU6e5iAhxbEfHf3F43OSR4GkA/PEpCp4FvBSutPNmcg23m88+EIkn89O3rT
         BVdjl8B7jRRTLyY2STVyQdgRBw9aLGY658zeSoLbsICPHZR7gIbLx1pBIPU0A8ojzh8R
         nikleM337ITIUcYFlhrtsEvgZjyrjHsSUn8iuVMs12AnIMduUJ/HJQocoD39emc4qSnD
         UPCkoSbLQzlaW+NHq8cHYJ7MUQzfMJEV0sl7mcI9vP/+EXscPgpWJs+g3FU+uSAlqfz5
         9fEcQf5ulPFvK5aQn8dO3ViEixmQJ825VBPKbQEnCzhWa9YgssPLO7Rlaquljsqv2ABW
         w4WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627127; x=1785231927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lhaTOMzoD32lDFFebGEk/tTq7bPp6JiL4J2BZ4SmDn0=;
        b=Vidkg+C8bro6+hcLpRL1AU8RFHgWuZIRVXgiOwvD7uoAwWTuQ23XZeduT+ldfeybt+
         LExeR1J6Rd/IOWYG36iiBVU8tCbFuFqLdC7C1MS9Wa6sdBiwGfKgsl60bRR1806+genD
         ENmIfokApgeYRfwBtWl13/xSw8yi2LjfgENP6l8bISotwLbDsxfGWB2AtBhUk9ynoiVe
         ZSyk4K6EmkNazrdTh8xKCtVWUr20mzZ6Iu8EynWj85GqG4X9VLyGuRsb1Mm6DvEnHKqf
         ZSFQqUyRidxv34N+ZN6699zMZfJ1e9FvH8D2t4l6kTMbLCvifbStMabM/WhaxqX3DHvV
         sn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627127; x=1785231927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhaTOMzoD32lDFFebGEk/tTq7bPp6JiL4J2BZ4SmDn0=;
        b=DoS71iXqU82vFv2poNTwJZ3/p3DrLLAftnv8lhTu6Mi6XE4CUeL8kHyHHjp7pOah1r
         CS4aheI6nmdOPPMG1sjWUho7qony4Vn1RlMbsSycfRB3cloPsNDqMUMY2+E8kB8/bZbW
         92doHEA+Ty2LMsmhcX3L2IuJdATiIIENZQkhVUMv1R0K1xISpmmltfXQ+ZZsefY7EuIc
         SVOfw/skl6tsUfP18JF4uqcQRAiaoWZWN6mOqc91S9vk9f1vZmIV+HUfOiV9oW2rgTWs
         +0sgodxm1CCmQVCi9IpBBDpGWURrAPdSY5WNLOa7LbdA0NS9Ej89kRt9yP6WofU5A9vD
         KTkw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3OAtDeoB9YHoGye423ipbsEFTbQ2iwFj8rbhl3KqXD2ZB1oXLhz2o0iK4TTLyJsY7a5mFcirDYJ2tRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTpzkzuAJjBDDA1qJZYs+uahrn4mk/YKNyHW3HPvyvzDs1sCwf
	vRgl/jJxw3AjVH/ZXAHNXt1csHLv3yuE26/k6b/qxDyeY32lEaSOvE+PVS6DLbJj8rky//lKaT1
	Hbas0wYYciAkpVwyU7NFjuWhoBJ5BKTaexvBf
X-Gm-Gg: AfdE7clfMO/eH9M0e7pxtdvDWNChWvoFfIHSDc+HamqeucEYm6DbibwkWzhfRHU5kdN
	CLt88Y8Ql8eVIpD7B1piOfJf5Z1geRrUWEg0bs0MGA2xCakMeN6XVH+4dIRPMjpeoj7zLQS+eKc
	JWeH0tVq4jzBgdXXrKxWPYPZgXf/Jy0RJuviCtCeT2DNfMnY0BdSQJt4l1rxeQVpznzAPPvKdNO
	PP9W/PgTett5bJq9xvL9Ze4zYr0ngMWYKiuGf/kZ2Cy3ce2hCWYltqBIsjLPT70hn8JAlHChMh9
	TUiupoZyUB84JuCs0so=
X-Received: by 2002:a05:6a21:1404:b0:3bf:6c08:fb83 with SMTP id
 adf61e73a8af0-3c3ad9bc105mr18441172637.51.1784627127358; Tue, 21 Jul 2026
 02:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625082111.47898-1-clamor95@gmail.com> <20260625082111.47898-2-clamor95@gmail.com>
 <20260714191637.GA1675278@killaraus.ideasonboard.com> <CAPVz0n0k4O1+RGFMhAUnFG7qsc-7HVwVj23-8MRGnYLzXL+TPw@mail.gmail.com>
 <20260715163106.GG1778116@killaraus.ideasonboard.com> <CAPVz0n1ivPO=Y+cv6sVAzaMqWYMJp9a-UwNipFM3CuXLCgkZXA@mail.gmail.com>
 <20260721091257.GI50424@killaraus.ideasonboard.com>
In-Reply-To: <20260721091257.GI50424@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 21 Jul 2026 12:45:15 +0300
X-Gm-Features: AUfX_mxcU8qIWruL_jK4qWtL0YVhrW3OjdATv1CTDArR5fl9dGckY7yAMExKAnc
Message-ID: <CAPVz0n2UpVXuyVOxj-w1R-3Z1fxBDSuXY1Kgx0NcXEtS72H6MA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1 RESEND] media: i2c: mt9m114: Add get_fwnode_pad
 operation for IFP
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:12 Laur=
ent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jul 21, 2026 at 11:36:50AM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 15 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 19:31 =
Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Wed, Jul 15, 2026 at 07:18:18PM +0300, Svyatoslav Ryhel wrote:
> > > > =D0=B2=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 22=
:16 Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > On Thu, Jun 25, 2026 at 11:21:11AM +0300, Svyatoslav Ryhel wrote:
> > > > > > Currently, the driver's binding exposes only one endpoint, whic=
h maps to
> > > > > > the IFP subdevice's SOURCE pad. This configuration causes failu=
res for
> > > > > > many devices using this camera because both the DT binding and =
the
> > > > > > one-to-one pad mapping logic map the endpoint to the wrong pad.
> > > > >
> > > > > Could you please explain what failures this causes ? A brief anal=
ysis  of
> > > > > the code seems to indicate the patch will only make a difference =
when
> > > > > the DT node has multiple endpoints, and will prevent links to be =
created
> > > > > for any endpoint but the first one. I don't think that's desirabl=
e.
> > > >
> > > > OF schema documents only a single port with a single endpoint. Sinc=
e
> > > > driver has no alternative OF matching logic endpoints patch to medi=
a
> > > > pads one-to-one. IFP has 2 pads, id 0 is sink and id 1 is source. S=
o
> > > > according to one-to-one match endpoint from the binding co-responds=
 to
> > > > the sink media pad of IFP, source pad which is usually used to buil=
d
> > > > the video pipe is not represented in the bindings entirely.
> > >
> > > But the mt9m114 driver doesn't use 1-to-1 matching, it does not use t=
he
> > > v4l2_subdev_get_fwnode_pad_1_to_1() function to implement
> > > .get_fwnode_pad().
> >
> > Correct, hence media framework does not know how to link pads and
> > starts to do weird stuff.
>
> When .get_fwnode_pad() is not set, media_entity_get_fwnode_pad() will
> return the first pad of the entity that matches the requested direction.
> That should work fine as far as I can see.
>

Correct, those could be pad 0 and pad 1 of IFP depending on the caller.

> > > > This causes drivers which relay on OF bindings to build their video=
 pipes
> > > > fail to work with this driver.
> > >
> > > Could you provide an example of such a failure ?
> >
> > Tegra VI driver hooks mt9m114 IFP sink pad to sci source and mt9m114
> > IFP sink pad to csi source. With this patch OF endpoint is strictly
> > associated with IFP source pad, and nothing else which is desirable
> > setup IMHO.
>
> Could you please investigate to see why this happens ? I suspect there's
> a bug somewhere else, possibly in the VI driver.
>

I cannot copy proper log since my device has some USB regressions in 7.2.0 =
next

mt9m114 PA
 pad 0: source ->  mt9m114 IFP pad 0

mt9m114 IFP
 pad 0: sink <- csi channel pad 1
                    <- mt9m114 PA pad 0
 pad 1: source -> csi channel pad 0

CSI channel
 pad 0: sink <- mt9m114 IFP pad 1
 pad 1: source -> mt9m114 IFP pad 0
                        -> vi output pad 0

As you can see csi channel pad 1 must not be linked to IFP and mt9m114
IFP pad 0 must not be linked to CSI channel.

Tegra VI builds video graph by endpoint to endpoint and uses
media_entity_get_fwnode_pad to get associated pad. Since this driver
does not have get_fwnode_pad operation media_entity_get_fwnode_pad
will return both sink and source depending on the call, hence we can
see this cycling above. Adding get_fwnode_pad operation that links
endpoint strictly yo IFP source eliminates ambiguity since
get_fwnode_pad blocks sink of IFP to be exposed at all.

> > > > Sakari suggested this to fix OF
> > > > matching, so I have implemented it.
> > > >
> > > > > > Fix this
> > > > > > by implementing the get_fwnode_pad operation for the IFP, which=
 correctly
> > > > > > matches the endpoint to the corresponding IFP pad.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++-=
--------
> > > > > >  1 file changed, 34 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt=
9m114.c
> > > > > > index e395e2d14e97..16c2582551d3 100644
> > > > > > --- a/drivers/media/i2c/mt9m114.c
> > > > > > +++ b/drivers/media/i2c/mt9m114.c
> > > > > > @@ -1020,14 +1020,6 @@ static int mt9m114_stop_streaming(struct=
 mt9m114 *sensor)
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > -/* -----------------------------------------------------------=
------------------
> > > > > > - * Common Subdev Operations
> > > > > > - */
> > > > > > -
> > > > > > -static const struct media_entity_operations mt9m114_entity_ops=
 =3D {
> > > > > > -     .link_validate =3D v4l2_subdev_link_validate,
> > > > > > -};
> > > > > > -
> > > > > >  /* -----------------------------------------------------------=
------------------
> > > > > >   * Pixel Array Control Operations
> > > > > >   */
> > > > > > @@ -1381,6 +1373,10 @@ static const struct v4l2_subdev_internal=
_ops mt9m114_pa_internal_ops =3D {
> > > > > >       .init_state =3D mt9m114_pa_init_state,
> > > > > >  };
> > > > > >
> > > > > > +static const struct media_entity_operations mt9m114_pa_entity_=
ops =3D {
> > > > > > +     .link_validate =3D v4l2_subdev_link_validate,
> > > > > > +};
> > > > > > +
> > > > > >  static int mt9m114_pa_init(struct mt9m114 *sensor)
> > > > > >  {
> > > > > >       struct v4l2_ctrl_handler *hdl =3D &sensor->pa.hdl;
> > > > > > @@ -1403,7 +1399,7 @@ static int mt9m114_pa_init(struct mt9m114=
 *sensor)
> > > > > >
> > > > > >       /* Initialize the media entity. */
> > > > > >       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > > > > > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > > > > > +     sd->entity.ops =3D &mt9m114_pa_entity_ops;
> > > > > >       pads[0].flags =3D MEDIA_PAD_FL_SOURCE;
> > > > > >       ret =3D media_entity_pads_init(&sd->entity, 1, pads);
> > > > > >       if (ret < 0)
> > > > > > @@ -2092,6 +2088,29 @@ static int mt9m114_ifp_registered(struct=
 v4l2_subdev *sd)
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > +/*
> > > > > > + * The IFP has only one fwnode endpoint, which corresponds to =
the pad
> > > > > > + * linked to the PA (PA SINK), while it should be the SOURCE f=
or the
> > > > > > + * next media device in the pipe.
> > > > > > + */
> > > > > > +static int mt9m114_ifp_get_fwnode_pad(struct media_entity *ent=
ity,
> > > > > > +                                   struct fwnode_endpoint *end=
point)
> > > > > > +{
> > > > > > +     struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(en=
tity);
> > > > > > +     struct mt9m114 *sensor =3D ifp_to_mt9m114(sd);
> > > > > > +     struct fwnode_handle *ifp_port =3D dev_fwnode(&sensor->cl=
ient->dev);
> > > > >
> > > > > This is not a port fwnode. I'd name the variable just fwnode.
> > > > >
> > > >
> > > > fair
> > > >
> > > > > > +     struct fwnode_handle *ifp_ep;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     ifp_ep =3D fwnode_graph_get_next_endpoint(ifp_port, NULL)=
;
> > > > > > +
> > > > > > +     ret =3D endpoint->local_fwnode =3D=3D ifp_ep ? 1 : -ENXIO=
;
> > > > > > +
> > > > > > +     fwnode_handle_put(ifp_ep);
> > > > > > +
> > > > > > +     return ret;
> > > > >
> > > > > Let's use the cleanup API:
> > > > >
> > > > > #include <cleanup.h>
> > > > >
> > > > > ...
> > > > >
> > > > >         struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(en=
tity);
> > > > >         struct mt9m114 *sensor =3D ifp_to_mt9m114(sd);
> > > > >         struct fwnode_handle *fwnode =3D dev_fwnode(&sensor->clie=
nt->dev);
> > > > >         struct fwnode_handle *ifp_ep __free(fwnode_handle) =3D
> > > > >                 fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > > >
> > > > >         return endpoint->local_fwnode =3D=3D ifp_ep ? 1 : -ENXIO;
> > > > >
> > > >
> > > > The code is functionally same. I am fine with any version subsystem
> > > > maintainer will prefer.
> > > >
> >
> > Sakari, should I apply Laurent's changes and resend?
> >
> > > > > > +}
> > > > > > +
> > > > > >  static const struct v4l2_subdev_video_ops mt9m114_ifp_video_op=
s =3D {
> > > > > >       .s_stream =3D mt9m114_ifp_s_stream,
> > > > > >  };
> > > > > > @@ -2119,6 +2138,11 @@ static const struct v4l2_subdev_internal=
_ops mt9m114_ifp_internal_ops =3D {
> > > > > >       .unregistered =3D mt9m114_ifp_unregistered,
> > > > > >  };
> > > > > >
> > > > > > +static const struct media_entity_operations mt9m114_ifp_entity=
_ops =3D {
> > > > > > +     .link_validate =3D v4l2_subdev_link_validate,
> > > > > > +     .get_fwnode_pad =3D mt9m114_ifp_get_fwnode_pad,
> > > > > > +};
> > > > > > +
> > > > > >  static int mt9m114_ifp_init(struct mt9m114 *sensor)
> > > > > >  {
> > > > > >       struct v4l2_subdev *sd =3D &sensor->ifp.sd;
> > > > > > @@ -2136,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m11=
4 *sensor)
> > > > > >
> > > > > >       /* Initialize the media entity. */
> > > > > >       sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_ISP;
> > > > > > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > > > > > +     sd->entity.ops =3D &mt9m114_ifp_entity_ops;
> > > > > >       pads[0].flags =3D MEDIA_PAD_FL_SINK;
> > > > > >       pads[1].flags =3D MEDIA_PAD_FL_SOURCE;
> > > > > >       ret =3D media_entity_pads_init(&sd->entity, 2, pads);
>
> --
> Regards,
>
> Laurent Pinchart
