Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A03AE6E4
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974817; cv=none; b=gy08iXB9ajPRMfm2NkO6jH0pqXRVmScZNba8+GaNBYRdHyg67m5hvZuqhfuu5UdAOfG874tH0yqog0dWfyfyVQtgVZ+jcbxaZ4qecyOU0EHmRk/oMd333r5PoTlcRSxUtn9i3anjwURxf1tG+sQbAAjJ2c/0Yv4jCNHc0i7AH1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974817; c=relaxed/simple;
	bh=IWy4s88MhDwNpHOdGe3jP1qXGMxg1e08ypz8dpiL9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XK22DqU7pxjZI5lGBOmrdKjbB/C3cgGANE5IP6f7ZNVzpeaRElBVr0tM1kWS1SMBoHPwx+cH/JUOQPD6Dzr13ehLmJGPIC6uadL/hATFqQ+GfXTKd0MGCbD+0tduy3c+COBE1st1dFBlYBCJS0EsR2RNbawqHI5x6QMbiei3UFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc71so25503431cf.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 00:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974814; x=1790579614;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOgPfCklfblv+g6nVV8jDyWvhZtKrbscHFmS476/ss4=;
        b=xCEkbiGAFP3AUacCbt3qATXDDIF+3TOJujIKvfnNX7JHdR4mQlGbkjz46+oWBQk1Es
         ivxBN09cmpaAPJCcc9rIm2lg1MYUW8zp4ac8L/y5jyQEB6bi13zrVqQaYNDje2mwLMgv
         lda2fZg1soaAC9xpBdmx8GviYEMUpLC46wBdzNcLBGSrUxo/ZoQz1KKV80cPhjTwPvqg
         z+t3Rh+dOIvOiqy3PCTU4Q93CDcJIUcOh8464viZ4sdvOqU5rhfhxEKTVudf8OZClTJ2
         NF2/cUwes5hzAkI+iblQycIWEshTYQP6zji9e2nbnHNyPmmBgK4Y8LEQGUQ/IAPJVda1
         R90g==
X-Forwarded-Encrypted: i=1; AKwUvBxEW4CXY4OReHpZZ3DP9U2TDzd1HSwxT6+tFx6FSQM52GYocbxD6z/oe0XeirE2SATfIFJWdA/unm20+A==@vger.kernel.org
X-Gm-Message-State: AFuF++kLJ7YT71wJuApTnE18mBRRksWGTHH75mn6SsGpmaF0o8VoQUMS
	cJmgH57fau+N161ixspfbCJEAZfTEd4VT2Vah2Zr6KtME6qR1UUHvd5vneSX/454
X-Gm-Gg: AYBFou2cIZpn05SXuABlCeKFqnNAIalxZKC/SKwO6m80ACfDf0t6t+2zUUL/ytf64m7
	TkcKzHD7ZaSeeOX+ja2YrLmrl83SYk2ND7Lm5OQ3BS3tGhVXwKU2Gcao40YQsmtL8rvMfqy8nl1
	CYU6UxMUxdNRm4uzIbPXMSCivwrleLC21c8PdbJkiMTvLxkRaC+BO7E8g6RTw6fYCyH1qDuZRxm
	RsAxA5/O6BLTVd4F/L5zPuTPgLiazcVhLny+yp2/g6TTJFfMsTkRSTadc3a1+0JqIFeeo+t3s4D
	co/2bndz5nYvtOpHZG8golY2PQ7ttcIgv7gPYjMlQV/fK3at188c5lEA6tQ8xD4YtNqxfGadtVA
	Gvk29AMnMiJS0+8XL18KCIdGUrhbFEgrMe2pHxafAV2v3vgxIQGznQO5wkeWeWyfddiTPvs2aXD
	0KhRJqkQO28gMxCN7gTlQX1dzZUXwDba9DhuPIZXZO8wJAcEY2PJUaHzIFNlUGJP95s7Yt0MeSm
	vCr2rtn7NyUg0zt5c5n2Wa1/2aSU1vpecE0BQ==
X-Received: by 2002:a05:622a:1804:b0:532:d328:152c with SMTP id d75a77b69052e-532d328176bmr9017301cf.43.1789974813671;
        Mon, 21 Sep 2026 00:13:33 -0700 (PDT)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com. [74.125.230.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae610702sm56309061cf.11.2026.09.21.00.13.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:13:33 -0700 (PDT)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104649a5dcso24718206d6.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 00:13:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxkYPoUOZOIFRH78obe18I7UR/uCwZp2vygeC/VCyAHCmIlRCVcvNNsiNBTEjCNJ4XuIoBd/sD43Po/+g==@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7a7:198b:674e with SMTP id
 ada2fe7eead31-7a7198b70eemr2080779137.35.1789974354429; Mon, 21 Sep 2026
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
X-Gm-Features: AcwNN1WjYVMR8LtQc9Hk29H2mvcKQfYOy_09b_XHHWkw76vwCkEFuElZphsH01o
Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
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
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

Hi Kieran,

On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> initially supports the Orientation types and convert existing users
> throughout the code base.

Just noticed these are already in since commit 6ab5acfb8dd38729
("dt-bindings: media: Add macros for video interface devices") in
media/master (next-20260903 and later)?

> v3 collects tags, and fixes the typo, but drops all hunks that do not

[...]

> v2:

Interesting changelog order ;-)

[...]

> v3:

[...]

> -v4:

[...]


> -v5:
>  - Definitions now accepted in linux-media, rebased to get conversions in.

Oh, you say so here ;-)

>       arm64: dts: renesas: Convert to new media orientation definitions

So it's been safe for me to pick this up since v5?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
