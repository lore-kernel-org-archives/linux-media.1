Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495167;
	b=JkpVHp+vIU2WXc45EJGp71TUa4DN2ioiUbwrRWs+euFK4FGvA5MVyJiptbDmZ2u1YFXw
	 96v8GwFkEUAOrpTFilVCs0jYXPUBPbUEtUGVdCkOBLY+Xo53/IHpn9bCxoRvFJLRkMXCG
	 fK790jWgU9OpXa0bZOcer61UKJrQPW+U5f90JL5SWskJJUB+itS8qGoFv+6VQx3YWYwTh
	 Zr+7tXd/tbvislWbs1eEyzgbKZGLWWCzrBYa2KDWXhADeof/AilCIRcdGvT8RLB/zFJ8W
	 fUu9D/DIZxUHgdb3v67Shuesl6EA65nX9GqRcW+bhh7QVJueyM4DXE6y2lgIPscaqjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495167;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
	b=LIMQtgfHon1BdxovJrd7tc+I1GdYofodMqIqFYYIpP4eb/6bGss7ugdHOfAm5w5CGfH0
	 laTGuNbDp3tXu2x/AXVr450fbbWO0OpD0X7wHO++5VUtVdYvAuGgrZ91HAaSx8KMpGAAP
	 u9dnaN7wumZaBDJ1pUhHI9xf2ZldkeNWrqMEI9oD9UsCI1AT8IA2csZ5D++KTDRIYp7il
	 AWixX8mHS5xoZktwr+fwVCO56I4ERzT96RTdW6XDPgs2oAOupvnx2gbox3w6HAk33HIBe
	 5RbeG/hYbZRXrQV5SlemZBvz5q6LYbE0bnztaTFjlVBedv3jJOZ3z9chzBWqLjBtidQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B07C60A2618
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B07C60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f1fso3563990eaf.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495166; x=1795099966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
        b=RFhMuvF5aMyXjgCU0Go3CjqoWHA5i0gGXwZ0JxPKHgOZqiaVxrX+J0AbHSjw3PkQAG
         ADwSck9t+WKkW+ZeyJIPxmCn4EQWsvBwmgnQRLXcrM8+5BUn8LIOC7J34cPfmH3lf9J2
         DqwlmhwLesl/kOlie4/GN8dUIt6AXpZUT2fEGG0IJAFDzhGGfkVamXsqhuQmrE2WnrEw
         ZXtpmBDn7M6volaaB9sjRwApolMaHmIHNE+jUxt6OmDvCdzihlL+tP9yD/0Idna/88uz
         eE1/smdEEcx4CJIxoy474lTzehqOrU2vUen8MAibFl8zw61v7Sg1WbGtuwgURliJnq25
         H2ZA==
X-Forwarded-Encrypted: i=1; AL+hErHGD7m1FQseXZzCkX3qKNRNZCljO+zFJ6v4YbKxCYclS1XknzlgrDN1qyhV6EIrleIULxaD4CX1dEcECw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/xeqp3ztV7IV8LqXz5wVB69nZUthJOKechdDxW55p6VR4aChC
	V/+8h8qFRAW4oFgHZwSWo2LRVT4TvpRK8Wt9cT4DsLmeDxqH9IpTZFWmVB9jyawH0o8=
X-Gm-Gg: AYBFou3BIiO5CM7WD2WBTJkoQ71+D266jLMb2cWCbdLLhr1+ROyTVtZC+rf0l525Mgq
	rw5b+PeguiG5QJxIRnfT7u9U4rRX692dBaR/tB43MNsV1OUiau9aK7dlIyqZY4+Yp6WZdiFwXtv
	Ia5g9X5MQi2aENrb8uYURJTCBnbrOVtZHz5AYHUeOVBgJeE352I0IcjxCPR0pqJ65kfPKn5VM0A
	lZ+219N4LMnV7D+OiTQjTM0aID+R36zE+VC6DHOlvQr7UOG0XDcExzxM0FlgO3eWeWAw5G5JDTT
	rjfJNxI6lcY2fIKKm7uqdh+VtdN4Xj0G08LhNeOAuwmOtIM1Wd+B2FyD9t8AcveThJhSqCGEx8e
	ksLIq4D3EIN45gqLpBinuKiJVa1kT3L7KlKnzBSm0L4XaSox3uzS2eTyrzekMzV1RPEyzI5lSIw
	UgI+v/5Bh4bq7ZBCEe2qj7rnkhaXe7xSg2oHNs+mGECEj5XMEwT43OC8TbeZzgJkhjmIwXnCM7M
	cUVbgkyiTrhjoxqxL6O2+/AwrE9cKsG9LY0IlnDPd2zg7YeE+j3WtKs4p23boDhHPCv5ABUFNyd
	vbntEl8gtpmYe26gmmMi0rd7PiYYO6emxOSSicDV0pQIr0DqCNp2OX7/evIQAYRBLmo=
X-Received: by 2002:a05:6820:858a:20b0:716:d242:5c09 with SMTP id 006d021491bc7-719179c09demr2466846eaf.82.1794495166278;
        Thu, 12 Nov 2026 06:52:46 -0800 (PST)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86286c313d7sm93309a34.15.2026.11.12.06.52.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:52:46 -0800 (PST)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-48eee44b908so2420949fac.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:52:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGrfEPFbTYWQbA5riLpJ4qek9gyExcQNeN0Mo9okxVz6B2TJzgcB06rHywxQgjmOJ20MhgA0AILpvJQ8Q==@vger.kernel.org
X-Received: by 2002:a05:6122:398e:b0:5ce:d56f:efac with SMTP id
 71dfb90a1353d-5ee1c4995fdmr2096272e0c.21.1794494805148; Thu, 12 Nov 2026
 06:46:45 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:46:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
X-Gm-Features: AclHuK-vYdrIZUHe9zqdC5qY90reiPN1Oa4nwuum4GsEnnZB7I1s1LzmhCydy1o
Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] arm64: renesas: r8a78000: Add FCPV[BI] nodes
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
> Add DT nodes for the FCPVB and FCPVI IP cores in the R-Car X5H SoC.
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
> @@ -1574,6 +1574,78 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvi0: fcp@c5030000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

> +               fcpvb0: fcp@c5038000 {

Do you want to sort the FCPs within the FCP group by unit address,
or by label?

For the contents of the nodes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
