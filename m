Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C924C06A;
	Sun, 19 Jul 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784451275; cv=none; b=oaEl0USDqs0u0DpGcZfQdIzK6dS2RJ4WLs1sps52W+gY3NDcOFh0G5ykGW9O2eCPiU6FklWfSHjgKpHT9clBcG7xyurQUFOaezu3dGFtgk2pXdG7FN9Y4fesumSh6OqjBz/VfBh2f60lWF308TQwUiYKOhcCnPpFAnGmc1DROtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784451275; c=relaxed/simple;
	bh=gCsg5W5A+2ezH5qlKa5FUic/JcINEp7EaQr5E1YA26c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loZYa3ueq01IGbN1F5i3mUaQluqSRa5g/5Y8pBX0Og7O12zDOw+toLnqbbtI3YbT35qLPQ7jNEtIIRR1bqETwvob8jSfwHlzDWiWRt6PSUbjuF+ZA24HYW4gTOE27LEX7kkT9YpVE5GLuedDc8/xelPd6chDJqpYL3Upq7ob1Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIU9h77i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIU9h77i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242071F000E9;
	Sun, 19 Jul 2026 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784451274;
	bh=6JA2cRpWVkl+pq93Gp5B+SIoyj8tOsJA9TqdlqOvO9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MIU9h77ioJjiCwHrf+PflRpZo079MJQCqzEvvi1QYXxwLdYFH4BCswhsaGtYr1/fw
	 4ejYcLi1QxvOHmCBVsv8OwwXU/JV4ZjxE9/ORGY0FcNsq1tuUmv2UfupK13WhnThOB
	 TscdaZN9BAspD+ELweg+MTJ0wHnXFkhNDLwRQAfl2FagGTe3SzExqbstIIjEf3kl04
	 sx/NNCfaRJFJ1S7OT+Gyhp3GPXriGSZZ/QSUEEgEuXdRBiVGR2i+G6+1xuL9zT9r10
	 i1/rFTHy4sH/KvIJ4NYLaxS92jVRQfvfy6Ec6VRHgrKH/uRcSmdKlDu09/Q0ssduBx
	 GQAvcDbMsekYg==
Date: Sun, 19 Jul 2026 10:54:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
Message-ID: <20260719-sassy-muskrat-of-finesse-b426b0@quoll>
References: <20260718085728.6797-1-royalnet026@gmail.com>
 <20260718085728.6797-2-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260718085728.6797-2-royalnet026@gmail.com>

On Sat, Jul 18, 2026 at 10:57:25AM +0200, Igor Paunovic wrote:
 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index b7f6c87..fa6cd0d 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -78,6 +78,13 @@ properties:
>        The phandle of the syscon node for the Video Output GRF register
>        to enable EDID transfer through SDAIN and SCLIN.
>  
> +  "#sound-dai-cells":
> +    const: 1
> +    description:
> +      The HDMI RX controller has two digital audio interfaces, one for
> +      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
> +      I2S and 1 for S/PDIF.
> +

Schema should also reference dai-common.yaml and use
"unevaluatedProperties: false".

>  required:
>    - compatible
>    - reg
> @@ -129,4 +136,6 @@ examples:
>        pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
>        pinctrl-names = "default";
>        hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
> +      /* referenced by a sound card as <&hdmi_receiver 0> (0: I2S, 1: S/PDIF) */

Drop comment, not needed. Consumer is not really relevant.

Best regards,
Krzysztof

