Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B94E3F5BFA;
	Thu, 23 Jul 2026 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807417; cv=none; b=jMBzQBppEYTfS3WIBiMXV32i/Rtip8tSrpKABP2eWdRQ8jSH642e7/koTdW4actPpkmFVCBff7HFjSfsTxXuQOZwJCHKUqRe7ieFDaVePM6T9eqrVMfQVIXs2G4wU3SQQo2hgVrqC6XQYQSLBQzwuWbJTUz/HR8DSsZVol+VxTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807417; c=relaxed/simple;
	bh=WuUPJAm5e+bP+tc7WqWPJD7tQMUJ9wgDl48pEF/IUR0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Hvc6irkGYP5Cxlo0m0oUWaIelBn9E2P9bsni6auoeSoilQz4ZYxvPJcq2No92amhYysPGwDA1VAMhBsznMams7bFZOtE+OI2i4cPPigEFuo4aXJ4wbnRYHkMFDfqZH4u+SQyfJaQbkHKH93hjhgaQLIYe+OkojQPsrvuRlxpu8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=teWDYXeS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="teWDYXeS"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52CB61C37;
	Thu, 23 Jul 2026 13:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784807344;
	bh=WuUPJAm5e+bP+tc7WqWPJD7tQMUJ9wgDl48pEF/IUR0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=teWDYXeSBl2hmlaLPHZZpSx2KXIX4e0WgBLBFweCNSGBUCCUSNLZiYTGf2s+CCsl3
	 zqS2y11p+ovL2uK8D8Lfa8hqbpUbSnrt3wjX304wsUxhcw5Se4iEXr2pNgt7593/SD
	 oNd65QWKnE/hIZHefZjngPlj1lJkJ3EqT1LFIIWk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <amH3qaUBCOBOKxjL@zed>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com> <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com> <178472387683.3005206.5602199112336367476@freya> <amG5CiajbwGXhb59@zed> <178479424623.3238585.7446724208192156945@freya> <amHRMQfRzppwZ5xz@zed> <178480022192.3238585.15132202916626773351@freya> <amH3qaUBCOBOKxjL@zed>
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 23 Jul 2026 17:20:00 +0530
Message-ID: <178480740067.3238585.393583431156412387@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Jacopo Mondi (2026-07-23 16:47:09)
> Hi Jai
>=20
> On Thu, Jul 23, 2026 at 03:20:21PM +0530, Jai Luthra wrote:
> > Hi Jacopo,
> >
> > Quoting Jacopo Mondi (2026-07-23 14:46:07)
> > > Hi Jai
> > >
>=20
> [snip]
>=20
> > > > > > > +#define MIRA220_MIPI_HSIZE_REG CCI_REG16_LE(0x207d)
> > > > > > > +
> > > > > > > +/* MIPI bus control */
> > > > > > > +#define MIRA220_MIPI_LANES_REG CCI_REG8(0x6012)
> > > > > > > +
> > > > > > > +#define MIRA220_MIPI_CLK_MODE_REG CCI_REG8(0x6013)
> > > > > > > +#define MIRA220_MIPI_CLK_CONTINUOUS 0x00
> > > > > > > +#define MIRA220_MIPI_CLK_NON_CONTINUOUS 0x01
> > > > > >
> > > > > > Does DT allow clock-continuous property? Do we handle it?
> > > > > >
> > > > >
> > > > > The bindings for this sensor allows all properties from
> > > > > video-interfaces.yaml, including clock-noncontinuous.
> > > > >
> > > > > The driver doesn't support it at the moment and unconditionally u=
se
> > > > > continuous clock, but I guess it's nice to provide macros for the
> > > > > non-continuous configuration as well
> > > >
> > > > Ah, that's not too good if the DT allows it but the driver silently=
 ignores
> > > > it.
> > >
> > > Why ?
> > >
> > > We allow all properties from video-interfaces.yaml (something which I
> > > think it's wrong, but that's a long time ago discussion with dt
> > > maintainers, so I'm not contesting that) and we certainly don't handle
> > > them in drivers (in facts, what drivers do is not relevant to which
> > > properties are allowed for a device).
> > >
> >
> > I am not saying the bindings shouldn't support that property, bindings =
are
> > for hardware. And yes you are free to not implement all features in the
> > driver.
> >
> > But given the bindings and the hardware both support toggling between
> > continuous or non-continous MIPI clock, from a hardware engineer or
> > integrators perspective it would be quite confusing that setting the fi=
eld
> > in DT will do nothing, with *no* warning to the user either during the =
DT
> > validation or the driver probe that it was ignored.
> >
>=20
> True that.
>=20
> But does this mean I should be doing the same for all the properties
> that apply to the hardware ?
>=20
> clock-noncontinuous:

Yes, to me it seems like a low-effort win.

> link-frequencies:

Supporting different rates is hard, but at least driver should print a
warning if the DT supplied frequency is not supported today. Most driver
use v4l2_link_freq_to_bitmap() to make life easy.

> lane-polarities:

Does the sensor hardware support flipping polarities? I've seen some
bridges supporting that, in which case they should handle it instead.

But let's not "perfect be the enemy of good" :-)

> ?
>=20

Thanks,
    Jai
