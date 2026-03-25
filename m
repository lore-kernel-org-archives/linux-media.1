Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1981F4168;
	Wed, 25 Mar 2026 01:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774400634; cv=none; b=EZUg4/Se2YgiqPamRGXQ3lmDjyjseNWXWzyNZFnJzeBiII7x2MAu8znqhoe8KeGkgC+nf9mqsjtI+qzL8mc4QfA5UHGmCEV2wM1omdIdk0AAFBWhQQQPrnep6SrmULUUN732vrg13v8OUAPggAztYLffANq/nhbyRhI9pWppGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774400634; c=relaxed/simple;
	bh=Ec30pFjGpNIPtSM6yzZYTFlRdMVgyF721FSkvUyNkaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jal3Ixb0DHzyIQhZloqSWjobAN2W6ZDTGye4+smYd8RZ5UN8V/b6zVmZu9BoCTeWICbtp9czLRKI+4E9svra6rtoFvE81a5sQwltFi+5WyX6BGmKcT3RGt72Ipqy8Hhdw+W8D6l62zGl11vfCERC1nuhcRuj5d4EPP07OGShhy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEqtVdKP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEqtVdKP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD7EC19424;
	Wed, 25 Mar 2026 01:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774400633;
	bh=Ec30pFjGpNIPtSM6yzZYTFlRdMVgyF721FSkvUyNkaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEqtVdKP4amwdek/+3Ktf7X09C5MDfeZBY0wiy5GoJTq1delYyze+d/0JQcLR05jb
	 ftJ3y4UM5R1aQeKdLwSIgqtf7h13I2is9hulQsIXxMe+wdbbcmCAbqjc4IAVBMcO8s
	 7y7rjcQuOH+4EnhKnvBp8WRWBld+JEGMNofJ4irYs6YKYWVbtjIgwTrLaOJlVG58Bb
	 nOGqS6+kdBcUJbohlt09G/7OMBNmdxziHmfk6mV+o7Ajy3hNaVHTfB8yBzzHcoX5/V
	 YR3+J5eoVji3IcQir4IbIVfCOGBiy7d6J9FTMRQQ+7nK0+boLNE22d+EhWItMVrsXb
	 PQAouLEGOKrWg==
Date: Tue, 24 Mar 2026 20:03:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: krzk+dt@kernel.org, vince-wl.liu@mediatek.com,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com, nicolas@ndufresne.ca,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	mchehab@kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	linux-media@vger.kernel.org, sirius.wang@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v4 2/3] dt-bindings: media: mediatek-jpeg-encoder: add
 MT8189 compatible string
Message-ID: <177440063161.2317367.2319748600784024525.robh@kernel.org>
References: <20260324095455.1437-1-jianhua.lin@mediatek.com>
 <20260324095455.1437-3-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324095455.1437-3-jianhua.lin@mediatek.com>


On Tue, 24 Mar 2026 17:54:54 +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG encoder block found in the
> MediaTek MT8189 SoC.
> 
> Unlike some previous SoCs, the MT8189 JPEG encoder requires 34-bit IOVA
> address space support. Therefore, it is added as a standalone compatible
> string without falling back to the generic "mediatek,mtk-jpgenc" to
> ensure the driver applies the correct hardware-specific configurations.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

