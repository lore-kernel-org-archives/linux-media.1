Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8237646B;
	Mon,  8 Jun 2026 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938674; cv=none; b=rNeGTAKQFl+PlV+baO0zHzg3r2D7Fyy9wEwzLPiyU2wJiTK2uUzfLF9EX/UFFB9fgOOmYhrHQ79cXpttQjw7bkPWqUDFojAUG5EHey94Uf9fJ7QHD9+g3XpvChlOj8pZDcwbtli5BISi0tI7QugXWfelYXKaTC4FnQMRG04DzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938674; c=relaxed/simple;
	bh=tgY2I1ybaeKS3g3v4xFqKSmXJk4x4uv5iGbVjne5wCE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Wp5VNWoOpngEG5pWL1QdbHkzB9JKrWGMB1HVcaad3E+Zhk9u8DseYG7bJRdmYWqAy9ezdi/Xt0n7QiW7xchoBI/JRs8A9su6RNMBqm04MvdFPiUIlQXEceCo/bUq1ackSeVGbJhp6stK0uX6GYzleGnL2vbD4FxwSOuewDzBL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lWaRpxJQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lWaRpxJQ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65042D0;
	Mon,  8 Jun 2026 19:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780938644;
	bh=tgY2I1ybaeKS3g3v4xFqKSmXJk4x4uv5iGbVjne5wCE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lWaRpxJQMmGM/0ifwKrhBY9h0EpHbgx+OfU5H0x/vmN0blZybOR7Dk45orQzURkW9
	 Rtv9JciB6lepHYUYOwrrj4+gGCE7W5xh8CFGV6U+FmZXrqy5Kw4ixSOn/IU4iiYJgV
	 3Jvszo9/OhajC1kCNathPoacBMBQSt93SdsuXDi4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260608142901.3971821-4-r-donadkar@ti.com>
References: <20260608142901.3971821-1-r-donadkar@ti.com> <20260608142901.3971821-4-r-donadkar@ti.com>
Subject: Re: [PATCH 3/4] media: i2c: ds90ub960: Fix VC mapping when ports skipped
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, vigneshr@ti.com, mchehab@kernel.org, tomi.valkeinen@ideasonboard.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev
Date: Mon, 08 Jun 2026 22:41:07 +0530
Message-ID: <178093866736.19620.15605918094736496808@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Rishikesh,

Quoting Rishikesh Donadkar (2026-06-08 19:59:00)
> From: Jai Luthra <j-luthra@ti.com>
>=20
> Currently the for loop that maps virtual channels from RX to TX ports
> terminates at the first unconnected RX port.
>=20
> Fix that by instead continuing to scan the remaining ports.
>=20

It's never a good idea to introduce a bug in one patch and fix it in the
next. Please squash it in next revision.

Thanks,
    Jai

> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 506b436fe50c..d1597659639f 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -3488,15 +3488,16 @@ static void ub960_get_vc_maps(struct ub960_data *=
priv, u8 *vc_map)
>         struct device *dev =3D &priv->client->dev;
>         u8 nport, available_vc =3D 0;
> =20
> -       for (nport =3D 0;
> -            nport < priv->hw_data->num_rxports && priv->rxports[nport];
> -            ++nport) {
> +       for (nport =3D 0; nport < priv->hw_data->num_rxports; ++nport) {
>                 struct v4l2_mbus_frame_desc source_fd;
>                 bool used_vc[UB960_MAX_VC] =3D {false};
>                 u8 vc, cur_vc =3D available_vc;
>                 int j, ret;
>                 u8 map;
> =20
> +               if (!priv->rxports[nport])
> +                       continue;
> +
>                 ret =3D v4l2_subdev_call(priv->rxports[nport]->source.sd,=
 pad,
>                                        get_frame_desc,
>                                        priv->rxports[nport]->source.pad,
> --=20
> 2.34.1
>
