Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239F4486B95
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828547; cv=none; b=Rw/qxqce+PYg9Uiy69y8K9V5uwK5UDGNEysjOWoDkvaC3vug/76u4KKYxbupH4Q6Id7lkAzVvxD59BPAsmqWY/CVnd+gLOw9RoOE1FxpgNnEMFp0VfXJLtiwicDJ9HaNOf/+P9smZ+hI5a+Os1ArJVc0RQJKAPieyuTzrACa4b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828547; c=relaxed/simple;
	bh=x3GgjJezyxDhwMo0E0jc/GbjGqpZc1ErOHoiB9f78jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlAwIJBUbTUnqlhywO0dgoJ74DYa+Ub2gZ17joDIFF95Zx/MdR7En1bSXd+L1YKy+zyxHsGj9PnWQa+JmX6TO8hV72LdyajnWbNeJ/18WORTzz5ovqFHqIMuySf68EjNEJkN7IWKKTLlhMDSG3Z5U8ur5hi7zOBE5OjPg6fDfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdqzq8aL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdqzq8aL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F97B1F00A3A
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784828545;
	bh=07uegK3I4MlPqYMvRtRYTb9gbGlLPScNbHHawzZqfdw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cdqzq8aLhCwM/FrM+hu/Vgh923HTHuHaF2MHX46/UC6VDMmOBTY3veZRPJmKACMhv
	 TvK7vnvY48ypGKuGjSyB3Z2nPMP+fRfIh9dfi768jAjQ9mdL89GT3wVhDk0fjb70h/
	 vPPPWXy/wOhQ38gPU9pW7rleUnLspOxQDuistu3w6v5lohhROIw8fCRK2brsOw7KJ8
	 75jDf1oDDHRTPrtkEroro9M5axZrKdUsEJ0C0Imm8K9+pQKo3KDFpO/fhLOuav2nQO
	 pBecBQ5656OGYAd3hSe6tpBjfNTV/yxHUFbZZ+YXfRQ/XKziZnZ3ZtDvKIV79JI/hh
	 co4FMdgKkWwoQ==
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-497deab2d66so537852b6e.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:42:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqlkmT6IctdhIcmDRhf21ncxe/yceZiP6q4xXz2ysB/jKkVa4gIwNScXXYqSUZcwMAcHPT6mcSpiyP2yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhiuSejLpb2UV6xXNt0zxAzdVV7t8Sqv6K7lxHztuCOIi+sSK
	XjakJSE+tQiaei/AoGxd5OfxovF7+0gegJBMK3CWOKnuXuka0tpwzCx6wR6iaTM43PQNC6KcK1n
	T/gFDkM6STuynNa09sJDCHTvsdWdgVgo=
X-Received: by 2002:a05:6808:3190:b0:495:ca1b:7865 with SMTP id
 5614622812f47-4ab3842194fmr1564489b6e.11.1784828539225; Thu, 23 Jul 2026
 10:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722233604.3001063-1-utilityemal77@gmail.com> <20260722233604.3001063-5-utilityemal77@gmail.com>
In-Reply-To: <20260722233604.3001063-5-utilityemal77@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 24 Jul 2026 01:42:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v65zjkXyyrK5U62QsWEWSgG+9zuEKAi-Ekxd5OehBVXTWg@mail.gmail.com>
X-Gm-Features: AUfX_my2HTBZkhl39VV1Ephb61n1qX3oao7Ket2MbKBRA-ze570sxZ63vDegmvs
Message-ID: <CAGb2v65zjkXyyrK5U62QsWEWSgG+9zuEKAi-Ekxd5OehBVXTWg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: allwinner: a523: enable IR on the
 Avaota A1
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 7:36=E2=80=AFAM Justin Suess <utilityemal77@gmail.c=
om> wrote:
>
> From: Andre Przywara <andre.przywara@arm.com>
>
> The Avaota A1 board has an IR receiver chip on the PCB (next to the
> Ethernet jacks), wired to the PI8 pin on the SoC.
>
> Add the pin description to the PIO DT node, and enable the CIR receiver
> in the main power domain.
>
> Tested on the board with evtest and some random TV remote control.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

You need to add your own Signed-off-by, since you are resending other
people's work.

ChenYu


> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index c2de662140ce..219fd76a4710 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
>                                 bias-disable;
>                         };
>
> +                       /omit-if-no-ref/
> +                       ir_rx_pin: ir-rx-pin {
> +                               pins =3D "PI8";
> +                               allwinner,pinmux =3D <3>;
> +                               function =3D "cir_rx";
> +                       };
> +

This hunk should be in the .dtsi patch. And there are two pin mux
possibilities for ir-rx. Please name it accordingly, like "ir-rx-pi-pin".

ChenYu

>                         /omit-if-no-ref/
>                         ledc_ph_pin: ledc-ph-pin {
>                                 pins =3D "PH19";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 474354fbfcec..994f1e4f0ce7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -100,6 +100,12 @@ &gpu {
>         status =3D "okay";
>  };
>
> +&ir {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ir_rx_pin>;
> +       status =3D "okay";
> +};
> +
>  &ledc {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&ledc_ph_pin>;
> --
> 2.54.0
>
