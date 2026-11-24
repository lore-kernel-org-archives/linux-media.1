Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553184;
	b=JpEb1bdTWca7X3gv6crjA3hcOHfsuPzk42nHc/q6xQ9B/MS+G3nypM9WCY/uaLxictcF
	 s9iU8FVzxnTNXiVd+LKI4a85Te59xxUzfba0uZiJ5Kn/9+H6DXMP7w6Jy+HPOngA9pGGb
	 jJAH3wx/kIbKACCa7LQzqIL8QwOk31wu7FRZpWbXSF6iBbDQ5TlCiwBiKjzDBsPx9gMc/
	 r2HiBAjnm/AKQtD2g44ZgKZDZeET8n9KJZEVnH27Imw0WmatrmggtJusWCU4NpMFnqfPK
	 ehjEZY4OtGDmaTNZ0GpxDydjuNALV+ti+6neMqXmzrRC45dy2gSjCx5Ia/r4YdGYUSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=GAeuGjA0ohrbKm/YKYQMvDRAMTyL5dqBXRmsdS2B1bw=;
	b=DihI7a9lsbOwDFemvsmkEgFUl0qc2exPmFOrEFNhJlHalbCYkAnkttQNCyAU7QQ1uBGy
	 XzhCoY5JR2VS2PhRzoM92yQgEVOh5xit+CcBdibULPQEwpkyPOLTgW66wCmcbvqyiyX3G
	 xFv5YICQo0le5HBOMzM72b2sFxQevBhmbO4ZH93h5vNvhcZ0mme3FYX0sL70eqbn4tU50
	 FFSRKtUSkVqe9f7EcPDj6w4bxSc7pQeljA8leY3vfTKmB2CGQs2P5cmBXvC8sUeuUp41x
	 4Dw31dX4BxeSJahIlKIXV8Jlx+Cqb9jvP33P3n92PE7uKIn4GWabY/3zZQOeMe+pU2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e0jQfB3z;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC3606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 20:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FC3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e0jQfB3z
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9495e8ae239so564183385a.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553183; x=1796157983; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAeuGjA0ohrbKm/YKYQMvDRAMTyL5dqBXRmsdS2B1bw=;
        b=e0jQfB3zMnP1L0wwNlNC3w/Sl81W6t8wo3HsMOKDvZC/eKgUYs38sh65br7SotIqVn
         Cy8O7Jk7+I1sXJ9sxiRgGM6/P0KnIP9Pqy0LTYp2UYSGPRDUv55Zv62vBoY7jrmI8o/H
         zQaS2xlh9ieImiW380+v9oXY4MoveNmHRgkRquIpHeKFTYLrh4JK+PdokGxEGu26FEzI
         oAU8xZ8RZXcbpu+29o1w4c6N82GUUp65k2tsAY+893mTJcZmCbhK8TskIa8f+79FM/Qf
         9X7sdkCRulkk2t6g2/mwHT4jfN1euR3JHqzlxb6OxojBB7SkIcmNL4Pbe0epLhcPXf5o
         NqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553183; x=1796157983;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAeuGjA0ohrbKm/YKYQMvDRAMTyL5dqBXRmsdS2B1bw=;
        b=Sx+sBzJHVhFMK67lkASdsEcWjG3nPMpTiGPelFy1SXVRQEZMFklPHBWAZ7MpksAfS0
         1TynB5Hpm8xcF4mKm8lauMKtgT6oRE9HmrnJZcS9j3BjwmBsRADYshBgFjaDN5A66sLt
         hNcQfL/+ja8h59/DEYH2GYZIxXH1SnhwAL7htdGFHBeSGPx3HItc+sxbj2u9YkDt3ybX
         JCWwLG3VCb7UZHwDUQ0VpbzAd6pgAiz39ohlZ6uR8SImoycRJsk535EnErp5NyLF86iS
         lmQYLEQaCQw2NAZTCEf3OIRFe9+j9t93+d4rKe7+rdUrJvE4hi+/svWakApejZNeNJB0
         95Jw==
X-Gm-Message-State: APuU4Z+NZu/rS75P7Y7T7daDrpVA4U26uSY47K7CQWjoGgMVe6VMp3nU
	+DDAysa7zdMTz5VIYGsGbFEya38rss3+bnQ9+dyENTV4O6hxsMtbLthzuJzTB/YLm0M=
