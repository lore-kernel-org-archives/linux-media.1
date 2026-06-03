Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315D42E014;
	Wed,  3 Jun 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476890; cv=none; b=E+NvPIqDZOnbi8XLUhmGU3wT/ybePzF8FZlOIIQHqEaqzfXyU4YdYjQsPskQNEDz+HDw4MkNBPoJzWIvTZ5cAOIRqDIvJ1LkuxGGa0RCx7rlLupKYvZnjn5ybgVP0PzBE27xCVUiuGpUcY83qa9Sx32rWvDSCABG5ZFcXvSoZZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476890; c=relaxed/simple;
	bh=MAXVIEfVzuZig1x11vjupeV2JsnsXp9RAu08ijnfgm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HQEXVGLSEryZQSdaEOB+wOzcuzjmXv2yyFOKfpylsaOgZTtzJUfMdYANyXlDNJRjA0HvePeoJK4/K7WHITrCWtAJ/i5GBuKzEh6G1/lR1N8+VJMRjRyIR72VtdS0Bt9o358wGqAqXRVcrwBQTiREKiEGw699j7kKyJyLJXQVS9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIHvMRoa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIHvMRoa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F55C1F00893;
	Wed,  3 Jun 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780476887;
	bh=GX/Rvipr5UytD3LSxoGK9unCnTOf1wM7k2Hmcvf2Cmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SIHvMRoa0QhNILwhKwrlfm7VuuXhiNjJXV3Cknbkpwn73dg+Mn/BDc1L7d0WiY2g8
	 IPrfOe48xeqy93N9W7vYdxV9DUsBdtGBhK2savsA7kVIAayxrtwvoDoLbZaB5i/yVS
	 8Zw3K2dA5avonjwkncT5bZoX0hif7VHsoFprC3hNfyA6rqzM0N+4v5ueppStKRec/v
	 yZh9d+lc44cLQ2lnpWCMadWKEXr6cBtXmZL51ebhD5vwXUKa+ZRbBNeKPutLGBVIUW
	 H1T17WQ7uoH0c+5A9kpi+1IY9b+h6PMUquOloMS13TBh8hg4vPTa8SKhOmY0SYi8Gi
	 Jh0+FuPQ+K3qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/14] media: mediatek: vcodec: clean xpc status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603084045.17488-9-kyrie.wu@mediatek.com>
References: <20260603084045.17488-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:54:47 +0000
Message-Id: <20260603085447.8F55C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly introduced `mtk_vdec_hw_clean_xpc` function performs non=
-atomic read-modify-write (RMW) operations on a shared hardware register fr=
om concurrent interrupt handlers without any locking, leading to potential =
state corruption and lost XPC clean pulses.
- [Low] Type confusion in enum usage for indexing main_dev->reg_base.
--

commit 6d6918cc2e35280ad95cd095aa0042f4f69bdfc5
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: clean xpc status

This commit adds functionality to clean the XPC status upon receiving a=20
decoder hardware interrupt for the MT8196 platform.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> index 881d5de41e050..e4e527fe54dcb 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> @@ -61,6 +61,31 @@ static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dec=
_dev *vdec_dev)
>  	return 0;
>  }
> =20
> +static void mtk_vdec_hw_write_reg_mask(void __iomem *reg_base, u32 reg_o=
ffset, u32 val, u32 mask)
> +{
> +	void __iomem *reg_addr =3D reg_base + reg_offset;
> +	u32 reg_val;
> +
> +	reg_val =3D  readl(reg_addr);
> +	reg_val &=3D ~mask;
> +	reg_val |=3D (val & mask);
> +	writel(reg_val, reg_addr);
> +}

[Severity: High]
Since LAT0 and CORE hardware subdevices share the same parent device regist=
er
space and have separate interrupt lines, can their interrupt handlers race
here?=20

If both execute concurrently on different CPUs and call
mtk_vdec_hw_write_reg_mask(), could the unsynchronized read-modify-write
sequence cause one CPU to overwrite and lose the XPC clean pulse from the
other?=20

Does this sequence need a lock to protect the shared register state?

> +
> +static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
> +{
> +	u32 val, mask, addr =3D VDEC_XPC_CLEAN_ADDR;

[ ... ]

> @@ -166,6 +193,7 @@ static int mtk_vdec_hw_probe(struct platform_device *=
pdev)
>  	subdev_dev->hw_idx =3D hw_idx;
>  	subdev_dev->main_dev =3D main_dev;
>  	subdev_dev->reg_base[VDEC_HW_SYS] =3D main_dev->reg_base[VDEC_HW_SYS];
> +	subdev_dev->reg_base[VDEC_HW_XPC] =3D main_dev->reg_base[VDEC_HW_MISC];

[Severity: Low]
Is the index VDEC_HW_MISC correct for main_dev->reg_base?=20

It appears main_dev->reg_base is typically indexed by enum mtk_hw_reg_idx
(like VDEC_MISC), while VDEC_HW_MISC belongs to enum mtk_vdec_hw_reg_idx.=20

Even though both currently evaluate to 1 and map correctly, could this cause
issues or point to the wrong hardware registers if the enums drift apart in
future updates?

>  	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D8
