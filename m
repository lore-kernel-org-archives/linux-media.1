Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298DD3ABD91
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623024; cv=pass; b=ihfmbZBXUFv1/QfcTWeMXvI7rt3855Yxl1LibThWpqH22S5wBXNwqLPPwxAEgmVxpGGyL08GwQ2JaWR/DIXvbNfXoHeCpYeEvFGZT0fjiCXN8A7arWVPGb38ElZfIeWzS875q3YhfpjsZPAvmZ5M0k3FjZA+VAipwQPJHJ2vL5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623024; c=relaxed/simple;
	bh=dw8Ve3AEpNDp8v+UaXuv7E9ZNeaAOdEhgaWZxpJeZjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJP188kyHSkMPe0SOro2CGnj0Zdio+6Iy/wnQXgZWeAceh1bMSRiE2g8FVK1BT1l6rqK4VJ6Fejw1bxlOhKOlAl63n/RBQw/yJI3MHqQKlA1Abei1FO1FARBp3dpkkbqeU6+ztJ4vU2ZQbT4aDpuhoaLEUOvj9jR0w8uawttzWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5I6cu/3; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5I6cu/3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so8644335a12.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784623022; cv=none;
        d=google.com; s=arc-20260327;
        b=Vk2mj2ghpPmEaYOIz4nVmiWCtMj55jgkB0m7TT88K1GCfnfMIu0lyeeJCH5xuFqsRa
         X0WBO7R8KBx69dIHPUseqcSNgP98vFnV5k/PH+aJFGa2RGHdRQvdHSxRDOudYBtpWuCc
         Kaq54/sFzVCOzTChV8ZEQBpfYPMy9aIPUtRcze8uXMprhrwDsI3yDhrgxXFklhEAdzIg
         NVYmPkmk1OdxRXhT1ttbObPYSJ2pwbPAiBvWNKzRv9PDa9tGZPk2OLMAjf01KpB9EBOj
         GZrCy4OQrZjEITENMdZzrHRZev7suGl4hoDO9RikTVVfFABr0zhuSAo3BlkmpXjvjDVK
         TIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=meDLq1IHns8ToYvK1KV86Q2eW8As1MagReQeqUyoETc=;
        fh=v9e1WYUfrh+MmMyXwhdU7GcjsC+cBYHGR7QY/68xd6Y=;
        b=EkSabBowdbFC5oLnboNUMjVtLBPvJXfeRbW6PVqtAOUNTo8JETPx2dzF4QMypafwVn
         wf89BSmQlfXH7TLNWze3qLRRU/3AqV3De5GE+Xsq9HHH3RBAG3YnGa4aVH9pceUw/tWA
         HHcm5FvOmR9tIhQy9vrg4TpzDdKGqpw7uaibQTyv+88+vcmcwACVn++QILb/XKwW4b3A
         TGeBfl2oGKEMDiPwJexYrfnRiTnzTjeBjfe+lXkT5df2GnW8245IsJMWkIKM7upnmPtO
         M4xCbVc0O0AQUUqFcXnN2c+9EfvXsjZNlTG+k9245pQPpfxG9+YqlhnTbG2rXEbZwp3G
         5Brg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784623022; x=1785227822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=meDLq1IHns8ToYvK1KV86Q2eW8As1MagReQeqUyoETc=;
        b=r5I6cu/39D908/wd8M7JcpnrwDGJgqjvCENmFSxUxy1R1zWTHoMJ1/92JmNZW3/g+w
         EPi9wiSqf2ZYsob/F9apuusFQsiuRjb/4beZPPXZFRBlcY8sD6/l1avcdPuooikexknk
         XvNawgeOVO+mu0fSvFzuVtdFV16fs9tVI78oI4if+tUjnMUcmG1LtaoF3jnnCx4g3ckK
         dnrzumNhDlqoTJFftXT8lKyubJ4UgsvILshcVOXCFD1Mb5ZbThYX2BbIYtz/isCDFxt5
         3Lf3hcWhGihQChDXnhKqSxaFo3MwE4BeZ6Xdqb1YembzlOvAW7Cd9ArLJNKqB0p4cOyS
         NfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623022; x=1785227822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meDLq1IHns8ToYvK1KV86Q2eW8As1MagReQeqUyoETc=;
        b=KDOnAv4BZzSZIK0+BpiYyOp34Y5c3TpA2Hxltd0NTSSWq9q0Va79I+Rb33cVyYY0GK
         Cuda4miqKNE3Wc6tAgipPe18rGeYy3F4mmmyvZgyt4fOA4/kN/rGxbvi2hXJeYm+igoe
         FvZu+/N2EhbxFDbfX5sUYYyQQfX7CpuQjDgdEV6/EiKy7kA3XWcsSdoQCX+TiriNSC1N
         pbZdIdWL1We7q61mFbmUdr0602e8M4M231/H29UDSZo8PEJXeUPYQ1Ce13ZAa1sFL2BX
         +DfvDq3Y22EcKYX55qekO67v95A/QFeup/QF3BHGMi60HFElZH1Ksti1JestjSTihuSf
         s9Yw==
