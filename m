Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490686;
	b=WqEbxorQnRZ8hqW2/k9iht6CO9t4LPj6QbqksVRaLtdhpoRhr/j2ZNlR4mMnInx96DQG
	 90IdWmBtAuII+JaVlsDL6wieprsYH69Y/5OZqLFl3XrRzinGWrGCDLy1/VKqYS7E1nwdG
	 PQweLiHJ3I2Xdw8N0aMPfVn0UT6saipqZP7WOZ1b4FaAzc90s/Y2XUhBa81hnIWQisKXC
	 8g7dnLUYFPkrHaNe9Y4oZoXQ+QJlZpwuAvoXLI233QPaFOMTfDGmvUQOuZ//BtBY+e6OC
	 FTIadXeKhbG4ieRdOLSCP4g32L4Mzy4HEiI0K1R7GwUkWgis16yIiJ+2448Xit2JZIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490686;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
	b=N9m7/fcameGk3B40NWielOS01ASM0F/ALB04jE336Lj+wiMEmweK7vdRcRR0c0RqdW1D
	 x7Ez0azTlSfdYnzrvGG9ivh1f5U4dFYQpiqqIW3PxbLtvJYVrk8zDCPYlwEX4W6YvpsT9
	 v7YSjLeXlcjs+xJyof+7cEPJLCa9rs1c1jnI6Ot3YtTz2PV4sM2LsLz6SbT8BIvRuFjwp
	 /7h0eENnli+V9qz+OQYgo5qdAqnc4MF3kLhcZbqhAQ6Zvs6NMQmR6u7tC9D++YF2HyvAk
	 B52aSpl9pd//uiL/E4yJ1PwawQKdGw24JUfeRUgXKmHtRbWCjOk7gHBaaKkFnWlpyWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728C606A880
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 13:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D728C606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50604721c8so397151466b.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 05:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490684; x=1795095484;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
        b=bwbWG8u24Yto92iv+PQ6zAcEcLieVF+2vsSqBxMVZrozAKnQyF+VG4exgvIyXCmTfZ
         npW31QF3qpXvhXeEirJrJdMJrguObpv9oOOr8txfwDCfp415f0WYHU04UwhiSH2rlMaY
         QbFm1zQrHg7ibkgXsL4IlPdc5GkMT2KzGn1HR/GzqGQ2T8oPXIhSTwCre3YRWMH7vfm1
         rxTI/Bqx1VWWJT5E2NgQ22AJ52Hb8VLjLMfvvoQ/c5vOGlzIVzpeuLRuihMdap99mnwU
         65Dejj1LB1XM3yiqnXnvk3KnVRF215FJUfhVDGILl9i2JHXeV1uUy30cykZu59azqGNJ
         fI6w==
X-Forwarded-Encrypted: i=1; AL+hErGrevJdvZEfgaTxKo294bKz2mn63pjcJDzGKP1bqmtA7wDTyY2rgBEftvRdz36eZ7u7X/4QMfnPlz0isw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q6lA3XJI0NaiujqverZUSRgRTw4hli7rBUZ3qzq2maM1n7dxk
	JDRzmcy1Rwi1w+EZgcDgR7Rp9iLLxTl8b0YByFupZAp++IaRe3cjjlXu1dQmTSGxMUI=
X-Gm-Gg: AYBFou2j+mun/X5OcxoChMPqCHNsefqU5/cHcVEimSwVXzx6Rrt8PFPvmXBtkfCtxW2
	LOIJR+CvsedshS5ynv9oRvEaQ8HrkEusy0aPyc6hRQswegcFH7lFqAGlmUiboqZ326cPsws9wTJ
	T3nh+ICGV79GXKcugb/jMVOoQCblF2Mf62F7Cemrk1kTovZ+DssfJDRSdUvszI+COb4sNkeyXCU
	dTtuwH6RwuJZqgP1dPuTTGghqTNVwxc/8bZ7cxk3s4iRSundqxGw+flRvc8X7q1/92tD9B/ctYh
	b2FKNTSTGEhMX3UZdYlOYelcl1KYfzuhCMRAHqUyTQxGGpmLxg1c7tRhLZ81jNwd0iPFP7ROPCm
	YZ0o9m/CjAJevQemSvkGC24XnGLDfGpguQZK8TQb59OSrBi5Pm/mlzc0oos2jxd0sj48s2hylP1
	hNjDbD/IS4yv2lPZMCZl9qcCSgazeLR393oBQoVkfiKXwNdRF91XSKpSmWuOeF8unuV3OWTmMi4
	v5JCNO4H6Jbv9yuuqPIIVjyKBwLsyHP0wL5CdjU8FSL7nUN6YKbqA7JfcqpORm2p4/UyV9jFTvA
	SVLAGtDA85lFqTYaJF2HcOIh431t6gf4weh0L22iCMzfFcUjACmcC3SezpRmmZEfmyA=
X-Received: by 2002:a17:907:c13:b0:c4d:4be1:4197 with SMTP id a640c23a62f3a-c5066c986f8mr486758766b.41.1794490684133;
        Thu, 12 Nov 2026 05:38:04 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6335d1sm342388566b.59.2026.11.12.05.38.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:38:02 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so6064545a12.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 05:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErESJqr6MvpxDBqPWgVu33F1a0FoDZrY6F6/qOz9MSnE1uc9HBrg5PzJaONDaPT0SyGORLajgNods4NH9w==@vger.kernel.org
X-Received: by 2002:a05:6402:1bc1:b0:6b4:5a9c:4e44 with SMTP id
 4fb4d7f45d1cf-6b77770644dmr2967919a12.37.1794490681628; Thu, 12 Nov 2026
 05:38:01 -0800 (PST)
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
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 14:37:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
X-Gm-Features: AclHuK8Bvm66uPuRAPPxi-MPPvPl-KdDJtyohfMgnqBqTlOChWJE1Vd3ab7DaZs
Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] media: rcar-fcp, vsp1: Enable on R-Car X5H
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Phong Hoang <phong.hoang.wz@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased" branch [0].
> A branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
>
> Full summary:
> /dev/media0 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media1 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media10 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media11 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media12 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media13 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media14 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media15 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media16 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media17 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media18 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media2 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media3 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media4 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media5 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media6 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media7 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media8 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media9 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
>
> The last patch checks the device revision and prints it, which is useful
> for debugging but is unnecessary processing for driver operation so it
> is marked as DNI as well.
>
> In v3, most of the patches have become DNI because they depend on wip
> cpg and mdlc driver work. The non-DNI patches are targets for immediate
> upstreaming though.
>
> In v4, thanks to Geert's new rebased branch, all the clocks and power
> domains that were in DNI limbo have now graduated from DNI status.
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased
> [1] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.4-rc1/x5h/vsp/fcp
> [2] https://git.ideasonboard.com/renesas/vsp-tests/src/branch/epaul/fix
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> Changes in v4:
> - Change the clocks in the dt nodes to use SGD1 instead of SGD4. (see
>   patch 1 for details)
> - Removed "clk: renesas: r8a78000: Add clock for FCPV and VSP for SCP FW SDKv4.36"

And it still works without providing these clocks because the fcpv
and vsp2 drivers do not manage clocks, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
