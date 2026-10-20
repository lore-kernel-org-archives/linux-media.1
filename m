Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498862;
	b=Hd9oxRvevo39TrpFZBzb7FtsuZiszRwpxuLAkRDb1ECgyv1Y8kGSsQ51YrpednF2ndgq
	 z2aeBKtge57WAGXc1sDske7iKJ1GeEc5nmhXm6+miFdgQ4fY6VXnGep01CIoaxNw/z/+n
	 sicGwID++Vcq7+vwOYu3RJsJHVaoFIpdtJugnryo5PaII58bYxFN9w73Lv0vkyv+t61u6
	 quQG8I5kzxIzWRiJdAaSd52mYRIf3VBuE+0KWJvk1HfVn1C86qvDDdBaRQ/HnkP96bGWG
	 dZj7NKgJzoKpuc3LdrfdUsDXu5Z3YEhM3swGktUaasETabwZF0a0k8QoJ5RZiEKbCPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498862;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
	b=1TrzqGxkGuixBiEiQ6rPYOXZm8aJPp+XV/x1biV00pmmpWCIszNuF52TvNHlaE14UefY
	 3tpXVF+3/vynUDUsdZmpExV9IgKMq655+/EVPEXk2OLr5qOT4bYwp3AFRTGSM6e23jvzv
	 +WYeXunf41ePAEeHQCqgP77vHwGi+OeKQcUSB5/+UB3HE1Pk69WQ+7OIL9uV2fWFJC59p
	 F4XUZZ56CzeVUIVQiCTCJ2u3DYLWC8MxAt/Sj1UCNv8/7lvgfNjF9RixqJUtdWcFvH2PO
	 pqrGWeTpzF1nEeNzNC+PMAF5S9Z343fck/Pl468BJS/UI1ShfYMOQZ2zD0xLpLuE6qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4863F606A322
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 12:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4863F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso959637e0c.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 05:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498861; x=1793103661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
        b=kzp3Uxa66ID1hQV8vugiQlKnQZZWGw2QxWVzhfBBIrRQvnLolCshVsnbeF0gr09vPE
         +4sax7H/4O0FJnRr1XQ2TjwXwZbOnQTsbjbQdS6scoLu2Zzu2VI5YjYpG7Qz38yaLhkn
         fpvTQVIsBZRbNSYaF9jExHjSdhtio45nB6Xeo2wWQdK5TCZm6nmJOGzDs+mPltMan8GE
         EJC51zAT3WdxmnBPUyUInMMfWm7RwNlU7U7E8UjOH+yi4P9T8veKvtw7CQAfOXhW5E6i
         j0Mqlr88eD47v/3nn6QwQdnlFQ+ElKh98nRZb2bjoNSy2pg9Z/rhFWlNWdZvDx9l0boJ
         ABtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrBw1vNTBOIR1wYVVyE7AdDu5YEb7hTykjoabXBbDJE89He28TfR6rAq0piHb7FiUnJu90HIfFcUiK6w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLj8PkrezS90YYAjvUyh2djr2CJ5IXkLEWKAX1x0Zt5IljBlQLT
	FU+hP4W6kecYwdTEW91H6242V+P/YFFNsRgmOgEp1s2TkOdJ5SV3kNS4TJgVYbutLBk=
X-Gm-Gg: AYBFou2ND8e4gNutoTADxytbkey5OheUM8WF664fOct2U+g/Dtnh5kfh3cTXE4vxXly
	cuVucgvqNlYiHSpqmQ6/DH2QuyDtaPui/TG1UNUANGV/IWBXJ432tMS+WRy4CympoZNPV/H1DSH
	k14d9MT2KoPXDEpwbVaONinO+wDxy5N4NfXghdO2uWYfvYiqayPdyUOvMi9yUjBT5zF4EwcbEzv
	Ix0R/XA130FI8thwXhGtIIsOrsCTzPwyIU3MiW4VeLzfM4fJ3hkKHf81PAuydLhmryGQc7EJhZO
	4CeonPhyLAcB2g9/oy7XOM2bSyuW2JtvMoZ4Gp2uWgPw34DfukOhcIDTGw+QfhFahxjWTVw5ozk
	CxR6Mc8UuffA817jnUfCJ5wG0KMa2B5L9KkuFOr/alcXin6pLUo57VsI+P5ZAVmVsEgVbfuoo4z
	HKfad37G9h8s//bzT9drgXrM8kaVbst7coTHh5s7Zildz8d8GwOqAGmJky/9/akF3DivSr03EKJ
	EY/7tz2gzVH1zEenOmUaJuQvsnlMV1/7sGf
X-Received: by 2002:a05:6122:e14e:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5eaaa0ba603mr3434061e0c.1.1792498861104;
        Tue, 20 Oct 2026 05:21:01 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eaca7cc59asm5582331e0c.5.2026.10.20.05.20.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:20:57 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9851592ada1so951387241.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 05:20:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGb2w4bqZCZQNbv58dTl/+U6D7eZBERfhCNmRQvpPphIz1daLASAWA/uGgMg44bBAzykyxXyhaOiYs4w==@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:7b8:1a1b:8e79 with SMTP id
 ada2fe7eead31-7cc36495eeamr2517275137.0.1792498854605; Tue, 20 Oct 2026
 05:20:54 -0700 (PDT)
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
Date: Tue, 20 Oct 2026 14:20:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
X-Gm-Features: AclHuK8ponr4NJ0lS94fhAlbo48BEUWSxi4Wc_0ZZ5rhhDlLA3L5w0smnHDD8jQ
Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
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

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> +
> +static const struct of_device_id rcar_fcp_of_match[] = {
> +       { .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
> +       { .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);

I don't see a good reason for moving this around?

> +
>  static int rcar_fcp_probe(struct platform_device *pdev)
>  {
>         struct rcar_fcp_device *fcp;
> +       int ret;
>
>         fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
>         if (fcp == NULL)
>                 return -ENOMEM;
>
>         fcp->dev = &pdev->dev;
> +       fcp->type = (enum rcar_fcp_type)device_get_match_data(&pdev->dev);

s/rcar_fcp_type/uintptr_t/, although this no longer seems to trigger
a conversion between pointer and integer of different sizes warning?

>
>         platform_set_drvdata(pdev, fcp);
>

> @@ -215,13 +332,6 @@ static const struct dev_pm_ops fcp_pm_ops = {
>         RUNTIME_PM_OPS(fcp_pm_runtime_suspend, fcp_pm_runtime_resume, NULL)
>  };
>
> -static const struct of_device_id rcar_fcp_of_match[] = {
> -       { .compatible = "renesas,fcpf" },
> -       { .compatible = "renesas,fcpv" },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
> -
>  static struct platform_driver rcar_fcp_platform_driver = {
>         .probe          = rcar_fcp_probe,
>         .remove         = rcar_fcp_remove,
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
