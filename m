Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111740;
	b=Q/qyo/kuA/9qBT05KUe6ay6MvbU5xcMy4qtZWKngvRpcZpG5++/N37c5rfjshJCrQPLS
	 FOYcwjBV5Rp4z8IT+84BLuIp11golUm3KVKFJzCbOefN9SEO0VqZfTulePVAhQO7JbWdo
	 xHVPcwvadhns4lZV1wP5YaTKBuU7aH8JVs+1nlSeBtO4TzJ0gifX/WNJ3l/DZ+cOkmoIg
	 XHHood0MJ8telpZ+zaOc8eaCKgLeQCXbumTxvnV2fVLsH6ho6h041TYHDDRqA4tplZJUp
	 xbErILTObPNYj2RtrvniVa19OExaHG3I2YpcFGPT3oZAx+uEi9pJyqycGe2k6GQJazw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111740;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=riIxevLtmh113kjXf3hz67f6LG0ighcE4qfi4P9Sfbk=;
	b=vVjISwsKiqGCKkokqnLZPCC2UitpR7ujXVFI+9J8ti1ToHS0xHSIZzDAbFYdvqBkioGR
	 sgqPZGNWk0CP5lz6MkNRlK/LtGcnEdJ6Tl9AzHis5BbfO1IhwINhkYwTTAvvRcGdDc2/6
	 lrwCI5Thywb6W9ljcAtHD4CjjoRyBPgkyrMSm/iqyCEMAP/ZbG9TD0U77kP4i2dskk7YJ
	 fVvL0bet2/ma7DDlZKyrF1hCdiW6OQ+BISZWQBCYaMcyFZfsbccIKU7EkoZ1bg/bTKjKu
	 TayyKrv5cYRuLY+ybJwyY2d9sh2NG0zXUYn1AcW4mM9eWGY/i2QpUDnsLVfWWLOIacQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aWqlKegI;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F568606A320;
	Thu, 19 Nov 2026 18:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F568606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aWqlKegI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795111737;
	bh=BYxW1dyP/HTBSJvGLJteQTwymgi/5NPfXG2gt/edaeY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aWqlKegIGSAuLo9z14DX7n8HcdvNV9DU6wpoQCMpStm4E1UtOlblflFI5G/ZJrgzr
	 vgQqlCIcOraVxyfqR0IMn3o/YncbU79PstRuiD0Ax2uH7KGozfcM7P2H7ne4xeR995
	 rsCgL9aVdG3HbrDm4Cm/lZDhbSal0cAddKuffpe3mfVW07VVoHhgqV0MYz/yPfkst9
	 q9Iihza4h+8leWGfJqUDmG5fxDw3DjdafwlonKsPjKS2fdOepfXFm/EuDAvc9CzXHS
	 DOdL9fBJc9qMViotnvXmlLFM2G9pH95k5Waa1pdsPKExNZfBh0dSDUV7IVt0bdm0og
	 aeig57dR5XQ0g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4007117E052F;
	Thu, 19 Nov 2026 19:08:56 +0100 (CET)
Message-ID: <fcb9cd01bd333b3f92f000d48adf2d00359398d4.camel@collabora.com>
Subject: Re: [PATCH v2 5/5] media: rkvdec: Add multicore support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, 
	kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 13:08:54 -0500
In-Reply-To: <20260810-rkvdec-multicore-v2-5-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
	 <20260810-rkvdec-multicore-v2-5-986f89d22cdc@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-CfWuqYFhGQ8bM6+JFjJk"
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

--=-CfWuqYFhGQ8bM6+JFjJk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> Rockchip SoCs like the RK3588 have multiple independent decoder cores
> defined in the device tree as separate nodes sharing the same
> compatible.
> Extend the component-based driver to actually drive all of them from the
> same v4l2 device.

Either combine and add blank between paragraph please.

>=20
> It uses the v4l2_m2m_set_max_parallel_jobs() function to set the number
> of available cores, making sure that only 1 job per m2m context is
> running at a given time.
> This is crucial for a stateless decoder as each job may depend on the
> completion of previous jobs.
> This avoids adding a complex scheduler that iwould have to ensure that
> all needed reference frames are fully decoded before decoding a frame.
> Instead, cores will work in parallel on different streams.
>=20
> As each core has its own IOMMU core, buffers must be mapped in each
> core's IOMMU so that any run() call can use any core without having to
> remap everything.

That was done in previous patch.

