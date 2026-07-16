Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980030C360;
	Thu, 16 Jul 2026 01:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784163998; cv=none; b=WhE82AMm43yUlT2LJYs7KdDqboi4ru18RPe/11M6MvK+vRI3JdxRYyBuS/1Lrq0V5ycNjLXPgp2309I5SjNalV1ubQWqfihJkT+cec/YSTtmXj2iN+UTEiMzyZST3FP0NSGLGMjcxeSOV96p110zAl+TohV23CS4wOoYyqJ7Eeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784163998; c=relaxed/simple;
	bh=bqNR9ZJv7QXXfU1V/njdCM6xptQN/WYfUHfhPxcD3iY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IPaEFafIC6YtnqWotB/f4A/GlAYnzr0ETN90y1xYu7yX9QJ/ithuz6PPwc/RkMWB1Ro7bbm3LVdttMHGc4td9QQIjtOD7Po5Uk01xpuA8JRdmOUqgN31IPxurobKoP/tyMQWs8hL1Fwcr22J1lhDzozBvaACCHb9ccSVEX3M6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FxFJuIvG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FxFJuIvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784163994;
	bh=bqNR9ZJv7QXXfU1V/njdCM6xptQN/WYfUHfhPxcD3iY=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=FxFJuIvGXxbQnQbm03UDs+WJOLwzlFki7pd5OnTRmcel9Um0cYzf18Vl8WJSPO8tD
	 rRITiW6qcrVf322byw3vlVcsxA8fVrg9eBeQI35fqgyNyjcrLkiQ2TtxbtLNZ4bgwC
	 g8cUaxtnqSWFGvVjnPdrcshupWSLcD75mCyh6DWx/7vOaB45nfR2k9T+2YhcR3XZnX
	 lrZXsNERtZJNPkkqeZr+AETibx9/y5R6hqRpPhkZfBZCYAAmK+xGQe5zMo32E8XbGw
	 VLd5qXy4yNoq5yn8OcyMaNruySmR2z6EZ3L5zweaLbWegQx7hZP4kv20f8hH46JVDB
	 Sc5DMdcmWTuhQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62BBB17E0D7E;
	Thu, 16 Jul 2026 03:06:33 +0200 (CEST)
Message-ID: <a9f7c02f425fc573987c6df9b6f29dc825fcc00d.camel@collabora.com>
Subject: Re: [PATCH] media: mtk-jpeg: drain hardware completion before
 freeing context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Bin Liu
 <bin.liu@mediatek.com>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Fan Wu <fanwu01@zju.edu.cn>,
 Hans Verkuil	 <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Wed, 15 Jul 2026 21:06:32 -0400
In-Reply-To: <20260708120833.755998-1-lgs201920130244@gmail.com>
References: <20260708120833.755998-1-lgs201920130244@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-L7+BV1MucZjJGano7Upk"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-L7+BV1MucZjJGano7Upk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 08 juillet 2026 =C3=A0 20:08 +0800, Guangshuo Li a =C3=A9crit=
=C2=A0:
> The change referenced by the Fixes tag cancels ctx->jpeg_work before
> freeing the JPEG context from mtk_jpeg_release().
>=20
> That prevents a queued or running JPEG worker from dereferencing the
> context after it has been freed. However, on multi-core hardware the
> worker can program a hardware instance, arm the per-hardware timeout
> work, store the context in hw_param.curr_ctx and then return while the
> hardware completion is still pending.
>=20
> In that state cancel_work_sync(&ctx->jpeg_work) can complete even though
> the IRQ handler or timeout work can still recover the same context from
> hw_param.curr_ctx. If userspace closes the file before the hardware
> completion path has run, release can free the context and a later IRQ or
> timeout work can dereference the freed ctx while updating the done queues=
.
>=20
> Drain the in-flight hardware completion state associated with the context
> before freeing it.
>=20
> Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path=
 due to uncancelled work")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Build failed.

https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/104405577

Nicolas

> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483081..bc9eea0483ce 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1202,8 +1202,11 @@ static int mtk_jpeg_release(struct file *file)
> =C2=A0	struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_file_to_ctx(file);
> =C2=A0
> -	if (jpeg->variant->jpeg_worker)
> +	if (jpeg->variant->jpeg_worker) {
> =C2=A0		cancel_work_sync(&ctx->jpeg_work);
> +		mtk_jpeg_release_hw(jpeg, ctx);
> +	}
> +
> =C2=A0	mutex_lock(&jpeg->lock);
> =C2=A0	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);

--=-L7+BV1MucZjJGano7Upk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgumAAKCRDZQZRRKWBy
9I83AQC//JNlw4pOF5tVHOTx8wVP5DSsYqdFYBnW/VELFJ6LUAEAp12APOqTfTir
M3roacvC7P7qPXLSR169wBuUKUduwwY=
=GI4D
-----END PGP SIGNATURE-----

--=-L7+BV1MucZjJGano7Upk--
