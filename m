Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086FF395D8E
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945500; cv=none; b=PQMsCLJD/g457yyRvhdQjV1q1c7lbg2Ohm6JY6NJWnyDaEDo5TPTpKlarnv6FK19y34beUMRzoskSNXjq5xZlZLkzevMUccWkwGbQGKZ3Nv4qsPxJn7ml0EJwNHb6dVhEtlJL75HH/a51MttlCOm6ncGWDHaJbfOwp8eEr3mmx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945500; c=relaxed/simple;
	bh=dc7W0gBpTJ4eZqqWi5yakWI/dCMPPB3RO2sNt+7oBV8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=AiAxXZO6Hjewb3+ghyb5XnR1T0j68ZOxS+IDIw/TBcNA8xOlPnN8LOw57NdQCl7+IwrtJFDFVg9KUfbjxjTNaVVYqN1WmYs73ag6HfkHFSc1NI0jGmPOL2430eNS2hlRE7/hdw4G0TqB6Yc2SqUaJAKwkZ+oCP0ayLKlXUL10ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oxSdPJ42 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oxSdPJ42"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67FA84B0;
	Wed,  9 Sep 2026 11:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788945399;
	bh=dc7W0gBpTJ4eZqqWi5yakWI/dCMPPB3RO2sNt+7oBV8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oxSdPJ42qBfq34jE5iplfQkTs3rpZKr482sG4ZLHslH17pMACHbTsVoGp5chuIQfg
	 VfO4EEDX0GJPkBpdZoidB5jtH7fj/SEtLVO0xj5s2gcwiyN5xM8F7LxaI3dEm6TooL
	 w1Vd3vm0yLmORX29lHm1ygJVOlUUV/Yv4Ui1pKAo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <177929435413.2341049.9256551425193410552@selene>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-31-sakari.ailus@linux.intel.com> <177929435413.2341049.9256551425193410552@selene>
Subject: Re: [PATCH v12 30/86] media: Documentation: Add binning and sub-sampling controls
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, " Ng, Khai Wen" <khai.wen.ng@intel.c
 om>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Wed, 09 Sep 2026 14:48:09 +0530
Message-ID: <178894548965.11722.1572509771464197490@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

+ Laurent

Quoting Jai Luthra (2026-05-20 21:55:54)
> Quoting Sakari Ailus (2026-04-09 22:14:05)
> > Document the binning and scaling controls (V4L2_CID_BINNING and
>=20
> nit: s/scaling/sub-sampling
>=20
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20

Sorry for bringing this up again, after providing my ack months ago.

> > V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
> > model.
> >=20
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.=
rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > index 0fb01bf6c825..fb6d8a1bcac7 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > @@ -144,8 +144,12 @@ separately horizontally and vertically.
> > =20
> >  The combined effect of binning and sub-sampling is configured using the
> >  ``V4L2_SEL_TGT_COMPOSE`` rectangle, relative to the analogue crop rect=
angle, on
> > -(pad, stream) pair 1/0. The driver implementation determines how to co=
nfigure
> > -binning and sub-sampling to achieve the desired size.
> > +(pad, stream) pair 1/0. It depends on the driver which of these operat=
ions are
> > +being used to achieve the resulting size. Binning and sub-sampling are=
 also
> > +directly configured using :ref:`V4L2_CID_BINNING_FACTORS
> > +<image_source_control_binning_factors>` and
> > +:ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and V4L2_CID_SUBSAMPLING_VERTICAL
> > +<image_source_control_subsampling>` controls on drivers that support t=
hem.
> > =20
> >  The digital crop operation takes place after binning and sub-sampling.=
 It is
> >  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, str=
eam) pair
> > @@ -216,9 +220,15 @@ Also refer to :ref:`Selection targets <v4l2-select=
ion-targets-table>`.
> >        - \-
> >        - X
> >        - Binning and sub-sampling. This rectangle is relative to the
> > -        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> > -        combination of binning and sub-sampling is configured using th=
is
> > -        selection target.
> > +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Bin=
ning is
> > +        configured using the :ref:`V4L2_CID_BINNING_FACTORS
> > +        <image_source_control_binning_factors>` control and sub-sampli=
ng is configured
> > +        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> > +        V4L2_CID_SUBSAMPLING_VERTICAL <image_source_control_subsamplin=
g>`
> > +        controls on drivers that support these controls. To configure =
binning
> > +        and sub-sampling on drivers that do not support these controls=
, the
> > +        selection rectangle may be changed directly to configure the c=
ombined
> > +        effect on the image size.

While discussing the libcamera design to support binning and sub-sampling
using the new model, I realized that drivers have two different ways to
configure binning and subsampling, listed below:

    1. Use the CID_BINNING_FACTORS and CID_SUBSAMPLING_HORIZONTAL/VERTICAL
       controls, and reflect the final resolution through the compose
       rectangle as read-only
    2. Allow writes to the compose rectangle directly, without a clear
       split between binning and sub-sampling

Pre-ADC there is usually only binning and skipping possible from what I've
seen. And arbitrary Post-ADC scaling can be handled by the compose
rectangle on the the source pad.

So do we really need to allow the second way of userspace configuring the
image pad's compose rectangle directly?

Thanks,
    Jai

> >      * - 2/0
> >        - Format
> >        - X
> > --=20
> > 2.47.3
> >
>
