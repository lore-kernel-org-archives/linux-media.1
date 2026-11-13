Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601327;
	b=lKBD4nQPgu+DNCHrF6CVlpTrh9D6XoG596AAcPdcmOGKywqf7CRvDQZOSiCDsHj7+hdy
	 jykLTrd+rdtbetp0i5NnT01hbZDhGcZs9t3RxFvrauEYlQ26D7v7pE/0as7jVDBEKccG0
	 SB/r+EMibczuXHU3nLI2Hhuw1yIpk5REYgSjATkZ6k6W2feLuxoaiF8JdWgNOg/SthCfl
	 0Azjva6ko8yZztpH+dFak6xOoqftdyZ5Hdweh4IrTdDByRF1Snvf20WeBiqjhUfuIxHcL
	 f+LQe8PFKs41QBaIyPckrQAAUZRSdlsasg6H37Qn3hiEd0erZKjfvuvJVbkqND2NmJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
	b=l5DjhLNSu2eqDZJdNqmeHoI2iJjPOHdQguieM8Rm/Fp7dFeqs5RU6KCxtCZ6oPSVOIit
	 wqLGjK88yZBig7NF/Wz+gAYHrPkzMqNciGK03jSwdBLITLTtrzvLZCMR7/c9N2RfCiLOM
	 Hx5FJJ9jJduHs8lAMCeIEZwICFJGfo95bE56uAFUqP340AKN5nG6K/uJCpRFCN1arP4Vp
	 NnacQrJ3HI0WEzBCJMExJvY7UAagFVdPPHL1SU0NdWLe0LhJrIA6mOSHKM2tNeVgwtTMP
	 VXokdsvHKwevw4tjTM6G/e8poA5QUUU48nDQ0Ic4D0O0VnssgUYU0DrZJPuXwSdQRLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eliaN/OP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EF5606A338
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 20:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EF5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eliaN/OP
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so2033341fa.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 12:22:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601325; cv=none;
        d=google.com; s=arc-20260327;
        b=kfx9S5MMY+bn9XIMVvvmrpLL9DIGMCr7naesuN9Dnf7HiUt7CbRpmZk3ponvBz/Rk6
         pOptIhVgySP6koobAg/sl0czkgynPR7pbG1t7MutrPWa5P3qAOvYhiaKp9xcz1zBZHzf
         tQLm0GdE2bErHv1UEe9sjvJmO8rCDFaBSiIadwGhiGFycMeI+a1Q3ZzJ33qG3z129w7/
         KBvFkrWFGlixzS4RevSDD7RYiZCZqGSa7BkTb6ehWb1OpLf1ot99vORnofWGvtEvKuy+
         ELf1Hszve1oAcJHQKN1DPI7dH4qgQsyUB9UbDnKHquwjMnUzy0Q9JDFduIgarYbMB3is
         iJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        fh=F4j70GqyGC8Mb77/b/VyYjRxc4+upiRuITMOrv3rEjg=;
        b=PbDyJLnCZY+ksEIjyHO03ImTxx9GL2Rj5b/cUh6zHl0J4p8/E/IaWUhe6MSks/S7MU
         7QSk584kmfvahtGFJubrLqHKE65/GCGYdn1lbOMT9IHth4ztI0k4lVZtHJf4YxKyxc0s
         qF2IsuXYlwD6bcOHIn9MuTNhjp0mIk7tTNIun+PgxzQE9/2ZcQT+R/YKK46LYocJOD7z
         WXzZV2N4BWDuO3RFYwxqYYxT48GwdemBWTBfT27WgoccYliw8DUXVppu7m9yLmhspken
         7pU0Crdgvn7tuSpON4u/dH+aLCd+K8JcYq8974GPhcA4IOMRygl7KKRJT52OhhJGLNR5
         06+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601325; x=1795206125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        b=eliaN/OPLV5MQHHag51KNNYs9r1vwyaqcfJdkPEf/RxGAIxD8jHs7xlRZ8nZvj2xWc
         X+oTBEK8j+nPB2xjkjIpsQ7e0ql3O3uCheaVkZPsuT4Qzr72cKyMRk4ekxeEakNcVIvP
         56DIHjQtA9jeGJWIsKAS3TnLjuqKom/OdQMD7XwpY9FyxmdSx2XmODmyJuy3cb7/Ya6L
         dbVdWc+5/H8udaY3R3ewLTMY8GnySiNfHfJbMNidIhZc02OSafSuUgEkBEX6Cq+i3uzP
         3wacvfEu4+WIm11XYq/xPB2//IpU5VJJCpJTwyik5YREF01ZKwV9uFMwMbtJgb7HtEXK
         padg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601325; x=1795206125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        b=ORySBH02i53GWZKWSpfy04SgTortgdi2vVPnUhG6jBX9GlAU1ZtimlplCH7iP6f+wj
         Ic5KQgSVJn1S5WVSP6+Qk0Ot3R1rn+F1FxFwow76Hs1YJcsa1cJW56Uc9+GNWDzmE5bn
         ZAeyfy0GEAMwsJkjSlYKLa30gQnOmEg7yUaj/7GbM1rAOK1KAHgozMWAjslweas8Ac4g
         QaSbHEMT44l400m3e01m3luP0rAD0dUSp/zmFHPXRKl/oHPu6EwfshL1kM7LIBUFlXWk
         UHYjxe3L5B2F7KwpDfrrJZM7Y0G2oSiIjbaW/YVcny9S0ncOpKEhP8qrlBRR6ZmKtOOj
         FM1w==
