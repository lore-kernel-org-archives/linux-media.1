Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503011;
	b=P1KPEJv9ZQ2cWJcu1twgQf3gPKNUvGqSBN2EzlhzntTDLLJ+vFnO/HfmA/NjyB44FXNG
	 kCQA2rzPT6qPlJbroxonD9Bdn9xGUHIbCSNTx2XkJOo6dz1/qRtcbYn7zp8aXCcRFA4jS
	 nq9IaVtbQC2XAlB8Ed1jjDYPImTedU7B2E49O82tM4N3j3hQLt68jPZtuI7Zb1iw4fBKJ
	 fR2FfVpfte76vyCWt0ZKrJC/TEsDwOFJmOu//RP45qxnkh4WG7tK7FGa+Qp1QlYlCHghE
	 2h3AoPLXcuqDz9YD9+AUbuL5ybqix+7zxJiSI+IUBhLs8dL1hiSgqqJPQ8xMxwbzS1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503011;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
	b=f/Fcxxvw5GBJOH7hGfZYvXwW7c2g667OAcOeOWypjMVN0hS/nZznwnraaFfn6+MkV5ZH
	 lP/QKPg5uulGR25d9VhoJL8dZxSgeHwbxwXyVGAt+Rx/aDWcgk5irE6pqrsHbl+hHOzuD
	 UgM/x61iWH2cuOADO/vgCc9dDOfKgZU5veS1pGD0fMK7vlgqwZtqwoI6E7JLDqpDA5atG
	 5MrJ6OVumMs1xTawAirKEsvhiH2UWsuU/aZzxjV+48SArR4uiicvOT+xrPp34t0MQ0SR/
	 U74K+FlMcoWLGtPT0+1323pl4gDRobfFCjFuTcwpJgYohxIBplAWLSGYyuLQ43jip7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308D5606A33E
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 13:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308D5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso1875849e87.3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503009; x=1793107809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
        b=kDqSCYDfwzty9s3MHPlc0UlsGZxJZAtbRsuRoqZp0dcxkNtgxgw1I8QDseAEqYhnVZ
         h8LEBzvDldplKaL/tqy0H4THtP16y2zve4fOIrFjZ2k+O5VOkTpellBohyhyl1GWtaXz
         5snk8IhZdLb/5+KDk5r+htEn9OqsfMKVE7rQqfgIEV6jH2i3iXhWdigFp9dR14wq9vNc
         4ESIbMcv/gTXHYKBQtQlhqLIL1u+/MeAoOG/HnxBSxTQhvXneXat7u8+JmgAUKw0jxfy
         9bjv06lIlto3aTaKalkBuqEYGOt7qQ4fl7QHzctQseGbenry4TulqoT043moxHiCBqew
         dPwg==
X-Forwarded-Encrypted: i=1; AKwUvByLIPr6qRnI5xGu2n3ZiBqH6sFmZR3WAhFAbpZA/R7GmzahiYOZbO091345iYu/7g/ck36IHtFROdzZLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJg7WTHU8ZRDFAL314JKrNW7zAIAdlZTzcXstLkQ0uOeOGcfCc4
	0lg2PqvDbSCcayJW0aapUPS+kI8m4yDuUVU2kPzY/oo3l+FpPFWsMCUPcs//GUZ/QZI=
X-Gm-Gg: AYBFou1evfFDew5K2oF8eokyD2svrRYK+MAOwQuQ18K1D/60fgndpXuCoEzfRAP7d7K
	NCS+WoVH7X7cLoj56ewua9GaolCiCrWUauDcIEZunmHwIwsKNSG25xSAxObYXR335ALLc1pLvjH
	cN6YuEI+UG4PA3chu2X0JasfxZvNnZiIUH8sgALa0K9E8OCfYcCdYzZvDKNO+XxqCdVMURQcR9l
	16Ah2Ug4mCKqGkYj4Kbr9iXRa7+YzAwD4UiDasvjlBxjgD+GBNtw014R6woTFcfBWeqJ3JE7Qt/
	K8hhRpfQ09EGnHvNMGO53bPEykiEFE8ltQVa8svPgZ48jHcUatJ1ysuTNKZtmHXyk84+CTK8sYK
	DV+QMWTunZHU/o7bYVqLG5J5M1hkpquNVKfkD/iPT1lzEO/zieOH9eWv6+wJyRpvnnqbEiJk+TX
	K6gwFSfn7q9xQzm1ZAvE1pwSTZ6pVxWQNDHYzfh8Az+bk8nzIQ70+1SSJWjRqh0bxDBkHhQK4bU
	P8xhwHveu7PdNoN8E01CRCOYBVuFTERivHFmNtl
X-Received: by 2002:a05:6512:3b20:b0:5be:43c9:d4ee with SMTP id 2adb3069b0e04-5be50a505e4mr3654121e87.14.1792503008936;
        Tue, 20 Oct 2026 06:30:08 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fcf91sm2728339e87.7.2026.10.20.06.30.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:30:08 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a75f960be3so34704811fa.2
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPhl3gZHXCJx+vsH8zS3zYuNRrjzaFHMTqpvMXLDe1Sws2zi8qOlJHKbsxTl48RPiZZBRd+e+/GpxRsg==@vger.kernel.org
X-Received: by 2002:a05:6402:270d:b0:6b1:c7d9:b631 with SMTP id
 4fb4d7f45d1cf-6b3a8191a46mr7499369a12.23.1792502542847; Tue, 20 Oct 2026
 06:22:22 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
In-Reply-To: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 15:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
X-Gm-Features: AclHuK_uZzRO_WalfaTseMvUVupoP686uPVQ89YYU5UfnQv3EiXJeP7RDzX6u2Q
Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
Subject: Re: [PATCH DNI v3 15/15] media: rcar-fcp: Check device revision at
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

On Thu, 15 Oct 2026 at 09:53, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> ---
> Changes since v2:
>
> - Add FCP type information
> - Reject devices with an unsupported version

Thanks for the update!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> @@ -154,15 +204,67 @@ EXPORT_SYMBOL_GPL(rcar_fcp_soft_reset);
>   * Platform Driver
>   */
>
> +static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
> +{
> +       static const char * const models[] = {
> +               [RCAR_FCPF] = "FCPF",
> +               [RCAR_FCPV] = "FCPV",
> +       };
> +       static struct {
> +               u32 version;
> +               const char *name;
> +       } versions[] = {
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3_ES1, "H3 ES1.x" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3W, "M3W" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3M, "V3M" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3, "H3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_D3, "D3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3N, "M3N" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3H, "V3H" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_E3, "E3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_X5H_V1, "X5H v1.0" },
> +       };
> +
> +       unsigned int i;
> +       u32 version;
> +
> +       /* Check the device version register. */
> +       version = rcar_fcp_read(fcp, RCAR_FCP_REG_VCR);
> +
> +       for (i = 0; i < ARRAY_SIZE(versions); ++i) {
> +               if (versions[i].version == version)
> +                       break;
> +       }
> +
> +       if (i >= ARRAY_SIZE(versions)) {
> +               dev_err(fcp->dev, "Invalid FCP version 0x%08x\n", version);

You're missing a few variants:

    R-Car V4H: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010a
    R-Car V4M: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010b

> +               return -ENODEV;
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
