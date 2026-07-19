Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A0F264617
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 07:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784445161; cv=pass; b=BMnOiF5fFA55hey9Cu5U0UwFKHs4ktU5X6uYnEfXyH7Nztdqa2qymMo2RMFqkE+ZVseYTz6c8retYawPzuOdg8FYnYoNiLXPgYkickxdgLIj6ZrJKu5BR7b/X2yFho04PGkbih4scAEewXTuV8i1/MNOYOjSg+AcsSUcSH6c/m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784445161; c=relaxed/simple;
	bh=F1lTGunzt27WbdZSuJqoOYveszw8SDxRZJRer04R1HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrpE13MMVSF+iTRZTcu2Nvdq3/fU2IvT1bD/1pqRJC7wPst3gtgcndjQZpvzthz2ZeE5u7BVRoqSjGZMnUtGx8GqBtjn50pVhjoZlWVe5Jx7+gIL8xWJQJhFsXeL71Pq8wxP70O2IR4ckO+toHl8injLHspNVqg3R9t8HhudXqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qktzlvbb; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qktzlvbb"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81e8c68c0cdso12533607b3.2
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 00:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784445159; cv=none;
        d=google.com; s=arc-20260327;
        b=bUgnNBccNQgojDNRSIDeXZhqZxwZ+fvbLi2bhVc9zg6AQRj4y4OKIMJQ2wVTSx5h8p
         D8G9dXC9TuR8+hQ7L6eFRFBxjGQuAht8hESwUAB4QgdNqEzgxA3uWtRQ6ecFKAfjaQ/e
         OKBeozSfNEabow+50U3N3YHl32aTN0BXKFknkMBBSCTxQxM4wkyFF66BAL6cyhIihEyP
         +Vwj4CuX3VXoW+7woVkiNuBIw9/Urn4EowF42xqt/AfLO5p5IB+P7/itiTpgxRkOudGF
         pqOdhGLPm9UhMsQBy3uGq4k4qZfaNgA+JU1kp3PcLqE856qpfU2GpS+1RmEl1w9GCLnq
         Qg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        fh=26TmkMAvFTdiRS1g/H2ujtdiW2JyqBQM1e8v/P6Muqg=;
        b=W/hakU9vFA5SH95T7bpkX4r3QGl0rL/Z+os8HgNM+nhpYhRhZOo6R48PXzRffbwWsd
         drEcoTyMKpsz0DEWIJ8hZmYoEEbHBD/C/nA9qbH/ch4LGgAtbFA7HuoCzig0T3dldOJB
         DH4V2oWLsbG2d+cFzK1zjnZYN10DF4JdHrgh13kQUnW2Q3ABjQGTXomogeKVHbZWdAsZ
         15qK7IWoDQXop8Mlqv7M2XQ9ESb64BHfR6vIME0IMbmkPL8A1by8YHKIYrUpUeRwjOOY
         Fp9il2bQdX0vu5D6r9cd2JMjG5NwYxOHq6BE+V+j96ZUgsJGHklQ55MzP8jsFkAhjp7U
         qfZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784445159; x=1785049959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        b=qktzlvbbi0j9sQSG9aPRFHzJ3jnRpMLcS1QtsDC4XpL3cTPqvzad0ZpbQ9PDkiv1HE
         mFF+4/44Xf9HzZdxkcD8cbywplYbedGBMiKMsmJQTAWP9VhNM4rFo/09CeGmJm3mkHqT
         JDeqU2jjagchZzsjz/Y4AwbnnPBgd42MQDPEkfaK6luTVofJTkolHIxUHXCVCdmr2dd9
         1vQQmaByPOYmq8NxYOzTNPSq9LX0Rob7twulF24wJSkv6zubXKSmfOjV7VJ07BFvnBH5
         RhE2GHCdE+O78kurCoLerXJ9Azzo12Wr7ieG5tRmcaZ7wdMB+sLACPxcTctCtnwWvXDN
         saIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784445159; x=1785049959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        b=RCYJ9Yu9PkUbv2iTd6K7guzJadyuyNPov92q9lFdsc9H3K31rObi1TJOyg+wECgHrv
         JARgsf0VuRzdTr9qEnpXRUyJwnyyeQ+WC/8qw8SucjtvOhH1WGRLmnfi1RzBn77ydxCK
         5YszOuj2ZnJ0bcObiXQzZBlPARrJc1UDFR1R7zjnX693kP7CnxW2gHyeld0iSYRtzuib
         C4fZXPPFSOz29bPWr8pixcLJNNJLMTndaS2pVnzctlSfeaSuPqNliUxfj1mC1WUNsbvR
         Ohm/+UPkitZcGL9U+imQ461duTGma2wGE3VHSnXqwUPdV5xhgAnBN1Gt+tBnwTE4dlXK
         4AJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/oAf0WLn/Gvgyhq/exaoNhyYFwTaxfk8uEHnH7v2Rqnzd1oToM0XpjHTjIGIadS7Vz7fu1Nx+GN7NxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiNCa4gnZ9jU1i7szdd/2wD/ouLD0NX8stmlxOZVqbYb8bHJjQ
	3Zh5v3IJYbNVe++5elrRZEOZ10DDn1dRaQ0ZOQZyHqTNZO/3FcZXhQgHUvLwBOuwHdegqicH+hU
	95KOsDpKqpyai2sslsMlBpRWLijn3RnY=
