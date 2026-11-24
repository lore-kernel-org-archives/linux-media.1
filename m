Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556289;
	b=z+88lJzbDKazJ8UXZySYHkLZCr8i7jq3aQ+DTkjSb8FSdNKm5HT13IagbH6rkiEpA/3+
	 2r426NVdvNt5s1HrGb6yNvaSYNelDkXWiQVyet4jEL76Jpvhrd7FiNJ4hqZSJbJvIhzNL
	 ZrRc8efJu1mqCBo8rL06t0BQQS4W388ldkRshmOGIEgkCMwHZzEAZMsIfmf0jkBw7QqkC
	 xV7zrTm4OyJ1Ep13x+3MGUcYpa2zAgSxk11m+7WIyK04ebPzVt1Pp/mfSbe8bL/uDCeOd
	 jKkvGattPSnM17ZqyqnnFTjPE4NggTxXfq1X5jdjPC7VqEctYmkYcl29H4T2tX3/4ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=;
	b=w8f2y8vI1ULQgzGWr4v8sp7y/e1ugRkpZaxId1ISrOOEwwwuKmE7myOIoaJZLc7TsJlr
	 7+DzXsOTBnhbLguFPjvfLJxB4542X21vuMsGCvTIKk1Q874S1ND6xV5iPhA1+UpiACg4z
	 H0/xv4wE1XJSoyV324kzeh0azeI/gMDEUCUI8zUcDXGJd8OcFZirgn1EUYaFs0PW2XXi3
	 WD7lAEFqK2oOUJQxuEQllY3BAmV/tQoPtMYC56cawU0RA/zzIggEYxavf3GiR6pIkRBYg
	 PoMQ8Leu7IfngJiyZEXlj2s6wExucY1v6m0mjgms+WtCy1xgl+CxcGnIvl8Sb29R9tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pAbrDNwn;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF07C606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF07C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pAbrDNwn
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-943e8d35f74so496864585a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795556288; x=1796161088; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=;
        b=pAbrDNwnBini7SLwKbiQ7kjL49InunWlLHbZ8hHQiD6klRXxTneekfApUSaJt/lUrJ
         RYX0yHob3ShFVX8L1xveCyMh9cOoAgF1Hw4Wa7VhZ8mMR3mJ1e65YzRxzzWmuo0BYvMS
         jxLkO8ACKD5V5a3rStOhvl7XyQHTtuCEX07DEPXQ8yzi8PrQgbPGmrV/ZrqU/a+b9pqV
         j0kjIelpZo9qklBJpTA9nylJwwWxF8EoN07Z2mS/8wQmIL/FYWF26C7xiEV6aVQzzPVb
         u32TsUSoCr9BSCaflqzQvvz7+WISjClQEgR+Mn19xvkrOtK6RgulWB7UFTdq4xTGiYaF
         2lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556288; x=1796161088;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=;
        b=h1NghOixZkwyrQM6k0JYQDT1VaNs3/kBpgqyTFJFYgAFxFxCfMoMvSJoX+W4HhmV3y
         u0F8OQwf1YROKBhTRBS+dGnRcnnDbHnUwSAgdc5s3sxVliIF96XO7McZxu6xFo9yXgMC
         4uet7ylrNuQbjq+eDdaImEOYDYB4PtgRDFi77Vn8ToRvpoUwIO7yql0pA7cNkjrbXl1X
         w7vrI0Kb0GABEO2Ou8W7KQOQwKht27m72DXaIIe/1Ja6Tr3bXj50KuWrjToQ2oauAtrr
         dIH9UhH4Df9SrBbLDTML7Kbx+rLhdOGpufMCUejI+1JM7LaGsn6BlGNbIwuxyFcsiPsJ
         Jk7Q==
X-Gm-Message-State: APuU4Z+Z1A4LqpxrnEZKdWBlr2dsPnjN6ierHNTZOUAuGpKbxBuZRCzu
	ya9hiKntJuvE+xghhOCPoLzwOCRf+ugjqIeXwpN+tVOuDIjSnwzxJFDhOyep9DBWLl4=
