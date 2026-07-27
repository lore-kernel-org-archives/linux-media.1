Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C193CA486;
	Mon, 27 Jul 2026 06:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133448; cv=none; b=mp+idqDzTKLJBYsmUvTeDYSZ1Ueleq9vhO7dpU9aF7neHjnzbBX6A6TbHjXs1Uwji1Iqu3L1rO9xoI6R03GTq6Wp2jJT4Yij+nTFIry9qEEdEVy2ej4v/LwHSFIaIeGiZlrw259aoRWwv30uCiqUDKv8fqQD8rk0k71RgDWjiag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133448; c=relaxed/simple;
	bh=u3rRSgtdAdSrNiChWojNE9rZvIjD+F15MwV2/5IP+qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayZYF3cTKnDslZ6GGYG4gkWoCPII46SUqBAn/puevuEj+PwKbOd4bz0OYpKRrIFpPv7F/HNnmS+b1zLZek1wMW3GIkWrFryxR17+FYjDlQ2gXNGw13E3ZCFycPOEdUOIS4P4COBMOW7w9ahRNBwfxULCeTepsGgv5nxQVjn5VrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHHfYYc/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHHfYYc/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8A71F000E9;
	Mon, 27 Jul 2026 06:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785133438;
	bh=eVsgJPRHn51XcESko363GMJRqIFO2EWO17u2oafb950=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHHfYYc/EVunwM/BogFHtGsU8/oSwATiUe4Bbl4i0C2qoQ6OVAEk3yBR3a1xuW82R
	 Jwg+AKk0O9Dj/ms1Pi0LOfABiQpx51jWFUDbWZWwSPsanpvCZtmKETuJZ2Ii7B6Xmi
	 R2nEYVkkm1wGQzMdfCs5fqvygonY8z0HocJF+KA8ebmredvBuAFGKJDU+fB4j/bohA
	 Vf9eBnGJfIWXfaKPWUXl+VrJX1uFv8mQudo7ewu4wqa3/qRC5IdLpdQugAqN5jnpx8
	 fPRZ9gGtpDbOQv9CpNdfZbHblCd6rUJvplquMEZN3WQhMeYznCI8xs7bAaHH3G/MPC
	 DnbXxDCrPpPSQ==
Date: Mon, 27 Jul 2026 08:23:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Message-ID: <20260727-brawny-silent-kangaroo-a02c9c@quoll>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>

On Fri, Jul 24, 2026 at 03:04:53PM +0800, Zhentao Guo wrote:
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
> +    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> +    video-codec@fe320000 {
> +      compatible = "amlogic,s4-vdec";
> +      reg = <0xfe320000 0x10000>,
> +            <0xfe036000 0x20>;
> +      amlogic,canvas = <&canvas>;
> +      reg-names = "dos",
> +                  "dmc";

Please read carefully DTS coding style.

You also need to address all comments from Sashiko.

Best regards,
Krzysztof

