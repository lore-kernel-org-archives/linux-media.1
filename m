Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720677;
	b=Iy9NlzQwn75+jeE7mRccNl04kzhlyyKiSTR0kAYpklu/h2F/sI7oMEBLkxZJ0wiW2ilT
	 UQwGgZ/PMh4AbxNoi4hL7N2jIu9m/pfJhlwVA7/Db8VITex9fTi4YKmZyPNC2I1wKd1xT
	 DzmTZTmoUi+3arEekYz4pTcHXrDQgKSudisybf5jW5+rg8kTtPDL5AvVHHnvFSF7Zsu/O
	 tFlM/fi7j4uoBsXT+huMhUoQOt+0vWCRy3vx9NKXQ/59H5OH0VpBSHMtUcTTNVYeeykgT
	 VqMDYid3UzQ5A8ZPqFLu/KXtGNlM8eFrv8sZnVcz0VX/vO9nsby+R9cmJ4yL6oKgzBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=;
	b=ovx16n40eVFeZKynn//VDKqvYi84K5H5Qw85MfKMG+4S7ZD16xCCvUnCzuM6oB/zkE8r
	 CbmH+wSc0oh1CyTrrKFgQatSP3DYx7kIsRrX9707P0JBjeONNfstxcIBXcM3OvHYnCcxB
	 vA36FBni0Imul1EDGe8EDny+dQQ9rnTZquq0lR6p6cwX4QUvaCvakTu22lB022y/lqmmh
	 GwC8maHSDcwIvFTfmrjHjY5Yd8ccluS3dDvb0K4gDfk4hGVWfWiAE5VHn2wVM75hZ/wPU
	 OnyNfVy74pg4w4hYr2SbpLfkqBW83mIKlUeEvHw7aQNcqHEHPxY57ncz4J0piQlAINg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pe2daaaG;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC8606A321
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 19:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDC8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pe2daaaG
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55c38cdd5b7so60633801cf.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795720675; x=1796325475; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=;
        b=pe2daaaGJp7uEf7xh9RtFYzylRRVXtqhAWVOceByYbXtwrCG+WTSsM8eAur5wzwDFj
         IEsbo/OB10N5fx5dmNSu6UDaQUUBUSVUUeyVr1MV1KUgXOTdkmzxCQbeEVW5Z0CHENAE
         Bapj8N9oqKThBCsT7HVHYi1FYptoJrIQtzkuWGl9wKc+YbvCbuKJIoBrKrvi+fo9TNKI
         HpZmzIPtlhQEm6zEKAuvdOOc0c9SzfKXv1wZAXXPYJLQbaBpJYH6NG2yrBJbv8IuwN19
         /W45G69JE/q9qWjT2qXQPRT5PLlJ7BTd3Xj0mJeQIezHTvSTyiLuXfU/UnvSEJKn0yHo
         e5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720675; x=1796325475;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=;
        b=Fgdg8h9PfzMN2NHHHhHF9+hCmHHYXbBm3P5c8gMQScZDI86YtSNI8/lmQLYkyp2wJI
         2f37UiWkCgMO6yuyXe6D5yLzrfXAzMFnDl5icYs8KfwyoCOBmiEu1N0gOzVhEh4U2i1N
         3DQ+fcJIokV71TyWBqCHzbl7Jj2M0Hk0jfgrdYR6sBx7EqbvIvrNxPF2Hhi73ad/1iEF
         XUX/Ejx1ovaTHYI3k3BeYPxM/lR8UspxnDK2HaIcZ9F6u5RCe28w2siqz17t20NXbFT/
         lf9KCQCbxbDdkv9JIOdWel04ibaOhq5MM3n0fquTzYvOqKco17Bm0PbLK5zoQaCzk7BL
         lp0A==
X-Forwarded-Encrypted: i=1; AL+hErEZJQ/6chFXI+jYapM6uZb9MH5EVjYaGyX7goJQf8w9mY6jSeP3qdQQhmz00mVh7M5VaftgC0d1uKfHpQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9r5jeY7vLfc93izgk2sgNLsqROzgvLxrKk09GxfVgRWKUQOX2f
	Jw2HJ7tSpHbJ9YfVY/E8oYGoWnAWFPzi3fZRN1iKdK8GtH4ZgaHbpSDNm935uRs/FJc=
