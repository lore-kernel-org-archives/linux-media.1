Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C1224DCF9
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111937; cv=none; b=N08qSME8PL1nju70uUwnaYYgu11jaMgvgpS8nroLCW97tKL1qqDIRsBKAbBc4CRjWSWOOIMgh9iQeboWGMujV8WG4SREGO7jdXQPzvocgAxgmRxq6O9yWdeB1g0EQnjLFPs/CkzWaU5yvOBB5F0IcQQo+71QrVE/QN0dj9YfE9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111937; c=relaxed/simple;
	bh=pqU0AmLH7J2NewvDYsALCFE8C0uhZNes4u+zqrHAxe0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e56H67CX3THnXo84IjGrX90mWGQRYXswyT02lkyNI/Hk3UcLiOekPLA3at2hhKTeulqta2QssZSlszfj/XDYRHUv3k/4Kve5qq+NFKCAhnqz+7IkCR5OFtPls+fVH3mMxRdsZs812gKY885mL3oKaolwaJJsolDAU1ELDImKsJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=yTdfayOW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="yTdfayOW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so3520895e9.0
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791111933; x=1791716733; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1gMc178loumsMJ2fyhcP0L7Qn5VoTNXOEWwEnxYnAdM=;
        b=yTdfayOWQ3zBdIqo/GqJotRigsGDXtWYbKQb4UDmdEM1/8uHY3feaNyMPhDFsmxgsy
         E4OVEIRmq0N1dBro3FC0s2+PFe/hznxvsB12oM/S8c9mRdDtmrhLPspf/8GBPlAF7jC8
         SphKsprLg76y3kMKXrKZ6MoYURGM9dmESWdPigAqvq7Sl/FFvxe2AvPdmQ0A06XjpqxZ
         Mj5cmhGvSNe4L2HwnWT8e5Lkbycfh+O3EKvsE9sGGnM9fUVANFUFmZDYw6E65NSZrx13
         ixKY2uZIrAZy06N+46STisgkBuJSCUoIEOyN9+yj65atz37UUDeoDO9NtiwgwQ//gZXt
         vmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791111933; x=1791716733;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gMc178loumsMJ2fyhcP0L7Qn5VoTNXOEWwEnxYnAdM=;
        b=jka2wLk1Bh48GPNk4079tEZQlTmrPLV0LEmFFhS5C2b6U/P/g/DUFWRCmzBqF6f+9v
         CXZ7fvNpkXuoAkIUlPRE6ERQHoAknydWr06iJE8N48Q85i5apDfo67gT0VZSACSi+YUA
         jdDeS4ofQYYvKVYwxNalxtCPg70P91rGqdOwqHhnOxMDxXyVTzUYsT/WrUuTYlxlnzyY
         7d2sKoexzJy+efMav1sIx3c3jIU2FcAml1wz8yOrfaRJ6TrG7XTjnvLB4G+/i5t0eOVX
         XDpvlrerK9q9UwegVJV/cVb5K9xZATf96HCHWOidLYoi08wDmRusteO7oE1Nf7uNu0nO
         eqXw==
X-Forwarded-Encrypted: i=1; AKwUvBzzoNra2JPDtXML+FHQT2u/dy4jOrmYAv88TE8FJ8ynLGBDRoJK/8kvVBeEPfqZCjNt0V8SHxIP0kSPGA==@vger.kernel.org
X-Gm-Message-State: AFuF++neSmdZfJNV+wMLpA+SzLuLdCx96+WRoY3n6kRGzpknlOBq3Bvg
	9NqULwREls1cUdbqSjsE9yviHQ5jxiylvgTfChpkyisZCGLwTmGNhR1W97gFtPIa+EU=