X-Gm-Gg: AZFdTZc5LRLN+e69xpxZeQXLqAHgDZNZcDGjKiq0tFlwjh+uJp2Y1nH/wrgjfmc0+13
	xWB6mbajY0kKP7p+MztSncn5pK14rhRH7OB3QHtmdpzU5t5BfUoAxZNfHapnWSXY7H02gFkOt60
	Z6Vi6ALDyX9GzdIVY0XuiruL6eNHhqd+mau483tLoC/l2Fr5Jq4T1S7VTlKsbEomg2K42UF1eHM
	K9Fd7ZXL+JzUL2i0f6yDggpgYJvIO+IDX/RAxUsW2AtJHCM6m4VvfG4P8MEmScohsS7xa8b/qaS
	oQffxDmnWAwwkQZyrscK4+xS5xGCHOwQ8O5yrPSeQ7pbsak4ButibosZ8KWPGA8inRaR7vT/nNf
	lbPcMGyjz+k8ZJGKmlTAwjteevRmahJXOnwKgd72d6FcTOzSlhBniHBsPlmdwQPWbsNV9fzts++
	/wip3BFQ08c6qfUq0CkY9o/siIGDEbhKCUWy8VNHsPllpqNBsTR5t71kmHjPUIbNnQvwN4gWhe6
	57I8OxVK6uQzoPj67VNOgG53jpuYBdwmeGzvK4xCD7sw1IbJO6jr7XUjud0hvj833BAbFaSqT2G
	cfdcT19PNy0b/rJ10lI56bu1hJlYuRqszhvs3lqeyeN5jjy1yPPJ9HM=
X-Received: by 2002:a05:620a:2988:b0:93e:c12c:f11f with SMTP id af79cd13be357-949bab3a1edmr2796314185a.75.1795556287741;
        Tue, 24 Nov 2026 13:38:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4481c2sm1133265885a.43.2026.11.24.13.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:38:07 -0800 (PST)
Message-ID: <5282c61813191d778e724ea27e0b81c554ccc945.camel@ndufresne.ca>
Subject: Re: [PATCH v2 14/17] media: rockchip: rga: move video device to the
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
Date: Tue, 24 Nov 2026 16:38:06 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-0uIQZovRXgZxDGcSLoFT"
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

--=-0uIQZovRXgZxDGcSLoFT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Move the video device allocation and registration to the master
> component bind function in preparation for binding multiple cores
> to the master. Moving it to the master bind function allows to
> only register the v4l2 device when all cores have been successfully
> bound to the master device. This also causes the video device to be
> bound against the master platform device instead of a specific core.
>=20
> As v4l2_device_register sets the drvdata (if it hasn't been set) to it's
> v4l2_device struct pointer, v4l2_device_unregister also zeroes it if the
> drvdata matches this pointer. This creates a problem, as the driver
> allocates it's main rockchip_rga struct during probe and sets it as it's
> drvdata. As the v4l2_device struct is the first element of the
> rockchip_rga struct, it has the same pointer than the rockchip_rga
> struct. Therefore v4l2_device_unregister incorrectly assumes that it has
> set the drvdata and clears it. This causes problems, as unbinding a
> core will unbind the master component, but not remove it. Therefore when
> adding the core again, the master component will be bound again and
> tries to access an NULL pointer.
>=20
> As the rga core binding expects the rockchip_rga struct to be fully
> initialized, bind the cores as the last step of the rga master bind.
> This also avoids a potential isr to hit just between the core bind and
> the actual initialization of the m2m device.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - unbind components in the error handling of rga bind
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D11)
> - Bind cores at the end, as they expect a fully initialized rga struct
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D11)
> - Fix v4l2_device_unregister clearing the drvdata set on probe
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 109 ++++++++++++++++--------=
------
>  1 file changed, 58 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index fa34b93b1b7a5..39fcb5623095b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -746,39 +746,15 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
>  {
>  =09struct rockchip_rga *rga =3D data;
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> -=09struct video_device *vfd;
>  =09int ret =3D 0;
> =20
>  =09core->rga =3D rga;
> =20
>  =09rga->cores[0] =3D core;
> =20
> -=09ret =3D v4l2_device_register(dev, &rga->v4l2_dev);
> -=09if (ret)
> -=09=09return ret;
> -=09vfd =3D video_device_alloc();
> -=09if (!vfd) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
> -=09=09ret =3D -ENOMEM;
> -=09=09goto unreg_v4l2_dev;
> -=09}
> -=09*vfd =3D rga_videodev;
> -=09vfd->lock =3D &rga->mutex;
> -=09vfd->v4l2_dev =3D &rga->v4l2_dev;
> -
> -=09video_set_drvdata(vfd, rga);
> -=09rga->vfd =3D vfd;
> -
> -=09rga->m2m_dev =3D v4l2_m2m_init(&rga_m2m_ops);
> -=09if (IS_ERR(rga->m2m_dev)) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> -=09=09ret =3D PTR_ERR(rga->m2m_dev);
> -=09=09goto rel_vdev;
> -=09}
> -
>  =09ret =3D pm_runtime_resume_and_get(core->dev);
>  =09if (ret < 0)
> -=09=09goto rel_m2m;
> +=09=09return ret;
> =20
>  =09rga->version =3D rga->hw->get_version(core);
> =20
> @@ -787,38 +763,13 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
> =20
>  =09pm_runtime_put(core->dev);
> =20
> -=09ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> -=09if (ret) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> -=09=09goto rel_m2m;
> -=09}
> -
> -=09v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> -=09=09  vfd->name, video_device_node_name(vfd));
> -
>  =09return 0;
> -
> -rel_m2m:
> -=09v4l2_m2m_release(rga->m2m_dev);
> -rel_vdev:
> -=09video_device_release(vfd);
> -unreg_v4l2_dev:
> -=09v4l2_device_unregister(&rga->v4l2_dev);
> -
> -=09return ret;
>  }
> =20
>  static void rga_core_unbind(struct device *dev, struct device *master,
>  =09=09=09    void *data)
>  {
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> -=09struct rockchip_rga *rga =3D core->rga;
> -
> -=09v4l2_info(&rga->v4l2_dev, "Removing\n");
> -
> -=09v4l2_m2m_release(rga->m2m_dev);
> -=09video_unregister_device(rga->vfd);
> -=09v4l2_device_unregister(&rga->v4l2_dev);
> =20
>  =09core->rga =3D NULL;
>  }
> @@ -944,20 +895,76 @@ static struct platform_driver rga_core_pdrv =3D {
>  static int rga_bind(struct device *dev)
>  {
>  =09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +=09struct video_device *vfd;
>  =09int ret;
> =20
> +=09ret =3D v4l2_device_register(dev, &rga->v4l2_dev);
> +=09if (ret)
> +=09=09return ret;
> +=09vfd =3D video_device_alloc();
> +=09if (!vfd) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
> +=09=09ret =3D -ENOMEM;
> +=09=09goto unreg_v4l2_dev;
> +=09}
> +=09*vfd =3D rga_videodev;
> +=09vfd->lock =3D &rga->mutex;
> +=09vfd->v4l2_dev =3D &rga->v4l2_dev;
> +
> +=09video_set_drvdata(vfd, rga);
> +=09rga->vfd =3D vfd;
> +
> +=09rga->m2m_dev =3D v4l2_m2m_init(&rga_m2m_ops);
> +=09if (IS_ERR(rga->m2m_dev)) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> +=09=09ret =3D PTR_ERR(rga->m2m_dev);
> +=09=09goto rel_vdev;
> +=09}
> +
> +=09ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);

