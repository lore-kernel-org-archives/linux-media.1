Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015341;
	b=tvioyXeSSnzHOHLT++7jTuXG5bxfDzYKpeM0wwoES5Dt74HtAy12EaXsHAK/731VxNFl
	 CEeokMVsAFX9ERja/Ayqpmt9sOb75Ecu0sY15iadSWj1RoUap2NYDB9r3K11RnPbzDYnT
	 zWZEHp8EhnX4eMNZFcYfsStZPlmk+DQpZZ3xZ/oTUhA6MBIlu38y/hmPoa+G35Wxm1by6
	 3VY9sX6VIPPcpEU84VFH3sJZelDEJmL8od3rz9L5SgxCInuBqgLdP051QzrDqTzsS3Pln
	 2eMz8gMZK4qF6T7RF1G4wKEaD5XmgMALiNEpZWPyMWT0VQZk4uxf8eKnQ0dfgcIKJGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015341;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CQtt6NUcccISSbdyEpvPqzDH+yf6OBeSB8twsD4QtO8=;
	b=ERBX+NdJ/Tf+7iAusTC8uCQcxOLfbuO2HpZs56uJqK0IcLJOBirpG/irqDcH+DftWlCT
	 Ud18+mAa7y9EQxtCAZXeyT3WIFUiVBwQaNOG9UFuO50zV0dAQ2jh8fmH+P6qDPAdW7C0m
	 iXKqTl3lBQe+wZhiMI1NhXIQnnRGD12coVSx1pHZf2AojoXuLRqyi4MZbqRTD9EV+PX/l
	 0tcyi4ipXzodAj7xYeVbl+2id0WxwUlOpabSMhXaiuqDw7HITj7tXiB8U+if3dK3DmFkC
	 qlzu40Cr9GDp6QD9o2ntRyQ5h/P44eGefpofOa2ONRhXBb4bbryoExJhKAhQl2Tzr2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8zw2Mm6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D960A263A;
	Wed, 18 Nov 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8zw2Mm6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27A51F00927;
	Wed, 18 Nov 2026 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015341;
	bh=CQtt6NUcccISSbdyEpvPqzDH+yf6OBeSB8twsD4QtO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W8zw2Mm6V6Fv+uT0ZNqI1Cvw9GEO2JwPmKoZHpbqqWsKoXlB8W8+sHkz8Senji5ca
	 7o6fygfYkLnYcO+fxJ4og/OtywPoDINQIJz8I05NbErdclxqvVKDB8rhmXSACnQqM5
	 xZGF2BFxKR5DhmubJtiyDIrQTLzRGxJqCaKfKoB7PPXpa4J0KJXl3qVwBMYG47txsY
	 pAt29173IoOHxUpZ0tylehRSEX75aeIGvIAP+5zyzgNpoKudptSsnrGWg3uFWS23Oe
	 gsqspEiqKGuBIslxCEH7WfK+5Lw0iIJKj9n/qSxQXUHyjEr9TBsTVsT3jCdrV+Hain
	 +ZGuc0so4b3nw==
Date: Wed, 18 Nov 2026 09:22:19 -0600
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
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Fei Shao <fshao@chromium.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Irui Wang <irui.wang@mediatek.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Fan Wu <fanwu01@zju.edu.cn>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v9 08/14] media: dt-bindings:
 mediatek,vcodec-subdev-decoder: Add MT8196
Message-ID: <20261118152219.GA1746506-robh@kernel.org>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-9-kyrie.wu@mediatek.com>
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
In-Reply-To: <20261117032950.1425556-9-kyrie.wu@mediatek.com>

On Tue, Nov 17, 2026 at 11:29:44AM +0800, Kyrie Wu wrote:
> Compared to previous ICs, the MT8196 supports a 10-bit decoder
> and has a decoding capability of 4K@120fps. It also supports
> 36-bit DRAM IOVA address and Video Power Control to optimize
> bandwidth and voltage usage.
> 
> MT8196 uses VCP to run the decoder firmware, so require mediatek,vcp
> for MT8196 and move the mediatek,scp requirement into the condition
> for the existing SoCs.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 52 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)

This patch should be based on this one:

https://lore.kernel.org/20261019212431.4109371-1-robh@kernel.org

Rob