X-Gm-Gg: AZFdTZc5NypBVKKf8C0XvF5sGHuQasbSe6i/nI2lHALtYjduHe1EDKiL6IBu2AQyKQC
	bunVY7devG98bX36Ag+ruwaz4zxBdb79Gfegk+VumbHQgL5o1hCtOdnRF4a0+vfxan6aVkCNqYm
	CI/dfMkFjBinaSyoE2b8RD6Fpuejwmwe0sNuZQN6Duf73ovCxljCME/qOHHtm+owBhVan5V9Rv1
	cw7q4FA+pXkgPiSFxD7hIvflXXajZZd3/36Ehae4mJ48yq3LtSBwlZMKZ9d8uJW4Lkn8Icb4+22
	bah2UNgGMELlotng8xLSYKA9jz6+ehwDNfAckLp31ua4af1xJDGshw2oHLuyEtmTvNT27WykToA
	inV1D6+VTOy4aqgz0ks+XlnWhmx2mPFt4k+c4HWGSIm1OzPZVTPQC9cP/18DrfOIfM3kxp6bTkj
	k1575SE6uPpAfYWh5f3uG8hPNurhFslymFTrDCb8LTMvKhl6LVCIiF8GR2fxcL87Ow1e9h9c1wM
	EIR3zHFsGMN68WieikRaauIIaq9IlsDJVzRD7/40msAXNvFWs3qOMiG05At6iSIWr7GfEO1oCHj
	lOjJMA0XgGPySP37nNlLF3PhXqVlhQMp1zgLlOMy7outCr1ApJK8MHQQGxwv3ij9lUW5h5UzD/J
	K
X-Received: by 2002:ac8:5f06:0:b0:535:1f03:32aa with SMTP id d75a77b69052e-55d76a78d2emr425610731cf.45.1795720675469;
        Thu, 26 Nov 2026 11:17:55 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dc8895beesm11592841cf.11.2026.11.26.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:17:54 -0800 (PST)
Message-ID: <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on
 NULL va in stateful decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fei Shao <fshao@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 26 Nov 2026 14:17:52 -0500
In-Reply-To: <20261023075642.3671805-2-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
	 <20261023075642.3671805-2-fshao@chromium.org>
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
	protocol="application/pgp-signature"; boundary="=-Cs4W2QVf/4yjYY3PWWkw"
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

--=-Cs4W2QVf/4yjYY3PWWkw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fei,

sorry for the delay, so many patches...

Le vendredi 23 octobre 2026 =C3=A0 15:55 +0800, Fei Shao a =C3=A9crit=C2=A0=
:
> mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
> If vb2_plane_vaddr() returns NULL because the buffer has no kernel
> mapping, the worker finishes the m2m job with the buffer still at the
> head of the ready list. v4l2_m2m_job_finish() then schedules the same
> job again, which fails the same way, so the decoder never makes
> progress.
>=20
> Remove the buffer from the ready list so that the job is not scheduled
> again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
> back. Print the error before that, as the buffer must not be touched
> once it is returned.
>=20
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video D=
ecoder Driver")
> Signed-off-by: Fei Shao <fshao@chromium.org>
>=20
> ---
>=20
> (no changes since v1)
>=20
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c
> index aa9bdee7a96c..a4cbb7c76998 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *work=
)
>  =09buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>  =09buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
>  =09if (!buf.va) {
> -=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>  =09=09mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!", ctx->id,
>  =09=09=09=09  src_buf->vb2_buf.index);
> +=09=09v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +=09=09v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);

I did some research as all this felt very late and defensive. My conclusion=
 is
that you should validate this in vb2ops_vdec_buf_prepare() (mtk_vcodec_dec.=
c).
This will let you remove this defensive check. Buffers that failed to map (=
or
unmappable/protected memory?) will simply not endup in the queue. It will a=
lso
give an immediate feedback to userspace.

Nicolas

>  =09=09return;
>  =09}
>  =09mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=3D%=
zx vb=3D%p",

--=-Cs4W2QVf/4yjYY3PWWkw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiF4AAKCRDZQZRRKWBy
9BhnAP9oifXvKzRb69nGyfhqcckUcFDLX9lh723xc36dI1jn7gD+LWpi2JJDuPSx
muyGT9ledNYAcMj5WUk5fyPOM9A0uQQ=
=GEUe
-----END PGP SIGNATURE-----

--=-Cs4W2QVf/4yjYY3PWWkw--
