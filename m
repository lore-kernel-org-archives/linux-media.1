Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190201;
	b=1idWnoYG8/NSAOLGugbSsQGl2PfoLtXeoNsZ/4JDZ9XwHgvGPdVTE3NdfVpCbYmfLhQJ
	 GPvOcj/yaRXlk+cYp16HGq6LRM0TrnrRNHicrGV/18NOEP/mVwgXlldRYTjVySyz11ubm
	 OHgN51Ny91hN3RmtW34Pl3RH3/rfKZXdYU42M8moKrGWIHDLuwGcfZgWnmpB29P3j6v4o
	 xuHwaFHwiuGkDpRVDignQ7EY0Jb+y0nKaA8YwZtUUeKOJVyXOG/GbIkGLy6MKL6izF2zG
	 41FKU5KhPMo5LtZ6brWMyYpjYq21s5V3bMTjK8WH7nh9atPWfRkvdarKXxIEEDbjtcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190201;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=13HW4zm8NwsNgl3wxtGEDqYYSojdZV0q/tC3icDpDsQ=;
	b=GZw7yPRDR0wkg/gJ6oTIsECYf9H4T3AKItGKnFGaifBWpn79ifRItx/gfvObdzFR2uq7
	 LhwsBXrH0S8DlMk3bsvrpWdIIsVTkUhOC/58qUtbctySXA2k0geLMdYnelJErSdswsFFQ
	 7J1li0UjNRR0mIJHn6jFT2Upj7sgMdh1sRkNS7dbB4VumQaJSSZXw9+hwo5ytfM76eF8b
	 q/EhU+kHKgtTOj0ImXjeGUz3RJv+4jwu9ix0TVIzPiq+6ke4MttXkSGJZjzfB6MJXMyoD
	 N9Jc9VX1eteuG4GU80yD0TI1z4mN3G3sTVu1/uw5I3P1b0DRMIQilPrWn6CN5C9/72Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=efuPj1Ja;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D827606A32A;
	Fri, 20 Nov 2026 15:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D827606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=efuPj1Ja
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 44E4B200467;
	Fri, 20 Nov 2026 16:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795190198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13HW4zm8NwsNgl3wxtGEDqYYSojdZV0q/tC3icDpDsQ=;
	b=efuPj1JaYz/jfypVgUsBs+gkDBU6dzfHG+/VGgVqwPYciJYKGCPkC7HhAeGOKUL6zszO1m
	p6m6NOO6kDeTvTJ3OGj2jN5JTl7OluLObzh2VC2+9dm9i8J7DLiEpWSuXAlMOFUbj8A2yF
	oTVzwj5J5uJXIvckLwHNkVaZ4ACBSQd1dpa8wttEIw3QOhCdGmASRk7tQ/XBX8xDklB8+K
	6LHL1b14DuK9iCp2yji5F7K8mwiyi0p28RLlLx0PG02de+laid72ZsbkqfDBcxCyxulKkI
	P4iRjDAO9a1du48kWvmTsmNhmKYh6Zf6xYHb7HCjt4BaA8yZOCFZGcs2fLHrXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795190198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13HW4zm8NwsNgl3wxtGEDqYYSojdZV0q/tC3icDpDsQ=;
	b=FOU6WgBpFLeNjq+OH2wODnHcYJUTMj7dIYJngiIQGW2exAjZmHbtv//jo64LJVqNNghmKb
	HOESv6ddxOCWyul8W8txbSmyDY1i9T/T/siMyD4SJU7kOgOjrCcnpOVq6FgojHwsd5o2nu
	i5FoJIsAnnpZ/ka2rnl9GgHZj0tcx1HnSiF8wgzxHRLw3/sJ2hsO1dthzBCA88ema/ZyTS
	c+vJ2YmBNVP7gYQgfe7DWuyjhsSFzizRlFkU77mbDzE97/GfAQ6vEoOsdbQSHPWZLu+W21
	xVe7SJomIp4a3hOZadkx1pUH+I4xtgtgaIIBoh109ga97iwD8xzHNdIp6lV2LA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795190198; a=rsa-sha256;
	cv=none;
	b=OTRMvaH9H936y7zdB3qnIK3TT0uUmtTjjITsUi5Usnihll672NEi1ruAAQZandla7b6eeO
	hGpZaDxWTdFfr3iWZQinx4+3eTYKJdkVPfhzu88yYqVlak1H98g11ioMzZgxelAHLhtWtg
	TAvd1kUtxSvRP6YwFDRAYqDK9AR0nEeJe7cND7O2J0VzzS3TPzxf5XVG3dOnUIKntQxttK
	6OObb+r0p47Bye1/EDwk3JL7yjaUWJZkQXzZImNV98uQVYykdOzqexfnMIKalOIeCjHgrx
	w7bfc1+ItwHzTiglWUmALAX5Sai90r0lwlzAa3TS0IHVUA/7GEApCujemARCww==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <dca17004d6cd81f66ebadc0a227548a4e558f2df.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/7] media: verisilicon: AV1: Use alloc/free helpers
 for auxiliary buffers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	nicolas.dufresne@collabora.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 16:56:38 +0100
