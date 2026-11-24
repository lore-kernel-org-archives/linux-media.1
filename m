Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553122;
	b=OKThIonriKN0DtDXWMoJAg8gCxHvR2Q+l5YcuVDMAflhq9Y5STARYlSbkN2AWKSQcTy5
	 hWH8LTGN7a+8iJoi/lqYa0bQQWQyNMoiQzSb3IHqz+9/9AYdsa7EEmp8Y2yUj5dM+qh8U
	 4vnkqcpD0HWapFqVFZvLL9Cx+4sXRO69wCUWbUH0cmA1K+QPPZnR0DPc2IHSbhZ3cyMzs
	 B5x888UAVQeK70wAghXGzANwoi31Hw6viLo66oZ1lSBlfHONlbSfWDrAmm19yTalL3MUI
	 ko/JfBRxTQQ/zTWCqjZ5xHXe9SEN39yD+ewH3VmjkgUVbXC6FNwrK7rnInjrC4RF26A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=10XH4ej2oXPoMU/XuFtT77K3dT70WQ+UCraqr7WioX0=;
	b=39jOQeLRjekYKtZz4/eXdhkwl+UbqUsKG9z8mKAEKDJKILBdrJwTnjnPbMPffXcgnP0e
	 L5ZzflUsicHMAYIspBlIp4lGGB3VwF8QNY9vjWxbtntUxY/Ghy+WCw/lrgGmmttu1ZOjb
	 KEre2bzy4RMLR4Sdeh4Vcsjfl8CisFRHgFvBDwHyYb2qmAdjGalSZPovQcvIfegM3dZYZ
	 KCapXMxJw/pwS9LLX7t5UA5UKBXxNRA6aKGslTtzB7omBwJ9Q2JTCGiwxBgkdyQZWEDWT
	 J04DICYRr7npUdL7CEBkhOjebk4dJIJsXx6dXi4MR40l08HKkPDVlNPzX9UGjQKRi0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jUK3IoOR;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68B606A32C
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 20:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F68B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jUK3IoOR
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9211efaca89so58276036d6.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553121; x=1796157921; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10XH4ej2oXPoMU/XuFtT77K3dT70WQ+UCraqr7WioX0=;
        b=jUK3IoORi3dKNqt8hyREsncDuI44QK8mXkcsJzkCvMePLqDhAHCdu6oWNqXhZ/6Dc5
         Wz78Hjpf2xNgROGZiZrgECDAqjR1GlhibHgWUIn5MFLe0zXL+wHxjnjG7M3G6ya5neLu
         Eu2xs18h1kwnPYo0wyZVn9UPjfEtHguZx8WtFjf3yhP4gsb44Zs6g2mPvaEUK86nhZn9
         MNO2MSLhZmW95Upjc2+HkKcxKmGZxQ//7vEuoIDSaKWF+6Pt04IDez/juJfh1VLl23ZZ
         SwY5t3XlqCOfSAZjZg3sDyXqfTgXZNcLFfAPhdNXSE+L8mQQ3LBZMkPEG3A16KdWxSfN
         0APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553121; x=1796157921;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10XH4ej2oXPoMU/XuFtT77K3dT70WQ+UCraqr7WioX0=;
        b=lffHVDuBmrCGCUsMzGSsBXx6zZ3N5umnFVkruLsTnx7JB6UE6riGZnatOo+hNNs8+l
         JweB3PXT1MgoI9ICFuS0Hp6GPpzgWxQMvFKy5pyxWy8whYyimz0BAj/Bpe0NWXmo3YnH
         SRO1YB5NzWxlf+BBC+B9TxMyOOxoLFXtVmbL825b5IdITvPZK6tnukJZh2OEm9KyURCM
         THFgRvpXMRmodwgy451qSR7f6vmsNGYhGeUkl+XsoisGvlbftb5/S3qDOHJa5KGuUbGB
         gjSJDLqR6Xp9Z1ss5MJJiS/eRkcBzZ224XPJGBQRbQ0s/+LwAmPWXvwaOlgzImidEj0a
         tQnA==
