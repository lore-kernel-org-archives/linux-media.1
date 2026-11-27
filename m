Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805718;
	b=Df+HlWYWUI4dm02OAMLcr1hkhjHNflxUiH065KkzXnJYZ3WWuVC8phyjRSCW5uW9rESu
	 kRsPDW5H+lVqBmA09Qzo3oLgAEKHVk9TDidOuKLlixMqM+bkbE2wOdq2vIj/8BNvLl3EV
	 jlkyqvvaOZ2haw5+BnPzXddfF1AKMmQmL+wLQNOmjRiRA3l3EnCg/YPfIZPkUWB5HLdym
	 Nx5+SurUb8jCP6YeKz4DLg9IvqzPQ2kuTZcfuWHpLF4TNAr7xjUqY5zHPRqkL/8pPaxO4
	 aHg82qjeD78vpvzaztn0gG02D9j4D1ONcSFmcavNeX+EZEWnR4S9FOIsyKJz1lTprRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=ZO8Bdr5hDDShdvk0P9d6O7remcbXsTXZeyombAOOMOg=;
	b=w5Q+hwMNILic3gD4/MLl1O6XaLxw5Ixhb4rMn3e5upf7pjECZiOjk1FOe7grcA8LdfDJ
	 nYpiVkSlg4r1jpXos5x5T01l9FujRJ6BpK5QFZ7JDTCqaVAVzr+iEYcsnbzYhiTtc/BVT
	 x1nxBkdDglZ3YG7bUUp9K4rLZbouAme2/hPcWujTE32P5SEN+fmc4yVROOSKNalS2tPH2
	 bHs2NmuJmLVsQ5fMtUDkOcv5qE9HCoiNmXRd5QG4yBAWcmUz8uoGwZzsvBLiMTz7yaMrS
	 o0dYbEeYP5cOH7DO6Zi+TuyDlDzAtEIrT4VwgELmADoo2tqpxdjmS/T6eBYHCvynaiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VwsfS3Ko;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643D9606A31F
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 18:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643D9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VwsfS3Ko
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55c38cdd5b7so73317901cf.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795805717; x=1796410517; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZO8Bdr5hDDShdvk0P9d6O7remcbXsTXZeyombAOOMOg=;
        b=VwsfS3KoecxervWioLPFOHmPE5XoVYfAH5uckM5W9sCyYmXHn2VLoYIB74c0/z6VXW
         PZau/Jsa3YhQRDE1rzDr6cmsUi1sreVTsa7DtgWIsMfJNQOv0D2eO5AkuX2a9htZzhuA
         +OrEFaXv4T/zdd8nVVPPrK3mCwyY9Bu2rQfs0raD8PHv5ybEFDV7SI/LLgvPLQeuai8D
         b7pcY9t4vpHZ5IomMh9ao3r1yWLWKZIu4wxSTDd8iz57SsEqdbFrRdwll7aT1M1Hmzyi
         PsrPHtBJ0FlRk+em/Iwg/vbhYF405f9f5yWikHtynWLtepPn7SfzBh72APTe/VGEW5sy
         iX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805717; x=1796410517;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZO8Bdr5hDDShdvk0P9d6O7remcbXsTXZeyombAOOMOg=;
        b=Vhdy4o3EbHdKNvAz8bhoRm1/eoEDxYD8FTE/nEIBEuszAqfTlylHhoUuIhYmR3FY8K
         ZTieFU75G7+5R+/ai/YX71mVupkT3Fn5xe2vZymz4XaPFnjjzCFGxxXzr1/XYso8+AOK
         U49cw+T6YKYIsJ0MbQU5jBtFGDRHVtsMuVcu9p0vSoul3raGFmue81O+WjNNSMucfKJS
         KnFfd+xwetIRpvF8wCgwbyqxOSs8ejDHowxG7hZZoyRWwnP0l/F8cyM27vrsWQWmlBXY
         kg37SuN1H+PxrCY4AcqEhYHHvBHPfX9AA2jYGm1s6+uCnMtWEiM57ZGyQoxL2wjXulFf
         mwCA==
