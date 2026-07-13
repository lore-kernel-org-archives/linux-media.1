Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE5143B481
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951449; cv=none; b=cUz9s64jlzYKpR29j+RQv8n1ygH9kyfpRDHf6isNP3xU5w4GdQTc/LyBZAgw0HOrxX4dIdjRS8JfSohX/pomCwy9bsOvXIGLWDB6j6/LDt2HMbnHoGAwxC/v1sVIGXJ9el633NwsLiZvHBmlRFhZiqHVm+YYLTiBZ212Ov9YKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951449; c=relaxed/simple;
	bh=2Ni+rp3D303cDLCJDbtlawZA9LsCwc4lSHkbd5AUdR0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gBOMDKwVFj9zxjmB0SaoP1mjTFzOBl3No9HkAJLgH4bCSZBYG36sD04a1Z5cJvfgnKWQWJ1ocWbEgnZ+pdBy7HSezg9lgXpkRqDRRZvQdG+EAod+VZyON8aNx+D3NrDXyGJaJakKO5NNMuxmaP2Rzth8LAd6R6lSAm60laVtwMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=pwDfYDut; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="pwDfYDut"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bdc96b0714so2369038e0c.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783951446; x=1784556246; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eBW10Cfwapwvr0gihXMdckLTW8yiKSYBxKONjhqXCr8=;
        b=pwDfYDutQCn7hM3foCR+1gKvqjdPkSjCC7AbXJuYY+Ypvt4DpWiJNHgYb7wnZv867k
         37qhoQtdmkz2SePnPAHrHPMivPHIC1rWEuTpYovwW6cKrSwcHnyk+9pSEaJyWDjAqEtK
         GLpsh9h4CaUKlK6kTP+lyr/P0Sz2Piku7+mcOrITf3TlKvtiOPsNJxpqMNTjRr4VRisU
         tdc6quCJ1Y6PfDR4DFPVk3DwspwjWR6mjFn1z1+4PzWmxNAD2tUZy759LGv5UgA+l4lS
         LeLiFpZ6SFJ+LqdPuz3iCusDre9hPsCs0Hn3i2Oit9qvgwjPO6gwKdZRxF8oeIgYK2Rl
         aXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951446; x=1784556246;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBW10Cfwapwvr0gihXMdckLTW8yiKSYBxKONjhqXCr8=;
        b=FlOvbF/yyhpM2CT9wG9xY1wc9RL3I2kRm1poxBvI3flT2RXVT/7CmrohXJcV9mxKvK
         IX+chyDsBSV9hgCd/9Q+QiiES5Dckp3gSj/uDzk1rCbOiBu91bR/lcdQiCFSzDAN4Uj/
         g8tghsRqqeY5/8p3RxENL6Ed9B9AlXEqYzQAIDwiS0l/f+Tt9z6oL2j3RLtMJIdFYUTR
         c9sNMMiB6npg0h3xlxgWhqyNS9nrrLTBuy9eMJoibjWaxiOFuCaS6navhdPOcj/PTp8y
         3o++8SxU0uXFzOptXKu5NxDSen7PJ+qzuXe5uckgh/8vkOK7fkbrs7f+P4v1+nmumRdq
         JL5A==
X-Forwarded-Encrypted: i=1; AHgh+RrHaBIWET44QOyvxBOTITSGPMetUzvcSa7C0TkqsiVqXabxr4qaQJCBt1CdaapbKa9DstKINxNUsZMa3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYhZU+Sbyamvj8OtQECI/UHmVflZv0QNcUottfBDDXAiHM0RlY
	wuAtw3wS70X5yIP79b+xvt8zKkKBQCHXaYal7j33hyzzRJ/hnPrqCcp6VPIZ231RwiM=
