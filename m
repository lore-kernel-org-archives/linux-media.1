Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492905;
	b=sKbOh4xsmdhePvGvsHEW/lKY8TCngjreiQwGTs5Jds/0KwXsPZxNkWDxEoZdJxmhtIp2
	 WXKM6b/hpWhOOpwEUKknyRgfNIwCjBXagmUftXIqArg+HF+FEgZg5tyGhtGXrglj9yeot
	 WAb0/Qk2pQgiJ8ndMo8oNDKcxWd5Lwc71hJjgSNjiq+MrfKaoByOnSMevQKGMl1xcLj9e
	 16ox4plTHpA0r5SZBO8exe39sQPyhn/0u2vXnxjfZrr6LiboBmx7dIombSytUJmcLWqSw
	 p49hXafGxdzAeW+73P+qbEbkBT3Vbe9n0I0WW1xTxK8E8G//03NaDj3i6HfzxYtEdig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492905;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
	b=fpTAjU9qtum+UwoZJujh11J3Swriar9EFqfKGI+MMm8SMbMnV2+zSEjEXOWpfrjI5Rr6
	 XWaGhXdvPjnXBeuyDr4bUQ7E0XBF6AdyA9kKAk3q5eWxqXvDIPx6zNr1ssjT6WOT0RKAV
	 tt+keDG/QzsBXoGTb2E5azO5SVQst760JF5+TLHm9PAwspsBEHS2JSrnZyJ0cum44MlSN
	 08NkkmjeSTOjqUwJzsHkeJb9BzhG+O90TS3qTyQUTtrysiWyAgZFR3AgeM8986zaR9dxZ
	 faDM93c22Y1Z6WBoDEI4AoW1NsFr45rcvKqrX6yda2REnYo4gfsS+ktgb5fspaqHnmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9885606A887
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9885606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99a5710ec0dso703966241.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492904; x=1795097704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
        b=Datgl1XlWEh7VcDGPgg8GCb8GvddLHkLa0Xbi3f/PoqGr+bAOZ2cmVOKR3B4RUDdq/
         YosBro7do5N0a0LRR91VfKXjbVWqNRvaOFssW8UuXp6cKQJg23CuBniZdK5yLl8YIuG8
         Ml9WbTTuNgfzPe7kkD/fFj7h4Gw1PmpakZOAv7//ZI+5P5bs1CFeMfK3VIS7IuZUfgV5
         bkW3xLdCnpr2gNc9OgMsHXET413ZMHRJCv1HRoXwP/OCWKHxx5rST5BCa6JQOU1W6m6O
         Q416PKd5Y/9HQJsL25pa2eyyz0/eMy1/h1zlaFPCmbMy1dpSjCeCTUaZBVaYhvxKrtBR
         Kxhw==
X-Forwarded-Encrypted: i=1; AL+hErEpeuzvYkuPE2337QgB/fxjLtgXLpcKw0YnaBRR8wvhKRgTVe+MWtL8N4pWP+IFfww6ROEuisSwLIoAqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z95hT1uPcx8nB0l4ycYBF5ukShQA8zTN/isx2ixbXlEDpbNG6nP
	pQFFN3cI6EhL2noemiyeImddOXQa+d1JApg4W9e6ZPt2VpJB32DMiHMArnfCoNUVUrg=
X-Gm-Gg: AYBFou2WL13JwqJkxbBF6F9Kto74cxYfbTm+ANk5t8EkxkQ58Nf8jN5t53k9vyVMnkp
	nVamkPJrNwqdI7i04wv/m3GPf4yMItao/M4mFirDFMs1n/jY5vp2n+1BT0Na9tTwbnSWpjAmcUM
	DCR2jY6tOuolkPVYJCYkhufpVD4AHjJVd/M4l/xMnDmuBl0DwSIOrMpUyDZdYLc04x7Y2yQTdew
	oTJSpUigddLE8xcnjcWZm5/Rqfv2DwX8N8srn+vvdk+KgK6SGfhLuj6NBAOKqIoZd2n6mH0SIpN
	gqRD3ciUj13hTrRvM67bajusZ7MkdVz46/XXqOayWBCHFF5NVHfoYlstu39KQWi7i1pCKpvarf4
	mUZrSI+1wNdQsXe0ITClb6YAMJFfbfpMBsGsurcngbpkU730YJ4kVC1Nyr+UnZgpSq0aKTjJh3y
	2HT6OIohXoJDH7BEXZTxt6y5HrngzeQXJMp4tFNa0hzqEZtFgy/3PhqcR6HykAWifyH/C4K05Fc
	myW32YL8Lkm207BT6ILLy1PdE46KbcQ0A7m+qHitTHvEwsVE/FK95rpYT/yyY2fxBilMvNeXSd6
	X0nrXyoyxE9w3fBFNncREGZl0dxU+YsDncvXU3if16PJ98wfc1GuZ4vHyK0vyYCTrwI=
X-Received: by 2002:a05:6102:3ec3:b0:7d2:7be1:272b with SMTP id ada2fe7eead31-7d50615b505mr2145326137.28.1794492903782;
        Thu, 12 Nov 2026 06:15:03 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d30209ff97sm6253727137.0.2026.11.12.06.15.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:15:01 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso1033613241.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:15:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1CFqJkwO7jIGG6iVDKld3nuXZWzYvoQthIw4fM+mKA0FDKXQkO7rpZ5GtothYfz5TyYfN9q/HwOmWCg==@vger.kernel.org
X-Received: by 2002:a05:6102:5798:b0:7c3:881f:b620 with SMTP id
 ada2fe7eead31-7d5060e293emr2040092137.21.1794492899954; Thu, 12 Nov 2026
 06:14:59 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:14:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
X-Gm-Features: AclHuK_i81THT_hnDNfFBzoyAYqo67SKua85inNQRuBh9I9Xk4b1lG_6SVOc53s
Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] pmdomain: renesas: r8a78000: Add SCMI maps for VIO
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

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add SCMI maps for the VIO domain to map the VSP and FCPV power domains
> and module controls.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
