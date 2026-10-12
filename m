Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB940463B9C
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794881; cv=none; b=TL1JBTGM+ApKB7KGksnUP/870fEuttZa6+tcHLWHEDaGuHPPReUa5TshiNymmrErCKniQOSxMG7cdoPvFdVvMeh9D1Y4YZBkKpY+ax/67QoWx+HJnGS5p976y8YlX+hqi6YxDYmgSxRMJMAs12IOf3p/u4dSS3z+/IP1WVAUJ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794881; c=relaxed/simple;
	bh=aBKCXRC1k4NcfO23sprYjoI6K6Bpz0LlCdKLEKHyjAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTmuyU6cn4TA+4d9Qzk+0lB7Qs3MvP9ZUdrPDvV+VUqxVq0tCLIf6iuohDVJ/9s2SJQszOUnoOw0pSHSy3dm+jNGNvX56Km1WRtt2VWVG0nvBxmBPd7SEw2GnVf8rghbM2T8uzWtnqjX/RJ/c6yTLm7o6P+dK9L4KMPL0RwtDcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9902a746546so510098241.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 01:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794879; x=1792399679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=II14nzlPS87+eKDd3Q5pRhl10wTigOj5K9H4e1LTQ1I=;
        b=gNyl7twWOrWgZRbhtXUBMdl+CpibgssL4AoOgHsari9EeJEL6Eps5bdnohK+MZBRkC
         XaLf303gcyawZYO2xbFmwRtbbURAWhpCPMvarVUX0HuYWKpJCjjUnfSNLmW2Epc1rL2J
         R0kVqCnHoWXlyJxkIrgWsSXI5HDfUKf86Hx6MGpnNUYk3VXZuY0HJToUTYpsKxUB0+as
         ExOPuNbOdywyzAWOST0K0SgMOP/RN9tI1ut7X+VOFO8nD9HAnB2y8p2oFcie+hWKxO6p
         CZNoBWZgriwgULrEzvhkganMxE9o6nd7qW5Ez7wqYoNRUB+9ZR1iIpX4I/LS22DwB3Uw
         viQA==
X-Forwarded-Encrypted: i=1; AKwUvBwYQJh4kSFpDd2K5OJtKRJdnSBE94wTiIBFNJcEnz3cRq5kNbqAZDeENUzBYlzQbIyzSA0JymWr8OsRiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIA5/0Qjf8MiF22ZZVIm+bJWmfZ8KrVbgcnMu/GHaWYMWVbfJ3E
	qeymrtIsJlQLEOkjLdMyFWXjNVwQjp4XXr9ImsGh9zWsfbcqcKyLCpK/9zqjsb0J
X-Gm-Gg: AYBFou2ynHkJ0KK2sonFN/YdnlpW1+zGFB6qfsoh/BJ8LLgcVw7b/39bA7BEDYx62Xo
	e/ymoepiwkU600NPpAhiH3KvgmEeo+tch1nvIB9zkwx/9+4zNfrL7wJL7Vy1s/lJrscXkPvMLDZ
	zJ73lk3Ag7tgo8SQq1JMcx6NcptyKqVi3Y5ddxrUEGUUavYzD632wmoneHFm5JV1sM6sKTGnEPr
	ohxHD3xBH6aTI2FVyGQy4leZd6mo9dOTFws+vZIOa013tYedcMLHtwgaaAmCX/IFMIPWap3dCyQ
	Kyvun0VCdmDebBzaRS6EVck7iKQzVGvWy5d58XTirpSqDA+3ekaAg9u/COc0rDiygNnfEuDzbWR
	z8tT1tm4WtmJqXRUwU4tijb8CMNOytm+EG/ORGRx+xfmOHp41a+CtiCpCfq/KCQICinaEzs/j74
	KUFC1HvUGZ7pitqlZ1ouB/pwtXyIx8sAqOVXV7cjgZc6bgVzOaECKgD5vWeRpM6xRyAFJ5Ghuon
	6vROuVKgoUfZXjHwgdJJvOSrVPtBWK5og7McV5+
X-Received: by 2002:a67:eb0e:0:b0:7bf:2146:c2f2 with SMTP id ada2fe7eead31-7cb3a12e38dmr1414303137.37.1791794878660;
        Mon, 12 Oct 2026 01:47:58 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6124570241.8.2026.10.12.01.47.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:47:57 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e6b5794d26so1466449e0c.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 01:47:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwljMpCQq+OMuC8jwVJK3G3Raik2VJukg8bHT6DTjd21moOAEnXIIz3mcsJbXkXATxdtlvYexajSY8zLQ==@vger.kernel.org
X-Received: by 2002:a05:6122:3c4d:b0:5e6:cac7:9ff7 with SMTP id
 71dfb90a1353d-5e91e7ad625mr2370389e0c.21.1791794877726; Mon, 12 Oct 2026
 01:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
 <5bc1553b-465b-42d1-a4b0-66a514b897d3@ideasonboard.com> <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
In-Reply-To: <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 10:47:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO+pZbrgG52zxOZ2W1aVcC9OT4v0Sd9C-HTHQXixksUQ@mail.gmail.com>
X-Gm-Features: AclHuK_P9aWhNfgjy-bm9dcFKp2tM6k860xhbXHPLm1PhxRGU9PV-PZpA0ja_mE
Message-ID: <CAMuHMdXO+pZbrgG52zxOZ2W1aVcC9OT4v0Sd9C-HTHQXixksUQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 8 Oct 2026 at 15:26, Linus Walleij <linusw@kernel.org> wrote:
> On Wed, Oct 7, 2026 at 12:49=E2=80=AFPM Dan Scally <dan.scally@ideasonboa=
rd.com> wrote:
> > >     interrupts:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Combined ISP core interrupt
> > > +      - description: Full-resolution DMA writer line-tick interrupt
> > > +      - description: Full-resolution UV DMA writer line-tick interru=
pt
> >
> > As with the IVC, perhaps an interrupt-names entry would also be useful?
>
> I think interrupt-names are only used if you have say 100
> possible interrupts and only want to specify 2. So you can
> look up the 2 you need by name.
>
> I don't see any situation where sparse interrupt supply
> would be applicable for this IP? It's just 3 of them.

How come we suddenly have three? There's still only a single
possible compatible value
Perhaps tomorrow there will be a different set of three?
So that's why you should add interrupt-names...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
