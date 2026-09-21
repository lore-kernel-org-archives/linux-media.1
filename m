Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA642E428
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976880; cv=none; b=q07Y6z4TzVs66GMLrxMYNubo0BCc/oBjQe5tVLkrOdUPeJ+r+CkSgiMf9KGKGZOK0TvnVfHsnAlHGJ6rJETxUImF73xQXuHvNm+SJF+1Ko7kKU1iJ3UNYDVW6MRcUQV9u00UoVuPSd8zUmQ5F/DYq/BTKjoq/Y/QKhKG+s7gSKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976880; c=relaxed/simple;
	bh=nRr2NwONb5MDiY74TwbEFnamWl7CEbEpARCJXKG89CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hv7o/NrpuOnyzCXBd33OYgTr/ALOFs8Z8dbcSAGxSD3b2XpG6rtY8kXvITVW7DlFXaeVRwvHu5HnpTvJ+E7HEhmGi91/fIBZkqeN/Ag0Bg/gRW4jgbGExilrLK/STg+yEHXlCH4mSlIvCuoIN2o5xliDn+v5wbVpXpQJsI/tdVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9a1536864so1896066e0c.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 00:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976878; x=1790581678;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FDUPsKvRHny4pMpTXrqtNbtll59mp87r5rbb0L/oblw=;
        b=gehwcHBB5NHQbbgC0Oos+IaIOGaw7ERgPIRwo7xHjSPtUH0OKlGKyaHfibf8nTAeRX
         yJn/zIWss7E3HiGrP3+jVq99laCWWzb1DUm0jl0byOJgyglcj+Tib/6v77RHXlBVURQC
         hw4JNTkcI4SgLMDMUqA5RvORYtHmsF9hMDJbeoivuKQ+nxF8U8yHf6yPGAcRkl2OxcAg
         J/+rNTq+gzZIlaE8ZOfKr1i8ncLSAJlU2i7nbARGpjmNlWf+vhBGO2g+ZRwkKvaKWrtJ
         3lP36/k0vZrZ/NLFp6uUNTeZfmZ6o9GaaiOFxjTWBsuu33xdVXYjfcWAfdW6DjeWAdOO
         z9bw==
X-Forwarded-Encrypted: i=1; AKwUvByCKmmGx8toMcka0jfryGdmxti1sbN+fe6B2UlRjtkCANQq0FbyKkMNtdcwWCW/UZhRTcXWlowV98GVnQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lE1ByVQN0c3Qxh/6pzSvwYlAYLRhjdRjvbGXZAgkUwBajBAm+v
	bDFmLY2jsPuY2jgjHKYXKzdliT2C7nawkSS3jHJXE8Ni376y6e9rxridUMEuzLTb
X-Gm-Gg: AYBFou0dQhoZe4Tit67lfGpPtej9WQhgcPJ0zo3GkCD5Ne2D9oWT0nEirgM/uVExOOJ
	iolbc3d9FEr4Pv48yYyDwSUbuG35nFkwe/LocM66szhx3rw9MWHfNbc5xLj+8sAcYeb9rRkImzy
	BroQfSt50Lenenl+IcOF7iXIPCXYUZnRSW5r1g4g8EvjuVtgcylTqa9nXLLpMSlM/A5W7nrmvT2
	i0B5tiTsJapxDbbXWguF5HMvGVkWmlHznhcm1JiTn/7hz+2ST7TZIbHISxdoRwuXsjN6rkUxvU7
	xi0s4/xYGhr/SzNieEFdPLYxzMbGvuYH7W6wuFEbNzogYDapd9t9xd3NGLiHwWkL1a/C4vS7yTe
	snwJ1BbY/pRt46LCoPu2/79eePNNsHRpnP/4sCIhZN4ob97Pylw7wk1SBjMqX7ZhOXHWP15tpCj
	x1j6QCdlfq+56XXCqbL0VUSNzfrY4/94Hw8xHt+lVHT3gZOBPp9DAyEuouTFBMA5D+NMHsLRWP7
	L8pPuF7H9fC8bxay00a4s7hsEGUEg0DNgyZ
X-Received: by 2002:a05:6122:3486:b0:5c8:36a6:ddd0 with SMTP id 71dfb90a1353d-5c9b58e98c0mr4240700e0c.6.1789976877558;
        Mon, 21 Sep 2026 00:47:57 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9d404d192sm2232852e0c.9.2026.09.21.00.47.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:47:57 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7aa0603e450so54519137.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 00:47:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2TTz48ssPYf6y4SRiX39wOvFMSlUEocRHYc9z0jflcaNsVc6x6apcQHvX7of+1vjSn81arX9mYAiJcg==@vger.kernel.org
X-Received: by 2002:a05:6102:83d5:b0:7aa:17ba:3dfa with SMTP id
 ada2fe7eead31-7aa17ba42bbmr32910137.31.1789976483444; Mon, 21 Sep 2026
 00:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
X-Gm-Features: AcwNN1UjZbDPnIaj-fYRvcBoX7YE3K7C7k2z9bWrLFQVkND6DSGXX-e-oumCCsA
Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
Subject: Re: [PATCH DNI v2 00/11] media: rcar-fcp, vsp1: Enable on R-Car X5H
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

On Fri, 18 Sept 2026 at 19:07, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3" branch [0]. A
> branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
> VSPI:
> 145 tests: 138 passed, 0 failed, 7 skipped
> VSPB:
> 115 tests: 104 passed, 0 failed, 11 skipped
> VSPD (a):
> 114 tests: 99 passed, 0 failed, 15 skipped
>
> VSPD (b) hangs on the tests, so that needs some investigation.
>
> The first couple patches add clocks that are used by the FCP and VSP,
> but as the upstream X5H CPG driver is barebones at the moment and we
> don't yet ensure that the parents are enabled, these are marked as DNI
> for the moment.

The DTS patches use DNI definitions of clocks, so they should be DNI, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
