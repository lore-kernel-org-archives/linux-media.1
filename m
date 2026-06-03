Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6F31352B;
	Wed,  3 Jun 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476699; cv=none; b=SnPRyLanTWtPuSXdJRiAShU+3IyRlxsv39IHa3AXqH1+GrEVvu1avx8KL7LwhddcUqp7SjXENkRG+I/TwDKXnPvwQixL/hG/BZ8qvZoUmfGBTvbIA5svEry7MEQBXxlcB/mrzTiVTw+RtW1SHhBTlEtgme4D356yn3Wdn663QM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476699; c=relaxed/simple;
	bh=sLCb58xHcmUPPHSuiF6yEHJYQdG2XeWO0/DadmKfVGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gfCumiw4kc4lI5jcHKABOQFv+92b6b7ZSo963+56gudC+b8Gw09zhQgDLPx7EDitVriE07uAzurBkEByujVO5YUvYeG2j7HELtsw0vIx34LzvPIAZIXieiNHmEjP39hDqsefX7Mywo+6xVNeedbau0B5lzFzWakfGEhIKYB81cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEKYEpk5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEKYEpk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAAE1F00893;
	Wed,  3 Jun 2026 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780476698;
	bh=ky+0PlcbE3OJcEuQIILClQcfknl4nIFL032gCd7KIqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEKYEpk5l7DZe9W2+zJ+QI8V6kShMNt2EV0GHN1pe9/FdTwvC6THTNJ98+J50etYf
	 HaF5yRnzTZdZaL7BytOxp4/JsaUrUKShp6L6Y3BRMrF+8+qtuqG2it52GtQuK3Jlgl
	 jCV/qtdLu6dXCsHSSn3/r/UA8NL6e8dPIX5RkOGb5WmleqDANCYirx7eH6TTLGxKrc
	 qzLZs8fXrFNT6HiTmVU/k14jGpJkKg3ZBTlR4AAPQUtD/Fq0QDpCpcRa9lZqrWaxFI
	 6zLCKdFZEDPpyinfyVZzu9r6w7t5cs5yu+zP3OKxKWP0A45sBwYqhIhwTwqgdC3slt
	 BYQVZZxCo++xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/14] media: mediatek: vcodec: define MT8196 vcodec
 levels.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603084045.17488-7-kyrie.wu@mediatek.com>
References: <20260603084045.17488-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:51:37 +0000
Message-Id: <20260603085137.CFAAE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces the undeclared identifier `MTK_VDEC_MT8196` be=
fore it is defined, causing a compilation error and breaking `git bisect`.
--

commit 918de5bcb94623dd2782fada54c8dcb18dc11b48
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: define MT8196 vcodec levels.

The patch updates various vcodec control configuration functions to add
support for the MT8196 chip by setting the maximum profiles and levels for
H264, HEVC, and VP9.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index ab1894fba0d90..472ece5713a56 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -577,6 +577,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l=
2_ctrl_config *cfg,
>  		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
>  		break;
>  	case MTK_VDEC_MT8195:
> +	case MTK_VDEC_MT8196:

[Severity: Low]
Does this introduce a build break for git bisect?

The MTK_VDEC_MT8196 identifier appears to be undeclared at this point in the
commit history. While it is fixed later in the series by the commit "media:
mediatek: vcodec: add decoder compatible to support mt8196", using the
identifier before it is defined will cause compilation errors and break git
bisect.

>  		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
>  		break;
>  	case MTK_VDEC_MT8183:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D6
