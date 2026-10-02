Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4089B446058
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 19:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970990; cv=none; b=QA4C9iHnsXtaoMKN3Y4Z+S6rlt1GhwecGXVIPCWBEJOHM9rE+jMDbpKmzTDmiZiu/uCHVfNlIPbCFjS3l91q04iAUqoNCZqJ3lQ71NzE3W/5DLwXunQL59drhlO6h3ppyM2e5sSvZrVNeX7YPGkg/HgbOth0UMHtwRvEGV4iZ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970990; c=relaxed/simple;
	bh=RAm0gUhki2pqljTZWQr8CrgmhZ5p9hcCadzRxn5CSGM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XGEYfcXQy7TiocI6sGdmJCL+Zn2BLOlFPy9Nm1GhxUbgczTh3KprADXryb7Yf2ZdjfaTCcx/ZTrwJybnprknmeftvmKP72xI8+hwizaiwQViKGAUHcLSDfS/BTq8IPYUunfVRJxRTOfLxAaXudKLpE8j3O7xhFWpah3zLDWmKUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=kllv/0IM; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="kllv/0IM"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53396adbc53so2739081cf.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790970985; x=1791575785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NJl6vN2DYWl5SvECY/MNPFkAoXMpLzutrBdwcjZxYRo=;
        b=kllv/0IM3PbW8aScYN2euRWeTP2DK5sSB7+A8+NESTWA+J9dfxdnQyrrOR8BIMzAxq
         I6eh3op+3Btg/hJs7zmF62amZuH00b+DtxjGJ66yprzE6SR6wSpuSAfznWhwgWqjym6H
         qoBR1X/S1f/KSKsNIWORLKzHg/Q5gY9VTFzLAprQxfvlfwWV5eB2k4X4UhONu7ZgwYfa
         WvoaIvKUUZ1Wv6q/G6dCGC3nJ75ayuP4ZNJxJg5FuCVHnMia6oTlwP48WhingQwBjWFl
         Od3Ne/miqBBeaXEc19fisWlDlOwxfwMM//fITp96BMR/p2kGs4AOIkS9yACwScaGz1xX
         kHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970985; x=1791575785;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJl6vN2DYWl5SvECY/MNPFkAoXMpLzutrBdwcjZxYRo=;
        b=b/AzOjNfJ/o9f/DHt3KNT7vNXUoD6RiuvmT9sGd/2FZSmejVLsuf+rXOIJ46U/RwB9
         vh0bqg+HDQfz8PV1lykWQQc0NO1iKax7PrOe5SeLjPPgTiewzHrPSvrb0oAt7s4QWjkm
         yyYE68WDUbZi93yUquh0hicNGLz/4F3iuwd64WXzK98vZWMSE0B3Gnf6YU2DGTZRhci7
         PIIW8PwMASrz/yZLvxJO8ofa4BUYz3bdl93UzvcZJxFzLUqAkGFMTlUCco2FLn4gKkOF
         jJXXRxmaMTvbIrcsusjdenApj+G5pyzIJ3E59V49JEwE+UCMp50ffYHoELRLEMKoBM4G
         QhOA==
X-Gm-Message-State: AFuF++kKHa1mi675FEtQ4MwEz4+0Wf/V8RG8+osTJAUWyIrEDg7sjCJX
	CJmNtTZGP4+jPxvkXICQINnWW6hhPKHDbb+i5wAqQgxwSStnR9PDD3J7qXH7zOdrI/U=
