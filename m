Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC572C3257;
	Tue, 21 Jul 2026 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784614564; cv=none; b=com3jzCwk914UjoUXncI+pVDYuYR/Mp+TIXwarjt1uIG2lJUZy5iiKtTXzZ7eCkE4E5HuPXcp2B+Wm7h1JYUGH8bXpYlMZ269La+GrZ0fb/z0Gs4CcAm/u+FHgQS2W5C/gtL8642AOQ7m2AwPVcpd51TmAjEnOU+A5TQpPV8CP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784614564; c=relaxed/simple;
	bh=1XM0x75Le21UyetgjmPgNvWMRlIPQ+HSnhgCXGSni/o=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Q0d3T/GsqqtSQCXpkAGfxDAPzRfSD/JLHSq/NsoS3RzG2I99Rzv0PY7Nt5VjJ2A7xFzj+jfm50TEqnd6pXAnKATlY0+1MuiAQ7u9POdpnGNhJ5+aeVqI4rNc/vGV209/j5BB2f1y8E1uc4eoU7vy8GhLqz7BoktoSOu3vQOu1JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tmplprcw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tmplprcw"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62513517;
	Tue, 21 Jul 2026 08:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784614495;
	bh=1XM0x75Le21UyetgjmPgNvWMRlIPQ+HSnhgCXGSni/o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TmplprcwNpFLPY83KxlkX9sZhQsWqq86kBsJB3Ga7lMx86Rwnt2EY0WYE50tBSwnn
	 GDY6eA/tRicc9AKwH3E38RPqLiafZfr2HpwB1KG7GbuV7XPS0ssJhQkabU4FaiFbVO
	 9KeOxPBxT9gs3KS6BUMqhkCxeQYJ9cTfj7Q4NtK4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <al4JOfnFAi9SdG5j@kekkonen.localdomain>
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com> <20260715-imx708-v1-2-1f36f54e14d4@ideasonboard.com> <al4JOfnFAi9SdG5j@kekkonen.localdomain>
Subject: Re: [PATCH 2/2] media: i2c: Add a driver for Sony IMX708
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 21 Jul 2026 11:45:48 +0530
Message-ID: <178461454891.1426769.359380342802390638@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-07-20 17:10:41)
> Hi Jai,
>=20
> Thanks for the set.
>=20
> On Wed, Jul 15, 2026 at 11:01:29PM +0530, Jai Luthra wrote:
> > Sony IMX708 is an 11.9 Megapixel CMOS sensor with a 16:9 aspect ratio.
> > It is a quad-bayer sensor with support for remosaicing the output to
> > a normal 2x2 bayer pattern.
> >=20
> > This basic driver adds supports for capturing the full active-area of
> > 4608x2592, up to 14.35fps. The following features are supported by the
> > driver:
> > - MIPI RAW10 output
> > - Fixed quad-bayer correction
> > - Multiple link frequencies (different IOP_PLL_MPY)
> > - VBLANK control for flexible frame-rate
> > - Analogue gain and exposure control
> > - Extremely long exposure time with LONG_EXP_SHIFT
> > - Test pattern support
>=20
> How close is this sensor actually to CCS? A lot of the registers look like
> they're CCS registers while there are some MSRs set programmatically by t=
he
> driver, too.
>=20

My bad, I completely missed to check CCS. I don't think this sensor is
advertised as CCS-compatible, but the register scheme is quite consistent.

The big feature differences I could find are:
1. Long exposure shift means we can't write to FRAME_LENGTH_LINES without
   handling the shift.
2. Quad-bayer remosaic and correction
3. PDAF gain programming
4. Non-continuous clock
5. Using V4L2_CID_NOTIFY_GAINS for blue/red balance
6. 4 regulators with different names from the 3 regulators in CCS
7. Datasheet mandates only a handful of LINE_LENGTH values instead of
   free-configuration

Some of these are purely MSRs, but others seem to be incompatible with the
base CCS model, so I don't immediately see a clean way to handle it through
the CCS driver, especially the frame timing registers.

I don't have the full documentation for this sensor so I'll try to query
the read-only CCS identity and limit registers and dump their output.

I'll also try to use the existing CCS helpers for PLL programing, input
clock rate, and other trivial features before posting a v2. I think a
library of CCS helpers would in general be much more versatile than trying
to hammer everything into a single driver, but I don't know enough yet to
be sure.

Any pointers are much appreciated :-)


> --=20
> Kind regards,
>=20
> Sakari Ailus

Thanks,
    Jai