X-Gm-Message-State: APuU4Z+fwki8SqJdYPGMF3d0BBEDcjDnADl4gGhWSDNLcFB5OH1hoKr6
	2kuij1Rhj49i5QuJLbh2QJUcHXdfyliyjUX6kKOQe9sxWAWZBZDWPIs9bahiAqmdr0w=
X-Gm-Gg: AZFdTZcq//Ky1u6FUOx4KUzVHWO8a52T/bzz8DZT5MjExfp6wMxwBdG0e928EadLvi+
	GfVkR7S4liZmqBOFkWuwvgKdRs1DVJBJS1POmySzjTyvhMgqwoAqm1aOvq5cdfLc/H1XcZacOca
	UFG2stwCHF823ysUegNSoCUUMkSdzhYIGPTmzL8pzSoscdP+XGvaab7ii1YTmRLCLft63kXamQ0
	GJjl+INdng1ux2MhkgncB8W92y3uhaYRw2mLVew42XPpFN9RHdlkQb01iX9Tm3p/+bQVp8wWzS/
	NeBtLgFd+uUy5LVzvyWyahKsffo4RpzccSkPSjqWUTMMVnSyGcnusfSdiQQaNzqZ0QsY9XqRoQe
	Qc//BGJUQ+c1CRnfqUvi8iGNWjWSQAKJyXvrrSbYn+V5syBexf9r1DDGPikJh0IbZnm1R2ubHXU
	kWhPq3/9FA8fyb4Oh25ONBsAQsMV+nkx2p+FGD6OqBuyOeuvf3nD1n0XsMEBGZuIt+gBg9txOe1
	7mARwLc4UmJbCbemDZ6Au702GYKKbO9jf6yutj+mAnlnSkiTBQbA1PsF76CtJ1gTlqjPNHVTA8b
	QUCqrL8wDtmZi/tr27Sd9fMMFI/kmbWy0e3FfSPKRPpMotoYQkiikBk=
X-Received: by 2002:a05:6214:5243:b0:920:fd83:6976 with SMTP id 6a1803df08f44-92134b3f391mr282710326d6.50.1795553121021;
        Tue, 24 Nov 2026 12:45:21 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a08552sm142793896d6.34.2026.11.24.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:45:20 -0800 (PST)
Message-ID: <fb95b4f8fa3db34a407177d1efcd100acfd0e918.camel@ndufresne.ca>
Subject: Re: [PATCH v2 02/17] media: rockchip: rga: add comment about pixel
 alignment for YUV formats
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
Date: Tue, 24 Nov 2026 15:45:18 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-2-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-2-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-lDiiVpW7LbsI8l96Z/jE"
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

--=-lDiiVpW7LbsI8l96Z/jE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Add a comment to clarify the use of fixed step_height values for all YUV
> formats. While the commit introducing the change already explains the
> reasoning, add an explicit comment to improve the visibility of the
> reasoning.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index bd0afd33affe4..efe5541078214 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -414,6 +414,16 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
>  =09=09.step_height =3D 1,
>  =09};
> =20
> +=09/*
> +=09 * Technically 4:2:2 YUV formats don't need a step_height of 2.
> +=09 * But for the RGA3 this is explicitly documented in  section 5.6.3
> +=09 * of the RK3588 TRM Part 2.
> +=09 * And the RGA2 vendor driver also checks that the height (and width)
> +=09 * is aligned to 2 when a YUV format is used.
> +=09 *
> +=09 * Therefore be safe and always align width and height to 2
> +=09 * when a YUV format is used.
> +=09 */
>  =09if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
>  =09=09frmsize.step_width =3D 2;
>  =09=09frmsize.step_height =3D 2;

--=-lDiiVpW7LbsI8l96Z/jE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX3XgAKCRDZQZRRKWBy
9NOrAQDQ51rGU5HqaJy8yr4bx5UgQdoV3U9t6CfAeYignkSaIgEA0Z9ghLQ8ceGI
03oKRHcli00mhOeK2j41ZGSrl5we1AE=
=ZWqR
-----END PGP SIGNATURE-----

--=-lDiiVpW7LbsI8l96Z/jE--
