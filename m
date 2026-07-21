Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94814363C62;
	Tue, 21 Jul 2026 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630331; cv=none; b=acdaXFWHg5jumUT6KofqScj3/Fo3BlZhXDSVCEF3kongxF0XGltzakYiiYmq4l6xQN3RLuq4FDeHaawPXjG7hn7jb8hv7GQVTRtA+nT1FRy8RSi+g6X6gNhBd1EFbGdo3p4zDMLMhUiJK0SPFeqDVHqxXdvbgNVOnHf3aryMdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630331; c=relaxed/simple;
	bh=xDBGJ6kDWKPQ2/TnC2/2iQqeENumve7XdhUgE3hN0do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrqpCGD5ZCaeTByvgP+P+1CTrazO5Z5fC2bZEjE2ZWDezUabYl5XQ8ur/1A1EuTXaXotnTurlX6v0/Br/8yyx8v5WOJi0opconxsElqWb75sUB5AlQRA3ao/Ed+XQhXtAGuTU2XqstMXgySN1KjHTQzXRED54BOoKqkBQwEtzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dgeCMBAo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dgeCMBAo"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9879FC1;
	Tue, 21 Jul 2026 12:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784630267;
	bh=xDBGJ6kDWKPQ2/TnC2/2iQqeENumve7XdhUgE3hN0do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgeCMBAoT8zCDE2aoOGZuP+UZZTgpZelgcz3X42rtAMFCHk7s+cgxTnC4a2F1vJVk
	 OsbW5DJWQqUBB00KeVfITw3zhwZ9lH59HZFpSHNiu06daNoTxnSp+0Nga/SgaVn3WJ
	 mFkdw2BUUs4bCe6dUVTPTJGJwBr2jP5hb3auzDy4=
Date: Tue, 21 Jul 2026 13:38:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1 RESEND] media: i2c: mt9m114: Add get_fwnode_pad
 operation for IFP
Message-ID: <20260721103845.GJ50424@killaraus.ideasonboard.com>
References: <20260625082111.47898-1-clamor95@gmail.com>
 <20260625082111.47898-2-clamor95@gmail.com>
 <20260714191637.GA1675278@killaraus.ideasonboard.com>
 <CAPVz0n0k4O1+RGFMhAUnFG7qsc-7HVwVj23-8MRGnYLzXL+TPw@mail.gmail.com>
 <20260715163106.GG1778116@killaraus.ideasonboard.com>
 <CAPVz0n1ivPO=Y+cv6sVAzaMqWYMJp9a-UwNipFM3CuXLCgkZXA@mail.gmail.com>
 <20260721091257.GI50424@killaraus.ideasonboard.com>
 <CAPVz0n2UpVXuyVOxj-w1R-3Z1fxBDSuXY1Kgx0NcXEtS72H6MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2UpVXuyVOxj-w1R-3Z1fxBDSuXY1Kgx0NcXEtS72H6MA@mail.gmail.com>

