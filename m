Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB32BE7DD;
	Tue, 21 Jul 2026 05:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784610390; cv=none; b=mCxM3wO/2yxGjlk3JbDqE1CEGbsiHMfJhGp1975zmcjZexVuok8xmIhi6Q2c6fKLZxVaiWd+f/MnLXSlb535r+mImuunGfzlX3xEKlZ0PoXJPRzrPcix2zw4nOBs0TtEhHYy8ckgL+fcbaFPfcNwXPFwpnYNhyxHxVI8FI/s0U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784610390; c=relaxed/simple;
	bh=+SlVsu0byqwlv39VNd7MB8KOit5jVOQ59RbCUIDpmyo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qDjzKIbvuJ8XhXyLLYw/jkKW4LrBTsDBiO+PYqTqxicZfUo+RnAzdOC+Q4UkHmdXetBpeQK0Y3uqkd4TKmbbWNMT2EZcrLfkJ7S7cMymqS9PnwuM9MWfmrIQLenL9TRrwNA4D/NYekvupOU4q1zxuq7LA1DRcshhTy/q6FXzGF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tVU010Of; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tVU010Of"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8B92593;
	Tue, 21 Jul 2026 07:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784610327;
	bh=+SlVsu0byqwlv39VNd7MB8KOit5jVOQ59RbCUIDpmyo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tVU010Of+FyyRQjoH0R2LmJDQwP9nG0+23lEmIUvev3kXCxi3Hec0m1XMRe6WEdYR
	 x+bifmLBu3dagzLJLUP1J8lEyVzURNhEE8zdIs1281hq8Uve0eML4fxfbYQfP2OVHz
	 Z0rQ5LtE7zHRUmbkd/dn1J9PsqQQpdGKdM5oWSj8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com> <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com> <178455866124.1426769.18237320419273419942@freya> <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 21 Jul 2026 10:36:21 +0530
Message-ID: <178461038136.1426769.8068222330738680407@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Dave,

Quoting Dave Stevenson (2026-07-20 23:09:34)
> Hi Jai
>=20
> On Mon, 20 Jul 2026 at 15:44, Jai Luthra <jai.luthra@ideasonboard.com> wr=
ote:
> >
> > Hi Dave, Alexander,
> >
> > Quoting Dave Stevenson (2026-03-13 01:20:15)
> > > Hi Alexander
> > >
> > > On Thu, 12 Mar 2026 at 15:11, Alexander Shiyan
> > > <eagle.alexander923@gmail.com> wrote:
> > > >
> > > > This patch adds a V4L2 subdevice driver for the Sony IMX662 CMOS im=
age
> > > > sensor. The sensor has a native resolution of 1936x1100 (effective
> > > > 1920x1080) and can achieve up to 90 frames per second depending on
> > > > the configuration. The driver supports:
> > > > - MIPI CSI-2 with 2 or 4 data lanes.
> > > > - RAW10 and RAW12 formats (both colour and monochrome).
> > > > - Controls: exposure, analogue gain, horizontal/vertical blanking,
> > > >   horizontal/vertical flip, brightness.
> > > > - A placeholder V4L2_CID_HDR_SENSOR_MODE control for future Clear H=
DR
> > > >   support (the actual HDR modes are not yet implemented).
> > > > - Runtime PM.
> > > > - Cropping via the selection API.
> > > > - Multiple link frequencies selectable via device tree.
> > > >
> > > > Tested on ARM64 Rockchip RK3568 platform with a 24 MHz external clo=
ck
> > > > and various link frequencies.
> > >
> > > Interesting timing as I've been looking at IMX662 too, but on a Raspb=
erry Pi.
> > > FWIW my driver is at
> > > https://github.com/6by9/linux/blob/rpi-6.12.y-imx662/drivers/media/i2=
c/imx662.c
> > >
> >
> > I saw libcamera patches for IMX676,
>=20
> IMX676? I assume that's a typo.
>=20

Oops, yes I meant IMX662. Names are hard.

> > does the below branch have the latest
> > driver you plan to post as v2?
> >
> > https://github.com/6by9/linux/blob/rpi-6.18.y-imx662-mainline-clean/dri=
vers/media/i2c/imx662.c
>=20
> That's a downstream Pi tree. My mainline branch is
> https://github.com/6by9/linux/tree/mainline_imx662 and is basically
> the patches I intend to send.

Thank you.

> There is one niggle to resolve first in imx662_ctrls_init. There is
> currently a catch-22 in setting up the state vs initialising the
> blanking and exposure ranges as they refer to each other. I need to
> come back and look at that one.
>=20

I remember I faced something similar in IMX678 and ended up doing that
calculation explicity while initializing the blanking/exposure controls,
without reusing the set_framing_limits() function that is called on
resolution updates.

> > > Comments are based on brief testing and reading of the code. This is
> > > not a full review.
> > >
> > > > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> >
> > [...]
> >
> > > > +static int imx662_set_selection(struct v4l2_subdev *sd,
> > > > +                               struct v4l2_subdev_state *sd_state,
> > > > +                               struct v4l2_subdev_selection *sel)
> > > > +{
> >
> > Can we keep cropping and binning out of the initial driver,
>=20
> There is no binning currently implemented in this driver, only cropping.
>=20

Okay, that might make things easier to port to the new model.

> > and implement
> > it using the common raw sensor model directly?
> >
> > I did it for IMX678 [1] on Sakari's suggestion [2]. The two sensors are
> > quite similar, so I'm happy to help in whatever way I can on getting th=
is
> > working with the new model too :-)
>=20
> Is this effectively saying that linux-media is closed to sensor
> drivers not adopting the common raw sensor model, even though AIUI
> that isn't ready yet? I can accept that for a period, but how long is
> it reasonable for that to be the case? A year?
> With all due respect to those involved, the series has been around so
> long in various guises that it's a case of I'll believe it when I see
> it merged.
>=20
> There are already a number of sensor drivers in the tree that support
> set_selection (imx296 being the main one I care about). Presumably
> there is a plan for how to migrate those to work with the common
> sensor model without regression for existing users. Is there a reason
> that plan isn't also valid for imx662 and imx678?
>=20

Yes we can migrate in a way to support both the old and new models
depending upon the client capability flags, Sakari has done that for
IMX219. But it gets a bit cumbersome in the driver, especially for handling
binning through the new controls while supporting it through some other way
in old model.

Given you don't plan to add binning support, I think it shouldn't be as
complicated. The selection rectangle for analogue crop will move to the
internal image pad from the source pad if the client has the
COMMON_RAW_SENSOR capability.

> I would offer to review the common raw sensor patches, but as so much
> of it is core framework stuff and so is outside my area of knowledge.
> I guess I can do the same as your imx678 branch and give it a go for a
> Tested-by, but that feels fairly limited in scope.
> Have you got a libcamera branch that supports the new model for imx678?
>=20

I looked into it briefly, here's a branch with bare minimum support to get
libcamera streaming with the new model:
https://github.com/jailuthra/libcamera/tree/raw-sensors

It doesn't support crop/binning yet.

> Thanks
>   Dave
>=20

Thanks,
Jai
