Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962A22DC76F
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151044; cv=none; b=aZuKq8FWVrLu6g7CSH5yLNtyKWPkZ8LrWT97/sHV2igI+hjoiBzHd+lDOs2SL2pXfGt9VGZFxtsuPKC3A7Bx3ipyCk5/NNChxAKYBJ9tn91GMLyuGGAEssobkvwrfsNR/1BfJtPFTjpvS08yH1UqZ/C/Q4F5oo2FRYrrKaRcE9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151044; c=relaxed/simple;
	bh=81j4jVJryKKz+bXRtE0PD2wq4y34zfw8HA+i7+XWla8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bq5Cm17wV9H1sgiD8q7ocpuyIHcFr0U9yUE7UTMnrJu75gctub/VVPuJ47IBXrBi4qGyStPNdJJbf9danKAF9P0RIocu/coemw8ZxnlSewFr3VlYz+QctI3WVG30kxBqOntRBfBiCgjERFtd5qG8Fj2U6DSH3iBtIRbsdAspDlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=dEabUmB3; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="dEabUmB3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c0006ea8eso42373631cf.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784151041; x=1784755841; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlZJ9Oq0iUmfLZTq+2Yt0wQMB3kH+WdcRcJz7YsThu8=;
        b=dEabUmB3/9vkthCJQd90ymEDop/cDeQ0fkdMh7nXUWz8sY9ruQMpB52/+qE2Py86KP
         2lBlZg6AYPT+uaf8vC1y6lsYx8ohUHYdpmF9ciLmsvMDC1HGLvVV931JgLz68eLIafEu
         a6eM6LPSgGdYzwv3ECFwbh+M147exidUm/AIGX6TnM1m0ObUbiyVyMtegnNFXnFnBvn9
         lzwGDN4YXtkQUjoz5QK7VeW7ZO+F8i/K+kBm8h8nLf2MHlLoH6kYwwHuVYLmWtjt+O/r
         b1+ul6wa+qdy5VycwfyD2TKaD4u3OOC6O/erk79j+c4bu1TcFMRSAlOU3vW8F8v23Vxz
         ylPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151041; x=1784755841;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlZJ9Oq0iUmfLZTq+2Yt0wQMB3kH+WdcRcJz7YsThu8=;
        b=kaJZosqZzNTxbwSAgnEdzHNzQAfAj31JE0I2rqwmOmtySa/BEqWAA2tzqndAAyqqHg
         yzd9M87LUJdyRd1zUxHyDqKQL1It5FaWyyweV99R0z9j6GQQs+xSBmMNetscalDXOwZZ
         E9bY62FvJBAJ8kRSmoPkuL8zWbXCuV1+CD7Sx6doWxqjxxd6j2y6NuARI5kRdRdadE85
         gfb2pjR0W6ROKI5gqetSoNjRAPQ4TKhuE4G4zv6UbC5Bf2DDId2XoWVgrbvhV4scYZD9
         03VIw01iy9INUO02kV5RWtDsFhICtwG1EIdCc2BJRnmRzSrdtWqNbcP2DilY2gr1buZS
         pf4Q==
X-Gm-Message-State: AOJu0YxkNUaut1/kjEJ67XIVw/0TN7l5qFK9R+h7IAwoMbSV3ggE6JxH
	0ex6NuNQ/VQWU0AclaXUAhpNFyoqJZGZX4LBoMp6VhOLRR2Er5ts8IyUPNbgUYt6t8o=
X-Gm-Gg: AfdE7ckGIktDw7YF8FVvPWCYa188d95uQhK8B0FsltpHkfjxBk/6cesaA0uH5L34k2/
	aGqhNR4CLSi8YmkM6C+DhwwGS2Gep1H3mccPf/8I3z5TG/r/uYMSyc9N0S7blia52Y5vcIh+4Vm
	14UwvfB4tF9elTMyi/UyKxJgzkITSGoSaMFj+XA8IfGWLx5XlfQSNz/jFDHp0mgBJc780UyPGo8
	TRXe61/4YM/QTain4eA2aEjQ/TOp9mUZ8T5NPZt6eqXokfgbMgGe+ZdahVfIEXQ8tY+eiak94Iq
	6Wt03LKE/SF8V3USH8TQjWkurSG+5MNIw+S1gx2F9JETVyh1ufKpeysMGDOP1U2Lt5M7Wwmg3cM
	4nIhR36DWh8jZXePm7I8/VJHJtI31aAeUewa7jG6NjVsrkQ/t6VzOVXanMg+IbHVkvwd9O3TPzm
	xyNw00FAs=
X-Received: by 2002:a05:622a:2610:b0:519:f884:b587 with SMTP id d75a77b69052e-51e4eff37b5mr46908081cf.27.1784151041296;
        Wed, 15 Jul 2026 14:30:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd492sm224622526d6.34.2026.07.15.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:30:40 -0700 (PDT)
Message-ID: <84fb82b5f765c98d1e22af9e60658df2d42ba016.camel@ndufresne.ca>
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: remove redundant return
 value of vdec_vp9_slice_setup_prob_buffer()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Wed, 15 Jul 2026 17:30:37 -0400
In-Reply-To: <20260506084203.202882-3-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
	 <20260506084203.202882-3-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-uijvWZFgWMICyZhGcasg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-uijvWZFgWMICyZhGcasg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> vdec_vp9_slice_setup_prob_buffer() never fails, remove 'return 0' from
> vdec_vp9_slice_setup_prob_buffer() and modify its signature.
> Also, remove the return value check in vdec_vp9_slice_setup_single()
> and vdec_vp9_slice_setup_lat().
>=20
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 13 +++----------
> =C2=A01 file changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index 092fd34e21d2..0f47b2671353 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -1013,7 +1013,7 @@ static void vdec_vp9_slice_setup_lat_buffer(struct
> vdec_vp9_slice_instance *inst
> =C2=A0	vsi->row_info.size =3D 0;
> =C2=A0}
> =C2=A0
> -static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instan=
ce
> *instance,
> +static void vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_insta=
nce
> *instance,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct vdec_vp9_slice_vsi *vsi)
> =C2=A0{
> =C2=A0	struct vdec_vp9_slice_frame_ctx *frame_ctx;
> @@ -1030,8 +1030,6 @@ static int vdec_vp9_slice_setup_prob_buffer(struct
> vdec_vp9_slice_instance *inst
> =C2=A0	else
> =C2=A0		frame_ctx =3D vdec_vp9_slice_default_frame_ctx;
> =C2=A0	memcpy(instance->prob.va, frame_ctx, sizeof(*frame_ctx));
> -
> -	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static void vdec_vp9_slice_setup_seg_buffer(struct vdec_vp9_slice_i=
nstance
> *instance,
> @@ -1170,9 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	/* setup prob/tile buffers for LAT */
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> @@ -1804,10 +1800,7 @@ static int vdec_vp9_slice_setup_single(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_single_buffer(instance, pfc, vsi, bs, fb);
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> -
> -	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)

--=-uijvWZFgWMICyZhGcasg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf7/gAKCRDZQZRRKWBy
9AuhAP45kkmqN6KDRPau8KsNlbh+VehZLSyD0vR1d0SaUrC9YwEA6rBKC53JzIa4
e3mkBO2afGzRaiVa1ujr4Kj+OTnn9Qw=
=FGyY
-----END PGP SIGNATURE-----

--=-uijvWZFgWMICyZhGcasg--
