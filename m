Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46551377A83
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562955; cv=none; b=F8zDvDLV7FTJQsfa3Ilr8eE2eDWZL+BIRCwaYhXI4V243Xm+YicZ2ve08THk9jzN4Ys9ZSBfy67T+YtO5srKejpqbPtgSIKN4MeJfXaX5eJhK0nkO6lRTxqDv5OyJQZt5MPkvWANVp58Lzg/Gpw9T1HalBn9SzEVLKTPvrFLIEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562955; c=relaxed/simple;
	bh=n6mmd3bpxfVphT41+MHPnSM+ILRR6UBaznOpot8j4xQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=usDQbmDZANWB6pZPlmKC1WUNYggmsldLVKoLqcDjmx829gWIQJmZYH2qppWWd6npDf/3zP7gsnkCoZIipUDAlpK/GlDLlCG03HdSozPdHBEhb7/nLInG38u88o0G/6q8CUpdKZ+ZE23AMtGskcEOTXJflZRfX1mWzuTw4Svbwew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nHfwjXnd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nHfwjXnd"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A160558;
	Wed, 16 Sep 2026 14:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789562842;
	bh=n6mmd3bpxfVphT41+MHPnSM+ILRR6UBaznOpot8j4xQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nHfwjXnd9Y8HxvSF4ilbCdQotmPyYA3rPqzjoVVUu0vE0Js5KUimB9env5UTRz9Ye
	 hzHz950wJf1GKEELeUuYE/ivALvkKARUeo2egvgS/aNCl2oQUJHxoCms3eYf+g9Xw8
	 Svw6dQ/7wMHJbZvn7GmmVQsCXvGQTUM2iwsJmMeQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aqpUFxlGCwNf7jn3@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-30-sakari.ailus@linux.intel.com> <CAD++jLk0LTcyBTLMWdA4W7bF2pHwOAmvXZP=Q9QuYB0JJ8+4xw@mail.gmail.com> <aqpUFxlGCwNf7jn3@kekkonen.localdomain>
Subject: Re: [PATCH v3 29/29] media: j721e-csi2rx: Use v4l2_subdev_get_frame_desc()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Date: Wed, 16 Sep 2026 18:18:57 +0530
Message-ID: <178956293796.3405342.11167960259784141319@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-09-16 14:02:23)
> Hej Linus,
>=20
> On Fri, Sep 04, 2026 at 10:54:20PM +0200, Linus Walleij wrote:
> > Hi Sakari,
> >=20
> > thanks for your patch!
> >=20
> > On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> >=20
> > > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. Thi=
s is
> > > preferred over calling the get_frame_desc() pad operation directly.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >=20
> > (...)
> >=20
> > this is not your code I guess but:
> >=20
> > > -               for (j =3D 0; j < fd.num_entries; j++) {
> > > -                       if (curr_ctx->stream =3D=3D fd.entry[j].strea=
m) {
> > > -                               curr_ctx->vc =3D fd.entry[j].bus.csi2=
.vc;
> > > -                               curr_ctx->dt =3D fd.entry[j].bus.csi2=
.dt;
> > > +               for (j =3D 0; j < fd->num_entries; j++) {
> > > +                       if (curr_ctx->stream =3D=3D fd->entry[j].stre=
am) {
> > > +                               curr_ctx->vc =3D fd->entry[j].bus.csi=
2.vc;
> > > +                               curr_ctx->dt =3D fd->entry[j].bus.csi=
2.dt;
> > >                                 break;
> > >                         }
> > >
> > >                         /* Return error if no matching stream found */
> > > -                       if (j =3D=3D fd.num_entries)
> > > +                       if (j =3D=3D fd->num_entries)
> >=20
> > for j =3D 0; j < num_entries; j++ right.
> >=20
> > how would j =3D=3D fd->num_entries??
> >=20
> > should this be if (j =3D=3D fd->num_entries - 1)?
>=20
> I'll move the check out of the loop, that's where I guess it has been
> intended to be located.

+ Rishikesh

Ouch, that seems to be the case indeed. Thanks for catching that and fixing=
 it.

Thanks,
    Jai

>=20
> --=20
> Med trevliga h=C3=A4lsningar,
>=20
> Sakari Ailus