X-Gm-Gg: AZFdTZdO81z7xm7fnWiIyfV3hmHsKim80aZcZLIKRtGuEPfJ85CN4C/q1wLBDKXsPrc
	IyvXTVi0c3A2lMh0Ql9oE/FhKv+UW3WZvTYuglw12peRj+u6aL6dTuYk827NiVv8T/4OkanWuPz
	K5c466uwkcIPs6DbOJit6GDySi/GrDQGfxHxGVjlVruhDTEMwXROpM26g14OWHH6dlEVHoa+849
	U+IHSQjo8UKtTocSeTD3nEtNgLmvE2+tZJ5V6pS70oAN54bQQR0q2qJYKkPEpz5K5jHoFBcue3K
	7r7TeCaoimzzMWPjKst97lNVUzTPoFDxh1iyUfGMjndBPgrwNMKoDhf8Zadm2jxSepc3UGEKXDM
	ijOKhqPI7y1ALsPY7C6y4KvUKjMK+53esZiaWMRxtf9dpzh7pIDW9sRg6YU16koz0glE8PY6KJp
	+B2qIJDIZjSJkrMNWOJ3VMJ/20vJ9yzXWhXcBFlGQCPCLAdLYyl9KE3D+UV6/WJyTVwBp/UmauM
	vfM1fDOkqmmKnLRIHD87TnauLgEhu1GQFNtIg8KPEfzUfsxI5Q2SQWtgdoP2vvizGdfiDs0lXn/
	6UnyYG9+/ixD40DVTYHgAGTjEtuPXSr80RAVf27Hoj1lRp6zKBfQzCY=
X-Received: by 2002:a05:620a:2605:b0:949:9f1e:d8b with SMTP id af79cd13be357-949ba99cb12mr2707807885a.16.1795553183318;
        Tue, 24 Nov 2026 12:46:23 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb35005dsm1135466685a.11.2026.11.24.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:46:22 -0800 (PST)
Message-ID: <6e1ea0410e9a1ff6a811914a0718117e18763374.camel@ndufresne.ca>
Subject: Re: [PATCH v2 03/17] media: rockchip: rga: move early return into
 if condition in vidioc_enum_fmt
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
Date: Tue, 24 Nov 2026 15:46:21 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-3-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-3-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-Kr3UTuiIQsdfzM6RH7S6"
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

--=-Kr3UTuiIQsdfzM6RH7S6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Instead of a doing an early return when we don't have a capture device,
> merge the condition with the following if condition. This improves
> readability, as the condition now explicitly contains a check for a
> capture device instead of returning when we don't have a capture device.
>=20
> Also use the V4L2_TYPE_IS_CAPTURE helper and improve the comment.
>=20
> The early return if was copied from the vivid drivers
> vivid_enum_fmt_vid function.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index efe5541078214..8c03422d669cf 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -372,12 +372,14 @@ static int vidioc_enum_fmt(struct file *file, void =
*priv, struct v4l2_fmtdesc *f
>  =09if (ret !=3D 0)
>  =09=09return ret;
> =20
> -=09if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> -=09    f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> -=09=09return 0;
> -
> -=09/* allow changing the quantization and xfer func for YUV formats */
> -=09if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
> +=09/*
> +=09 * Allow changing the quantization and ycbcr_enc func for YUV formats
> +=09 * on the capture side for RGB -> YUV conversions.
> +=09 *
> +=09 * These flags are only relevant for capture devices.
> +=09 */
> +=09if (V4L2_TYPE_IS_CAPTURE(f->type) &&
> +=09    v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
>  =09=09f->flags |=3D V4L2_FMT_FLAG_CSC_QUANTIZATION |
>  =09=09=09    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
> =20

--=-Kr3UTuiIQsdfzM6RH7S6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX3nQAKCRDZQZRRKWBy
9EPvAP9qmu6NjbxJIVrwPbtNCb2o5iC32gRQgn1s5lFgDIFY+QD9GU/Itmf98PeY
254GJzxL0n7DdfgEkaSI/if1tyvWuwE=
=f1zz
-----END PGP SIGNATURE-----

--=-Kr3UTuiIQsdfzM6RH7S6--
