Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556641;
	b=PF3Lf3Na02ODnUNRaycZgcG9mRknVZaiZOxZlmvhihigoCJwIy4P5csWLTJ2XCqjVOSQ
	 bEnj0e21SVhAHjNX+kcRlsJGrkyXp0nCAABu8v0OmZLSLVphxDk88gMnOjiTeNfyJ2Fb4
	 pct7+pmCZHAEbJdswBYbQZo4LpsFozljsoX/H7X8ogmtmDP5hZmsGJk5W7SxAC1XQxU48
	 Aekd8KmjldhLpj2Sg3UptbhnRCWd51WoeprYM2tYkRtAMaaG+DkMQbEpcc1HwXOSVPsBq
	 5qPbJN4cJDDTaOynzm4eznyHW4tH/TyJ34Jj3l82BI150fZ7sTfb23q+dRYCRlfk20Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=K75pxNkSXMitBetgHqOhrCWvaHGIRkdfbpsqksN5qNE=;
	b=ITb5u4LFfD1cz6ZiOlLuhcL10mxfSFhI4KjzOqlTb0L2zncAGpcLAA97Hrje7dQr5vzS
	 PqJFo55rG6QwiCttBRr8tw895aiBC8FpLhE9B/y2Xv1zltXkSiKPb19fI7PfjW1nY9L+R
	 MdiDlYZWQCikvLmapgtXfEF8fxeuBlMBulcMDD2yezXat31VH1kWKedRI32+LMlqR3b2r
	 agzGw3ksc5JhqaUqfKjGqaLBoVSLNsuUXfDkbtr6m6LCu5B+V8IMI4KUuIX/o0WkhFAkB
	 qbuCnVR4mexz+rgbK9SL+xub3kBkThSpa/8wnCiGxfhhjXlcAMWXvOLffBMLSu8DQ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G0wtoST8;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C5606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 079C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G0wtoST8
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f20c3aaa5so434242785a.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795556639; x=1796161439; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K75pxNkSXMitBetgHqOhrCWvaHGIRkdfbpsqksN5qNE=;
        b=G0wtoST8VFpslUG6xoyeSiuJqXc7ahOueMHgesNrBx3q3tfF5mtXehL2OV4OGZTl5i
         rkv8tiEifNGNkEct/L8T0Y/Hx5GwJOXz3TOVz08Nu0yvFydIXo2XZmuCLVF+8bxa4VMS
         4TPpo0G3XwJJNDd7+B7QtUorPZSs1qFO49FtO9fs5VhgPtLY6wOdK6njkrqWOMhqPjIj
         UUH7sXHWkDSxgekMlkQNdPxJ6FB58hUtWvod+5VkVrTEYWwBzzfiM3IffwxZL84h3LKk
         zc5OAqLKX4i9lMh7cylP79J2Qp2U0+7RYiXhuwW9be2B1zJCX5daB5jrq7gHXpWg844K
         5K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556639; x=1796161439;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K75pxNkSXMitBetgHqOhrCWvaHGIRkdfbpsqksN5qNE=;
        b=hvL34Y2wUURPe4AAzLSJYnIoq3+n6FvOcHrefCvCmDDTzaos+BsAImoc+X7IZVXgVA
         Hhq/O3xotHKQbTVAYJ5uku7xheybeBipCj1vu3VfnDxiR/BFg5P3QlIscyTCX2EWrVyX
         7fF9RFS6oC73aGCNFft8FiIGTFNukQ4tKIJDM9/7rGcwXMyTo5c2+mbszijtvoDzfQv8
         9LSXWofmh4Xogl+No/pY5XisXgmgUFNHQYPLIPx68iHDV5GXu+8i1idUKDQCXCOmlOuE
         DRx6FhKFByhMtxYJ+Ob0Sh6zGVs1KWketfix0CEi/3lIGHOjIWcSyYg+b9/T3Gk8qw22
         gMTg==
X-Gm-Message-State: APuU4Z+IDR7jobMX2/YkVN2ogh4Byb1hU/v5cegVZMDSsRBxEIFrUSGY
	94wv4ts/W8ln3Hi74GGzFy7doSskHfhhQq6eduUdIpWHyhTpjvRcn4iaPMT8aTTHVfQ=
X-Gm-Gg: AZFdTZf2BKavY4ucOECh+PkzZXzN44mw/jgCpsmqfov0cBJ/+Wb2vQ/03GK4zrw3qgA
	ly8VJ3eAl37fOOycjYpNCQnHbIf+Y/X/2EHHzn6ES5OP7B7og8d0VMd5VrRd3wsjweZW9undxWk
	JjQLmAHdD80WNs3BJMfHZFEtQ2fVZF+fBsA6mqYJJRx4ESF4cr4Qfhou7+3spEay2nFSMbl1Cau
	EdiQgYdy3BPDi7ewVwIpmK0fA7ySOt82gbZ1yFPJ/cFogl38hJ9J/NK8LE4AKRHXZF9EPTw5lNJ
	llj3lZuL0tDvVt8J/OJ2B63A3dTUERMd2Ri2PkV7hEWSaoQ7NA/7Uz0I48OJ0+DZJCKyGgRduhc
	0ySZcsb0zfAexfpXo4OUOG9OxUPxw5XEeWVUAEBnPbar0TZPFUgeteCfmN7iK5JgNyg3YL/E+c5
	bXaLiQdowFX6ryGwqv86KxgJDR7I6TGhL6T9vll/gx9SRWry/ZH2we6HOGNFN6QBaOkgIdwXyUU
	5LtRnoSPn4VUDDuY9NjpWZ9NaBQ9aF/WDEDhtQrpNg+arElilRNDyzu82TBzpJ0cK1XnPiIbg+2
	fjhsOUTRVNgQM5mqPQDA6TTuevKL0wO2Q25Srxov0KFiYR5oCTn4MI4=
