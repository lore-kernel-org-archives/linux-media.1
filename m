Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557690;
	b=mmRF9BlHBA0Yi8aUuN2fh0kowcVJREv2vUSA1QRkVjG3+V7K4nx9AQuqs9acqY0ZctIz
	 dJBi89SXiv/0qnvWqGwb56UAyQuNcApeWL3uTrID78Tt57HbjWHozQ/OVVPVXY9kHe5Hw
	 INOO05kkRMcPxo+366ko8xBIV2eCaswsdU4ie192hkfDhJoEPKVfvEsYQ/dWOvOdj7ESR
	 CSrlIUU/fDg823Mr4P6GyeLLt9jHt0vyCd8cZ4wWmSzHxH4YYoyuuaY0y4rxYVmaVFsj6
	 coxM5L/MxrKHck3zVnLl8In7Bdj3EHHjSkQeVEfmDk5fKLEr7UtJQfOFzZoI1drIQ5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
	b=iMAc48TZzX8LpO/CsWcMroubiWUiOECOnZExWIKo98pSqPOFRENBmVQL+ZLIYIFDwvlU
	 niX7fZyj4gUumyLRz4EWgQF8ulKiGVDkZLKteLHvMUPcaqCwh5ArI9xd9nThWZndF/8+J
	 8CfqwIgJBtmxzBk00kL2NYgfVxWF9Xew3ckas2GtzWGjCAqWjCxEc8CLOPaIlfUnvV7ha
	 Hyn+MC/InXIBYMIYE6BQ8eOLwh56b5n00DyG6lc/8h7TvrQJQuF2sVLAjZkM1c0w/oH1x
	 uf/hemZk5oDwJcz55a6Ku9SdXQGCykLXIk0qsYiULzld5nLraxFc5FyI9dM/NSxVbCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uh90lnyN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6790606A327
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6790606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uh90lnyN
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b360828905so7266047b3.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557689; cv=none;
        d=google.com; s=arc-20260327;
        b=mpGPiaEwDjJUaRLDoO1UxfgOCxeeGPyOfFoKlvtmQMjUHK9M51d9w1GnnyLUcFsRpv
         tT0AN/KFMUPZQTmSl1TGlM1Tq3oHx48jLo/2UcZAYT/NqsR7RBV1u2Hsahpbi7t4YQMe
         Qc7StiLxaaN/nCkoVHj/Zf3TadhTJdFilSmbpyG/6B2/yKieGRfna/HnG7kkub9Lsnnt
         F0WW7Wb4AY2hob+DDzc0xoxGBLsbdsW18WKlLoJiOTDAlYwvxifOuT7oUB/hqCq6uhbN
         xg4EjDVj2H2tSPOSZ9nuOllrCWshyLqweCGPyZQiVp19M0EOxh9K0aBtlHNiAYRMU88w
         Zlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        fh=orRXMOfvekLTwMtU8oRzShTM99Y5O7g2u9WtsKrawrE=;
        b=lqYcyTvidF0kyD2MyhcPZ0vHTgU1mN8iFmRn4D2lOrS+9dra1M7Y/tEiz1lROF1XhM
         y5ZI9dA+O8eRLzHUaFoDj4muBtwui+yoY4ksL4LQVieV6jvlAMgqKnBY5p/sMwh3ASp1
         LClRXI+Z8I2gJ5VEfCyPd0xE0dee24JkkuEM1Rxa6akpkyZmgaFSeKyh0l9rovgmkUFi
         kaoNZukkbACvOCBXs/CvyDD/93fx2cZNwThOiJbfHDCRhV8lMb0sUb/vvBBfc1cCGctn
         MyVF0xSDSr8l5S4ZSDVNTvzJB00bFkoHiaD4/sM8DCvVfPHFxouISI1oaF+Y6Y3VPXfs
         PadQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557689; x=1795162489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        b=uh90lnyNNe2LomdS17bHJkvNG2Ku6NncGYaZLF3kHYinZQqPwqSNvG1OwZBXfA8Sya
         2Jul9kazkfrylBNQpcLzj0muX50PgNj4NkweAR6JUPUg89zg/AR17OE+IlEHY00vgSf2
         ekcf/sket8aNcY3bw6fDhJQPA6NWb7QcP45IbzG44z6R7pFaDQzsAr1o+cNrAVpL8d5L
         M16NWo8waq47Fs1rSLR8v75XzEmdfo2S1cMmd1FL8JSxlAl4HwlnuqfN10K2IRG94GY2
         U7XMV1kJ+lVgQtKAHmEeywrsCa+q3At/VdjOEwRHFMldnDgEZnoC11HUXt7PkT6OE3ra
         g8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557689; x=1795162489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        b=igrLdZ20M4FQ8XiKy1B/CX7YDU8vZbwvAiEEQGJ4UbSJAqsk39OFEKpe/R2x3zolhA
         TP6jC2VQl5WlpZJAuajZgY21Bx+AhqJVsLSPCrLt4o6Awr0bn4CaTjigwHjxYkuYpBik
         mojTG36LLi/AyvhB9cHnnlsCLsXdD1URQLLE2HkYw8PsUFvBE09fPAt0W+bNCqgpmviS
         CvbhpA3Yh38QB46irMXYj9jIAMXNNqoGlzgRUx/o3RRG7LtVq1CA8oEhqlvKLSblzoxc
         9NTYYAsTFqJ0w6n9hC1v5CkvODjyV4g4Ru/gjAooZredRhlgirp058fgNDTbZj+mq5MR
         OqOw==
