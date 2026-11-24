Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555853;
	b=UCucLxR8yG67T3vQVrUbVJGJgnCo8uJdmYuJAMPjqe7WKU9QHpHSKeAgYvzLtD4JYyxi
	 L1zoiRyIlE08hGvFeoY1izE/oLC3nynU96GG1skHv5r0SBewIXNXpizNQClWYvm7tQvoI
	 yoanhY4Ti/Q96WvTERjypiZNQmgdZovo6Bn8Bhppw6saWM1XATmkMPQKxj2UZ8Fpfettt
	 JD6DIYR5CoGkBrtk+GQMrxCP5/qVYresk8JmeOXEkXhR6/K9kGsbKunViKPqwPP0sY+Ql
	 d0DzcYvh2C5DTyP9cLIFsn+SrK9F8z96RlbrSJvEpPqcVSaHHgvROJjYOAlF7Zm6iCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=JTZbfiL8h6libj4MHWHrf7zVUgJWzRuBE28KYs3BHsY=;
	b=pw1MwIp2rIm5L+B3xneiBId4/oPxV7oDoeOd7LjoCvlhxhD1LNSbQ9T8KvzNn/WU3Vqv
	 ZINxetRknqWmJ9dvJyNF1DhaC2DyGqvriBLrUMIvN7+tPYnPmmyHPkj+HOenySm4rNRUc
	 HZjyr2bFrobzj03mcjed1hvcVdY2LoAHDIq4EEHRF2o7bBTA/Ikigs2796LAJ/FNtOtUh
	 36Iv6T0FySI4KQqR9ZqS4COw745rBz6sfK9+S+NviH8jfTk+XAazlmqiG9wIo9XYxwfqb
	 StHIvKlXW8sBn+OAgrf6joNc0Ap0EXnbcImaOsQP3qcHz/XJT2SQ5sO0/lJapNEUB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ALHMWXUp;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7549C606A337
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7549C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ALHMWXUp
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c1f548f87so68747966d6.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795555841; x=1796160641; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JTZbfiL8h6libj4MHWHrf7zVUgJWzRuBE28KYs3BHsY=;
        b=ALHMWXUpnZEvK9/BEsWmjRwq009fO97rpoTohQDD2Nnq9Wtu5HoHwrosgK3qUsIQp3
         0KMPSp6yyspwsSi77gpjC00nJF+tBAn4jtov3PMXYs8sqPyMX+cORn/l+7ZFn/+e1rUI
         MlaOS1LroW8XwrQ7NOMGapb1Ll5C4pt85bEE0ANFR8mKOprWoHyr1qFsOBt6T36szdd/
         5INgk80TiqJKgKNDAf7c5yiks/lOh4AozkXjMnZBA64i8rqWecbJIYdLk9N61CeowDku
         t62RI7blWr9oDjHCzpEmK+mPaT+/zHSzE1zXOoG4XQOdAQBkbbd2nYFJmkH/ehPqLFN6
         31og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555841; x=1796160641;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTZbfiL8h6libj4MHWHrf7zVUgJWzRuBE28KYs3BHsY=;
        b=uN9EWikpxaqC100JROQ8k+zp9UDEgKiJ/Fdz9h1JOKZ8OTPID2AXU6MsraK6i3wu6S
         /54idVCL3HH1jwBPhPXCPrwUcQACodPeu8cGS2lsnY0ej0AFN2AMmqmSRr8eUtkLjBrB
         1CkQ/bNOJQvyZmu8oBG5tGc7y+DjFf1pN9k363KFyYc8DnyGryxdEG4B7KQ05rSevvIL
         GugIjPqmFmIrZpzRZAitwzsGYfeoy5HMpKdaDWWoJnhGe2XnDDlSCtjmito+GnwKDBWf
         7N15S7n7SSgcQFArwD6TeocwIlwpcFpepwktKWgjzNGim8VzpLrnCB315uZbqYSWaJDp
         JuAA==
X-Gm-Message-State: APuU4Z9L4Vtr+HNcKD/ZWa7W9VOfILb5/PxJ9GYHGBCXy6lRgwevofNm
	dLn8+qXylpGld0Pfi1FNk1oM7XpM1MTQEazPPpe7eN7V3Z5XHIbUB3cIh/9bana5IT0=
X-Gm-Gg: AZFdTZfVqTYox+r5yD01/0vbm7rY459NX26bXdLAOGhTlYQ/JLJkaeYIA2Vez22DLUq
	IuH5BbFeGWxc3vg0EBZcZdCB8Zyoiuwcc0nBd87w+CzLycZjMHV511oNBihBL602X4WynP59xkL
	LSlxMXwHDmRt8aRAxGn9kwt3CwCD/cysB3ZZugprGG6XppVBsaxfrJjTMMyBxKA89/+WIQTTJ9q
	PE3MKvIUEfjoF4UeMaa6cEPsep5zLjZR7LEYEx12ZHPiljHbKwjD4I67wsx79+Ka8XNS7H8JrNW
	nWifs9uw5umDwNlqvsBwjDSUAIImtFZKRShb6gARl9mjjl+ESSimznQJspJkOc9kbfrBG9U4qcm
	rdn5F+YwBC4tx6VIQn2AVTAHLinOlz0R8ZtQbQXGu2iWM3FfMid1NzuX7k2AeacynxwsV8614QO
	j542NGsNfkx6se1bQXPyHsrnl2dB3VyXb0LHzAxv/JohALxkENBSAKU4UfhP+vno7YpByPg8pwk
	8px9OUOTntGPGAbm9lzeRaHLnYI2q+oP8hMslpCRiL2beboPHTG3Rjb0peDk4/xx/7sYdFUK/FP
	gs436xZxBgW8dutyvfsTf4oeXp53YpvuiezpMc5bw38G/QSN3qCdnVo=
