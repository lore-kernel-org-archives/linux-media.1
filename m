Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932925;
	b=MIK5DdZ3tLcx8BOSKojBMAdPETRcVrvx/pstG4Gi5rhoxzUXgjQD6wkbX9Yud6JqezmA
	 tM1y4gVQbqqs0/JF3M2ylPIlorsnezREKY/ZGQbyrGzh7IJodrdmahnMYJIwBJV8Yk/mG
	 yftFwAyTRCUnx2X918Qd/0nXAoQZQzUPT3Uw0vNIfdzY/wOULa3AJW0ZYBPFandFZ7tM8
	 nRS/WQj+sBFbJL144pdwfGs6DZOWr4um3fAPcr9vIzFKf092QBhXuUeExp77/RidoJjrJ
	 Yq+n320dWM1pOFD9rCuJ9W5VNtLDGYH6UKr4CC/offw8IVGJObz/3LiGCfwFEiHmdEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932925;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6852XYg4nQB/at/PLi5oS751NBudRh/wjJbfpaCbjiE=;
	b=SYYMc+j6h/UTQuFctCYGnN0ZScu9jWhYaXU5anRUK5H0+doHGC3+4TAn0Tyuu9Ap/7Hj
	 Yw5slC6xFqpkmndwFeftEsKFbk25vPvC6yQx7gtcbKc+UPIEgHyHjXgHyZ7Yprp8dcqJB
	 ZBRLLbPR6WkG8LSPLCuDZNeHBOs9P/SOwrL6XiokZujxXfHJ9ThUGFkntbKSwWUN35IRF
	 3iBqlAemaj7vx0O5aCEHx87uf3wYwD2Lno31LGWn8+KbRQbYX9hDgz6ogueT3eL7c7KNF
	 8tOAyV/1CX7Wa5c5c9T92fOvp0kQKh0a43v7Sa+kskM6eo/lXc4+fYGBcYiYX5Hdr6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793B606A328
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 02:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7793B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso786661fa.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 18:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932924; x=1794537724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6852XYg4nQB/at/PLi5oS751NBudRh/wjJbfpaCbjiE=;
        b=oFZjayfAWZgnlJ/yXeMoxKqk8VyGh2d98DS3AzzG+646wdyJzl0jZ5jTcJZI43A2rR
         w7PNfCcxofg53AGn1Fm9F4XpkrZteJm4NKHlub1Bs7p0zFDrvpzdBWOCd0s84AadIpC5
         6hf9PX35tIQtC6K6YQIdriKouLnv39n05fqzagRTIS/AZaX3ekPSa1B+qhs+2je7OnI9
         5awWjD8QY30uqx9WfFIKI7LBeNdECBRbn5Mgo/nQxp4vV3gb3ntVSpECbnjTC+cqAyIk
         JXj2X93tFyGnlyemrl9Po7Yv8GYJ2nv7hdQap+3E8azrP66mN+MVorlyG4yQgmmih3CA
         vLUg==
X-Forwarded-Encrypted: i=1; AKwUvBxRP8jag1nIndzHakZR2gUqWfM8IfuF2JYUzoNvkhNyuVEET3Mn2WmcTNw50n7w6WII40qJ11Xs6IhX7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/T4SnPpV+1yVcLE4r8yH1MGI5sdWLumlpF8vsJw4N6wdaLtj53
	xwKbKAzgWUo+8+cmMX/kr0FwZ5JBaUBNPh7AKF/g0fFJyo+seQkMkqaQHVH/Xqcxr/DIFQ==
X-Gm-Gg: AYBFou0YCcKsvM3/MNma1BQOs/oCHyfE6PQ6Kolhd+eAJufQGtFkQYu/gkfHslgjyx4
	yJZjqvxbqhhHx+d6aKLxfb7Jnoh01XdlqH3jDm8WObz7l+4JMwuXKQSVhr85DILbMF0NWyg4TbO
	6Xh48/Zt/xtW83C+uapvKIYxIo07+htmfwyFkIKKTRfEa71+Sc56KvZhqn2XntP2x5bMLO4nLDz
	AswlwZQVgFOHC4LEI9F5zchyEutehfR+PSLKG4K37Xo0KCE2aSy7jdWEsdj/b3zVVCa01r95pVk
	8xyo53f7W0cbYPb2ursS3ncy/jF+BorilqUHFTmohyZDmuKvcO1FuAHBDZFFwfXz9LCTAVrKX5L
	FUNlWSIQ5zXnNxCDUaZOkAC8IjBKNuyIKVf0hicH1BUX59RqfAsXAzp8TnrKF4iRpIaLAdLabhX
	HpWYbQ4sX2I3MGOX14Xl83NAqJp3bGv2ZRNvYzaPRltz7IqHdxbOZwgjTnh0Evq8FcMrjV7Cw/R
	COCy+9ckihrWAtjMr8NMktYvyKQFool5c/i8J0C57ls7KvrqWuUam+5s1U5Qq+o+Ah5ywyRTDVz
	syOVMUeMODpz0noJ+7WmBCG3gYvivxFVoHgI0aWMEZzYF0Ivsd/qwo1T25ajN46EDG5bGPc=
