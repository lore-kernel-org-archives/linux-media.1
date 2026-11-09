Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233459;
	b=1Tj3bkbVzlmS7w+wmkssKuo/sWDN+bnM3SzuUt3aELOsRv64b5NwkMBGNFxmF64nrBY6
	 UPg+DcoiwB0X37+vl2prTIm6d2EdZOfK0MRWLW/pQ7cA0gERGq/WkqGCVzbv2aqL5amRR
	 sjpMqAI+5eaSCBoHOFPpq0Zb7XnX0Zrev0efSizspkvITytAbsrcgDhGaLXK6xuDOxyAS
	 2kH6j207uGcm4yO102ft75Y4fLkxBwFZF6wYRhCUKGZkn5BWtNfaMHHsSdd5AUAnCziHh
	 NIgf4XThF28u2ghg3lMMRF78EpynLMpFWEQYFtuNDoE+pQXR3YGn2uF/HSICAC9G4gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233459;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
	b=LUqBGljX5ry2GZ/4PBDyfpTPr7M8UQzziruZLhs3fD5P7+8pPgxDyJiZyc4Fk0XPY6P/
	 TXSrphdScCtsfPl1ikED7twQN1q0ipQuDrzhO4Qjo3JkVTDXeBgd1zWJ8JV8Ak+X7zRY7
	 ZchTk1cvWt8CFdJ3E7N6zCrmSUwFCzDM6R8yJuSHbG1N/PHBSadGU5s4Ft5G/L2hRkM2r
	 YG6WJLgURkm0Ub2VPFS1p090rPUw697BAjuBGGXyncLvuL6elvmXusPjSitYMi+x7JEE0
	 OsyWzCMcayGundHaiLuuB/oXuPBVilAXEQjEVAeZF7sJHCMA0ia7zah3yMjq3czucuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2718606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 14:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2718606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40f29667e6so134801966b.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 06:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233457; x=1794838257;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
        b=zZ8QtPHKvif6zNFHUeMH3YFvhChPUKKDuOiy6BWKU9pbSlGvIDK0fAPKs4AR8LSjA/
         +Tn8r96yHW8ywZRBpWrWSdB7Q5nTtmvhFYScDlTMrAHaTOKxZ2gd/MWRm4dof9293sM6
         VqYaKrPC505hpEduCVwIHab9l3Mu1O10XNOM8rJYG0nQZNbQy+dbfbhCiDTWbA7GZY5p
         3N28hbhCdqZwJ969Y9vSxnJiSnLD6nrwWyrwcI+RmTytieoOTekQlBwJmNRymqeNfbf1
         NYpepLCgo4NXEgdAAzHW8XcEDOCswrAVm4tb60VLkhxZ9KsvF/Ew+bZucNGiJWoQJIlm
         iu3w==
X-Forwarded-Encrypted: i=1; AL+hErFeXGRIt1QLN2HZ4S9YwRZF0WSGjynhN1iR/2Eg4az5o3ZWreXwzAm8LNCl2lwMV5i6RxsvxbUdMZ4QBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rhxXPfbUiUIT7e9K1yIwb/m8lzdKMH5CAJ8Z4weceDasejo7K
	eiUEYysM3mD+McdihD4G7FlVjlDGv4dIlV77r1HRsKsNR307pTE5c25SZHc7HxW3WfE=
X-Gm-Gg: AYBFou31Rnz5ZLoVLbPo9DAQnCiTq1pk3tsLd2Z39qOBz86nuGHua+sZ2I7iPjIptGl
	/X1X0AMfz3/HYEXkgKPhF2wVnsa5p3uo+YCSivnxC1YR6rwY9UEx4lYaIRtuFbJms/7pX/b7BsV
	L0wfA6yw5HKArjw1elzFPDdYw1NfeNrsBBccQ1AMCf0x7I6TVzU2Gaq1JWxPxB4PKS2Ypyi/AFu
	FdMF2Vsl9j5jp4rzSHPCEBUEp9tEUOBoy+vEM3yau20ZmzqLi8R5GmizG8vQdJnil+lJvab2JoK
	o3MDMnH3kfjaKPMZJxqT7ULVvaBkk9rEXN2K3pvlCFh01OxJ9Yh5iN4mLA2GNULn4FjRLM4nryN
	Rp/CANe8XBd47lq4Srf1GgGzu4aoE5NY1788nhojo7yE2JoZab8Uc70FqgW8L7MPwzyDUUOs/Bv
	EnZdLFRjuEZjmQdZSlBGfECcSzUtvLYmIMxbNVsX5Jbprq4Ri89br7ewJC1waDHpvttW0CnccCD
	akDesgI4kmwJty8jh7sW/2ZzGkA+iBODOmwEe7yYFQExIPq4YNYBV4Z7tL8GObLUcichEA/uUeP
	y7nlqA/XicPmRl/PUsoRwoSDzH1mxAGFK459xHQPbcJFMPm2aNa5Yp4kTU7jL3MZnw==
X-Received: by 2002:a17:906:f596:b0:c41:64c1:cc2d with SMTP id a640c23a62f3a-c4d6d1afdc8mr292911666b.2.1794233457308;
        Mon, 09 Nov 2026 06:10:57 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f944ecsm171892766b.23.2026.11.09.06.10.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:10:54 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1370377a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 06:10:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFyf2O6OlgXnmX7AcUzyyXlMPVHUnw5oV7S7PtxyMUDW8l2jmYJZ1yOIYIdKOjfJWR26zfZRrLXMihqfg==@vger.kernel.org
X-Received: by 2002:a05:6402:51d0:b0:6af:9a96:5324 with SMTP id
 4fb4d7f45d1cf-6b722473406mr2715103a12.33.1794233454340; Mon, 09 Nov 2026
 06:10:54 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Nov 2026 15:10:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
X-Gm-Features: AclHuK_UOMGJNMSt7XpVPImhuSlb374iqFlByrKa5-w4LBZZoP4MvZOgp7Ag9nE
Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
Subject: Re: [PATCH DNI v4 13/13] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:36, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> ---
> Changes since v2:

You missed the changes since v3...

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
> @@ -14,28 +14,80 @@

>
> -#define RCAR_FCP_REG_RST               0x0010
> -#define RCAR_FCP_REG_RST_SOFTRST       BIT(0)
> -#define RCAR_FCP_REG_STA               0x0018
> -#define RCAR_FCP_REG_STA_ACT           BIT(0)
> +#define RCAR_FCP_REG_VCR                       0x0000
> +#define RCAR_FCP_REG_VCR_CATEGORY              (1 << 8)
> +#define RCAR_FCP_REG_VCR_REVISION_H3_ES1       (1 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3W          (2 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3M          (3 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_H3           (4 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_D3           (5 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3N          (6 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3H          (7 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_E3           (8 << 0)

For R-Car V3U, the revision number is 9 (according to the documentation,
I haven't boot-verified this), which is missing.

> +#define RCAR_FCP_REG_VCR_REVISION_V4H          (10 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V4M          (11 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_X5H_V1       (12 << 0)

"git grep -l renesas,fcp -- arch/arm64/boot/dts/renesas/*dtsi"
shows a few more SoCs having FCP blocks.

Interestingly, the documentation for all of the recent RZ parts (G2UL,
G2L, V2L, G3L, G3E, V2N, V2H, T2H, N2H) claims they use 9, just like
R-Car V3U.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
