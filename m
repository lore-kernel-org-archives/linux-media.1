Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0E3DB626;
	Mon, 27 Jul 2026 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148504; cv=none; b=e0F4JiFgs9KYtBgsKpSXVUiBh34udpT4ZacdgA9zHTBcabaQqEJ3S/9JRNArnnXr4TJIEJAGEpoShLvpwggWOxcCscxoE0mf0TaLvAwe6FwFCDlnyxDqixTdMoKc4SA9yREkZcj+WOlcf7x4vvQ49JQAPunR2cHqotG3WUMyv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148504; c=relaxed/simple;
	bh=KQzHGw7s4EB80BRA8Najml2UAKrLzYWcQ7S7t1HGc5w=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:Subject:From:Cc:To:Date:Message-ID; b=iEmekED+vF0WCah5+atB8BWUxyXU05qT1ZvdQ9P9sdr81mW1jzOk3dlIESu/1uyiS4APbkMJ/wH+PhQSgYwZGnTw+b+/xWA2CAnS/YHuoQQDCEGYDTaUYpl+751vi8tAdvDD6+2bsIg/JCEJTX/WSmQusAVCVsqzU0sR7BzeuhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VkCDqfz/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VkCDqfz/"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31644BB;
	Mon, 27 Jul 2026 12:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785148432;
	bh=KQzHGw7s4EB80BRA8Najml2UAKrLzYWcQ7S7t1HGc5w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VkCDqfz/SVK5aNl6KDCSoIhAg1wB+Szwf3rz1XAJL3KhS4iu8FLjbAJODo9+CuyZv
	 MBYP7NvzPMR3SgciMaQhkLGk5T+5Q7qv54s+tR2d9LmstxCrGymCCNDJIHaoDxXLET
	 ga/IOgIC0pxjCEuyagjDNYlTXERURq6ZijThBu04=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============3240047428479818934=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260727094729.408762-2-thorsten.blum@linux.dev>
References: <20260727094729.408762-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH RESEND] media: imagination: Fix value clamping in calculate_qp_tables()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, David Huang <d-huang@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, Thorsten Blum <thorsten.blum@linux.dev>
Date: Mon, 27 Jul 2026 16:04:51 +0530
Message-ID: <178514849109.506511.14905916758246243206@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

--===============3240047428479818934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

Thank you for the fix.

Quoting Thorsten Blum (2026-07-27 15:17:30)
> The local variable val was never clamped to 1 or 255 because the return
> value of clamp() was not used. Fix this by assigning the clamped value
> back to val.
>=20
> Fixes: a1e294045885 ("media: imagination: Add E5010 JPEG Encoder driver")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> ---
>  drivers/media/platform/imagination/e5010-jpeg-enc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/driver=
s/media/platform/imagination/e5010-jpeg-enc.c
> index 42ad9ee3993b..420cb8bfdb12 100644
> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> @@ -175,12 +175,12 @@ static void calculate_qp_tables(struct e5010_contex=
t *ctx)
>                 long long delta =3D v4l2_jpeg_ref_table_chroma_qt[i] * co=
ntrast + luminosity;
>                 int val =3D (int)(v4l2_jpeg_ref_table_chroma_qt[i] + delt=
a);
> =20
> -               clamp(val, 1, 255);
> +               val =3D clamp(val, 1, 255);
>                 ctx->chroma_qp[i] =3D quality =3D=3D -50 ? 1 : val;
> =20
>                 delta =3D v4l2_jpeg_ref_table_luma_qt[i] * contrast + lum=
inosity;
>                 val =3D (int)(v4l2_jpeg_ref_table_luma_qt[i] + delta);
> -               clamp(val, 1, 255);
> +               val =3D clamp(val, 1, 255);
>                 ctx->luma_qp[i] =3D quality =3D=3D -50 ? 1 : val;
>         }
> =20
>
--===============3240047428479818934==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmpnNEoACgkQQ96R+SSa
cUVU5hAAq1Tnk0/BbQ/LNI8+k2uUFmfVmtgColViwaz26SlMmiwxEWPe5AcNSLle
G4/pdsslyIesBDgo/N9/JLQn1iJYz109pEZwtM/pR/dIEugL3MEcyP4wWWZkY9k5
CjKNg19Es3p6kD1OSTQ2ykFnz7dum3j/jqJfLvJcP56it893unJMuULNqHjVz0XF
qtJ+r2XxrVhH45+/VOegJYL9LGGnU/eP1D+VBrKrkPPfPEl25eGff5JTa2BW8qQh
NdaD6xLPuARpEUMjW6wkT66LeUBRs8DtT8YEWIDb9/V99sTagjZKu7vbhwQ60RK3
rXO1dNnT43gRXwYRx3lkmKs6x8Pg8mkgEFVTw4y94y8kcx20kvyXFfnC1ro0FnVt
WZYmWSrV3/inDOyI1wpUR/pnxUNKZDlct33Zspy2avd+arpDCCXCRlpb6Rj5rd/E
pqifkciZWM6mey994U8qnXAm7wpx+/jMc0Ug+vU7KfqAYAwFlXrtUdgVHcvNAct3
0LapBWxiVh0ZeGObOpFNlU+m55MfyvpcrbzRN2iTQKp6ollUx//9j+QXmGONckMB
/Cml6iY5Mqa02cNTf57wJCAZlalEPAt4UH0IRKmurfwC+W2pkj0Dzs6yv1Ia5IBh
C2byvmqWPabi15JX1kMzXLshRfGwOeL3zgE+e/2UXMyPSck/i+E=
=db9U
-----END PGP SIGNATURE-----

--===============3240047428479818934==--
