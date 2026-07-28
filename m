Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CC3B388D;
	Tue, 28 Jul 2026 05:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785216471; cv=none; b=PfEQCEgR/kG6oWdhFhX2+p97Y1XNyZcHuxRHQ4j0M9tJETv2/EuRvXn7qmxLjehvttJ0bOsxVY8juOyzgwLB5iG2d/ozV7tVv8soEWfaI/IoSGoqp/fea4z+GXu6fztGOqxdxPxUG05J/96SGxYwnqE553eOhthWcaYKn+Zn7Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785216471; c=relaxed/simple;
	bh=grVM9NVlTvMvzAahR5kbskhJrrJajhCd5NCBjadnn90=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RnyiLhOo6GSfYmNE961s9faeHcTeRLnoW71FfC5Ulpgk8wsE1qkD7B6l0NiBJO/nbHs5wBDmhzoAwQtgQjk2hQux2zAhyinhvaNbDu6Y0bVdM+A1DQFn4+P9LpOjWpdDHmv2Mr364IPlaK78jrk9E370SOIkP0L9mbkGVJ0zutg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FbdNf+f3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FbdNf+f3"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5590A2F8;
	Tue, 28 Jul 2026 07:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785216401;
	bh=grVM9NVlTvMvzAahR5kbskhJrrJajhCd5NCBjadnn90=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FbdNf+f3PA6YavRMa6jovZmXUyCZfQ8cKYXVV1JujLBskiXj6rPepa1CcEZLVySU4
	 FZHp3+U2HofAFcD0l4brXLMSFzG2GDqZ90AUKlcYZFJ2mKTpJ81DNKv1jbch+NaT9e
	 RIVNRR8Siqp4TTXRn2ukNPcwsm24v9lj4tvg+BCA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260728042013.23707-1-hpa@redhat.com>
References: <20260728042013.23707-1-hpa@redhat.com>
Subject: Re: [PATCH] media: i2c: imx471: Add line length PCK setting
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hansg@kernel.org>, Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>
Date: Tue, 28 Jul 2026 10:57:40 +0530
Message-ID: <178521646078.4139729.8353081240992310969@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Kate,

Thank you for the patch.

Quoting Kate Hsuan (2026-07-28 09:50:13)
> Add the line length PCK setting to the IMX471 driver. This parameter
> determines the horizontal line scan duration and is used for
> controlling the frame rate.
>=20
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/media/i2c/imx471.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 6d358b11e96d..e661f5b78dcc 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -91,6 +91,7 @@
>  #define IMX471_CSI_2_LANE_MODE                 1
>  #define IMX471_CSI_4_LANE_MODE                 3
> =20
> +#define IMX471_REG_LINE_LENGTH_PCK             CCI_REG16(0x0342)
>  #define IMX471_REG_X_ADD_STA                   CCI_REG16(0x0344)
>  #define IMX471_REG_Y_ADD_STA                   CCI_REG16(0x0346)
>  #define IMX471_REG_X_ADD_END                   CCI_REG16(0x0348)
> @@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x1088_r=
egs[] =3D {
>         { CCI_REG8(0x030d), 0x02 },
>         { CCI_REG8(0x030e), 0x00 },
>         { CCI_REG8(0x030f), 0x53 },
> +       { IMX471_REG_LINE_LENGTH_PCK, 5008 },

This does not match the mode->llp value (2328) used for 1928x1088, any idea
why?

Aside from the patch, I also see that the value for the PIXEL_RATE control
is derived using the link-frequency and output bit-depth.

It is likely that the sensor's frame rate depends solely on the LLP and FLL
timing registers, so it should be possible to derive a constant pixel rate
value (for a given PLL configuration) that is independent of link-freq and
bit-depth.

Thanks,
    Jai

>         { IMX471_REG_PLL_MULT_DRIV, IMX471_PLL_DUAL },
>         { CCI_REG8(0x3f4c), 0x81 },
>         { CCI_REG8(0x3f4d), 0x81 },
> --=20
> 2.55.0
>=20
>
