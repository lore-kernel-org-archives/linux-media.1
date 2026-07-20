Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E5E3ACEFE;
	Mon, 20 Jul 2026 05:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526589; cv=none; b=kJN3vSMlYOgl3lD1daf5Slje+wv98tIW1RiF5eIoFki8QH/bExGCxnxP+sUOTsT+n2OZnYvXOYhHtolIxSZaT7zzHdP6SloKDFs7rjneStTlXLHxoneUKIJuO4lU/1XLkk2dMWl2t01LaICNPAsvgt0AN9DlrHK7xG3ENNbcnyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526589; c=relaxed/simple;
	bh=ZdLUOg9JZ7V0tKJn0COkPZuiGEbpR0R2XVS5fpr/p3s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ff4OxX7ZBpFU15Ce+N2Gin2MdFgAu38XHAS8CKMgSkpSuAzqTEj4u5rWAMbG55qftXW2+CUEbEm/mMb2UhShOUtrRZRdBy3syn4xJU1duaQf6/xX6IiOOXnwQlp5gg5936rVUuUtwVfD6wl5Tv1hP0edzNufsN1rVjhdnzGGXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bb5pKvCY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bb5pKvCY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083C61F000E9;
	Mon, 20 Jul 2026 05:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784526581;
	bh=h87MjyOkgvbatscvEMzR32hzBNFeHeOEb6wSOXen/Vw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Bb5pKvCYZ4/Qc0o1kGLJR2FNVc7vNgRofJFz0tFV2WfOEHUTzJYWokVeB/G2sjzPy
	 HnXeLQvx2XsH4Opja4l1thSwnu+TROZXYUcDDtljyF55Jddu6fQwdKyD7ZPJlpKI+z
	 VS4Y6EiFiHCAQBQekCZRc/u+OG8cNOJCz2ObN1RvfyY+Tkh6eE7nsJLXZ1XGgWbAAO
	 MFxCoAjnVIox/7U04m8Ee+syxq+E/xzsqN0YLjs7Aegy7Ul5wblWbOWKATTXRBFtKY
	 L4mv272T9907lXhkWiB/6OjGB1R3ZvM1HvvZ3TAQ770RiJ5J5cKiuKf0CSReia4XIg
	 LvgWTqImxx1uw==
Message-ID: <f499f2c3-f31d-4c2c-84fb-d1d9d95fc868@kernel.org>
Date: Mon, 20 Jul 2026 07:49:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>,
 Haoxiang Li <haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-9-kyrie.wu@mediatek.com>
 <20260720-gregarious-satisfied-shrew-f71cba@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260720-gregarious-satisfied-shrew-f71cba@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2026 07:46, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 09:20:50AM +0800, Kyrie Wu wrote:
>> Add the MT8196 compatible string to the MediaTek vcodec subdev
>> decoder binding.
>>
>> Compared to previous ICs, the MT8196 supports a 10-bit decoder
>> and has a decoding capability of 4K@120fps. It also supports
>> 36-bit DRAM IOVA address and Video Power Control to optimize
>> bandwidth and voltage usage.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
>>
>> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
>> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> ---
>>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Actually no. I checked previous comments and you received feedback which
you basically ignored, so explain why this model has flexible number of
clocks

Best regards,
Krzysztof
