Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C33B47D0;
	Wed, 22 Jul 2026 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703164; cv=none; b=qP73pNr00aEo+86Ekwmsx5P/vHAfeL0qqSNNwbWm/nGKpl0UG4xwOTPH5FVW/NDIVmlXa4yrZ6nus2zYMgJDBh/QPyOukjPO9YajCSS4VPZBZRwN9sQHDcpLKSrqX07aqMGwbYaViRczQAddqdKtQbKlsUmZ0bxVScASe1sXydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703164; c=relaxed/simple;
	bh=eUXBF/opkM+3XK1IWHfvr9S45kf4SB4flFNFZAf6W04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWbLe33YmsTzgDwuLp82sLpreQiShFITrtf6cQd/5UQ81bvZN0qRv01tzGmbKYXpvZTW7WOGZ23jYKuzPbD6t9Q7MpCtXQI7mHn1pisn0GLT9poJkBZKwzUlRfT54bVh38yYGytLJOr1UN1Fgc24h7DOojYHcUZDSANjolOt5X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQZI6bI1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQZI6bI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908361F000E9;
	Wed, 22 Jul 2026 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703162;
	bh=xdvYnB+kWeZ1KxPeBGxQmiB4q+ygBCOu5lRTKg/qEN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BQZI6bI17aExhSauJW3kHtAiZ/lPh/4uFjw9l8DBrK28ghwPbiocAFm9yC4OfvlWF
	 xxujk1JJ6k7qOKpr6cwvZshfk1n30bgsrQ0Kz7VKUizSC0BCALTZLzn3/6UTzq+zQN
	 SpWKd/gVPu88rropTW4m5rnZOJKLkvB48VxOzE/ud/J2vK7TfEpoEwQZ3tDAPjjWuB
	 GV03IHMeXQZ9SNQ6O6eT0xE+4GRkCF8qILPsyPuzCj9cu9p0OZ2gAx29YjI7FvClya
	 uzpeckF1Yd69mdqOXJivFrWywWyBzdJ5BGpIp60ivZWMh1v6qUS7EcGdBcXe/w+6ql
	 yGZq+XuzYPyCQ==
Date: Wed, 22 Jul 2026 08:52:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v10 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260722-discreet-imperious-mustang-22dcf4@quoll>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
 <20260720062829.7343-2-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720062829.7343-2-jianhua.lin@mediatek.com>

On Mon, Jul 20, 2026 at 02:28:27PM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG decoder block found in the
> MediaTek MT8189 SoC.
> 
> Compared to previous generation ICs, the MT8189 JPEG decoder requires
> 34-bit IOVA address space support and only needs a single clock
> ("jpgdec") instead of two. Therefore, it is added as a standalone
> compatible string without falling back to older SoCs.
> 
> Update the binding schema to include the new compatible string and add
> an `allOf` block with conditional checks. This enforces the single clock
> requirement for MT8189 while preserving the two-clock requirement
> ("jpgdec-smi", "jpgdec") for older SoCs.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
>  1 file changed, 42 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