In-Reply-To: <20261120151345.88802-3-benjamin.gaignard@collabora.com>
References: <20261120151345.88802-1-benjamin.gaignard@collabora.com>
	 <20261120151345.88802-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fr, 2026-11-20 at 16:13 +0100, Benjamin Gaignard wrote:
> Simplify and clean up the code by using the helpers.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/platform/verisilicon/hantro_av1.c   | 177 ++++--------------
>  1 file changed, 39 insertions(+), 138 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/me=
dia/platform/verisilicon/hantro_av1.c
> index 2cde32f0e935..e05816c7dfa3 100644
> --- a/drivers/media/platform/verisilicon/hantro_av1.c
> +++ b/drivers/media/platform/verisilicon/hantro_av1.c
> @@ -235,40 +235,17 @@ size_t hantro_av1_chroma_size(struct hantro_ctx *ct=
x)
> =20
>  static void hantro_av1_tiles_free(struct hantro_ctx *ctx)
>  {
> -	struct hantro_dev *vpu =3D ctx->dev;
>  	struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
> =20
> -	if (av1_dec->db_data_col.cpu)
> -		dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
> -				  av1_dec->db_data_col.cpu,
> -				  av1_dec->db_data_col.dma);
> -	av1_dec->db_data_col.cpu =3D NULL;
> -
> -	if (av1_dec->db_ctrl_col.cpu)
> -		dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
> -				  av1_dec->db_ctrl_col.cpu,
> -				  av1_dec->db_ctrl_col.dma);
> -	av1_dec->db_ctrl_col.cpu =3D NULL;
> -
> -	if (av1_dec->cdef_col.cpu)
> -		dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
> -				  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
> -	av1_dec->cdef_col.cpu =3D NULL;
> -
> -	if (av1_dec->sr_col.cpu)
> -		dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
> -				  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
> -	av1_dec->sr_col.cpu =3D NULL;
> -
> -	if (av1_dec->lr_col.cpu)
> -		dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
> -				  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
> -	av1_dec->lr_col.cpu =3D NULL;
> +	hantro_free_aux_buf(ctx, &av1_dec->db_data_col);
> +	hantro_free_aux_buf(ctx, &av1_dec->db_ctrl_col);
> +	hantro_free_aux_buf(ctx, &av1_dec->cdef_col);
> +	hantro_free_aux_buf(ctx, &av1_dec->sr_col);
> +	hantro_free_aux_buf(ctx, &av1_dec->lr_col);
>  }
> =20
>  static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
>  {
> -	struct hantro_dev *vpu =3D ctx->dev;
>  	struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
>  	struct hantro_av1_dec_ctrls *ctrls =3D &av1_dec->ctrls;
>  	const struct v4l2_av1_tile_info *tile_info =3D &ctrls->frame->tile_info=
;
> @@ -277,6 +254,7 @@ static int hantro_av1_tiles_reallocate(struct hantro_=
ctx *ctx)
>  	unsigned int height_in_sb =3D height / 64;
>  	unsigned int stripe_num =3D ((height + 8) + 63) / 64;
>  	size_t size;
> +	int ret;
> =20
>  	if (av1_dec->db_data_col.size >=3D
>  	    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
> @@ -285,44 +263,22 @@ static int hantro_av1_tiles_reallocate(struct hantr=
o_ctx *ctx)
>  	hantro_av1_tiles_free(ctx);
> =20
>  	size =3D ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols;
> -	av1_dec->db_data_col.cpu =3D dma_alloc_coherent(vpu->dev, size,
> -						      &av1_dec->db_data_col.dma,
> -						      GFP_KERNEL);
> -	if (!av1_dec->db_data_col.cpu)
> -		goto buffer_allocation_error;
> -	av1_dec->db_data_col.size =3D size;
> +	ret =3D hantro_allocate_aux_buf(ctx, &av1_dec->db_data_col, size);
> =20
>  	size =3D ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
> -	av1_dec->db_ctrl_col.cpu =3D dma_alloc_coherent(vpu->dev, size,
> -						      &av1_dec->db_ctrl_col.dma,
> -						      GFP_KERNEL);
> -	if (!av1_dec->db_ctrl_col.cpu)
> -		goto buffer_allocation_error;
> -	av1_dec->db_ctrl_col.size =3D size;
> +	ret |=3D hantro_allocate_aux_buf(ctx, &av1_dec->db_ctrl_col, size);

Please don't |=3D error return values. Even if it happens to work here
because hantro_allocate_aux_buf() is guaranteed to return the same
error, it may inspire others to copy this in places where it's invalid.

Further, hantro_allocate_aux_buf() looks like it can return -EINVAL and
-ENOMEM, not sure if that can happen inside reallocate. That would
combine into -ENOENT, which makes no sense to return.

regards
Philipp
