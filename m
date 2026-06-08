Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88F532B9A8
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935839; cv=none; b=mQ0G47fmRGGXt3Fgd2iaJ13F9r6hCD2cZzlpoc36pkBvo3e5qhROemOwyzI/7Kn6uWpR+74QvNjrE40tpSQugERrOeRz4h+85nl6lTC7fBxzWqd0E4GU1/A3gjScl/5XsZInu8p89YRrDVFsM6h4Ivs82iY6SngZF9Py/eAVU4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935839; c=relaxed/simple;
	bh=I1XHThktTXIRh1FAfZcDReTWAiYwfTW2z62bpicxKCs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=n3dh5zAs5AM9PqLADPWjcvA104e1/2nWNo0lwolP3cKmJw1k4hfxajifJr81mH6K6uhqF2BpF4a0TNFmudZvDZCkE1LT+564aF95QDy2hQY1RIIaeeNOLtlmlBpea64+jBOUoivHa87FwtTTYTdPBWYMsM/RJfiHRBwn3sy5zLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F+5kv98J reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F+5kv98J"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C5EF267;
	Mon,  8 Jun 2026 18:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780935803;
	bh=I1XHThktTXIRh1FAfZcDReTWAiYwfTW2z62bpicxKCs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F+5kv98JBSKyBwSUgg7Y+SJ2vxCnWm76h+kSFPZXl7ec+80rYwlqjCs6RoX9WZdRS
	 rvl8n6bLCm6Yp5rY70RadZ0AFggxPt4s9FvsDKuSmBnjceXk9gvljODW8SjxnEPFKt
	 kXFEXIVAsx36Hg8v5LocYKjjvjR6nHkQUoudBwJE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aibMpvdVNraURHIE@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed> <20260608091026.GB772117@killaraus.ideasonboard.com> <aibMpvdVNraURHIE@kekkonen.localdomain>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, hans@jjverkuil.nl, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu
 , Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 08 Jun 2026 21:53:46 +0530
Message-ID: <178093582619.19620.15016359616261234139@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-06-08 19:37:34)
> Hi Laurent, Jacopo,
>=20
> On Mon, Jun 08, 2026 at 12:10:26PM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >=20
> > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > When vertical analogue binning is in use, the minimum frame length =
in
> > > > lines decreases to around half of the normal. In relation to the se=
nsor's
> > > > output size this means vertical blanking can be negative but that's=
 not an
> > > > issue as control values are signed. Remove the workaround for this
> > >=20
> > > Didn't we just discussed two weeks ago in media summit how negative
> > > blankings are a bad idea, and of all drivers one could decide to play
> > > with imx219 is probably the worse due it's large use base and the fact
> > > libcamera doesn't support negative blankings ?
> >=20
> > I also think that negative blanking values are a bad idea, for this
> > driver or any other driver. I still haven't seen any compelling
> > argument.
>=20
> Note that the blanking controls haven't expressed blanking in other
> configurations than those that do not use binning, either analogue or
> digital, or cropping. The fact that negative values would result due to
> sensor configuration does not mean the values would be somehow incorrect,
> they simply do not reflect actual blanking configuration on the sensor.

I agree.. although what is the actual blanking configuration on the sensor
in this case?

I've been banging my head for a while to figure it out (my best guess in
the sibling thread)

>=20
> In retrospect, we should have always had frame length in lines and line
> length in pixels controls instead, or possibly besides the blanking
> controls. But as the two blanking controls have been in use for conveying
> frame length in lines and line length in pixels, relative to a reference
> size, we can't re-purpose them for something else anymore without breaking
> pretty much all userspace.
>=20
> Multiplying the pixel rate and either frame length in lines or line length
> in pixels by a constant does not make the blanking controls magically
> correct.
>=20

Sure.. but the sensor must be reading out pixels along with non-negative
blanking internally. If that happens to not match the register values, do
you object to multiplying LLP or FLL with a constant?

Also what do you think of sensors like IMX678/IMX283 where the HTOT (LLP)
register is not in units of pixels at all?

> I hope the above summarises my position in an understandable way.
>=20
> I believe removing the rate_factor is necesary if we want to add support
> for the Common Raw Sensor Model to the imx219 driver. Otherwise, we'll be
> left with a single example driver only, the ov2740, which is an entirely
> register list based driver.
>=20

Agreed.

Thanks,
    Jai

> --=20
> Kind regards,
>=20
> Sakari Ailus
