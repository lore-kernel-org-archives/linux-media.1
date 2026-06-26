Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F71AAE28
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477040; cv=none; b=KpENDjc7BYcTfRalH84yH97BPoc33hyC6JyqLbwIqmi8huWkQTe2P/v8VHUdifGlwWd3E6bUQIgLMEAvuC6a4+2zAMD3LKAR8wAmDOudalHR8R6GXxBqbEppBqySpukuvuvhgXGBetGno3+ya6uLNYqAQu/HzDwMS7CFeFx8d1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477040; c=relaxed/simple;
	bh=L8m+v9Mumd9PBrIoKCr6p8n/MbxpHP4z26Qvy7erVnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1kPgr8Njb1t8oSjtOcci7FUgOdw+st7gCj9UXmUbTchExBvAUgDCrO+c8C3iO69HXIfbLTic1wbaTkqPEqZrH+SHEKLEoadqFFEfK1k/CMOc3NWzC9T1jHgljLZvmwHQQppqAV/Ic7OksQju0/o76uv8IkWhGuUxU99KrgsuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-966e7380109so664573241.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 05:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477037; x=1783081837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qc4TavqegVrav+S2qpl9+8s6wcCSKt3nqOoGSJ8Fvk=;
        b=nhP/bzDv61sz72s+roHFVMkoV+swhAF6MmPbXO/cFe0xqrSsAGuM5yMXmrqMA012HB
         ELswoR7bPCgMhiuxP5a1CK+vjmTB+KfoJWURN6J+l6Sh5x0rwUEU/HN1bsd9yyPlTSrm
         aZgthP5Yije6K3q6EEMQsHlOO8/wlon4kuR78xbsrCvlvlxLhPaIIt4RYgVVaGPO1Sxs
         FRR6pquqf9A0p5DIsHaGHXG7UefDaRTAygQbPQ40AwDDII/spK6XcWcMu5gTWJggWMfK
         2vZZPBN7ukU5RoQhgd3SVvALtLZhvnMqeUZfVrfxO+JjRni6TJ32W2YvVqChO3InymEs
         Y/Yw==
X-Forwarded-Encrypted: i=1; AHgh+Rpw3z8g6q4HsMunySX7hchZYaLnDPtIFCVi1J90as46cRuszNIl83hPinxk4TW5kwoi4UoEBzVDsI1gbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHSu4GDmBTJ5P4aMx/ksZoPSgOK6Wr9+oMBkvQDA8AsiZw6xyM
	X2W6DPkBUo8VPhjzVtlQYrbbRWPFz33xQ2ARKwXAjP5PWq7YvQ08PV+5W8sas+Ss
X-Gm-Gg: AfdE7ckoRfsmvLmhsHBUxweM1QbbTq20MGo3A5aPhkUsQEgIPrweHrGYNTaz3BG00KY
	vxaO1/Pu98hIaDusfC9dadb3b9oQcIHCZwUNM7LZ+a9zfpVSm1Uy2C3Tfzwfo2lgFNmf4AWHhSu
	FP79E6/FNXGq/JGbi11ksxzdgaCKJjhNifh0vXQWDArZ7a0kr8Ew5nswGBaXZ5OpVoFjSWkg/XJ
	8wYQk38pwob2AbDvdiTyA/F2e6dahofwM3fWHaM7Rg6rcdW5El/YPOJPzdXOofFAchG0mjQiNUx
	xtzgzIyKoCq88T2ohKyjno307G7WHL9RU38NGKuZhOcGOzf01vkTdcENJqkGXSI3+6HTPIHU8S6
	9cK0XTjvOzefj7EikOvBGcYn0a0QOfcY+7L2YTE+9WClPGrDSx9E0UEPSR+kdQEepIotPhuKmrL
	lftUNMqJh7Ox65qLso2uKuqx6Gl7c6WUOnAmODENrU9Fw8lxCJzA==
X-Received: by 2002:a05:6102:5246:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-734362a83d5mr3072422137.21.1782477037383;
        Fri, 26 Jun 2026 05:30:37 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96916e5b10dsm903406241.4.2026.06.26.05.30.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:30:37 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-72686746814so625487137.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 05:30:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpSfZ9T9+QxkZELtK3C34ciXLBEvISkePotxzLMxFv5E1cfb8P9ANTH3z/ogNHcz5BO8T2fAbnS9MbRIQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5491:b0:631:4580:6a46 with SMTP id
 ada2fe7eead31-73435b90f5fmr3476500137.17.1782477036873; Fri, 26 Jun 2026
 05:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com> <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 14:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
X-Gm-Features: AVVi8Cc1rFvCNNORSHDtFmL_tkYQ91oxJ5vGSfmmYwanPmDM2yIyJwQSJ-fX378
Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: Convert to new media
 orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 at 14:08, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the renesas device trees to use the new
> definitions.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
