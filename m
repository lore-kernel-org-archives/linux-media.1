Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934405;
	b=4y6uAg5NBYHuHYVQRfikPuLKJIe9JEJtDtnztp+w/q47xBk5wkPFWnT0nq+GK1FlyI1x
	 sSHvnxyLUmwOOhuZ78LsJieruz/77NanDTQfKT9qqHJawgwAmJv6jiVk+Dg4kXOGKndfR
	 fkwXpDxfI3tyQYKYa/ZZK9Rpc1hHP6lMD06hlJvDWcVJV+3Eh5HD+ZWTRCFPpY8tdsPUr
	 9kob8iZbxrjh76LyMPIp6LuHwRu8WfU3Hti2SsJ+kYNyyCnwU6VGn1CtWKxW5K0PKsUdX
	 YvOlLitC6uVtQiBgGciAOm0LoMNwoZnMErZuhuPlxr3swF0LCvkyVw5P5VoAIdVf+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934405;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=InNgl3TtcjJHMVvDRtFJfM97UJ6hHy2nObXAWQhTsAw=;
	b=4rvIm82foBsN48SbDmUrAyTrkfv4h629dGgwfLabI9OhUmsdrjbXeLiIAkR6KU4DN2bC
	 2GcycGJSvXQqLdErDpwNLjeV5Eg6osU8C9znihBD3pyJwGpIcJ+ZQ3rKQuadHoWjj5y+g
	 mvFMSuy6EFJN39k9TQ7C3u0D0T2PHe5MQpXF3vLgPwDaz05RvkT9ViJdqVjESFI96tQEk
	 KzJIeT/X1qKEmVjHWGReGWoXa27E3vTPo674dVddHrJGnn6A/TckK2HRQMKY6X7to4Nn9
	 uw96USpNxPRdwjTwxTYpdqtJH8rVRtDpcQ/WWPQCZIEA8+RroQYmVmHYQ4hC2/PkAAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1EB606A333
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 03:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1EB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be416e603cso142878e87.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 19:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934403; x=1794539203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InNgl3TtcjJHMVvDRtFJfM97UJ6hHy2nObXAWQhTsAw=;
        b=17Zlz94Crz7kQ2fLAgbxePeYB3bzUWDBMeNe7Jq8c5yCsQ9X8jsr8+Oq/gAWcGqtWq
         Z5uV9KG7h21xu1Kkrfhl+loN5kjHhePtj/5ii0G77gz+VT42WUD/lYKymxSBLendE1Mm
         RXUgLpNZmy0/U7FdvaDEWmCcsJIf/6CO823eowDmdoBfNgUJYcRtH41TuAui5Qwb/cJJ
         fB2BJSUqiCyztYSBFzDr/eKwlxqz0w0icU+knH5pSdIjAo9LLDopDSYHsyKMu3uSilDM
         fZQExbu9k0g1bSjWFmaIiFaDl9Fo1jG3m9l4QOqRVqUnGC+fxFGPaprhWVNKb+cXGurF
         Nbxg==
X-Forwarded-Encrypted: i=1; AKwUvBwlK5+Atmv+lBVfwGTFoHSiY7klZH2Vch5ELQ5mrVJwprsU6fspSu5YwTd+MmOuCQB5Dm7Bd800DKfCXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8S5PMs5bVBYGncUrdhB8RRabmGKGtreHI8B3PMf0pzY8iyXlwY
	Fu9V9Z3IJDSp26lhKJUZQRQRwDY5SH/ZDrDYJB6Fiynia4TkFlFADkmovHOyRrGDJRbqFA==
X-Gm-Gg: AYBFou3pvsVTscgU7lZ2B0K4vOUh2sh/pAjSzSPsO6NX9PpQwXP4gcWWjFuLUK6pZXO
	qgJC1ciIMjvChhfSU3aC9EzcOAkXheeqkSPBFl98hUWGaDJbUAoKkkzWRu0luJ/R79Ac44oZH8T
	ge9RFp5KCwEWvp2Gtz60T00F16j2xaWH2kEA/w/dBR/5MnkRTeRFCLWHLvunFteMdpdKJrkvm+N
	BvZEj/GDLi8LGbbtAQ6hi3muZhgosSKFojijelfj/noT1PdO+rb7TAHdczfs2KC57NH/2CVVTWA
	76qxCax2wyJ9hOHWJ8xwLz/VzLLury625bRq1rc9VrQRAbMrLjF3e7ppAojE29CZt3vfQpG9LQH
	STjesekx+a4+X8q1nGI/lS09zOJOG8GimV/rPz8jtigZe+U2vVakSyEFR7811SOAj2DbUCt+0RR
	GhfI4rve4lbvx2ee1PX2vIs+RphkL9obkB/ZZUkNS8YqcOEHQXGZhlryk3+jmf5zUCMWbz7blj1
	hngHX/F8y+8Vnrhfxt8RdmZ7W+nR0ptssmpwf5q2JNn9jAvP4PNUEyHSOADL5+1O5dKKVZPAEal
	8dEfiNvO4x3uP9Z5wCZNfaY5OYWnTpgscRzQmfZ9gS1R7iC6z26DlMs9d7kgJFvAZFI=