X-Gm-Gg: AYBFou1ZtHaML2dpvXly2FlevQ2MfZmWFBIVxO7iw0RxMO60Z6uQ9gbakR+1qmoogHw
	aSJzbVVLTIXTJZTQfKGtbK8OtXIsirj7Ul86BrxKLCb/xDziBsXghEDNo4IwIzlw4jrvWyqiHkq
	btdJfwVH4kRdLa0Bm/aIm5tUzbSNrPBOp1IgOsTlcvbNTEpwYWsTSUs79+yQSZIH29QXth6P4hh
	mo/tBA+YY48kjks33cjth5SQ7LAK4sZWN6w/GP7Ci8HgC/j1BqT2WLV0/Z7PKs3rTMzqj0X+2GJ
	hjugW3jL5lZMbDzc909ro4PlCmhgV4GnQAcmWkgjhg2TrM74WPaXRlG5nbq49q0K+aTo/Vo9b0S
	5MIMNmFBnTKWUTkMV+Js5d3GWYOnPXGIYCcxMo5DP9aPiTK4GZnJnKVziPdVbhGqiqh1Juwpmao
	Y0Ba+TXpSNLc8YUPOd4jQTCCWrApPZz1VM21qC437UBZpZCq1uE7iJNhZbGd82EUvDaXqhfH4qQ
	JIBqwYm577wnA==
X-Received: by 2002:a05:620a:6413:b0:93c:b766:2bfc with SMTP id af79cd13be357-93e50fa6a3dmr87378085a.17.1790970985078;
        Fri, 02 Oct 2026 12:56:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c17b8esm27137276d6.43.2026.10.02.12.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:56:24 -0700 (PDT)
Message-ID: <a153b350bdfd614b4da5a15da29079eec7fc4dd4.camel@ndufresne.ca>
Subject: Re: [PATCH 2/3] media: rockchip: rga: Switch to modern PM_OPS
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Detlev Casanova	 <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,  Jacob Chen
 <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 15:56:23 -0400
In-Reply-To: <20261001173610.158931-3-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
	 <20261001173610.158931-3-diederik@cknow-tech.com>
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
	protocol="application/pgp-signature"; boundary="=-1Mpu87nLgk5Us+/k4nVo"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-1Mpu87nLgk5Us+/k4nVo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 01 octobre 2026 =C3=A0 19:34 +0200, Diederik de Haas a =C3=A9crit=
=C2=A0:
> A new set of modern PM_OPS macros got defined in commit
> 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")
>=20
> Switch to those new macros so that the PM callbacks are always seen by th=
e
> compiler, but discarded if not used. This lets us drop the __maybe_unused
> annotation from the callback functions.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b3cb6bf8eb86..f28c93d63760 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -883,7 +883,7 @@ static void rga_remove(struct platform_device *pdev)
>  	pm_runtime_disable(rga->dev);
>  }
> =20
> -static int __maybe_unused rga_runtime_suspend(struct device *dev)
> +static int rga_runtime_suspend(struct device *dev)
>  {
>  	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =20
> @@ -892,7 +892,7 @@ static int __maybe_unused rga_runtime_suspend(struct =
device *dev)
>  	return 0;
>  }
> =20
> -static int __maybe_unused rga_runtime_resume(struct device *dev)
> +static int rga_runtime_resume(struct device *dev)
>  {
>  	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =20
> @@ -900,8 +900,7 @@ static int __maybe_unused rga_runtime_resume(struct d=
evice *dev)
>  }
> =20
>  static const struct dev_pm_ops rga_pm =3D {
> -	SET_RUNTIME_PM_OPS(rga_runtime_suspend,
> -			   rga_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(rga_runtime_suspend, rga_runtime_resume, NULL)
>  };
> =20
>  static const struct of_device_id rockchip_rga_match[] =3D {
> @@ -927,7 +926,7 @@ static struct platform_driver rga_pdrv =3D {
>  	.remove =3D rga_remove,
>  	.driver =3D {
>  		.name =3D RGA_NAME,
> -		.pm =3D &rga_pm,
> +		.pm =3D pm_ptr(&rga_pm),
>  		.of_match_table =3D rockchip_rga_match,
>  	},
>  };

--=-1Mpu87nLgk5Us+/k4nVo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasAMZwAKCRDZQZRRKWBy
9Nm3AP4y8JqQZKv9U0OttedqiWp5M0Ofbzvm9AyImGL7/X3BggEA6Av0uZd+Ipgu
Sn0DcrUr/Ux6st7B3vMRPFDOud8b9gM=
=w8WG
-----END PGP SIGNATURE-----

--=-1Mpu87nLgk5Us+/k4nVo--
