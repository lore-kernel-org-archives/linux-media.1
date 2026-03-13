Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC4264614;
	Fri, 13 Mar 2026 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409923; cv=none; b=QGL2ooU6KxyDsnxKDexK33CC36naYQZs6G2OKDHMOS7haoUAL88G4V50Bpm7X0mrtj2sRlm/fMfCJijXKhkbfAuuzWjeiGHq+ItcHIugDXlmqzNb1lTde/Aq6Q1LWPhGGsuU7VIkaf5pX2eG4IayCSC79HpH6poCnoodyNJhXAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409923; c=relaxed/simple;
	bh=S/GrkGfYnRsEw/IEuOuLal7o/HDD6ZJeF+I31DKmFvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dbtlqz5beMfN2xNTzx88WDwWSgndNuNFOx6xicfrlz/UWftIWi8T460qGsSXl+mIzGaM7DR5p5/+yFs0DYPa8fc+caThOY/iza4Xk29ER5pfax4GpbR0FN3B1M8jH2YOmFdzobxa354G/UBvQfM3fBwxmhaXEW0kAnzzFhgVrcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtOylFFX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtOylFFX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA3BC19421;
	Fri, 13 Mar 2026 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409923;
	bh=S/GrkGfYnRsEw/IEuOuLal7o/HDD6ZJeF+I31DKmFvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtOylFFXtxRnuJl2SqQZOZfUQVtcTmTtaW2gCpv6QD3JNS7yLQdmPyVId0C+gIAPq
	 BJ/HNQM/XdiamwcS9T2igLuvaqTTBB8Q405JGPst4xUiehgKt4CA+BQqFoKtbnD4sH
	 2jr80ySLK/6+vKgys/AiRvbVFV6/qgih0Ngzq69aKJk0238vZ3O5A6VESEfw+Zcyzy
	 vIIrwa7MZBTgb652AIjYqnH0HVqYUd2/WaV+bVrqgn5YcFG8MmUUlKMWr9LKkmFzk8
	 JwRKy1WD76JVwU3xI0XW5bkwh4Hb+kskY9ysUNC6fIIXFopMNKJcESgkNurM8H9Txp
	 gMTt3umgadN9w==
Date: Fri, 13 Mar 2026 14:52:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add Sony IMX662 sensor
Message-ID: <20260313-curvy-esoteric-stoat-b2a490@quoll>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-2-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312150437.1091195-2-eagle.alexander923@gmail.com>

On Thu, Mar 12, 2026 at 06:04:36PM +0300, Alexander Shiyan wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx662";
> +            reg = <0x1a>;
> +            clocks = <&clk24m>;
> +            avdd-supply = <&reg_cam_avdd>;
> +            dvdd-supply = <&reg_cam_dvdd>;
> +            ovdd-supply = <&reg_cam_ovdd>;
> +            reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;

I bet you never tested your DTS with your driver. There is no way this
works...

Best regards,
Krzysztof

