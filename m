Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553507;
	b=c73sdZR/g2FDjYKm+GpbYyTsnH/+tLzXSCPT2VOZiVpIZfp0PPDsBYj357Lwv+uXOL9/
	 j/FIgPDR/QY6Hiwc6sYGHmum9yZQdDu4NL/+RwsXFOEaU89OZKTT8N490HAeoMU4F4/qX
	 UFbuc1F/6Sav31SHqt+nZ/yZ3cLyKhmbTFBMsxStDmIL56qBAYB6N1d816tGnaHTZA71I
	 Q2L6mjV7yR7tp+GvoVggyJIxoEzrA89+IiXCEhm7TaYp+n/cSIj5TSQRw/XfdhL+1eqx6
	 BLqStWzqDFnD5vuCYDeP5mFHzALjBa7DYY5LxONBtVxCxjTYyQ4gTPapkhSDboajznw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=RvU1ESTYysczxCSetKI0TL55rpMf6chQXLmsCQQ9a7E=;
	b=LSv2JQOe1SybShlmxb+4CHfap+/3rCpnGIYRPsqIV6ABiYnJrcWxOsQls/yXNDqOlXcX
	 nITtaxCgcoiZOd1jbyTdRJ6FwjVMa46LzHiuD4obwQ/jXBPv6n2kiOtmIb4eCNmEY/+hl
	 FKdLFr7nxdIac6FsokswMErmh/55yI+BazKxPe+jHMP65W9B2IKjRjgzFecSr9VS/R5kA
	 k9jtOYlvfCnUZB/pyqkNlkLx1bWCqqS0/hlzsM9Z7iYBt2JapCrnJ5LN0xo9e3blHhy4U
	 20sIQHprmnhW2MqMWE+GA38bmKY/SVqgZ2+6J2s67VUmp/Kplzg4MFE4fR9iMU4jumg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=anL5l2Wt;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF1606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 20:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BF1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=anL5l2Wt
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5363c8de563so54635141cf.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553506; x=1796158306; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvU1ESTYysczxCSetKI0TL55rpMf6chQXLmsCQQ9a7E=;
        b=anL5l2WttieRkf86Aa/+RF/dM/G1k44p4f7lXxB1wwsKOt7rOyCKSTZiTCt4RO+d3z
         ocIOluTOAffba2ZvM5JvG7jpSYJvVKa/H4PImsqFBt2MLYqaRtknf6x+l1Wi7acC/GkJ
         rmEeyY2GZYCgLkGSn0DkO1zgLKZaAocHGPxzGgK5ijJYjCI4VSVs1+w5gB8W8W2Iqpf0
         HbI5/FO2SWKw5O/nofjYo1J1/VszAoL2LUnrL7LJbFLNChi7aVnFKeirf45vGE9FlwWk
         +eIwBfQVLUOkZc7Ge7TVoDv91cXeTdI1psMJEcKgyNDnh5/2sWeIEwvjk0nSJYgpBIeW
         8/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553506; x=1796158306;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvU1ESTYysczxCSetKI0TL55rpMf6chQXLmsCQQ9a7E=;
        b=Ok7jSW46/f5SM0ReOShf/fo0hMzfQn8pU14PANOzfN8tNEUtXXT0SrPxCgOdQIx3Hj
         hvPiDNYLVmfwKfGJWMmIyV+d7taKhcMiFzzQlHi0j3YqIIFdQLqQTJAJ2saAfL28l2S2
         +OLdT8Snud+qlr860/HHgoUCQNjrXdFX5OEs0oqou0P4g/kqj6wCVYi9kGRadjGNLtRZ
         4XS6sA/2srXYjrf307nU7HvgRABtDsfP7do4TFzhV4+RndJjEt6DmJFqW6UtTmSsC2GH
         KMmfT0Dhze4R45rARZbMFlbwRygkMCzhP+cuV10gpdRnyueIItqI3mRHSw91GqapYYpf
         wd8A==
X-Gm-Message-State: APuU4Z9punnkbSdc3DuXuD2Ae0SN6iZObW/UnyKzB4kt0vFBboPLkKZJ
	XHM5HM948zjLzd9KkjTmJ8ZpD1Jy4GC7b4On21ZBLU60ZG0SvFJTR26oTKF/Byld1Uo=
X-Gm-Gg: AZFdTZdfbM5VTPym+2MFMMCY4bvgruUdEFgsW1x11q15+8ywNoIDf3QvVLK3oFlNvKQ
	j16qPB/fMieNRc/dYHtzZMQNULfeNorxKysMlf03UebxNevC9SvjwaewIcPxkZgwyJ3hYwZaWGN
	czchkvfHLVqHXdL90k75SI3cqd2HCbtTClvsHibx++lmXqnF4zsH9/ZdMiE7DG2Aoq0KWRFJiO3
	SwdG6BAHoOilHYmvUsSf3cyu70K20RvbzLvxqYlDyd0RoTVnKc7EOKXJUG23a2KvIwSSoPYPNHQ
	eI70RVqBMZ6HQJgNL86b+q+uwwCgJHZNzjckwQXfEhKdb5qJnSZ5rLj1iHa+HbP319HC5QRPiJ5
	hQj0m7hDCgvZ/MeUcncTTURJsWcpgl2jhe0+ttp0xtkIvYNLeyBY307H5RZXXn9SUMwzyKkstqJ
	Rq8Nq9ai9SQoyAvjY5U/PFCH8+rey60ax8e/tzcofSxbXkHmrP+uTLeXtbDsvELkt/HILVhxlqE
	ACWA8N4bKVyOPFRAn4BPJpm1kPNEBM1e3VzdAQGMfVbBC0DjHu7vKqOtnPXwd6BFti4OrdKNSQ8
	Tb63HerWeo9CNS3Uz8hPVv470hnd8JGj2x1MPWzo/XNR0CMsmvmdgtuGIBd0jGWvFoF+XcubARV
	C
