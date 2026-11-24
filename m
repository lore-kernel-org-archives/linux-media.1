Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557151;
	b=iV1Om7uzIiB5pTDNnr/7f81eOnOUPNA/F/TXOUQEzGcKLGrTq/VRNn1pdwGYbw2ea0Uw
	 cHx7vnop6LK3iibUvElYUEL2/YTDnr0FuE9Ap6UhO0jM/k1AZRE/kS8XQkC7mSz6beGQD
	 pLEEIixuwFU9corgEU3R5LliqsFYYXSp0g0XaYXQ/TLV8Z2W3y4uKsqVu5Hnn+QcTOzj0
	 6BfIpA9aVmupzGxwQ0We0yEO/SErrw5lp3NMbkV66fKVn7KUcvxEAc2jAUHt4+kNn3Pwv
	 LMabCXV4q4LO7chreQdGR2aMFQyzkQ+ZYcsydOGclIkNToYqan+RUH5LxffxKl1ESeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=SoZPg/og+n6XZlBxBoY+E3d63ypK0pFhrHnI5qqIb58=;
	b=Aw2N812RYKxsYDdbQsZmBhIU8vnrt1IqTETvUG2567dS7FoCQA3UYRlaEP8HbF8ffq3p
	 1hf90SQg/HWdWX5nnj/bp66rhcMM+3IskH3dFRrm+ssk06QghOkpMtPDGLCBeWAtwHwkZ
	 IJp5XV4RujHP0luKg6TyBK+XZfLmIq/ZfL6vjX2MjXkk7Th+gwth3zZMxQogB50lG65+J
	 mySPqKuk2VKlZy2cXTY8VvuvFAqlOOfpP/tracBc5m1S82rSAy2IlUduk9lHb66fkW1dh
	 5RwrqpbR6pOGET4tBnTlNlN9zpQDD+CMynGnuEzVm/Dnrm9QR98y4F0JS7Hh/jhfNJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="sXBngM6/";
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE87606A32E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE87606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sXBngM6/
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-949b0d32315so425775585a.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795557150; x=1796161950; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SoZPg/og+n6XZlBxBoY+E3d63ypK0pFhrHnI5qqIb58=;
        b=sXBngM6/0rsvC+V3z7M5RTUQcK3ro02Ylx+s+oMinZXzULOjzTLtZXp8nOaa4ykZW+
         O8Dqr7W8yda9Chc77F0r0AuSWgrPIZ8dAkjxnrU05W+A/K1gOgaA1bh+0BLpLUJfcS3G
         QRL0JGLa4AI5sPx+M1FZ4YzYRsRsUubMwuaVPDR+Rc8Ewhioe/OH8si8SL7vHHXO0Q1G
         IYYgascTDzk4maegHL1n2LWy/yOVPCWaeP6yTtcqXWZNjLhieRMVp/sVBnfBNiQr6Ogd
         PKbWcGbV16/M1WtZ3ECkagLRMH60Kxr6j7Uj+Z4KTrcT2Z30lJ/Hud9Vm5egodMXgZgy
         lQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557150; x=1796161950;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoZPg/og+n6XZlBxBoY+E3d63ypK0pFhrHnI5qqIb58=;
        b=fA5b/1if4SAuyFhLW6AbYsSpIZNC3TZg+irb8eUMNmWldaq1dLoKMKDv+6QrboH5IX
         MXSxRPrMNuSMWT8kEUUAwH04zC+2H5SqjdbD3k3Id2ltO9uxSgA+xCXbuC+TCnbBg/Wv
         qtM3ci2vHy9vaK0+F+DVgqHUYcptOe1zFr3aVh8OSGw148Sfsdhe2LD1sMh31LpSSRee
         GgGIVhAw6Uro28Tu41nQFLB8ULNjkR6SY1AYvPffGUmXnTuR4Z/edcUJ4drU9qD8AXQd
         CcGEQbBQV0y60UMgTSMwMPo2y2+a5M/boGOxplOOZeneDjsReVVZ5JSVUyWfpZ9tv6+K
         yCkw==
