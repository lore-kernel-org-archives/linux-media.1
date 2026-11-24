Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556160;
	b=0QXqKF1a1Y3C2rLCaryaCktgjSz7BCSnduz0Cw6ERKJM9EOIH1eyL2omvQCM2o2XLWe1
	 Mlc2k7/6oeVrCN+Q7iK/AfdbtuqJMpQ1kgwYIHl39DDR5xSrVjIlQpa5hhkyyjsLkq3UC
	 lJG/pyOpCtosePGEOTRTVVJpexsEpG4UbY3GcfEDOeCKK1D8A18Sb9d6TOHrp7Q4T9QSG
	 4Rz5cUyPb8inFYbY5fm/bJ7Vswk6qd6aHT+vZtnb0vp0JbEGhJlGxG4/ZScXQRAMfQjsQ
	 /7Du3HvgHsSTC5BY07305XD9H75WLfXai97uoX9AZhoQWxrLzsd0YvAylet2uY300Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=PjbL4Wa8IiosODxBRnpJBDdjeGxS7zFTOO9eh2kHpB8=;
	b=aIx0//rV3v67v+uBp4Eyrn6XaWKRWlxhKFK/8bWQUMbMKFt8D4qS03gOKnPy3DqPNyIJ
	 ryAbaswUlDpJJCAlQvAU/uoqnAP/NVyfCrj2EoWuvxliyrs/kQ2cKPJmLJE5oW6CmOs6F
	 Fknqi8FnIgEIJbhUSTyZYM4S0xNzk0OkbSi6sb27LAHijprMQBNp6gE3p6EfYo4Qd59HZ
	 GjoBb0DHwmYZgPqgoWhVKx0T7hdI8iXP1njBmf+rUNLcqM3NDnR9xG7youQjztpPZ3HVq
	 QTvWNYfoaxYW1psFHDj2zFOxZHqey+dOten8uWNyQExhVzVzletRTARUMUDnHoQY9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jKrG37Kl;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41430606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41430606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jKrG37Kl
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-921318b2eb8so65337246d6.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795556158; x=1796160958; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PjbL4Wa8IiosODxBRnpJBDdjeGxS7zFTOO9eh2kHpB8=;
        b=jKrG37KlHlMRvA9ic8N3tUnFOFKZRoduFnKTAyfuGglMlRN1E4GwFHY2Ixq9vHnrYU
         kklMwwDPfgqT+nzvWf5aIGmbST9jdsD+nA1ov6rDWJ+p6u7f8kF6XJyQeDRNITwNiT9N
         Ai1OX4eawPMQbb9QyfXybdbZRXk13lc4fLDDXy6A34twm1cgV5Kbs4F2gO+4LLiVMCBg
         BAQonSA66LvrdApFuL8mWbuwsmKVkmm423g0nBjygNqplqmjwWO0/xpZn+DLpA3OhZhX
         C29MeaHdxP6BevVvTYsSHXFfwh5AUq8r3janbGXeZvoyL74Y0/RvKLBd3ueoB48xj9Ju
         xf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556158; x=1796160958;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjbL4Wa8IiosODxBRnpJBDdjeGxS7zFTOO9eh2kHpB8=;
        b=slQH6LNCQt1m71EWcg+VA1WqKPo5J30N17zQmbbrFQMcRiabRrNoCqobfxFq1OaM8Q
         HE9WFGrGfYWakrAOxxTJDreUFn4JPbjsBUKXoUb652v8y6oyvtlg1DHI79xdiTczy0YU
         agjchklROCGoPTokPWIP3di0RPM5AVd72LMW//bXxsuxZh6F+tafQM8jlnYYFdS/EwIX
         2Y+X+lRFkJ4FTkV+r+8J+QA1xMCBpnZTk9jTulXjyRtk3FWaUcqu/Dp25RPXT0yaZVyb
         3I1Tqj7L2TYoAnK2Ickt0LPedAQONhfGsYh9xsf+ZC/CCvF4VukDxcuIarbLwol2CL+Z
         Rbuw==
X-Gm-Message-State: APuU4Z/tNC1gkUisrKw7GmjfVtQ/B7n7yXQ9oUpwGg6oryvy3eweSarC
	zK03cAyaEDXMr2VUJpVtO7ehPu2+qqtEQhm83ohAzG/T4TzFcRxWYqf0wgyx82HTvJY=