X-Forwarded-Encrypted: i=1; AL+hErFLrh9B0Cm4aOXNb50Yc+mZohOnzUnYBxxyyvr2kJF6BtvK//v8FW5Me/+54DyGvG1yElBB4nNX9Amu7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xxf4E8XrDtxLdGYRRkP9w+pp38sQipk2BnQHM/fEF9V6GmCQc
	fgUPAryvM/rUOXbqbIrO1WTO9Kx5Q1IyDUt8+wnud6m7M/w6D5Yv4rDnWY/0AERKVzkd8F/5m7j
	d9lKa4ttSOPGC6SlVLks7HiO7G4kR+QnQ7vhtpVQ=
X-Gm-Gg: AYBFou2DgTUSCAsF7LmgcIHmifwIx0PGXlpZZfLa4s7TKhAJIkols3qfd11V/q1y/Xp
	sEoklR8osR9pvW5nDwpOuLVgNZXXTPqb9BMhSc4apNM51HyUbl4Jl+gCvfg6y27M3max5D2lL68
	sM8/F+KDBKEZbBnpYirDHsRBeP/DHaGN4uqveFXUWt6hY7PR0yKM3j471s/qwlyFDftN4VPcyC3
	P+xQ7aGbU2V06U8LR08JIs9bhJRFkkVhdB0O35LLfdzvLEAvIn21UkTMO93gks/WSgqTd/Ogb2u
	ULEszp2wU1pHm1ZEkdahSvKrUyiFZmADyYP19V5mnv1oL2OlLX5M7r+272dzEEvOIGdQIKfEBVF
	QST6mbvqWl/rwVJVWBUA4mDOKGPxqcMkw+Yvr678w8qtFGsAgBF9qv7ma79/0zvZeynpUKY+gvs
	DTAsfelPfQWTTAfcOSbDlktMJi0cFi6BY4U1iR9qBwkl2KBTcO0w1pqYprJJDiOURPLITzi9QGj
	ckVakqFvxdtRzr27AdgE9SZH7zoAadxtS1wp6o5L5p0G+jKy2JZilMsGi1HvQ==
X-Received: by 2002:a05:690c:3181:b0:8b3:4b5d:b27e with SMTP id
 00721157ae682-8b4aa305e99mr10167187b3.97.1794557688698; Fri, 13 Nov 2026
 00:14:48 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
