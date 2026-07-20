Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A973A963C;
	Mon, 20 Jul 2026 05:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526413; cv=none; b=FP7QrZYBSb+avPu7WPkf4PM/bnErXCABEXPpw26imf8yM+4hoErGtxCm4nhX5verzRDcM9AO2v/jAWY4uT9wOn/iBHk7P/FyPGDzMMfjuYjmHuKFQ+kqFOjUKbQbfbngX/qQ5wRQrCo89b9nlq5aUXtfqRYdYWzTpYaS4LINVWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526413; c=relaxed/simple;
	bh=FrOREJ4y5hitXRThgiDHCBim1JhpJz4MjFauLtbOQYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9yoljhM0jATAhgYiPPX8+qNpxUfvgJwBbYKfxRC3zwi7g5jdt+WBzqkCjTRQtFgya02Z0iToXJMkw3uacbJyBdBiaZw1hr964ZIwVwSxraJHKVcELeoGn+7F76c5/iNawrv/RaUQi5i8wqZ7oVwitYhBaa5baB/P+EMnw72fsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJmqte4I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJmqte4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AB31F000E9;
	Mon, 20 Jul 2026 05:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784526402;
	bh=vNOj+nqn+Y5SfsvGLwG0FLLtMfQy7PUJ2s4IhoKO0Lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJmqte4IXJggDcPEMNwYZvuzwRn34JvUCZ4Q1HAv9kWIfUlI7tCuRFRFE/c9TG72/
	 zAWZtV3Uwhq7GAMWU3DxXFgqYI/l4EyMLeHGnkF/7/LwOpdYnj62ASwLS1fW799+mv
	 RzIEikaRdTWQGjR4eOTa5OQfBzGcccGWyPtTjR80cIyVTlv7uchNfXmaQliobFvX9c
	 w0pLoA/hozK/X7FZHzU6KT2hElPi/WvbS698Bnw66nN7xyWC5yrUjdkLEm10XdlbD/
	 bNC9HxKgS5bQCb2vWCxBcOnmYYk+ACMqIGykUYutwswroN7YnFEdZ6Z0Kar6Y3xlQz
	 6vY6+AjjMhhjg==
Date: Mon, 20 Jul 2026 07:46:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, 
	Haoxiang Li <haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa <tfiga@chromium.org>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260720-gregarious-satisfied-shrew-f71cba@quoll>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-9-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720012056.1026551-9-kyrie.wu@mediatek.com>

On Mon, Jul 20, 2026 at 09:20:50AM +0800, Kyrie Wu wrote:
> Add the MT8196 compatible string to the MediaTek vcodec subdev
> decoder binding.
> 
> Compared to previous ICs, the MT8196 supports a 10-bit decoder
> and has a decoding capability of 4K@120fps. It also supports
> 36-bit DRAM IOVA address and Video Power Control to optimize
> bandwidth and voltage usage.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

