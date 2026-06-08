Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33DD3254A9;
	Mon,  8 Jun 2026 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902181; cv=none; b=Qrshm8uYa8FM4mOaO0aLp9+dIs+JQtu0b6HOpOmfSRHIpZqX0TNhyDVWObcC5mhvlq+kCEivjdxZk3Jt78fcTPOELGwNxJHYkGaUYFrbG8lKvBxU0C7JkjLKEWeJqsdb5hrHfXMQOVBG+WJ1VrXZB2ziLNw4aaFomTTQS8h7gxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902181; c=relaxed/simple;
	bh=BMjFzNBoAGngJ0hCOmcrg7I3zkNFzTNBG3ZjqL53oMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idwb3qFc9w1zZIAQNHTEITURDAnpLdFCQDdqyVD8FIuogQSTsCQgop6BXu9s28vMOxRkHC1muQFx5rjCrU8l4rMUsBfyEo3kn5VaribETEpBkeK1gWDnDIXN/KcMjx9pJCpW3vpiaBsDYMUaxeQbCOY/JbgW8lXiPYlvUmobVac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXE8vzkd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXE8vzkd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547DD1F00893;
	Mon,  8 Jun 2026 07:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780902180;
	bh=sC/NJlKydMkj+Y9yfiR3+x1I6jBmsagpXNDi38GetMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cXE8vzkdo3y3nBwueO3NFR2c9fkxUxELfMg/ceK54WfkCIT/cAVZ9cN9sjD9ooPBy
	 2mQl1Npy1SiK6qr3U+pEMC2sJU08DJ0trJinQT1xdruW33XMTW3xfgDtjzmRrpoNKt
	 WdEq31dQXxTtInOMV5f/b6sLvJZgOanV3+NkE2E+Tl8fwNi/S1p39cv+ZseRzFG3ZG
	 9r36zELmr1ZnsLSzJ00AIVdN6XDx7yFDNOspmZA7BX1pf3WTxQZUaCpqymMVWpg2XT
	 z5u6hXu+tCU+FhmmzdUQdHREjGV8RTWul7NXTXITAP9phoIh2C38PZJFOmENTT5yW9
	 W1JkmyDaFTq9Q==
Date: Mon, 8 Jun 2026 09:02:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor
 driver
Message-ID: <20260608-exuberant-ingenious-macaw-9c6145@quoll>
References: <20260607-submit-media-mt9m113-v7-0-5da397a3d2a5@herrie.org>
 <20260607-submit-media-mt9m113-v7-2-5da397a3d2a5@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607-submit-media-mt9m113-v7-2-5da397a3d2a5@herrie.org>

On Sun, Jun 07, 2026 at 07:34:05AM +0200, Herman van Hazendonk wrote:
> Add a V4L2 subdev driver for the Aptina MT9M113 1.3 Megapixel SoC
> image sensor (1280x1024 active pixel array) with on-chip ISP. The
> sensor exposes:
> 
>   - dual context operation: Context A (640x480 preview, binned) and
>     Context B (1280x1024 capture) selectable at runtime;
>   - single-lane MIPI CSI-2 output, YUV422 in UYVY or YUYV byte order
>     (the byte order is selected via the chroma/luma swap bit in
>     MODE_OUTPUT_FORMAT_{A,B});
>   - I2C MCU-indirect register access through the 0x098C/0x0990 page
>     indirection pair, in addition to the directly addressable
>     register space;
>   - V4L2 controls: H/V flip, color effects (none / mono / sepia /
>     negative / solarization), power-line frequency, saturation,
>     manual or auto exposure, analog gain, auto white balance, and
>     a four-entry test pattern selector;
>   - a 24 MHz EXTCLK and 1.8/2.8 V supplies.
> 
> The MT9M113 MCU intermittently wedges on stream start (SEQ_CMD
> stuck, SEQ_STATE never reaching preview/capture; only a full power
> cycle recovers it). The driver works around this in two layers:
> runtime-PM resume always performs a full power-cycle plus init-table
> replay - matching the legacy vendor kernel's per-open behaviour -
> so a wedged MCU is recovered each session; and the s_stream(1) path
> retries a bounded number of times with a runtime-PM power cycle
> between attempts as fallback insurance for the residual failure
> rate.
> 
> Found on the HP TouchPad (Tenderloin) as the front-facing camera
> and on a number of other 1280x1024 mobile/embedded boards.
> 
> Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5 Sparse:0.6.4 Coccinelle:1.1.1
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../bindings/media/i2c/aptina,mt9m113.yaml         |    8 +
>  MAINTAINERS                                        |    8 +
>  drivers/media/i2c/Kconfig                          |   13 +
>  drivers/media/i2c/Makefile                         |    1 +
>  drivers/media/i2c/mt9m113.c                        | 3394 ++++++++++++++++++++
>  5 files changed, 3424 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> index 72b827c47b1d..cfd6711e8250 100644
> --- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> @@ -70,6 +70,14 @@ properties:
>              const: 4
>              description: MIPI CSI-2 D-PHY
>  
> +          data-lanes:
> +            description:
> +              The MT9M113 has a single CSI-2 data lane. Reject DT entries
> +              that try to assign more than one lane so a misconfiguration
> +              is caught at schema-validation time rather than at runtime
> +              when the driver enforces num_data_lanes == 1.
> +            maxItems: 1
> +

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