X-Forwarded-Encrypted: i=1; AL+hErEP1SJCubmLkLEol3z/6XrQvw3FlEH0PfFjmATIe9TSRiz7rzYA30fAOyIPmXZ2oSHW1ocS96LT38NhrA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kYe9I5sXRi/EXoDfcN8wApk5RcY/4jlOlmM32UJPNBpsxtE7Z
	TTP21T4XZGOLatSndiVxqAt+fVAT2KALAN/KDcuUmVJqV+Xzn8GgH8gH/VSpAi1zyZoxIxGRQHY
	aet9dQgvM1M0l2mGO12gOprXELVgsbFY=
X-Gm-Gg: AYBFou28xrSt8S4pGNOCwkxTCdvbN/vjwF7+CTXVUyo/7GPMDMYKV2fmXufRXWHcscc
	gC42pFUfNlqqDJUKBuGfFbLmo/o3VBiPRO/OWk8PIl7esRR4aMcKBcXHgP1vlspdhiMaqe50F3F
	AhYm1qp3uAtoEu3bgGECbmBMvRKEFbazSnhaqQQZXetQo6QJcrOfYliRUcpUwXh2Ey+Llv2EW2n
	clrGZtYW06SI5jkhQS19JNcj3EjV5ljROw09b8nmvskmPyZ3ASKFfJZ9kovNnPaRhxEJns7+w6U
	oWLGcvopOo18MNviyAouul17ACpPCj9LvOl6y74VPTPin6TWYFK05RkOJwDgUat1XwnJWqTsfXx
	uv9t6cKEiDlAn+sR6hexvZIO9xS3WhGjVOQAquREq49nq4ISnb6X7RVsqSgZeSikKzlzpsCPCzD
	ePCnytQUGQ7MldkDei
X-Received: by 2002:a05:6512:1322:b0:5c1:57b9:90b2 with SMTP id
 2adb3069b0e04-5c170746a13mr1720283e87.1.1794601324638; Fri, 13 Nov 2026
 12:22:04 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com> <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com> <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
 <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
In-Reply-To: <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:21:52 -0800
X-Gm-Features: AclHuK_r_rPrVJRj0pkug0EuQb97pNCsN4qnHk9bddNHOrBile8NMgFa-B299mE
Message-ID: <CAEy9hNXNaAdcL4NMmNf7sETknV+jQBp-inqFd-qAPut041GjJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Would that more correctly describe the hardware though?

Yes. The IOMMU is inside the AV1 block and the TRM has no reset for it,
only these four. v3 adds them to the vsi-iommu binding and node.

> So this likely would require exclusive reset controls with
> acquire/release.

v3 does that: both drivers get them as released exclusive controls.
vsi-iommu acquires them to deassert on probe, hantro for its probe
deassert and for the timeout pulse of the encoder cores. Remove still
leaves them deasserted.

v3: https://lore.kernel.org/r/20261113-hantro-robust-v3-0-82383c722ad2@gmail.com

Arun