X-Received: by 2002:a05:6214:8616:b0:91f:2374:d001 with SMTP id 6a1803df08f44-92134aef4e6mr298052886d6.25.1795555841277;
        Tue, 24 Nov 2026 13:30:41 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d2322sm147433536d6.19.2026.11.24.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:30:40 -0800 (PST)
Message-ID: <e20c4d1d343b3162394c9f900a7bacf698ad04d8.camel@ndufresne.ca>
Subject: Re: [PATCH v2 12/17] media: rockchip: rga: move rockchip_rga
 allocation to master probe
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
Date: Tue, 24 Nov 2026 16:30:39 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-12-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-12-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-0iHuTyOqnMvKgly+r/YZ"
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

--=-0iHuTyOqnMvKgly+r/YZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Move the rockchip_rga struct allocation to the master component probe
> function in preparation of enabling all cores. This also adjusts the
> allocation to use the actual number of cores found in the of tree
> instead of being fixed to one core.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 32 ++++++++++++++++++-------=
------
>  1 file changed, 19 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 367df0ee7b02f..37ccac5b406a4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -741,7 +741,7 @@ static int rga_parse_dt(struct rga_core *core)
>  static int rga_core_bind(struct device *dev, struct device *master, void=
 *data)
>  {
>  =09struct platform_device *pdev =3D to_platform_device(dev);
> -=09struct rockchip_rga *rga;
> +=09struct rockchip_rga *rga =3D data;
>  =09struct rga_core *core;
>  =09struct video_device *vfd;
>  =09int ret =3D 0;
> @@ -750,17 +750,6 @@ static int rga_core_bind(struct device *dev, struct =
device *master, void *data)
>  =09if (!pdev->dev.of_node)
>  =09=09return -ENODEV;
> =20
> -=09rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->core=
s), GFP_KERNEL);
> -=09if (!rga)
> -=09=09return -ENOMEM;
> -
> -=09rga->hw =3D of_device_get_match_data(&pdev->dev);
> -=09if (!rga->hw)
> -=09=09return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match dat=
a\n");
> -
> -=09spin_lock_init(&rga->ctrl_lock);
> -=09mutex_init(&rga->mutex);
> -
>  =09core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>  =09if (!core)
>  =09=09return -ENOMEM;
> @@ -941,9 +930,10 @@ static struct platform_driver rga_core_pdrv =3D {
> =20
>  static int rga_bind(struct device *dev)
>  {
> +=09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
>  =09int ret;
> =20
> -=09ret =3D component_bind_all(dev, NULL);
> +=09ret =3D component_bind_all(dev, rga);
>  =09if (ret) {
>  =09=09dev_err(dev, "component bind failed\n");
>  =09=09return ret;
> @@ -968,6 +958,8 @@ static int rga_probe(struct platform_device *pdev)
>  =09struct device *dev =3D &pdev->dev;
>  =09struct component_match *match =3D NULL;
>  =09struct device_node *core_node;
> +=09struct rockchip_rga *rga;
> +=09u8 num_cores =3D 0;
> =20
>  =09if (!match_desc)
>  =09=09return dev_err_probe(dev, -ENODEV, "missing platform data\n");
> @@ -979,6 +971,7 @@ static int rga_probe(struct platform_device *pdev)
>  =09=09of_node_get(core_node);
>  =09=09component_match_add_release(dev, &match, component_release_of,
>  =09=09=09=09=09    component_compare_of, core_node);
> +=09=09num_cores++;
> =20
>  =09=09/*
>  =09=09 * As multi core is not implemented yet,
> @@ -989,6 +982,19 @@ static int rga_probe(struct platform_device *pdev)
>  =09=09break;
>  =09}
> =20
> +=09rga =3D devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cor=
es), GFP_KERNEL);
> +=09if (!rga)
> +=09=09return -ENOMEM;
> +
> +=09rga->hw =3D match_desc->data;
> +=09if (!rga->hw)
> +=09=09return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
> +
> +=09spin_lock_init(&rga->ctrl_lock);
> +=09mutex_init(&rga->mutex);
> +
> +=09dev_set_drvdata(dev, rga);
> +
>  =09return component_master_add_with_match(dev, &rga_master_ops, match);
>  }
> =20

--=-0iHuTyOqnMvKgly+r/YZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYB/wAKCRDZQZRRKWBy
9ECCAQC+deSrUC8XaYp7KyJkq6hxi/cBcfk+FAraOaSImCZpTQEAlogWlperaC7/
3uOxWQhYh5ZmAsh6d2alRohlL9U3WwE=
=uDa9
-----END PGP SIGNATURE-----

--=-0iHuTyOqnMvKgly+r/YZ--
