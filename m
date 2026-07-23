Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D838947F
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828500; cv=none; b=i77V06rQncgL4fn4xDiiWzOyLtJn3mWp28RerqHhYqec/AXU0r7MBsqD8INnarEDzkx1l7d6QBlb6fIBpc52MwlefY9OQ585CBqf3ryUMIBePf9A6O9Lyt73oyYvDyk/+9BDSXvEnZd51UiPz5y09LXastQtX4ge0qGmgQoyVtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828500; c=relaxed/simple;
	bh=HYXrlvqtrQdNNzQelGdgyUv5AdeibpkKDdW6V9qsEIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpOEVYH+5yFqtxJjppGncpyk9rmrgVmd9Ajr/2fMjHoaIYLcGUaCkLL+JQVgrVJTbcpk5gTpsxcnxytYblsel4GMZS1vqmGX522byGp/3bG20/TPFzEQD8jKdGzJGMmIgwFf2EGP9CkWUIipsIGwctn3FMd1hY7w/pNBCkhEtR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC141F00A3A
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 17:41:32 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb42a2f5feso446136a34.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoTTTXAYrNk9OaU49M/dn/OF2cyXZi6g3rIxYe2wGkQge4aU67UyQTaEwWXH76vEIx7Z9mjo0/1WnWZbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUR12piH7Zxw6tNAhDkJGR8+pUNSy/bmD3OoQO2miPcaNpSkWB
	umBK3oSDs0hh9ow7NWNNnkGlTiVbJin7hR78w4gvzOpz48W/duGi0KirkBRF1bfeD2hAEx/INZ8
	Nf8qAY7PGJJ7TW6k8bEPEb+3fA+MLq1A=
X-Received: by 2002:a05:6808:180b:b0:496:daf:8709 with SMTP id
 5614622812f47-4ab352fcfd5mr1725016b6e.17.1784828490837; Thu, 23 Jul 2026
 10:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722233604.3001063-1-utilityemal77@gmail.com> <20260722233604.3001063-3-utilityemal77@gmail.com>
In-Reply-To: <20260722233604.3001063-3-utilityemal77@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 24 Jul 2026 01:41:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v666_Kf8+zMukQ1CFydK61P-v-=gPg4Bqmr-QaL45i6Fyg@mail.gmail.com>
X-Gm-Features: AUfX_mxiGIwd1DR_-imghumxMZEIIVSDAtRpqxp4hP74t3UviUvfCAjTiBCIbkk
Message-ID: <CAGb2v666_Kf8+zMukQ1CFydK61P-v-=gPg4Bqmr-QaL45i6Fyg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
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
> The A523 has two CIR receivers, both compatible with the A31 CIR: one
> in the CPUX domain, clocked from the main CCU, and one in the RTC
> power domain, clocked from the R-CCU.
>
> Add nodes for both instances, disabled by default. Since the RX signal
> of each instance can be routed to more than one pin, boards with an IR
> receiver are expected to add the pinctrl properties next to where they
> enable the node. Keep the PL11 pin description in the dtsi, as boards
> commonly use that pin for the RTC domain instance.
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..c2de662140ce 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
>                         #reset-cells =3D <1>;
>                 };
>
> +               ir: ir@2005000 {
> +                       compatible =3D "allwinner,sun55i-a523-ir",
> +                                    "allwinner,sun6i-a31-ir";
> +                       reg =3D <0x02005000 0x400>;
> +                       interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>=
;
> +                       clock-names =3D "apb", "ir";
> +                       resets =3D <&ccu RST_BUS_IR_RX>;
> +                       status =3D "disabled";
> +               };
> +
>                 ledc: led-controller@2008000 {
>                         compatible =3D "allwinner,sun55i-a523-ledc",
>                                      "allwinner,sun50i-a100-ledc";
> @@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
>                                 allwinner,pinmux =3D <2>;
>                                 function =3D "r_i2c0";
>                         };
> +

Please add /omit-if-no-ref/.

> +                       r_ir_rx_pin: r-ir-rx-pin {

There are two pin mux possibilities for r-ir-rx. Please name it accordingly=
,
like "r-ir-rx-pl-pin".

> +                               pins =3D "PL11";
> +                               allwinner,pinmux =3D <2>;
> +                               function =3D "s_cir_rx";
> +                       };
> +               };
> +
> +               r_ir: ir@7040000 {
> +                       compatible =3D "allwinner,sun55i-a523-ir",
> +                                    "allwinner,sun6i-a31-ir";
> +                       reg =3D <0x07040000 0x400>;
> +                       interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_=
R_IR_RX>;
> +                       clock-names =3D "apb", "ir";
> +                       resets =3D <&r_ccu RST_BUS_R_IR_RX>;
> +                       status =3D "disabled";
>                 };
>
>                 pck600: power-controller@7060000 {
> --
> 2.54.0
>
