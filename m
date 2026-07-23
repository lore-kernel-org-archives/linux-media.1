Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7AB46D2BA;
	Thu, 23 Jul 2026 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805440; cv=none; b=QZGQQGwuTbsbxjA64rB6A/NcnWSPErSvSPKocLOx+6+3Vom++QPOtsv+uL5QqDrZX8OsbTp6MOlP8iK+/J4D72iTN4xRKOJ3fIFYv8Mf6XWdELw5/NSLCjneU2Nsk+1p/riU4RhFDfsBEDViRI34ex9lCt7nTNH8AtVSuHJJ4eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805440; c=relaxed/simple;
	bh=7uCwcf9RoCvsnb8tsObwR1UlHdRV7xuUTUXYyK3LdlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKnp+JM4ADBNfWAUWRDqjAJMLGOXCgggCUZ5lubL7bCoBDtTW/wH1pgOn1uJfujc+XHJUB7FI46S3zCczaMewLT/aEDuqX7x85iOLb28Nq96tAIgHvBh5clCR4AmqoSAg6wVnaYWb0F31iudf1p7cvFElGrY7cKKzW5Iy6Mkq3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N+CZ3Ehh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N+CZ3Ehh"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FE1D1C37;
	Thu, 23 Jul 2026 13:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784805372;
	bh=7uCwcf9RoCvsnb8tsObwR1UlHdRV7xuUTUXYyK3LdlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+CZ3EhhKxBvrPtxQlmUKvbvvEO2IewwdZnnLxu0mKGQ+sIlwNRHL4uXXEL2tncD1
	 qOg2ICVwegIwutWTpogYTBJI5sxUPb8srYbwlLmBAg6Kt25eY3d39fKFaHPivBRP9P
	 kY97jEOO/6iVocYwd9ULQYhisrNe+S6SPPvm0lfc=
Date: Thu, 23 Jul 2026 13:17:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, 
	Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <amH3qaUBCOBOKxjL@zed>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com>
 <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com>
 <178472387683.3005206.5602199112336367476@freya>
 <amG5CiajbwGXhb59@zed>
 <178479424623.3238585.7446724208192156945@freya>
 <amHRMQfRzppwZ5xz@zed>
 <178480022192.3238585.15132202916626773351@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178480022192.3238585.15132202916626773351@freya>

Hi Jai

On Thu, Jul 23, 2026 at 03:20:21PM +0530, Jai Luthra wrote:
> Hi Jacopo,
>
> Quoting Jacopo Mondi (2026-07-23 14:46:07)
> > Hi Jai
> >

[snip]

> > > > > > +#define MIRA220_MIPI_HSIZE_REG CCI_REG16_LE(0x207d)
> > > > > > +
> > > > > > +/* MIPI bus control */
> > > > > > +#define MIRA220_MIPI_LANES_REG CCI_REG8(0x6012)
> > > > > > +
> > > > > > +#define MIRA220_MIPI_CLK_MODE_REG CCI_REG8(0x6013)
> > > > > > +#define MIRA220_MIPI_CLK_CONTINUOUS 0x00
> > > > > > +#define MIRA220_MIPI_CLK_NON_CONTINUOUS 0x01
> > > > >
> > > > > Does DT allow clock-continuous property? Do we handle it?
> > > > >
> > > >
> > > > The bindings for this sensor allows all properties from
> > > > video-interfaces.yaml, including clock-noncontinuous.
> > > >
> > > > The driver doesn't support it at the moment and unconditionally use
> > > > continuous clock, but I guess it's nice to provide macros for the
> > > > non-continuous configuration as well
> > >
> > > Ah, that's not too good if the DT allows it but the driver silently ignores
> > > it.
> >
> > Why ?
> >
> > We allow all properties from video-interfaces.yaml (something which I
> > think it's wrong, but that's a long time ago discussion with dt
> > maintainers, so I'm not contesting that) and we certainly don't handle
> > them in drivers (in facts, what drivers do is not relevant to which
> > properties are allowed for a device).
> >
>
> I am not saying the bindings shouldn't support that property, bindings are
> for hardware. And yes you are free to not implement all features in the
> driver.
>
> But given the bindings and the hardware both support toggling between
> continuous or non-continous MIPI clock, from a hardware engineer or
> integrators perspective it would be quite confusing that setting the field
> in DT will do nothing, with *no* warning to the user either during the DT
> validation or the driver probe that it was ignored.
>

True that.

But does this mean I should be doing the same for all the properties
that apply to the hardware ?

clock-noncontinuous:
link-frequencies:
lane-polarities:

?

