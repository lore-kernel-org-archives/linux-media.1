Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180872;
	b=XTXlABvtShnaxiZQUtGTNbJfNENcKULg5w3DvSz81Ca1BIphe7pn8pnbg2c14f117RJg
	 SydjKU4P2Y3VLLO2j5RItV6tvcxqZnAVGW1l9EpgsCGffRiRLkFZ0pSb9o5eHeRoal+CA
	 IeHbbJhorLxE/lGiEDr/Dw3f2DKIasmXdiyLb1SeMMCZHXjfPB7JbfFAiWZNKVQQ5thM9
	 2i2YgixWqiayMs3QVYORu5sHCvKazf/QEDBQjio/NhZgkShFscsZNfpCbg0ksgaELpQFp
	 xOfo8+9nqyuNtnxPtcjR9NH7go0bYXb1wHwK7n6Ac1GzIvYagVWGU3vB2wWFXHZhhFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180872;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i6WwPrncRptE8GYzBIDI4FfU9ppzTybRR7dkLJbVscM=;
	b=hWWcAsKG2zHRfFj7wcWYXMuPm10YtL6LKm9pY9TzBUNJmi2i1w6VamLsl+Y/D6D05u5C
	 S3unCjqnM0/IjDBctW7dnKroQPRGrShmgQ9WD9CdPkNanPe2Eaa7ZspaPqcNzrGZgEkbN
	 +BQIgrebCugKfojIvqliOdZOxcCCnWSSs73lOxKT3szP5qUZugkoFvH51UVsQYY8DFdsN
	 W/3UXLm1M+fqzQaKh1VAu1kWmq4MnViIdncCmuky0AYQH+tIEJ5+JrqbG19xOJ02/VDSP
	 OnyLABB3hZolc+bW3XEhgH70k9GiYrE5XQOJRP007HifHe1dUtDxo90lilEac+LlMSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B40606A329
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 09:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B40606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9912c47367cso496555241.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 02:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180871; x=1793785671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6WwPrncRptE8GYzBIDI4FfU9ppzTybRR7dkLJbVscM=;
        b=zC6ZTeJwA0CqvHEfbl7c1CuU2dOcDNr/bQeZlR/Jy51Hm4EeBa433gPmtopvxS+knx
         q7CFoClInwgVjRUBFJrbF0NJZfZT5K685fzvTwen0nbAPqSdNFF+XCI4MtwhoPoSvr/w
         vghpiaqz5NJokXC9jFN86u2O5urMJ+EaqxBAK83iafXru7E7nEYw78/DA8VGyog8hQs/
         d2G/Bh1hwXe4VcbtGTknPSx6ReZaC74LV6N+Waw5MQgrR3vz61qDFcSq+nOsiM7tnHHi
         S4NXN+wLB1X8EofEQlW7B0Cp+UTRu3IiD8pEWT2uu755CP2IKYTPZdvrStjRArQ4q9JX
         NPYg==
X-Forwarded-Encrypted: i=1; AKwUvBzRGYcrx7++ivDXJ0kGofh4HLnuR0907Ilm3JlQn8h0Z6XI1Owntruf8oCW4LoQjjZvDmFLD4X/Dg9m7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOkXmtb1XLNe1s+MpxSWcQ1NnP0v0G/Phk4Z1H3Rmk2UJtAmkB
	2mBGRBx4W8gdR1bJhSKEb4j3EXhAp/to3olywUjZRKfyyiKiC2dW7KwjqYfb+WyQ
X-Gm-Gg: AYBFou2MMzk9BYiGbFgpufaagUa6Oupmh63CHl6z/0zep+q8t7rD+HJ+/CzC3mL+1F/
	nIqAMK0Wo+Z/SMDL+B8V7PURUgEi+WffbDqb+9LZrCCktyn6/8VCqD8wySw4FHc/zCZ2bv50mr5
	VznFRtw4CV3/PatVPi6XRpP5wZjr8kxDvZ3f0BGHoHyMg3Is+ST7HGVils3nzkHxqYhBWGJ6lpa
	bCXQMtlNtKd+4vNLH4jSyWm/AgnYJzPtkmJyx+J5K9VNnp2D3j/UtUMLc8wHhXP4tR+gZaF/pbg
	5w+x5PWV2FVJSYAGCqrL1KAl9LraUD8kD6g0ZzajPoWL05qRfs7zRYA2jpQ+kvqRES+Q/w/VjV8
	BiNqTh8kWB4F7ChyzsmbuttV9Ot8tK/vPNQnfARj11Siq4IhYB38r8klFSGtQgFKUyiSIb2D1Pq
	+tA5FLt7jd+cE2ikSSOWTrrpjS7Z5hlQY8Mtu6WKFcfU7GL3h8/zR7CQlFM/uq45cQnq9SB9xGs
	ZbrS4rigJ/ZbyET6sAZEvW45zQUDWadERbgFAK6t4xUmUis/unazlGpJQCRgHvgC+OiK20KEx5g
	wwrmH7acBNPpPDdkxG6QXzno4/a5ETjv1i/T8l/+BCdqx4/rSQ0u0LevKcPVuL3gPS4=
X-Received: by 2002:a05:6102:32c9:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7cea154c2c3mr1648388137.25.1793180870882;
        Wed, 28 Oct 2026 02:47:50 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259eb01asm5432961241.8.2026.10.28.02.47.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:47:50 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1407060137.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 02:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByWXYDQ8RW58kXnvbbyhmBlDt3E1WLBhlkexW7M+GJvaW/Jqsp6gUsUk7KrW6FQ/ydmUFyGNOKpvAorzw==@vger.kernel.org
X-Received: by 2002:a05:6102:a4a:b0:7ce:645a:139e with SMTP id
 ada2fe7eead31-7cea1529d88mr1771764137.23.1793180870303; Wed, 28 Oct 2026
 02:47:50 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed> <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
 <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
 <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com> <auG_dr3VFeWaBxKw@zed>
In-Reply-To: <auG_dr3VFeWaBxKw@zed>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 10:47:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYXn_tZ8r5Her0y-TYfN3qd3DZ0JH1N3_fmEUHh4e0xw@mail.gmail.com>
X-Gm-Features: AclHuK89t2jEOgptSQIEsLA7Aen2x9jD1gfdTZXyhURhxZaUPJB2xF4KJi3cnsI
Message-ID: <CAMuHMdUYXn_tZ8r5Her0y-TYfN3qd3DZ0JH1N3_fmEUHh4e0xw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Wed, 28 Oct 2026 at 10:28, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Wed, Oct 28, 2026 at 09:38:05AM +0100, Linus Walleij wrote:
> > On Tue, Oct 27, 2026 at 7:39=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > The driver uses Runtime PM, but I see no calls to
> > > pm_runtime_resume_and_get()?
> >
> > It gets grabbed in *params.c and *stats.c:
>
> pm_runtime_resume_and_get() is called in the .start_streaming handler
> for all video nodes (capture, params and stats)

OK, but not from .probe(), which does hardware initialization
before that?

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