On Tue, Jul 21, 2026 at 12:45:15PM +0300, Svyatoslav Ryhel wrote:
> вт, 21 лип. 2026 р. о 12:12 Laurent Pinchart пише:
> > On Tue, Jul 21, 2026 at 11:36:50AM +0300, Svyatoslav Ryhel wrote:
> > > ср, 15 лип. 2026 р. о 19:31 Laurent Pinchart пише:
> > > > On Wed, Jul 15, 2026 at 07:18:18PM +0300, Svyatoslav Ryhel wrote:
> > > > > вт, 14 лип. 2026 р. о 22:16 Laurent Pinchart пише:
> > > > > > On Thu, Jun 25, 2026 at 11:21:11AM +0300, Svyatoslav Ryhel wrote:
> > > > > > > Currently, the driver's binding exposes only one endpoint, which maps to
> > > > > > > the IFP subdevice's SOURCE pad. This configuration causes failures for
> > > > > > > many devices using this camera because both the DT binding and the
> > > > > > > one-to-one pad mapping logic map the endpoint to the wrong pad.
> > > > > >
> > > > > > Could you please explain what failures this causes ? A brief analysis  of
> > > > > > the code seems to indicate the patch will only make a difference when
> > > > > > the DT node has multiple endpoints, and will prevent links to be created
> > > > > > for any endpoint but the first one. I don't think that's desirable.
> > > > >
> > > > > OF schema documents only a single port with a single endpoint. Since
> > > > > driver has no alternative OF matching logic endpoints patch to media
> > > > > pads one-to-one. IFP has 2 pads, id 0 is sink and id 1 is source. So
> > > > > according to one-to-one match endpoint from the binding co-responds to
> > > > > the sink media pad of IFP, source pad which is usually used to build
> > > > > the video pipe is not represented in the bindings entirely.
> > > >
> > > > But the mt9m114 driver doesn't use 1-to-1 matching, it does not use the
> > > > v4l2_subdev_get_fwnode_pad_1_to_1() function to implement
> > > > .get_fwnode_pad().
> > >
> > > Correct, hence media framework does not know how to link pads and
> > > starts to do weird stuff.
> >
> > When .get_fwnode_pad() is not set, media_entity_get_fwnode_pad() will
> > return the first pad of the entity that matches the requested direction.
> > That should work fine as far as I can see.
> 
> Correct, those could be pad 0 and pad 1 of IFP depending on the caller.
> 
> > > > > This causes drivers which relay on OF bindings to build their video pipes
> > > > > fail to work with this driver.
> > > >
> > > > Could you provide an example of such a failure ?
> > >
> > > Tegra VI driver hooks mt9m114 IFP sink pad to sci source and mt9m114
> > > IFP sink pad to csi source. With this patch OF endpoint is strictly
> > > associated with IFP source pad, and nothing else which is desirable
> > > setup IMHO.
> >
> > Could you please investigate to see why this happens ? I suspect there's
> > a bug somewhere else, possibly in the VI driver.
> 
> I cannot copy proper log since my device has some USB regressions in 7.2.0 next
> 
> mt9m114 PA
>  pad 0: source ->  mt9m114 IFP pad 0
> 
> mt9m114 IFP
>  pad 0: sink <- csi channel pad 1
>                     <- mt9m114 PA pad 0
>  pad 1: source -> csi channel pad 0
> 
> CSI channel
>  pad 0: sink <- mt9m114 IFP pad 1
>  pad 1: source -> mt9m114 IFP pad 0
>                         -> vi output pad 0
> 
> As you can see csi channel pad 1 must not be linked to IFP and mt9m114
> IFP pad 0 must not be linked to CSI channel.
> 
> Tegra VI builds video graph by endpoint to endpoint and uses
> media_entity_get_fwnode_pad to get associated pad. Since this driver
> does not have get_fwnode_pad operation media_entity_get_fwnode_pad
> will return both sink and source depending on the call, hence we can
> see this cycling above. Adding get_fwnode_pad operation that links
> endpoint strictly yo IFP source eliminates ambiguity since
> get_fwnode_pad blocks sink of IFP to be exposed at all.

It seems to be a bug in the VI driver. It should never call
media_entity_get_fwnode_pad() on the IFP with a direction other than
SOURCE.

