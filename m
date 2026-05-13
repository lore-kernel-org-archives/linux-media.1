Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE3E426D0B;
	Wed, 13 May 2026 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676541; cv=none; b=Ehm07i+PEbtSeJeHSwTmibutSHRjHpMtStF7n1JICVZK9VCZcayTtQ2wZhQud2oqDX7VnKO3rtYe7XwFUp4b4LNGx2tEXHwJhCKyqG8ateVRWOhItdjWHAFLmRiUOt3vkMWge8ZbX6zsb5wKkouS7IMZdG0/a4B4wzYaCZqmtSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676541; c=relaxed/simple;
	bh=ZES+3v/n1Nkqlggfz/vnQ3phe7aIMIcVw0d8QGWt8OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aydO9XPyZh53MXkEId2t6kuYgv2Ovx+DN1D/5Sfn7B4eefGLbP3niD9qNCjW3QfJ+D4/znLf3ju0sHhUPGHxhRU/VhnVZ35yu2L0+8MX/GHTfaEF62SVlssmzk8lXjUDs8F55wwrX2crI+UtwFvPBIRWLlLtOF9aAkpH6cvMJt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kc6vRVH5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kc6vRVH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD63C2BCB7;
	Wed, 13 May 2026 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778676540;
	bh=ZES+3v/n1Nkqlggfz/vnQ3phe7aIMIcVw0d8QGWt8OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kc6vRVH5PTNBaRNaERh7Vz/ywZYymqZ+dSWs+mq6C/kx7Ek9LoRhk7Ag0kpM63FG/
	 wg6JnHqWTHLAy5mOECKmWAE81lJ/7utzV/wYWaezNXHxbhhqB+MC34kQQrJVMeHHhh
	 96vJoeVvCeU/FkrcXilIyAKd8UvxlZnr+vG2Nj6OvyjnPwzqOTHoBlCH8OC/Aluk23
	 qCRKf4ozX/mYVcJn40iP8rd4JZK14w2xT7gZm2hjXyhjUxuVefl/d6sG9jZ/18A7JI
	 NKh3sA4eh/iR+hL6MhmlDCNYGpfdTL2j0Open63lzcaYPHCY0H8uuUmzyXmNK1Siid
	 7+VTyoX9zwnXQ==
Date: Wed, 13 May 2026 07:48:58 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 2/8] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260513124858.GA585254-robh@kernel.org>
References: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
 <20260508-rk3588-vicap-v4-2-6a6cd6f7c90b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-rk3588-vicap-v4-2-6a6cd6f7c90b@collabora.com>

On Fri, May 08, 2026 at 09:31:45PM +0200, Michael Riesch wrote:
> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit. To
> that end, make the existing rockchip,rk3568-vicap documentation more
> general and introduce variant specific constraints.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 187 ++++++++++++++++++---
>  1 file changed, 163 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> index 18cd0a5a5318174910e04f6ef7558c92cbfec899..897ed00c239bdfe33777a8f8474fb27fa6265e49 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -15,9 +15,15 @@ description:
>    the data from camera sensors, video decoders, or other companion ICs and
>    transfers it into system main memory by AXI bus.
>  
> +  The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
> +  counterpart, but features six MIPI CSI-2 ports and additional connections
> +  to the image signal processor (ISP) blocks.
> +
>  properties:
>    compatible:
> -    const: rockchip,rk3568-vicap
> +    enum:
> +      - rockchip,rk3568-vicap
> +      - rockchip,rk3588-vicap
>  
>    reg:
>      maxItems: 1
> @@ -26,37 +32,23 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: ACLK
> -      - description: HCLK
> -      - description: DCLK
> -      - description: ICLK
> +    minItems: 4
> +    maxItems: 5
>  
>    clock-names:
> -    items:
> -      - const: aclk
> -      - const: hclk
> -      - const: dclk
> -      - const: iclk

Just keep this here and add iclk1 on the end along with 'minItems: 4'.

> +    minItems: 4
> +    maxItems: 5

