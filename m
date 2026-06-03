Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C95407565;
	Wed,  3 Jun 2026 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476726; cv=none; b=C6biKdceOhf9qoR/P1JHLso4N0NoEl93PFSN01EbyE6UAjB3gqhElquTGehu8AsiPWUTdmQ4muihXxjWom5pqPyCCYgf00FXFfpsdg6ghlZoNbZdFdrhPs/RViX8ZoNLFWiV/s/bZwFJO2Gbqbfrha399VgKxbS8wLDvOGgXwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476726; c=relaxed/simple;
	bh=lLpMEY8rPC+V6uZFgKvuivl8KgRm8XYK+sYs8iK9YTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iDXIDdebPC1xFZeE5tTKuJysIAXztMh0s9k8pWDIVLQMphBMBE/ZYbVY5LDYH9NGOWvoYorwWiuGNdsVrrwoGXLYKsUXyias5WSHagFa9BIn79EoU7WI11X2ytJ/42vkHQPYgmMTp8rg2KL5oiWjlR9F72GRiMZpwqcNobXPQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7biAZcS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7biAZcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFAC1F00893;
	Wed,  3 Jun 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780476724;
	bh=bew7G2OKTrppOw4VMKrdHkE0XCyHyDdVA93evYg7rsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z7biAZcSt+Xc2Rn+lbz1uqJf0Yd8gzCMoW80genMzF8jzSjilbrplIPAEKsig7w1v
	 GHu8dw0EgMRa8NUhQTq/WtUfXSM4VHPB0eq4thcKBde0cyljSZvsQo0KY9dOnsJ7I0
	 Sk37RF5LVonmVXg+/02vsN4Cf4w1SRQrM360srYCAoKnXZc749gf36TI2/mH9SUA++
	 NTN/vfV3gNygw2NyZ+VnEwnS9tIxKfaXhWRrwu2G72XpP3hIPtMdQmcmk+8Bm3qc/4
	 mUHCBQghFbT+Ujj/oRfOkSwPleIidGmD8Cr+/Q9l295ruUynTODhGN7GbClQPWMeGD
	 2rr8IT9X6MdoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/14] media: mediatek: vcodec: support 36bit iova
 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603084045.17488-8-kyrie.wu@mediatek.com>
References: <20260603084045.17488-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:52:04 +0000
Message-Id: <20260603085204.6CFAC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch references an undeclared identifier `MTK_VDEC_MT8196`, ca=
using a build failure and breaking `git bisect`.
--

commit 1d69905fbcb6b87b34af91dd5fb8d705e10184c1
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: support 36bit iova address

Need to set dma mask to support 36bit iova address for decoder
hardware can use 36bit address to decode for mt8196.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index ce17b649022f7..68759db6f8d1c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -390,6 +390,13 @@ static int mtk_vcodec_probe(struct platform_device *=
pdev)
>  		return -ENODEV;
>  	}
>  	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> +	if (dev->chip_name =3D=3D MTK_VDEC_MT8196) {
                              ^^^^^^^^^^^^^^^

[Severity: Low]
Does this code compile on its own? It appears that MTK_VDEC_MT8196 is not
defined in this commit, which would cause a build failure and break git bis=
ect
at this point in the series.

> +		ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
> +			return ret;
> +		}
> +	}
> =20
>  	dev->fw_handler =3D mtk_vcodec_fw_select(dev, fw_type, DECODER);
>  	if (IS_ERR(dev->fw_handler))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D7
