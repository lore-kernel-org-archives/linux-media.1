Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794023447;
	b=2ppg3iOXCZ7LxLj8RiPh3BSzUw4/4UP3tzi+WMoZ6ooiW9xq1Q++ZfTIzyW8kZ5wVoPU
	 JiSE4L6lPEnEATFlCQFg2NdGWYbp0KC2O12xheHFj77mmESbQhJyOYtEPD/5Agxpa7kwf
	 kMiI/wK1P3uX9Fd13lSgrOkBasozhTDCvm6HSXQ+2iLtAnHAUI6kJxxjmimqx5Us/Zea3
	 T0noIlkDVCx9PqupiRGZMJjVU1kJj7Il5Yx+/rLO7u9TPgj11akuQEJoko1jg+UUToxyV
	 9Z6yVAYNZJqIWTKfsXFA94L+HBBS4+ZaHB/at59hdupLFvypgdz9mDM0bHcPqXdVLag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8DsBB/++J1ezqdBf8vyGFjxYITqM0+YluqzVccQohus=;
	b=Smw163zRxfARsJneUX1vJcF9h+Iz2MZZGvu3z9uMSwWfFTWziOnce4U51SZTDj1CvV0E
	 QIIfBUp29zKCRt8hf2/7enaR9july4UQ114SWK2yTvf3JE33HjngMBweIiO4IT9Qpyzmu
	 Jhnhlsq4d/1oSwoKtKom7n8PrFT/e6cEI90Gc3TV/eRyMOnYBdAOvn/6+BnDcFxcGc+SB
	 EdaMSBK+MDNWXmf4+oPFBLBozC4S8G7MU9IwUL8hJi04U3lz/WanDRumccRKNEgth7qyd
	 KagSemCywzluyEviYrfHqgc14MMQ9kHHT7NzLMH0nXaMN6Fn+kTaorTXbc7B5c8hEug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE1ZTDNq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F42606A326
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 03:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F42606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE1ZTDNq
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so14974595e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 19:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794023445; cv=none;
        d=google.com; s=arc-20260327;
        b=DlwPLHFEbzLIuvnQ2wW21YvmtjSP6zsG8tgUDszO5DWZg/ili5+FX7sdS8H4MMTRiP
         9O1opWHrPRWwfm9M56j5hUVOLI+bq3u1Ee2+avOYneKCw7vbKCacO5fUgaEydcvGvdHV
         LSYwtHXTHYYyQlVdMCzFhhE0RmloASf0fNMuV28Gvpb8uLMAxAmcDxSpEM5gp+yXe7av
         eIJwdI7OZU2nwCRkMkLraWzaLdwSCmalA9SjAFOFBJGc88ItXcroYiU1w5mZfMHMJHAy
         Ef8vL2iz2dY39MBQYPFJt39IGxWWKtzz7rwKF6kVwK91iOId5AgQkfDAPT44i5bhnJzz
         CUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8DsBB/++J1ezqdBf8vyGFjxYITqM0+YluqzVccQohus=;
        fh=+pMofUoDNpRmqTqbEXno0GjRhvpwlmw6ASmlwD85zGU=;
        b=k5gMwO6ixK8sxCyu9mh2Ua6iFzoY3tV4Y46iDMWSWY9T+hxgWTRcc85hnF7VDzjvYJ
         tP8trO3beFxs4lyEBvGMzxmrl4M7uvHTnNsgxKuVMCdnQUP5Jtt56hdfdIV9rQC9OUcq
         1xKaid7xhcCxfoIA2cCxuu4DcvrMsus28uNxwGrUGsvtc/nEo4adZaP+pU6450MruEhU
         fu0+DBsWentxLr7e/41gSdoSwOj96CSLtHy7+4aiexW+dVOQNztfkWz51kJ5QFmREk6l
         jipCJgw2a6k64sxNJ3IYZtVHQMwJVuLXKwBhIW+1pkx3SoF0XD2ufGJsNEfo7Cbm1rAP
         7fWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794023445; x=1794628245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DsBB/++J1ezqdBf8vyGFjxYITqM0+YluqzVccQohus=;
        b=rE1ZTDNqUJ0IAulplsLTzvuxc6VvShh1uFVwvIMIimVxLj7CXPXCV3jyIvvVntz/FN
         10tvlHlbNHqAOult/EKnl/N1+30mKmmdX6dOaa2If7ydYpjxfnUa0jNheIGFwP+P8RH0
         x0A9nBiEGNe82RcBUrT6ANl6iV59DsEvpExnuZMDr6ZXGkoCY4QLXZ/sBmlGOcLZHBLm
         kpSJQoHdnknWtF92qQvml2mi9M3KZb/gKCEL6NMABIPLPQq7BBuvvUPgV4n03UmYzZ0g
         DQRGMZfgJIkqK6skEX4ZrKBv+/pc7GFDtdmllZtVkjuIMHZ2ckw66X4dZgGn8Wkn49Ue
         1tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794023445; x=1794628245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DsBB/++J1ezqdBf8vyGFjxYITqM0+YluqzVccQohus=;
        b=E1X3/J9LiDtLQdienV1nTZLltTCla0O0jnS1HL1NNZWzFBBV8IV3RysFzWgNCMklUg
         /hK6ybOgJioPuxLzDkXj2/cq38RHKyAUFOu/G2cAsp1lUHyepmslhbbBwr2GO2tNX0fn
         /dTwSP3nO6F+YDpD6ew0fOVl/nI0rn/qD+eYe25KcPkeWDiQ31Yv/JjOtB9CEdk6iEYJ
         /kU4jHmVagknxWYXqjd2VlKD04zxNdeAi6kjfk4elovqjNzkyRcdqdSEHxOslgG6ylRa
         XkrYmccUJHGTYjXjNUNjhBDh0Kw33VlMEAqAcB8WavgjrDQx3gl9EmZheCMG0ELEeMuv
         nkOw==
