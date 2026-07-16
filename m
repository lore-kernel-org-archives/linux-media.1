Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20710F0;
	Thu, 16 Jul 2026 01:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784166611; cv=none; b=AXTsOOycGw3tPuJafjATHuIRRhuKN3PrYQzn7dpydFTiQ4MD4RBSr6TU9aPx2SEuzzb/QfnXjtms2k6+ETq6a/zsArXMnKry84ufUIJg106IQq0HFLHIHs7uHgSpVHGJW6lgT5mSYJGq0eBme5PCSqmSaHRae4l7E04wEOCUXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784166611; c=relaxed/simple;
	bh=oyBe0M6LnYb2w4yrIO+C4dNEEZNoaXPUnPszAa8ajdo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CAxFVtdkXWXViuN62PeFo0vYYVFBw56dtMwnHgEPBzdfrCeTcUbBXt5s5Bhk68fHf2kXELzxzEAoWct1p/pxCgPiSulgwBSA9lE/JFhTp743LofpSBU1MTMj8is4AOl1FeVxDUq3aI4Yi3Z+Wbx+S+GaoPQu/mZcNGjRb1+F2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oHHNuQrI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oHHNuQrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784166608;
	bh=oyBe0M6LnYb2w4yrIO+C4dNEEZNoaXPUnPszAa8ajdo=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=oHHNuQrIU59ujCXXef88bI3ecFqmsKT8TaCf4NGmt0yDKe7rk9MVe/bJIa8jNM6Ji
	 rjvs+jflFypm9/HL9yMRy4FW4YbOTAxOECZKamNu/psd0O8Bo4Xhp79vflUK6Mh1cG
	 SuUCD7oGll4pPa3wHLG+FKXhFztmzdo8As2ZLN0upaegjgH8wDgCv67oURu60b3o1J
	 XzbydKVN/6YkJvFLiz6R+1Sm1X3AK/ebXCiiZhnM6wIywmcCIoT3X4+vybnRG64RVQ
	 Zx9S//FlYH+dCFgVHt25MFXXh5+5ysDeYcL5eB98jLPzyLWUgFlmW4o8RdzsEzlJjM
	 Go85wAh7rXjIQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92DEF17E0857;
	Thu, 16 Jul 2026 03:50:07 +0200 (CEST)
Message-ID: <06fe3637405d2a1edb7b992846c43009c7774de5.camel@collabora.com>
Subject: Re: [PATCH] media: chips-media: wave5: Check decoder qbuf runtime
 resume
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Nas Chung
	 <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 21:50:05 -0400
In-Reply-To: <20260705145754.290132-1-lgs201920130244@gmail.com>
References: <20260705145754.290132-1-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-86tPyua2LAnMB7J7bWnv"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-86tPyua2LAnMB7J7bWnv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 05 juillet 2026 =C3=A0 22:57 +0800, Guangshuo Li a =C3=A9crit=
=C2=A0:
> wave5_vpu_dec_buf_queue_dst() resumes the VPU before it may clear a
> decoder display flag. This is needed because clearing the display flag
> accesses VPU registers.
>=20
> However, the return value from pm_runtime_resume_and_get() is ignored.
> If the resume fails, pm_runtime_resume_and_get() has already dropped the
> runtime PM usage count it acquired before returning the error. The
> unconditional pm_runtime_put_autosuspend() at the end of the function
> then drops the usage count again.
>=20
> The failed resume path can also continue into
> wave5_vpu_dec_clr_disp_flag() while the device is still suspended,
> reopening the powered-off register access that the runtime PM get was
> meant to prevent.
>=20
> Check the return value from pm_runtime_resume_and_get(). If the resume
> fails, complete the queued buffer with an error and return without
> touching the hardware or dropping an unmatched runtime PM reference.
>=20
> Fixes: cbb9c0d50e47 ("media: chips-media: wave5: Fix SError of kernel pan=
ic when closed")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 ++++++=
+-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index bb2ba9204a83..03d108b808ba 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1290,8 +1290,14 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2=
_buffer *vb)
> =C2=A0	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> =C2=A0	struct vpu_instance *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> =C2=A0	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> +		return;
> +	}

And what about the 4 other calls to this function ? Please be consistent.

Nicolas

> =C2=A0
> -	pm_runtime_resume_and_get(inst->dev->dev);
> =C2=A0	vbuf->sequence =3D inst->queued_dst_buf_num++;
> =C2=A0
> =C2=A0	if (inst->state =3D=3D VPU_INST_STATE_PIC_RUN) {

--=-86tPyua2LAnMB7J7bWnv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalg4zQAKCRDZQZRRKWBy
9HAQAP0dMxpRKvvdgDKogozyxfvt/OLlx6U9/3bvJeWq8T7eigEAzbqg/AFVkztc
l0qNxwhd1mxqJNdn1tf7d+YLUfMT2QM=
=kivL
-----END PGP SIGNATURE-----

--=-86tPyua2LAnMB7J7bWnv--