X-Received: by 2002:a05:6512:224a:b0:5be:4386:8072 with SMTP id 2adb3069b0e04-5c003ad0e52mr291548e87.56.1793934403130;
        Thu, 05 Nov 2026 19:06:43 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c002ed4934sm147956e87.7.2026.11.05.19.06.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 19:06:42 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso216165e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 19:06:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzE7hy3EHJIyiXkXOEmu8HJxhOPqHuR72Xg1RpxjqcCZU3FidQ4JkIWt4ptPTh0UakubNnKzl67fb12tg==@vger.kernel.org
X-Received: by 2002:ac2:5692:0:b0:5bf:cabe:23dd with SMTP id
 2adb3069b0e04-5c003a87d1amr290258e87.27.1793934401749; Thu, 05 Nov 2026
 19:06:41 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org> <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
In-Reply-To: <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Fri, 6 Nov 2026 00:06:14 -0300
X-Gmail-Original-Message-ID: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
X-Gm-Features: AclHuK-k_LlKDqZXI1tBCGgD-G1XeUrAUABAuETiZnNnNKc4iM6mV-xfAtboOL8
Message-ID: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150 CAMSS
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, mail@andrewgigena.dev, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir, Bryan,

Thank you both for the review and for taking the time to explain the
direction.

Vladimir: I understand your point about the stand-alone CSI2 PHY model,
and I agree that is where CAMSS should go. I hope this series does not
give the impression of entrenching the legacy description; that is not
my intention. My concern is that I don't think I can do the PHY-API
conversion properly within this series: as far as I can see,
qcom-mipi-csi2 currently only carries the x1e80100/glymur
configuration and no upstream DTS uses the PHY-API path yet to take as
a reference point.
Converting SM8150 would also affect the other CAMSS SoCs that
still use the legacy description, so it looks like a separate and
larger piece of work.

If I'm missing something, or if there is an existing branch or series I
should base that work on, I would be grateful for a pointer. I would
also be glad to help with the conversion as a follow-up if that is the
preferred path.

Bryan: as the CAMSS maintainer, could you let me know what you would
like me to do for this series? I am happy to keep the legacy CSIPHY
description for now and follow up with the PHY-API conversion, or to
fold it into this series if you think that is the right thing. I will
follow your guidance.

This is my first submission, so I appreciate the patience.

In the meantime, I will send v2 with the review fixes so the series
does not stall.

Thanks,
Andrew

El jue, 5 nov 2026 a la(s) 6:47=E2=80=AFa.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 23:16, Vladimir Zapolskiy wrote:
> >> +maintainers:
> >> +  - Andrew Gigena <mail@andrewgigena.dev>
> >> +
> >> +description: |
> >> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms=
.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: qcom,sm8150-camss
> >> +
> >> +  clocks:
> >> +    minItems: 42
> >> +    maxItems: 42
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: camnoc_axi
> >> +      - const: camnoc_axi_src
> >> +      - const: cpas_ahb
> >> +      - const: cphy_rx_src
> >> +      - const: csiphy0
> >> +      - const: csiphy0_timer
> >> +      - const: csiphy0_timer_src
> >> +      - const: csiphy1
> >> +      - const: csiphy1_timer
> >> +      - const: csiphy1_timer_src
> >> +      - const: csiphy2
> >> +      - const: csiphy2_timer
> >> +      - const: csiphy2_timer_src
> >> +      - const: csiphy3
> >> +      - const: csiphy3_timer
> >> +      - const: csiphy3_timer_src
> >
> > Please switch to the new model of describing and exploiting
> > the stand-alone CSI2 PHY devices.
> >
> > Any CAMSS drivers based on the legacy description of CSIPHYs
> > should not be accepted into the upstream.
>
> I mean we are just adding a new define for a SoC here - not a new init
> sequence.
>
> We could move all of sc8280xp, sm8150 and sm8250 to a new driver
> topology but, I don't think that's a reasonable ask for a small change
> like this from a new contributor.
>
> Certainly would welcome the transition given above as a defined and neat
> series but, I don't think there's a need for that to include this SoC in
> 100% existing infrastructure.
>
> ---
> bod
>
