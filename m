Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824903E1CE4;
	Mon, 27 Jul 2026 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138215; cv=none; b=b0kpwXg/1BREGdwFahCCEdPs9vI6Dxm6C+A031bew5/sewxvYxyvovw+G8BLpIMA9rqEF4Cvj9vGgeO18mam91pJm0bDh3wP0WZyQVlBkGYoCZySPssGPBPaBolwhjW8HQUD5vQF2C0mJ/5dD0PXKF5PnQgBPxe92O1WYezSwZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138215; c=relaxed/simple;
	bh=FsToTW8CPE5QYMVY41m1P9W+VA2rAUPKuOE3t/hjBAg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GeFbQHETMt065ze37B8gTf5kGFt62G7mdn8ORkrGKPsXN5eSiPVnckQ6n00zwVX/GYj9zw9TYFbiiHPNx0r9gE+c5YiAwD8cPiCKglcpyee2TSCejtY0S5+/KXmp47iww/091m5KbLe8rV324LUsepAWdrUr6Z3Cbx8ZXESLeG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qPTAOJLJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qPTAOJLJ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 174A73A4;
	Mon, 27 Jul 2026 09:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785138146;
	bh=FsToTW8CPE5QYMVY41m1P9W+VA2rAUPKuOE3t/hjBAg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qPTAOJLJnb/JCNE/eYr66Vi+Bl20DRc8weQngo6YMaPf+4v63BmeKpskaQ5jk/OgD
	 mlfNcuaWUIjb56t93dCcc0uiXKxLO4GewZMxBzhv4ILYK1RmwEfZLAO3FK85YDFiy0
	 3wKurVx+Jpl9sXCD5iTohr7WqDTdJRQ42/DNlY0o=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <amb9dOkox3zqr85t@zed>
References: <20260724-mira220-v8-0-d1899ab64709@ideasonboard.com> <20260724-mira220-v8-2-d1899ab64709@ideasonboard.com> <178491944579.3026322.17711300671190246368@freya> <amb9dOkox3zqr85t@zed>
Subject: Re: [PATCH v8 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 27 Jul 2026 13:13:24 +0530
Message-ID: <178513820492.506511.7934025901057482473@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Jacopo,

Quoting Jacopo Mondi (2026-07-27 12:16:53)
> Hi Jai
>=20
> On Sat, Jul 25, 2026 at 12:27:25AM +0530, Jai Luthra wrote:
> > Hi Jacopo,
> >
> > Thank you for the fixes!
> >
> > Quoting Jacopo Mondi (2026-07-24 21:07:01)
> > > From: Philippe Baetens <philippebaetens@gmail.com>
> > >
> > > Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> > > sensor.
> > >
> > > Mira220 is a global shutter image sensor with a resolution of 1600x14=
00
> > > pixels.
> > >
> > > The driver implements support for mono and RGB 12, 10 and 8 bits
> > > formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> > > frame rate up to 90 fps.
> > >
> > > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >
> >
> > [...]
> >
> > > +static int mira220_parse_endpoint(struct device *dev, struct mira220=
 *mira220)
> > > +{
> > > +       struct fwnode_handle *endpoint;
> > > +       struct v4l2_fwnode_endpoint ep_cfg =3D {
> > > +               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> > > +       };
> > > +       int ret =3D 0;
> > > +
> > > +       endpoint =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),=
 0, 0, 0);
> > > +       if (!endpoint) {
> > > +               dev_err(dev, "Endpoint node not found\n");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> > > +               ret =3D -EINVAL;
> > > +               dev_err(dev, "Failed to parse endpoint\n");
> > > +               goto error_out;
> > > +       }
> > > +
> > > +       /* Non-continuous mode not implemented. */
> > > +       if (ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS=
_CLOCK) {
> > > +               dev_warn(dev, "clock non-continuous mode not supporte=
d\n");
> > > +               ret =3D -EINVAL;
> > > +               goto error_out;
> > > +       }
> > > +
> > > +       if (ep_cfg.nr_of_link_frequencies > ARRAY_SIZE(mira220_link_f=
reqs)) {
> > > +               ret =3D -EINVAL;
> > > +               dev_err(dev, "Unsupported number of link_frequencies:=
 %u\n",
> > > +                       ep_cfg.nr_of_link_frequencies);
> > > +               goto error_out;
> > > +       }
> > > +
> > > +       if (ep_cfg.link_frequencies[0] !=3D MIRA220_LINK_FREQ_750M) {
> >
> > The LLM-bot says link_frequencies[0] might be invalid if DT omitted the
> > link-frequencies property, and I think that's a valid concern.
>=20
> Yeah the bot is right, my bad
>=20
> I thought the property was required by fw, but it's not.
>=20
> >
> > Any particular reason for not using the v4l2_link_freq_to_bitmap() help=
er I
>=20
> I think I missed it from your previous comment, sorry :)
>=20
> Now that I look at it, the function wants link_frequencies from fw
>=20
> drivers/media/v4l2-core/v4l2-common.c-  if (!num_of_fw_link_freqs) {
> drivers/media/v4l2-core/v4l2-common.c-          dev_err(dev, "no link fre=
quencies in firmware\n");
> drivers/media/v4l2-core/v4l2-common.c-          return -ENODATA;
> drivers/media/v4l2-core/v4l2-common.c-  }
>=20

Ah thanks for checking, I missed that requirement for using the helper.

> Should I:
>=20
> - make link_frequencies required in bindings (something that doesn't
>   seem that useful considering a single freq is supported)
>=20

I have a slight preference towards this option.

Many receiver drivers use v4l2_get_link_freq() to configure the PHY, so
even a single freq in the endpoint is useful. Plus it would keep the driver
logic simple too.

Thanks,
    Jai

> - only call v4l2_link_freq_to_bitmap() if the property is specified ?
>=20
> ?
>=20
> > had suggested? It can handles all of these cases and error msgs too.
> >
> > With the edge case fixed (with or without the helper):
> >
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> Thanks
>   j
>=20
> >
> > Thanks,
> >     Jai
