Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F74B3BB9EB
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081124; cv=none; b=NOj3+MbizwEq+ftWsraFSzLy7yxtVIhCHu8RRRjCCFy6+w1NFF2EiZVYUZu6AEGnGD/npmNyIx5FS+WWkcP0nuTWa080jUu9dqOndbpSZyv/dNV+0Kn3Ack+z5HlhwFog4X6jSjHIQF1lB+Ketsod9PKLurEDFAJDhNzbQl4hFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081124; c=relaxed/simple;
	bh=LqHSPc8aqGN9iG0zcMUEFnihDMnXSUtExGm1mwMvvl8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hb/5Pyym+yd0AoZTl3fCHWBSB29iiqE4g2XmFhvxKsg2p8VyYdX3KXAkHEh/n6brGeNDteTWeE4WEvQLPXiSfMbF39X6d7P5B8duonVL80asqLtJ+YIUXQo5RUUXprcUN/n8XRUwBWJlbMJDWjubcVb6hFnYrsWD139zc5370eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K9fsCDu5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K9fsCDu5"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F4909D1;
	Wed, 10 Jun 2026 10:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781081090;
	bh=LqHSPc8aqGN9iG0zcMUEFnihDMnXSUtExGm1mwMvvl8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K9fsCDu5to0F4ONSMIKwzzNRjgzsiJx8plqLOZYeRIB7gVTpM3T3jFrFyD9L5M2bn
	 OU5sVu9qmyn0UfKNtQOLvczS8tp4BDx7OG/Kzzfp0473T/LJ+Qv6+HOPFgBEBdPHYY
	 /dKw1lgh2LU+xRVEFg/J6X5TZ2H5kuFqhfaZorYM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aikf5r1urSvVP1Jv@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed> <20260608091026.GB772117@killaraus.ideasonboard.com> <aibMpvdVNraURHIE@kekkonen.localdomain> <178093582619.19620.15016359616261234139@freya> <20260608215213.GC944266@killaraus.ideasonboard.com> <aikf5r1urSvVP1Jv@kekkonen.localdomain>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, hans@jjverkuil.nl, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu
  , Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 10 Jun 2026 14:15:13 +0530
Message-ID: <178108111316.1799417.9603858282315593116@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Sakari Ailus (2026-06-10 13:57:18)
> Hi Laurent,
>=20
> On Tue, Jun 09, 2026 at 12:52:13AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 08, 2026 at 09:53:46PM +0530, Jai Luthra wrote:
> > > Quoting Sakari Ailus (2026-06-08 19:37:34)
> > > > On Mon, Jun 08, 2026 at 12:10:26PM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> > > > > > Hi Sakari
> > > > > >=20
> > > > > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > > > > When vertical analogue binning is in use, the minimum frame l=
ength in
> > > > > > > lines decreases to around half of the normal. In relation to =
the sensor's
> > > > > > > output size this means vertical blanking can be negative but =
that's not an
> > > > > > > issue as control values are signed. Remove the workaround for=
 this
> > > > > >=20
> > > > > > Didn't we just discussed two weeks ago in media summit how nega=
tive
> > > > > > blankings are a bad idea, and of all drivers one could decide t=
o play
> > > > > > with imx219 is probably the worse due it's large use base and t=
he fact
> > > > > > libcamera doesn't support negative blankings ?
> > > > >=20
> > > > > I also think that negative blanking values are a bad idea, for th=
is
> > > > > driver or any other driver. I still haven't seen any compelling
> > > > > argument.
> > > >=20
> > > > Note that the blanking controls haven't expressed blanking in other
> > > > configurations than those that do not use binning, either analogue =
or
> > > > digital, or cropping. The fact that negative values would result du=
e to
> > > > sensor configuration does not mean the values would be somehow inco=
rrect,
> > > > they simply do not reflect actual blanking configuration on the sen=
sor.
> > >=20
> > > I agree.. although what is the actual blanking configuration on the s=
ensor
> > > in this case?
> > >=20
> > > I've been banging my head for a while to figure it out (my best guess=
 in
> > > the sibling thread)
> > >=20
> > > > In retrospect, we should have always had frame length in lines and =
line
> > > > length in pixels controls instead, or possibly besides the blanking
> > > > controls. But as the two blanking controls have been in use for con=
veying
> > > > frame length in lines and line length in pixels, relative to a refe=
rence
> > > > size,
> >=20
> > What's the reference size ? The controls are documented as
> >=20
> > ``V4L2_CID_VBLANK (integer)``
> >     Vertical blanking. The idle period after every frame during which no
> >     image data is produced. The unit of vertical blanking is a line.
> >     Every line has length of the image width plus horizontal blanking at
> >     the pixel rate defined by ``V4L2_CID_PIXEL_RATE`` control in the
> >     same sub-device.
> >=20
> > ``V4L2_CID_HBLANK (integer)``
> >     Horizontal blanking. The idle period after every line of image data
> >     during which no image data is produced. The unit of horizontal
> >     blanking is pixels.
> >=20
> > This is compatible with usage of the output size as a reference. And
> > doing so wouldn't require negative blanking, would it ?
>=20
> That's not true: the reference of the blanking values in fact is the
> analogue crop rectangle, not the output size or anything else. However, I

That's one model of it, not a fact.

We have multiple sensors that have a lower LINE_LENGTH than the analogue
width or lower FRAME_LENGTH than the analogue height when binning. To say
the sensor is doing negative blanking physically makes no sense at all.

Is the sensor going back in time to not send those pixels out?

> believe we need to take the established usage on UAPI as a fact which is
> why I wrote this
> <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=3Dmetadata&i=
d=3D5b470f2ed717705b51f4a799722dffb34a37f10a>.
>=20

I am fine with different maps of a territory, as both maps have their pros
and cons. One is easier to handle in drivers and one is easier to make
sense physically. But please don't confuse maps with territories.

We don't know how exactly the sensors implement binning, and only have
competing educated guesses.

> I haven't posted it to the list yet.
>=20
> --=20
> Regards,
>=20
> Sakari Ailus

Thanks,
    Jai
