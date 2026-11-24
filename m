Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557056;
	b=xgQFNhz/2VLyftCWrpW0x8sD/BLnq0N6sM8YonQNu1CO/YXGWZmaU2C0teCSrDCJHBSF
	 eBbiHjMUaF7S9ZP4XiTxJkEwn5Rwf2KSafZ6FXb+xLmA8AgkZZ9REbaGQwI+x6a6BCdm6
	 NgVYVAs3YLMvHBbgr83Y4sza/Wcd90OY2qLNh1INBsv7dNgTatN67i/SLwVcerNULFJpW
	 22XaArV1Cu9rjIpuFoD1W4WHPhUH08PkuUuYHx7v6MjtvjgHqIh6GuwUqIMmsMJ8sel0Q
	 QZIqcmGa1jUiygb2o/EiYHA+vyi7GLDkpYOj6VcsSAgjQNAk5zShG95lBrxcnKfHM/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=;
	b=4pGBTZ3dDKaCdq8V68Ln5IFpLCGiloFAT/TQObA9YzyZJJ2y8fM5RLCJryiw6SJMISsU
	 aNEJAdnYYfKCPCeJGWetCRSDFx9w1YGYPPJhfuPjM89c0EjuUQccoXKiCz+6vMnabQHYH
	 DAGoRvNQoeAuVsYO0BMOFIeSjve4ra1tIec87jmjC/85kH2HZVkQc2JY9nZ88IlUyO7c/
	 Fp28vXKDykNy9p6GM9QQ/zz03g2E9Gva6cEAW8n/xRAFsBGde4DG1fD/rMmePerfbXj3y
	 3TqkAk2V6i2F8SikoxKjPhr4LKfYazBuSufee08/e6Afao9oPnGGbIjgTW6bFEk8OYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EIA5OVv4;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41BB606A334
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41BB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EIA5OVv4
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55d30c054dfso53564831cf.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795557055; x=1796161855; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=;
        b=EIA5OVv4lqgsmtllpkq84bX7n7pysJ5rppqkAfIU+lh/KpkplAHMhS8YbQDLDJXyZp
         rr3nYUaDHCzVcSdxrtXuT/NSOEs+OXrEegYgZYLLYJSnBTU/5d9I/v7EXWL2736o0Q1S
         eXA5LyZqVEhHucQXeZXpAbG6SZOxOK5x/ehbaXFdnNCYXcB36QI1Vh5FcpenVSUV/eER
         ah3K2qzxVzTEYyBNIilLtG1+5pNhCG95mhLjBQwniGdyqoT4ZdgFdAhJDPJBxR6BgdNn
         mxdopQ3rG629WuwLzXGvcU5Z6t66vq5rfKr0gxXmb7qHdluJ7LY9lCtT0X3/qxm/VEXy
         nm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557055; x=1796161855;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=;
        b=PXI6/clKfgIIAYsi9emeYYjNSlTOHjHrOI/SMCmQu4dSZnTW/q5A7K/nkCp6MhghBo
         6Hg1qrV4GCRy4xymKAaRa7T9zjAUOwycTeIVLZOWMZqS+Bgayc/ZwkW635bOBFwkAFoP
         d6vaZKLUcWsFzzH/FKmgeWIvROev668BHCMXSL+wXbvF9/gTcpxLhzc46KGlqOXiK5WC
         psM7ffqMvShKSJ1bmCo2ZnsE+BTueBPs1ww854008jtBDfkxVU9+x1XMqOWOoT3UX/oP
         mIGovE9NLSBtVNjuuiUqayzMKIrUslPqUmB67ARumUS3R8Sm2ZgBFwoRgbOhgsuRkCxY
         BD4A==
X-Gm-Message-State: APuU4Z/JL3mXJkv1uRfPNwYcQ3KfpO5PIVlDOI2h3g3J0c/kYin531rK
	D3teTcz2ZghAMoayWZqy/gdNxWHR2lrj4mwxJ7ex8rpoVs14C2DpswQ8eLRImckCuuA=
