Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB5840910D;
	Wed,  3 Jun 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477183; cv=none; b=XwtiCQ2kjZRXBz0l+i6XQwQyehEKJMxH6UvNwkYyu1kKlbUhC/u/Ox15UJcHOlaJ4COfdr6kTxXQNlC2b7SZBoqEh/4L6QZ79VtQtsUu0P5Ky/aaGyXwiS+lY5HmyOPRMp3dLcficrul4DvQh07LpvPgZ8V4wUeX0oEVl5eJmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477183; c=relaxed/simple;
	bh=fJ57n8I+Aqa5XmtoKkwhHAcVVHosGUkhjMXrPcB6I7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bXrc8dcy7ku0fKjQQQNjEmLlmidJWnbjTIyWHxdoL+ADKm30bQbp14oocE6YM9skVV0zC27tAWYSyAJbT0qsPXoWmqUBxxHAevhA58yAHb5Ta44jYE7mt957P5kVWk2NMKx01yiiX3EEnhOIr/jLGwrNNt12JJl9D4mVzNhxLMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmyBb4ZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmyBb4ZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECB31F00893;
	Wed,  3 Jun 2026 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477182;
	bh=83PwftxZ2L/zX7Xx3plRYeYLk2TIxcw3eMXD4Xgcze0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jmyBb4ZV7PgeD6VserDm7kB4PmVqEtgMYzu4OakVj+2eJGcZ5HoctdE7LmpXWmmFM
	 5ZhAEb/kwsJGvwLUZJJsnx90f+9exI3OW2d5u5uGV3RPkdv4Q634cTTEOA7Vn1oXJ9
	 iXC0lh/CjixeANiVJA3jvC2h6KykcrXD/b3nf6kpDb/UOhk6yz6uRLqHhhbFBNLYMa
	 IjjKR4g147UDaZKMavIQNT8iCuEujqSFNXtQbkW9zNkU2I2Cf4WpycJlBd5pO4PYTH
	 w5TdKI2s9JCFiMo4nbldGBTKPmzoWmOFZryud4E/sNNi8hgov5PgqHnZLEpQ7gBQRK
	 PajGqy8ZJnW8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/14] media: mediatek: vcodec: add decoder
 compatible to support mt8196
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: linux-media@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603084045.17488-13-kyrie.wu@mediatek.com>
References: <20260603084045.17488-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:59:41 +0000
Message-Id: <20260603085942.4ECB31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Patch series breaks git bisect due to usage of undeclared identifie=
r MTK_VDEC_MT8196 before it is defined.
--

commit ea2155f52be3df7e341354e244a5cf63f836a145
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: add decoder compatible to support mt8196

This commit adds the MT8196 compatible string and device data for the
MediaTek vcodec decoder. It also introduces the MTK_VDEC_MT8196 enum value
used to identify the chip.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index 15e437323af5a..53d1708b012b7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
>  	MTK_VDEC_MT8188 =3D 8188,
>  	MTK_VDEC_MT8192 =3D 8192,
>  	MTK_VDEC_MT8195 =3D 8195,
> +	MTK_VDEC_MT8196 =3D 8196,

[Severity: Low]
Does this series break git bisect?

Since MTK_VDEC_MT8196 is first defined here, wouldn't compiling earlier
commits in this series (such as "media: mediatek: vcodec: define MT8196
vcodec levels." or "media: mediatek: vcodec: support 36bit iova address")
fail with an undeclared identifier error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D12
