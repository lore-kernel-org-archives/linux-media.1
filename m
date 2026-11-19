Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112648;
	b=rA2RogeBxVnl4BmueEIwbQdQhAJPmlFYHPE67BRUf1IC/bQycKcWFvtZOiKmhbPcsCSo
	 VyGqflblMfc0zpNTZrDk/zNpixlKKpHqkFaPHC74sf8bpfu0BCfjaECCF/5L9zMBpWIgS
	 PHxRkUm2pWyTxkAZTYVqh3sLs+PTdugTp5BMX4oQU00wGND03wO+sur09PlLWs6K3Hkem
	 Wsq7J3W358jVA190+kVA8nQ5h++ttYU4JIDPIXEZZ5CNZo0v49zi10UIJlnb7l1rhTx4F
	 GluXoWc4y8j6JaPtmc/QLSEFfU6zsjX3RCno7TlqNoZipRAUTmSVNlKtqZcv7KLIDqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112648;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=kW+Pj0p1KtpwXxHi0eodrtOw0jsU2BRpZepynBVK+Q4=;
	b=plgNWOxlJqrdrh2itaSoWeW4YsEODzMQQ0tn9vMvJuDj50A0extcLR/oM1fWYUZBapyR
	 z8efVRHIih0OeRYkCzfLjwVlAHkxaE6TnHk5YocdZ3sFvhh7XPu3+A9CRr0H3o/H677b8
	 Pk0sxjbFFIZ3rsHfkHoCTfuaebvulX1qg7wxcCAynXrEPX8fHLI3UDdymqyGuAph84N8e
	 K/hSkkB1WSuuBKFznxuSnlron08adqr7WAzbAFp8QGsCvhXfhq4xUITS8yNl1IsPnpyXd
	 XNEr8IA8coz485BB+GI32xVxL/B8VNHYZHn6d/s73Be4/3iWAP6cN1c7oahSYyGLD+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J8DSUV9O;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C335606A325;
	Thu, 19 Nov 2026 18:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C335606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J8DSUV9O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795112645;
	bh=Zk90Z/Y3viDwOI3ZsdQdnBzY5lakoxWPX4l5Ay17998=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=J8DSUV9OGi0zBJ+IaPlC574+FbNpzN+zb2hH4lqo/pZxe1iWjpRO8bZAFH8ayHa2k
	 L8Giq8TQUMzrV1pwd6SGriFiCdv8N0S1K/8eKYuVgx7hdRsc+DI9/0LZKLBVXTBS32
	 +/BKlz6YyHn1C3Pv71iMYxB8FgGZw0rKk4IHiTcpSoHpJjgoqJYYx9iO5Edj3X8Eg/
	 1ggmmNwDbfBZ8cBg4tSD/x+z42BEUGgZcFXk6fB2RelBxllWKTOR5iVQk29D7jHAW1
	 rQSyQ0SfGRT6aUTAuhuj5mNE9U3jigjl0ZaP/qmuVvBXekuRQN+Xf7Uc+FJA/85ZqK
	 /wCdpH4GwjCIw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13D3117E09BC;
	Thu, 19 Nov 2026 19:24:03 +0100 (CET)
Message-ID: <2ae3151d83a9eb8fd567f7c87b722d9afa7dbb92.camel@collabora.com>
Subject: Re: [PATCH 1/3] media: verisilicon: Fix the cleanup when a codec
 ->run() fails
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Hans
 Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 13:24:02 -0500
In-Reply-To: <20260824-rk3588-jpegdec-v1-1-180a30a2852d@pengutronix.de>
References: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
	 <20260824-rk3588-jpegdec-v1-1-180a30a2852d@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-RNSc+2CDpB24BGnucsKa"
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

