Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713246;
	b=nemtAdE/KB7DcK2Guf+nRwcqtMFvTZ9mZE0toUEVIytD09zU9mhXImaBvjULdaeH1sL+
	 cxpiP6uB3ms0RUNRf3ajUU26ojvhS/eF2IAxh26NjpXzuhD5DMo0nM/olMYKBZa+HUtJZ
	 GQEOGGsf5qN1jeuKRrXW+OO0rqJNr1JIX1HkDV89/LR/lwVJOJOSv0DlTtbt1VtvlxfVz
	 t+EVTTRPFtjQc4B3dLOueokgVtOC+s7B+D6ZgThgsMePOQb9wEiO+XGrmiJ7k8LN7LMcp
	 5XruG2IP31/BsCpn1yBSMl0rfyJfmuYte7o91lLWGajzpgZU+Mkx44rowK7XDUgQyiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
	b=ZlRKOwGq6g5liGgkPSXAvXOGpkE4MU24pQANEDEGpB48+A95PARZh19wtdLKvqmF9wsc
	 L6qDqtHWwbGKVv1liTtSIU8oLFnM0I56YaSk1Q2FvsOGK/+K3V0Vv9pn6v8cLZ9B/ofyU
	 C51YNhwik9i8MKaTtjmJBKRNYhRcfXAcVe1keeLUQSywowbba70064oEBFtXAhY+ATBOg
	 RR1NHb492UOVxOAjPxmF/8ecutQC/TmDOtLZPKvzicydO673OhwRKpJvuZWXxUSJ4g05Z
	 5290MmLiAosIRrkh/1CuZIdL4LCj4qzexo2z/crSVcLe5KtNfxI/FT846uAHzDc8E2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HedOyocz;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA47F606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 17:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA47F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HedOyocz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a42b34e930so6354023f8f.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713244; x=1796318044; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=HedOyocz3bUj9Abr8/XiWePoUlAIQnt7wd+6V6mVyb2wM2vQyQmtSw733SpRjIyBQ+
         lQnWjYZm+abaNML6a5hWwo1tDe15MDFyeolv9MmFEfeAxOKAcWFpZ+v6bQiRq0KSSpru
         pZzsS6JqplYKFKBWKpI5+l+w8EJA/CBxc1nxAfK2tSe0S3/RRHgaWF5IpO49a3Qsdxsg
         a9w7ybxewff/ZKSOZAozSD7Cdm9qYkiHjJJjxZk0AzSmxv5CnRVZN1oSMG+zJXADqTfd
         47YYNWqBO1PF0A8EGF76FQJteuj6V9uO7cgbqzJF6iE4GOSjwaFI8TQyaklcqIvyrHhb
         bNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713244; x=1796318044;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=JGEWRIWY+qDurE+dcpClj+qNarZkoEqS+3MPldJIyUkvZuudbR1l+PNG+mg8sNd0GX
         vobRwQC0Bf4PLsdIKQLqLHlR09DB1o0iaqOp9d+bmsQgmUR7FzTyMqWKgUPWZTZGNxUd
         Nfj8NwLHvh10Y5JAdKeKjeSxJQpdKy/4zoHxd9RbH8dpwF1RIJrLWLNwYRZr5Pdr7WmG
         VAns+uuOBD3PXDM4+d6EZloezqOCdZkMffp3QJwjqQy38sCPq2BRoxsd/Bmy40cyGjWF
         U8LbsFuCFc/At4ncNRpfWkJKnM13+DJqGU365947OY3s+Yzh2pI/aYa19D5YfACZebum
         +EBw==
X-Forwarded-Encrypted: i=1; AL+hErGfIJ+2c7nqTmVktZw8tPSQY91k8EnR74Pfuj2DzIRUDYUtMnNciIUbIC+djK6XnzKNrfRhcToh48wVgQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TCwr5JbYU7cCDm9PttxTwrrkh1tzUApiASvVmTASHdtQUatse
	p7HI+j10jRjjF6/EAOAEydV/C6mtvRKT+0gzKwVymxJcyKGmvc+1fCOG
X-Gm-Gg: AZFdTZf5ka5QSAC01I6JaoNoL4YuvigDaDxQnTMi9KOQhoMhMZNg7F43ytzunfi4mir
	mv8GKn8Zkvw9KvmsGAtzynqLi+1jWuGvqtBnD+NrleAwazx+AVbzZBpLIfEuUkTNKl3O0uk6WQf
	Ci5dxFuF6mxy0eywgDYpFDhPejJiU+OzLVYD1wnBdxwIX1EdJcVDodGiNSP6Vh+5fgMgm6FOWn5
	0l7jPJfutizyxTKkjVc3FfZofC9NUdG0tvfMXxYYsRXCFxo6VSWS7Dqj98uqRm0ITKjtpPh5Md1
	b6nqHRCBY4KZTzYH+V5I2NVy0bb7UEAmp/LAb1XiyKxko8g95ZAIrUwLDo/FdBRhya7KSdisu20
	hPcvNg09biKub/oCYY947eQBbNa8cU3o6FzIVecWenA+hFDQn2CkviRiw0bqqF8q8xp9yUsZFjx
	Y2nTADezxX6tZFKLXVGhjX/A+dMCMbL82iiZslSp8WAoAhWejOyvEe7KYq+H/P0IFXK4c0fZIeh
	2hyE1ejp4rhviWBbP81aLaxxrkVRC7wNf6DXsPeBb53ISMQBmbAQgrIGBJ3w2XgEAvyXwYd/BEb
	4Gx2wjY0hlNTC0kTdC1f2+pIOxnbLYPIJq7NthdTh4CHzYGqjhgge/UZ8WexBRjK72noxLErMmS
	lK3QRRECjqzdF9ylTFiw/gsff3Lm99w0WrfHCl7zNz4HDjzTKb2auhMqyBqstHlM0PbS8PDEjot
	SZZBgwvG5VAc4bTtHMOy+MuF+2rsK46zA4JzlTdXMB9vZtYNcKTLvvyh9KZ7rMt8JsmIAzGKqFy
	rH7IgUB8v34Hx/s16+NPWek4hy2k30O2OyGxBoGgDsTesmXAq+GeT9t6yQJp0h3
X-Received: by 2002:a05:6000:4704:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4abb5eabd6bmr42342899f8f.56.1795713244030;
        Thu, 26 Nov 2026 09:14:04 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39494189f8f.34.2026.11.26.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:14:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, paulk@sys-base.io, mchehab@kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Cc: gregkh@linuxfoundation.org, wens@kernel.org, samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: Re: [PATCH] media: cedrus: fix typo in comment
Date: Thu, 26 Nov 2026 18:14:02 +0100
Message-ID: <A2PFvd_UTOK2TCyMMfkywg@gmail.com>
In-Reply-To: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
References: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 7. oktober 2026 ob 16:00:56 Srednjeevropski standardni =C4=8Das =
je Caio Vinicius Ferreira napisal(a):
> Fix a spelling mistake in a comment: Neightbor -> Neighbor.
>=20
> Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	}
>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
> =20
> -	/* Neightbor information address. */
> +	/* Neighbor information address. */
>  	reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_in=
fo_buf_addr);
>  	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
> =20
>=20




