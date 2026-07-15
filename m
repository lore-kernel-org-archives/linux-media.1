Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E1A30ACEE
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132316; cv=pass; b=PpLCuyqnTx4N6qj4hK9/rqg6ikXIizmXF5vD9/kJDCvEMutne4rouiATNkPBeGolEsgu401MR9Izcg9yVAT7uBAldl6dJfvT8WTevIARl5hUvAG8HKDGqhjXQDXicFqaRSDCytTjrqobDXMprIc2UzMklMgxOP/NZLbV/VA7OUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132316; c=relaxed/simple;
	bh=U2syg8AIojrYjU+GxqvC7bFEPPqxZmATsDoSc298rQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umLvbmF2Eg4U/ishpCgz49P/PXvz8QFIZ0Wp1yqGD0AytvgzE4dz/UMMDomVfhqx85rzxLPNUMNcbAIglFpgElWw1RBKRc5lc6WHBd+rcxqoh3OsVSVWezBrhq8NbjL6s/Y3JzIfKKqdbxtSdYQMP/nd+9ooCo+5nIZk5JvWZ5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvdZywHm; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvdZywHm"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3004344a91.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 09:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784132310; cv=none;
        d=google.com; s=arc-20260327;
        b=oQp1gTMAF8nxu3u14DcyGRJvI4KycLl3VRLz3rU/qrPZ/2w8hy3vRXNjZcwP6kjHnD
         5I9WiYkKhRnc5FEEUy/Wc+j2HNqjT1/vFdQUefB92DQhFv4dadFvlvEYtHqCFGHuAAT/
         RDixYpJc9DTF3z6HFwQg3sc07XjyVDzqwtiOYwCvvyrUy7yNwLGkwad+tWC8snXgax5K
         kHoJy4LVoT51MJnfS1gaA0KsUBGDpwfi9LQCDRpArqKWHJLQKWfQYBO8JOSc4uyc+FSK
         u/mSyeJAViafyzNCeQE1oqe98nLYBkOtUFjgoz2ltg0IAs3SuzTZvCSZugNUDXzSz8kH
         3+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NlFVoCez9/nmXyw1kBQxctSp6WzemJbhufJRBJ2BlWA=;
        fh=5+/Blg5FHX/su2+FYubELp8MknlJ71FBHvkJhXMs8vU=;
        b=GVpcPcEGHRBytZcqA4MxP5SA+e4kqUa2sgg1ulk8NNs+/f8IJZdgCbVZr0n5/ATkWy
         D+O9gDWaJEBIdCL8JpZsitqRMTQI+4m27ci74Ta4JIfEPgqTZ6Hnl6iFSdKwpcpx4Kxz
         QpJ9CsYYeDbyv0uZizhgS4idndvqcyETddna/RukST7pbsG8ml7H6uRZFCM7MAOl6RB0
         BlCV4/DpRUXgWG8qYQt0TMzHGNBCOlYiAiVbsZMfa1J6Ed+ZCNYvd501k6BugjYAXvGJ
         wOlXtdzAco+VDO3bqUuz+npMcTC9PHfylcpZYSea+OHqBhzwwfr3SgDWuVxc7KXtuwoJ
         shEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784132310; x=1784737110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NlFVoCez9/nmXyw1kBQxctSp6WzemJbhufJRBJ2BlWA=;
        b=SvdZywHmimZ/elRkdnzSnepMQF+MBV4yocIbNbz6y+yybZh8Y6mcX/yVqwQHUa+BmR
         H/gNltRrs688Pn74aSMPM97G7hw33jz4mG10XrfnYNHubAxrAY3n6PYjq439U0dW0TUD
         tPVoIvl52JDcCjEhhD4VobjXENPTQoTg1POHbx1cF2Okgbm++FR+EhH1BvaooD1yVuR3
         nIZED3qpTb3+eYUW8Q0w4SCJtvuZFB16pjm7pbRuCm9g9TX/vDxKTzav70hvsprPjAfP
         hV/CLNAkHVJr03Ge8zPgdpsenftenQcbYJKVzCg5uqEBAG9y6nJKfvpr55Ah0zt9hOeV
         ZmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784132310; x=1784737110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlFVoCez9/nmXyw1kBQxctSp6WzemJbhufJRBJ2BlWA=;
        b=hZfR+fb5imHwUWZTvFwk9T5cF8BRCUFhNCd6RLY5yGvRxMbaTCn/z2KPooRipSbXDf
         OHrhZHirMG4kaVlJP1D8yXIcAg86VM7Pbr1K3kS6W7K2ySBc0q+xnPrysA2aC9eXfiKq
         qp8o+cusP3BUPKk1HHBU1r8boyUgL2+hujpZyyCWtUg0zcUYpFqDZxGmwuNhXKZhAbsc
         tkgE45R9cAz3bW8JIdu153rWysu7OD06ZH2U02HmX0eiJT8NqcWln5+l5TLQ/aMT72Sa
         nUDrBr0/VEWHdvOHKogLwqmtb5i7KclBINabvje7waHN+rJR4PcjtXEYNBtWvoJ9LWBp
         elxw==
