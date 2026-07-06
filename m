Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962703ED11D;
	Mon,  6 Jul 2026 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321171; cv=none; b=cHcd87+kLH56dTlxX7j8tPSpyNL5MQ/yDW2yGiJIwvvqPc7HxY5+r0Phdlh4/Yddew0bZaUUCNO+aRRsdf7+HlLbI/4/AB0tcDahBXtIdYxdBRSODxNc9P/XMgtpkyGF2u/1tZNsPdKnDY5lJDBNsnYBA+nkr7eufwr770fMkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321171; c=relaxed/simple;
	bh=M97KqKFg5q1siZteL2hVdqd3nKwNKH7S0Qhj/K+5i0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqeGCbKq9Y5vddByT+ZjeLXwerCkjdNfUCtqLtTG26aKHZtuIEgf+tWeEUIlN5DHarxXZ1dABWFye7i8a0Rk+l2Z3fU2sKqUzZxoq90VYG+DHLGCa6vuGGDP9fIIaI8pFSfyFnbs+NMQ1EBNjXw7L9W4GTPvfKrfKLpjSQal8H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oL0ztYX+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oL0ztYX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4BA1F000E9;
	Mon,  6 Jul 2026 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321158;
	bh=y+lATJnRQ7o/rbZhmJ9nDyBRy1H+M8W2CRQDVnlKZxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oL0ztYX+YNmtoYG/oyXLUbewaxBWatkFUwLtGfQ86IxklFQhTfIx26NBKNAS+OrrX
	 JP1c2umXnXGYQFDiE4fl9s5alDIRS0YuDD+GO/Op/k+MOoWQswTLgAvYD/vCkCkPri
	 oB3nLJmWKBMxGBqVmUObu9kNh/r1AHQJD5g2quRDfhhjJEU5mzVr2a9rlj//nto0Eh
	 RMxhojNjZ+hNQ1Wmo0lkcDxVIi3V7b/KxQUJmsE729kB8D98CCqJFwAf/Z1uiFXFB3
	 9vRX7wE8ZxPWVIy/vvABsFwe1jBDjqMLDIWpygLllZzlfrfHK0k1eX4sUuUZwOhCV2
	 97XS0lIkljExg==
Date: Mon, 6 Jul 2026 08:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
Message-ID: <20260706-quantum-celadon-tench-c2f28d@quoll>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
 <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>

On Mon, Jul 06, 2026 at 02:43:27AM +0000, Xianwei Zhao wrote:
> Document the Amlogic A9 IR controller compatible string. The A9 IR
> controller shares the same implementation as the Meson S4 IR block,
> so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
> compatible.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

