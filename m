Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A811C1E1C11
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 01:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784165968; cv=none; b=jg+6F+P7YdIG+ZmA8YyfpiydQXDPzNJymslLBynxv+XV4pdgKzT4T4CV5qY4/ThC/mzEPrHA/6zn5vP3xzJrM+33LE2UENOQuJkFfF/Jc0mA0I9kTJELfPns7BiYd5t34CRU2/F7g+569xmD780KzVM3las4zcITOPThqZr/0pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784165968; c=relaxed/simple;
	bh=I3AaEwxPrk//FsdDvhXDo/zMAG7k9+FQwBBPQTGGSrI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jPyS1P3luplxsMyWOZi/7lgCYpaQOMRxv3fYsICjuUwgqUEgo+v6nhzEwLmHpQXHgjU8rOPBeNKEcRa5x6B7GHG/1Ritsyse0kz1gA71DqwEoX3mcYTwnUKNDowZ11lZkAL9oq7lU2QhISpLeFaSTqiUAjihGApIjqyAkFWQ6G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=BJobZc6x; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="BJobZc6x"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ee6912d86dso21257906d6.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784165965; x=1784770765; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o35UrjNtq/9PqTqBpZL5KY5EofIPCDLGs72Jh+BPK90=;
        b=BJobZc6xfHbbuYDa/87ldSZQzt1YynYSqtEaNx5qvC/sGprGecgMZ21L60kUfVH/4L
         885VpnCj5gdHcyQqa/OAz8kmrtaJQ8s3m/jewyuEGK3PJ6uEeFvdcpby3KR8sCtXjqpz
         BumYRzBwi/jnDEheEP6zNYtTXbIDUf6lFtOTjsSFdk0GQzX1qruLphWbRtQnqim8npYL
         Bei+Fu5CLKNCIh9akCQW5CMgry2iHWziuxgihiwCD/66hJ6+Tvc3fbllj59SyNVJKJpB
         FC5yY6wH+beZCqq8hpSEbhYPKi95T1cV/fQKrSqXNY7mizvGVkoJfDXNTLbIcuxVKOuy
         juOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784165965; x=1784770765;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o35UrjNtq/9PqTqBpZL5KY5EofIPCDLGs72Jh+BPK90=;
        b=XxuTXiitZ6d9Oa+Ntxab6Lrg6bwVBMZrkCmVSpR0X+qM7y/1VZCcuXqaL3jeHUOfa0
         Me2i2q1Mlg+/i9yfQ/81Wyoi0tafEpMhppi2akV2yxZUIBiorfAEbQU3DT1UVMXVgtNg
         lerheRUOChAW7XSyPH9Ysf6hgsTpeaR5ZPCO93EOm8OdX83bwCK3U2mq09LiTczxYYi+
         TmBPxfRl2jr/VJ9dT7bAyQitwmALFB14Ils9gy30DYnZf1p6OwWi+aJlKaJ5LoXtGYi9
         mhBPehbexhZiRsQ+fqaOdIO84h065gIwhWxO1zwgble2y/KUL52BUmRxO+VBUcOysXNl
         yw1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp5zrmsxIDLSdIX+58DFw+KTi5myrLWVUxTmaYZ5DT2R2TWzeytZ1Mm5SBKIy2R7xrCEvb789vDJdt6JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/0PXgRFCXSkafCNJ48VE3Fgaui3rhWIYidYmjqcnQRiKqVzql
	pKkX78008VZmUDYth/xJE66mzS4QTprZNBJOvJuKlccIfm5NHmiIzfYXIjDayOdAI7w=
X-Gm-Gg: AfdE7cmXnDqYaCypqCn1qjXTG9fr2OJWKcYihIPX0RqS3REnnNVq3HJVgs133kKZnU/
	/5EoBkhPhDO5S9HhHwbsQFihTaaKPFABpg8iUtqdg0tW4C/DazUSibcFt/VZrSEEP1DIarZ/4Vi
	9ro4Cm70P3zqZUmHBNwx7KrdvwEKZ3D+Rd5fLSDvJaqbYu8F0iNt4Owm5BHnCe+hgGl/ZPhK9Js
	SZYGVZ2ZOh8eiuCx6NqJXJfVFaQ2LpQKFMDRLOUNd6pjo4HKUgYzsUeFc7NuVHuP7L8ZrZ5IaZY
	FjmkNsdgmRTpp2fuTOpQzCkb77HBFyaMyYk+crwTTjyV5gE6cS+2gyPGHzuPTCauaCQw13tkQDS
	Mo5UaVerx6a/2H21XqiGKWr+3G/3P37eCQ7lj+vlL4Mx/v7Mha+qOUVk9S8SgqTjArZlHEP7KS6
	DE2FVPx5A=
X-Received: by 2002:a05:6214:5690:b0:907:44ac:7d12 with SMTP id 6a1803df08f44-90744ac8560mr141790576d6.0.1784165965448;
        Wed, 15 Jul 2026 18:39:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e3083sm211640406d6.6.2026.07.15.18.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:39:24 -0700 (PDT)
Message-ID: <b64967970e0f4603c657e00aae470338596c8912.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: jpeg: retry HW selection after
 successful wait
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Bin Liu <bin.liu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Wed, 15 Jul 2026 21:39:23 -0400
In-Reply-To: <20260625003142.99598-1-pengpeng@iscas.ac.cn>
References: <20260625003142.99598-1-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-ajCJVLhWCnhF+L41nSrD"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ajCJVLhWCnhF+L41nSrD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 25 juin 2026 =C3=A0 08:31 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> wait_event_interruptible_timeout() returns a positive value when the
> condition becomes true before the timeout expires.
>=20
> mtk_jpegdec_worker() treats every non-zero return value as a failure and
> finishes the mem2mem job with an error.=C2=A0 A normal wakeup that indica=
tes
> that a decode engine is ready can therefore be handled as if all hardware
> remained busy.
>=20
> Only fail immediately on interrupted waits.=C2=A0 Keep the existing retry=
 limit
> for real timeouts, and retry hardware selection after a successful wait.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>goto
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483..391db77a6 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1697,7 +1697,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0		ret =3D wait_event_interruptible_timeout(jpeg->hw_wq,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_read(&jpeg->hw_rd=
y) > 0,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_HW_TIMEOUT_MSEC=
);
> -		if (ret !=3D 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
> +		if (ret < 0 || (!ret && i++ > MTK_JPEG_MAX_RETRY_TIME)) {
=20
I agree with the text and the code logic, but I'm wondering why do we use
timeout for decoder, but not for encoder ? Perhaps we should have different
error logs for when we ran out of retry vs when wait_event failed ? I would=
 also
like to see this condition broken down, maybe by moving the goto earlier wi=
th an
explicit check for the timeout ?

Nicolas

> =C2=A0			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
> =C2=A0				__func__, __LINE__);
> =C2=A0			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);


--=-ajCJVLhWCnhF+L41nSrD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalg2SwAKCRDZQZRRKWBy
9EKgAP90BemGaX2V64ADTSjKHQcOn7AUDJfrFbyKLXYCpE2VhAEA0yEDhiKOxAYO
fc7d+kBmDTTYXNPE9V3FDWD5rRAJeAk=
=PrLI
-----END PGP SIGNATURE-----

--=-ajCJVLhWCnhF+L41nSrD--