X-Gm-Message-State: APuU4Z/KX8Yaxe0SYs5dkjUIrPd+OEspLHX+W3hBE8AWfz8F9PFFfywj
	nb4zzRrBcinV9aCZ93RRDX0LymMoJcPA5LtK8R/KabG17/RenXUCuoIz5SAk4Bc5RACkS1xOOmH
	33Syt
X-Gm-Gg: AZFdTZc/Pm2QTF8MZB8D0cx3Fmpsn2eSePe89N6Y2VkWb4V2Fk+C4i9aXCcaaZs2DhK
	PPprt7JGE5bA/LHXt6ElPdUMwOot0j+oJg3yD1+D8tARXWuBx3tmUTYUfZKajkSvmOISc4ce5rx
	sMfL+1dqkTwxyHL8Vu7cQUzLj9KLcHhlOU0Pjwec7N8f2UgWmYEBvUKdfYeYKo5OeKS8hzBtOAa
	TolBTPnXgGi2jG/7Acxh9EnngI7uj6pJay7EnlzM3hUfrQBJR37MBBap+IRAdewc1IW8e3oxfJv
	wlPsy89VEqPC+vR/k1BgYAgonSomFspWOLih366T5kZlAW4dg5b9ZcDkeCqa9VUfp1DJyYyOAAn
	0uVtSqLa7uHdBqSZGbsku9nSltpYkKeemkAqACTdL5KJM6xC3Jtx9zXNYHVi6JUXngjVB7/lhwD
	XnL8Kbh1Pn/u8lrLXvHb/gKQ++fHCzQeC9YnxveZsuOV5UI3Dzs+HcBqzSZDk611ORvBm2IIQKm
	v1Kwh8WTx0wiiWmZuxcRj6vUIMUj8QVKKois7hG+0sl3ZwNk55yf6JLd8NhGWvmKtSm82EJlUdR
	LGsyq3qsszEDSYZ5BGx3twKf8vfeTIAtRSGWGFfvkiVrqsq+iO0u83gg
X-Received: by 2002:a05:620a:458d:b0:939:6dea:4f1a with SMTP id af79cd13be357-949ba9c228amr2813987185a.48.1795557149846;
        Tue, 24 Nov 2026 13:52:29 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm1148155085a.15.2026.11.24.13.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:52:29 -0800 (PST)
Message-ID: <71a121d6b863f31f625abcea20642269881d0b72.camel@ndufresne.ca>
Subject: Re: [PATCH v2 17/17] media: rockchip: rga: schedule jobs to
 multiple cores
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 16:52:28 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-17-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-17-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-xervUYoD/U351QaeWOLl"
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

--=-xervUYoD/U351QaeWOLl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Schedule jobs to multiple cores to utilize all RGA cores. To avoid race
> conditions when selecting the next free core a dedicated spinlock is adde=
d.
>=20
> Note that this doesn't increase the max frame rate of a single
> stream, as a context will wait for the job to finish before starting
> the next device_run call.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

I'll let you go through the Sashiko report here.

Nicolas

