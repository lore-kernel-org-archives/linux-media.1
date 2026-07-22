Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF335313E0D;
	Wed, 22 Jul 2026 06:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703230; cv=none; b=aFeRhUQNmOZ+mX9XvtpJmgd/S+gxhzh76TreBkCy+zZTo9WgIVV0eYAk43X613k3JgIewbfCzZC08OG27ZtflFLa3f/yGbz1ey13rdAbzN54ZJT6Pr0JzxGrYb0IBrqpqm0huYaNe+gQDXixNl1Djolxpn0V0sJAicjUuK7+bbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703230; c=relaxed/simple;
	bh=aGfVe/MWp5dPaB6+QbHvh+LVaVOrW/+CfZZZIo40WE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDliNCVCJY4Tgi5JYy8Iy2zp+XDASHN55Yd+uR3MY37+rq+pNFZeDGlfXQWAd0+ClGurByLu1dFdor1D07n0FQGnCeyeFHwytDyDBVILbkg84npBrM+I6a0uG20I57+UmVOlQKKFd4XG0S9oTQyiQXyEDcrr/On+pJhL5uUXnKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4fJBH9E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4fJBH9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36D71F000E9;
	Wed, 22 Jul 2026 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703229;
	bh=zXENoZht4E5/1Rwkl9nffLsBsIgL4pApnVWv84N5yyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F4fJBH9EYonk7TRv37q86oOyCnCbMJY12aIjQdqQtCsSAHaQO9w39E4HWmIajyBXE
	 2Gq3bRrvznOYU60Ipa64lvCz/cWQcgEWXig03ke6r/EjikBkqhNhj8+4ApV2jJ1UJk
	 BMoaVOSszUZKWDcHMl4ovaOCTQ/dfakzt8cdbbD3ctkmOZTLR3l7Tj+qdoESCnFpzm
	 LKTfcwr7lVka9YG5BYzTYeBnWq+mGgODR+rznhorRgDdeu/pjy43Z6YfW7g9TRWYft
	 vMxJd8sPyTQ5h1DYpln4y4MxwCn7Xv+ZkVBpPkbwy90KIq8O6JOvhbNnctp/0Ic6lK
	 8qyXbQm2Tfrig==
Date: Wed, 22 Jul 2026 08:53:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v10 2/3] dt-bindings: media: mediatek-jpeg-encoder: add
 MT8189 compatible string
Message-ID: <20260722-agile-fresh-jellyfish-dfb48b@quoll>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
 <20260720062829.7343-3-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720062829.7343-3-jianhua.lin@mediatek.com>

On Mon, Jul 20, 2026 at 02:28:28PM +0800, Jianhua Lin wrote:
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
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 38 ++++++++++++++++---
>  1 file changed, 32 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