X-Received: by 2002:a05:6512:a96:b0:5bc:cc46:1849 with SMTP id 2adb3069b0e04-5c003c3cba1mr251558e87.54.1793932923399;
        Thu, 05 Nov 2026 18:42:03 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00306f944sm141354e87.49.2026.11.05.18.42.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:42:02 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ace2e3a2acso959551fa.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 18:42:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz6OPv5yfC6MgI8yjTfkLkPTOgewlG/ecX8pthBE3PWtUYJ6OKsLpanE/0M7daU7iEbiQDxVFyOQ/NvjA==@vger.kernel.org
X-Received: by 2002:a2e:a80b:0:b0:3a9:db75:823b with SMTP id
 38308e7fff4ca-3acf3b2b509mr2161401fa.17.1793932922440; Thu, 05 Nov 2026
 18:42:02 -0800 (PST)
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
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev> <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
In-Reply-To: <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 23:41:35 -0300
X-Gmail-Original-Message-ID: <CANn8Umedp8s=rupOkSdi5NBxOE8AUnWSvfyeQsMSohZG+Hce8A@mail.gmail.com>
X-Gm-Features: AclHuK9yR1l3Ka6EneLFe1X-dNaa_gcGDfVBlZZtGQ6nC7Dgsgyzy5WyWv0PGgw
Message-ID: <CANn8Umedp8s=rupOkSdi5NBxOE8AUnWSvfyeQsMSohZG+Hce8A@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for checking the 1.1 sequence and confirming that the upstream
one is fine. I've fixed the ordering of CAMSS_8150 in the switch
statements for v2

Regarding Sashiko's note about the VFE-lite clocks: I confirmed it on
hardware. Routing the IMX363 through CSIPHY3 and CSID-lite1 to
VFE-lite1, the stream produces no frames and the clock stays at
19.2 MHz without the extra match. With the match, the same path
streams 10 frames and cam_cc_ife_lite_1_clk goes to 320 MHz. The normal
VFE0 path is unaffected.

I fixed it by making the driver also match the vfe_lite0/vfe_lite1
clock names. Since the same problem affects sc7280 and sc8280xp, should
I create a new patchset exclusively for this fix or include it on v2?

I can send the small media-ctl/v4l2-ctl script I used if it is useful.

Thanks,
Andrew

El jue, 5 nov 2026 a la(s) 6:44=E2=80=AFa.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> > The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> > VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> > layout. Add CAMSS_8150 to the version enum and to the shared code
> > paths, then add the per-block clock, regulator, power domain,
> > interrupt and interconnect resources.
>
> That's odd. sm8150 and sm8250 are proximate both seven nanometers
> sc8280xp is five nanometers.
>
> PHYs are about converting the analog to the digital domain and so
> process geometery - ends up making a difference.
>
> You can get the PHY init sequences here:
>
> drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_core.c
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_soc.c
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_dev.h
> =E2=94=94=E2=94=80=E2=94=80 include/
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_0_hwreg.h    sdm845
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_1_hwreg.h    sm8150
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_2_hwreg.h    sm7150
>      =E2=94=94=E2=94=80=E2=94=80 cam_csiphy_1_2_1_hwreg.h  kona/sm8250
>
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kerne=
l/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiph=
y/include/cam_csiphy_1_1_hwreg.h?ref_type=3Dtags
>
> So yeah going by the name that's CSIPHY 1_1 same for sc8280xp and sm8150.
>
> Hmm so much for my understanding of how dependant on process node these
> sequences really are.. perhaps the PHYs area fully synthesizable in RTL,
> probably.
>
> Anyway.
>
> The one thing to do here is to please _verify_ what's upstream now
> against the tag provided there.
>
> If there is a divergence then we need to upstream a 8150 compliant versio=
n.
>
> ...
>
> Actually its fine, did the verification for you, the 1.1 init sequence
> as is upstream is fine.
>
> Just please tidy up the ordering of the 8150 switches.
>
> ---
> bod
>