>=20
> To do that, we use rockchip iommu domain's iommu devices list.
> With that, one IOMMU domain can be mapped on multiple devices, meaning
> that each call to iommu_map() will flush the new mapping on all devices
> in the list.
> The IOMMU domain that will have all devices in its list is the first
> core's default domain.
>=20
> Another domain cannot be used because VB2 allocates buffers through the
> DMA engine, which uses iommu_get_dma_domain() to find the domain to map
> buffers through.
>=20
> The IOMMU restore function can still work as before, but needs to be more
> explicit in what domain to attach the device to.
> That is because detaching the empty domain will reattach the core's defau=
lt
> domain, which is wrong (except for the first "main" core).
>=20
> The RCB temporary buffers are allocated in a dedicated SRAM, and each
> core has its own SRAM, so the mapping for each core's SRAM is added in th=
e
> global domain.
>=20
> Everything else is mapped through the first core's default domain, making
> the driver write the mappings on both IOMMU cores.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  12 +--
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 104 +++++++++++++++=
++++--
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   8 ++
>  3 files changed, 107 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> index 44df5b6df80c..977e37cf209b 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> @@ -76,9 +76,8 @@ void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct =
rkvdec_core *core)
>  =09=09case RKVDEC_ALLOC_SRAM:
>  =09=09=09virt_addr =3D (unsigned long)cfg->rcb_bufs[i].cpu;
> =20
> -=09=09=09if (iommu_get_domain_for_dev(core->dev))
> -=09=09=09=09iommu_unmap(iommu_get_domain_for_dev(core->dev),
> -=09=09=09=09=09    virt_addr, rcb_size);
> +=09=09=09if (rkvdec->iommu_global_domain)
> +=09=09=09=09iommu_unmap(rkvdec->iommu_global_domain, virt_addr, rcb_size=
);

So you just wrongly ported it in previous patch and I missed it. Please squ=
ash
this in previous commit.

