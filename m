Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390153ACEE2
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974870; cv=none; b=RnzuQWWfMShEQPKO9TJ5HGy+PSYCOUYIL4ug4SwpBcD72jMc9CvbEGv7OM60BYS7sAGLB4t9SebMlaVljRjxFpWFbgygbT8VmVP6Xu6wxZrUDuJcPd5I2Oik8bY+1UuzINphHzYSVT4dOM38Tny5LZfaaLmKKaw9NDz+HuYWgWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974870; c=relaxed/simple;
	bh=mlXvSVm/Lq7qa7w+AV7HA/L3OjWuvTwojTve2NS37ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txJyqSifP3XVfdC5wIQk95o4CcSd9vD38verXp076rE3xh2KdGWAWeAqiCXO3RhNEs7nzMpikFPXvqznxVEB3ECHgk6kMUj/V+8KsOLq/BaAmkNysfRmqRafPS7pnezAd7SMSUTVbFYyQ0Y2rXPsqH7hj7q1kUkS2eK+lcX/bSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so7272191cf.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 00:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974868; x=1790579668;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HB8j5/kP2XPOkdK+SCbhJLf9Uj+WB32C7OC3D9kNjGQ=;
        b=OUm2j+5316DVNeXNhKIzfHSCCxOK0K+BZHXRtJEVUQKyFpLlMXushxNmMr1g/xUZsj
         Q5BXEdOnkViuruqLH7mNEiL+pjBz5KZ/O+G5W003VPxqH5UFfA39vDBawu8VgDC6Wa8J
         XmepFiRV2irRkknVQFsGjnUKjzX6SHIBrTn9IYsFwEYjV1bhAHD9lXbCay2w1KvPtHvC
         zEGjRAhlk2pFtXb9fmhQFqBFzP/YXVzJgLaUMV74hMxK3FTCvKszWJ7A+70rYKSkyCzf
         ds7g+JVT1oyi2+lVQrG5GU7pn9/0EeAGxWPmL2ktx2/7xYzOh2PDLX1DemXAGamVcTK8
         S3Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwXm5HdgNiu1o+sHjBngg/cJUwCeMKnVG58YE72+Kzy6UWtYi9eRTYhrzj34A4vz+KDjHBj+9V3+N7oeg==@vger.kernel.org
X-Gm-Message-State: AFuF++mAxwOx5DSY9GTf134CmxsHIONopsKGImiefkK5mY4Tm+BSjV9T
	3tOKOLj/4mFdOkSIY1dzuLJvEAxOwwC/wY24kfW2hkUlsIl24UcZrjpjUWGSi/I6
X-Gm-Gg: AYBFou1YyMxPgqc0zhlzWYTBpaQ5139YF3pGs5r7e8xqZ2O7R/HRiGFkz8Oycm+GXDf
	3IEQOkmC5+oT3dS0PmvPg8Czgi3WwoL77k+OU1NARoPYJ+CH0LwcggjkWNjsZ/8V1lLHjYKMEUK
	kf1Gbos+gREVKGlXiOYS7Knky80zCSEpye6B/+szIm3qWmseOouBFwRgJLicGYdLfhjBkhcjgf+
	pw7nRD4YavoVMI0YMfo/H1SJLG1ai/wHO5QJOzVZPYCOVNXNI0icBbyVqZJtkFVMfLlE3xa41TZ
	rB+vgC6nWoVimOQyCzY5jsulOjAgVLM8k6ilklZOzVI5eDrfE+qOXwqtc16tekH0nLM2NhQQCEQ
	Fl03NXinoESFZJCAxj7qFN+Q4PJVMtfRmA5AuUX5H7ZiJ/O/TBcWB9mCRlz4UAFW6V2LI8KtWkK
	Eig2rBD9wGwzfaaCIxSX8LV4/cBkK9LYCFCSDtEyFe8OVGJy+x9om5nRnt1QGTvw+WGhODaTUgG
	NqYy1v0WaiTFGOr3T5/MbGYJCa8ang6ZuFDNYfAyroBgUop
X-Received: by 2002:a05:622a:1ba3:b0:532:b08b:45cd with SMTP id d75a77b69052e-532b72e6f8emr88245881cf.31.1789974868096;
        Mon, 21 Sep 2026 00:14:28 -0700 (PDT)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com. [74.125.230.204])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260bb5fb0sm61109616d6.48.2026.09.21.00.14.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:14:27 -0700 (PDT)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so23242751cf.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 00:14:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmvXYXTaRGnIlhz4tAv0kD+44glHCrNYeDQ3BOTsBXE+/hZI85T5JC/ZRvhaKeK6WICHPWxl9UaAcHAA==@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:7a4:da60:acfb with SMTP id
 ada2fe7eead31-7a55af3177fmr4503081137.8.1789974432591; Mon, 21 Sep 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
In-Reply-To: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
X-Gm-Features: AcwNN1XBDwh6z17IsaQFiDrYFydSgUDFMGU_5lJeAdoD724Pjbvrq8QmlAe59_g
Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
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

On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Kieran,
>
> On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Add a new dt-bindings/media/video-interface-devices.h header that
> > initially supports the Orientation types and convert existing users
> > throughout the code base.
>
> Just noticed these are already in since commit 6ab5acfb8dd38729
> ("dt-bindings: media: Add macros for video interface devices") in
> media/master (next-20260903 and later)?
>
> > v3 collects tags, and fixes the typo, but drops all hunks that do not
>
> [...]
>
> > v2:
>
> Interesting changelog order ;-)
>
> [...]
>
> > v3:
>
> [...]
>
> > -v4:
>
> [...]
>
>
> > -v5:
> >  - Definitions now accepted in linux-media, rebased to get conversions in.
>
> Oh, you say so here ;-)
>
> >       arm64: dts: renesas: Convert to new media orientation definitions
>
> So it's been safe for me to pick this up since v5?

No it's not, there is a hard dependency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