X-Gm-Gg: AYBFou1xR1z1kvcZrtgnwX9zr+9lqIeDrDTLJZao++Q+ZRjFWDjE1OBZ6DpUUPJpbaA
	Pf32y13+DsASVk7XwH9Alf1bsnzp9dHjoq/mrsN5gdUUUfHEjcuVYa+w3/a12GjjzVvVw6V8mtB
	B3sALJAQ0u0/DlorcYG1w2YegBTt78wHBopPpOm04FIEJOggV43Zchq5zmaUJbxFND6bVjsWc5J
	v1Vyagw+EnOLqj8Jl/1b1DVw6JekXk/ho18Eg5TU1hPGfOSKgsqYUnCLLCv872u9agMRK8vhc9Q
	K0Zh2n5XSq+Bv9idglol2jm0hx/xbaw2oRknlpx54cxcyBJtIDZDX+A7+lwuDTRwzFEvxJsgJuP
	5NuLqEJIk+KS/UZQhuDhmV0JIT0FFcoAOmp5i8t0l8JeDYXvRL1YvvU9wGTcH3OVpqMeoG00S95
	B4JwDFg8gkui/3psLgOaHZ0ukJTjCZ7HPY0I9/z9QQwUXPpL0afuq1Jzw50tBQZ+GwrUjS7rTZH
	I8n5EFi3Yy9HkHD6w2/CHXNOofNCcdDcZjn4xn+eecgGu6mCevO07JjLHFnQ0LrrkfSGOEFUE8B
	DHhwfqq05b5wWjXs8PGUdGHl0z1gLRrO2Q9kRvSU
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a027534bd7mr125807085e9.5.1791111932983;
        Sun, 04 Oct 2026 04:05:32 -0700 (PDT)
Received: from ?IPv6:2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f? (2001-1aeb-400-6f00-73f4-bfe7-a3e6-c16f.ip6.tmcz.cz. [2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03048abc9sm100142955e9.0.2026.10.04.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:05:31 -0700 (PDT)
Message-ID: <d166bd7190c1a71921a1eaff3359ffcd8b825afb.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: jpeg: Avoid context access after job
 finish
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kazuki Hanai <hnkz.64@gmail.com>, Bin Liu <bin.liu@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>,  Tomasz Figa <tfiga@chromium.org>, Xia Jiang
 <xia.jiang@mediatek.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Date: Sun, 04 Oct 2026 07:05:30 -0400
In-Reply-To: <e7aef28efd9860e80b8be8865dd04268ee2fd786.camel@ndufresne.ca>
References: <20260902112230.452176-1-hnkz.64@gmail.com>
	 <e7aef28efd9860e80b8be8865dd04268ee2fd786.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-Xzpp1i9yhFiY86lHCQIK"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Xzpp1i9yhFiY86lHCQIK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 03 septembre 2026 =C3=A0 09:26 -0400, Nicolas Dufresne a =C3=A9cri=
t=C2=A0:
> Le mercredi 02 septembre 2026 =C3=A0 20:22 +0900, Kazuki Hanai a =C3=A9cr=
it=C2=A0:
> > v4l2_m2m_job_finish() publishes job completion and wakes waiters
> > before it returns. A concurrent file release can therefore finish
> > v4l2_m2m_ctx_release() and free the context while the single-core IRQ
> > handler continues with its tail.
> >=20
> > Both handlers only need the device for the matching runtime PM put.
> > Use the IRQ-owned jpeg pointer instead of dereferencing ctx after
> > completion has been published. This preserves the get/put pairing and
> > removes the post-completion context access.
> >=20
> > Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
> > Fixes: 5827e4b14ee7 ("media: platform: Improve power on and power off f=
low")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5
> > Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Also applied to my tree now, ty

>=20
> > ---
> >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > index d147ec4830811..9010e7b1108fa 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > @@ -1574,7 +1574,7 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_j=
peg_dev *jpeg)
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  	v4l2_m2m_buf_done(dst_buf, buf_state);
> >  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > -	pm_runtime_put(ctx->jpeg->dev);
> > +	pm_runtime_put(jpeg->dev);
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > @@ -1855,7 +1855,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void=
 *priv)
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  	v4l2_m2m_buf_done(dst_buf, buf_state);
> >  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > -	pm_runtime_put(ctx->jpeg->dev);
> > +	pm_runtime_put(jpeg->dev);
> >  	return IRQ_HANDLED;
> >  }
> > =20

--=-Xzpp1i9yhFiY86lHCQIK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasIy+gAKCRDZQZRRKWBy
9O1/AP0Ub/AIchVgAs3Ts4yTOsB4mOEvnEYHlNzN5kVNk8UUrAEAtPaya56szHHG
qpbxCFdG4wfkrMMaiqEo5qcevW0q1QM=
=L2sR
-----END PGP SIGNATURE-----

--=-Xzpp1i9yhFiY86lHCQIK--
