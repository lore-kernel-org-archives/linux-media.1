Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535B841F5D1
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750310; cv=none; b=ltpJEmjWLBf8HBPM+SnACBMRqyAfVtmrFiZlY9nUjQl4i5qICPskotM5GyejLMO6hGfhaRE/R+Z/jjeu1cSNNH7QXeuBEaWYJFTZAm2MHhDCaNz274G8v/O/c2sQ2/u7waXHo2JBe50vywaymeeSLt7FGyowtobUiKdF2LNRUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750310; c=relaxed/simple;
	bh=MNgKp9LKKKKGozaqA5MigN8ixt0295REoCAn+Wg5vD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEH1K+2hrMvFmYqFFyFx5J9oeSxw6o8kO01KvritUGYzc0JSwOhZkjkOTXS6GNNYbVw+52Y8eMJy4EoVzDY3Fa/fL9fOT/JwQhoruyeMfY318Z5NKANqqA1Wepy10FH0ikkWbI1mCE8DBMrv3ciXrrqRI+pZZ+0SNUykh3vgAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nskb7+6Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nskb7+6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CF51F000E9
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787750307;
	bh=8UlKhDeeqyMvqMR3ZC5xWTuER0lTaxXzzojTEw6wJmA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nskb7+6QLjR0vGyVL4/mP3L/X/3i3BIzPpIBpLHXu4h8Xd63AJRu2tZ3tAsH60wc5
	 CEXQPjRod3X66S2eiwWSp3IGjwqy7dopSDDkkx92JHt56RtEXGxNYJzROVn6ezL3eE
	 gZO1sfhWusAgZHVikI61d7k7KDgo4geyHfqJcMuCLqiCxEvqpFM1jplY2DXVqkbYgh
	 tR8N68Ka8ndrUY+g1iBSWCOo8hrzKRDXg7CUrroa/CIVU21YESM3F5RFc+uzZx6pg+
	 WZ4P970eRVrW/9izwtSSaf2COWzRvgs2auf2mw6CVEVV7pl5S/lsOWFnXpF7iv5m3A
	 Q+JhI3UVlxWHQ==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f3b2c92428so578526a34.0
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:18:27 -0700 (PDT)
X-Gm-Message-State: AFuF++lqBnF6AizfXWtk7cI7dONAwyK/fRQaOMzDIRF194dXJE+CQvus
	f1ypUPuDpBbHcN/cGR8q/pTpslxquaL5cP+AtdDxvDajcyI7eq1f9bn9w9d8xeVudTLpHBpskEf
	1+YvX+qwwKJuf1+PWQP6PA9PiCU8pPdo=
X-Received: by 2002:a05:6820:986:b0:6b1:9d66:42fd with SMTP id
 006d021491bc7-6b1a04ec7a3mr6367340eaf.29.1787750306492; Wed, 26 Aug 2026
 06:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-2-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 26 Aug 2026 15:18:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkMt3ztAHZta58coseqnjpHxLys1sjcR0fRmtC=-m97hA@mail.gmail.com>
X-Gm-Features: AcwNN1UhKvbRSssKTkRfeH7lG1jgKzy67ASJCvbAQD4ud9nq344G1JWt1SFH1-w
Message-ID: <CAD++jLkMt3ztAHZta58coseqnjpHxLys1sjcR0fRmtC=-m97hA@mail.gmail.com>
Subject: Re: [PATCH v3 01/29] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

(long time no see!)

thanks for your patch!

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:


> +struct media_bus_fmt_info {
> +       u32 code;

Nit: maybe call this .bus_fmt instead?

> +       u8 dt;
> +       u8 bpp;
> +};
(...)
> +       { .code =3D MEDIA_BUS_FMT_RGB444_1X12, .bpp =3D 12 },

Some of these are just code + bpp

> +       { .code =3D MEDIA_BUS_FMT_RGB565_1X16, .dt =3D MIPI_CSI2_DT_RGB56=
5, .bpp =3D 16 },

and some also have data type (dt)

So here:

> +int media_bus_fmt_to_csi2_dt(u32 bus_fmt)
> +{
> +       const struct media_bus_fmt_info *info =3D media_bus_fmt_info_get(=
bus_fmt);

This will find entries as long as we find the bus format .code

> +       if (!info)
> +               return -EINVAL;

and bail out if it doesn't, but:

> +       /* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type cod=
e */
> +       return info->bpp ? info->dt : -EINVAL;


As long as it's found, it will return info->dt even for e.g.:

{ .code =3D MEDIA_BUS_FMT_RGB444_1X12, .bpp =3D 12 },

this will result in the zero-initialized data type 0x00
which is (I think) frame start?

So maybe

if (!info || !info->dt)
    return NULL;

Yours,
Linus Walleij