X-Gm-Gg: AZFdTZe4UlGgw1h97SSnfXKRnFWLFDRULvajAxF8dxokGiDCHq71wzuz74GD5Hgq6cE
	215fqFwuDLunuRa0BZtX2UMOXgO9XX14UkM48d89OHd1/Tyx6OUGXBKZaPB4mclPVl9giH82wY6
	clANDTns4sm8+ltR8F4ay7AZDEmp8SEsiE2bsZrEReANmVFnAu0TEICq5jGfM5jKrYWKWfsM0QW
	wa2+7mjvHo+fXy9+ZbcZJwNg3GPKzH8EpwAGjVnriK+GYpieNVZH5N6usq3d0I4CEQr22/Kkws1
	zMzerUEEKis26egh6UP/VoX7kb9RUkx3zIy8Af03RCaZs431K7oGswPK30aGzpbixYyfiA1YfI+
	n3VaZOpV87o3InYFH06UODWnlCCeBEhhQTIj3tB51dxZZrf6wUILhW/j76Q9Ny92dwA9ER5Opds
	s71RcwaFqaS0YeOeX6qZPr8CQ69r9Gx0GfXXOv3BDmUz3l6OEm/LdoPLsHy0onNasuM/seNJL5T
	PbyNao4r+XzoO0WDKdTVDedhgoxrKfdUxg73bzXDfnlqJsODidpI7tDkexJvl5cGPL1OBUYngB3
	m7Gs2JolOELksrWZRFMggQkBu/QPkOjhwEntSwNqyrrjUkfBJLNkqyw=
X-Received: by 2002:ac8:598a:0:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-55d769e1664mr304362671cf.20.1795557054795;
        Tue, 24 Nov 2026 13:50:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm135589651cf.27.2026.11.24.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:54 -0800 (PST)
Message-ID: <d1057ae0d26a942d1e79bc09ac188dd804ff97b0.camel@ndufresne.ca>
Subject: Re: [PATCH v2 16/17] media: rockchip: rga: put all cores into first
 core iommu domain
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
Date: Tue, 24 Nov 2026 16:50:53 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-16-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-16-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-cVwN/Xd2NZTsdcaY+cOO"
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

--=-cVwN/Xd2NZTsdcaY+cOO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Put all cores into the iommu domain of the first core to allow them to
> be used by any core. All buffers accessed by the hardware are allocated
> on the first core, as the scheduling to a specific core is done after
> the allocation. Therefore put all cores into the same domain to have the
> same iommu mapping on all cores.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - Fixed domain not being an err ptr
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D14)
> - Detach domain on unbind callback
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D14)
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 5348fcc03c525..b2eeae0a61771 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/interrupt.h>
> +#include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -761,6 +762,19 @@ static int rga_core_bind(struct device *dev, struct =
device *master, void *data)
>  =09=09  rga->version.major, rga->version.minor);
> =20
>  =09if (rga->num_cores) {
> +=09=09/* Attach to the first cores iommu */
> +=09=09struct iommu_domain *domain =3D iommu_get_domain_for_dev(rga->core=
s[0]->dev);
> +
> +=09=09if (!domain) {
> +=09=09=09dev_err(core->dev, "Couldn't get domain of the first core\n");
> +=09=09=09return -ENODEV;

Hmm, Sashiko is annoyingly right, this driver support disabling IOMMU befor=
e
this change. Maybe simply return 0, and turn the error into a warning? It a=
lso
says you are missing pm_runtime_put() or something.

> +=09=09}
> +=09=09ret =3D iommu_attach_device(domain, core->dev);
> +=09=09if (ret) {
> +=09=09=09dev_err(core->dev, "Couldn't attach to the domain of the first =
core\n");
> +=09=09=09return ret;

Also missing PM release.

> +=09=09}
> +
>  =09=09/* we are not the first core, expect that we have the same version=
 */
>  =09=09if (rga->version.major !=3D version.major || rga->version.minor !=
=3D version.minor) {

Keep this check above the iommu setup, so you don't have to undo it. Not a =
big
deal though.

Nicolas

>  =09=09=09v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with differ=
ent core versions!\n");
> @@ -788,6 +802,14 @@ static void rga_core_unbind(struct device *dev, stru=
ct device *master,
>  =09=09if (rga->cores[i] !=3D core)
>  =09=09=09continue;
> =20
> +=09=09if (i) {
> +=09=09=09/* Detach from the first core iommu */
> +=09=09=09struct iommu_domain *domain =3D iommu_get_domain_for_dev(rga->c=
ores[0]->dev);
> +
> +=09=09=09if (domain)
> +=09=09=09=09iommu_detach_device(domain, core->dev);
> +=09=09}
> +
>  =09=09rga->cores[i] =3D rga->cores[rga->num_cores - 1];
>  =09=09rga->num_cores--;
>  =09=09break;

--=-cVwN/Xd2NZTsdcaY+cOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYGvQAKCRDZQZRRKWBy
9EiZAQDgH7HdEx0kZfJoihc2NEWpoQw2AZO/TWinadRHtBt/SgEA5WsnvdZUOkaR
KYMLUEnn4bMuAzk58Ugd+hcGj6IXvgk=
=dLTW
-----END PGP SIGNATURE-----

--=-cVwN/Xd2NZTsdcaY+cOO--