>  =09=09=09gen_pool_free(core->sram_pool, virt_addr, rcb_size);
>  =09=09=09break;
>  =09=09case RKVDEC_ALLOC_DMA:
> @@ -134,7 +133,7 @@ int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, st=
ruct rkvdec_core *core,
> =20
>  =09=09/* Try allocating an SRAM buffer */
>  =09=09if (core->sram_pool) {
> -=09=09=09if (iommu_get_domain_for_dev(core->dev))
> +=09=09=09if (rkvdec->iommu_global_domain)
>  =09=09=09=09rcb_size =3D ALIGN(rcb_size, SZ_4K);
> =20
>  =09=09=09cpu =3D gen_pool_dma_zalloc_align(core->sram_pool,
> @@ -144,12 +143,11 @@ int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, =
struct rkvdec_core *core,
>  =09=09}
> =20
>  =09=09/* If an IOMMU is used, map the SRAM address through it */
> -=09=09if (cpu && iommu_get_domain_for_dev(core->dev)) {
> +=09=09if (cpu && rkvdec->iommu_global_domain) {
>  =09=09=09unsigned long virt_addr =3D (unsigned long)cpu;
>  =09=09=09phys_addr_t phys_addr =3D dma;
> =20
> -=09=09=09ret =3D iommu_map(iommu_get_domain_for_dev(core->dev),
> -=09=09=09=09=09virt_addr, phys_addr,
> +=09=09=09ret =3D iommu_map(rkvdec->iommu_global_domain, virt_addr, phys_=
addr,
>  =09=09=09=09=09rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
>  =09=09=09if (ret) {
>  =09=09=09=09gen_pool_free(core->sram_pool,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index d3b13132b751..35850231922e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1058,6 +1058,37 @@ static const struct media_device_ops rkvdec_media_=
ops =3D {
>  =09.req_queue =3D v4l2_m2m_request_queue,
>  };
> =20
> +/**
> + * Return a core that is available for decoding or null if no core is fo=
und.
> + * The caller should make sure to call release_core() when the core is n=
o longer needed.
> + */
> +static struct rkvdec_core *acquire_core(struct rkvdec_dev *rkvdec, struc=
t rkvdec_ctx *ctx)
> +{
> +=09struct rkvdec_core *core =3D NULL;
> +
> +=09guard(spinlock_irqsave)(&rkvdec->cores_lock);
> +
> +=09if (rkvdec->available_core_count) {
> +=09=09core =3D rkvdec->available_cores[--rkvdec->available_core_count];
> +
> +=09=09// Set the current core's ctx to this ctx
> +=09=09core->curr_ctx =3D ctx;
> +=09}
> +
> +=09return core;
> +}
> +
> +/**
> + * Release the core to make it available for a next job.
> + */
> +static void release_core(struct rkvdec_dev *rkvdec, struct rkvdec_core *=
core)
> +{
> +=09guard(spinlock_irqsave)(&rkvdec->cores_lock);
> +
> +=09core->curr_ctx =3D NULL;
> +=09rkvdec->available_cores[rkvdec->available_core_count++] =3D core;
> +}
> +
>  static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
>  =09=09=09=09  enum vb2_buffer_state result)
>  {
> @@ -1072,6 +1103,11 @@ static void rkvdec_job_finish_no_pm(struct rkvdec_=
ctx *ctx,
>  =09=09ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
>  =09}
> =20
> +=09if (ctx->core) {
> +=09=09release_core(ctx->dev, ctx->core);
> +=09=09ctx->core =3D NULL;
> +=09}
> +
>  =09v4l2_m2m_buf_done_and_job_finish(m2m_dev, m2m_ctx, result);
>  }
> =20
> @@ -1153,8 +1189,9 @@ static void rkvdec_device_run(void *priv)
>  =09if (WARN_ON(!desc))
>  =09=09return;
> =20
> -=09ctx->core =3D ctx->dev->main_core;
> -=09ctx->core->curr_ctx =3D ctx;
> +=09ctx->core =3D acquire_core(ctx->dev, ctx);
> +=09if (WARN_ON(!ctx->core))
> +=09=09return;
> =20
>  =09ret =3D pm_runtime_resume_and_get(ctx->core->dev);
>  =09if (ret < 0) {
> @@ -1424,6 +1461,7 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *=
rkvdec)
> =20
>  static void rkvdec_iommu_restore(struct rkvdec_core *core)
>  {
> +=09int ret;
>  =09if (core->empty_domain) {
>  =09=09/*
>  =09=09 * To rewrite mapping into the attached IOMMU core, attach a new e=
mpty domain that
> @@ -1432,8 +1470,14 @@ static void rkvdec_iommu_restore(struct rkvdec_cor=
e *core)
>  =09=09 * This is safely done in this interrupt handler to make sure no m=
emory get mapped
>  =09=09 * through the IOMMU while the empty domain is attached.
>  =09=09 */
> -=09=09iommu_attach_device(core->empty_domain, core->dev);
> +=09=09iommu_detach_device(core->curr_ctx->dev->iommu_global_domain, core=
->dev);
> +=09=09ret =3D iommu_attach_device(core->empty_domain, core->dev);
> +=09=09if (ret)
> +=09=09=09dev_warn(core->dev, "Cannot attach empty domain: %d\n", ret);
>  =09=09iommu_detach_device(core->empty_domain, core->dev);
> +=09=09ret =3D iommu_attach_device(core->curr_ctx->dev->iommu_global_doma=
in, core->dev);
> +=09=09if (ret)
> +=09=09=09dev_warn(core->dev, "Cannot attach global domain: %d\n", ret);

Ah, I made a comment about that in previous patch ... Its a bit confusing .=
..

>  =09}
>  }
> =20
> @@ -1724,14 +1768,35 @@ static int rkvdec_core_bind(struct device *dev, s=
truct device *master, void *dat
>  =09struct platform_device *pdev =3D to_platform_device(dev);
>  =09struct rkvdec_core *core =3D platform_get_drvdata(pdev);
>  =09struct rkvdec_dev *rkvdec =3D data;
> +=09int id, ret;
> +
> +=09id =3D rkvdec->core_count;
> +=09core->id =3D id;
> +=09rkvdec->cores[id] =3D core;
> +
> +=09if (id =3D=3D 0)
> +=09=09rkvdec->main_core =3D core;
> +
> +=09if (iommu_get_domain_for_dev(dev)) {
> +=09=09if (!rkvdec->iommu_global_domain) {
> +=09=09=09rkvdec->iommu_global_domain =3D iommu_get_domain_for_dev(dev);
> +=09=09=09if (IS_ERR(rkvdec->iommu_global_domain)) {

You do if() above, and if (IS_ERR()) here. I think the second is correct, t=
he
first is broken.

> +=09=09=09=09rkvdec->iommu_global_domain =3D NULL;
> +=09=09=09=09dev_warn_once(dev, "cannot get global domain\n");
> +=09=09=09}
> +=09=09}
> =20
> -=09if (rkvdec->main_core)
> -=09=09return dev_err_probe(dev, -EBUSY,
> -=09=09=09=09     "rkvdec already has a bound core\n");
> +=09=09if (rkvdec->iommu_global_domain) {
> +=09=09=09ret =3D iommu_attach_device(rkvdec->iommu_global_domain, dev);
> +=09=09=09if (ret)
> +=09=09=09=09dev_warn(dev, "cannot attach global domain to core %d\n", id=
);
> +=09=09}
> +=09}
> =20
> -=09rkvdec->main_core =3D core;
> +=09release_core(rkvdec, core);
> +=09rkvdec->core_count++;
> =20
> -=09dev_info(dev, "Registered core\n");
> +=09dev_info(dev, "Registered core %d\n", id);
> =20
>  =09return 0;
>  }
> @@ -1900,6 +1965,8 @@ static int rkvdec_bind(struct device *dev)
>  =09if (ret)
>  =09=09goto err_unbind;
> =20
> +=09v4l2_m2m_set_max_parallel_jobs(rkvdec->m2m_dev, rkvdec->core_count);
> +
>  =09return 0;
> =20
>  err_unbind:
> @@ -1910,12 +1977,15 @@ static int rkvdec_bind(struct device *dev)
>  static void rkvdec_unbind(struct device *dev)
>  {
>  =09struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> +=09int i;
> =20
> -=09cancel_delayed_work_sync(&rkvdec->main_core->watchdog_work);
> +=09for (i =3D 0; i < rkvdec->core_count; i++)
> +=09=09cancel_delayed_work_sync(&rkvdec->cores[i]->watchdog_work);
> =20
>  =09rkvdec_v4l2_cleanup(rkvdec);
> =20
> -=09rkvdec_free_rcb(rkvdec, rkvdec->main_core);
> +=09for (i =3D 0; i < rkvdec->core_count; i++)
> +=09=09rkvdec_free_rcb(rkvdec, rkvdec->cores[i]);
> =20
>  =09component_unbind_all(dev, NULL);
>  }
> @@ -1932,6 +2002,7 @@ static int rkvdec_probe(struct platform_device *pde=
v)
>  =09struct component_match *match =3D NULL;
>  =09struct device_node *core_node;
>  =09struct rkvdec_dev *rkvdec;
> +=09unsigned int num_cores =3D 0;
> =20
>  =09if (!match_desc)
>  =09=09return dev_err_probe(dev, -ENODEV, "missing platform data\n");
> @@ -1943,6 +2014,7 @@ static int rkvdec_probe(struct platform_device *pde=
v)
>  =09=09of_node_get(core_node);
>  =09=09component_match_add_release(dev, &match, component_release_of,
>  =09=09=09=09=09    component_compare_of, core_node);
> +=09=09num_cores++;
>  =09}
> =20
>  =09if (!match)
> @@ -1953,11 +2025,23 @@ static int rkvdec_probe(struct platform_device *p=
dev)
>  =09if (!rkvdec)
>  =09=09return -ENOMEM;
> =20
> +=09rkvdec->cores =3D devm_kcalloc(dev, num_cores, sizeof(*rkvdec->cores)=
,
> +=09=09=09=09     GFP_KERNEL);
> +=09if (!rkvdec->cores)
> +=09=09return -ENOMEM;
> +
> +=09rkvdec->available_cores =3D devm_kcalloc(dev, num_cores,
> +=09=09=09=09=09       sizeof(*rkvdec->available_cores),
> +=09=09=09=09=09       GFP_KERNEL);
> +=09if (!rkvdec->available_cores)
> +=09=09return -ENOMEM;
> +
>  =09rkvdec->variant =3D match_desc->data;
>  =09if (!rkvdec->variant)
>  =09=09return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
> =20
>  =09mutex_init(&rkvdec->vdev_lock);
> +=09spin_lock_init(&rkvdec->cores_lock);
> =20
>  =09dev_set_drvdata(dev, rkvdec);
> =20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 36eadcfcabdb..d5977cef6df7 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -15,6 +15,7 @@
>  #include <linux/videodev2.h>
>  #include <linux/wait.h>
>  #include <linux/clk.h>
> +#include <linux/spinlock.h>
> =20
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -137,6 +138,7 @@ struct rkvdec_core {
>  =09struct iommu_domain *empty_domain;
>  =09struct rkvdec_rcb_config *rcb_config;
>  =09struct rkvdec_ctx *curr_ctx;
> +=09int id;
>  };
> =20
>  struct rkvdec_dev {
> @@ -146,7 +148,13 @@ struct rkvdec_dev {
>  =09struct v4l2_m2m_dev *m2m_dev;
>  =09struct mutex vdev_lock; /* serializes ioctls */
>  =09const struct rkvdec_variant *variant;
> +=09struct rkvdec_core **cores;
> +=09int core_count;
> +=09struct rkvdec_core **available_cores;
> +=09unsigned int available_core_count;
> +=09spinlock_t cores_lock; /* serializes core list access */
>  =09struct rkvdec_core *main_core;
> +=09struct iommu_domain *iommu_global_domain;
>  };
> =20
>  struct rkvdec_ctx {

So if you can avoid the iommu part being into that patch, we could focus on
acquire/release mechanism. I think its overall fine.

Nicolas

--=-CfWuqYFhGQ8bM6+JFjJk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav87NgAKCRDZQZRRKWBy
9ICSAP92Cy35bU935q2UWvI5xwJ72eJmGX85XrNqJ7lmveA6KgD+OKmofFSGoZcN
UZn9Uf13SnxIs6qU+5LroOGT57ZfOwk=
=qr4a
-----END PGP SIGNATURE-----

--=-CfWuqYFhGQ8bM6+JFjJk--
