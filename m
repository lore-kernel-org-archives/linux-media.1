Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126372;
	b=uAMrDwASznvYz30FP+qCZQe97uD5441vKvxu1JTUvr9HsDnUq8LBlgnzLVFplRzn9lS6
	 CVSlRWmL+Wuo2LiXbSI9FvzUF1BBaDGnbQuByZ9rmGq+VnHlo0g5KYVU1rqxx/MhB2j58
	 WpRUwLya69ukeHE0FVNyMFIlCvgF2NPwBgexdGQ6ZbftEsbaoJaAxiHuvhB1ER8oE87l4
	 Kth8ggUsORsy/ZhlPdzPSZkCSxhabmgXLlqsvfzwox1yBchApuK7Bux8HhfFdaUik6BXS
	 vXDufFtVrGCwXMSCIFEXsJoKj1XZkZ1yQ/fBUU2MkXokst/2mt5piLmXD+gCmC8ibuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bskxJSqG6c0o4PNksGKA1/LdyXGJr0htoC5Aj5uMg10=;
	b=CQYIYDvduMzhqychZKQW+zDkoc6OPDZhBaPfGYdFJxWhuycTITwiEJu/hdV/gtCJd4yI
	 2dvvwUJmXpuIYVUDZsc3gRKtYpaIHVvmxbljZIs6+P4X7iwmpU2aIfxuW+HYuaRvHaE02
	 U/PgqdJhDHBus+dX+zTSVCnxM5X8M+FzvqPKdwD2n/E/Z898upFzYcaLcudYlFLpJkkJS
	 sMNvFnIkAOuiukRH9PBDrm++HF198Pq/g/4FMp+A241rhB0uZpy+gD5v3NqDQy1BggVe3
	 TRiehBP+HDkCvSEkGpQ3FFrG7bLRq9XWQMHMORsa0QlVg3nJTqRXLpktNFQ1qU2nR/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699DD606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 18:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso76225241.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126370; x=1793731170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bskxJSqG6c0o4PNksGKA1/LdyXGJr0htoC5Aj5uMg10=;
        b=db59KPU9E4FOoka1MnPtI9dgGAcLrrDfDv5hBjWvrAyscfgTAC/Ep/FkpqdLumh8aL
         YnE3feCJgOKiipdencSh7Y0x3gx0uCk6UrFoZLLpI7WnQYO0RikKWaYwjOw4QMeCO5ia
         U29m/uUL5aaKxKnNJ7qR56/U9aistdsC1M6uuohBXrJM1kBuIU6w2S9VmOQSEuIsNa9z
         HN3p7hnHcH3mAVthHk9EVSinlTiFgZ4LSCyCozgu1VZy1+CwaG8UhHEOg8HJY/1xwign
         9N+lenmDAEs6tCl33W4fTLRf4BV4tDeiCvtaiUf0wFoV8y4A7x/gySepb1Fb7IK2fzq5
         GDJw==
X-Forwarded-Encrypted: i=1; AKwUvBxv8ZLF2P2QKC1w2JasjHjx7902/ldzdIfZw/9G6L8Ov8GxHI/mwXrhAAeVKlR1H0fuHb0V3cG3rXOYYg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKlgK00svN9cDf13MvntuHgNhr5ltbrVI8p/L1mrxeG/UEmr4tb
	MkIypeNSEyHzivSLqHd/1kCupyQ7Mu+sA1MkV9jQgtq2ZJ6HSTtpke+N7g3MWO3l
X-Gm-Gg: AYBFou1oIfRjWJUe1Ug2oFXTCSCST9kjYuFa4QwE4JBZr1nxw9JDv90DQgzvQnPImYU
	0IhVLhAtNNwbbjCuh/ePs8eq5kTjl/XYuoM87KAoT+AoimK3fwkEXSK6XU91MKSlPDckgTEOkXf
	tyxbP0fuUi8Hycbq3qgwKohWoMMvj1t47k0sxbGCdyVtnge/R3vQ3ZAHBpv2kYX72PIM1WEU3FW
	ufFIm7vUGSmsgMQ6b+Q08y8BBiXJniM/ACR0WRq7oJA63RQbMaRgwo/hz0888MBAPz7y7yodR57
	wOdCaqHHAKB2za+jqBus84g0MYsR0lrdr06OY6Ioa6+CYRyTMnuZ8UfTNAU5Lfi7YR3L/t0klaR
	B1L9mkFTJRpoPp2aFIsLM4x3EIazvEx2HkWDuY7VH8jNdas9oMaUj4AcUz9X2rpatX6vJup3QJ/
	3mYDlotGJ5VVbYoUabk+LHTuClDIAjIxayRG0kbCbHjaouTC5tNRA3beUNisTDm+kMorIQUVjOY
	v3rtqa5N02rVWfcvWZ76M4mvjGUsZn1EhAhE0dyhqf+1k58SAyxlBKKEEejETjH2/+7wgfD/URT
	zMjuGwSXMthb06q+gA==
X-Received: by 2002:a05:6102:80a5:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d03a651783mr55826137.33.1793126370135;
        Tue, 27 Oct 2026 11:39:30 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259eb01asm3418258241.8.2026.10.27.11.39.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:39:29 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso86694241.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcRWA1CmYHSUxssOJycBQxjaProB0/rhnB8f/pZz1ckionn6jjbohCn2mgcml4y4oSNB2c4jrvj0B9hA==@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:7b3:7653:5487 with SMTP id
 ada2fe7eead31-7d03a64ef2bmr58613137.32.1793126368843; Tue, 27 Oct 2026
 11:39:28 -0700 (PDT)
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
In-Reply-To: <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Oct 2026 19:39:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
X-Gm-Features: AclHuK-ZyTwLWgoRI-o0BtmWvpg5NzrSx71dPROAi-SvxTYl1PL6GLDh7YhiPW8
Message-ID: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 27 Oct 2026 at 19:01, Linus Walleij <linusw@kernel.org> wrote:
> On Mon, Oct 19, 2026 at 12:23=E2=80=AFPM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > > +       /*
> > > +        * Allow the ISP's 2500-vclk reset recovery time.
> > > +        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
> > > +        */
> > > +       usleep_range(200, 300);
> > > +
> > >         /* Use "software only" context management. */
> > >         mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
> > >                              MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0=
x01);
> > >
> > > When we now retrieve the reset and assert it, it matters that
> > > we give the hardware time to recover. (If this works I will make
> > > a separate patch.)
> >
> > Unfortunately this doesn't help
>
> Since it is clear that:
>
> 1, The clock and/or reset ordering matters.
>
> 2. The device tree order does not in any way impiy any sequencing
>   or such sematics. (I.e. we can't really change these DTS patches)
>
> 3. The bulk APIs for clocks and resets have unpredictable ordering
>   (clocks will process from left to right and resets in the reverse order=
...)
>
> I have concluded we need to request each clock and reset explicitly
> in the driver and sequence them in code.
>
> I sent a new patch series with two additional patches to explicitly
> order clock and reset enblement.
>
> See if this helps and how it looks... Try dropping the reset patch
> because I suspect that ordering to not be as important as the
> clock ordering but I could be wrong.

The driver uses Runtime PM, but I see no calls to
pm_runtime_resume_and_get()?

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
