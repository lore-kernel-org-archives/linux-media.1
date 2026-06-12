Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3BB313E24
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260200; cv=none; b=CcP/NOmJO5n5dhZviN9hF7ZQf5bwxBCauH5zDoIDoeuRcb/eoW2hHZ9hfwpJceHVzuXgJ0N/bS3GoDFlmXeTd9nAriVd/cC7OWO1nFPioyBVxQIgOoKfbZJiVWAaaV+/j1gWKO5YugOtEOLB9GzCvdQI7So1dFiPiJVK3GvDgPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260200; c=relaxed/simple;
	bh=x8O727wiOOGNsB3Ca/Z8auB4s+mtmonfhRsPvAc+DBE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=nqm57T/GGthnbrx+yE9VHDcnGK0ukv/RY0SM4o98X9wUv3VP0leAOvHYeTp5bhWcTD4EUZi2sq8YPbAGgMYOkGJ73uNeu0UhMwzBePA0WnpNQt29RQTX/xxxnt4dHD9GvnbYiQlenVPX2dcsAmc+jnoB8xZklczwY43nKKd6LKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OF1OWWNa reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OF1OWWNa"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E08FD1337;
	Fri, 12 Jun 2026 12:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781260164;
	bh=x8O727wiOOGNsB3Ca/Z8auB4s+mtmonfhRsPvAc+DBE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OF1OWWNax3+ftWY1VZt7eAoR/rfXIqL6hikrQ009nOxGvxpZShKmLaDmV1wOCd1F3
	 UxuOBpsEOcTffB97GVIgtaCGH/L99ChV7hf8EXxDWtxc8MrspAq2VUymuMCsxl2UXP
	 t1UoRt5wuRi8c96o6xH4vXbsv+5U+9jlwVCWxJUg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aiqlfoCg-s8WKs1m@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-14-sakari.ailus@linux.intel.com> <177926218793.2341049.4470290417149054877@selene> <aiqlfoCg-s8WKs1m@kekkonen.localdomain>
Subject: Re: [PATCH v12 13/86] media: Documentation: v4l: Document internal sink pads
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hoc
 k" <ong.hock.yu@intel.com>, " Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 12 Jun 2026 15:59:49 +0530
Message-ID: <178126018967.1799417.5003592846125660059@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Sakari Ailus (2026-06-11 17:39:34)
> Hi Jay,
>=20
> Thanks for the review.
>=20
> On Wed, May 20, 2026 at 09:29:47AM +0200, Jai Luthra wrote:
> > Hi Sakari,
> >=20
> > Thank you for the patch.
> >=20
> > Quoting Sakari Ailus (2026-04-09 22:13:48)
> > > Document internal sink pads, pads that have both SINK and INTERNAL fl=
ags
> > > set. Use the IMX219 camera sensor as an example.
> > >=20
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > ---
> > >  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++=
++
> > >  .../media/v4l/ext-ctrls-image-source.rst      |  2 ++
> > >  2 files changed, 26 insertions(+)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/D=
ocumentation/userspace-api/media/v4l/dev-subdev.rst
> > > index 142e2cd95062..39c281991460 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > @@ -554,6 +554,25 @@ A stream at a specific point in the media pipeli=
ne is identified by the
> > >  sub-device and a (pad, stream) pair. For sub-devices that do not sup=
port
> > >  multiplexed streams the 'stream' field is always 0.
> > > =20
> > > +Internal sink pads and routing
> > > +------------------------------
> > > +
> > > +Cases where a single sub-device source pad is carries multiple strea=
ms, one or
> >=20
> > "is carries" -> "carries" or is "carrying"
>=20
> I'll use "carries".
>=20
> >=20
> > > +more of which originate from within the sub-device itself, are speci=
al as there
> > > +is no external sink pad for such routes. In those cases, the sources=
 of the
> >=20
> > I think this paragraph could read slightly easier:
> >=20
> > There are special cases where a single sub-device source pad carries
> > multiple streams, one or more of which originate from within the sub-de=
vice
> > itself. In those cases, the sources of...
>=20
> How about instead:
>=20
> Internal sink pads are used to denote sources of routes that originate fr=
om
> within a sub-device itself. No external sink pads exist for such routes.
> Internal sink pads have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INT=
ERNAL>`
> pad flag set.
>=20

Yes that's even better.

> >=20
> > With that,
> >=20
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> >=20

Thanks,
    Jai

> > > +internally generated streams are represented by internal sink pads, =
which are
> > > +sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-IN=
TERNAL>` pad
> > > +flag set.
> > > +
> > > +Internal pads have all the properties of an external pad, including =
formats and
> > > +selections. The format in this case is the source format of the stre=
am. An
> > > +internal pad always has a single stream only (0).
> > > +
> > > +Routes from an internal sink pad to an external source pad are creat=
ed by the
> > > +driver and can be activated and deactivated using the
> > > +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag,=
 depending
> > > +on the device capabilities.
> > > +
> > >  Interaction between routes, streams, formats and selections
> > >  -----------------------------------------------------------
> > > =20
> > > @@ -691,3 +710,8 @@ To configure this pipeline, the userspace must ta=
ke the following steps:
> > >     the configurations along the stream towards the receiver, using
> > >     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to config=
ure each
> > >     stream endpoint in each sub-device.
> > > +
> > > +   In case generic raw and metadata formats are used, :ref:`V4L2_CID=
_CFA_PATTERN
> > > +   <image-source-control-cfa-pattern>` and :ref:`V4L2_CID_METADATA_L=
AYOUT
> > > +   <image_source_control_metadata_layout>` controls are present on t=
he source
> > > +   sub-device to obtain the pixel array CFA pattern and metadata lay=
out.
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-so=
urce.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > index e369978c2b50..490cd16186cd 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > @@ -153,6 +153,8 @@ Image Source Control IDs
> > > =20
> > >      This is a read-only control.
> > > =20
> > > +.. _image_source_control_metadata_layout:
> > > +
> > >  ``V4L2_CID_METADATA_LAYOUT (integer)``
> > >      The metadata layout control defines the metadata layout on the d=
evice's data
> > >      interface for metadata streams. The control is used in conjuncti=
on with
> > > --=20
> > > 2.47.3
> > >
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus
>
