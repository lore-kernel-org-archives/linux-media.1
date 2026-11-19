Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111124;
	b=neWKTVBqRilNC+D0gfwcv6Dzx7OAUBqsu7GsteztIDTVW1neaJSrBrKc0TPzJFVDOzUL
	 voXYbF3u7wErC2oFu1rr18ilKekOij9t1DlNMawlapyIEJn49alShbsuYK0DHZpozKGKi
	 GFewHPqVLOqMOCXxMjsURLMfWQjJgvYFmyerT68nPTecZnxsSYTjW6MscsEecFBswjphx
	 oh0D0BB+Wrqs5Z5v8XUiR/kVAG5LoCpNfve82HANkKA0SttQjopIu+5YPhv6+Vvc/AE+X
	 S1dmDjKfmHF9Z+MKi5ScJr1b2YT5CqXxIN2Oi3dmY8bUBq3G9Q45shBlnxZHes43Sjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111124;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=uSCrGmqO9DuJnzuA382xhCFUepgTnCCOuS4HOxYFnVY=;
	b=U0JktXPQ/GJGJAM3qtZ5rAhBwGajE0w8g4hq9fhMNd5fXRI3xc0x6z4e/imzh2Mhoxhu
	 5tdINinHQfhkBg7ye7jM2+QTFZuMraUEtPPxIMzTR1Ipja67A5iIeTUPdPuRBzHJpChRU
	 fJBlhs1s6rgQgK/XLRUdSoqOfoA+eM6kcdM6WbhqJ2Od6ghxkjisONlz+xKfKVLw9KPCw
	 ZTsyfzcdilhFZ572JMqlWm3wWIXpog/zZBykCmLFxYpTnv1afr5u414K4NGBpfTbaIQrC
	 dGww+b7LpjsDo5VHZq/cdWBFvSP2WkWf6G3dOcmUZfOdv0XRHNCmkgeCdZH/RO1ms6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=maAuJm5r;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB3606C05C;
	Thu, 19 Nov 2026 17:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEB3606C05C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=maAuJm5r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795111121;
	bh=rHiNQSxxeZsaesrRA36nJf3mKINz1kOOnDLlzlWBntk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=maAuJm5rtJ7+tLA4eZ1XAHJPl8EAdMBh30zTd/eqmjlXml0+GOHWdj4sVvq8aoDa4
	 +qz/wOZg/SkbdCDzyY+fK6N9oJEZhdNEMIOH0zKExcrPefex5C0xGnfMK8hK0MWwMO
	 EJQ33RGE3ZKFqrIHnbnOImzmubFHL8tGn5TBKF/eQv0k4cC6RD4ZkNiHLOqS7X3ubJ
	 LfuyYPjEVv07z0umTgjn+KzuXWBGgO1p4XuJrdwLXkBVCLcAvfZneCtN/feLPGR2Az
	 dOlYovll+qDtv1wS4Yf4RIzxJO32QzINsJ9fyXdTqOsFt7aIlBuVW99bYpANx8x3nm
	 Xdqb0PyGNSyPQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DDBE17E02F2;
	Thu, 19 Nov 2026 18:58:39 +0100 (CET)
Message-ID: <c0e155b0a64e193572f33d13d58b2492ceafa601.camel@collabora.com>
Subject: Re: [PATCH v2 4/5] media: rkvdec: Split into core and master
 platform drivers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, 
	kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 12:58:37 -0500
In-Reply-To: <20260810-rkvdec-multicore-v2-4-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
	 <20260810-rkvdec-multicore-v2-4-986f89d22cdc@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-t5b+/OxG8YxqfU/QJT+F"
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

--=-t5b+/OxG8YxqfU/QJT+F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> Prepare the driver for multi-core support by restructuring around the
> component framework, based on what rga does.

Add a blank between paragraph.

