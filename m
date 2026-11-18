Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015213;
	b=0fFSHka3GebWEqF5hqWH93rGiCRxtDT3BHDnleCoQfBTw5SqG3DZ3X3ySurbH3Js6VNb
	 v5Mjh5O/YW00/p1UMX78W65JbLi+btr+0LjvCs4hPXbx0formki4ZZgALfLOww2bnVRTU
	 VrbZuo1ZZmj59g3HIrPSet386YcaqD+zxT8l2Ga0aNJ+XxsTSjD27SjL8fRelAyjDnHYa
	 gaBdJ3mCaCfurLeHdTgYnVg8HLiLi527CrHtoXnCSGEk5GYWPKpTPDqn/xOZao0wP99eb
	 kfamg+GbGuFDbsXZcTY5UgzqK45D08gS0LF/v+zRbbiieh5inCRk5Ei2LHsl9ItwGlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015213;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xknnVEsoR6H+3/0kZCcdKISh6bJJcx/A+zYzsrOLOcU=;
	b=WvZFHqjmuJgbyXzq1hxYi6nXhE0Amm2eQRMfpbmrW/edS7NxEYpml7hhz7quEHxwNNio
	 3SVGX1+TCIyBplUL8U89C0iY2wnwyq7Mu+yeucy1t4oQZ7X02qKjxXdmUh4uIWUD6kG+A
	 AJbtyIkcn/2WuCq4cncsTVoyZxtoC2jaPno9ezgxKgMy1Lqx/s3kwNDE2261+syHhT9id
	 Xb2irOeBE6OEc87zNPuJnPM7wRx8NZNthCisIMNXsRhozCp6rCdObYJpHCGSvYckkj5O+
	 sSOlffcNu2wo+D7gvUHaa5t63yiQqCOlk1xB5uFvdW/WVqfBtvtW1KQZyEwO+priSDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrJrZPxH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA8E60A262E;
	Wed, 18 Nov 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrJrZPxH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8411F000C9;
	Wed, 18 Nov 2026 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015213;
	bh=xknnVEsoR6H+3/0kZCcdKISh6bJJcx/A+zYzsrOLOcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WrJrZPxHUXZ+IFsZgxU8Y7E1hHXJjeNhUWufAidq9GR7LcBXj6VgxjGrG+tmfkuyc
	 7Xoy5/KzNkZxRpLPbzM3eJHTzUaUKijOwfNYYzaSu4/StslDMSwPrF5MGY8k9iPGvW
	 /Wtkl1eDEC58V6BL3xk0PWGQ16zKVwVgX90Muk7PUZEHvaDtYn0Ntzme6d5d8QNq5b
	 VLXWovhJ5TemjnIpexxW+CIwESaq3g16qFYE2kE+OChXWVUxshy4I+0LWJp/rtJMBn
	 5jVYxq37KBFKLPKBuCnepM8RHzxb0Qe2is0qQa7yZac2olnKbR48QrM9GJGKb/B+Fn
	 rAVUGnPt5vI1A==
Date: Wed, 18 Nov 2026 09:20:11 -0600
From: Rob Herring <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Irui Wang <irui.wang@mediatek.com>,
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Yilong Zhou <yilong.zhou@mediatek.com>
Subject: Re: [PATCH v12 01/10] dt-bindings: media: mediatek: decoder: Add
 MT8189 mediatek,vcodec-decoder
Message-ID: <20261118152011.GA1714890-robh@kernel.org>
References: <20261117085834.1464723-1-kyrie.wu@mediatek.com>
 <20261117085834.1464723-2-kyrie.wu@mediatek.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117085834.1464723-2-kyrie.wu@mediatek.com>

On Tue, Nov 17, 2026 at 04:58:24PM +0800, Kyrie Wu wrote:
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. It uses two clocks named soc-vdec and vdec. At the
> same time, the decoder supports the vp9 decoding protocol for the first
> time in single IC.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)

This patch should be based on this one:

https://lore.kernel.org/20261019212431.4109371-1-robh@kernel.org

Rob
