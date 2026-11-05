Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886750;
	b=2ZjNB08+WtFr6naGAJpquAtZC/JRX6P4E3j3RmOGHjiT5xNi00nnkBSuf/OpJEvTdDfE
	 iNqrE4m1VSRO1M+I9biSxXyTIMS40ykLNjReB7oaY0UCJLikc2eV+TZfY6GYjPsYkz/fg
	 avtZbwM20W7KpzebsK2PYzon2RQIIQYN7DzHkCadvvdC3q8pxCCRMq127ev8E/eMVIeqM
	 UkMHjgUNwBia8p0PyQkdPP+IsM0y0TkiVSu3qje6Tki+JEFYdTmkfsIrHFazMHE2DylbC
	 zozSHrHkIWY0F5BvUeaqNL0VvJIKfD7mlDawdmWRYCMNWD6xOrYAdq1QKj5utLPB/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886750;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JeahCgBrqhQ8oPAtWJnblBFX1NrAxRVlymvspDmA96g=;
	b=qcuiK9lD3Pe6gBXriPIYLjluldNdPhjiheSKCkpVNDm2pspex0nc/d148x6ZECq4OVKd
	 tnmHLsx2nR4FcVP/Vn6YJ2GJmE/XRWxYNTA3GwuQ4pSf1zGxioXl+d8jcKuLDQvHbxfie
	 6gGQarMx1O/FPah8iwtWKQ80i0RxBWIJyder7M/51du42rpI2kcrK+YwH7ADSfgFkZSbt
	 BT+vH/kqNwPrPN4Fl1grkFp12D9q2DJA7+dzXLN9kSsFAu+JugR+w5dXbQ8NaeLqleeq/
	 +sc930jvmUsyYcjqIfBA4v8D5WyBh7hDGqnDCP8XKW0f+tQlGT7pmIQzjGg0VW4j9zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys5A0nML;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB94606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys5A0nML
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A871F00A18
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886749;
	bh=JeahCgBrqhQ8oPAtWJnblBFX1NrAxRVlymvspDmA96g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ys5A0nMLDZtcc2L4EmxW5mFU4qrY0ip3kpiKLblrYSYJaq70vYZP5oERDrKuMwxnk
	 uJUxriEtqugBLdHD8i5MvFdIMUfvSrU68tpbl6bmfIlifR3ZqLtQ9X6CMra4KXRpNt
	 PlMAWdXOJ0Hla7ZUpwjGVvaR9k0TmY0n/gqV04gEDvna+HkADy1p5ZRaBgq1QgJZfp
	 6BlJ8sgOVzxs7RtKSofDyOm4CnGiEo4X/EiJXROq/ABYOozmwtKRViqcQ7WJAxyoNX
	 EuoP8TyEjZCECXWlPkcF5bcsks0D7RXDeBIgS9Xpqr88zPEX8TgHpt8RZ3uC7H7N4S
	 q+4AbZqy+r1xw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso1510297e87.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 05:52:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzybOaEGpUpg5ewsiheV6d4VkF9gi3i373HeO1HQSwae+1F2LTm3AGC/6fYmBRe5A3xDrKZIbIOHQuVpw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jbp1V2GpjDRc49vjYKSZz5BrbHgxThx+1az4gaHe05CG9bQ92
	Q+kPxAlpqG14iQH0ruWVi0QMEe7Zb8PesJZH/5VUBTlzZ6k3TFjYg2wrQiYdHQIsp1HPCIRLYA3
	RbSFbSyaY/ZiMv5a2m7/1d6IcpVJQr9o=
X-Received: by 2002:a05:6512:4286:b0:5c0:165:16c3 with SMTP id
 2adb3069b0e04-5c001651b15mr124760e87.64.1793886748448; Thu, 05 Nov 2026
 05:52:28 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
 <20261027-mali-c55-renesas-dts-v5-7-51bbb43969c1@kernel.org>
 <CA+V-a8vEub2y2gvXp8jkjVHOGuj1Eqkbq75t8Nezz95iidtL3Q@mail.gmail.com>
 <CAD++jLn_3X65zu8q-DfWbn4xjyPrSfp5BVH4SO96XCxmegcvXg@mail.gmail.com> <auxUgg0PP9xXqA68@zed>
In-Reply-To: <auxUgg0PP9xXqA68@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:52:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnHymVvk1i1o0vC1PBguQ_-Cpc4tCH4P2ztn8cF7G-izw@mail.gmail.com>
X-Gm-Features: AclHuK9aWghSgGPgEAyeqdT4fh_Hp97d1wLRufm5X27_o_R8h01yfuAkz9ZEscE
Message-ID: <CAD++jLnHymVvk1i1o0vC1PBguQ_-Cpc4tCH4P2ztn8cF7G-izw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 7/7] media: mali-c55: Sequence resets explicitly
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:10=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Thu, Nov 05, 2026 at 09:58:09AM +0100, Linus Walleij wrote:
> > Hi Prabhakar,
> >
> > thanks a lot for your help!
> >
> > On Tue, Nov 3, 2026 at 2:47=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >
> > > I tested on the RZ/V2H EVK with the clocks and DT left untouched,
> > > changing only the reset order.
> > >
> > > The hang comes from the reset assert order in __mali_c55_power_off().
> > > Asserting vresetn (the ISP core reset per the RZ/V2H manual) before
> > > hresetn/aresetn wedges the ISP. The next power-on then stalls on its
> > > first register access. The deassert order doesn't matter.
> >
> > OK I will drop the clock patch and keep this one.
> >
> > > Asserting h->a->v (deasserting v->a->h) passes repeated runtime-PM
> > > cycles and also works with the IVC enabled. So 7/7 gives the right
> > > reset sequence, 6/7 isn't needed for this, and the existing DT mappin=
g
> > > (0xd3 =3D vresetn =3D ISP core reset) is correct.
> >
> > So this is a Tested-by for this patch?
> >
> > > A smaller alternative keeps the bulk API and only reorders the names:
> >
> > I guess that works, but I'm not sure the reset bulk API in the
> > kernel guarantees any order, so we better keep this patch as-is if
>
> I was under the same impression as I have memories of quite some
> conversations around this and I recall a workqueue was used to
> schedule bulk reset operations.
>
> Now that I re-looked at the implementation of
> reset_control_bulk_deassert() and its history I don't see any trace of
> it and the documentation says
>
>  * Deassert the reset lines for all provided reset controls, in reverse o=
rder.
>
> Was I hallucinating when I first suggested no ordering was guaranteed ?

No idea... Lad showed me it is guaranteed so I sent a considerably
less intrusive patch now, check it out!

Yours,
Linus Walleij