--=-RNSc+2CDpB24BGnucsKa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 24 ao=C3=BBt 2026 =C3=A0 08:39 +0200, Sascha Hauer a =C3=A9crit=C2=
=A0:
> A codec ->run() operation that fails leaves three things behind, and they
> cannot be untangled one at a time, so fix them together.
>=20
> hantro_start_prepare_run() sets up the controls of the request attached
> to the source buffer, hantro_end_prepare_run() completes them again and
> arms the watchdog for the job that is about to be started. That pairing
> does not survive the error paths. The two ->run() operations that do
> reach hantro_end_prepare_run() arm a watchdog for a job that is never
> started: device_run() finishes the job synchronously via
> hantro_job_finish_no_pm() and nothing cancels the delayed work, so it
> expires two seconds later and aborts whatever unrelated job happens to be
> running by then.
>=20
> Split the two jobs hantro_end_prepare_run() would otherwise have to do.
> It keeps its meaning for the success path, complete the request and arm
> the watchdog, and a new hantro_abort_prepare_run() completes the request
> and nothing else for the error paths. Note the resulting invariant: after
> hantro_end_prepare_run() the ->run() operation must return 0, as the
> watchdog is armed and only the interrupt handler disarms it.
>=20
> rockchip_vpu981_av1_dec_run() then calls hantro_irq_done() on its error
> path and returns the error code to device_run(), which finishes the job a
> second time. The buffers have already been given back by then, so the
> second attempt trips the WARN_ON(!src) in hantro_job_finish_no_pm() and
> bails out. Without the watchdog change this at least reached the first
> finish by accident, because the cancel_delayed_work() in
> hantro_irq_done() returned true for the watchdog the error path had just
> armed. Neither behaviour is something to rely on, so drop the call and
> let device_run() clean the job up. No other codec calls hantro_irq_done()
> from ->run().
>=20
> That leaves device_run() itself. It takes a pm_runtime reference and
> enables the clocks, then on any subsequent failure jumps to a single
> err_cancel_job label that calls hantro_job_finish_no_pm() - which
> releases neither. Release the acquired resources there.
>=20
> This last part is what ties the three together. hantro_irq_done() ends up
> in hantro_job_finish(), which already drops the pm reference and disables
> the clocks, so as long as the AV1 error path still goes through it,
> releasing the same resources in device_run() would trip the
>=20
>   WARN_ON(core->enable_count =3D=3D 0)
>=20
> in clk_core_disable() and underflow dev->power.usage_count. Conversely,
> as soon as a failed job no longer arms the watchdog, hantro_irq_done()
> stops releasing anything at all and the resources are leaked until
> device_run() takes over.
>=20
> The late_postproc setup is skipped on the error path as well. It is part
> of preparing the run, the hardware is not started and the next job
> configures it again, so hantro_abort_prepare_run() simply does not have
> it. Only the sunxi variant sets late_postproc, and its only decoder is
> VP9.
>=20
> Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c    | 35 ++++++++++++++++=
++++--
>  .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  2 +-
>  drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |  3 +-
>  4 files changed, 36 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3b..a9ebf856096e6 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -147,6 +147,18 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx=
)
>  =09}
>  }
> =20
> +/**
> + * hantro_end_prepare_run() - finish the preparation of a job and arm th=
e
> + *=09=09=09      watchdog
> + * @ctx:=09context the job belongs to
> + *
> + * Complete the controls of the request that hantro_start_prepare_run() =
set up
> + * and arm the watchdog. The caller must go on and start the hardware, a=
s only
> + * the interrupt handler disarms the watchdog again.
> + *
> + * A ->run() operation that gives up before the hardware is started must=
 call
> + * hantro_abort_prepare_run() instead.
> + */
>  void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  {
>  =09struct vb2_v4l2_buffer *src_buf;
> @@ -167,6 +179,21 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  =09=09=09      msecs_to_jiffies(2000));
>  }
> =20
> +/**
> + * hantro_abort_prepare_run() - give up on a job before the hardware is =
started
> + * @ctx:=09context the job belongs to
> + *
> + * Counterpart of hantro_end_prepare_run() for the error paths of ->run(=
).
> + */
> +void hantro_abort_prepare_run(struct hantro_ctx *ctx)
> +{
> +=09struct vb2_v4l2_buffer *src_buf;
> +
> +=09src_buf =3D hantro_get_src_buf(ctx);
> +=09v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +=09=09=09=09   &ctx->ctrl_handler);
> +}
> +
>  static void device_run(void *priv)
>  {
>  =09struct hantro_ctx *ctx =3D priv;
> @@ -182,15 +209,19 @@ static void device_run(void *priv)
> =20
>  =09ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->cloc=
ks);
>  =09if (ret)
> -=09=09goto err_cancel_job;
> +=09=09goto err_pm_put;
> =20
>  =09v4l2_m2m_buf_copy_metadata(src, dst);
> =20
>  =09if (ctx->codec_ops->run(ctx))
> -=09=09goto err_cancel_job;
> +=09=09goto err_clk_disable;

Clock handling is now part of the PM ops, so all this complexity is gone no=
w.
I've merge everything else in this patch, thanks.

Nicolas

> =20
>  =09return;
> =20
> +err_clk_disable:
> +=09clk_bulk_disable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> +err_pm_put:
> +=09pm_runtime_put_autosuspend(ctx->dev->dev);
>  err_cancel_job:
>  =09hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
>  }
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/dri=
vers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> index 56c79e339030e..78100d1c7e850 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -895,7 +895,7 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
> =20
>  =09ret =3D start_prepare_run(ctx, &decode_params);
>  =09if (ret) {
> -=09=09hantro_end_prepare_run(ctx);
> +=09=09hantro_abort_prepare_run(ctx);
>  =09=09return ret;
>  =09}
> =20
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/med=
ia/platform/verisilicon/hantro_hw.h
> index 13e573f1f19de..c6addab4d758b 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -431,6 +431,7 @@ void hantro_irq_done(struct hantro_dev *vpu,
>  =09=09     enum vb2_buffer_state result);
>  void hantro_start_prepare_run(struct hantro_ctx *ctx);
>  void hantro_end_prepare_run(struct hantro_ctx *ctx);
> +void hantro_abort_prepare_run(struct hantro_ctx *ctx);
> =20
>  irqreturn_t hantro_g1_irq(int irq, void *dev_id);
>  void hantro_g1_reset(struct hantro_ctx *ctx);
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad373233..99ffb4a743764 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -2192,8 +2192,7 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *=
ctx)
>  =09return 0;
> =20
>  prepare_error:
> -=09hantro_end_prepare_run(ctx);
> -=09hantro_irq_done(vpu, VB2_BUF_STATE_ERROR);
> +=09hantro_abort_prepare_run(ctx);
>  =09return ret;
>  }
> =20

--=-RNSc+2CDpB24BGnucsKa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8+wgAKCRDZQZRRKWBy
9I0bAP0Z5y/n/Eb1+AoLjE/2DUP+EHqmnSkFBIn7VfGyNJCa1gEAiXWEeNOMf5DY
wu/rbRJt0gwgBHWPEkqZXmGe1JvVKAw=
=LuLX
-----END PGP SIGNATURE-----

--=-RNSc+2CDpB24BGnucsKa--