> This commit only adds the plumbing and does not yet enable more
> than a single core to run (Each additionnal core adding will return
> -EBUSY).
>=20
> Core specific resources are moved to a rkvdec_core struct and rkvdec_dev
> only retains v4l2 device info, variant info and the main_core pointer.
>=20
> Even though only 1 core is being used, a core pointer is added to the
> rkvdec_ctx struct to prepare the variant backends to retrieve information
> based on the core selected for the job.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  17 +-
>  .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  16 +-
>  .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  61 +--
>  .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |   7 +-
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  24 +-
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  24 +-
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  24 +-
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  26 +-
>  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  27 +-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 506 ++++++++++++++-=
------
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  23 +-
>  11 files changed, 472 insertions(+), 283 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-h264.c
> index ffa606038192..d3841dc84d35 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> @@ -227,6 +227,7 @@ static void set_poc_reg(struct rkvdec_regs *regs, uin=
t32_t poc, int id, bool bot
>  static void config_registers(struct rkvdec_ctx *ctx,
>  =09=09=09     struct rkvdec_h264_run *run)
>  {
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode=
_params;
>  =09const struct v4l2_ctrl_h264_sps *sps =3D run->sps;
> @@ -333,7 +334,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
>  =09offset =3D offsetof(struct rkvdec_h264_priv_tbl, err_info);
>  =09regs->h26x.errorinfo_base =3D priv_start_addr + offset;
> =20
> -=09rkvdec_memcpy_toio(rkvdec->regs, regs,
> +=09rkvdec_memcpy_toio(core->regs, regs,
>  =09=09=09   MIN(sizeof(*regs), sizeof(u32) * rkvdec->variant->num_regs))=
;
>  }
> =20
> @@ -358,7 +359,7 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
>  =09if (!h264_ctx)
>  =09=09return -ENOMEM;
> =20
> -=09priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +=09priv_tbl =3D dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_=
tbl),
>  =09=09=09=09      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
>  =09if (!priv_tbl) {
>  =09=09ret =3D -ENOMEM;
> @@ -383,7 +384,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
>  =09struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -=09dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
> +=09dma_free_coherent(rkvdec->main_core->dev, h264_ctx->priv_tbl.size,
>  =09=09=09  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
>  =09kfree(h264_ctx);
>  }
> @@ -391,7 +392,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
>  static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  {
>  =09struct v4l2_h264_reflist_builder reflist_builder;
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
>  =09struct rkvdec_h264_run run;
>  =09struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
> @@ -413,15 +414,15 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> =20
>  =09rkvdec_run_postamble(ctx, &run.base);
> =20
> -=09schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000))=
;
> +=09schedule_delayed_work(&core->watchdog_work, msecs_to_jiffies(2000));
> =20
> -=09writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> -=09writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> +=09writel(1, core->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> +=09writel(1, core->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> =20
>  =09/* Start decoding! */
>  =09writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
>  =09       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
> -=09       rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +=09       core->regs + RKVDEC_REG_INTERRUPT);
> =20
>  =09return 0;
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> index 87abf93dfd5e..c9d0913e90ee 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> @@ -381,6 +381,7 @@ static void assemble_sw_rps(struct rkvdec_ctx *ctx,
>  static void config_registers(struct rkvdec_ctx *ctx,
>  =09=09=09     struct rkvdec_hevc_run *run)
>  {
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09const struct v4l2_ctrl_hevc_decode_params *decode_params =3D run->dec=
ode_params;
>  =09const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> @@ -477,7 +478,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
>  =09offset =3D offsetof(struct rkvdec_hevc_priv_tbl, rps);
>  =09regs->h26x.rps_base =3D priv_start_addr + offset;
> =20
> -=09rkvdec_memcpy_toio(rkvdec->regs, regs,
> +=09rkvdec_memcpy_toio(core->regs, regs,
>  =09=09=09   MIN(sizeof(*regs), sizeof(u32) * rkvdec->variant->num_regs))=
;
>  }
> =20
> @@ -511,7 +512,7 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
>  =09if (!hevc_ctx)
>  =09=09return -ENOMEM;
> =20
> -=09priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +=09priv_tbl =3D dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_=
tbl),
>  =09=09=09=09      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
>  =09if (!priv_tbl) {
>  =09=09kfree(hevc_ctx);
> @@ -532,13 +533,14 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx=
)
>  =09struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -=09dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
> +=09dma_free_coherent(rkvdec->main_core->dev, hevc_ctx->priv_tbl.size,
>  =09=09=09  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
>  =09kfree(hevc_ctx);
>  }
> =20
>  static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  {
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09struct rkvdec_hevc_run run;
>  =09struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> @@ -555,10 +557,10 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> =20
>  =09rkvdec_run_postamble(ctx, &run.base);
> =20
> -=09schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000))=
;
> +=09schedule_delayed_work(&core->watchdog_work, msecs_to_jiffies(2000));
> =20
> -=09writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> -=09writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> +=09writel(1, core->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> +=09writel(1, core->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> =20
>  =09if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
>  =09=09rkvdec_quirks_disable_qos(ctx);
> @@ -568,7 +570,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  =09=090 : RKVDEC_WR_DDR_ALIGN_EN;
>  =09writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
>  =09       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E | reg,
> -=09       rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +=09       core->regs + RKVDEC_REG_INTERRUPT);
> =20
>  =09return 0;
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> index 191f78278c01..44df5b6df80c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> @@ -29,38 +29,37 @@ static size_t rkvdec_rcb_size(const struct rcb_size_i=
nfo *size_info,
> =20
>  dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id)
>  {
> -=09return ctx->rcb_config->rcb_bufs[id].dma;
> +=09return ctx->core->rcb_config->rcb_bufs[id].dma;
>  }
> =20
>  size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id)
>  {
> -=09return ctx->rcb_config->rcb_bufs[id].size;
> +=09return ctx->core->rcb_config->rcb_bufs[id].size;
>  }
> =20
>  int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
>  {
> -=09return ctx->rcb_config->rcb_count;
> +=09return ctx->core->rcb_config->rcb_count;
>  }
> =20
>  bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_rcb_config *cfg =3D ctx->rcb_config;
> +=09struct rkvdec_rcb_config *cfg =3D ctx->core->rcb_config;
> =20
>  =09bool ret =3D cfg && cfg->height >=3D ctx->decoded_fmt.fmt.pix_mp.heig=
ht &&
>  =09=09   cfg->width >=3D ctx->decoded_fmt.fmt.pix_mp.width;
> =20
>  =09if (!ret && cfg) {
> -=09=09dev_dbg(ctx->dev->dev, "RCB size %ux%u -> %ux%u\n", cfg->width, cf=
g->height,
> +=09=09dev_dbg(ctx->core->dev, "RCB size %ux%u -> %ux%u\n", cfg->width, c=
fg->height,
>  =09=09=09ctx->decoded_fmt.fmt.pix_mp.width, ctx->decoded_fmt.fmt.pix_mp.=
height);
>  =09}
> =20
>  =09return ret;
>  }
> =20
> -void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
> +void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core=
)
>  {
> -=09struct rkvdec_dev *dev =3D ctx->dev;
> -=09struct rkvdec_rcb_config *cfg =3D ctx->rcb_config;
> +=09struct rkvdec_rcb_config *cfg =3D core->rcb_config;
>  =09unsigned long virt_addr;
>  =09int i;
> =20
> @@ -77,12 +76,13 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
>  =09=09case RKVDEC_ALLOC_SRAM:
>  =09=09=09virt_addr =3D (unsigned long)cfg->rcb_bufs[i].cpu;
> =20
> -=09=09=09if (dev->iommu_domain)
> -=09=09=09=09iommu_unmap(dev->iommu_domain, virt_addr, rcb_size);
> -=09=09=09gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
> +=09=09=09if (iommu_get_domain_for_dev(core->dev))
> +=09=09=09=09iommu_unmap(iommu_get_domain_for_dev(core->dev),
> +=09=09=09=09=09    virt_addr, rcb_size);


Also, see
https://lore.kernel.org/all/70ed0df5a04b11d8dcfe41d91e86fc28dedcb132.camel@=
collabora.com/
where I suggest to port to dma api. I mean, its not like the page table of =
SRAM
is going to move, but I also don't see why we have to use iommu_map/unmap()=
, so
if not, better clean that up now.

> +=09=09=09gen_pool_free(core->sram_pool, virt_addr, rcb_size);
>  =09=09=09break;
>  =09=09case RKVDEC_ALLOC_DMA:
> -=09=09=09dma_free_coherent(dev->dev,
> +=09=09=09dma_free_coherent(rkvdec->main_core->dev,
>  =09=09=09=09=09  rcb_size,
>  =09=09=09=09=09  cfg->rcb_bufs[i].cpu,
>  =09=09=09=09=09  cfg->rcb_bufs[i].dma);
> @@ -91,33 +91,33 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
>  =09}
> =20
>  =09if (cfg->rcb_bufs)
> -=09=09devm_kfree(dev->dev, cfg->rcb_bufs);
> +=09=09devm_kfree(core->dev, cfg->rcb_bufs);
> =20
> -=09devm_kfree(dev->dev, cfg);
> +=09devm_kfree(core->dev, cfg);
> =20
> -=09ctx->rcb_config =3D NULL;
> +=09core->rcb_config =3D NULL;
>  }
> =20
> -int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
> +int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *c=
ore,
> +=09=09=09u32 width, u32 height,
>  =09=09=09const struct rcb_size_info *size_info,
>  =09=09=09size_t rcb_count)
>  {
>  =09int ret, i;
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09struct rkvdec_rcb_config *cfg;
> =20
>  =09if (!size_info || !rcb_count) {
> -=09=09ctx->rcb_config =3D NULL;
> +=09=09core->rcb_config =3D NULL;
>  =09=09return 0;
>  =09}
> =20
> -=09ctx->rcb_config =3D devm_kzalloc(rkvdec->dev, sizeof(*ctx->rcb_config=
), GFP_KERNEL);
> -=09if (!ctx->rcb_config)
> +=09core->rcb_config =3D devm_kzalloc(core->dev, sizeof(*core->rcb_config=
), GFP_KERNEL);
> +=09if (!core->rcb_config)
>  =09=09return -ENOMEM;
> =20
> -=09cfg =3D ctx->rcb_config;
> +=09cfg =3D core->rcb_config;
> =20
> -=09cfg->rcb_bufs =3D devm_kzalloc(rkvdec->dev, sizeof(*cfg->rcb_bufs) * =
rcb_count, GFP_KERNEL);
> +=09cfg->rcb_bufs =3D devm_kzalloc(core->dev, sizeof(*cfg->rcb_bufs) * rc=
b_count, GFP_KERNEL);
>  =09if (!cfg->rcb_bufs) {
>  =09=09ret =3D -ENOMEM;
>  =09=09goto err_alloc;
> @@ -133,25 +133,26 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32=
 width, u32 height,
>  =09=09enum rkvdec_alloc_type alloc_type =3D RKVDEC_ALLOC_SRAM;
> =20
>  =09=09/* Try allocating an SRAM buffer */
> -=09=09if (ctx->dev->sram_pool) {
> -=09=09=09if (rkvdec->iommu_domain)
> +=09=09if (core->sram_pool) {
> +=09=09=09if (iommu_get_domain_for_dev(core->dev))
>  =09=09=09=09rcb_size =3D ALIGN(rcb_size, SZ_4K);
> =20
> -=09=09=09cpu =3D gen_pool_dma_zalloc_align(ctx->dev->sram_pool,
> +=09=09=09cpu =3D gen_pool_dma_zalloc_align(core->sram_pool,
>  =09=09=09=09=09=09=09rcb_size,
>  =09=09=09=09=09=09=09&dma,
>  =09=09=09=09=09=09=09SZ_4K);
>  =09=09}
> =20
>  =09=09/* If an IOMMU is used, map the SRAM address through it */
> -=09=09if (cpu && rkvdec->iommu_domain) {
> +=09=09if (cpu && iommu_get_domain_for_dev(core->dev)) {
>  =09=09=09unsigned long virt_addr =3D (unsigned long)cpu;
>  =09=09=09phys_addr_t phys_addr =3D dma;
> =20
> -=09=09=09ret =3D iommu_map(rkvdec->iommu_domain, virt_addr, phys_addr,
> +=09=09=09ret =3D iommu_map(iommu_get_domain_for_dev(core->dev),
> +=09=09=09=09=09virt_addr, phys_addr,
>  =09=09=09=09=09rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
>  =09=09=09if (ret) {
> -=09=09=09=09gen_pool_free(ctx->dev->sram_pool,
> +=09=09=09=09gen_pool_free(core->sram_pool,
>  =09=09=09=09=09      (unsigned long)cpu,
>  =09=09=09=09=09      rcb_size);
>  =09=09=09=09cpu =3D NULL;
> @@ -168,7 +169,7 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 w=
idth, u32 height,
>  ram_fallback:
>  =09=09/* Fallback to RAM */
>  =09=09if (!cpu) {
> -=09=09=09cpu =3D dma_alloc_coherent(ctx->dev->dev,
> +=09=09=09cpu =3D dma_alloc_coherent(rkvdec->main_core->dev,
>  =09=09=09=09=09=09 rcb_size,
>  =09=09=09=09=09=09 &dma,
>  =09=09=09=09=09=09 GFP_KERNEL);
> @@ -191,7 +192,7 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 w=
idth, u32 height,
>  =09return 0;
> =20
>  err_alloc:
> -=09rkvdec_free_rcb(ctx);
> +=09rkvdec_free_rcb(rkvdec, core);
> =20
>  =09return ret;
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> index 0662a4359bdf..d1149afe7fda 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> @@ -8,7 +8,9 @@
> =20
>  #include <linux/types.h>
> =20
> +struct rkvdec_dev;
>  struct rkvdec_ctx;
> +struct rkvdec_core;
> =20
>  enum rcb_axis {
>  =09PIC_WIDTH =3D 0,
> @@ -20,11 +22,12 @@ struct rcb_size_info {
>  =09enum rcb_axis axis;
>  };
> =20
> -int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
> +int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *c=
ore,
> +=09=09=09u32 width, u32 height,
>  =09=09=09const struct rcb_size_info *size_info,
>  =09=09=09size_t rcb_count);
>  dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
>  size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
>  int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
>  bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
> -void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
> +void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core=
);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
> index b961fddc8583..667c5d36f3ea 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
> @@ -185,22 +185,22 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =20
>  static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> =20
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_COMMON_REGS,
>  =09=09=09   &h264_ctx->regs.common,
>  =09=09=09   sizeof(h264_ctx->regs.common));
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_CODEC_PARAMS_REGS,
>  =09=09=09   &h264_ctx->regs.h264_param,
>  =09=09=09   sizeof(h264_ctx->regs.h264_param));
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_COMMON_ADDR_REGS,
>  =09=09=09   &h264_ctx->regs.common_addr,
>  =09=09=09   sizeof(h264_ctx->regs.common_addr));
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_CODEC_ADDR_REGS,
>  =09=09=09   &h264_ctx->regs.h264_addr,
>  =09=09=09   sizeof(h264_ctx->regs.h264_addr));
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_POC_HIGHBIT_REGS,
>  =09=09=09   &h264_ctx->regs.h264_highpoc,
>  =09=09=09   sizeof(h264_ctx->regs.h264_highpoc));
>  }
> @@ -368,7 +368,6 @@ static void config_registers(struct rkvdec_ctx *ctx,
> =20
>  static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09struct rkvdec_h264_priv_tbl *priv_tbl;
>  =09struct rkvdec_h264_ctx *h264_ctx;
>  =09struct v4l2_ctrl *ctrl;
> @@ -387,7 +386,7 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
>  =09if (!h264_ctx)
>  =09=09return -ENOMEM;
> =20
> -=09priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +=09priv_tbl =3D dma_alloc_coherent(ctx->dev->main_core->dev, sizeof(*pri=
v_tbl),
>  =09=09=09=09      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
>  =09if (!priv_tbl) {
>  =09=09ret =3D -ENOMEM;
> @@ -410,9 +409,8 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
>  static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
>  {
>  =09struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -=09dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
> +=09dma_free_coherent(ctx->dev->main_core->dev, h264_ctx->priv_tbl.size,
>  =09=09=09  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
>  =09kfree(h264_ctx);
>  }
> @@ -420,7 +418,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
>  static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  {
>  =09struct v4l2_h264_reflist_builder reflist_builder;
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
>  =09struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
>  =09struct rkvdec_h264_run run;
> @@ -443,10 +441,10 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> =20
>  =09rkvdec_run_postamble(ctx, &run.base);
> =20
> -=09rkvdec_schedule_watchdog(rkvdec, h264_ctx->regs.common.reg032_timeout=
_threshold);
> +=09rkvdec_schedule_watchdog(core, h264_ctx->regs.common.reg032_timeout_t=
hreshold);
> =20
>  =09/* Start decoding! */
> -=09writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
> +=09writel(VDPU381_DEC_E_BIT, core->regs + VDPU381_REG_DEC_E);
> =20
>  =09return 0;
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> index fe6414a17551..bd68120b74c6 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> @@ -356,22 +356,22 @@ static void set_ref_valid(struct rkvdec_vdpu381_reg=
s_hevc *regs, int id, u32 val
> =20
>  static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> =20
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_COMMON_REGS,
>  =09=09=09   &hevc_ctx->regs.common,
>  =09=09=09   sizeof(hevc_ctx->regs.common));
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_CODEC_PARAMS_REGS,
>  =09=09=09   &hevc_ctx->regs.hevc_param,
>  =09=09=09   sizeof(hevc_ctx->regs.hevc_param));
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_COMMON_ADDR_REGS,
>  =09=09=09   &hevc_ctx->regs.common_addr,
>  =09=09=09   sizeof(hevc_ctx->regs.common_addr));
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_CODEC_ADDR_REGS,
>  =09=09=09   &hevc_ctx->regs.hevc_addr,
>  =09=09=09   sizeof(hevc_ctx->regs.hevc_addr));
> -=09rkvdec_memcpy_toio(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
> +=09rkvdec_memcpy_toio(core->regs + OFFSET_POC_HIGHBIT_REGS,
>  =09=09=09   &hevc_ctx->regs.hevc_highpoc,
>  =09=09=09   sizeof(hevc_ctx->regs.hevc_highpoc));
>  }
> @@ -555,7 +555,7 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
>  =09if (!hevc_ctx)
>  =09=09return -ENOMEM;
> =20
> -=09priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +=09priv_tbl =3D dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_=
tbl),
>  =09=09=09=09      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
>  =09if (!priv_tbl) {
>  =09=09ret =3D -ENOMEM;
> @@ -580,14 +580,14 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx=
)
>  =09struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -=09dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
> +=09dma_free_coherent(rkvdec->main_core->dev, hevc_ctx->priv_tbl.size,
>  =09=09=09  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
>  =09kfree(hevc_ctx);
>  }
> =20
>  static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_hevc_run run;
>  =09struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
>  =09struct rkvdec_hevc_priv_tbl *tbl =3D hevc_ctx->priv_tbl.cpu;
> @@ -604,7 +604,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  =09 */
>  =09if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
>  =09    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
> -=09=09dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set=
\n");
> +=09=09dev_warn_ratelimited(core->dev, "Long and short term RPS not set\n=
");
>  =09} else {
>  =09=09rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
>  =09}
> @@ -613,10 +613,10 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> =20
>  =09rkvdec_run_postamble(ctx, &run.base);
> =20
> -=09rkvdec_schedule_watchdog(rkvdec, hevc_ctx->regs.common.reg032_timeout=
_threshold);
> +=09rkvdec_schedule_watchdog(core, hevc_ctx->regs.common.reg032_timeout_t=
hreshold);
> =20
>  =09/* Start decoding! */
> -=09writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
> +=09writel(VDPU381_DEC_E_BIT, ctx->core->regs + VDPU381_REG_DEC_E);
> =20
>  =09return 0;
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> index 5ec755733916..a737a7799b71 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> @@ -216,19 +216,19 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =20
>  static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> =20
> -=09rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_REGS,
> +=09rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_COMMON_REGS,
>  =09=09=09   &h264_ctx->regs.common,
>  =09=09=09   sizeof(h264_ctx->regs.common));
> -=09rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
> +=09rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
>  =09=09=09   &h264_ctx->regs.common_addr,
>  =09=09=09   sizeof(h264_ctx->regs.common_addr));
> -=09rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
> +=09rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
>  =09=09=09   &h264_ctx->regs.h26x_params,
>  =09=09=09   sizeof(h264_ctx->regs.h26x_params));
> -=09rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
> +=09rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
>  =09=09=09   &h264_ctx->regs.h26x_addr,
>  =09=09=09   sizeof(h264_ctx->regs.h26x_addr));
>  }
> @@ -380,7 +380,7 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
>  =09if (!h264_ctx)
>  =09=09return -ENOMEM;
> =20
> -=09priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +=09priv_tbl =3D dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_=
tbl),
>  =09=09=09=09      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
>  =09if (!priv_tbl) {
>  =09=09ret =3D -ENOMEM;
> @@ -406,7 +406,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
>  =09struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -=09dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
> +=09dma_free_coherent(rkvdec->main_core->dev, h264_ctx->priv_tbl.size,
>  =09=09=09  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
>  =09kfree(h264_ctx);
>  }
> @@ -414,7 +414,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
>  static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  {
>  =09struct v4l2_h264_reflist_builder reflist_builder;
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
>  =09struct rkvdec_h264_run run;
>  =09struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
> @@ -439,12 +439,12 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  =09rkvdec_run_postamble(ctx, &run.base);
> =20
>  =09timeout_threshold =3D h264_ctx->regs.common.reg013_core_timeout_thres=
hold;
> -=09rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> +=09rkvdec_schedule_watchdog(core, timeout_threshold);
> =20
>  =09/* Start decoding! */
> -=09writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHO=
LD);
> -=09writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> -=09writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_DEC_ENABLE);
> +=09writel(timeout_threshold, core->link + VDPU383_LINK_TIMEOUT_THRESHOLD=
);
> +=09writel(0, core->link + VDPU383_LINK_IP_ENABLE);
> +=09writel(VDPU383_DEC_E_BIT, core->link + VDPU383_LINK_DEC_ENABLE);
> =20
>  =09return 0;
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> index 3575338a531a..2862231b17f2 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -323,19 +323,19 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =20
>  static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_hevc_ctx *h265_ctx =3D ctx->priv;
> =20
> -=09rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_REGS,
> +=09rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_COMMON_REGS,
>  =09=09=09   &h265_ctx->regs.common,
>  =09=09=09   sizeof(h265_ctx->regs.common));
> -=09rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
> +=09rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
>  =09=09=09   &h265_ctx->regs.common_addr,
>  =09=09=09   sizeof(h265_ctx->regs.common_addr));
> -=09rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
> +=09rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
>  =09=09=09   &h265_ctx->regs.h26x_params,
>  =09=09=09   sizeof(h265_ctx->regs.h26x_params));
> -=09rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
> +=09rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
>  =09=09=09   &h265_ctx->regs.h26x_addr,
>  =09=09=09   sizeof(h265_ctx->regs.h26x_addr));
>  }
> @@ -505,7 +505,7 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
>  =09if (!hevc_ctx)
>  =09=09return -ENOMEM;
> =20
> -=09priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +=09priv_tbl =3D dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_=
tbl),
>  =09=09=09=09      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
>  =09if (!priv_tbl) {
>  =09=09ret =3D -ENOMEM;
> @@ -530,14 +530,14 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx=
)
>  =09struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -=09dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
> +=09dma_free_coherent(rkvdec->main_core->dev, hevc_ctx->priv_tbl.size,
>  =09=09=09  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
>  =09kfree(hevc_ctx);
>  }
> =20
>  static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_hevc_run run;
>  =09struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
>  =09struct rkvdec_hevc_priv_tbl *tbl =3D hevc_ctx->priv_tbl.cpu;
> @@ -552,7 +552,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  =09 */
>  =09if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
>  =09    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
> -=09=09dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\=
n");
> +=09=09dev_err_ratelimited(core->dev, "Long and short term RPS not set\n"=
);
>  =09=09return -EINVAL;
>  =09}
> =20
> @@ -566,12 +566,12 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  =09rkvdec_run_postamble(ctx, &run.base);
> =20
>  =09timeout_threshold =3D hevc_ctx->regs.common.reg013_core_timeout_thres=
hold;
> -=09rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> +=09rkvdec_schedule_watchdog(core, timeout_threshold);
> =20
>  =09/* Start decoding! */
> -=09writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHO=
LD);
> -=09writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> -=09writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_DEC_ENABLE);
> +=09writel(timeout_threshold, core->link + VDPU383_LINK_TIMEOUT_THRESHOLD=
);
> +=09writel(VDPU383_IP_CRU_MODE, core->link + VDPU383_LINK_IP_ENABLE);
> +=09writel(VDPU383_DEC_E_BIT, core->link + VDPU383_LINK_DEC_ENABLE);
> =20
>  =09return 0;
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index 2751f5396ee8..0b7d6b29bcfa 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -482,6 +482,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
>  =09struct rkvdec_vp9_ctx *vp9_ctx =3D ctx->priv;
>  =09struct rkvdec_regs *regs =3D &vp9_ctx->regs;
>  =09const struct v4l2_vp9_segmentation *seg;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09dma_addr_t addr;
>  =09bool intra_only;
> @@ -657,18 +658,19 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =20
>  =09regs->vp9.reg44.strmd_error_e =3D 0xe;
> =20
> -=09rkvdec_memcpy_toio(rkvdec->regs, regs,
> +=09rkvdec_memcpy_toio(core->regs, regs,
>  =09=09=09   MIN(sizeof(*regs), sizeof(u32) * rkvdec->variant->num_regs))=
;
>  }
> =20
>  static int validate_dec_params(struct rkvdec_ctx *ctx,
>  =09=09=09       const struct v4l2_ctrl_vp9_frame *dec_params)
>  {
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09unsigned int aligned_width, aligned_height;
> =20
>  =09/* We only support profile 0. */
>  =09if (dec_params->profile !=3D 0) {
> -=09=09dev_err(ctx->dev->dev, "unsupported profile %d\n",
> +=09=09dev_err(core->dev, "unsupported profile %d\n",
>  =09=09=09dec_params->profile);
>  =09=09return -EINVAL;
>  =09}
> @@ -682,7 +684,7 @@ static int validate_dec_params(struct rkvdec_ctx *ctx=
,
>  =09 */
>  =09if (aligned_width !=3D ctx->decoded_fmt.fmt.pix_mp.width ||
>  =09    aligned_height !=3D ctx->decoded_fmt.fmt.pix_mp.height) {
> -=09=09dev_err(ctx->dev->dev,
> +=09=09dev_err(core->dev,
>  =09=09=09"unexpected bitstream resolution %dx%d\n",
>  =09=09=09dec_params->frame_width_minus_1 + 1,
>  =09=09=09dec_params->frame_height_minus_1 + 1);
> @@ -768,6 +770,7 @@ static int rkvdec_vp9_run_preamble(struct rkvdec_ctx =
*ctx,
> =20
>  static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
>  {
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09struct rkvdec_vp9_run run =3D { };
>  =09int ret;
> @@ -786,10 +789,10 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
> =20
>  =09rkvdec_run_postamble(ctx, &run.base);
> =20
> -=09schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000))=
;
> +=09schedule_delayed_work(&core->watchdog_work, msecs_to_jiffies(2000));
> =20
> -=09writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> -=09writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> +=09writel(1, core->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> +=09writel(1, core->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> =20
>  =09if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
>  =09=09rkvdec_quirks_disable_qos(ctx);
> @@ -797,7 +800,7 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
>  =09/* Start decoding! */
>  =09writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
>  =09       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
> -=09       rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +=09       core->regs + RKVDEC_REG_INTERRUPT);
> =20
>  =09return 0;
>  }
> @@ -979,7 +982,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
>  =09ctx->priv =3D vp9_ctx;
> =20
>  =09BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 1=
28-bit aligned */
> -=09priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +=09priv_tbl =3D dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_=
tbl),
>  =09=09=09=09      &vp9_ctx->priv_tbl.dma, GFP_KERNEL);
>  =09if (!priv_tbl) {
>  =09=09ret =3D -ENOMEM;
> @@ -989,7 +992,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
>  =09vp9_ctx->priv_tbl.size =3D sizeof(*priv_tbl);
>  =09vp9_ctx->priv_tbl.cpu =3D priv_tbl;
> =20
> -=09count_tbl =3D dma_alloc_coherent(rkvdec->dev, RKVDEC_VP9_COUNT_SIZE,
> +=09count_tbl =3D dma_alloc_coherent(rkvdec->main_core->dev, RKVDEC_VP9_C=
OUNT_SIZE,
>  =09=09=09=09       &vp9_ctx->count_tbl.dma, GFP_KERNEL);
>  =09if (!count_tbl) {
>  =09=09ret =3D -ENOMEM;
> @@ -1003,7 +1006,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
>  =09return 0;
> =20
>  err_free_priv_tbl:
> -=09dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
> +=09dma_free_coherent(rkvdec->main_core->dev, vp9_ctx->priv_tbl.size,
>  =09=09=09  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
> =20
>  err_free_ctx:
> @@ -1016,9 +1019,9 @@ static void rkvdec_vp9_stop(struct rkvdec_ctx *ctx)
>  =09struct rkvdec_vp9_ctx *vp9_ctx =3D ctx->priv;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -=09dma_free_coherent(rkvdec->dev, vp9_ctx->count_tbl.size,
> +=09dma_free_coherent(rkvdec->main_core->dev, vp9_ctx->count_tbl.size,
>  =09=09=09  vp9_ctx->count_tbl.cpu, vp9_ctx->count_tbl.dma);
> -=09dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
> +=09dma_free_coherent(rkvdec->main_core->dev, vp9_ctx->priv_tbl.size,
>  =09=09=09  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
>  =09kfree(vp9_ctx);
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index db2731af06cf..d3b13132b751 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -11,12 +11,14 @@
> =20
>  #include <linux/hw_bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/component.h>
>  #include <linux/genalloc.h>
>  #include <linux/interrupt.h>
>  #include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> @@ -652,14 +654,11 @@ static int rkvdec_enum_framesizes(struct file *file=
, void *priv,
>  static int rkvdec_querycap(struct file *file, void *priv,
>  =09=09=09   struct v4l2_capability *cap)
>  {
> -=09struct rkvdec_dev *rkvdec =3D video_drvdata(file);
>  =09struct video_device *vdev =3D video_devdata(file);
> =20
> -=09strscpy(cap->driver, rkvdec->dev->driver->name,
> -=09=09sizeof(cap->driver));
> +=09strscpy(cap->driver, "rkvdec", sizeof(cap->driver));
>  =09strscpy(cap->card, vdev->name, sizeof(cap->card));
> -=09snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> -=09=09 rkvdec->dev->driver->name);
> +=09snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:rkvdec");
>  =09return 0;
>  }
> =20
> @@ -1026,8 +1025,6 @@ static void rkvdec_stop_streaming(struct vb2_queue =
*q)
> =20
>  =09=09if (desc->ops->stop)
>  =09=09=09desc->ops->stop(ctx);
> -
> -=09=09rkvdec_free_rcb(ctx);
>  =09}
> =20
>  =09rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
> @@ -1062,26 +1059,28 @@ static const struct media_device_ops rkvdec_media=
_ops =3D {
>  };
> =20
>  static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
> -=09=09=09=09    enum vb2_buffer_state result)
> +=09=09=09=09  enum vb2_buffer_state result)
>  {
> +=09struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +=09struct v4l2_m2m_dev *m2m_dev =3D m2m_ctx->m2m_dev;
> +
>  =09if (ctx->coded_fmt_desc->ops->done) {
>  =09=09struct vb2_v4l2_buffer *src_buf, *dst_buf;
> =20
> -=09=09src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> -=09=09dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +=09=09src_buf =3D v4l2_m2m_next_src_buf(m2m_ctx);
> +=09=09dst_buf =3D v4l2_m2m_next_dst_buf(m2m_ctx);
>  =09=09ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
>  =09}
> =20
> -=09v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
> -=09=09=09=09=09 result);
> +=09v4l2_m2m_buf_done_and_job_finish(m2m_dev, m2m_ctx, result);
>  }
> =20
>  static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
> -=09=09=09      enum vb2_buffer_state result)
> +=09=09=09    enum vb2_buffer_state result)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09pm_runtime_mark_last_busy(ctx->core->dev);
> +=09pm_runtime_put_autosuspend(ctx->core->dev);


Since we modify its default domain, so basically call into the core0 iommu,
should be also make sure core0 is up, or does the iommu driver handles it
independently?

p.s. didn't take the time to check the DT here

> =20
> -=09pm_runtime_put_autosuspend(rkvdec->dev);
>  =09rkvdec_job_finish_no_pm(ctx, result);
>  }
> =20
> @@ -1112,14 +1111,14 @@ void rkvdec_run_postamble(struct rkvdec_ctx *ctx,=
 struct rkvdec_run *run)
> =20
>  void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09u32 reg;
> =20
>  =09/* Set undocumented swreg_block_gating_e field */
> -=09reg =3D readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> +=09reg =3D readl(core->regs + RKVDEC_REG_QOS_CTRL);
>  =09reg &=3D GENMASK(31, 16);
>  =09reg |=3D 0xEFFF;
> -=09writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> +=09writel(reg, core->regs + RKVDEC_REG_QOS_CTRL);
>  }
> =20
>  void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len)
> @@ -1131,40 +1130,42 @@ void rkvdec_memcpy_toio(void __iomem *dst, void *=
src, size_t len)
>  #endif
>  }
> =20
> -void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_thr=
eshold)
> +void rkvdec_schedule_watchdog(struct rkvdec_core *core, u32 timeout_thre=
shold)
>  {
>  =09/* Set watchdog at 2 times the hardware timeout threshold */
>  =09u32 watchdog_time;
> -=09unsigned long axi_rate =3D clk_get_rate(rkvdec->axi_clk);
> +=09unsigned long axi_rate =3D clk_get_rate(core->axi_clk);
> =20
>  =09if (axi_rate)
>  =09=09watchdog_time =3D 2 * div_u64(1000 * (u64)timeout_threshold, axi_r=
ate);
>  =09else
>  =09=09watchdog_time =3D 2000;
> =20
> -=09schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchd=
og_time));
> +=09schedule_delayed_work(&core->watchdog_work, msecs_to_jiffies(watchdog=
_time));
>  }
> =20
>  static void rkvdec_device_run(void *priv)
>  {
>  =09struct rkvdec_ctx *ctx =3D priv;
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09const struct rkvdec_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
>  =09int ret;
> =20
>  =09if (WARN_ON(!desc))
>  =09=09return;
> =20
> -=09ret =3D pm_runtime_resume_and_get(rkvdec->dev);
> +=09ctx->core =3D ctx->dev->main_core;
> +=09ctx->core->curr_ctx =3D ctx;
> +
> +=09ret =3D pm_runtime_resume_and_get(ctx->core->dev);
>  =09if (ret < 0) {
>  =09=09rkvdec_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
>  =09=09return;
>  =09}
> =20
>  =09if (!rkvdec_rcb_buf_validate_size(ctx)) {
> -=09=09rkvdec_free_rcb(ctx);
> +=09=09rkvdec_free_rcb(ctx->dev, ctx->core);
> =20
> -=09=09ret =3D rkvdec_allocate_rcb(ctx,
> +=09=09ret =3D rkvdec_allocate_rcb(ctx->dev, ctx->core,
>  =09=09=09=09=09  ctx->decoded_fmt.fmt.pix_mp.width,
>  =09=09=09=09=09  ctx->decoded_fmt.fmt.pix_mp.height,
>  =09=09=09=09=09  ctx->dev->variant->rcb_sizes,
> @@ -1340,10 +1341,11 @@ static const struct v4l2_file_operations rkvdec_f=
ops =3D {
>  static int rkvdec_v4l2_init(struct rkvdec_dev *rkvdec)
>  {
>  =09int ret;
> +=09struct device *dev =3D rkvdec->main_core->dev;
> =20
> -=09ret =3D v4l2_device_register(rkvdec->dev, &rkvdec->v4l2_dev);
> +=09ret =3D v4l2_device_register(dev, &rkvdec->v4l2_dev);
>  =09if (ret) {
> -=09=09dev_err(rkvdec->dev, "Failed to register V4L2 device\n");
> +=09=09dev_err(dev, "Failed to register V4L2 device\n");
>  =09=09return ret;
>  =09}
> =20
> @@ -1354,7 +1356,7 @@ static int rkvdec_v4l2_init(struct rkvdec_dev *rkvd=
ec)
>  =09=09goto err_unregister_v4l2;
>  =09}
> =20
> -=09rkvdec->mdev.dev =3D rkvdec->dev;
> +=09rkvdec->mdev.dev =3D dev;
>  =09strscpy(rkvdec->mdev.model, "rkvdec", sizeof(rkvdec->mdev.model));
>  =09strscpy(rkvdec->mdev.bus_info, "platform:rkvdec",
>  =09=09sizeof(rkvdec->mdev.bus_info));
> @@ -1420,9 +1422,9 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *=
rkvdec)
>  =09v4l2_device_unregister(&rkvdec->v4l2_dev);
>  }
> =20
> -static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
> +static void rkvdec_iommu_restore(struct rkvdec_core *core)
>  {
> -=09if (rkvdec->empty_domain) {
> +=09if (core->empty_domain) {
>  =09=09/*
>  =09=09 * To rewrite mapping into the attached IOMMU core, attach a new e=
mpty domain that
>  =09=09 * will program an empty table, then detach it to restore the defa=
ult domain and
> @@ -1430,29 +1432,29 @@ static void rkvdec_iommu_restore(struct rkvdec_de=
v *rkvdec)
>  =09=09 * This is safely done in this interrupt handler to make sure no m=
emory get mapped
>  =09=09 * through the IOMMU while the empty domain is attached.
>  =09=09 */
> -=09=09iommu_attach_device(rkvdec->empty_domain, rkvdec->dev);
> -=09=09iommu_detach_device(rkvdec->empty_domain, rkvdec->dev);
> +=09=09iommu_attach_device(core->empty_domain, core->dev);
> +=09=09iommu_detach_device(core->empty_domain, core->dev);

On second core, that will restore the second core default domain, which is =
also
empty. At least for the second core, you have to explicitly attach the main=
 core
default domain. It should be possible to just attach the empty domain, atta=
ch
the main core default domain regardless.

nit: Remember this is a hack, we should plan on having a call or ops into t=
he
rkiommu driver to signal that we (or the IP) operated a soft reset.

>  =09}
>  }
> =20
>  static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09enum vb2_buffer_state state;
>  =09u32 status;
> =20
> -=09status =3D readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
> -=09writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +=09status =3D readl(core->regs + RKVDEC_REG_INTERRUPT);
> +=09writel(0, core->regs + RKVDEC_REG_INTERRUPT);
> =20
>  =09if (status & RKVDEC_RDY_STA) {
>  =09=09state =3D VB2_BUF_STATE_DONE;
>  =09} else {
>  =09=09state =3D VB2_BUF_STATE_ERROR;
>  =09=09if (status & RKVDEC_SOFTRESET_RDY)
> -=09=09=09rkvdec_iommu_restore(rkvdec);
> +=09=09=09rkvdec_iommu_restore(core);
>  =09}
> =20
> -=09if (cancel_delayed_work(&rkvdec->watchdog_work))
> +=09if (cancel_delayed_work(&core->watchdog_work))
>  =09=09rkvdec_job_finish(ctx, state);
> =20
>  =09return IRQ_HANDLED;
> @@ -1460,12 +1462,12 @@ static irqreturn_t rk3399_irq_handler(struct rkvd=
ec_ctx *ctx)
> =20
>  static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09enum vb2_buffer_state state;
>  =09u32 status;
> =20
> -=09status =3D readl(rkvdec->regs + VDPU381_REG_STA_INT);
> -=09writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
> +=09status =3D readl(core->regs + VDPU381_REG_STA_INT);
> +=09writel(0, core->regs + VDPU381_REG_STA_INT);
> =20
>  =09if (status & VDPU381_STA_INT_DEC_RDY_STA) {
>  =09=09state =3D VB2_BUF_STATE_DONE;
> @@ -1474,10 +1476,10 @@ static irqreturn_t vdpu381_irq_handler(struct rkv=
dec_ctx *ctx)
>  =09=09if (status & (VDPU381_STA_INT_SOFTRESET_RDY |
>  =09=09=09      VDPU381_STA_INT_TIMEOUT |
>  =09=09=09      VDPU381_STA_INT_ERROR))
> -=09=09=09rkvdec_iommu_restore(rkvdec);
> +=09=09=09rkvdec_iommu_restore(core);
>  =09}
> =20
> -=09if (cancel_delayed_work(&rkvdec->watchdog_work))
> +=09if (cancel_delayed_work(&core->watchdog_work))
>  =09=09rkvdec_job_finish(ctx, state);
> =20
>  =09return IRQ_HANDLED;
> @@ -1485,24 +1487,24 @@ static irqreturn_t vdpu381_irq_handler(struct rkv=
dec_ctx *ctx)
> =20
>  static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
>  {
> -=09struct rkvdec_dev *rkvdec =3D ctx->dev;
> +=09struct rkvdec_core *core =3D ctx->core;
>  =09enum vb2_buffer_state state;
>  =09u32 status;
> =20
> -=09status =3D readl(rkvdec->link + VDPU383_LINK_STA_INT);
> -=09writel(FIELD_PREP_WM16(VDPU383_STA_INT_ALL, 0), rkvdec->link + VDPU38=
3_LINK_STA_INT);
> +=09status =3D readl(core->link + VDPU383_LINK_STA_INT);
> +=09writel(FIELD_PREP_WM16(VDPU383_STA_INT_ALL, 0), core->link + VDPU383_=
LINK_STA_INT);
>  =09/* On vdpu383, the interrupts must be disabled */
>  =09writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, =
0),
> -=09       rkvdec->link + VDPU383_LINK_INT_EN);
> +=09       core->link + VDPU383_LINK_INT_EN);
> =20
>  =09if (status & VDPU383_STA_INT_DEC_RDY_STA) {
>  =09=09state =3D VB2_BUF_STATE_DONE;
>  =09} else {
>  =09=09state =3D VB2_BUF_STATE_ERROR;
> -=09=09rkvdec_iommu_restore(rkvdec);
> +=09=09rkvdec_iommu_restore(core);
>  =09}
> =20
> -=09if (cancel_delayed_work(&rkvdec->watchdog_work))
> +=09if (cancel_delayed_work(&core->watchdog_work))
>  =09=09rkvdec_job_finish(ctx, state);
> =20
>  =09return IRQ_HANDLED;
> @@ -1510,11 +1512,14 @@ static irqreturn_t vdpu383_irq_handler(struct rkv=
dec_ctx *ctx)
> =20
>  static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
>  {
> -=09struct rkvdec_dev *rkvdec =3D priv;
> -=09struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> -=09const struct rkvdec_variant *variant =3D rkvdec->variant;
> +=09irqreturn_t ret;
> +=09struct rkvdec_core *core =3D priv;
> +=09struct rkvdec_ctx *ctx =3D core->curr_ctx;
> +=09const struct rkvdec_variant *variant =3D ctx->dev->variant;
> +
> +=09ret =3D variant->ops->irq_handler(ctx);
> =20
> -=09return variant->ops->irq_handler(ctx);
> +=09return ret;
>  }
> =20
>  /*
> @@ -1591,62 +1596,19 @@ static void vdpu383_flatten_matrices(u8 *output, =
const u8 *input, int matrices,
> =20
>  static void rkvdec_watchdog_func(struct work_struct *work)
>  {
> -=09struct rkvdec_dev *rkvdec;
> +=09struct rkvdec_core *core;
>  =09struct rkvdec_ctx *ctx;
> =20
> -=09rkvdec =3D container_of(to_delayed_work(work), struct rkvdec_dev,
> +=09core =3D container_of(to_delayed_work(work), struct rkvdec_core,
>  =09=09=09      watchdog_work);
> -=09ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +=09ctx =3D core->curr_ctx;
>  =09if (ctx) {
> -=09=09dev_err(rkvdec->dev, "Frame processing timed out!\n");
> -=09=09writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> +=09=09dev_err(core->dev, "Frame processing timed out!\n");
> +=09=09writel(RKVDEC_IRQ_DIS, core->regs + RKVDEC_REG_INTERRUPT);
>  =09=09rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
>  =09}
>  }
> =20
> -/*
> - * Some SoCs, like RK3588 have multiple identical VDPU cores, but the
> - * kernel is currently missing support for multi-core handling. Exposing
> - * separate devices for each core to userspace is bad, since that does
> - * not allow scheduling tasks properly (and creates ABI). With this work=
around
> - * the driver will only probe for the first core and early exit for the =
other
> - * cores. Once the driver gains multi-core support, the same technique
> - * for detecting the first core can be used to cluster all cores togethe=
r.
> - */
> -static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
> -{
> -=09struct device_node *node =3D NULL;
> -=09const char *compatible;
> -=09bool is_first_core;
> -=09int ret;
> -
> -=09/* Intentionally ignores the fallback strings */
> -=09ret =3D of_property_read_string(rkvdec->dev->of_node, "compatible", &=
compatible);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09/* The first compatible and available node found is considered the ma=
in core */
> -=09do {
> -=09=09node =3D of_find_compatible_node(node, NULL, compatible);
> -=09=09if (of_device_is_available(node))
> -=09=09=09break;
> -=09} while (node);
> -
> -=09if (!node)
> -=09=09return -EINVAL;
> -
> -=09is_first_core =3D (rkvdec->dev->of_node =3D=3D node);
> -
> -=09of_node_put(node);
> -
> -=09if (!is_first_core) {
> -=09=09dev_info(rkvdec->dev, "missing multi-core support, ignoring this i=
nstance\n");
> -=09=09return -ENODEV;
> -=09}
> -
> -=09return 0;
> -}
> -
>  static const struct rkvdec_variant_ops rk3399_variant_ops =3D {
>  =09.irq_handler =3D rk3399_irq_handler,
>  =09.colmv_size =3D rkvdec_colmv_size,
> @@ -1757,49 +1719,75 @@ static const struct of_device_id of_rkvdec_match[=
] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> =20
> -static int rkvdec_probe(struct platform_device *pdev)
> +static int rkvdec_core_bind(struct device *dev, struct device *master, v=
oid *data)
> +{
> +=09struct platform_device *pdev =3D to_platform_device(dev);
> +=09struct rkvdec_core *core =3D platform_get_drvdata(pdev);
> +=09struct rkvdec_dev *rkvdec =3D data;
> +
> +=09if (rkvdec->main_core)
> +=09=09return dev_err_probe(dev, -EBUSY,
> +=09=09=09=09     "rkvdec already has a bound core\n");
> +
> +=09rkvdec->main_core =3D core;
> +
> +=09dev_info(dev, "Registered core\n");
> +
> +=09return 0;
> +}
> +
> +static const struct component_ops rkvdec_core_ops =3D {
> +=09.bind =3D rkvdec_core_bind,
> +};
> +
> +static int rkvdec_core_probe(struct platform_device *pdev)
>  {
>  =09const struct rkvdec_variant *variant;
> -=09struct rkvdec_dev *rkvdec;
> +=09struct rkvdec_core *core;
>  =09int ret, irq;
> =20
> +=09if (!pdev->dev.of_node)
> +=09=09return -ENODEV;
> +
>  =09variant =3D of_device_get_match_data(&pdev->dev);
>  =09if (!variant)
> -=09=09return -EINVAL;
> +=09=09return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match dat=
a\n");
> =20
> -=09rkvdec =3D devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
> -=09if (!rkvdec)
> +=09core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> +=09if (!core)
>  =09=09return -ENOMEM;
> =20
> -=09platform_set_drvdata(pdev, rkvdec);
> -=09rkvdec->dev =3D &pdev->dev;
> -=09rkvdec->variant =3D variant;
> -=09mutex_init(&rkvdec->vdev_lock);
> -=09INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> -
> -=09ret =3D rkvdec_disable_multicore(rkvdec);
> -=09if (ret)
> -=09=09return ret;
> +=09core->dev =3D &pdev->dev;
> +=09INIT_DELAYED_WORK(&core->watchdog_work, rkvdec_watchdog_func);
> =20
> -=09ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
> +=09ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &core->clocks);

Just a note, we'll have a conflict here, someone noted that PM runtime shou=
ld
enable the clock instead, there is a small fix that might be picked before =
this
one. Just rebase if that happens.

>  =09if (ret < 0)
>  =09=09return ret;
> +=09core->num_clocks =3D ret;
> =20
> -=09rkvdec->num_clocks =3D ret;
> -=09rkvdec->axi_clk =3D devm_clk_get(&pdev->dev, "axi");
> +=09core->axi_clk =3D devm_clk_get(&pdev->dev, "axi");
> =20
> -=09if (rkvdec->variant->has_single_reg_region) {
> -=09=09rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -=09=09if (IS_ERR(rkvdec->regs))
> -=09=09=09return PTR_ERR(rkvdec->regs);
> +=09if (variant->has_single_reg_region) {
> +=09=09core->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +=09=09if (IS_ERR(core->regs))
> +=09=09=09return PTR_ERR(core->regs);
>  =09} else {
> -=09=09rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "func=
tion");
> -=09=09if (IS_ERR(rkvdec->regs))
> -=09=09=09return PTR_ERR(rkvdec->regs);
> +=09=09core->regs =3D devm_platform_ioremap_resource_byname(pdev, "functi=
on");
> +=09=09if (IS_ERR(core->regs))
> +=09=09=09return PTR_ERR(core->regs);
> +
> +=09=09core->link =3D devm_platform_ioremap_resource_byname(pdev, "link")=
;
> +=09=09if (IS_ERR(core->link))
> +=09=09=09return PTR_ERR(core->link);
> +=09}
> +
> +=09if (iommu_get_domain_for_dev(&pdev->dev)) {
> +=09=09core->empty_domain =3D iommu_paging_domain_alloc(core->dev);
> =20
> -=09=09rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link=
");
> -=09=09if (IS_ERR(rkvdec->link))
> -=09=09=09return PTR_ERR(rkvdec->link);
> +=09=09if (IS_ERR(core->empty_domain)) {
> +=09=09=09dev_warn(core->dev, "cannot alloc new empty domain\n");
> +=09=09=09core->empty_domain =3D NULL;
> +=09=09}
>  =09}
> =20
>  =09ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> @@ -1816,32 +1804,26 @@ static int rkvdec_probe(struct platform_device *p=
dev)
> =20
>  =09ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  =09=09=09=09=09rkvdec_irq_handler, IRQF_ONESHOT,
> -=09=09=09=09=09dev_name(&pdev->dev), rkvdec);
> +=09=09=09=09=09dev_name(&pdev->dev), core);
>  =09if (ret) {
> -=09=09dev_err(&pdev->dev, "Could not request vdec IRQ\n");
> +=09=09dev_err(&pdev->dev, "Could not request core IRQ\n");
>  =09=09return ret;
>  =09}
> =20
> -=09rkvdec->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> -=09if (!rkvdec->sram_pool && rkvdec->variant->num_rcb_sizes > 0)
> +=09core->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +=09if (!core->sram_pool && variant->num_rcb_sizes > 0)
>  =09=09dev_info(&pdev->dev, "No sram node, RCB will be stored in RAM\n");
> =20
>  =09pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
>  =09pm_runtime_use_autosuspend(&pdev->dev);
>  =09pm_runtime_enable(&pdev->dev);
> =20
> -=09ret =3D rkvdec_v4l2_init(rkvdec);
> -=09if (ret)
> -=09=09goto err_disable_runtime_pm;
> +=09platform_set_drvdata(pdev, core);
> =20
> -=09rkvdec->iommu_domain =3D iommu_get_domain_for_dev(&pdev->dev);
> -=09if (rkvdec->iommu_domain) {
> -=09=09rkvdec->empty_domain =3D iommu_paging_domain_alloc(rkvdec->dev);
> -
> -=09=09if (IS_ERR(rkvdec->empty_domain)) {
> -=09=09=09rkvdec->empty_domain =3D NULL;
> -=09=09=09dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
> -=09=09}
> +=09ret =3D component_add(&pdev->dev, &rkvdec_core_ops);
> +=09if (ret < 0) {
> +=09=09dev_err(&pdev->dev, "failed to register component: %d\n", ret);
> +=09=09goto err_disable_runtime_pm;
>  =09}
> =20
>  =09return 0;
> @@ -1849,60 +1831,254 @@ static int rkvdec_probe(struct platform_device *=
pdev)
>  err_disable_runtime_pm:
>  =09pm_runtime_dont_use_autosuspend(&pdev->dev);
>  =09pm_runtime_disable(&pdev->dev);
> -
> -=09if (rkvdec->sram_pool)
> -=09=09gen_pool_destroy(rkvdec->sram_pool);
> +=09if (core->empty_domain)
> +=09=09iommu_domain_free(core->empty_domain);
> =20
>  =09return ret;
>  }
> =20
> -static void rkvdec_remove(struct platform_device *pdev)
> +static void rkvdec_core_remove(struct platform_device *pdev)
>  {
> -=09struct rkvdec_dev *rkvdec =3D platform_get_drvdata(pdev);
> +=09struct rkvdec_core *core =3D platform_get_drvdata(pdev);
> =20
> -=09cancel_delayed_work_sync(&rkvdec->watchdog_work);
> +=09component_del(&pdev->dev, &rkvdec_core_ops);
> =20
> -=09rkvdec_v4l2_cleanup(rkvdec);
> -=09pm_runtime_disable(&pdev->dev);
>  =09pm_runtime_dont_use_autosuspend(&pdev->dev);
> +=09pm_runtime_disable(&pdev->dev);
> =20
> -=09if (rkvdec->empty_domain)
> -=09=09iommu_domain_free(rkvdec->empty_domain);
> +=09if (core->empty_domain)
> +=09=09iommu_domain_free(core->empty_domain);
>  }
> =20
>  #ifdef CONFIG_PM
> -static int rkvdec_runtime_resume(struct device *dev)
> +static int rkvdec_core_runtime_resume(struct device *dev)
>  {
> -=09struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> +=09struct rkvdec_core *core =3D dev_get_drvdata(dev);
> =20
> -=09return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
> +=09return clk_bulk_prepare_enable(core->num_clocks, core->clocks);
>  }
> =20
> -static int rkvdec_runtime_suspend(struct device *dev)
> +static int rkvdec_core_runtime_suspend(struct device *dev)
>  {
> -=09struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> +=09struct rkvdec_core *core =3D dev_get_drvdata(dev);
> +
> +=09clk_bulk_disable_unprepare(core->num_clocks, core->clocks);
> =20
> -=09clk_bulk_disable_unprepare(rkvdec->num_clocks, rkvdec->clocks);
>  =09return 0;
>  }
>  #endif
> =20
> -static const struct dev_pm_ops rkvdec_pm_ops =3D {
> +static const struct dev_pm_ops rkvdec_core_pm_ops =3D {
>  =09SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>  =09=09=09=09pm_runtime_force_resume)
> -=09SET_RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NUL=
L)
> +=09SET_RUNTIME_PM_OPS(rkvdec_core_runtime_suspend,
> +=09=09=09   rkvdec_core_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver rkvdec_core_pdrv =3D {
> +=09.probe =3D rkvdec_core_probe,
> +=09.remove =3D rkvdec_core_remove,
> +=09.driver =3D {
> +=09=09   .name =3D "rkvdec-core",
> +=09=09   .of_match_table =3D of_rkvdec_match,
> +=09=09   .pm =3D &rkvdec_core_pm_ops,
> +=09},
> +};
> +
> +static int rkvdec_bind(struct device *dev)
> +{
> +=09struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> +=09int ret;
> +
> +=09ret =3D component_bind_all(dev, rkvdec);
> +=09if (ret) {
> +=09=09dev_err(dev, "component bind failed\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D rkvdec_v4l2_init(rkvdec);
> +=09if (ret)
> +=09=09goto err_unbind;
> +
> +=09return 0;
> +
> +err_unbind:
> +=09component_unbind_all(dev, NULL);
> +=09return ret;
> +}
> +
> +static void rkvdec_unbind(struct device *dev)
> +{
> +=09struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> +
> +=09cancel_delayed_work_sync(&rkvdec->main_core->watchdog_work);
> +
> +=09rkvdec_v4l2_cleanup(rkvdec);
> +
> +=09rkvdec_free_rcb(rkvdec, rkvdec->main_core);
> +
> +=09component_unbind_all(dev, NULL);
> +}
> +
> +static const struct component_master_ops rkvdec_master_ops =3D {
> +=09.bind =3D rkvdec_bind,
> +=09.unbind =3D rkvdec_unbind,
>  };
> =20
> -static struct platform_driver rkvdec_driver =3D {
> +static int rkvdec_probe(struct platform_device *pdev)
> +{
> +=09const struct of_device_id *match_desc =3D pdev->dev.platform_data;
> +=09struct device *dev =3D &pdev->dev;
> +=09struct component_match *match =3D NULL;
> +=09struct device_node *core_node;
> +=09struct rkvdec_dev *rkvdec;
> +
> +=09if (!match_desc)
> +=09=09return dev_err_probe(dev, -ENODEV, "missing platform data\n");
> +
> +=09for_each_compatible_node(core_node, NULL, match_desc->compatible) {
> +=09=09if (!of_device_is_available(core_node))
> +=09=09=09continue;
> +
> +=09=09of_node_get(core_node);
> +=09=09component_match_add_release(dev, &match, component_release_of,
> +=09=09=09=09=09    component_compare_of, core_node);
> +=09}
> +
> +=09if (!match)
> +=09=09return dev_err_probe(dev, -ENODEV,
> +=09=09=09=09     "no matching available component devices found\n");
> +
> +=09rkvdec =3D devm_kzalloc(dev, sizeof(*rkvdec), GFP_KERNEL);
> +=09if (!rkvdec)
> +=09=09return -ENOMEM;
> +
> +=09rkvdec->variant =3D match_desc->data;
> +=09if (!rkvdec->variant)
> +=09=09return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
> +
> +=09mutex_init(&rkvdec->vdev_lock);
> +
> +=09dev_set_drvdata(dev, rkvdec);
> +
> +=09return component_master_add_with_match(dev, &rkvdec_master_ops, match=
);
> +}
> +
> +static void rkvdec_remove(struct platform_device *pdev)
> +{
> +=09component_master_del(&pdev->dev, &rkvdec_master_ops);
> +}
> +
> +static struct platform_driver rkvdec_pdrv =3D {
>  =09.probe =3D rkvdec_probe,
>  =09.remove =3D rkvdec_remove,
>  =09.driver =3D {
> -=09=09   .name =3D "rkvdec",
> -=09=09   .of_match_table =3D of_rkvdec_match,
> -=09=09   .pm =3D &rkvdec_pm_ops,
> +=09=09.name =3D "rkvdec",
>  =09},
>  };
> -module_platform_driver(rkvdec_driver);
> +
> +static bool rkvdec_of_has_available_node(const char *compat)
> +{
> +=09struct device_node *node;
> +
> +=09for_each_compatible_node(node, NULL, compat) {
> +=09=09if (of_device_is_available(node)) {
> +=09=09=09of_node_put(node);
> +=09=09=09return true;
> +=09=09}
> +=09}
> +
> +=09return false;
> +}
> +
> +static int rkvdec_create_platform_device(struct platform_device **ppdev,
> +=09=09=09=09=09 const struct of_device_id *match)
> +{
> +=09struct platform_device *pdev;
> +=09int ret;
> +
> +=09pdev =3D platform_device_alloc(match->compatible, PLATFORM_DEVID_NONE=
);
> +=09if (!pdev)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D platform_device_add_data(pdev, match, sizeof(*match));
> +=09if (ret)
> +=09=09goto free_platform_device;
> +
> +=09ret =3D platform_device_add(pdev);
> +=09if (ret)
> +=09=09goto free_platform_device;
> +
> +=09ret =3D device_driver_attach(&rkvdec_pdrv.driver, &pdev->dev);
> +=09if (ret)
> +=09=09goto del_platform_device;
> +
> +=09*ppdev =3D pdev;
> +
> +=09return 0;
> +
> +del_platform_device:
> +=09platform_device_del(pdev);
> +free_platform_device:
> +=09platform_device_put(pdev);
> +=09return ret;
> +}
> +
> +static struct platform_device *master_pdevs[ARRAY_SIZE(of_rkvdec_match) =
- 1];
> +
> +static int __init rkvdec_init(void)
> +{
> +=09unsigned int i;
> +=09int ret;
> +
> +=09ret =3D platform_driver_register(&rkvdec_core_pdrv);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D platform_driver_register(&rkvdec_pdrv);
> +=09if (ret)
> +=09=09goto unregister_core_driver;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(master_pdevs); i++) {
> +=09=09if (!rkvdec_of_has_available_node(of_rkvdec_match[i].compatible))
> +=09=09=09continue;
> +
> +=09=09ret =3D rkvdec_create_platform_device(&master_pdevs[i],
> +=09=09=09=09=09=09    &of_rkvdec_match[i]);
> +=09=09if (ret)
> +=09=09=09goto unregister_platform_devices;
> +=09}
> +
> +=09return 0;
> +
> +unregister_platform_devices:
> +=09for (i =3D 0; i < ARRAY_SIZE(master_pdevs); i++) {
> +=09=09if (master_pdevs[i]) {
> +=09=09=09platform_device_unregister(master_pdevs[i]);
> +=09=09=09master_pdevs[i] =3D NULL;
> +=09=09}
> +=09}
> +=09platform_driver_unregister(&rkvdec_pdrv);
> +unregister_core_driver:
> +=09platform_driver_unregister(&rkvdec_core_pdrv);
> +=09return ret;
> +}
> +module_init(rkvdec_init);
> +
> +static void __exit rkvdec_exit(void)
> +{
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(master_pdevs); i++) {
> +=09=09if (master_pdevs[i]) {
> +=09=09=09platform_device_unregister(master_pdevs[i]);
> +=09=09=09master_pdevs[i] =3D NULL;
> +=09=09}
> +=09}
> +=09platform_driver_unregister(&rkvdec_pdrv);
> +=09platform_driver_unregister(&rkvdec_core_pdrv);
> +}
> +module_exit(rkvdec_exit);
> =20
>  MODULE_AUTHOR("Boris Brezillon <boris.brezillon@collabora.com>");
>  MODULE_DESCRIPTION("Rockchip Video Decoder driver");
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index a24be6638b6b..36eadcfcabdb 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -125,23 +125,28 @@ struct rkvdec_coded_fmt_desc {
>  =09u32 subsystem_flags;
>  };
> =20
> -struct rkvdec_dev {
> -=09struct v4l2_device v4l2_dev;
> -=09struct media_device mdev;
> -=09struct video_device vdev;
> -=09struct v4l2_m2m_dev *m2m_dev;
> +struct rkvdec_core {
>  =09struct device *dev;
>  =09struct clk_bulk_data *clocks;
>  =09unsigned int num_clocks;
>  =09struct clk *axi_clk;
>  =09void __iomem *regs;
>  =09void __iomem *link;
> -=09struct mutex vdev_lock; /* serializes ioctls */
>  =09struct delayed_work watchdog_work;
>  =09struct gen_pool *sram_pool;
> -=09struct iommu_domain *iommu_domain;
>  =09struct iommu_domain *empty_domain;
> +=09struct rkvdec_rcb_config *rcb_config;
> +=09struct rkvdec_ctx *curr_ctx;
> +};
> +
> +struct rkvdec_dev {
> +=09struct v4l2_device v4l2_dev;
> +=09struct media_device mdev;
> +=09struct video_device vdev;
> +=09struct v4l2_m2m_dev *m2m_dev;
> +=09struct mutex vdev_lock; /* serializes ioctls */
>  =09const struct rkvdec_variant *variant;
> +=09struct rkvdec_core *main_core;
>  };
> =20
>  struct rkvdec_ctx {
> @@ -152,8 +157,8 @@ struct rkvdec_ctx {
>  =09struct v4l2_ctrl_handler ctrl_hdl;
>  =09struct rkvdec_dev *dev;
>  =09enum rkvdec_image_fmt image_fmt;
> -=09struct rkvdec_rcb_config *rcb_config;
>  =09u32 colmv_offset;
> +=09struct rkvdec_core *core;
>  =09void *priv;
>  =09u8 has_sps_st_rps: 1;
>  =09u8 has_sps_lt_rps: 1;
> @@ -179,7 +184,7 @@ struct rkvdec_aux_buf {
>  void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)=
;
>  void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run=
);
>  void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
> -void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_thr=
eshold);
> +void rkvdec_schedule_watchdog(struct rkvdec_core *core, u32 timeout_thre=
shold);
> =20
>  void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);

So not that much, yet the iommu restore hack seems broken now at first sigh=
t.

Nicolas

--=-t5b+/OxG8YxqfU/QJT+F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav84zQAKCRDZQZRRKWBy
9MIjAQCI1tEQWZvNuvJLpRo9V4Yejg2or7tYIG9ENMJDmRrGfQEAgyHjvcX4+Hbk
h6B5d7XZSxPocVexsG5ckTTBValY5w0=
=Fpra
-----END PGP SIGNATURE-----

--=-t5b+/OxG8YxqfU/QJT+F--