X-Gm-Gg: AZFdTZehG1yFAEVY+z8t0mM3FuaVcdvzf2Z6++DgeGxvvAj1W4yt0Cvp9fQk3Y95+QC
	74fhf89dGsez4mzx6yQdY6cGvNScr+nRdt/o0wb9ds3sTyjAlX5cQSd47Tfl5oozSJ5T1TfJSG6
	AfegK7tOknuXOwhx660KZBrjNFjIcr6GEKPZno8xTBnLkYln/l4F8wnGrx1FfNWSPfRxN/MBtFx
	gG2orkttaraAM7qu5GFOnH2NaRVMz4DrC5XU+CJQ/vAD8vAsAph1dipw4p+gRI3doPWDV6xdB/E
	fFeXr5xdhJHncscB5f22HddnQphhatOUZ4+SUlhwc/eVXIZYSfI/DT26Bqhl94IZxxsLq2lMOwS
	5Q43blXJIzxjaulbKLZzVBoJItUEv9c32yTKJ52eKN+ehAotc/gttQZM+l9CBktRKWLbEDJ0Ksg
	oyPfPGa8g7Tkr3Fwjt+oCHFZCQyh7JNFDMVclCmMnal+2NO0bAj7zDb6rAYHqG+IE/2rleSKqvo
	ciqvoBR0TWysT1fZIt5JonWGRWKTW7OxLOTGV+ty/nZbZ+B3tm0CO85VQYR8qGhoKrnrVYseP/5
	8ECgLhSdWOkgX5o1egCUROQyK1n9dnw3c9n2U+hCZtvysmwyApPRyAurtWX5AyIZSSsOGkNDk+D
	l
X-Received: by 2002:a05:6214:5348:b0:921:2215:5ca0 with SMTP id 6a1803df08f44-92134a3a1bdmr287245606d6.14.1795556158160;
        Tue, 24 Nov 2026 13:35:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a1d948sm144137676d6.40.2026.11.24.13.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:35:57 -0800 (PST)
Message-ID: <ad0545e9caf7ea1e0f4804f7b461f0747fb9b129.camel@ndufresne.ca>
Subject: Re: [PATCH v2 13/17] media: rockchip: rga: move core initialization
 from bind to probe
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
Date: Tue, 24 Nov 2026 16:35:56 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-13-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-13-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-1LAzSwIaGZzBAdtbh8uL"
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

--=-1LAzSwIaGZzBAdtbh8uL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Move the core initialization from the core binding function to the core
> probing function. This better matches the actual sequence, where the
> core probe initializes most things and the bind function just binds the
> core to the actual rga struct from the master device.
>=20
> As the probe has no rockchip_rga struct, it has to get the
> rga_hw struct from the of match data to determine if the given core has
> an iommu.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

