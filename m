Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495446;
	b=CyHqtC1py5dsR7r5mCx6HLYw1ZYsqjW8j1Re8zRB+bTUW0FdFlUGXZL4JuVAAFk1n71E
	 tTvOgqwZ+go95CKJjtzislVlp72GG7uQ5p7HQIPHakmLgppzFd2B588yiiNAcH5k+vlqb
	 80kVmRmhXR0NqcvuplsxWoTqM27jFTvrnxtgRcb0EN2a3WVW0j3x7EEjTL2X54rnaKIEA
	 jQYDChIGRCS5Hy0OU1jgfwM/oR1eFy9+HvT52DJJwyZXPEw0lvGm866BRPfsD2liwHy6Z
	 zxjYurcp6ki0ucK52XmSpiRi1bO7galHBOwv9XqIJ7t3waPAqUjCsNKl4Cydr1p/p3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495446;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
	b=4WEQ3HALMP5Gi+aJ0F5Stefz+6Q7NTKvaaRuSvgk+EqK4zic7loa7dvGnKlz+cbUrVIS
	 YaDzPpPIy0mPPM+Pa7Hl+QsPBamBIF0zMZ891Cxds4DVNdwlPzobSYNaavyfXyo4N9YT1
	 87cFGc5U6o9OJ6qx8OFF6LDhg5RxH8DKPjuEtmpiyf7H0tvdAIlHYtcfdQW54WGaemBKU
	 rpvZDCbjIAWaWf9dw7dqZzh8coVax5mCIFdBdDIxYB5m4oBpxVcxwT79HAy8Ha5eCtura
	 IC6z1bkNhWPkWYhVb+1yani9zxUg3/IsXRcIbYtR1IbyaSDvmYpUqfANFbVTFyiBxIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD43606A321
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD43606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7a6e560f580so3197114137.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495445; x=1795100245;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
        b=f0/YnYcogkxdB3HezCje/yjCQWp8W92B06D6ZXgPRHh3vGHBoY4Ium56Jz0z1rSV1s
         EFsMgGoqVXdcAMgP+VALmJ/uH6fi9lE/OU9TEfk94CIO20+w5GxFaPiFNAMuwoLZbRZv
         d2ninwRDWY4E4M/lRRvsI4ynvcvqYsewgJ4Sp+Mmyp0nnON2AbK/kt3REIM8HsHGVIQQ
         qD/L5YANrJCigE4Y742+Y0xwr0uY5J6pXbG7U3NMjRSFBI/9fwX1LqoFt2VYD+WLh8/X
         kZTsPKYKdQMdFxnMeHPQgBMSoS17UibT0egTvfV8MqD/Eq13s4BiM9pCxxzjPqQwNTj/
         fTqQ==
X-Forwarded-Encrypted: i=1; AL+hErH0+WNSdhrMshDWvxGrBhG97cQZKN4BnZqAy6T4JGAcOFzzFM16XrXuqqBhu5fo962qdCTXLyh5xXlqqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jcrPhH5eMwfdHx482vT1eBbPvg64XgaF+wxe6FTEfVC2V7Kup
	zigmslg5s/kge5iC2De+R0lMOQM4GMLkP7y4FdXKmMwOSCHGIg+5SbAYie8cvAxZHKk=
X-Gm-Gg: AYBFou0lh/tkpaKcnjtJonteH8aluncsrbEvB1PSQ0TzB07uQ0DQyVUAUdhvyx5HrIg
	RTiWYVSC4B92yP4uP4S6a9HNPC6M6IRIYVgg5KTSmbACC7AMrLuSo2laKcGZOFee5Q7It1or4Is
	bw25Oh69gLgO9UO4BmnyAeh/YuqWr5pWWCAfxeuBw6vDUq/5GlOCd1oHzVhQW108PoJGvDmlwGp
	nLNBVtr8t3U/F0qzhwaBI4el6e4VrObjFIYwwGcQ4o2n3wDKalwEVSC3x/jBGRiRn7MpFRIalJI
	9AtxcXL5VPU8oZZaFCKL+MjXC6dJWFQcD/CFwK7xk3pPUJnD7m/Si0+TEqYOHTeHoqwO/r6BZh4
	/DsRew6qGVh6/NHUAqN7L0DrCHupINATRuoBtQbsGJp/HHi/LgnyxHPLBApcv6kjzc3NtSaSiwS
	V+dDABSmFO90z81CtVb+j0OJK4iqf8fPaYdejG+DnARP/GkBfm6aR0CwzDQV8FEMFWrMYEco1xQ
	sVPN/ensAGey9CIsK2PdhmnkuftFodRoSpwBctXmpVHSQlFGP4tdCIcKwWQ6ZdncGEh+ZILVgRF
	QAQQqtEDsefHvBKKo+2eeIYUFdNjj44L3Uwk6oQuMePRbw+Jwn73zeJTwVpgh6dE2pU=
X-Received: by 2002:a05:6102:4455:b0:7a6:85d6:84c3 with SMTP id ada2fe7eead31-7d4edd0a855mr1925939137.3.1794495445228;
        Thu, 12 Nov 2026 06:57:25 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c200004e7sm5966168241.3.2026.11.12.06.57.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:57:25 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7a6e560f580so3197101137.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:57:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGgQbK6Ioe4yiHqV2ZXOzOEqps32TwJyypmgxhQQ54EneOV2qDGT7mdq5dJgOGbuNtIikg95/KlqJWAlw==@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:7c3:9982:67d7 with SMTP id
 ada2fe7eead31-7d50609c9damr2546296137.16.1794495444511; Thu, 12 Nov 2026
 06:57:24 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:57:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
X-Gm-Features: AclHuK_otbzgK2u3WYfd1DmRW9SD98NHgBcVxYwHNEPtms-IkWdgisCPqESp0Ec
Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] arm64: renesas: r8a78000: Add FCPVD and VSPD nodes
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

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add DT nodes for the FCPVD and VSPD IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1574,6 +1574,196 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvd0: fcp@c5010000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

[...]

> +               fcpvd9: fcp@c5019000 {

> +               vspd0: vsp@c4800000 {

Do you want to sort the VSPs within the VSP group by unit address,
or by label?

By unit address:

    "vspd0: vsp@c4800000"
    "vspb0: vsp@c50c0000"

Note that adding the vspd* in a later patch than the vspb*
means the latter need to be moved in front of the fcp* :-(

By label:

    "vspb0: vsp@c50c0000"
    "vspd0: vsp@c4800000"

> +               vspd1: vsp@c4808000 {

> +               vspd2: vsp@c4810000 {

> +               vspd3: vsp@c4818000 {

> +               vspd4: vsp@c4820000 {

> +               vspdb0: vsp@c4828000 {

> +               vspdb1: vsp@c4830000 {

> +               vspdb2: vsp@c4838000 {

> +               vspdb3: vsp@c4840000 {

> +               vspdb4: vsp@c4848000 {

>                 fcpvi0: fcp@c5030000 {

Shouldn't we keep al FCP nodes together?
Same for the VSP nodes.

>                         compatible = "renesas,fcpv";
>                         reg = <0 0xc5030000 0 0x1000>;

For the contents of the nodes (except for the renesas,fcp properties,
as I couldn't find the VSP<->FCP links in the documentation):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
