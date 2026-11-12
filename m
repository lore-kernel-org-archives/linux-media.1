Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495032;
	b=Xy3jVRp/s5buI6LV5+txOoWnBiadD9Xljb7ZJQqMrE361tgXI4A0wXB5LUtU4B5Z5sPx
	 4+FuOxVgt0veKrWisd6O5PpfvyKdcAmxIz0/7fH+YrXB5moFqgsIwbncuNKnq5zX3EGyX
	 VRpxHqBH7Q7xJlSwX/pmG8RPNpXksYOfSux+BOtYI9otOiUaFcNL56FDEVTtyW/pxlguN
	 h4yXcX87d8WvecUt/A6/8hRebXjTodSaULoTwT5qitVYNdQAtnH9Psr0eny5oAAqbxhQk
	 SpkSGRkHEHZxW5dKzEBHWYOld14uSkNoa8BXsS7nfVpQUn/gRBcpeNGGCb0rRFuYhcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495032;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
	b=aziFbUXILIFMLU4OoaEEo+SWv28cZTecrAdasn0hS0eGKGS/OEaHUr/NcpPn5b9/H07h
	 0afwu+jHG7vDTkZrs4utzTj26K5t1AzclluCcjMd/EawGM/rgNes50KU1aeYbP3cb4igy
	 dQYfkviOiJNNMbUmfl0F7PvgUfqq9M6lYWegLBXFW7AncAzv07D15Fz/FuXBvW/GW88Cj
	 Iw3Y2umqSGs88pVOHbcUMsS53Lon6yUUT9qGmP09n8a/9QZSSagXs9nYzkyFQq7ftuV+e
	 b7iyUWaIDh6Icv6oYuvKHRhAqQv0XmewJaGjl0LwZVp9Sdxk6CnEPbTInqJ5+k9mcuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3E606A89A
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC3E606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9905d61449cso1233406241.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495031; x=1795099831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
        b=hKGuV4df5J7+Fy6paHlD2QX4R3DuIQhOWMng+EiA0AGveTQ+1XmS8brhSgVTLbnhdH
         SF7LVWcBIsmTN2PCgJn1im20SzAADucLOKXophzA54nqIIBBNyq66WBm/Xy0rvK5WF3+
         hKxP0mA6qWxbb73JW2OmS2OdIdIruXU8fqWLy1thfYHURamWuDkNLrRc8r//ezpSE53p
         GX0V9E7j6LvH8rLux8gkoTMV6xJy2+z54FI7p9zhUlK+Yt26dn7JfOJuXCjhX3qr2aZW
         4k3/Poq77x/ZIMBuU619Wj5ZROAqlhK1qj8WXOUmkxNbSQFMG+5EwmXyTv/HyJ/rL11h
         weLg==
X-Forwarded-Encrypted: i=1; AL+hErGHXR2wHmxz7WS/0hVsiYxRUTX4YJHiKzsONCBPPQe0hnlgl3vRYy28itGV/WT0mOis+MalsdKz4kjuLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qKZOnhdj98CwHLiy2lQ+9e3dveEuq4E5qX9sDHh7fXiBd4zrU
	PaV06dd84n0KHP6ECbUBoOet75kkejTwms4k6DR6BflWQ0CR02iyVmVab2y27wHbG7I=
X-Gm-Gg: AYBFou32JlD649gXp29EeFlS6POz+Gx4r1YD5Og3pER5OnQKUdLFWIk6Nm78uGvNlZh
	l4+5ngor2QrnamIBtY3eoaJgoiQdFFbJonj7l/O2tqcT4GEVEcrKf0Bsvpl0pb2QzJgt/3mv+1g
	kIG3Y5KdaZzpP8TVqiOTNaRdXEL60TknnG91sBFE7F1LntwJkIDK/d1QdxSwEwxXycsoJMio85B
	bEnObeLa5v5v4hR/iCeQrofOej4viVXIfVRLwEIoIB7hIQqnh8UkZi3S7Ubi1ZetKp33uTEVNsG
	HzTAv4ga/TqI+6ARG2pLS24m7Mjef5pzUrCvN00Eu9uYNHNw+1aGlyN4MGFPRKtEFv0NhYUPIFf
	FltBs1IYHpKcZdnlkcEtqExWQfSD4IM8VAh/WdlmJYynt/sI0yElvHt6hFR7BBYVIv0MacBb6cO
	iSebtwW1ctFEaHx1eGkOXq/CuQuP6dgeybIAdyRomOXDO3RSsJ1PchsMxwJdxMk4L2InjsdeLPM
	EYA8rRGKAhSZEKH74ORUpN9/+F4tP4GEUPCGzc4t4AulyJYUJgHtrjMBKwWgDbBwae6KduyCJYt
	ZdB7clAasyaJL9GF6urrJJoPVNgxlczVuKC3j581fAYrZTGUDzOloLATqi/U7wcCtT0=
X-Received: by 2002:a05:6102:374f:b0:7d2:7827:c01 with SMTP id ada2fe7eead31-7d506101879mr2165412137.28.1794495030641;
        Thu, 12 Nov 2026 06:50:30 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fd7548csm5501154241.0.2026.11.12.06.50.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:50:27 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso1102958241.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFDlCwbhbRYgOW5LodLM7k/8y8ktehcecnFiAq/F8sue3Lt51CB1jkKAVhDh7gW83FZlSA6BetEE1IFJA==@vger.kernel.org
X-Received: by 2002:a05:6102:2925:b0:7d0:5688:f511 with SMTP id
 ada2fe7eead31-7d4fb2b4baemr1940643137.16.1794495026588; Thu, 12 Nov 2026
 06:50:26 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:50:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
X-Gm-Features: AclHuK8sy96nMijWIpulMeqo_3YMpISU_WECBzNl3ZKvutsCseDDYG3iuq5rfEs
Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] arm64: renesas: r8a78000: Add VSP[BI] nodes
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
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Add DT nodes for the VSPB and VSPI IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1646,6 +1646,105 @@ fcpvb4: fcp@c503c000 {
>                         resets = <&mdlc_vio 0x106>;
>                 };
>
> +               vspi0: vsp@c5080000 {

> +               vspb0: vsp@c50c0000 {

Do you want to sort the VSPs within the VSP group by unit address, or by
label? This matters especially when also considering the next patch...

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
