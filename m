Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF52C027C
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151000; cv=none; b=DQUb2hYiybbwnCPvZ5nlJtVSrcVkxLqY6FcZYMKGzda/jZVykrBHBflUyS7EVcOqV0CiDc0EEr0hAXxcdiJZ8w/v+c3bWW1st5SK7AdaNqXJztTcNnC9exawk1P3JjcRuBdkSqHNxJ/pzUjmXFtc1fCqUIIRAnSzIXjt80WvnGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151000; c=relaxed/simple;
	bh=asYt2r+5ATETO6Tgh5Wm8/0oqQNZABg05Z3MTxihiew=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AbAcNtP9+9Sx66QuqDRJ0G86cPGgHqiDbWuk6NZrHTwiDLJwS+3hTjyEuYSiM2Fd7gMdmSxsx8eOwaifA1wfEAPzfcMoJON3IEjC4ZGtQqeybfMeKjN4rInkkt8DMH7eA0EmQ+NVNVsJ9JO34NYtvNAcWZ5T8m7nu5KfS6qW+94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=VwRmrpjG; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="VwRmrpjG"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c928bf172so39712591cf.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784150997; x=1784755797; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1DyBt4E5F6Qr9zum6Mdb8tt7jO9CILZSVeKqdjI/1I=;
        b=VwRmrpjGObmrwDSOh/hk391O7fjWya/XnEm2fYbUNAW51aC+8BE8U/0yIzr7s9k3dl
         2LuopjaAADvrGIj4uRO1F9aIjm5rg089pbiEfONOSiieROw5oqvgnAGkbrsDJNpJDS4I
         PcnnJbPGZc2K58II/NqxZQOwZB7irIsZioUa5i4ecqF+zbab/wIiJOhqfHpQf6T7AhGt
         p8PEQxvGdqhoyIjjiMPGUhLpgfwM9kkP/A4NyzO/6TjzHzDHrF1KUW8sG+ttgJ+hFkEY
         y+CAaKfDSWFY3tguEt9KkBGuIb5LLo3HzUvb7qxug6YQJ4Lf040zh9qvuZ1V+QeDiLKW
         M/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784150997; x=1784755797;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1DyBt4E5F6Qr9zum6Mdb8tt7jO9CILZSVeKqdjI/1I=;
        b=tBXgqYwINEmBxlTICOkNMv52clNdDLjgr11ghIthLZGUpaO8mRlh1snFTc2xjlPeux
         WaUpJNpwC25qgVfLeDJ4rwXteF7ldyvP4iA+a7AdCkWGujV+ne1uWEe68Ex/ikWf+rO+
         0r4U60lm6SaRzO6hGdvhKHhLUJPW78I6a5Nf7CV9SWqIM0B3gMdprfXE9s3AjOLRYXlE
         Q1ouK/GTT34GY8Q+mVGRRkHS53LybzUed6Y95nUKTrQOh66jGGEA3qJCIIlxmpY+dlvb
         7eRDZW1nzRUX3tcbcaZ7LiJWcmzBMJ5VcdHSzd6ijg8lTQ7g4/lMVXMtf8YnQ6xCGogf
         NVpA==
X-Gm-Message-State: AOJu0YxuNo4t4LniW5Pz+EtyRIalCbfk2vh1ArI8pDnIUJLzQWK9cGsD
	hN1wXTKjdRUBRx+JQcYpK0RQ3nWHI8qIeLeB6p7lGv93VNOZxRZYYELqTg/hHSDkf7M=
X-Gm-Gg: AfdE7clt5ef77t8hQLqiuTLTHF8vebVmFyPkpbf+rWgV3ex4Wi3Kkcm7p3NwbdoKDlk
	COaC/r/sMJflpImKtEDwk0nalsEMRQmLCzZWZ1yYpZ2FHILXXq6JET1QxsxxGmPpHzcuWFUHd9m
	yMHaMtOq0vwnAU/L+4sbi4IrOnSKfOtPi9MoUi9+Dh5MhRvA54ETalkL2FKCN6ZihF+iVBysjwG
	iGA/FyoHIOZh1tDLsWfY8H3AuUJ6ghCFCHa/FSLalelcEYwpmac0o9/oJR7DDh+jFji4JaisPV9
	BqqHymeCf2kKPlDnpdZQsLW4qtwwNAvg5WlaaIz4gg5hE9Np8MXh+OFkBjCJwnR1pLvzOdrVfyW
	0wrlIahQBp1nfgA/lK9yfHisRUIHMPfUbGg+g8BsOYAuIbBesF+6DTREn6XlBAQdD06GRp3Lqah
	8vWo/sYZQ=
X-Received: by 2002:a05:622a:1b8b:b0:517:8e65:68ea with SMTP id d75a77b69052e-51e424540a8mr81974211cf.54.1784150997358;
        Wed, 15 Jul 2026 14:29:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51f2bf8ff21sm9929581cf.26.2026.07.15.14.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:29:55 -0700 (PDT)
Message-ID: <c4e010c0e461e0e13d575cf73deb5625ca341efe.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: remove redundant return
 value of vdec_vp9_slice_setup_lat_buffer()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Wed, 15 Jul 2026 17:29:53 -0400
In-Reply-To: <20260506084203.202882-2-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
	 <20260506084203.202882-2-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-XmXqUoEqy30RMP6H+In+"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-XmXqUoEqy30RMP6H+In+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> vdec_vp9_slice_setup_lat_buffer() never fails, remove the 'return 0' from
> vdec_vp9_slice_setup_lat_buffer() and modify its signature.
> Also, remove the return value check in vdec_vp9_slice_setup_lat().
>=20
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0 | 8 ++------
> =C2=A01 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index cd1935014d76..092fd34e21d2 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -974,7 +974,7 @@ static int vdec_vp9_slice_setup_pfc(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int vdec_vp9_slice_setup_lat_buffer(struct vdec_vp9_slice_instanc=
e
> *instance,
> +static void vdec_vp9_slice_setup_lat_buffer(struct vdec_vp9_slice_instan=
ce
> *instance,
> =C2=A0					=C2=A0=C2=A0 struct vdec_vp9_slice_vsi *vsi,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_mem *bs,
> =C2=A0					=C2=A0=C2=A0 struct vdec_lat_buf *lat_buf)
> @@ -1011,8 +1011,6 @@ static int vdec_vp9_slice_setup_lat_buffer(struct
> vdec_vp9_slice_instance *insta
> =C2=A0
> =C2=A0	vsi->row_info.buf =3D 0;
> =C2=A0	vsi->row_info.size =3D 0;
> -
> -	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_i=
nstance
> *instance,
> @@ -1166,9 +1164,7 @@ static int vdec_vp9_slice_setup_lat(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> =C2=A0

--=-XmXqUoEqy30RMP6H+In+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf70QAKCRDZQZRRKWBy
9DGXAP9XuBSksrSCep8Jlzxh2/aCF/lg0KJV9tdVNOO2SzsquQD/aSMxVkIV9DZS
7PTlTWKvvXl2/wTLJ8nGU2kyGMMlLAk=
=V/ns
-----END PGP SIGNATURE-----

--=-XmXqUoEqy30RMP6H+In+--
