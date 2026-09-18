Received: from mail-oi2-f26.google.com (mail-oi2-f26.google.com [74.125.231.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D239EF23
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717398; cv=none; b=TGJHwOj7MNjkWuP/0KGrv8rVYNuZYlber09ehzQN5mkVvHVaybQgRNTQd449jSN1DSMuR4g43yn/nrZ2PRmpbI4feeuKKHVLQr7WL1VodAlFzCOfdizxZYbdoK14NCTp9c0jQMOvrbji+GLhO1B3faTWd5XCRbEs9QYuTGkGZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717398; c=relaxed/simple;
	bh=cHVPOWKKfhZVIB7cWuXyuW2OrGOIzBYJeXQE3IvAcLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=em3GlbL+CLaXdx3nS+leBMLi5ZKnAF7SPSXAhr1KJvj+hX4ccUDtXu58LThQwmDOzj8pZvsvDnyrQUT1ex/wtOZjWs2BBRaD9TOZwkHkKqfeQvyWujglnraSgcF68nD9q+BXy7OXftBTYtFuP2YpFPe0qq2CFPn+/7E9xHiNu1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f26.google.com with SMTP id 46e09a7af769-80a18990c76so310962a34.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 00:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717392; x=1790322192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WtucTJYH5u+SsiRL/3DRg9hQeKGo+JDwDdtR43iO30=;
        b=lSxJaQ2jMWIei61wagmO3k/7Eoc1ix3/rUGxjBytYJSJFAWE5ZsAKOO+4MWNnUxswI
         faewS7nmNAVp5vv20uiNlVuet5emtREqYTHfOmH2gbcyLnG8XxFEGpqFZnQb0bajELHk
         HESEdICZUwXDbxT5kGzuF/P/5nF2iFpjlEgXJk5MzwmpGihk0EXL/Xfgcxk/IU3Os0r1
         CoiXL0gTmJh5Zat3m0iaUNftyQ3/OY6jtVZBMUvOvmMZdfPoyrMtndIPBF8+f6FeLx5J
         eA4UichmXgexcXr6/q2tDm8SEaD74P1010d6T/GMKuF7jHg/pz22bfgbBpxIofyZmuZs
         KpkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4YtU/ajghnj70fMuJPDveHuQGriwMj2J9svw+cFlcFPHCTZcI8Oc+o1kwXCn77M5ViPtklOZZVoVCGA==@vger.kernel.org
X-Gm-Message-State: AFuF++mkDV/iqUrnTXICiFNaTL2uiV3v+xeUfYtPla7ERS2vfwVtU4bG
	Yk87rm99TEMMoSbx+7qbVsEangMctfcfy88ulnxHQmT5YtTOXbTlXKoXZZZf2aqx
X-Gm-Gg: AYBFou3SDVpY6rWFcqoTBakgoRHKmo7aI1DHzke0drZrNXnQ/2DXTYKCzuu0m+glyws
	A3Wde/4HMUOJaWPgFBNI/68By1EiMllu8hA14am02pFNhILFO63gcQowq95OR6U4zi6lG9BG2WP
	NIWIL9vU5ef5W8Rrc2UfAiuzOKQejh/rHo++25fwaY/bxfmvWAd1R3wg3UC5gFt6uRrCxTkv6I6
	+3XTPBHVJDMzEEETBqKLEWyVq3PLeiH0eeByEtZfKchdzIDH1pdFcyk4u0Uofd7WHtU/cUQ6Y3I
	/jN7LTe2YTJCMUGWVgpwbAQVHTG0hxiy2SitguVCJavcxXbSNgh8CERG/StKfLkLiR+MeIoT68s
	ikHHFx97DZLiz14vBGYBgnXzZEmzuNd29N5FNYp/jLo1jyoXPelGUqfNw62+yi4esaHmRA2OMca
	05Ku+8pXiGmIHk9NAAuwxOXKZ5IQmNl+YWgx0VKh00Nnxim6AtRusF60qjXcSKdDNfHmaP5IhON
	9jdtgXNiwgAMpX2GDOO1rqmtqq31q8u/KPk4Q==
X-Received: by 2002:a05:6830:7004:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-80ddff5cfc6mr2099592a34.4.1789717392482;
        Fri, 18 Sep 2026 00:43:12 -0700 (PDT)
Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com. [74.125.231.167])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5225e1f1sm790281a34.21.2026.09.18.00.43.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:43:12 -0700 (PDT)
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6c2613d8157so181366eaf.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 00:43:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSvUfMdX/iN6xJS06Fr4AcobJAGvLNkkQGZhh/yPdQ3u/Y6ST2pzZuJNRCBrV/Z1Twceb7HCOQSZCUvg==@vger.kernel.org
X-Received: by 2002:a05:6102:91c:b0:7a3:2e52:1163 with SMTP id
 ada2fe7eead31-7a55da9b0damr516237137.26.1789716931735; Fri, 18 Sep 2026
 00:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-2-4c72d4e086dd@ideasonboard.com> <20260918011156.GB145152@killaraus.ideasonboard.com>
In-Reply-To: <20260918011156.GB145152@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:35:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
X-Gm-Features: AcwNN1Uhv0ZzlOO0pTf4pD3p_OGSBmogWfpHa_8PkhuJrVnrMv3c15ALo4pMZkM
Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: renesas: r8a78000: Add clock for FCPV and VSP
 for SCP FW SDKv4.36
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

Hi Laurent,

On Fri, 18 Sept 2026 at 03:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Sep 17, 2026 at 09:04:41PM +0900, Paul Elder wrote:
> > Add clocks for the FCPV{B,I,D} and VSP{B,I}. They each have one clock
> > from an option of two: a 1066MHz and a quarter-divided 266MHz. As we
> > already have support for the 266MHz one, add just those for now.
> >
> > Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> > ---
> >  drivers/clk/renesas/r8a78000-cpg.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> > index b820d09e1a195068debe8a6eea7a01c534a97b23..17792ff6ab8ae2f7eb5c8f7e3d581b43177e195d 100644
> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -326,6 +326,8 @@ static const struct clk_map_in r8a78000_cpg_fw_4_31_0[] = {
> >       { R8A78000_CPG_SGASYNCD16_PERW_BUS,     FIXED_CLK(66M) },
> >       { R8A78000_CPG_S0D4_PERE_MAIN,          FIXED_CLK(200M) },
> >       { R8A78000_CPG_MSOCK_PERW_BUS,          1667 },
> > +     { R8A78000_CPG_SGD4_VIO_DP_TX,          FIXED_CLK(266M)},
> > +     { R8A78000_CPG_SGD4_VIO_DP_OTHER,       FIXED_CLK(266M)},
>
> Same comment as for 01/10. I think the two patches can be squashed
> together actually (unless Geert disagrees).

DT binding definitions are shared by driver and DT sources.
Please keep them separate, so I can apply them to the shared
renesas-r8a78000-dt-binding-defs branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