X-Gm-Gg: AfdE7cne/tzGPikg3Cd80b/KPHa5waPAnmEWcEp3c0WnUd7YWjKPvVcEWZOHpdk0eLa
	enjEwo21RIu4qr+swf/wRS0qnLKsb2Ra/gWlHqNdxlD/x3nPvThcMmAYFN75efNTQxVFk6gvBSk
	s2Fa4+av/DPi3neEIZiANGkd+06CjEsISMoFJlwEnmT3wex7RzN/CL6nnXu6Xg/DkBcXUN/EvW4
	6XxaFDEHsp9bvmf72LMAzDwXRWOywRZh8ul+ao9Ivzxvh/excOnfihdqGYxuan0JKC1pgCHzCoP
	wDPVxpMyqUdTF5/fJBY2cNMC3QJelKcW4ui8H/HOei7af/gCgnTK69od0242Ll1jf1pmoage9w2
	5u2BR76Vu/NHbCk7xdXoiKwvxnM2tCa3UKdwcIYGIlXO//EiMWJjRId/az0RaBRLGOAVlYOrZqU
	yZGvrgjQl8jiP5de7j2A==
X-Received: by 2002:a05:6102:8026:b0:737:2ce5:7b2d with SMTP id ada2fe7eead31-74533bf2bccmr6755210137.9.1783951445952;
        Mon, 13 Jul 2026 07:04:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm8744432137.3.2026.07.13.07.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:04:04 -0700 (PDT)
Message-ID: <5224ab5bffdee0777ecef73a3b96c88e8eed38e8.camel@ndufresne.ca>
Subject: Re: [PATCH v7 19/19] gpu: drm: meson: Fix DMA segment size limits
 and maximize allocation boundaries
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Anand Moon <linux.amoon@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS"	
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVERS FOR AMLOGIC SOCS"
	 <linux-amlogic@lists.infradead.org>, "moderated list:ARM/Amlogic Meson SoC
 support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MESON VIDEO DECODER DRIVER FOR
 AMLOGIC SOCS"	 <linux-media@vger.kernel.org>, "open list:STAGING SUBSYSTEM"
	 <linux-staging@lists.linux.dev>
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
Date: Mon, 13 Jul 2026 10:04:02 -0400
In-Reply-To: <20260713120840.17427-20-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
	 <20260713120840.17427-20-linux.amoon@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-K7ZLBpNLX5/kwXKFKQKp"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-K7ZLBpNLX5/kwXKFKQKp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 13 juillet 2026 =C3=A0 17:37 +0530, Anand Moon a =C3=A9crit=C2=A0:
> When importing DMABUFs exported by the Amlogic video decoder driver
> (meson_vdec) for hardware-accelerated rendering paths, the DMA core
> subsystem throws constraint validation warnings. This occurs because the
> display controller master device lacks explicit DMA layout configuration,
> causing it to fall back to a default 64KB maximum segment size limit.
>=20
> Address these architectural constraints during the master bind sequence:
>=20
> 1. Initialize and validate a 32-bit coherent DMA allocation window by
> =C2=A0=C2=A0 invoking dma_set_mask_and_coherent() with a DMA_BIT_MASK(32)=
 argument.
> 2. Maximize the contiguous scatter-gather allocation segment boundary
> =C2=A0=C2=A0 check constraint to UINT_MAX using the dma_set_max_seg_size(=
) helper.
>=20
> This guarantees that large video bitstream frame buffers can be imported
> and scanned out across sub-driver domains without triggering allocation
> warnings or page boundary splits.
>=20
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Acked-by: Nicolas Dufresne <nicolas@ndufresne.ca>

> ---
> =C2=A0drivers/gpu/drm/meson/meson_drv.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 49ff9f1f16d32..899e70bca4ce2 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -202,6 +202,12 @@ static int meson_drv_bind_master(struct device *dev,=
 bool has_components)
> =C2=A0	if (IS_ERR(drm))
> =C2=A0		return PTR_ERR(drm);
> =C2=A0
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		goto free_drm;
> +
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
> =C2=A0	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> =C2=A0	if (!priv) {
> =C2=A0		ret =3D -ENOMEM;

--=-K7ZLBpNLX5/kwXKFKQKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalTwUgAKCRDZQZRRKWBy
9NNdAQDmsQSLx7lRRr/0dmnss88GGZZ8T5JiUJHYnp57V3Vo9gEA5tSuLIwnYukh
D1WBuDEOFQqGktSq40CeUMEDMi1jCgg=
=9ZVW
-----END PGP SIGNATURE-----

--=-K7ZLBpNLX5/kwXKFKQKp--