X-Forwarded-Encrypted: i=1; AHgh+RpokuhJCJ+cd3I2BCmYnoahWT03ozL2XGfqHy7MnFbi8RoFyWT7Uba37BqwydfE3r7aBdimq4kbiYcH8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySDsZ5LzbWgCldqT+d7nEP29Rln+aZ329SAR06yzt2uNcFDTyr
	wdLsl7IhbB5H7rCaRZaEnmacAngE/u6hsVOzt7BTN+ZytKP5+i1+zIMtRQGjP5ITj2Ty2eKj+dT
	zMYvVRRbCBgAlGxdszZRDtuO8Z/Jwz8w=
X-Gm-Gg: AfdE7cn/bsJpinyoHYpodaRpX3OgcJrFhj7ZOAPl3dN4sEhN25mAEC6mFo3xra7r1pY
	XQiP4SJ0Hx0Yce4kxVW3rn6WA/JxJ1ahJ7DlbR3KfLDGOv58TTVhRnEYDScAT+P4GGVDPnVCIJV
	+qkgjY+3b/Zulug2lmOpL9GgsjHaMpONoYPZsXjgl8HKM0/5guskhTnU8DhPh+7EvPq2gNfJ+lj
	Nx9+Gs2E10jGqSlj3iKkDljUAQ7hHpoR17bS2Igw1L34GFB5qMB3pRkfHc0xgJBvIcZ2jvHtd4k
	gy/02biyV4dxEe1q3L6WX7H5pao2sg==
X-Received: by 2002:a17:90a:c884:b0:38e:2c8f:a01a with SMTP id
 98e67ed59e1d1-38e2c8fa1e5mr2496545a91.11.1784132309964; Wed, 15 Jul 2026
 09:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625082111.47898-1-clamor95@gmail.com> <20260625082111.47898-2-clamor95@gmail.com>
 <20260714191637.GA1675278@killaraus.ideasonboard.com>
In-Reply-To: <20260714191637.GA1675278@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 15 Jul 2026 19:18:18 +0300
X-Gm-Features: AUfX_mxldMVFwZCRb9cp6mj4kWFNazomXbVFXCv-6HhJZ3d0vbkbpIkfIduB_pI
Message-ID: <CAPVz0n0k4O1+RGFMhAUnFG7qsc-7HVwVj23-8MRGnYLzXL+TPw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1 RESEND] media: i2c: mt9m114: Add get_fwnode_pad
 operation for IFP
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 22:16 Laur=
ent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> Thank you for the patch.
>
> On Thu, Jun 25, 2026 at 11:21:11AM +0300, Svyatoslav Ryhel wrote:
> > Currently, the driver's binding exposes only one endpoint, which maps t=
o
> > the IFP subdevice's SOURCE pad. This configuration causes failures for
> > many devices using this camera because both the DT binding and the
> > one-to-one pad mapping logic map the endpoint to the wrong pad.
>
> Could you please explain what failures this causes ? A brief analysis  of
> the code seems to indicate the patch will only make a difference when
> the DT node has multiple endpoints, and will prevent links to be created
> for any endpoint but the first one. I don't think that's desirable.
>

OF schema documents only a single port with a single endpoint. Since
driver has no alternative OF matching logic endpoints patch to media
pads one-to-one. IFP has 2 pads, id 0 is sink and id 1 is source. So
according to one-to-one match endpoint from the binding co-responds to
the sink media pad of IFP, source pad which is usually used to build
the video pipe is not represented in the bindings entirely. This
causes drivers which relay on OF bindings to build their video pipes
fail to work with this driver. Sakari suggested this to fix OF
matching, so I have implemented it.

