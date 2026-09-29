Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2594C388E4B
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713715; cv=none; b=Ox5RrnZoYKwGPPsVWBV/1SuEpYhPh6wK9d9UkPYTNjnDqqmQgR9qV4O9pBFJfzrZ11cKhA1cDmx+QYKh6UxJ8Zug3bG2wYk7R+1u7/TAhpQZxOII1EZWtsqGQuXYw30b5dPl89mFMsr2ulkS4zIPLwwSUkcudnaey5zxZx/Mayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713715; c=relaxed/simple;
	bh=uUrRYyuz9ljqvGYpIxFhR3M2h+TBtMioCu5j9jfhbA4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pdL0iLFeMTbOdu0jxiLTS5QKCKyon8rxTUAV334QNP/VURkSk2mvzgZ6WfdVvc4JMGWCdg/qHUg527s2TZG0gF+puGoWG+lrElI8s/OaUg20W8yB1ymqiDCNu4nw3v440cgDJe5V4GPEi2t1P7Biuaa4rRDT76uCHRYfqg7/hn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=s4+rwdgg; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="s4+rwdgg"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c9031e714dso1719873e0c.3
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790713713; x=1791318513; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VQaYivWBj1ySc+nCCyxMCDWtW4eRfB8nvxBhJGO3V6s=;
        b=s4+rwdggV4Ka2ohZHGvPc4ZdJVZSJ/m/wqHZ80yvbpzg16u9wPcnL3ZT7SlkKSAGaX
         GAsM5WXB/9031DG+S9qkFwrfphbJZCN7TEV/BO1hkpqO95wK2REbxvti3Dk5ahg0q9SN
         76JwthHRUXzVELDgpjgwLYacCwGmuoW4cokn/tYpMV6IEucpnDk4fd5I0t6WIVFL0Z5s
         UeVmFZpwSUYRtyY+S62Y88NSNueLUN1pbw8GwIMRz0fCK4YDjRNtC1PamBHDeyyRkcE4
         wGGYF6SNLHcZxXkK4DdODOEW42wXFf8RdQKjLgf4hVUPoBfPqKRDALATTSS1NBEnI2zT
         IN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790713713; x=1791318513;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQaYivWBj1ySc+nCCyxMCDWtW4eRfB8nvxBhJGO3V6s=;
        b=yoNTjNwvz97dTYlxPbMa1D9vcICI10OHf4oJSt2b7SSoPtNDt5CqGAu1H3DZYL9KqX
         zP3dRjxCxUAbA8phPN+45AZ7zTeEQjXJ+390fPcRIcjJHiGar6lot19m7SgwadgjibIz
         wU6GJTeODlNVrWbq/1d1d2mWzQxw8jkBcP/Rb8TwCqtQsrwVoroUBK333rlKVRKrXQOF
         sGDOQBnb3/CKWGWgMyjZ7IeYfPkVoCzjgJjC2M+tVJp4D670+ari08zEmQo+Y6IKZcd4
         g5TrQOm40jYTuhc5TGbNTuWcAzuxkc5WQbNlaLFtSEa7y1VRL3P+tDQ7zmlOtaA6NOtQ
         9IYQ==
X-Gm-Message-State: AFq9FYK2eyBT8/l7+jBoszsXyeJxKq5a3ZiAzRaXbUxYEt37z5hl+I1u
	RTmDKKP5BuM6r307N+wcz6aP3kjwArnnhnSDBmtzwjh/cTKowoYVSDMuC9LwL3kgyPE=
X-Gm-Gg: AYBFou3HuwH9pb4yZTaKYDmr3qGAhMRtTWgUPRtpZPz97yXnq3LDsF8PEb000ZxKx6+
	FeJ4waYiap5FqpjhgeuAE4i9+eBmN2J7NmpXmoQeaHnwOLNJWDfJZGxwyaI9cjmEpf/0dbDEqSo
	d7yv9Qwcf80tGqtvslDBLlrNuxQNtZgZo0pCQS6Z1At5zrW+4WpgEpg2A4e8qjxRAHtrrpK9/L6
	EePIbHqCwzj7wyt6CfjBh9vw0ZLapA6auRub9dksit+jl3S1QGzfYzW0cvEquuqa4+LbhqSVlxc
	hsWnqOBGLU+jU0HD97j5ptTjJw7OVZbSH4jK/Fi431xs8hqeWhJUdEOC8RZswzbywxtrTc9YesS
	AZ+HyPm3dpUASyIUdLj4JSqEelQFRzJjMq0McZtOvOCszLqL6MUZ1yNRukumqkl0dFDP8I3SW0W
	K9G6jV4Esk3BesWZwKY9YqgnMvsP4Az0D13/SYoyTQXrp3+0CD5qfTash7DIdVD+UbdC+FUHIaz
	CJRFnH7t7c+mQ==
X-Received: by 2002:a05:6122:e1aa:b0:5c9:c60a:e9b3 with SMTP id 71dfb90a1353d-5d51a3753bemr226593e0c.19.1790713712883;
        Tue, 29 Sep 2026 13:28:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e9a793e6sm1089117e0c.13.2026.09.29.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:28:32 -0700 (PDT)
Message-ID: <1fe9b189db3d0704be5b1b37a700311dac2cbfc3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: Remove redundant dev_err()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 16:28:31 -0400
In-Reply-To: <20260919093449.2534901-1-diederik@cknow-tech.com>
References: <20260919093449.2534901-1-diederik@cknow-tech.com>
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
	protocol="application/pgp-signature"; boundary="=-F+3ToYK5qPTGqdEYIxDv"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-F+3ToYK5qPTGqdEYIxDv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 19 septembre 2026 =C3=A0 11:34 +0200, Diederik de Haas a =C3=A9cr=
it=C2=A0:
> The devm_request_threaded_irq() function already logs detailed error
> messages on failure automatically since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"=
)
> So remove the now-redundant driver-specific dev_err() calls.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..13d13c041509 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1824,10 +1824,8 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					rkvdec_irq_handler, IRQF_ONESHOT,
>  					dev_name(&pdev->dev), rkvdec);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	rkvdec->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
>  	if (!rkvdec->sram_pool && rkvdec->variant->num_rcb_sizes > 0)

--=-F+3ToYK5qPTGqdEYIxDv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwfbwAKCRDZQZRRKWBy
9KhKAP4k1cHvpCPn5smix40RZY42YEI2Eo0qvXxN29oEVWOpCgEAnLNOPA0qpepn
oMGr7q8y93fQEe5BvvTo5vSFZBOIxQw=
=Qt2k
-----END PGP SIGNATURE-----

--=-F+3ToYK5qPTGqdEYIxDv--
