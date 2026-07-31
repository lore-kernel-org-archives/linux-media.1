Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9395F3A544A;
	Fri, 31 Jul 2026 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483694; cv=none; b=OUzx1Li6Cs7quWllUGCrs59Zk7Q2RF++K6PNm/l2nPRHkJcwP/Y/NYFp/njbvydJFEz0dmUwfN4lFS4LCAcbXuN1CkAx3f9dJgVq9pA9zaNwueEfAK6jSFzzeohnNx8XZAZVtQDmxwBXdy+X/jEXdponFYzQZrONOSBQJ6Uo07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483694; c=relaxed/simple;
	bh=e/KEnYsTrBzAJNNbZhOo/Qd9wxWOBzeuoEg0nKCRR7g=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Cc:Date:Message-ID; b=EkmsTG/jQC7qOa1Ep2hMfkoKMBZ7pAZtYI9LJjGrFyCOQgVGnFVHrfi8EMNqn9Pp/6mu8RprjrMfhgT6A/jS/MtvgVjBJJ8sq91kUEZoaTAbRm+aDoKFUY/tdmE4SSx67pFzB5efiLZewfLHL88zfZpoJRlSteMDOdcDYC+/+mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AqkGHoK2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AqkGHoK2"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9493F2E9;
	Fri, 31 Jul 2026 09:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785483624;
	bh=e/KEnYsTrBzAJNNbZhOo/Qd9wxWOBzeuoEg0nKCRR7g=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=AqkGHoK2c0hySUdPZ/4+Sjd8i/vdjKcn9iALQ1UHQ2bOHVGDoLRRuo2mojwEd6r+R
	 9o7d15ZQjXjDxmgp5wiDUlCOxRh/A0pToLpOEBSJHA8tO2GbA5yna+zqaOcxLuYldX
	 KxBp3KT5E/49rCO8lbjKO7YUnCLy5oP7LOD7pdEM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntDk+4aseGqijPz8Y9cGFzN=4zHPEj3HiHgetn=O_ufh_Q@mail.gmail.com>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com> <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com> <178455866124.1426769.18237320419273419942@freya> <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com> <178461038136.1426769.8068222330738680407@freya> <CAPY8ntDk+4aseGqijPz8Y9cGFzN=4zHPEj3HiHgetn=O_ufh_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>
Date: Fri, 31 Jul 2026 13:11:25 +0530
Message-ID: <178548368547.4139729.2328103728639267380@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Dave,

+ Sakari, Laurent

Quoting Dave Stevenson (2026-07-30 16:42:01)
> Hi Jai
>=20
> On Tue, 21 Jul 2026 at 06:06, Jai Luthra <jai.luthra@ideasonboard.com> wr=
ote:
> >
> > Hi Dave,
>=20
> <snip>
>=20
> > > > and implement
> > > > it using the common raw sensor model directly?
> > > >
> > > > I did it for IMX678 [1] on Sakari's suggestion [2]. The two sensors=
 are
> > > > quite similar, so I'm happy to help in whatever way I can on gettin=
g this
> > > > working with the new model too :-)
>=20
> I'd also noticed that all the Starvis 2 sensors are very similar, to
> the extent that it seemed worth a very quick test to see how much
> needed to change for the imx678 driver to work with imx662.
>=20
> The answer turned out to be really not much:
> - PIXEL_RATE
> - PIX_PER_CLK
> - ID
> - native and active areas
> - min_hmax
> - common_regs (culled nearly all of them, although I do have the
> spreadsheet from Sony which needs to be added to my next version)
> - VMAX_DEFAULT setup if you want the full frame rate.
>=20

Great! I was hoping for similarities too, but if you got IMX662 streaming
already with the IMX678 driver that's quite good news.

> Those would all parameterise quite easily.
>=20
> I also have an IMX675 module from Soho Enterprises which is a 5MPix
> Starvis 2 sensor. I don't have a datasheet for it at present.
> That streams OK at the requested rates by just updating the active
> area to 2608x1960 and ignoring the ID. However I can only receive test
> patterns as all the active images I get are pure black :( I'm hoping
> it's a faulty module, but will keep poking.
>=20
> There is also IMX585 as an 8MPix Starvis2 sensor. I'd hoped Naush had
> one to test, but it seems not. In the meantime I've compared against
> the driver Will Whang sent to linux-media a while back [1] and that
> also looks largely the same.
>=20

Indeed looking at the documentation for IMX676, IMX678 and IMX662, I see
the features are mostly same, except minor differences:

IMX676 and IMX678 support 8 and 4x2-lane (with XSIZE overlap) features, but
IMX662 does not (probably because it's only ~2MP).

IMX676 supports dual-speed streaming (DSS) using MIPI VC1 for sending
2x/4x/.. FPS data for a smaller region-of-interest.

The registers otherwise look identical, so a shared driver would make
sense.

> And the imx908 Starvis 3 driver that has just been posted [2] is also
> looking incredibly similar.
>=20

The flyer for IMX908 mentions some extra HDR modes. If there are some other
big architectural differences in Starvis 3 I couldn't immediately make them
out from the posted driver.

> So the big question is whether it is better to have separate drivers
> for all these sensors, or one combined Starvis2/3 driver? Do we shoot
> ourselves in the foot when we come to add functionality and find that
> it only applies to some models?
> The awkward part would be testing all variants when patches are
> submitted, as I suspect there won't be one person that has access to
> all of them.
>=20

Honestly, I have the same question. I would love to share as much code as
possible so we only do the painful things like moving to new APIs once,
which I've already done for IMX678, and it was not a quick exercise.

I haven't deep-dived enough on the different HDR modes (DOL, ClearHDR,
and Starvis 3 hybrid HDR) or the DSS feature to know how easy it would be
to test and maintain all of those in a single driver. The HDR modes support
using MIPI VC 0,1,2 or line-data to distinguish between short/long
exposure/gain frames, and DSS also uses VC 0 and 1, so the book-keeping
around the combinatorial possibilities of what is allowed or not allowed
across different sensors may make a single driver a bit messy.

An alternative could be to create a common starvis2.c module with helpers
for shared boilerplate that separate sensor drivers can use. Even if we go
the helper route, we would still need multiple people testing or acking
patches that touch the shared code. But I see that in the same way as other
common parts of the framework that effect multiple drivers.

> Thoughts appreciated.
>=20

Given we don't support HDR modes or the DSS feature today, and probably
lack proper APIs in the framework for both, I feel like having a shared
module of helpers will be quite an effort and a bit of premature
optimization for uncertain gains.

So, I am leaning towards having a common driver for all the Starvis 2
drivers with multiple maintainers. I lack enough information on IMX908
(Starvis 3) to be sure if that can also be squeezed in.

If it does get hard to maintain in a single driver in future, we could
split out common parts at that point without losing the effort we put
today.

But let's see what Laurent and Sakari think as well.

Thanks,
    Jai

>   Dave
>=20
> [1] https://lore.kernel.org/linux-media/20250816055432.131912-1-will@will=
whang.com/
> [2] https://lore.kernel.org/linux-media/20260730021525.166811-1-lachlan.m=
ichael@sony.com/T/#t