X-Received: by 2002:a05:620a:2708:b0:93e:7944:b869 with SMTP id af79cd13be357-949bab1dacfmr2718566385a.42.1795556638916;
        Tue, 24 Nov 2026 13:43:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949c555faf9sm1038617585a.0.2026.11.24.13.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:43:58 -0800 (PST)
Message-ID: <e2efd3238a5adaf41af0c6edf9c32e2705f683b7.camel@ndufresne.ca>
Subject: Re: [PATCH v2 15/17] media: rockchip: rga: bind all cores to the
 master
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
Date: Tue, 24 Nov 2026 16:43:57 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-15-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-15-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-S18NZIspGqx/2Sw1fM9/"
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

--=-S18NZIspGqx/2Sw1fM9/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Bind all core components to the master component. Previously only the
> first core has been added to the master device to avoid creating
> multiple video devices. As the video device creation has been moved to
> the master component, it allows us to bind all cores without creating
> additional video devices.
>=20
> We expect that all cores to report the same version number, as we only
> add cores with the same compatible value. This is important, as  we
> setup the command buffer before actually scheduling the work to a
> specific core. Therefore adjusting command buffers depending on the
> version register only works when all cores have the same value.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2:
> - Fail (instead of warn) on a multi-core version mismatch
> - Also decrease the num_cores when unbinding a core
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D13)
> - move rga->cores at the end of core_bind here
>   (previously done while moving code to rga_core_probe)
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 36 +++++++++++++++++++++----=
------
>  drivers/media/platform/rockchip/rga/rga.h |  1 +
>  2 files changed, 26 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 39fcb5623095b..5348fcc03c525 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -746,23 +746,33 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
>  {
>  =09struct rockchip_rga *rga =3D data;
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> +=09struct rockchip_rga_version version;
>  =09int ret =3D 0;
> =20
>  =09core->rga =3D rga;
> =20
> -=09rga->cores[0] =3D core;
> -
>  =09ret =3D pm_runtime_resume_and_get(core->dev);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09rga->version =3D rga->hw->get_version(core);
> +=09version =3D rga->hw->get_version(core);
> =20
>  =09v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
>  =09=09  rga->version.major, rga->version.minor);

Use version here, instead of rga->version.

> =20
> +=09if (rga->num_cores) {
> +=09=09/* we are not the first core, expect that we have the same version=
 */
> +=09=09if (rga->version.major !=3D version.major || rga->version.minor !=
=3D version.minor) {
> +=09=09=09v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with differ=
ent core versions!\n");

pm_runtime_put() is skipped, maybe some more cleanup? I know this should no=
t
happen in practice.

Mostly from Sashiko here,
Nicolas

> +=09=09=09return -ENODEV;
> +=09=09}
> +=09} else
> +=09=09rga->version =3D version;
> +
>  =09pm_runtime_put(core->dev);
> =20
> +=09rga->cores[rga->num_cores++] =3D core;
> +
>  =09return 0;
>  }
> =20
> @@ -770,6 +780,18 @@ static void rga_core_unbind(struct device *dev, stru=
ct device *master,
>  =09=09=09    void *data)
>  {
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> +=09struct rockchip_rga *rga =3D core->rga;
> +=09u8 i;
> +
> +=09/* Remove our core from the list */
> +=09for (i =3D 0; i < rga->num_cores; i++) {
> +=09=09if (rga->cores[i] !=3D core)
> +=09=09=09continue;
> +
> +=09=09rga->cores[i] =3D rga->cores[rga->num_cores - 1];
> +=09=09rga->num_cores--;
> +=09=09break;
> +=09}
> =20
>  =09core->rga =3D NULL;
>  }
> @@ -992,14 +1014,6 @@ static int rga_probe(struct platform_device *pdev)
>  =09=09component_match_add_release(dev, &match, component_release_of,
>  =09=09=09=09=09    component_compare_of, core_node);
>  =09=09num_cores++;
> -
> -=09=09/*
> -=09=09 * As multi core is not implemented yet,
> -=09=09 * break out of the loop to only have one core per rockchip_rga st=
ruct.
> -=09=09 * Also put the node, which otherwise would've been done by the lo=
op iteration.
> -=09=09 */
> -=09=09of_node_put(core_node);
> -=09=09break;
>  =09}
> =20
>  =09rga =3D devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cor=
es), GFP_KERNEL);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 94e14c2a2ba6e..522021c3e0249 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -89,6 +89,7 @@ struct rockchip_rga {
> =20
>  =09const struct rga_hw *hw;
> =20
> +=09u8 num_cores;
>  =09struct rga_core *cores[];
>  };
> =20

--=-S18NZIspGqx/2Sw1fM9/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYFHQAKCRDZQZRRKWBy
9JrdAQCUIkDVrw3+EoP8Ue1222LowADVIPyRvbxq5uVXsnQwsgEAjWrOYaUn7LBp
yWr81kHaqm0ymKihIGhaG7/fRJBbxAw=
=0Uj+
-----END PGP SIGNATURE-----

--=-S18NZIspGqx/2Sw1fM9/--