X-Forwarded-Encrypted: i=1; AHgh+RoSOowPnJ1EaKXoW5QE6aKHvIuu8A7h+AdugYEBo9YEE6IgWea6HXXJRhPC2cPf8SkUq/Dc9qr0pvc1uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHBMsUB0AEiP3NA+yasajQX6gKxxNSOAggKNWv5fgk/OG5l6pg
	7tJpWMeA2c9JdWXWRSMOnVmQRUBkwfMq1Hk5NBmBoHkm19QqG/krceP1QBmgGAoaPP2SQVs0mf2
	sB1FNs/28UfL/P2mVhTKzyyXizoRVb1s=
X-Gm-Gg: AfdE7cmLZJztcgHa06HrmvjoK/fB5Ky11mJMKkOKAEwD/S414VS+CHwn9HKvNNSMiNS
	fZUyiib4OT2zI/hj3sKQbIK+8RkmR5i4HZnA9uItRjVJ1gSH/ygXyXmvozxNadaqeIiVKU+Ku2+
	+f4z8cOnqSioY41EbYhgwvNWG1DSJNVMMozPmT3HgX/tVSPnAhMi26z9i0i0oQLmXnNgUjX8vb+
	UxloOw3207KtfUdYJvU7gmRv9+DelH1tLeDO5zWVc4ImNiAZBl4y94EWQbbV0O+6XvQVkCvuQGf
	RPPMU6TKVYZKQePTGpc=
X-Received: by 2002:a05:6300:48:b0:3c3:994f:b4f5 with SMTP id
 adf61e73a8af0-3c3ad67a262mr19149358637.28.1784623022499; Tue, 21 Jul 2026
 01:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625082111.47898-1-clamor95@gmail.com> <20260625082111.47898-2-clamor95@gmail.com>
 <20260714191637.GA1675278@killaraus.ideasonboard.com> <CAPVz0n0k4O1+RGFMhAUnFG7qsc-7HVwVj23-8MRGnYLzXL+TPw@mail.gmail.com>
 <20260715163106.GG1778116@killaraus.ideasonboard.com>
In-Reply-To: <20260715163106.GG1778116@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 21 Jul 2026 11:36:50 +0300
X-Gm-Features: AUfX_mzd1MTMZN_gNDYdz3bzofiIbzMVE9IfjLZdkm09sompRH8FIE3OHzoAJAU
Message-ID: <CAPVz0n1ivPO=Y+cv6sVAzaMqWYMJp9a-UwNipFM3CuXLCgkZXA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1 RESEND] media: i2c: mt9m114: Add get_fwnode_pad
 operation for IFP
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 15 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 19:31 Laur=
ent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jul 15, 2026 at 07:18:18PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 22:16 =
Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Thu, Jun 25, 2026 at 11:21:11AM +0300, Svyatoslav Ryhel wrote:
> > > > Currently, the driver's binding exposes only one endpoint, which ma=
ps to
> > > > the IFP subdevice's SOURCE pad. This configuration causes failures =
for
> > > > many devices using this camera because both the DT binding and the
> > > > one-to-one pad mapping logic map the endpoint to the wrong pad.
> > >
> > > Could you please explain what failures this causes ? A brief analysis=
  of
> > > the code seems to indicate the patch will only make a difference when
> > > the DT node has multiple endpoints, and will prevent links to be crea=
ted
> > > for any endpoint but the first one. I don't think that's desirable.
> >
> > OF schema documents only a single port with a single endpoint. Since
> > driver has no alternative OF matching logic endpoints patch to media
> > pads one-to-one. IFP has 2 pads, id 0 is sink and id 1 is source. So
> > according to one-to-one match endpoint from the binding co-responds to
> > the sink media pad of IFP, source pad which is usually used to build
> > the video pipe is not represented in the bindings entirely.
>
> But the mt9m114 driver doesn't use 1-to-1 matching, it does not use the
> v4l2_subdev_get_fwnode_pad_1_to_1() function to implement
> .get_fwnode_pad().
>

Correct, hence media framework does not know how to link pads and
starts to do weird stuff.

> > This causes drivers which relay on OF bindings to build their video pip=
es
> > fail to work with this driver.
>
> Could you provide an example of such a failure ?
>

Tegra VI driver hooks mt9m114 IFP sink pad to sci source and mt9m114
IFP sink pad to csi source. With this patch OF endpoint is strictly
associated with IFP source pad, and nothing else which is desirable
setup IMHO.