X-Forwarded-Encrypted: i=1; AL+hErFBJYfggY0i8eA77f9gqIC324BCypXe60vWZvm5zF3mH3DGQOr6zV/k/wWKr0bidvmSpNdTe6DxJyRlLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z98yf8Mm3gU+pME3M1esBGLG2FBel22cA0Qo1erHRRL17ggKI2j
	kZ+iEfV73HfzEatWbfG3Tls7xOwZ3btVih7UPE1PUbBqW6vNld8duh/SrTePFrc+YG4jqMwpsnG
	VzrTaKYBJxYmY/pO6fSBHMEb+domuv7E=
X-Gm-Gg: AYBFou1K+zbQngWKW2TnkhUP5YaXir28gE8kz+tT2aj4BDIjO7oED+6Di5TPv5wy3ZO
	1NDCMX1JkSOEfQ30wtQoEXX0BK1Glh4hXXOCW0nmBl37tvIHInZAac8kVX5BOQ+7cvoijovkFCY
	XaZI7Kt7yO91Uaskxv+easjLiH6ut9y46es8GaIgXdHdBDXoXwq8Vx/nVQBxb24LdN32vPLfzuC
	FJm7rsZsCZsHtGloLP2iwnMnVtqkQweQoc0XgWfAhu7F1J7vImkgcWFTVsCfeuRtEO8nLnYOnPc
	W3BruXIlQwGTOK8yMOKFlvxWLPCxFw5yZzkDYQ5CbUxh9gSjXpy+cZb0ynpRUt6AU9qO9q0D1bh
	RrFCDsTDYUZFAdH5clhEc7+bxNQRcZ3V9NWt9JVmzhQyhox5AyDQDxUyCKIhowLtDzuU3d/w=
