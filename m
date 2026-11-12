Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496163;
	b=GOymrdQuPnnuF7FMzPslYXvpg+36mANPlO0h7/2TQ73tp/Ako6V6IBlmk9Ug+/Q38Sgh
	 BTFiPf6tIMt+lLfAJJHYhvgayedJzxXmaG7rkzvnSYPgwd5JtuX1iA+uBkCcOJXb6JzSM
	 xSihqdx8YjxVLIdB8UPX9hDOiKuhXfgWH9IDWWU+DZ4bJH2OQqnwLeDovoL9l9SNK8xEV
	 Y8n05WgQbBUmJ+f7EmyFeXCGEXYTC0hfRb+UY29or/MOBewTuuDlQk1cylw2AO78yx6Rz
	 wFhGyb8qrOlLBsHlol7FeGMLK6ZaS3QrBObuFjSTiT0deTZk4qhMyL85vDUwYXf8O3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496163;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
	b=IDckCLY9MLwam1psIucA6fxFKXEfx6CAeYL7YVvF7In1QqXuKzKIUgsCWrmf5WPsbyBJ
	 EL+ZAAJolN0wIIuPpFzaafNOYRyunCf5JhJ+3LbftHmhiF40rADspdz3omhHjBYtT1noM
	 sM5SrBcEeZI6KVfpVZEnZn5JnT+xLFGpmagWQbPmYgZy4TCYiBfe3f5Aa6T63cc0p8PNQ
	 rSXc5ZgltGVz0tOXuJvEd75W6W/IIX2xHppNhgndk9PuLfhrxEtqbLIqi2krRJw4w9Ck+
	 STw9qWhH9wMDNROB/eWTdTsKfmW/WpgmIeSqDvGqp1pAepGl0uVVmdGstPgDYrTGo0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E92606A336
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 15:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E92606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-745497ac8fcso1553094137.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 07:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496162; x=1795100962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
        b=wcHhVP6dEyYTE5WWm/MJxqSVGQhNGyvmfM5PlJ6kYJ/P2kAtHFq6As/wQmOHhSyZPS
         35FAhrKIL2+irGR1mv6IIE/oYKZNCbbqa2CPnMyGxMHQU90oUjoJMLGE4Rnj1fRcAot2
         Cn/H77V4l1RFWOenz9vk3H3cjyw4X85N3gHCh6NwN44bZhXLj2ZUdBaVlj4xh5FIf+N/
         bejqLJADU00D3hXtTrDNwHkD7oK4N6aTVEjOezMJ5mSL+GJqj0V+53+6XH5sengu/ahx
         DHbxgg9nQNk7SKWE5LdeqVKhOxhjmYfx7JC7XLFyy+eo3M1RFAdriY6RR9SldcF83rJC
         RbSg==
X-Forwarded-Encrypted: i=1; AL+hErGISztw7kgcwKSvqg4cIDP+WPVXuGGx4MjwrSynYCa2MhRWCFCrWwJiwZPt2RvAirEoJxz9MQAwJkCAlg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BtoG2/7aMu0BkzPZGnvs6r1dTgBZ0IiRdYjgoq4fR2mu6GEid
	Pf0/254Ei3WRk+yfwwXfxNYmhKiCcdTTKsc+SSP3IiKu7ovGXeg7zkOQBIyg75FDDHA=
X-Gm-Gg: AYBFou2C23xHHRxBiUQKX1WZ5kIm6v0ebA2B1KiWCAmVcRIafl0iqgY/ib+GqZgKk9d
	v3tA+i/0YIn5WdSdC2HNPn6xetbUGCI/GV5d129RSwjDZLgKTP4lIbZVYD3JLeh/DA5e97KKimD
	tiSOmv0VShCjTGwiPRymI02tcsJm2jdyeKKJPI4aa71xVCK3HnoI9l6V/GB8YK8tT5mjjHvoSpv
	URJwSvsQgVGc91JOoz9JHCaMQffa4cEyNMGjTcW+p0e29yXmZRAOYvqs24oFi4nA3kRCPcJFpIF
	a2rx3+aBgoyxNdzuhbpZlWthJh2fuBxtRkw+XjR3Xrj/s9Mz2W7v+hrv3Hie8ld8V9w9edp1CXI
	7ft78PFUblGs2x+t5spaWBcAiuRoIdLSZquj+zi3xE3W1oLxR0/+uF9MPlFw42dwQogZGCny4Ii
	RO3A3h9PjIlUjsUnDl0e2tpoK6uTHCp2xQU2e3g2q0rG2g9VP8aupvrfYKELYeLUl6tIWLUgCHy
	bUxgq7WPqs92QpG+tc/RoD3xWHl4eNZ7hkHCVtiIsTWKDPHowigR9t3FCkchytGx0jNsd4eMUhz
	Yfgd9IAHwshNZBz3lwnQyH9fsrKI6XVroNvAmwYE6HEwKl1Nrl9eA7opFAM9Nq8OEjjjGL4t
X-Received: by 2002:a05:6102:3ec3:b0:7d2:7be1:272b with SMTP id ada2fe7eead31-7d50615b505mr2266972137.28.1794496161748;
        Thu, 12 Nov 2026 07:09:21 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm2999222137.11.2026.11.12.07.09.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:09:20 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ed2f163a2fso1333334e0c.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 07:09:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHEN5UtXMIqxvI/QkbZAFUExLFcx26uMEVFBTgkFeMx1M5kv1p/fV+y+c/OSKFb54V+p4+LWwtKox8cqw==@vger.kernel.org
X-Received: by 2002:a05:6122:54b:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee1c298abdmr2507584e0c.2.1794496158519; Thu, 12 Nov 2026
 07:09:18 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 16:09:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
X-Gm-Features: AclHuK9Zmur2PVIdNvv46swJ-VbufJjxD1dvyJf5R-d3EopJYyWzLSJYUjPuDQE
Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] dt-bindings: Increase Renesas X5H MDLC PD
 specifier bit width
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> In the Renesas R-Car X5H, the module controller's power domain specifier
> cell's bit width has been increased. Update the bindings documentation
> to reflect this.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> I'm guessing that the maximum number is now 512 but I can't find
> definite proof of this.

As the Module System Reset Registers are at offset 0x900 + l * 4,
and the Module System Reset Status Registers at offset 0x960 + l * 4,
there is room for 24 registers holding bitfields for 16 modules each,
thus maximum 384 modules.

> --- a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> +++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  description:
>    Each instance of the R-Car X5H Module Controller (MODULE CONTROL) provides
>    Power Gating for up to 64 Power Domains, and Module Standby and Reset for up
> -  to 256 modules in the Power Domain of each Module hierarchy.
> +  to 256 modules in the Power Domain of each Module hierarchy. Recent hardware
> +  versions have increased the number of supported modules.

Just change 256 to 384?

>
>  properties:
>    compatible:
> @@ -32,14 +33,14 @@ properties:
>          are always on, and for which there are no MPDG bits to control them.
>
>        - The second power domain specifier cell is the module standby part, and
> -        must be the module number (0x00-0xff), composed of the Module System
> +        must be the module number (0x00-0x1ff), composed of the Module System

0x17f

>          Reset (MSRES) register index in the high nibble, and the Module Reset
>          Destination bitfield index in the low nibble.
>      const: 2
>
>    '#reset-cells':
>      description:
> -      The single reset specifier cell must be the module number (0x00-0xff),
> +      The single reset specifier cell must be the module number (0x00-0x1ff),

0x17f

>        and thus identical to the second power domain specifier cell.
>      const: 1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