Shouldn't this be kept last like it was before?

> +=09if (ret) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> +=09=09goto rel_m2m;
> +=09}
> +
>  =09ret =3D component_bind_all(dev, rga);
>  =09if (ret) {
>  =09=09dev_err(dev, "component bind failed\n");
> -=09=09return ret;
> +=09=09goto rel_m2m;
>  =09}
> =20
> +=09v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> +=09=09  vfd->name, video_device_node_name(vfd));
> +
>  =09return 0;
> +
> +rel_m2m:
> +=09v4l2_m2m_release(rga->m2m_dev);
> +rel_vdev:
> +=09video_device_release(vfd);
> +unreg_v4l2_dev:
> +=09v4l2_device_unregister(&rga->v4l2_dev);
> +=09dev_set_drvdata(dev, rga);
> +=09return ret;
>  }
> =20
>  static void rga_unbind(struct device *dev)
>  {
> +=09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +
> +=09v4l2_info(&rga->v4l2_dev, "Removing\n");
> +
>  =09component_unbind_all(dev, NULL);
> +
> +=09v4l2_m2m_release(rga->m2m_dev);
> +=09video_unregister_device(rga->vfd);
> +=09v4l2_device_unregister(&rga->v4l2_dev);
> +=09/*
> +=09 * As &rga->v4l2_dev =3D=3D rga, v4l2_device_unregister (incorrectly)
> +=09 * clears the drvdata. Therefore just set it again
> +=09 * (ensuring it's correct regardless of the struct member position)
> +=09 */
> +=09dev_set_drvdata(dev, rga);
>  }
> =20
>  struct component_master_ops rga_master_ops =3D {

--=-0uIQZovRXgZxDGcSLoFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYDvgAKCRDZQZRRKWBy
9GqGAP4q+QYBtXorY2V20/Fjjuwd/k9H1RlDAJC1g2YbcNegfwD+N43LeKqeaQ/8
2zEP9Za6fbSKXjaFDf0/ir5zRkms4gs=
=wsLc
-----END PGP SIGNATURE-----

--=-0uIQZovRXgZxDGcSLoFT--