X-Received: by 2002:a05:622a:613:b0:55d:3254:6253 with SMTP id d75a77b69052e-55d76a518bamr289760521cf.42.1795553506144;
        Tue, 24 Nov 2026 12:51:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134796288sm142427246d6.6.2026.11.24.12.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:51:45 -0800 (PST)
Message-ID: <89a387a88aff111fde71f00474776d1462b3594b.camel@ndufresne.ca>
Subject: Re: [PATCH v2 05/17] media: rockchip: rga: use devres version of
 pm_runtime_enable
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
Date: Tue, 24 Nov 2026 15:51:44 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-5-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-5-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-+FFLPuXOIBC694qENGcJ"
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

--=-+FFLPuXOIBC694qENGcJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Use the devres version of pm_runtime_enable named
> devm_pm_runtime_enable to ease up the cleanup handling. Also it avoids
> having a mixed cleanup order due to the following
> devm_platform_ioremap_resource being cleaned up anyways after the probe
> function has returned.
>=20
> This also changes some dev_err calls to dev_err_probe for convenient
> returning. This may not print these messages in the error case, as
> dev_err_probe may handle them differently based on the error (e.g.
> ENOMEM won't be printed).
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - added
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 34 +++++++++++--------------=
------
>  1 file changed, 12 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 8c03422d669cf..d7f0712177b70 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -797,37 +797,31 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (ret)
>  =09=09return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n")=
;
> =20
> -=09pm_runtime_enable(rga->dev);
> +=09ret =3D devm_pm_runtime_enable(rga->dev);
> +=09if (ret)
> +=09=09return ret;
> =20
>  =09rga->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -=09if (IS_ERR(rga->regs)) {
> -=09=09ret =3D PTR_ERR(rga->regs);
> -=09=09goto err_put_clk;
> -=09}
> +=09if (IS_ERR(rga->regs))
> +=09=09return PTR_ERR(rga->regs);
> =20
>  =09irq =3D platform_get_irq(pdev, 0);
> -=09if (irq < 0) {
> -=09=09ret =3D irq;
> -=09=09goto err_put_clk;
> -=09}
> +=09if (irq < 0)
> +=09=09return irq;
> =20
>  =09ret =3D devm_request_irq(rga->dev, irq, rga_isr,
>  =09=09=09       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
>  =09=09=09       dev_name(rga->dev), rga);
> -=09if (ret < 0) {
> -=09=09dev_err(rga->dev, "failed to request irq\n");
> -=09=09goto err_put_clk;
> -=09}
> +=09if (ret < 0)
> +=09=09return dev_err_probe(rga->dev, ret, "failed to request irq\n");
> =20
>  =09ret =3D dma_set_mask_and_coherent(rga->dev, DMA_BIT_MASK(32));
> -=09if (ret) {
> -=09=09dev_err(rga->dev, "32-bit DMA not supported");
> -=09=09goto err_put_clk;
> -=09}
> +=09if (ret)
> +=09=09dev_err_probe(rga->dev, ret, "32-bit DMA not supported");

Did you mean ?
=09=09return dev_err_probe(rga->dev, ret, "32-bit DMA not
supported");

With this fixed:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =20
>  =09ret =3D v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
>  =09if (ret)
> -=09=09goto err_put_clk;
> +=09=09return ret;
>  =09vfd =3D video_device_alloc();
>  =09if (!vfd) {
>  =09=09v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
> @@ -877,8 +871,6 @@ static int rga_probe(struct platform_device *pdev)
>  =09video_device_release(vfd);
>  unreg_v4l2_dev:
>  =09v4l2_device_unregister(&rga->v4l2_dev);
> -err_put_clk:
> -=09pm_runtime_disable(rga->dev);
> =20
>  =09return ret;
>  }
> @@ -892,8 +884,6 @@ static void rga_remove(struct platform_device *pdev)
>  =09v4l2_m2m_release(rga->m2m_dev);
>  =09video_unregister_device(rga->vfd);
>  =09v4l2_device_unregister(&rga->v4l2_dev);
> -
> -=09pm_runtime_disable(rga->dev);
>  }
> =20
>  static int __maybe_unused rga_runtime_suspend(struct device *dev)

--=-+FFLPuXOIBC694qENGcJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX44AAKCRDZQZRRKWBy
9FD0AP4s49BNgvZ0n2v4ASohGrNveTzQ0wXrIkR5ZrY0fdkokQEAwD1oRUFwpDXl
d3x9ZgE+KkJELoR8Uvzc7O0MwUniOAQ=
=goRl
-----END PGP SIGNATURE-----

--=-+FFLPuXOIBC694qENGcJ--