> > Sakari suggested this to fix OF
> > matching, so I have implemented it.
> >
> > > > Fix this
> > > > by implementing the get_fwnode_pad operation for the IFP, which cor=
rectly
> > > > matches the endpoint to the corresponding IFP pad.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++-----=
----
> > > >  1 file changed, 34 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m11=
4.c
> > > > index e395e2d14e97..16c2582551d3 100644
> > > > --- a/drivers/media/i2c/mt9m114.c
> > > > +++ b/drivers/media/i2c/mt9m114.c
> > > > @@ -1020,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9=
m114 *sensor)
> > > >       return ret;
> > > >  }
> > > >
> > > > -/* ---------------------------------------------------------------=
--------------
> > > > - * Common Subdev Operations
> > > > - */
> > > > -
> > > > -static const struct media_entity_operations mt9m114_entity_ops =3D=
 {
> > > > -     .link_validate =3D v4l2_subdev_link_validate,
> > > > -};
> > > > -
> > > >  /* ---------------------------------------------------------------=
--------------
> > > >   * Pixel Array Control Operations
> > > >   */
> > > > @@ -1381,6 +1373,10 @@ static const struct v4l2_subdev_internal_ops=
 mt9m114_pa_internal_ops =3D {
> > > >       .init_state =3D mt9m114_pa_init_state,
> > > >  };
> > > >
> > > > +static const struct media_entity_operations mt9m114_pa_entity_ops =
=3D {
> > > > +     .link_validate =3D v4l2_subdev_link_validate,
> > > > +};
> > > > +
> > > >  static int mt9m114_pa_init(struct mt9m114 *sensor)
> > > >  {
> > > >       struct v4l2_ctrl_handler *hdl =3D &sensor->pa.hdl;
> > > > @@ -1403,7 +1399,7 @@ static int mt9m114_pa_init(struct mt9m114 *se=
nsor)
> > > >
> > > >       /* Initialize the media entity. */
> > > >       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > > > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > > > +     sd->entity.ops =3D &mt9m114_pa_entity_ops;
> > > >       pads[0].flags =3D MEDIA_PAD_FL_SOURCE;
> > > >       ret =3D media_entity_pads_init(&sd->entity, 1, pads);
> > > >       if (ret < 0)
> > > > @@ -2092,6 +2088,29 @@ static int mt9m114_ifp_registered(struct v4l=
2_subdev *sd)
> > > >       return 0;
> > > >  }
> > > >
> > > > +/*
> > > > + * The IFP has only one fwnode endpoint, which corresponds to the =
pad
> > > > + * linked to the PA (PA SINK), while it should be the SOURCE for t=
he
> > > > + * next media device in the pipe.
> > > > + */
> > > > +static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
> > > > +                                   struct fwnode_endpoint *endpoin=
t)
> > > > +{
> > > > +     struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(entity=
);
> > > > +     struct mt9m114 *sensor =3D ifp_to_mt9m114(sd);
> > > > +     struct fwnode_handle *ifp_port =3D dev_fwnode(&sensor->client=
->dev);
> > >
> > > This is not a port fwnode. I'd name the variable just fwnode.
> > >
> >
> > fair
> >
> > > > +     struct fwnode_handle *ifp_ep;
> > > > +     int ret;
> > > > +
> > > > +     ifp_ep =3D fwnode_graph_get_next_endpoint(ifp_port, NULL);
> > > > +
> > > > +     ret =3D endpoint->local_fwnode =3D=3D ifp_ep ? 1 : -ENXIO;
> > > > +
> > > > +     fwnode_handle_put(ifp_ep);
> > > > +
> > > > +     return ret;
> > >
> > > Let's use the cleanup API:
> > >
> > > #include <cleanup.h>
> > >
> > > ...
> > >
> > >         struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(entity=
);
> > >         struct mt9m114 *sensor =3D ifp_to_mt9m114(sd);
> > >         struct fwnode_handle *fwnode =3D dev_fwnode(&sensor->client->=
dev);
> > >         struct fwnode_handle *ifp_ep __free(fwnode_handle) =3D
> > >                 fwnode_graph_get_next_endpoint(fwnode, NULL);
> > >
> > >         return endpoint->local_fwnode =3D=3D ifp_ep ? 1 : -ENXIO;
> > >
> >
> > The code is functionally same. I am fine with any version subsystem
> > maintainer will prefer.
> >

Sakari, should I apply Laurent's changes and resend?

> > > > +}
> > > > +
> > > >  static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops =
=3D {
> > > >       .s_stream =3D mt9m114_ifp_s_stream,
> > > >  };
> > > > @@ -2119,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops=
 mt9m114_ifp_internal_ops =3D {
> > > >       .unregistered =3D mt9m114_ifp_unregistered,
> > > >  };
> > > >
> > > > +static const struct media_entity_operations mt9m114_ifp_entity_ops=
 =3D {
> > > > +     .link_validate =3D v4l2_subdev_link_validate,
> > > > +     .get_fwnode_pad =3D mt9m114_ifp_get_fwnode_pad,
> > > > +};
> > > > +
> > > >  static int mt9m114_ifp_init(struct mt9m114 *sensor)
> > > >  {
> > > >       struct v4l2_subdev *sd =3D &sensor->ifp.sd;
> > > > @@ -2136,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *s=
ensor)
> > > >
> > > >       /* Initialize the media entity. */
> > > >       sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_ISP;
> > > > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > > > +     sd->entity.ops =3D &mt9m114_ifp_entity_ops;
> > > >       pads[0].flags =3D MEDIA_PAD_FL_SINK;
> > > >       pads[1].flags =3D MEDIA_PAD_FL_SOURCE;
> > > >       ret =3D media_entity_pads_init(&sd->entity, 2, pads);
>
> --
> Regards,
>
> Laurent Pinchart