I don't think sashiko report is that much relevant, but please have a look.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> v2
> - indirectly fixed component_add error path not using goto err_put_clk
>   by using devres version for pm (pointed out by Sashiko and Nicolas)
> - reordered commit for a better diff
> - Avoid NULL pointer deref when interrupt fires on an unbound core
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 97 ++++++++++++++++++-------=
------
>  1 file changed, 55 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 37ccac5b406a4..fa34b93b1b7a5 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -72,6 +72,10 @@ static irqreturn_t rga_isr(int irq, void *prv)
>  =09struct rga_core *core =3D prv;
>  =09struct rockchip_rga *rga =3D core->rga;
> =20
> +=09/* ignore interrupt on an unbound core */
> +=09if (!rga)
> +=09=09return IRQ_HANDLED;
> +
>  =09if (rga->hw->handle_irq(core)) {
>  =09=09struct vb2_v4l2_buffer *src, *dst;
>  =09=09struct rga_ctx *ctx =3D core->curr;
> @@ -740,55 +744,16 @@ static int rga_parse_dt(struct rga_core *core)
> =20
>  static int rga_core_bind(struct device *dev, struct device *master, void=
 *data)
>  {
> -=09struct platform_device *pdev =3D to_platform_device(dev);
>  =09struct rockchip_rga *rga =3D data;
> -=09struct rga_core *core;
> +=09struct rga_core *core =3D dev_get_drvdata(dev);
>  =09struct video_device *vfd;
>  =09int ret =3D 0;
> -=09int irq;
> -
> -=09if (!pdev->dev.of_node)
> -=09=09return -ENODEV;
> -
> -=09core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> -=09if (!core)
> -=09=09return -ENOMEM;
> =20
>  =09core->rga =3D rga;
> -=09core->dev =3D &pdev->dev;
> =20
>  =09rga->cores[0] =3D core;
> =20
> -=09ret =3D rga_parse_dt(core);
> -=09if (ret)
> -=09=09return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n")=
;
> -
> -=09ret =3D devm_pm_runtime_enable(core->dev);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09pm_runtime_set_autosuspend_delay(core->dev, 50);
> -=09pm_runtime_use_autosuspend(core->dev);
> -
> -=09core->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -=09if (IS_ERR(core->regs))
> -=09=09return PTR_ERR(core->regs);
> -
> -=09irq =3D platform_get_irq(pdev, 0);
> -=09if (irq < 0)
> -=09=09return irq;
> -
> -=09ret =3D devm_request_irq(core->dev, irq, rga_isr,
> -=09=09=09       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
> -=09=09=09       dev_name(core->dev), core);
> -=09if (ret < 0)
> -=09=09return dev_err_probe(core->dev, ret, "failed to request irq\n");
> -
> -=09ret =3D dma_set_mask_and_coherent(core->dev, DMA_BIT_MASK(32));
> -=09if (ret)
> -=09=09dev_err_probe(core->dev, ret, "32-bit DMA not supported");
> -
> -=09ret =3D v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
> +=09ret =3D v4l2_device_register(dev, &rga->v4l2_dev);
>  =09if (ret)
>  =09=09return ret;
>  =09vfd =3D video_device_alloc();
> @@ -804,7 +769,6 @@ static int rga_core_bind(struct device *dev, struct d=
evice *master, void *data)
>  =09video_set_drvdata(vfd, rga);
>  =09rga->vfd =3D vfd;
> =20
> -=09platform_set_drvdata(pdev, core);
>  =09rga->m2m_dev =3D v4l2_m2m_init(&rga_m2m_ops);
>  =09if (IS_ERR(rga->m2m_dev)) {
>  =09=09v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> @@ -855,6 +819,8 @@ static void rga_core_unbind(struct device *dev, struc=
t device *master,
>  =09v4l2_m2m_release(rga->m2m_dev);
>  =09video_unregister_device(rga->vfd);
>  =09v4l2_device_unregister(&rga->v4l2_dev);
> +
> +=09core->rga =3D NULL;
>  }
> =20
>  static const struct component_ops rga_core_ops =3D {
> @@ -864,7 +830,54 @@ static const struct component_ops rga_core_ops =3D {
> =20
>  static int rga_core_probe(struct platform_device *pdev)
>  {
> +=09struct rga_core *core;
> +=09const struct rga_hw *hw;
>  =09int ret =3D 0;
> +=09int irq;
> +
> +=09if (!pdev->dev.of_node)
> +=09=09return -ENODEV;
> +
> +=09hw =3D of_device_get_match_data(&pdev->dev);
> +=09if (!hw)
> +=09=09return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match dat=
a\n");
> +
> +=09core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> +=09if (!core)
> +=09=09return -ENOMEM;
> +
> +=09core->dev =3D &pdev->dev;
> +
> +=09ret =3D rga_parse_dt(core);
> +=09if (ret)
> +=09=09return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n")=
;
> +
> +=09ret =3D devm_pm_runtime_enable(core->dev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09pm_runtime_set_autosuspend_delay(core->dev, 50);
> +=09pm_runtime_use_autosuspend(core->dev);
> +
> +=09core->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +=09if (IS_ERR(core->regs))
> +=09=09return PTR_ERR(core->regs);
> +
> +=09irq =3D platform_get_irq(pdev, 0);
> +=09if (irq < 0)
> +=09=09return irq;
> +
> +=09ret =3D devm_request_irq(core->dev, irq, rga_isr,
> +=09=09=09       hw->has_internal_iommu ? 0 : IRQF_SHARED,
> +=09=09=09       dev_name(core->dev), core);
> +=09if (ret < 0)
> +=09=09return dev_err_probe(core->dev, ret, "failed to request irq\n");
> +
> +=09ret =3D dma_set_mask_and_coherent(core->dev, DMA_BIT_MASK(32));
> +=09if (ret)
> +=09=09dev_err_probe(core->dev, ret, "32-bit DMA not supported");
> +
> +=09platform_set_drvdata(pdev, core);
> =20
>  =09ret =3D component_add(&pdev->dev, &rga_core_ops);
>  =09if (ret < 0)

--=-1LAzSwIaGZzBAdtbh8uL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYDPAAKCRDZQZRRKWBy
9C8BAP96KhNnPyp6c7icyZBmiQPklgkS45OBuWgpKtV74WtG4gEAg0B6t6w8Hkn9
CttDJvFiRAACUl3ielwZ52l2M0lO7Q4=
=YPtw
-----END PGP SIGNATURE-----

--=-1LAzSwIaGZzBAdtbh8uL--