>=20
> ---
> v2
> - Set core->curr to null first in pm_runtime_resume_and_get error path
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D15)
> - Also protect adding/removing cores with the spinlock in bind/unbind
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 30 +++++++++++++++++++++++++=
++---
>  drivers/media/platform/rockchip/rga/rga.h |  1 +
>  2 files changed, 28 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b2eeae0a61771..6294825eaacfd 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -38,13 +38,29 @@ static void device_run(void *prv)
>  {
>  =09struct rga_ctx *ctx =3D prv;
>  =09struct rockchip_rga *rga =3D ctx->rga;
> -=09struct rga_core *core =3D rga->cores[0];
> +=09struct rga_core *core =3D NULL;
>  =09struct vb2_v4l2_buffer *src, *dst;
>  =09unsigned long flags;
>  =09int ret;
> +=09unsigned int i;
> +
> +=09spin_lock_irqsave(&rga->cores_lock, flags);
> +=09for (i =3D 0; i < rga->num_cores; i++) {
> +=09=09if (!rga->cores[i]->curr) {
> +=09=09=09core =3D rga->cores[i];
> +=09=09=09core->curr =3D ctx;
> +=09=09=09break;
> +=09=09}
> +=09}
> +=09spin_unlock_irqrestore(&rga->cores_lock, flags);
> +
> +=09WARN_ONCE(!core, "No free core although max parallel jobs matches the=
 core count!\n");
> +=09if (!core)
> +=09=09return;
> =20
>  =09ret =3D pm_runtime_resume_and_get(core->dev);
>  =09if (ret < 0) {
> +=09=09core->curr =3D NULL;
>  =09=09v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
>  =09=09=09=09=09=09 VB2_BUF_STATE_ERROR);
>  =09=09return;
> @@ -58,8 +74,6 @@ static void device_run(void *prv)
>  =09}
>  =09spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =20
> -=09core->curr =3D ctx;
> -
>  =09src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  =09src->sequence =3D ctx->osequence++;
> =20
> @@ -748,6 +762,7 @@ static int rga_core_bind(struct device *dev, struct d=
evice *master, void *data)
>  =09struct rockchip_rga *rga =3D data;
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
>  =09struct rockchip_rga_version version;
> +=09unsigned long flags;
>  =09int ret =3D 0;
> =20
>  =09core->rga =3D rga;
> @@ -785,7 +800,9 @@ static int rga_core_bind(struct device *dev, struct d=
evice *master, void *data)
> =20
>  =09pm_runtime_put(core->dev);
> =20
> +=09spin_lock_irqsave(&rga->cores_lock, flags);
>  =09rga->cores[rga->num_cores++] =3D core;
> +=09spin_unlock_irqrestore(&rga->cores_lock, flags);
> =20
>  =09return 0;
>  }
> @@ -796,6 +813,7 @@ static void rga_core_unbind(struct device *dev, struc=
t device *master,
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
>  =09struct rockchip_rga *rga =3D core->rga;
>  =09u8 i;
> +=09unsigned long flags;
> =20
>  =09/* Remove our core from the list */
>  =09for (i =3D 0; i < rga->num_cores; i++) {
> @@ -810,8 +828,10 @@ static void rga_core_unbind(struct device *dev, stru=
ct device *master,
>  =09=09=09=09iommu_detach_device(domain, core->dev);
>  =09=09}
> =20
> +=09=09spin_lock_irqsave(&rga->cores_lock, flags);
>  =09=09rga->cores[i] =3D rga->cores[rga->num_cores - 1];
>  =09=09rga->num_cores--;
> +=09=09spin_unlock_irqrestore(&rga->cores_lock, flags);
>  =09=09break;
>  =09}
> =20
> @@ -977,6 +997,9 @@ static int rga_bind(struct device *dev)
>  =09=09goto rel_m2m;
>  =09}
> =20
> +=09/* after binding all cores num_cores has the proper number of cores *=
/
> +=09v4l2_m2m_set_max_parallel_jobs(rga->m2m_dev, rga->num_cores);
> +
>  =09v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
>  =09=09  vfd->name, video_device_node_name(vfd));
> =20
> @@ -1047,6 +1070,7 @@ static int rga_probe(struct platform_device *pdev)
>  =09=09return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
> =20
>  =09spin_lock_init(&rga->ctrl_lock);
> +=09spin_lock_init(&rga->cores_lock);
>  =09mutex_init(&rga->mutex);
> =20
>  =09dev_set_drvdata(dev, rga);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 522021c3e0249..b046083244bf6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -86,6 +86,7 @@ struct rockchip_rga {
>  =09struct mutex mutex;
>  =09/* ctrl parm lock */
>  =09spinlock_t ctrl_lock;
> +=09spinlock_t cores_lock;
> =20
>  =09const struct rga_hw *hw;
> =20

--=-xervUYoD/U351QaeWOLl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYHHAAKCRDZQZRRKWBy
9BkdAQDViMbWw7ZIgkMJFFddGVM8H0l7fqIrL1g/8RohkUjwyQEA4rRzp7+Odfyt
Gc2+uGfr//xab4zmFlHvwWN8TkrIiAc=
=pKUO
-----END PGP SIGNATURE-----

--=-xervUYoD/U351QaeWOLl--
