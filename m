Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997C2DF68
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869956; cv=none; b=hJpgaJPFzFTYR5ArG+KYRSsjYennzowF5n4JE7KrQ/t8P5y9FId4Q7x4yfmrYWtTl5R2L22ZpN9bVzr9DS91ebYLskCcw0KuWpFO1l5Eps8lgKXzlo02ORNzDM8EmVPftP13xIpMt0GP08Bv0gOSe334+YtMqisL8Ihutx3RUL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869956; c=relaxed/simple;
	bh=GFY6EjKGrURjx7So87D0YA9jPPc0vKpx0asyimwmgAU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bISbclDBT/4h9HZSZkYJ0iApLI6zlIPhjnrSFOGThKxfDItERreBjrqf5bpl25T9yyA5aNYIZy71U2SaJ3gaINxPS61Xkvt2JXQNSu9Yt/VVDtjD8YlKkgUAE7Xvi/JMK6RFmXfon0S08fsDjWfIvUW7xCwMhvwehMKYBZDMCIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/xN3LAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/xN3LAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F711F00893;
	Sun,  7 Jun 2026 22:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780869954;
	bh=vppzKEgci5FhGfOKQlY7w8GbgbSmD6tsz5/TRwH4v+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/xN3LAS7aATLZRYiCgQqLfqdYoZRUyMNn/DopqljIvvxJOAF6JwhPTzef0VHebjR
	 eds6kcluU17IhQHwjkCpW3qtmYFCdu6QVrLHdVrpnZ1nRsTQzEtql6PgY8Ecqb6Jmm
	 RnFZzoySzF+o5LL1NW/gmWtpG3OrDryNFhFNacg18dbgCinYzgIJdHWLjoUhiZfHsB
	 gEWcbfBgy5ZL33qc2rLFfnRhypXS9JFbofJMnuBBDs5zTIaEuomtv0ERlBNAlJn0uW
	 yzQWbm6r+eN9UkT0pv68nsJHPcp8fwf1JEzhOJ5oRE0QfW4DkqrXieB6tVHyXpZpDM
	 k9t798ckTUGNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/10] media: imx219: Account rate_factor in setting
 upper exposure limit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260607215356.842932-4-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 22:05:54 +0000
Message-Id: <20260607220554.B4F711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch updates the exposure maximum limit calculation in `imx21=
9_set_ctrl()` to account for analog binning (initially via `rate_factor`, l=
ater rewritten using `bin_hv` in commit "media: imx219: Fix vertical blanki=
ng and exposure for analogue binning"), but misses the identical calculatio=
n in `imx219_set_pad_format()`. This logic error persists through the end o=
f the series. When a binned format is set, `__v4l2_ctrl_s_ctrl(vblank)` cor=
rectly updates the exposure limit via `imx219_set_ctrl()`. However, immedia=
tely afterward, `imx219_set_pad_format()` recalculates and overwrites `expo=
sure_max` using the unscaled formula `mode->fll_def - IMX219_EXPOSURE_OFFSE=
T` (instead of `(mode->fll_def / bin_hv) - IMX219_EXPOSURE_OFFSET`). This a=
llows userspace to set an exposure time greater than the frame length, viol=
ating sensor hardware constraints.
--

commit 5813edc0a3e8ed48f469607d03f8489ba7a6eb19
Author: Sakari Ailus <sakari.ailus@linux.intel.com>

media: imx219: Account rate_factor in setting upper exposure limit

This commit modifies the maximum exposure time calculation in imx219_set_ct=
rl()
to account for the rate_factor multiplier when analog binning is used. This
ensures the sensor's exposure time margin is correctly respected.

> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index d8fe7db18b6cd..e681f80f9e3ef 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -451,7 +451,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		int exposure_max, exposure_def;
> =20
>  		/* Update max exposure while meeting expected vblanking */
> -		exposure_max =3D format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
> +		exposure_max =3D format->height + ctrl->val -
> +			IMX219_EXPOSURE_OFFSET * rate_factor;

[Severity: High]
This is a pre-existing issue, but does imx219_set_pad_format() also need to
be updated to apply scaling to its exposure maximum calculation?

When a binned format is set, __v4l2_ctrl_s_ctrl(vblank) correctly updates
the exposure limit here in imx219_set_ctrl(). However, immediately afterwar=
d,
imx219_set_pad_format() recalculates and overwrites exposure_max using the
unscaled formula:

drivers/media/i2c/imx219.c:imx219_set_pad_format() {
	...
		/* Update max exposure while meeting expected vblanking */
		exposure_max =3D mode->fll_def - IMX219_EXPOSURE_OFFSET;
		exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
				exposure_max : IMX219_EXPOSURE_DEFAULT;
		ret =3D __v4l2_ctrl_modify_range(imx219->exposure,
					       imx219->exposure->minimum,
					       exposure_max,
					       imx219->exposure->step,
					       exposure_def);
	...
}

It appears this logic error persists until it is rewritten using bin_hv in
the later commit "media: imx219: Fix vertical blanking and exposure for
analogue binning".

Until then, does this allow userspace to set an exposure time greater than
the actual programmed frame length, violating sensor hardware constraints a=
nd
potentially resulting in sensor streaming failures or I2C timeouts?

>  		exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  				exposure_max : IMX219_EXPOSURE_DEFAULT;
>  		ret =3D __v4l2_ctrl_modify_range(imx219->exposure,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607215356.8429=
32-1-sakari.ailus@linux.intel.com?part=3D3
