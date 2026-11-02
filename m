Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610465;
	b=itiDd2+yizxfZ+3QGLVK3B1UF7V4zdaPaEQTVZRpHUKB0LBYt5yUBpJfcMYgul8geGJP
	 qrzMYs+3rbKlmWNJ8flSNJZvOnhAEnev2Ue+8SkAFIUDBYp7mtL9U+t0MPoaowSMirmy8
	 vGGIZ3U+mpraKuJdXoPW2M/+2/DJ6mKl4KLwhyKEQpsnjbh0V3hbiXCj/5Ssj1QFP1h7b
	 PFVkvpa8O6Q891NoXxyKVkfiucq0Rq32biixVt9L2ujUvlwNiEF6nPFUjGG8V5lque/cM
	 MUtnRaMpnyXUwcVmO/eOnxEqrakGO8CNHp6URwjM+4KakX7YlSMTcu/J2YEtcHmzhkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610465;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
	b=wWIBLOohlGy3doTwH5m49zzQ9+eLm2qtos+kz64zUyL5uH6sgblnJdSJVE9FpWza0jn8
	 zUGUmDfJfFt/WnYiPLyWXQaDgwNPuHbAQnhRT4z4etW0SlWwO1xCbuFlW7cLWrpWqHQtQ
	 CA/f61KxpMf8tYb/8RRCmHLF61zWCd84GKFMNP0ucR0lKBGNrEOC1qeRibgTq6C56+Lzi
	 paeIlsILk6PURbDAlQr+x5+E6Hu7k5qag55f0nX9dYTaNUQ1aq8+UnACpo0osmvVGG7mK
	 Lb5V9MWoKVtiNWnZWOYleE6O7Eh7E0GZcmt6BKnMIkuVSodxxLi1kuIDqJ/4IVePDVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B59F606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B59F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9906c85122cso486541241.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610464; x=1794215264;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
        b=QfRRaOLRCy0yUd2J3zSZHz2Xvw7sgztDPKdhdh3IBfz72vNpGDBXPfuRWdsS2MUOkz
         uICkOObDgFXoAUdMAYy2WA9vgxTAVAYbUweDBodGrOOSuSTIU0cEi/AByurf/7ipP8ny
         ZA9cfIBpAEAurO6wkLlHEsjW/ETTq6vHtQrNImCbzKhgb16zZHT9g3n3DhN2qJuHlynx
         7vKodtu0ru1gOA0ZjSACIzhl7vS6HjGQOOB2al0pd0q4k43+X4JdDzTvdZ5p7Ju6PREC
         UkwDQJujMgkUEUR0VBb3raX4gdtPPQ1eMYmihFK0KLvn4L+bfE2ioQkE3Z2czvEc/GBD
         werA==
X-Forwarded-Encrypted: i=1; AKwUvBzRtGwUvSzj5AGGVaEoqbe6gjXl36x9cPtwDtlybrCR2NHyWRWi4OeAdiJ+SntA401bPPHPDIOpFx0Q+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SXChOBUAhs5Cx+ZuXF6BS8ryTVXtXMcvOWkJulBjWG3mP1DtV
	zPffcA2DReeMhDqNaQT/syv+cF+zTcs+NrhTw/EJW6JbOYH7kajaVXBjOj8NsfR7
X-Gm-Gg: AYBFou2q1MsieNfU2ihz5ZG74otsEYBkWSUSiKWC5WqGSk8d4A6KkZsPzujmRnV+DE8
	BvTuH8r245lbzzBSqybkDJVt9p1yd+5xTtovknktGQUrzgkpLqqllJLBZLcTPPTlimGpkDi7V0m
	ZL7UTsO96jOxCyRDQCDF9EdPrZE1Z3zBKFH+AZB89ZAV+2BNAhfBtjuUsqYsbIpp5Q9uuQG7Dtb
	L7+M4yhzuFOMURSBY6JovRPYVERnbvgJ/Hy7E0nrpAsQL5QS8GBHeKB579NEUem9WE1he6iSzzs
	qxcuh6CgyiQ/ko+XSrpyLOXKkVLdw93tg/H3eydMt4i7sNhdpRhX/oNAKWUsNKtsVDm7bAwSJaZ
	40QF1ZW7BH4E8xf1Yym8STV4fBiocdKbtgq7krrHpIgR+2dzSR4EY17TZCyWiLdp111jX2VYUrS
	JehCao0Z5mJAaKyMQmgBVoC2+RkAxr5tbZsMXB2RFXxjOlkbO3O/dfO5NokHl/BUWuV4Z1o6iI4
	CljwYDiufZsW3IUz9hQmP4SV2W4g8C7eD4mPDQP6fkuJAHc697tv/xDuNiucxJtv5qDZAww8une
	awidFesZTMVnMNkVHuAWtH9oZWr1mZqOUpMPgKKvWGSL+rKZ8aaqK9WL6RjVb9piCfpb87bQzeS
	Vq6aEvxkmY6g=
X-Received: by 2002:a05:6102:3707:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7d072d11c63mr3073880137.30.1793610464065;
        Mon, 02 Nov 2026 01:07:44 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0775a716dsm9584652137.6.2026.11.02.01.07.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:07:43 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so889599137.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:07:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzRTyS8YoIxEkgpigQlULtU9cUuXjNB7EWG8okcMxAv3S0/dP4rgV1QWQTCC0oW8qCOhqA19+4hFufwkQ==@vger.kernel.org
X-Received: by 2002:a67:f403:0:b0:7d0:9587:1b90 with SMTP id
 ada2fe7eead31-7d0958732b2mr1205111137.13.1793610463593; Mon, 02 Nov 2026
 01:07:43 -0800 (PST)
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
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-3-e052903a3832@ideasonboard.com> <20261030220549.GH3178046@killaraus.ideasonboard.com>
In-Reply-To: <20261030220549.GH3178046@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 10:07:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
X-Gm-Features: AclHuK-1v1dRSgyK1HeeK29l-3g4aKIGNPop6k2nHA1eLryORdmauRDpRhHjRsM
Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
Subject: Re: [PATCH DNI v3 03/15] pmdomain: renesas: r8a78000: Add maps for
 VIO for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 23:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 15, 2026 at 04:51:43PM +0900, Paul Elder wrote:
> > Add maps for VIO for the VSP and FCP power domains and reset domains.
>
> s/reset domains/module control/ as its not just reset (and there's no
> "reset domain") but also module control clock ?

FTR, SCMI calls it "reset domain", but I agree "module controle" fits
better here.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