X-Received: by 2002:a05:6000:2203:b0:48e:2a6c:153b with SMTP id
 ffacd0b85a97d-493cb334277mr2973714f8f.35.1794023444836; Fri, 06 Nov 2026
 19:50:44 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
 <ausVkYs1-3rJ5Fj0@devuan> <20261105113229.4126d872@pumpkin>
 <CAPDEY+X7q2yeWaa7J=Nre+pQqUa2C760Hh9NovdGNSQ=VsEr8w@mail.gmail.com>
 <20261106102723.1cc4d350@pumpkin> <1EAA42AE-92F8-4CB7-B490-CDB6DA9FFCE9@kernel.org>
In-Reply-To: <1EAA42AE-92F8-4CB7-B490-CDB6DA9FFCE9@kernel.org>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Fri, 6 Nov 2026 19:50:33 -0800
X-Gm-Features: AclHuK8S23Z0xNdnv0TQ6fL-U428vp435ZwNqPtWkfKo8mNDXQ1VtJpE_Dhy960
Message-ID: <CAPDEY+UVqhg9R-Nk-vqie7kNoadr0JcXMKHsjShmWbHkWuexhA@mail.gmail.com>
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
To: Kees Cook <kees@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
	Alejandro Colomar <alx+linux-hardening@kernel.org>, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, justinstitt@google.com, morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:06=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On November 6, 2026 2:27:23 AM PST, David Laight <david.laight.linux@gmai=
l.com> wrote:
> >On Thu, 5 Nov 2026 17:44:00 -0800
> >Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:
> >
> >> On Thu, Nov 5, 2026 at 3:32=E2=80=AFAM David Laight <david.laight.linu=
x@gmail.com>
> >> wrote:
> >> >
> >> > On Wed, 4 Nov 2026 12:25:17 +0100
> >> > Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:
> >> >
> >> > > Hi Mariia,
> >> > >
> >> > > > Date: 2026-11-04 01:02:39-0800
> >> > > > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >> > > >
> >> > > > In preparation for removing the deprecated strlcat() API[1],
> >> > > > replace the strscpy() and strlcat() calls with a single snprintf=
()
> >> > > > call to construct the IR device path.
> >> > > >
> >> > > > Both the source and destination buffers have the same capacity,
> >> > >
> >> > > The line above seems irrelevant, and potentially confusing.
> >> > > The size of the input is not important, because since we're append=
ing
> >> > > stuff after it, truncation may actually happen.
> >> >
> >> > And gcc's stupid format overflow check is going to complain.
> >>
> >> Thanks for pointing this out! I initially tested with Clang, but repro=
duced
> >> the warning with GCC. I've switched to seq_buf for v3.
> >
> >That is entirely OTT.
> >Currently scnprintf() doesn't complain.
>
>

Hi Kees,


> What does GCC say about it? Is it mad about src >=3D dest length but the =
format adds chars?

GCC 13 reported -Wformat-truncation:

error: =E2=80=98/ir0=E2=80=99 directive output may be truncated writing 4 b=
ytes
into a region of size between 1 and 32


note: =E2=80=98snprintf=E2=80=99 output between 5 and 36 bytes
into a destination of size 32

Both devpath and ir.phys are 32-byte buffers, so the suffix may not fit.


> I agree that seq_buf isn't needed here; that's really only for complicate=
d cases where the simpler solutions don't fit. (In this case, snprintf-like=
 is best.)

That makes sense.


> Both seq_buf and scnprintf avoid the warning because GCC just happens to =
not recognize the pattern when using those helpers, so this is just silenci=
ng the warning, much like strlcat() did too.
>
> Truncation was the norm already, so scnprintf is probably the best fit, b=
ut I think it may be worth looking at the surrounding code and conventions =
to decide if truncation should be communicated upward to the caller (i.e. f=
ail), or if the structures involved should be adjusted to avoid truncation =
chance, etc etc. If possible we should avoid the weakness, but if not, just=
 use the minimal solution here, which is scnprintf, though that kicks the w=
arning down the road...

I traced the USB/SDIO initialization paths and checked the caller's
error handling. The existing code permits truncation, so I kept v4
focused on preserving that behavior with scnprintf(). Any broader
changes to truncation handling could be addressed separately.

Thank you!

>
> -Kees
>
>

Mariia
> --
> Kees Cook
