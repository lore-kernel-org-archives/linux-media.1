Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B641380FE2
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784454848; cv=pass; b=WBdZyZpm5U9dYKXxAXJPRQq++dHnvphLPrbkyPSDue98X9zSMtmZjD1kFw3600C8rmhk4u5VmaYgoBsVWvczhUC+7ygXAoba5ySA8d/UAreNFsqbL4Bq42uYT3vci/8bgxYqPp1ihv9JbPop7EsJGjGfwZERQfrNsE5Ub1f6JeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784454848; c=relaxed/simple;
	bh=Dj0w+ljIvfyL0X8ARKA4zzlY3yd9IT7rYIdvJJ87vnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKzfq8/l1A++dkxXScarQNwldlJab2TxqmHUjZjstEjvBly/w0wjlZ6EcXVKnZYuKFs2s6JmBkX2EnMK8GFKQfxIEqq8zYr70v4g2QT7DnrSOMOgPrqJ3bp/6zVj7oOD+5ukWyarXWqsF3w9k4W1MeoUmTOMfUzEM14qWDAjNK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXaJVtTJ; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXaJVtTJ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81eac8bf7dcso4520857b3.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 02:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784454846; cv=none;
        d=google.com; s=arc-20260327;
        b=j+b1cNjbi1BZxBKv5GvhXnMbBIVZu1ymwzQVq0DDVZYpnr8rWYxw6rwjUVfnOHadyy
         aq/cuuLPxGIXhAPlC2OmA34tVL35ETXvcc5n6iWGh3DvQpcw62yWA4w3LpiwfgG9tns5
         h5y6HgZmLT3Pw1eLhIsWFfTVC7d/0Lhae7rQZBFRZeW8KmMA20pJf+QfPzs8n4b9NnEY
         FoZ1eWuVJ0Q+tyc0cz5TK24s777SUX4QxWI+lQRdgKSdxW7XyhmBcRre6gm4+0mTyaxD
         so8/xgiayPk0jL/j+huKUrX5hneMXLJkfoEKAFF6JQ88F63b7hmn0tAlmhiDwEUHRMsi
         K+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        fh=ASRrQv0pGT6jgWvad01FyKAtnHkHAlr2p89hB41rYLw=;
        b=PxuRtaMPLhAvze5ixdrKwybPibNIZRfINOv+mXgkBt+b4S50GH1tVnjldxuihdw9ic
         NVnXTrXr8ItOqnGKR3zpIdE76mKzIYLCFFObRJfkOTese2vnJyFCu1YZCOFnEkQvf46x
         B58kR8qX3kMDoLOMvio6/HelGSMZtl08AoHjH3An9WRKadlewzHOI5/9sbndX+2/ukLc
         1WTVPxsoYHLesLmzkNUhGWP8TVss0n56/uPT+jOBBQJcSe21LTETBxQCHLoJnbROw7Rp
         8+lDPnQY/GOO4AZMgyZCAYR7qFAf2duFVRY2kuDNiJCZUE+qOn5jkTNrkdPP+NC/cE0I
         vdDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784454846; x=1785059646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        b=ZXaJVtTJIBFdH9heDSwQ/WYT1RRdz4tyKPW5/W/Kn7z06zoxSE0Gw1+QjKmKEEDp4l
         MnCfPn42chR6JKY56kaK4hIuzEo44xlxyC/Uh6ImNCoTuPpJJtrI8tejs4XoDB2lG2Yb
         H9JCGM/oZCK1VelcQbWf29qO/EEMs8MVssMmQxBWuRdvVJ+LWc7zDqt59iVcVxs0FDi0
         Jjwi30pr2DAAEj4Gi0a/tfvbjyeB5DdeCHd6g72wfxx95DXNIe2R24Y/AB83zpUfLBEd
         x6MeAuH7GjsVTHa5T7BYzIDQT4pEfxv4mF50SAG7Yemc+GKc5dJMc0yDbDUIohexDC1s
         ocYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784454846; x=1785059646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        b=JZEz78NS28M927yH7fy8DHDEUSE725sPKSqZCPagKnTq372vsgLSTOPWDy0kNhfEXB
         +GCiN9Y+zeoZ6aSqnbMm+oBO8Eks7XXcB6SRQXg+5OiQyXEaTrdFd4imFZ7BMQ/eK9HN
         kK+2a0GkaFuzDei3fd0cK1Omctynrlj1nQ4iA2pYYulZCviATgeDG0cp4vjz0zFZAHvu
         b6p/6A2DqqlUV3pbn0ZiivtsAILMafxlX2mRQi2mbCGBzlJQHq0POylJ0vxtkuWHSWmR
         E68A6tEtdZ7XdSpihSOHw6OiQ6AEIiPooBeyN2KM7yhiB/5zTEkX1WIMii8RadgnyDrX
         TUgw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0SvKX2Ph7I6/cNfogi035IvymfaXEGwOKLS9Bp05vQ8cJevd362vvezb8J9D/HigjOqRImrfS+jHU4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqLtNswGYIY5GsmqN1TqaWxDXGTB735b7KCeGWHZNvD9QK4Ar
	TZrfaeZMR5NFfXRtgKA5V4lGaNyhvaj5SNyFbwuJw3ALk4FHR2Jt0AarvNlz59zHV6g1B29+qO8
	UirqK1nDYbUwlv7D2nyU9VB1NtH/3/31AVZl7YfQ=