> > > > > Sakari suggested this to fix OF
> > > > > matching, so I have implemented it.
> > > > >
> > > > > > > Fix this
> > > > > > > by implementing the get_fwnode_pad operation for the IFP, which correctly
> > > > > > > matches the endpoint to the corresponding IFP pad.
> > > > > > >
> > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++---------
> > > > > > >  1 file changed, 34 insertions(+), 10 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > > > > > > index e395e2d14e97..16c2582551d3 100644
> > > > > > > --- a/drivers/media/i2c/mt9m114.c
> > > > > > > +++ b/drivers/media/i2c/mt9m114.c
> > > > > > > @@ -1020,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114 *sensor)
> > > > > > >       return ret;
> > > > > > >  }
> > > > > > >
> > > > > > > -/* -----------------------------------------------------------------------------
> > > > > > > - * Common Subdev Operations
> > > > > > > - */
> > > > > > > -
> > > > > > > -static const struct media_entity_operations mt9m114_entity_ops = {
> > > > > > > -     .link_validate = v4l2_subdev_link_validate,
> > > > > > > -};
> > > > > > > -
> > > > > > >  /* -----------------------------------------------------------------------------
> > > > > > >   * Pixel Array Control Operations
> > > > > > >   */
> > > > > > > @@ -1381,6 +1373,10 @@ static const struct v4l2_subdev_internal_ops mt9m114_pa_internal_ops = {
> > > > > > >       .init_state = mt9m114_pa_init_state,
> > > > > > >  };
> > > > > > >
> > > > > > > +static const struct media_entity_operations mt9m114_pa_entity_ops = {
> > > > > > > +     .link_validate = v4l2_subdev_link_validate,
> > > > > > > +};
> > > > > > > +
> > > > > > >  static int mt9m114_pa_init(struct mt9m114 *sensor)
> > > > > > >  {
> > > > > > >       struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
> > > > > > > @@ -1403,7 +1399,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
> > > > > > >
> > > > > > >       /* Initialize the media entity. */
> > > > > > >       sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > > > > > -     sd->entity.ops = &mt9m114_entity_ops;
> > > > > > > +     sd->entity.ops = &mt9m114_pa_entity_ops;
> > > > > > >       pads[0].flags = MEDIA_PAD_FL_SOURCE;
> > > > > > >       ret = media_entity_pads_init(&sd->entity, 1, pads);
> > > > > > >       if (ret < 0)
> > > > > > > @@ -2092,6 +2088,29 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
> > > > > > >       return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > +/*
> > > > > > > + * The IFP has only one fwnode endpoint, which corresponds to the pad
> > > > > > > + * linked to the PA (PA SINK), while it should be the SOURCE for the
> > > > > > > + * next media device in the pipe.
> > > > > > > + */
> > > > > > > +static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
> > > > > > > +                                   struct fwnode_endpoint *endpoint)
> > > > > > > +{
> > > > > > > +     struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> > > > > > > +     struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > > > > > > +     struct fwnode_handle *ifp_port = dev_fwnode(&sensor->client->dev);
> > > > > >
> > > > > > This is not a port fwnode. I'd name the variable just fwnode.
> > > > > >
> > > > >
> > > > > fair
> > > > >
> > > > > > > +     struct fwnode_handle *ifp_ep;
> > > > > > > +     int ret;
> > > > > > > +
> > > > > > > +     ifp_ep = fwnode_graph_get_next_endpoint(ifp_port, NULL);
> > > > > > > +
> > > > > > > +     ret = endpoint->local_fwnode == ifp_ep ? 1 : -ENXIO;
> > > > > > > +
> > > > > > > +     fwnode_handle_put(ifp_ep);
> > > > > > > +
> > > > > > > +     return ret;
> > > > > >
> > > > > > Let's use the cleanup API:
> > > > > >
> > > > > > #include <cleanup.h>
> > > > > >
> > > > > > ...
> > > > > >
> > > > > >         struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> > > > > >         struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > > > > >         struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
> > > > > >         struct fwnode_handle *ifp_ep __free(fwnode_handle) =
> > > > > >                 fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > > > >
> > > > > >         return endpoint->local_fwnode == ifp_ep ? 1 : -ENXIO;
> > > > > >
> > > > >
> > > > > The code is functionally same. I am fine with any version subsystem
> > > > > maintainer will prefer.
> > > > >
> > >
> > > Sakari, should I apply Laurent's changes and resend?
> > >
> > > > > > > +}
> > > > > > > +
> > > > > > >  static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
> > > > > > >       .s_stream = mt9m114_ifp_s_stream,
> > > > > > >  };
> > > > > > > @@ -2119,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9m114_ifp_internal_ops = {
> > > > > > >       .unregistered = mt9m114_ifp_unregistered,
> > > > > > >  };
> > > > > > >
> > > > > > > +static const struct media_entity_operations mt9m114_ifp_entity_ops = {
> > > > > > > +     .link_validate = v4l2_subdev_link_validate,
> > > > > > > +     .get_fwnode_pad = mt9m114_ifp_get_fwnode_pad,
> > > > > > > +};
> > > > > > > +
> > > > > > >  static int mt9m114_ifp_init(struct mt9m114 *sensor)
> > > > > > >  {
> > > > > > >       struct v4l2_subdev *sd = &sensor->ifp.sd;
> > > > > > > @@ -2136,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
> > > > > > >
> > > > > > >       /* Initialize the media entity. */
> > > > > > >       sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
> > > > > > > -     sd->entity.ops = &mt9m114_entity_ops;
> > > > > > > +     sd->entity.ops = &mt9m114_ifp_entity_ops;
> > > > > > >       pads[0].flags = MEDIA_PAD_FL_SINK;
> > > > > > >       pads[1].flags = MEDIA_PAD_FL_SOURCE;
> > > > > > >       ret = media_entity_pads_init(&sd->entity, 2, pads);

-- 
Regards,

Laurent Pinchart