X-Forwarded-Encrypted: i=1; AL+hErF0ig1j+kgEN4FDbu+iRYeO1jVjzyLfCVlZUdl/fdHg5ASJQEiY/MsKz2YBftW5I3s4RwoJ05e/sAodWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7XMiIMjz1i2+rEijgYNFLiU5jPn3aUy4hPJGl8csnjt1aM8qi
	gPQtkYgiIhhVByfc/Jmyz8POEUXU1RZhLVHQYaARcGZ/sWte/wXGfgwInwRPh8xHkhE=
X-Gm-Gg: AZFdTZdavGFbhSwrWMsK8QCIMGsCAPhC3cA/uo12e0Zmfh/TOiOQYRHNmDyZ0oYFcax
	4MA+d7OyQSOWZEG29G28uXu2NzZss3irZ+jYwwm+DomDmWkf9E9qSJ+Tk081eCyLvDGe17TrwNq
	vERCX5qgwcF27QZ/2fUm/grN82AFMJLbA1BdaT4WxF7qPmKuAGuytWEiRLIyigEB2X697Nwng3R
	yHVfG1SQXDGWdedVd5noFLjEqfNEEaIC0j+xAo9Asuliey/5lhzY6kEoQOgxxz3TJtCJM6MFOQm
	t4pCiwsmBDp7d3xZHGHMzq61EBmkFPmUN8PK0atbtC0OJzxEKZWTtH7CAr0BoUbMa4xTsRV+zE3
	3vMxrTFG6FZO8J6ZKuqtgI2qRRfT/Cg1w0iaYzAE8jiOFfzo6medz+N3OEOeaymZ2OzjKNBZR8w
	icF9I/j/TdsJJO4lH6+/O/wfM0WgMk+m4XfPNrNculDsxWZuzSTD4I5QlN3iLsex0mWgXdC95Nv
	gZ+1Z7/nZ3iUDEmCOdar5jlBrxr48/Bs8Um2/6fKbDMJU0OyXW8tUQVFfOnzetJHJrML6G1aghE
	1TsYyEOs7Xirl8ReybTauPKyoU3BAldn/VNk1iwVifEKuX0B4yS4gvqP
X-Received: by 2002:a05:622a:1b9f:b0:55c:8389:57f3 with SMTP id d75a77b69052e-55d76a7f1cbmr503259311cf.49.1795805717246;
        Fri, 27 Nov 2026 10:55:17 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dcdd1a2c6sm24950151cf.20.2026.11.27.10.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:55:16 -0800 (PST)
Message-ID: <b51b4c1ce171a77eb452455862d706680d211e71.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: mediatek: vcodec: Validate source buffer
 vaddr in buf_prepare
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fei Shao <fshao@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
	 <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Fri, 27 Nov 2026 13:55:14 -0500