X-Gm-Gg: AfdE7ckBE9D8z8ittkmVMhA+V06Y0wa1ulqU5HQckxf/c+DtL/aw2HRJdeMoiHAOY4p
	xs7NAKBaSpxGnmZ4v71wj/yX+zdFBlIldjxi1qTwOqmAqNtVKajblFKuE8i/3MoUVStK/rrMxiW
	y3QR4KFSAHG58plIET6YaBZ14DrFOdTvUgImmApUeGBBzjLYOHdtGa7gE0K8osNWC6vr0Y3IYic
	z+pjvBL9Lq6Fi84Qlnvy9XarySl4H7sW9UbJm8/WoyuuVnZQC6BPSO7BQOofuj52MSSle1f0vQJ
	o8fUKU0FbYxjVXTKsXDK/t3zaofdka0=
X-Received: by 2002:a05:690c:60c3:b0:80d:8bad:2ceb with SMTP id
 00721157ae682-81ef217a008mr32451757b3.0.1784454846106; Sun, 19 Jul 2026
 02:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-2-royalnet026@gmail.com>
 <20260719-sassy-muskrat-of-finesse-b426b0@quoll>
In-Reply-To: <20260719-sassy-muskrat-of-finesse-b426b0@quoll>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 19 Jul 2026 11:53:54 +0200
X-Gm-Features: AUfX_mzrG1Pq4Zo417YCDgy1H34zh5K02k55OjzpmQP6GATHpyCvJf-ba4NVTOo
Message-ID: <CAEWPSH6aUOzxhweOdwi18LgtsUQhQEfJ0usWJvsC7WHF6XMQzA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks -- both done for v4: the schema now references
/schemas/sound/dai-common.yaml# with unevaluatedProperties: false, and
the consumer comment is dropped from the example.

I'll fold this into the v4 respin together with Sebastian's dts
comments, holding it for Dmitry's testing round on the driver side so
everything lands in one go.

Igor

On Sun, Jul 19, 2026 at 10:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Jul 18, 2026 at 10:57:25AM +0200, Igor Paunovic wrote:
>
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.ya=
ml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > index b7f6c87..fa6cd0d 100644
> > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -78,6 +78,13 @@ properties:
> >        The phandle of the syscon node for the Video Output GRF register
> >        to enable EDID transfer through SDAIN and SCLIN.
> >
> > +  "#sound-dai-cells":
> > +    const: 1
> > +    description:
> > +      The HDMI RX controller has two digital audio interfaces, one for
> > +      I2S and one for S/PDIF. The DAI cell selects the interface, 0 fo=
r
> > +      I2S and 1 for S/PDIF.
> > +
>
> Schema should also reference dai-common.yaml and use
> "unevaluatedProperties: false".
>
> >  required:
> >    - compatible
> >    - reg
> > @@ -129,4 +136,6 @@ examples:
> >        pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &h=
dmim1_rx_sda &hdmirx_5v_detection>;
> >        pinctrl-names =3D "default";
> >        hpd-gpios =3D <&gpio1 22 GPIO_ACTIVE_LOW>;
> > +      /* referenced by a sound card as <&hdmi_receiver 0> (0: I2S, 1: =
S/PDIF) */
>
> Drop comment, not needed. Consumer is not really relevant.
>
> Best regards,
> Krzysztof
>