> > Fix this
> > by implementing the get_fwnode_pad operation for the IFP, which correct=
ly
> > matches the endpoint to the corresponding IFP pad.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++---------
> >  1 file changed, 34 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > index e395e2d14e97..16c2582551d3 100644
> > --- a/drivers/media/i2c/mt9m114.c
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -1020,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114=
 *sensor)
> >       return ret;
> >  }
> >
> > -/* -------------------------------------------------------------------=
----------
> > - * Common Subdev Operations
> > - */
> > -
> > -static const struct media_entity_operations mt9m114_entity_ops =3D {
> > -     .link_validate =3D v4l2_subdev_link_validate,
> > -};
> > -
> >  /* -------------------------------------------------------------------=
----------
> >   * Pixel Array Control Operations
> >   */
> > @@ -1381,6 +1373,10 @@ static const struct v4l2_subdev_internal_ops mt9=
m114_pa_internal_ops =3D {
> >       .init_state =3D mt9m114_pa_init_state,
> >  };
> >
> > +static const struct media_entity_operations mt9m114_pa_entity_ops =3D =
{
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +};
> > +
> >  static int mt9m114_pa_init(struct mt9m114 *sensor)
> >  {
> >       struct v4l2_ctrl_handler *hdl =3D &sensor->pa.hdl;
> > @@ -1403,7 +1399,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor=
)
> >
> >       /* Initialize the media entity. */
> >       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > +     sd->entity.ops =3D &mt9m114_pa_entity_ops;
> >       pads[0].flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&sd->entity, 1, pads);
> >       if (ret < 0)
> > @@ -2092,6 +2088,29 @@ static int mt9m114_ifp_registered(struct v4l2_su=
bdev *sd)
> >       return 0;
> >  }
> >
> > +/*
> > + * The IFP has only one fwnode endpoint, which corresponds to the pad
> > + * linked to the PA (PA SINK), while it should be the SOURCE for the
> > + * next media device in the pipe.
> > + */
> > +static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
> > +                                   struct fwnode_endpoint *endpoint)
> > +{
> > +     struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(entity);
> > +     struct mt9m114 *sensor =3D ifp_to_mt9m114(sd);
> > +     struct fwnode_handle *ifp_port =3D dev_fwnode(&sensor->client->de=
v);
>
> This is not a port fwnode. I'd name the variable just fwnode.
>

fair

> > +     struct fwnode_handle *ifp_ep;
> > +     int ret;
> > +
> > +     ifp_ep =3D fwnode_graph_get_next_endpoint(ifp_port, NULL);
> > +
> > +     ret =3D endpoint->local_fwnode =3D=3D ifp_ep ? 1 : -ENXIO;
> > +
> > +     fwnode_handle_put(ifp_ep);
> > +
> > +     return ret;
>
> Let's use the cleanup API:
>
> #include <cleanup.h>
>
> ...
>
>         struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(entity);
>         struct mt9m114 *sensor =3D ifp_to_mt9m114(sd);
>         struct fwnode_handle *fwnode =3D dev_fwnode(&sensor->client->dev)=
;
>         struct fwnode_handle *ifp_ep __free(fwnode_handle) =3D
>                 fwnode_graph_get_next_endpoint(fwnode, NULL);
>
>         return endpoint->local_fwnode =3D=3D ifp_ep ? 1 : -ENXIO;
>

The code is functionally same. I am fine with any version subsystem
maintainer will prefer.

> > +}
> > +
> >  static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops =3D {
> >       .s_stream =3D mt9m114_ifp_s_stream,
> >  };
> > @@ -2119,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9=
m114_ifp_internal_ops =3D {
> >       .unregistered =3D mt9m114_ifp_unregistered,
> >  };
> >
> > +static const struct media_entity_operations mt9m114_ifp_entity_ops =3D=
 {
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +     .get_fwnode_pad =3D mt9m114_ifp_get_fwnode_pad,
> > +};
> > +
> >  static int mt9m114_ifp_init(struct mt9m114 *sensor)
> >  {
> >       struct v4l2_subdev *sd =3D &sensor->ifp.sd;
> > @@ -2136,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *senso=
r)
> >
> >       /* Initialize the media entity. */
> >       sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_ISP;
> > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > +     sd->entity.ops =3D &mt9m114_ifp_entity_ops;
> >       pads[0].flags =3D MEDIA_PAD_FL_SINK;
> >       pads[1].flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&sd->entity, 2, pads);
>
> --
> Regards,
>
> Laurent Pinchart