In-Reply-To: <20261127-vcodec-null-va-v3-1-e24521086062@chromium.org>
References: <20261127-vcodec-null-va-v3-1-e24521086062@chromium.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-cH77cGYcAbVXP/0jrHXu"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-cH77cGYcAbVXP/0jrHXu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 27 novembre 2026 =C3=A0 13:37 +0800, Fei Shao a =C3=A9crit=C2=
=A0:
> If an OUTPUT buffer has no kernel mapping, vb2_plane_vaddr() returns
> NULL. Both the stateful and stateless decoder workers only peek the
> source buffer and finish the m2m job without returning it, so the buffer
> stays at the head of the ready list and the same job is scheduled again.
> In the stateless decoder, the media request is also never completed; in
> the stateful decoder, vb2ops_vdec_stateful_buf_queue() also passes the
> source address to vdec_if_decode() without a NULL check.
>=20
> Add a vb2_plane_vaddr() NULL check for OUTPUT buffers in the shared
> vb2ops_vdec_buf_prepare() instead, then remove the late checks from both
> workers. Unmappable buffers are rejected before entering the queue, and
> userspace gets immediate feedback.
>=20
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video D=
ecoder Driver")
> Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put captu=
re buffer flow")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> Changes in v3:
> - Consolidate into a single patch.
>   Validate OUTPUT buffer in shared vb2ops_vdec_buf_prepare() and drop
>   the late checks from both workers per suggestion in v2.
> - Link to v2: https://lore.kernel.org/all/20261023075642.3671805-1-fshao@=
chromium.org/
>=20
> Changes in v2:
> - Call media_request_manual_complete() instead of
>   mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
>   that may be in use by the core workqueue on MediaTek LAT platforms.
> - Link to v1: https://lore.kernel.org/all/20261019060825.4163770-1-fshao@=
chromium.org/
> ---
>  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c   | 8 ++=
+++++-
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c    | 6 --=
----
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 6 --=
----
>  3 files changed, 7 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index d76e891f784b..a5c6b56be927 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -811,8 +811,14 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
>  =09=09=09=09=09  i, vb2_plane_size(vb, i), q_data->sizeimage[i]);
>  =09=09=09return -EINVAL;
>  =09=09}
> -=09=09if (!V4L2_TYPE_IS_OUTPUT(vb->type))
> +=09=09if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
> +=09=09=09if (!vb2_plane_vaddr(vb, i)) {
> +=09=09=09=09mtk_v4l2_vdec_err(ctx, "failed to get vaddr for plane %d", i=
);
> +=09=09=09=09return -EFAULT;

The spec only allow two errors, so I think it should be EINVAL, what do you
think?

https://www.kernel.org/doc/html//latest/userspace-api/media/v4l/vidioc-prep=
are-buf.html#return-value


> +=09=09=09}
> +=09=09} else {
>  =09=09=09vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
> +=09=09}

I would myself do two if, to keep the two separate.


=09=09if (V4L2_TYPE_IS_OUTPUT(vb->type) && !vb2_plane_vaddr(vb, i)) {
=09=09=09mtk_v4l2_vdec_err(ctx, "failed to get vaddr for plane
%d", i);
=09=09=09return -EINVAL;
=09=09}

=09=09if (V4L2_TYPE_IS_CAPTURE (vb->type)
 =09=09=09vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);

Nicolas

>  =09}
> =20
>  =09return 0;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c
> index aa9bdee7a96c..fbd5791e78c1 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -347,12 +347,6 @@ static void mtk_vdec_worker(struct work_struct *work=
)
>  =09buf.va =3D vb2_plane_vaddr(&src_buf->vb2_buf, 0);
>  =09buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>  =09buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
> -=09if (!buf.va) {
> -=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> -=09=09mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!", ctx->id,
> -=09=09=09=09  src_buf->vb2_buf.index);
> -=09=09return;
> -=09}
>  =09mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=3D%=
zx vb=3D%p",
>  =09=09=09  ctx->id, buf.va, &buf.dma_addr, buf.size, src_buf);
>  =09dst_buf->vb2_buf.timestamp =3D src_buf->vb2_buf.timestamp;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index ab1894fba0d9..3d5f9e11a49b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -342,12 +342,6 @@ static void mtk_vdec_worker(struct work_struct *work=
)
>  =09bs_src->va =3D vb2_plane_vaddr(vb2_src, 0);
>  =09bs_src->dma_addr =3D vb2_dma_contig_plane_dma_addr(vb2_src, 0);
>  =09bs_src->size =3D (size_t)vb2_src->planes[0].bytesused;
> -=09if (!bs_src->va) {
> -=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> -=09=09mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d source buffer is NULL", ctx->=
id,
> -=09=09=09=09  vb2_src->index);
> -=09=09return;
> -=09}
> =20
>  =09mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=3D%=
zx vb=3D%p",
>  =09=09=09  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src=
);
>=20
> ---
> base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
> change-id: 20261127-vcodec-null-va-cd0008e9f136

--=-cH77cGYcAbVXP/0jrHXu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawnSEgAKCRDZQZRRKWBy
9GCLAQCDEAyrTgLprsz58hQYBLGjSR9A0s2brlYq+wcnCoXI3gD/TRlIZCzY6Whr
hCii3ApDRHlWxXNWTh1uomfYIOVXXg8=
=wqqh
-----END PGP SIGNATURE-----

--=-cH77cGYcAbVXP/0jrHXu--
