Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555DF48AE1B
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354286; cv=none; b=e5As+/5qXqSp/QZ2hkHkfg0i0s/sJY3OBhc6N9IsQp8R1U8KMACYRqoM5yxjHBaq+7FwNyXONY4tIPsemnNhtJTyyaJArCBuZQyr7mysh7WEOI49XlnGFm72/eDyGyPq9yJ4jYzo1Cv6Z0RhtJJG7kzyaPohu6GkZufdlKUIuFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354286; c=relaxed/simple;
	bh=cCHdHu+CPdS9NO8e5lsRsuXI9DwhUNqUVpMHjuucm5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkJQ4hlwAkDU4DKkze+bzKz6Jpdw2MzHYVMJFR58GHWAsl7v2ivrL1QIWAVa8AqIyJKz2b2mZ135OdcTByjnR76SzscOP+C0pTNvuzIpy/3JMC6FQY8aPZ2pJAX01ohDLkyQag66SLLv3B6MDIGaWaczGrXbsINd1VSy1TYUBeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIxIfA5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIxIfA5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A3B1F000E9
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354284;
	bh=8KcclNucxW43wbTRV9NCO7582M5O4uKXdT/yk1p3foE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DIxIfA5oqdkI1YOgfJQBhVOyP4mGKGAs62+sw8hQo1hPB3MaOvfT1Q31W1S0dPxFd
	 Az2/wdS+oKT+xMMckpm03YBRso9EFc8QBv4NLYxuhjO1aCZymT06ckZIWqi+eoK8QF
	 sA9cPVbGxBeT3t8ZjvWHIeR1BaDklQSk2O/8Z7j74Q8lXMyiNJHXKZ+s9BNOfi8TSu
	 GhZTasFkmdS+Ww2OJ5G2Td239ZSUYSN9KCZHDWSr+DsvaWovP1SLli9/8dUjVDTCsw
	 rCDlqWfCx2ssjZuOuqdMNx3JJev1KVRnwM3OtojF9T7wOanWF2t6YCikdQ7yU/jRqN
	 bL21q4XK6FyAg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so995276e87.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 06:04:44 -0700 (PDT)
X-Gm-Message-State: AFuF++kqoMxwYzxPsDQqxp1hmHzzTfpesh62IYamW6sccMWXkYpnqrks
	VegNMjZYsTr+Ftm4bmLEbQfJ54ZXnKaq7fQpIwiwHK5tG0dT/zbVt6vP3Ws1McbmliaFM8DNYjT
	3dm6lfdCBOTcny5BW6JQy8/9m3lSZN98=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:757b:80ee with SMTP id
 2adb3069b0e04-5b60868c1famr1356594e87.17.1788354283579; Wed, 02 Sep 2026
 06:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-8-sakari.ailus@linux.intel.com> <CAD++jLkQiG2eoQ2yq07wLHr23XdAa4wZSma6HyE+sB7AYWQbxQ@mail.gmail.com>
 <apgQWnaOD5Yh30yv@kekkonen.localdomain>
In-Reply-To: <apgQWnaOD5Yh30yv@kekkonen.localdomain>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 2 Sep 2026 15:04:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLnD3YihbwsUzxUAo+6_9LhwV6M1CgY4=YnBtUo61u=FjA@mail.gmail.com>
X-Gm-Features: AcwNN1Vw_4Uh1QXcW-MH4RICkPIJgYzlOsm0d9JtwDM3XoRRATa0-a8jJ5W2MBw
Message-ID: <CAD++jLnD3YihbwsUzxUAo+6_9LhwV6M1CgY4=YnBtUo61u=FjA@mail.gmail.com>
Subject: Re: [PATCH v3 07/29] media: v4l2-subdev: Add frame descriptor
 passthrough for CSI-2 and DVP
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:02=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:


> > > +int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *s=
d,
> > > +                                              unsigned int pad,
> > > +                                              struct v4l2_mbus_frame=
_desc *fd)
> >
> > What about calling this
> > v4l2_subdev_get_frame_desc_passthrough_parallel()
> >
> > because...
> >
> > > +{
> > > +       fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> >
> > That's what it is.
> > (Following the Rusty Russell API naming hierarchy)
>
> In fact we should rename PARALLEL in most cases to DVP. The thing is that
> this is some sort of de-facto industry standard but it hasn't been
> documented property except by one company which calls it "DVP" (digital
> video port). "PARALLEL" is just very generic and there are other parallel
> interfaces supported, such as Bt 656.

Aha I get it.

Go ahead with _dvp, it makes more sense then.

Yours,
Linus Walleij
