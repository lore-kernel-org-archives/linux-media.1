Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D067398915;
	Mon, 22 Jun 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120524; cv=none; b=WLVyO84IXHJ/vXj5VnDoMvCpPzDV/7DkcsXutOczrBQkiMpvFHxM/7qPEywWCCSzMfzenDHN8LWDPcL5J/sh2T1qLJ8+5aAJdUq7aGAfLmGErLiHOZwbIc2L4EIOdQb/7yZDCIOJpenjyIxrh0vb8COmg0LltxvZWqWMb7XqvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120524; c=relaxed/simple;
	bh=egNH3vTU4xmEij+/L/1okAs/oQa67gvHTg/999c3JJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dos4bbq5oIlmJ8ShgPtZNx4XiuRvAB8Fnx9gr/BCr4CcT149ULY/eSsS30ByTjj/odUJSzk55oJmHHSMcAyDi+7hfciqDqg4lPRh4ikrWdxaH/DgY09NiKwxdRlIYbmfFN544Lk2WxkkjSeU2qx/ZLZNGg2SHbh8AS6P5dd9nS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hu0D2IuB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hu0D2IuB"
Received: from ideasonboard.com (mob-109-113-9-173.net.vodafone.it [109.113.9.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0CE99CE;
	Mon, 22 Jun 2026 11:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782120484;
	bh=egNH3vTU4xmEij+/L/1okAs/oQa67gvHTg/999c3JJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hu0D2IuBXoe2rTFXVMG7jRcQFath5jng0bE3Rs/wWhjD80fmaWcxshn9V9UaNaD+c
	 QU2JU4NemneotFA5XvR0/oOlQaChWjpfGES/0XohHTsgk37Miod71kt329FIMNkuvM
	 9tjA0d3vljXiAWCH++lAW/3r7DVppyDt9VRcmi5o=
Date: Mon, 22 Jun 2026 11:28:37 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] media: i2c: vd55g1: Fix media bus code initialization
Message-ID: <ajj90hhNwx7bLkOZ@zed>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-1-4f745a83b87e@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-vd55g4_and_fixes-v1-1-4f745a83b87e@foss.st.com>

Hi Benjamin

On Tue, Apr 28, 2026 at 10:40:55AM +0200, Benjamin Mugnier wrote:
> In the driver initialization, the index of the default media bus code
> from the supported media bus code array is passed directly to the
> vd55g1_get_fmt_code() function instead of the proper media bus code.
>
> This works correctly as a proper media bus code is set after
> initialization but could not have been the case. This also resulted in
> mutliple "Unsupported mbus format" error messages.
>
> Retrieve the media bus code from the media bus code array, and pass this
> media bus code to vd55g1_get_fmt_code() instead of the code index.
>
> Rename VD55G1_MBUS_CODE_DEF to VD55G1_MBUS_CODE_IDX_DEF and
> VD55G1_MODE_DEF to VD55G1_MODE_IDX_DEF while at it to avoid future
> confusions. Display the guilty error code in warning message.
>
> Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")
>
You should cc stable for fixes

Cc: stable@vger.kernel.org


The CI should have flagged that, but for some reason it didn't run
properly on your series
https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1655147

> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  drivers/media/i2c/vd55g1.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 78d18c028154..1e9db21322e3 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -114,9 +114,9 @@
>
>  #define VD55G1_WIDTH					804
>  #define VD55G1_HEIGHT					704
> -#define VD55G1_MODE_DEF					0
> +#define VD55G1_MODE_IDX_DEF				0
>  #define VD55G1_NB_GPIOS					4
> -#define VD55G1_MBUS_CODE_DEF				0
> +#define VD55G1_MBUS_CODE_IDX_DEF			0
>  #define VD55G1_DGAIN_DEF				256
>  #define VD55G1_AGAIN_DEF				19
>  #define VD55G1_EXPO_MAX_TERM				64
> @@ -634,7 +634,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)

Unrelated, but it seems you now have 2 codes for MONO. Does

	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
		return code;

need an update ?

>  				goto adapt_bayer_pattern;
>  		}
>  	}
> -	dev_warn(sensor->dev, "Unsupported mbus format\n");
> +	dev_warn(sensor->dev, "Unsupported mbus format: 0x%x\n", code);
>
>  	return code;
>
> @@ -1347,6 +1347,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>  {
>  	struct vd55g1 *sensor = to_vd55g1(sd);
>  	struct v4l2_subdev_format fmt = { 0 };
> +	int code;
>  	struct v4l2_subdev_route routes[] = {
>  		{ .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE }
>  	};
> @@ -1361,9 +1362,13 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>  	if (ret)
>  		return ret;
>
> -	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
> -			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
> -			      &fmt.format);
> +	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
> +		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
> +	else
> +		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];

Being this a multi-dimensional array, I don't seem much value in
defining VD55G1_MBUS_CODE_IDX_DEF if this is the only place where it
is used. What's the meaning of VD55G1_MBUS_CODE_IDX_DEF for
vd55g1_mbus_formats_bayer ? Does it represent the bitwidth or does it
represent the bayer pattern ?

I would rather define a
VD55G1_DEF_MBUS_CODE_MONO       MEDIA_BUS_FMT_Y8_1X8
VD55G1_DEF_MBUS_CODE_BAYER      MEDIA_BUS_FMT_SRGGB8_1X8

Or maybe do

		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF]
                                                [VD55G1_MBUS_CODE_IDX_DEF];

if easier.

I understand it's a minor, so up to you.



> +	vd55g1_update_pad_fmt(sensor,
> +			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
> +			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
>
>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
>  }
>
> --
> 2.43.0
>
>
