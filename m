Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE041CB3F;
	Mon, 27 Jul 2026 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167914; cv=pass; b=s22QyaFdfvkm/wDufRWikYvgTDRa/h2RDyei53ktCK+KiNqtQ/sGkJ12Uj2IlN1KKQylxqu4lfKC/ngfvCNJcUwpaZVyMl9rdLYnKw7f4bSAzMv/BvhFUrCHadtMsEFf9fG1OtxsjgOcLma1SVpW0njyfYqWIpjWPK9WMCfeG/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167914; c=relaxed/simple;
	bh=3K98K6lCYiZXfiy+Ry2m+I7nBXAQF5gQRKPA1M9zIbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p2iqjY1P7HO+vyWAaoZ5ykBOUjtjKMpBnWFnyQ0Qc9poDib1hbt4WsO3vJ+0oWpRdnWh0CSI5DwsmEUUhF7Xf96aezzOngYXrTK1P5mgJw6Ju22mfw7feoTHCn5PwieNotCP1lXVCo8wixgfO217ZeLCI+k7wPrRkY1SdAJoi/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=YC3N2N9O; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="YC3N2N9O"
ARC-Seal: i=1; a=rsa-sha256; t=1785167901; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d8zZ9UX2zp2QPopT1k7QDq1kW/lQybmuIFYY4cni+yVhSUcdCfvUR9REWyU0xzjcN/ZwngpScp3aS0IDj8Bc1M/reBndeMfNbAIna5ahLRaL4OCCFpAEJf6a26Ut4sDu/ydinqi5+aifb1ZvXZV5xziocd68W03ip1/jPaBLvYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785167901; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wQdFBRo1TdSpxhGnQZqut65bQkPaCXrpPvYuJKTdUcs=; 
	b=PJcqBWyL/lZ3oM0JFedFk8v4RbLYkAXz0qDPXQRl1tfWDi6RSifOSm+0HIQa90NRmES/A8eJICkAxx0vGVqRgTvvcI2Aoe9c9RLuJttAthsveixa0KbBj30P0OabONCe1PP8ZpRsKu55PPsuFUJRaQl+9pHhod6nYmRzQX1XI8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785167901;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wQdFBRo1TdSpxhGnQZqut65bQkPaCXrpPvYuJKTdUcs=;
	b=YC3N2N9OWM8ivM8DM354VhFSyHScwRxUZqwYrwL1eGhWfSKUgj0kKNZGdDtTeQdi
	puAihjPHQuqzg0YfXnHWEEDeDISIk3UacUVji07nNNPnm4LiIAsXzdzJCbf/6+l/NkB
	arXwCrXU0xOHNzvtG7DgjVkKN5xMy4aGJe+pxYWI=
Received: by mx.zohomail.com with SMTPS id 1785167897880403.5570477012601;
	Mon, 27 Jul 2026 08:58:17 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Igor Paunovic <royalnet026@gmail.com>,
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>,
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Subject:
 Re: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in
 rkvdec_fill_decoded_pixfmt()
Date: Mon, 27 Jul 2026 11:58:15 -0400
Message-ID: <cb8XVJu6RUmEjMZpl7NA1g@collabora.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
References:
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi !

On Sunday, 26 July 2026 16:25:37 EDT Venkata Atchuta Bheemeswara Sarma Darbha 
wrote:
> From: Igor Paunovic <royalnet026@gmail.com>
> 
> Ensure bytesperline is 64-byte aligned and scale sizeimage accordingly.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha
> <vdarbha0473@gmail.com> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> 436bb460f04e..6ab6530b1cc9 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct
> rkvdec_ctx *ctx, struct v4l2_pix_format_mplane *pix_mp)
>  {
>  	const struct rkvdec_variant *variant = ctx->dev->variant;
> +	struct v4l2_plane_pix_format *plane = &pix_mp->plane_fmt[0];
> +	u32 aligned_bpl;
> 
>  	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
> pix_mp->height);
> 
> -	ctx->colmv_offset = pix_mp->plane_fmt[0].sizeimage;
> +	/* ensure bpl is 64 byte aligned and scale sizeimage accordingly. 
*/
> +	aligned_bpl = ALIGN(plane->bytesperline, 64);
> +	if (aligned_bpl != plane->bytesperline) {
> +		plane->sizeimage = plane->sizeimage / plane-
>bytesperline * aligned_bpl;
> +		plane->bytesperline = aligned_bpl;
> +	}

This shouldn't be needed. As you set step_width to 64, 
v4l2_apply_frmsize_constraints() should already do the alignment.

Do you have more context as to when width is not aligned ?

> 
> -	pix_mp->plane_fmt[0].sizeimage += variant->ops->colmv_size(pix_mp-
>width,
> pix_mp->height); +	ctx->colmv_offset = plane->sizeimage;
> +	plane->sizeimage += variant->ops->colmv_size(pix_mp->width,
> pix_mp->height); }
> 
>  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,

Regards,
Detlev.



