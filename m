Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD76FC5
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780870027; cv=none; b=VnJ0ML/OSEHbTCACcDWCBTr9Zyxg4MWtIPFZqc2yko4DUS5ByBKmgovsK6QDswg9tDQ61AB9EuuioSFKoUkccs8XgKczYXj0q3CoyB11e0WYzlyh49CMlvDF7TdT0+STauunwEnMrGwCQqa8jO+4u+mNZo68zn19mK5TtI4OWas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780870027; c=relaxed/simple;
	bh=AJPf56RXk8I/8fuvddf8HakxidGpxsvpD79uVlrklQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VmnP+HCE+0YSUAstSHxgAhN4+YS/WJR/6b7VZg1OK6qaJzpACkmhe1LEFhO35fTVM/Pn9rkkiq0ALB/RWMr96sTQiXlUDeFdj0ZWN8vFITcOz/Aj4FroudhtDmS2HlV2PzB8X3YR6VjJx7fXICh2sFDTxX1OgpH0RgpL96WOkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSCgnIar; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSCgnIar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA751F00893;
	Sun,  7 Jun 2026 22:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780870025;
	bh=mPZqdNKS2UpywiGGJBE766IPUrevveDbf5M17VKm/bU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WSCgnIar83bNEchdXMyUPvIhP8mit/FdzothzuipDd7D9aFyULABHGh6GjX05CY7Z
	 ELoZ77ZC6cxcyqT0EoKy6+JGpJuxDPsJeo0v0ffZQPO+4CDbkgwQuRlPpldNsR+8Pb
	 QumjPvrKWYsEerM5djQEv5QREYC5VgpN7iVaPAYMO83dkhEjoeBoyu/QVOib+w7lD0
	 Dhovp/oYxZY6B+REEba+gxJj9juGd6WGZiCD616PPthvbPkxDKCVFO/sNpWjrYEn3L
	 pTgyp1rWCdZc2dxN33mUxhUws6REWGogF4yF6m+kTmgnxsKJSFhodqc0NtULPFZJ+0
	 t9Amw7OYKrv7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260607215356.842932-7-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 22:07:05 +0000
Message-Id: <20260607220705.8AA751F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unscaled `exposure_max` allows userspace to request exposure times=
 that exceed the physical frame length during analog binning.
--

commit 5bb0595912a9dcd70c3d849b873e9a213a70ec05
Author: Sakari Ailus <sakari.ailus@linux.intel.com>

media: imx219: Fix vertical blanking and exposure for analogue binning

This commit removes a workaround that doubled the pixel rate, frame length
in lines, and exposure time for analog binning. It updates the minimum, max=
imum,
and step values for the control.

> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 3aebcbaa3fcd6..3cee31758b7e9 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
[ ... ]
> @@ -879,23 +868,25 @@ static int imx219_set_pad_format(struct v4l2_subdev=
 *sd,
>  	crop->top =3D (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> =20
>  	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
[ ... ]
>  		/* Update limits and set FPS to default */
> +		int vblank_min =3D ((int)mode->height * (1 - bin_hv) / bin_hv) +
> +			IMX219_VBLANK_MIN;
>  		ret =3D __v4l2_ctrl_modify_range(imx219->vblank,
> -					       IMX219_VBLANK_MIN * rate_factor,
> -					       (IMX219_FLL_MAX - mode->height) *
> -					       rate_factor, rate_factor,
> -					       mode->fll_def - mode->height);
> +					       vblank_min,
> +					       IMX219_FLL_MAX - mode->height, 1,
> +					       (int)(mode->fll_def / bin_hv) -
> +					       (int)mode->height);
>  		if (ret)
>  			return ret;
> =20
>  		ret =3D __v4l2_ctrl_s_ctrl(imx219->vblank,
> -					 mode->fll_def - mode->height);
> +					 (int)(mode->fll_def / bin_hv) -
> +					 (int)mode->height);
>  		if (ret)
>  			return ret;

[Severity: High]
Does this code allow userspace to request an exposure time that exceeds the
physical frame length?

When vblank is initialized via __v4l2_ctrl_s_ctrl() above, it dynamically
computes and sets the correct upper limit for the exposure control under
the hood.

However, immediately following this in imx219_set_pad_format(), the code us=
es
the unscaled mode->fll_def to modify the exposure limits:

		/* Update max exposure while meeting expected vblanking */
		exposure_max =3D mode->fll_def - IMX219_EXPOSURE_OFFSET;
		exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
				exposure_max : IMX219_EXPOSURE_DEFAULT;
		ret =3D __v4l2_ctrl_modify_range(imx219->exposure,
					       imx219->exposure->minimum,
					       exposure_max,
					       imx219->exposure->step,
					       exposure_def);

Since this patch removes the rate_factor division when writing V4L2_CID_EXP=
OSURE
to the sensor hardware in imx219_set_ctrl(), and exposure_max is not scaled
by bin_hv here, could this overwrite the safely computed hardware bound wit=
h an
unscaled maximum?

If so, userspace could successfully request an exposure value (e.g., 1703) =
while
the physical frame length is only 853, which might violate the fundamental
sensor constraint that exposure time must be less than the frame length.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607215356.8429=
32-1-sakari.ailus@linux.intel.com?part=3D6
