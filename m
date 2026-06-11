Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50C21B9F6
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172777; cv=none; b=QYhgXQOAEyVYz2/EEC3QRyU5lIT5Yk43n0/sleuQ9qoHVCHaZQfypGVaYn0AQBH8eWuM8va6dhwdBDrlBO3kgj63UoqrCuqdw8nA4wbSzjMvunbs8z2czzkYsDUc6GLHwc6SRCO9Z8D6PzCud+lVnn/2bq/6x7yeCbl4ngwUuo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172777; c=relaxed/simple;
	bh=tdLsXKg4v5P+eY50q9SHWSLcLXmHrev387bPeFEOUd0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CL2oEXRqFyJk98zOqXiF3ykrs2JP22ws7XCtzcHPelh+FXeXfq8inGIcNtLK29dKa/ALZ4pZwh1/IqUElSgT1bo0UkxWVfhWVSm9Czebpw72fzPblHndRFlbyP0B5qUbKRWfDwmOvX/CI0959+0OycBZBqzy4kfYMbJ4NxVbhpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iozQIm70 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iozQIm70"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A8C1497;
	Thu, 11 Jun 2026 12:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781172743;
	bh=tdLsXKg4v5P+eY50q9SHWSLcLXmHrev387bPeFEOUd0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iozQIm70r1g3NKsXvoFSUqlPMevOiwVgCdIab4dpSCaWyuqlpDmAFls/IFOl6Ll+E
	 XYATGChkitboNmSzykDNf7hGw/Uy9fP8jvqPBdwxJ5uMLivNZXHa8QVZFjlQuVrItU
	 5MWVEkIlLMnjKaLJQ77xpTjKAl2ZjRnSxX/vwlIw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aip4HgMfEnidvlPN@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-34-sakari.ailus@linux.intel.com> <178115623672.1799417.2005627235315487289@freya> <aip4HgMfEnidvlPN@kekkonen.localdomain>
Subject: Re: [PATCH v12 33/86] media: uapi: Add new controls for camera sensor FLL and LLP
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hoc
 k" <ong.hock.yu@intel.com>, " Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 11 Jun 2026 15:42:48 +0530
Message-ID: <178117276804.1799417.8559157915944888952@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Sakari Ailus (2026-06-11 14:25:58)
> Hi Jai,
>=20
> On Thu, Jun 11, 2026 at 11:07:16AM +0530, Jai Luthra wrote:
> > Hi Sakari,
> >=20
> > Quoting Sakari Ailus (2026-04-10 01:44:08)
> > > Add new controls for camera sensors, V4L2_CID_LINE_LENGTH_PIXELS and
> > > V4L2_CID_FRAME_LENGTH_LINES, to convey the combined size of the analo=
gue
> > > crop rectangle and horizontal and vertical blanking.
> > >=20
> > > The reason for adding the new controls is that they're much easier to=
 use
> > > as the user doesn't have to be concerned of the analogue crop in the =
same
> > > context. Secondarily, the newly added common raw sensor model uses
> > > different values for the same.
> > >=20
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++=
++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> > >  include/uapi/linux/v4l2-controls.h                     |  3 +++
> > >  3 files changed, 15 insertions(+)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-so=
urce.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > index 63e53c883db6..fb4dee1b4f94 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > @@ -201,3 +201,13 @@ For instance, a value of ``0x0001000300020003`` =
indicates binning by 3
> > >      Sub-sampling is used to downscale an image, horizontally and ver=
tically, by
> > >      discarding a part of the image data. Typically sub-sampling prod=
uces lower
> > >      quality images than binning.
> > > +
> > > +.. _image_source_control_frame_length:
> > > +
> > > +``V4L2_CID_FRAME_LENGTH_LINES (integer)``
> > > +    Frame length in lines. The value of the control is the number of=
 lines
> > > +    captured in the sensor's pixel array added to the vertical blank=
ing.
> > > +
> > > +``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
> > > +    Line length in pixels. The value of the control is the number of=
 pixels per
> > > +    line captured in the sensor's pixel array added to the horizonta=
l blanking.
> >=20
> > In IMX219 driver in this series, we are exposing frame length in two-li=
nes
> > and two-line's length in pixels, which doesn't make sense with respect =
to
> > these control definitions.
> >=20
> > Similarly, for sensors like IMX283, IMX678 and others, the register is =
line
> > length in internal clock units, while the control is line length in pix=
els.
> >=20
> > So I think we should add a small note to prevent these awkward units fr=
om
> > propping up in the userspace:
> >=20
> > ``V4L2_CID_FRAME_LENGTH_LINES (integer)``
> >     Frame length in lines. The value of the control is the number of li=
nes
> >     captured in the sensor's pixel array added to the vertical blanking.
> >     Some sensors may have an internal register for the total vertical s=
ize
> >     that is in units of 2 lines or some other unit. But the control val=
ue
> >     should always reflect the number of lines in a frame.
> >=20
> > ``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
> >     Line length in pixels. The value of the control is the number of pi=
xels
> >     per line captured in the sensor's pixel array added to the horizont=
al
> >     blanking. Some sensors may have an internal register for the total
> >     horizontal size in units of some internal clock instead of pixels, =
or
> >     the total pixel count for multiple lines. But the control value sho=
uld
> >     always reflect the number of pixels in a line.
>=20
> The details are important here: these are really configuring timing on the
> sensor; reading "a line" may in fact mean combining data from multiple

In that case these controls shouldn't use words like pixels or lines at
all.

> lines. I think it's the "captured" that's problematic in the original
> description.
>=20
> How about:
>=20
> ``V4L2_CID_FRAME_LENGTH_LINES (integer)``
>     Frame length in lines. The value of the control is the number of lines
>     processed from the sensor's pixel array added to the vertical blankin=
g.
>     This control determines how many times lines are separately read per
>     frame from the sensor's pixel array and the control's value may be
>     related to e.g. the height the analogue crop rectangle in lines or the
>     number of lines output after sub-sampling or binning. Thus this value
>     should be understood to be primarily related to sensor internal timin=
g.
>=20
> ``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
>     Line length in pixels. The value of the control is the number of pixe=
ls
>     per line processed from the sensor's pixel array added to the
>     horizontal blanking. This control determines how many times pixels are
>     separately read from the sensor's pixel array per line and the
>     control's value may be related to e.g. the width of the analogue crop
>     rectangle in pixels or the number of pixels per line output after
>     sub-sampling or binning. Thus this value should be understood to be
>     primarily related to sensor internal timing.
>=20

For example, how do you think someone working on a sensor where the HMAX
register is in units of an internal clock which processes multiple pixels
per cycle interpret this paragraph?

LINE_LENGTH_PIXELS implies a "pixel" is the unit. So does PIXEL_RATE. And
EXPOSURE control is interpreted in units of "lines" as well.

You are proposing to repurpose those human-readable names that make sense
to most new developers to mean some internal units of a sensor, like 1/8th
of a pixel. IMHO that's a bad idea. More importantly, it's not even clear
from the names and descriptions, so a NAK from my side.

Thanks,
    Jai

> --=20
> Sakari Ailus
