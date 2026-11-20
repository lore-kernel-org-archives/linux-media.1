Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205977;
	b=TsRbH4FnSfBnP0u6S1Rd7qwBtucpYSXVREMoVP1ACloqVy0wC8/AbbFEhOrGwia5iU8n
	 ZzPiwKgzWv1P4pQCOKHktIQcw2BJXqYo+IuHad0yoF1gUuHW6CQj6k42zDbvrKJkcTcKK
	 TNyyvshGmJ142xBkLzPigiTlh8wCryMdoMVcTS7SJnpZbIbuaKRRrSjO1CCklOdJhW7hK
	 /PJIyT9ld6LofgXibTXm0oW87Ur96mXG/u8wGVOkwkHzErmXyAvGJ5yKzdw6CvTIwMlxy
	 JB3Y9LW3wG32D0YJpA7OWGHBNk8xDm8k8Zn5/pGP2ijMhEEhhWIwvuom7Ua2RoqCITg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205977;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:References:
	 In-Reply-To;
	bh=2kPsIjv/RvpekBzoe/Xg8vqw6hjpXdYepUw3c9M02WQ=;
	b=miyP7YD4nsRP+Hnf+4Q8i6o/WZ+X2kwC/Sp5OyWZQo60SZwqdbS+BCnG0AEId9jHH+8h
	 SxsDPmaAavIRMYu6OQ6rCQhWU0TypxIaNuTFh1xZ7zsHPD9O0qiv1fkSaYZreTv8MvJoo
	 0jIH6yTm91kRjCO2glh05042PryAh3vaGW7y2PCZk3ID7nf3StCeYFcugTR0rVT1M0wZ7
	 OaCqoAxm9x4ir27LSOs3+mNEXjAjVAJWu16YVq/Un1LGvYtScvcKmdLq8Z7IjXod4ATOn
	 OFlMvEMcjCaHMD3V0AX7s551Jm+Hld/EY3y4443ntZGZlukvmzuJTM8fY7cV3jYXH5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b="MTfNmmA/";
	arc=none smtp.remote-ip=95.215.58.197
Received: from mta1.migadu.com (out-197.mta1.migadu.com [95.215.58.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCBE606A6FA
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 20:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCBE606A6FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=MTfNmmA/
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zkzIxeEYCYyeYf0+e7mpu+EI1QXzBX9Ee3zgM17C3no=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795205969; v=1; x=1795810769;
 b=MTfNmmA/V/Vc6+x7lIP4cu0UPVx07lqewsSfDe20EqBqtZG8VQBEplqoGMihF78a9CdB5iKr
 96PU0ONojzIrveoQ1+MJZm75Ng8Hr+eKUY6Pv7xkLIJRoyu5ht2Much1WfW2WbdntDa2+TP/njR
 xm2QWQu4Lxr0ANqQbVksSDyUOow24h6s3vzZBvMtOrbmUH7THKSSRjvwz6xSh4OirxEUzEJhQgv
 bsp5U3FvIoUqptQqmLzJkRuilLFKrxNwBr7uRqHBRTYDcIAQKcO++8hDMIF84AWS17KFNy/IlFW
 WLPCcqOYSynP7Rq5dFpBgzya4trZ9fGoN0VgtBgWhV6og==
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36e14be50d0ddf71;
	Fri, 20 Nov 2026 20:19:28 +0000
X-Mizu-Trace-ID: 36e14be50d0ddf71
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 21:19:24 +0100
Message-Id: <DN0BEIZ5BE77.AML9IJ2SIR9G@cknow-tech.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Shawn Lin" <shawn.lin@rock-chips.com>,
 "Michael Riesch" <michael.riesch@collabora.com>, "David Heidelberg"
 <david@ixit.cz>, "Christian Hewitt" <christianshewitt@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Diederik
 de Haas" <diederik@cknow-tech.com>, "Dang Huynh"
 <dang.huynh@mainlining.org>, "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 1/5] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
From: "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <cover.1795191822.git.daniel@makrotopia.org>
 <70b950c4b4fefbe07fe081f780ff359ed697d37f.1795191822.git.daniel@makrotopia.org>
In-Reply-To: <70b950c4b4fefbe07fe081f780ff359ed697d37f.1795191822.git.daniel@makrotopia.org>

On Fri Nov 20, 2026 at 6:40 PM CET, Daniel Golle wrote:
> From: Christian Hewitt <christianshewitt@gmail.com>
>
> The video decoder in RK356X (vdpu346) is described in the same way as
> the one in RK3588 (vdpu381). A new compatible is added as the decoder
> capabilities are a subset of the vdpu381 capabilities.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz6=
4-A, NanoPi R5S
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v5: no changes
> v4: add Tested-by from Diederik de Haas

I don't think a Tested-by tag is appropriate for a DT binding patch?

>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 4f38a0ef29d84..ea5386e84f17e 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - const: rockchip,rk3288-vdec
>        - const: rockchip,rk3399-vdec
> +      - const: rockchip,rk3568-vdec
>        - const: rockchip,rk3576-vdec
>        - const: rockchip,rk3588-vdec
>        - items:
> @@ -110,6 +111,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - rockchip,rk3568-vdec
>                - rockchip,rk3576-vdec
>                - rockchip,rk3588-vdec
>      then:


