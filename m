Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7B43C379D
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444169; cv=none; b=Q+ljGsifB5m5K2oNMAPgNBXHuD42OowDju2geznGZStBNC4TEk0oSoJOW3cbyA8kWUNRKHXOrU4qktwAhOmKaj/oFy1/CKLo6xCEJbLp+ztoku0HizYaKKXYsqLOD8t8dKRSVdKHuzQIHBH31sPOXrUXMZ+YyZOo9o1K3Ks8V9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444169; c=relaxed/simple;
	bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDvHRKPA3ZJfG6BddTRV1AAfVSMNJlTxNO7TjcYyoQ51jFS3UpmMuLWbAemnA++m8/fL3qKHPbRIVwXSWxJufqPK5WkFX/NkkIb2AxUJS7fmuRIgq0109Mcg50ORHypSqJojkjEHdbJJ6lWgtFLvtEvVyujHYe4zVUtDX3ydujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpDmrifd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpDmrifd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b613a17bso21056115e9.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781444166; x=1782048966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=RpDmrifdVYRm7w5uVqe6oo3KthisxnGYVHjbrQ/g22lavHg/KGCkoJwNc7ijI0J3eT
         oTM209FyB8AYtpWmwrOPwjmegbBrr/1YFe0VNxtJOMe1a409Koy3Jx7KtXD9+i0J3wNV
         YNU5hkJd4x/JIGKAcwANwGMFZcMWprALWSaw9gX50D73us/V+yNYh5DVkNpt0obgkHbn
         LWbqbr8HEfiDB69a2q7MyHLbZelHT+Xu1frjmwxJQT6KDYlrct0Ny1gvVPjq9lsTcqdD
         Xr6NBaHwB4WKZOXqaNGoNDwKi9p2e8nCRQ2cHVacT1WKSljxcspjv89OY8BDU2S1ou5A
         GlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444166; x=1782048966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=WU3o2U9eIgO9JUAeOlIABV108hCyntVSzQYxQnlIfhoIw2d6wsImXNr6KrG005uRNN
         +8365IM/cr2evhMLipexGsBGgwnEIk3nd2Tw1ixCk3NhMHvNSmLOpMViu2X9tssOsrAY
         WKOz6Nkg5cMD/M47h9fAdCiq9Gkafv5x8Wkbn3rwPcoN5cY5Rg7gHcekydeM/dtxdSL3
         qyB4Tx239uP51EwAGB76EmWl4ftJfF+MBwV4Pou+/1qCKV6m7gvwR4gPHhvTIyQ/Khbp
         Gae6Vl+HzpmZTRzzjNFHGWEKojT38v6IlSSIil35sILh/CetNpFKLx01hlTC1QmEu4tk
         E4gw==
X-Forwarded-Encrypted: i=1; AFNElJ8QTt7agwVDDnVCgBrMJ7+NIpVHfTemIsaFrOkE5ehW2GIPzUAlHy7Clnjsx2nl7HnLZrhKENdZWxLGXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrT6xOV+elugVhNYfAM5sNLNhABTLccO5/+y5uBlBlREZfINwF
	/Ma/eOUsQPtHYkrqN6rMWC/gKYl+UQ7Jp8LEXh5a2uJuiskqdf86WOiJ
X-Gm-Gg: Acq92OFL1ARbpUX2jOr7TdJCniyvaVapSTP1jD7P/3Gu49S/L0dOPysYgwsDAl3VRrN
	oeVKlrJvoB3u/eMZwtD9II3r6DoCgj67HDyI2PRnCfvxHT+nuP7+vl206JPAwJlCZTihHgjhQ8L
	zgtk0Kw8dklG9399qtwF4vquUG2Q9V65fumelc98nhoIHaqX7en6Za0oB59d/HOrQGA+gJTY11m
	lNJCcBHztcGB/2F4ZKaQ8+1YrRoDi50vVCTUaIf09nu19gbUCnZcb5MY20Rd3erWg0K3i9+yA/w
	GPCL3RLScYa5qrnFUSTBabbUJ5rQRr/cExO6+PzVIrEW6om/WLIx99Ktu1pqkMZvnSsOofAPzt9
	04JPFyWhVbVjotmFkKCo1+T1Cu5r5WV3Gizie1Xr3aQw6/PlJo4u7eqfx4Lbuu1pNGG2qSGlyZ/
	xejzjlL9IKVPpUvkt31OtwD/cw6KhtybDhpqReqFRFj6+Q
X-Received: by 2002:a05:600c:58d5:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490ec523a8amr94122335e9.34.1781444165973;
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea9520f9sm148794265e9.1.2026.06.14.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sun, 14 Jun 2026 15:36:03 +0200
Message-ID: <XYko-1bVTYuJiQeSr0cTOA@gmail.com>
In-Reply-To:
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
References:
 <20260505134812.408316-1-wens@kernel.org> <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. junij 2026 ob 16:34:00 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> On Sat, Jun 13, 2026 at 6:33=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> > > On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.sk=
rabec@gmail.com> wrote:
> > > >
> > > > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> > > > > The Allwinner H616 SoC has a video engine hardware block like the=
 one
> > > > > found on previous generations such as the H6. In addition to the
> > > > > currently supported features of the H6, it is also supposed to in=
clude
> > > >
> > > > Remove "supposed".
> > >
> > > I can't actually verify that, so "supposed" is accurate from my point=
 of
> > > view.
> >
> > Isn't info from manual good enough?
>=20
> The manual says the SoC supports it. Same was said for the H6. Then
> we discovered that the VP9 decoder was a separate Hantro block.
>=20
> So again, *I* cannot claim in the commit message that the hardware
> block supports VP9 decoding, because I have not verified it.
>=20
> > In the interest of unblocking this, I would be fine with "supposed" too,
> > but manual and all my experiments show VP9 is supported.
>=20
> Please give an ack or reviewed-by with a comment at the end stating
> VP9 verified.

Well, just go with original text.
=20
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
>=20
> Thanks
> ChenYu
>=20
>=20
> > Best regards,
> > Jernej
> >
> > >
> > > ChenYu
> > >
> > > > > a VP9 decoder. However software support for this is currently mis=
sing
> > > > > and still needs to be reverse engineered from the vendor BSP.
> > > > >
> > > > > Add the compatible for the H616 variant, using the H6 variant dat=
a.
> > > > >
> > > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > >
> > > > With that:
> > > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Best regards,
> > > > Jernej
> > > >
> > > >
> > >
> >
> >
> >
> >
> >
>=20




