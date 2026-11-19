Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108191;
	b=Bo4ySZ8LzkqnfebVp+22MuMttGHIvNqjvqGUZKredzQwofU5olzUsesrXREK4zCHyedm
	 JJ8qIxJmTZ2LuU7vIaHwfDFLvFpjwoaaEMjpWmBuU9+/Ti3JGT7ou1zxGnbQpTxYfsRMv
	 /CQw7Ka3HUW1CZMI01ZLpm/m2Kt8vhwVSinCr1iXSBSqNKe/QlNt0O8ekH+Flq1Dw0k62
	 Wx+sB/zG+1UyVuHHGiN3c6crLeaEq30ELpnPg0gIYVbODP8nAbjwWGSrpDkgz/S7cooDe
	 dfEIPyjlLM6ikBNvJtXKPAV6+blSBK9wZAzW0GJcD6TpHhJlUV0nAyjreI/PZEAGZiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108191;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Autocrypt:Organization:Content-Type:User-Agent:
	 MIME-Version;
	bh=EvBI1HOBk5so1Ik7KOrp+QzwLFuoYR+tPWzAi8hv8nI=;
	b=Wjj66D8mGfXTX19WnTUpooXZ1KVbG8TLjABFv+kBGCG55W3BCSsYGBLb3uwWrRZ7FUpS
	 eWiykg51+KUlJGwWxe1kiz/cVO01lhntGRg+kHF4spDqDF20yOnS9Wl3f5/4w7hiKfKA9
	 aPBfGd4anmTsAkuCPs36rxMUTdyENOhcAI2+IyetpAcwPN922jRTrOyio4HBsPaPFm3XV
	 utAGe5TWbvTfL5LxF3Gsxj7ggo5VbwpwghMDVaWw+P9PpbXS/k5ysxiuot+sfEDhUvTFQ
	 WdhyFGQ/h6diVxt9+wK7BiH30nXOV2O9pxNiJ4PZz+rkUHRn7SZhbRyUgmDIziTFwFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HjlA8VJf;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AFB606B430;
	Thu, 19 Nov 2026 17:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AFB606B430
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HjlA8VJf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795108189;
	bh=s9hbqJNmvcktvQ/jMN3/lfoazKpFldfe3uLAwKl70/o=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=HjlA8VJfufD0syLtBk3fw6KnnsV9UNLM7CPI9Xb/oGzYs+Du9R9QTtcguDN03lLHm
	 I2jhsrH5hTTniTIl4OMosX9iVVvEhVS/FC8JD7H6JgOREI7ku7HQss/1+sOsRGL8MA
	 LtCnFcVfKNID7vFCIcOz5X7kb7KYNbbMvDE6dcQqQ+GMreMdkia46KhiU7r2eMwnIV
	 WCcWxN7X3/u+oEFWa1HEdpPHpa2Y9SQqHXOA2m/69Bqk0dMQ9HbdNw2CnwPWTdTQ6l
	 d5GH9AdHyt6Of6g/xvnwftWaQ5lXVV18vovhOb4dyyNTYt/PbLioDi8QPd2hRST7eU
	 M8nFc9Xld1VmQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BE4317E0406;
	Thu, 19 Nov 2026 18:09:47 +0100 (CET)
Message-ID: <7af073fd2a783c58543ff89103b49c0fd139b8c9.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: mediatek: vpu: add watchdog handler
 unregister helper
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Minghsiu Tsai	
 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Tiffany Lin	 <tiffany.lin@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Fei Shao	 <fshao@chromium.org>, Tomasz
 Figa <tfiga@chromium.org>, Haoxiang Li	 <haoxiang_li2024@163.com>, Eizan
 Miyamoto <eizan@chromium.org>, Enric Balletbo i Serra
 <eballetbo@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 19 Nov 2026 12:09:45 -0500
In-Reply-To: <20260720085756.465667-2-lgs201920130244@gmail.com>
References: <20260720085756.465667-1-lgs201920130244@gmail.com>
	 <20260720085756.465667-2-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-Pehf/38Oju4fgimGiob5"
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

--=-Pehf/38Oju4fgimGiob5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 20 juillet 2026 =C3=A0 16:57 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> VPU clients register watchdog reset handlers with private data owned by
> the client device. The VPU driver currently provides no way to clear a
> handler when client initialization fails or when the client device is
> removed.
>=20
> Add vpu_wdt_unreg_handler() to clear the reset callback and its private
> data while holding the VPU mutex. This allows clients to remove stale
> watchdog entries before releasing their device references.
>=20
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 14 ++++++++++++++
>  drivers/media/platform/mediatek/vpu/mtk_vpu.h |  2 ++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..a2b937095248 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -437,6 +437,20 @@ int vpu_wdt_reg_handler(struct platform_device *pdev=
,
>  }
>  EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
> =20
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
> +{
> +=09struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> +
> +=09if (!vpu || id >=3D VPU_RST_MAX)
> +=09=09return;
> +
> +=09mutex_lock(&vpu->vpu_mutex);
> +=09vpu->wdt.handler[id].reset_func =3D NULL;
> +=09vpu->wdt.handler[id].priv =3D NULL;
> +=09mutex_unlock(&vpu->vpu_mutex);

I just read sashiko report, and I tend to agree that this fix is incomplete=
. I
think though you that you can just extend the critical section in
vpu_wdt_reset_func(). Add comment that vpu_mutex is helpd when reset_func i=
s
called, might spare someone a headache.

Nicolas

> +}
> +EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
> +
>  unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
>  {
>  =09struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index 3951547e9ec5..2ccb481a04cf 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
>  =09=09=09void vpu_wdt_reset_func(void *priv),
>  =09=09=09void *priv, enum rst_id id);
> =20
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)=
;
> +
>  /**
>   * vpu_get_vdec_hw_capa - get video decoder hardware capability
>   *

--=-Pehf/38Oju4fgimGiob5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8tWQAKCRDZQZRRKWBy
9CkVAQCaxVutZXPhsny39ejIDbenFzNsqModgSF7tuaTtaPlYgEA5xKyeTsyKJnf
vgi1Q8jJKypwz1sOph0DseoT4PolMAw=
=yZTa
-----END PGP SIGNATURE-----

--=-Pehf/38Oju4fgimGiob5--