In-Reply-To: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:14:12 +0200
X-Gm-Features: AclHuK9qbW-wyynTctV_3zFfoGINtBxA66oHn6uimxFXxSc9GV_qnhsXF2XNvyk
Message-ID: <CAHp75VfHn8op1UqAwn7Rs6SxnkseK0i3GxipFpdAnjL1mJGAdQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Only change the PMC clock
 rate when needed
To: mlevif@gmail.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:39=E2=80=AFPM Manuel Levi via B4 Relay
<devnull+mlevif.gmail.com@kernel.org> wrote:

> atomisp_csi2_set_pmc_clk_freq() enables and then disables the sensor's
> PMC platform clock before setting its rate to 19.2 MHz, which leaves the
> clock forced off in hardware.
>
> The sensor's clock is also controlled by ACPI: the CLKn power resource

Would be nice to add a Link tag below to the ACPI tables

  Link: $ACPI_TABLES [1]

 and refer to it like "...by ACPI [1]: ..." in the above text.

> in the sensor's _PR0 writes the same PMC clock control field that
> clk-pmc-atom writes (1 =3D force on, 2 =3D force off), and the two do not
> coordinate. If the sensor is in D0 while the bridge runs, the clock is
> switched off under it and the sensor stops responding on I2C.
>
> This happens when the sensor driver probes at the same time as the
> bridge: the i2c core powers the sensor to D0 for every probe attempt,
> including those that end in -EPROBE_DEFER while waiting for the bridge's
> fwnode graph. On a Lenovo Miix 320-10ICR (Cherry Trail) the ov2680 probe
> then fails to read the chip ID in about 1 out of 10 boots:
>
>   ov2680 i2c-OVTI2680:00: Error reading reg 0x300a: -121
>   ov2680 i2c-OVTI2680:00: failed to read chip id
>
> The sensor never binds, so atomisp registers no camera at all.
>
> This can be reproduced on demand: with the ov2680 runtime-resumed
> (CLK2 on, chip ID reads fine), running the same clk_prepare_enable(),
> clk_disable_unprepare(), clk_set_rate() sequence on pmc_plt_clk_2 from
> a test module makes the sensor NAK (-EREMOTEIO) until its power
> resources are cycled.
>
> The enable/disable sequence is only needed to change the rate, which can
> default to 25 MHz on Bay Trail. On Cherry Trail the clocks already run at
> 19.2 MHz. Skip the sequence when the clock already has the right rate,
> so that the bridge leaves the clock state to ACPI.
>
> Tested on a Lenovo Miix 320-10ICR with the atomisp driver from Debian's
> 6.12.116 kernel (this function is unchanged in mainline): with this
> patch pmc_plt_clk_2 and pmc_plt_clk_4 are no longer switched off during
> bridge init (checked with clk trace events), and both sensors were
> registered on all 10 test boots.

> Fixes: 0af9078315c1 ("media: atomisp: csi2-bridge: Set PMC clk-rate for s=
ensors to 19.2 MHz")
> Signed-off-by: Manuel Levi <mlevif@gmail.com>

We might need to have Cc: stable@ as well.

...

> +       /*
> +        * Only touch the clock when its rate needs changing (on BYT it m=
ay
> +        * default to 25 MHz). The enable + disable below leaves the cloc=
k
> +        * forced off, while ACPI controls the same clock through the CLK=
n
> +        * power resource in the sensor's _PR0. If the sensor is powered =
up at
> +        * this point, e.g. by a concurrent probe of its driver, it would=
 lose
> +        * its clock and stop responding.
> +        */
> +       if (clk_get_rate(clk) =3D=3D PMC_CLK_RATE_19_2MHZ) {
> +               clk_put(clk);
> +               return 0;
> +       }

Hmm... Wouldn't it be possible to actually avoid any clock rate
settings if we have respective _PRx() methods in ACPI for the sensor?
Hans, can you check your DSDT collection for this? I mean the presence
of _PRx() methods and if they switch any clocks on or off.

--=20
With Best Regards,
Andy Shevchenko
