Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C702403AF7
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092794; cv=none; b=qP6hriH1+FwCV+wezflGtby+9sORH1xnDeX71pMOyQ/4h4rteOPpPG6DA44k5T4WPTPSfzhBsx3cK2oZ8O8vIBnm4Gjq3F2qkEUNR0ra6Ws1ExWfvQrJCGhjykoYGeTMcpG893mjzUHrkkk5zzxryRIVV6ZghRh6wP3YyUTn7gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092794; c=relaxed/simple;
	bh=qXxoU9aDRB/ooJ6quyba9eDrPY0QOPYpnOK3JIfo8d8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=X27D5+qHUJukJGrA5Fd3/FsPQ3108oiTXAkXi4KWawNNv/YM9I5FO3Jn6S/bPZiBaoLjDv3Rm6uSACfLuYEEXAUtSRTH+qXke11wLAfAZDyZOeJjIzK0vYQwEd3eTKi3MSJw9bEx/dxolHJRAR2Cw62l9EMAS2XUlY30bqhYeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uq+yW7pQ reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uq+yW7pQ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69F93517;
	Wed, 10 Jun 2026 13:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781092761;
	bh=qXxoU9aDRB/ooJ6quyba9eDrPY0QOPYpnOK3JIfo8d8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Uq+yW7pQCyGuTtK7ANBDz0XWVpd0mFJ7cDes3zRxZAiDnEEhdZ19ityUMJYHfOjfZ
	 +SW90XmAg7/Gg7l7LJJbbEJv5LZWlENg8piqd9tFQAcDaoMNeduffLCXWMBpN76vQy
	 0s74Hx3Ng4l06n4yBYcTTZNRrg6gUClU6NiHBCjI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aik8uVK0Gn-csptp@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed> <178091466607.16054.13972332068848565738@freya> <CAPY8ntBshAPkN_7Swz4qpbOjhpu5Gfnd5VkZPrgUgUoNrM0pEg@mail.gmail.com> <178102372666.1799417.2096397903236324900@freya> <aik8uVK0Gn-csptp@kekkonen.localdomain>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@
 ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 10 Jun 2026 17:29:44 +0530
Message-ID: <178109278474.1799417.18287287051075453620@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-06-10 16:00:17)
> Hi Jai,
>=20
> On Tue, Jun 09, 2026 at 10:18:46PM +0530, Jai Luthra wrote:
> > > > OPTION 2 (something that struck me today morning discussing with Ja=
copo):
> > > >
> > > >     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to=
 go
> > > >     lower to compensate, which will diverge from the sensor registe=
rs which
> > > >     keep MIN_LINE_LENGTH fixed across both binning modes.
> > > >
> > > >     This will make the driver quite more complicated, but userspace
> > > >     expectations of non-negative blankings will be met. And it's li=
kely
> > > >     that the sensor is internally doing pre-ADC averaging horizonta=
lly as
> > > >     well, or so my best guess is.
> > >=20
> > > It is true that the line length configured is sufficient that it could
> > > be halved in order to keep the pixel rate the same. That would seem
> > > feasible.
> > >=20
> >=20
> > It is indeed feasible, and imho most likely what the sensor is internal=
ly
> > doing (I'd be happy to be proven wrong). I've posted a patch separately
> > implementing that.
>=20
> I can't prove you wrong (nor right) but in general the line length in
> pixels and frame length in lines registers on the sensor's register
> interface really control the sensor's internal operation. These values
> aren't divided or multiplied based on other configurations. In this case,
> as the sensor appears to be reading out twice as many lines from its pixel
> array as you'd expect suggests that on each step two (2x analogue binned)
> lines are being read instead of just one, and thus four lines in the pixel
> array get read in the same amount of time that normally would be spent
> reading just a single line. How it does that, I don't know. Analogue
> operation would need more hardware than there apparently is whereas digit=
al
> operation would require storing each even (binned) line of image data in
> internal SRAM until the previous odd line has been sent out, while some
> extra hardware would probably still be needed besides the SRAM. The latter
> is my wild guess.
>=20
> You could ascertain the independence of horizontal and vertical binning by
> configuring the sensor to do just horizontal or vertical binning and then
> see how it affects the line length in pixels and frame length in lines
> limits experimentally. My guess is that it doesn't. This may also not work
> at all, the sensor datasheet isn't very clear about this.
>=20

Ah I remember I already tested something like that back in 2024 when I was
trying to fix the blocky artefacts seen with x2-special-binning and
LLP=3D3448. IIRC H-binning only did not affect the framerate.

The FLL always controls the frame rate, so I think same is true for the
binning dimensions. What I still don't know for sure is how exposure timing
would change given we program it in units of 2xLines while LLP is the same
value as before, maybe that's another thing to experiment with.

I think what you are saying about "twice as many (2x analogue binned) lines
from its pixel array" makes some sense. My updated mental model is this:

1. In normal x2-binning the sensor sums up charges of 2 rows of pixels at
   the analogue level, but then reads out the whole line (3280) into SRAM
   or similar and does the horizontal averaging in digital domain before
   sending the data out on CSI-2 bus. It then skips reading the 2nd row.
   So FLL size is half, but LLP stays the same.

2. In x2-special-binning the sensor still sums up charges of 2 rows of
   pixels at the analogue level, but it also does voltage averaging in the
   analogue domain (some other mechanism than a shared floating diode used
   for the vertical one I guess) but it still uses a digital buffer of
   LLP=3D3280 where it stores two lines worth of digitized values (1640x2).
   So 1st and 3rd row end up in the buffer, row 2nd and 4th are skipped.
   LLP still stays the same.

Sorry if this just sounds like a rephrase of what you said.. I'm just
trying to wrap my head around it so I can better comment on if the new API
should expose FLL/LLP registers directly or scale them.

I'll need to sleep on this for a few days to come up with a strong argument
;)

Cheers,
    Jai

> --=20
> Kind regards,
>=20
> Sakari Ailus
