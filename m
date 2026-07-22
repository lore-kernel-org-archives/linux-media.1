Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D7C2D876F
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 05:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698909; cv=none; b=VxWEtx4Vh6BnrBtpB0qKsUp1Xt14ZtJBzWINWNcfDaXw/MLOIIT0uCza08RbdpiW+hzcBH+jLyZy261yHPAs20y+A1A/Tzw+GQ2z0y0BoQ17kjhN4GIqjaVZHDrzZR21CxQYNodLMkaB+zm1jGawUhJbLOYlU/GCueWotU3Iv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698909; c=relaxed/simple;
	bh=OjSEcapw7ABYdIPCs/aXUZn+Y+Q67Ih18zV8rlLBlxw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lclwiPlzHheG9Xxct3a+FNb8I1o3FSMHYk+vIkasJsLj/CBE1NHDE5txK1ADQbLVelIMO4Gjyf0l0uVj0Z8eU3hz63otBiYRHbvjyqlNbfAgJxpA3F71z4SnedtkDo4I8zJAVPV+1tGqIvaM7Vn+/rRKFkqJV+RV5YkwwGpf0co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AoNptzmT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AoNptzmT"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6D6CBAE;
	Wed, 22 Jul 2026 07:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784698845;
	bh=OjSEcapw7ABYdIPCs/aXUZn+Y+Q67Ih18zV8rlLBlxw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AoNptzmT8JJtHxteXUEAfkCOfF6wnTev15PaloCzqgLgBOPvI/qKFWlD+PLeY+hHl
	 UIcI6CLR3DeT/GkZ9FcgD6MSN8JcR+tAqttWpXAAlnM2h2M37kUEoY0c+f6wTUyaLL
	 s0APi5Lgybt8JlZFGSdzMFTFQjkditHZNzgfjLpA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260721-ov5693-gain-v1-1-0eaaee0a7bd4@ideasonboard.com>
References: <20260721-ov5693-gain-v1-1-0eaaee0a7bd4@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: Expand gain values for ov5693
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 22 Jul 2026 11:11:39 +0530
Message-ID: <178469889965.3005206.14178748283924753900@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Dan,

Thank you for the patch.

Quoting Daniel Scally (2026-07-22 03:49:19)
> The ov5693 driver currently allows values for the
> V4L2_CID_ANALOGUE_GAIN control in the range 1-127. The input values
> are left-shifted 4 bits before being applied to the hardware. The 4
> least significant bits are fractional bits, which means that in
> practice gain can only be applied in steps of 1.0.
>=20
> Update the allowed range to take any value that fits into the 11-bit
> register and stop masking off the fractional bits.
>=20
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5693.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 4cc796bbee9263c032384d8327961b5cee52b9e7..1fedd835fb69532ebc3b48b7b=
8c9b02744bf3da4 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -48,10 +48,10 @@
> =20
>  /* Analogue Gain */
>  #define OV5693_GAIN_CTRL_REG                   CCI_REG16(0x350a)
> -#define OV5693_GAIN_CTRL_MASK                  GENMASK(10, 4)
> +#define OV5693_GAIN_CTRL_MASK                  GENMASK(10, 0)
>  #define OV5693_GAIN_MIN                                1
> -#define OV5693_GAIN_MAX                                127
> -#define OV5693_GAIN_DEF                                8
> +#define OV5693_GAIN_MAX                                2047
> +#define OV5693_GAIN_DEF                                16

Earlier the register write for the default value would be 8 << 4, so 128.
But now it's 16. I am not sure if that was intended, if it was maybe add a
note in the commit message.

Thanks,
    Jai

>  #define OV5693_GAIN_STEP                       1
> =20
>  /* Digital Gain */
> @@ -444,7 +444,7 @@ static int ov5693_analog_gain_configure(struct ov5693=
_device *ov5693, u32 gain)
>  {
>         int ret =3D 0;
> =20
> -       gain =3D (gain << 4) & OV5693_GAIN_CTRL_MASK;
> +       gain &=3D OV5693_GAIN_CTRL_MASK;
> =20
>         cci_write(ov5693->regmap, OV5693_GAIN_CTRL_REG, gain, &ret);
> =20
>=20
> ---
> base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
> change-id: 20260721-ov5693-gain-e4362204ee4e
>=20
> Best regards,
> --=20
> Daniel Scally <dan.scally@ideasonboard.com>
>=20
>