X-Gm-Gg: AfdE7ckzX1IhweGtW2O+cK6lbeqwfndPU6Qhe9tBdeOhPMGJfETKQxX/JUgPPluqWg8
	5e659XnFoLdQqxgMF8T9xXeMJ321TO1+WF92eAdlF3zRth5AGdQQZ1z1aXB8xsveOY62+EslQPL
	/E5CkOq/r9LE6ND7R3qxm2Ml7pRlZEb7mxItuaGrUT2RP+23iFBLXnDJqeUjUs0DD+XF6imNEtR
	YsX6bao8DnBZD6aDZcXq83/pOj/Z/xnRuM6v7xb/8S2nJ/Ub6em8noTeV4aki+VttqK6I5KFaYW
	X+g1IMujCWmZdFUwFRcj/H+g8jf9hoo=
X-Received: by 2002:a05:690c:83:b0:81e:6c2c:3ffc with SMTP id
 00721157ae682-81ef2629e3bmr32786207b3.6.1784445158857; Sun, 19 Jul 2026
 00:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-5-royalnet026@gmail.com>
 <alwKdkNsMi9L4ZiY@venus>
In-Reply-To: <alwKdkNsMi9L4ZiY@venus>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 19 Jul 2026 09:12:27 +0200
X-Gm-Features: AUfX_mx_RiwSU3kUGsytx0X-0-rCnuMvcdXhkd-AchBz93x27nuKFpMthFPgCLs
Message-ID: <CAEWPSH7wGBatr7zUp07Ekz-_-9MWaFv1wYFHrawGUvV+U09meQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio capture
 on Orange Pi 5 Plus
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Thanks -- both make sense and both are done for v4:

The card is renamed to "RK3588 HDMI-IN".
The card definition moved into rk3588-extra.dtsi as
hdmi_receiver_sound, disabled by default, mirroring the hdmi1_sound
node that already lives in that file -- and the Orange Pi 5 Plus dts
now only flips it (and i2s7_8ch) to "okay".

I'll hold v4 until Dmitry's testing round on the driver side so
everything lands in one respin.

Igor

On Sun, Jul 19, 2026 at 1:32=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Sat, Jul 18, 2026 at 10:57:28AM +0200, Igor Paunovic wrote:
> > Route the HDMI receiver audio to i2s7_8ch, the receive-only I2S
> > interface dedicated to HDMI RX, through a simple-audio-card with the
> > receiver as bitclock and frame master. Together with the audio
> > capture support in the snps_hdmirx driver this exposes a capture-only
> > ALSA card fed by the HDMI input.
> >
> > Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> > follows the source sample rate and stays in sync via the FIFO-level
> > clock tracking in the driver.
> >
> > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > ---
> > New in v3.
> >
> >  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > index 9950d11..d5840e1 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > @@ -37,6 +37,22 @@
> >               };
> >       };
> >
> > +     hdmiin-sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,name =3D "rockchip,hdmiin";
>
> The name is exposed to userspace and visible to the user (e.g.
> in alsamixer), but also used by Alsa UCM2. I suggest to use
> "RK3588 HDMI-IN".
>
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> > +             simple-audio-card,frame-master =3D <&hdmiin_codec>;
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai =3D <&i2s7_8ch>;
> > +             };
> > +
> > +             hdmiin_codec: simple-audio-card,codec {
> > +                     sound-dai =3D <&hdmi_receiver 0>;
> > +             };
> > +     };
> > +
>
> Move the whole card definition to rk3588-extra.dtsi with a new label
> (e.g. hdmi_receiver_sound) and add status =3D "disabled"; Then just do
>
> &hdmi_receiver_sound {
>     status =3D "okay";
> };
>
> in the Orange Pi 5+ DT, i.e. just like the soundcards for HDMI
> output. This reduces a lot of duplication as the soundcard is the
> same on all boards considering there is a dedicated I2S channel for
> it. It's disabled by default as some boards do not route the HDMI
> receiver at all.
>
> Greetings,
>
> -- Sebastian
>
> >       ir-receiver {
> >               compatible =3D "gpio-ir-receiver";
> >               gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
> > @@ -247,6 +263,10 @@
> >       status =3D "okay";
> >  };
> >
> > +&i2s7_8ch {
> > +     status =3D "okay";
> > +};
> > +
> >  &led_blue_gpio {
> >       gpios =3D <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
> >       status =3D "okay";
> > --
> > 2.53.0
> >
