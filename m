Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F739E6C6;
	Mon, 22 Jun 2026 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123004; cv=none; b=jIFZFf7/v4g1yHGEugAYPb9E4X/U947v4IZY3nMbOkb/NkYWg5uPEYg5MI68y4ddBJr9vOyW1CBUSgGlcokU4FrD/BJO3xSW8mDhusPlH04rs7JdRtApTiBnCWUnExL/82/WwLZ6YcumnL35mVUSgxQSC0nykOwUWTYnYf0bmkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123004; c=relaxed/simple;
	bh=xlGP4DjItDD30vN2Dc4eIfR0Dla4Nh2sRUt+TIMo67w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5DQRg1dRpzhAnHWgOUV+qCv06hEABJ0TFu9reMequW4Xe+5zE1bn0wGgwAMKXRYanGNnpVcz4P5TG1qirGgg2xvmlbcANFgWL+e2PV2eysdzsGe+dw9fYJStvclT5a5X27F4niakDN/2FoVhu1qRVTiYbtdRwj/vfTaokw9+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wu9fNPsH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wu9fNPsH"
Received: from ideasonboard.com (mob-109-113-9-173.net.vodafone.it [109.113.9.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C764C874;
	Mon, 22 Jun 2026 12:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782122963;
	bh=xlGP4DjItDD30vN2Dc4eIfR0Dla4Nh2sRUt+TIMo67w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wu9fNPsHhQqJUUxU1Msh1Rj2HwEj0YrE2W2M8SWT4GVnFyZfLIinRCDffCwGsBlBr
	 TbV1F2WmsokOXowdKwaBUIUhywuu/tkiyIqsU0vyI2zrAnBVtuQZGHXgVrJlpHdEOF
	 hfmGKJ5uslGJ4cvmcAHJBMA7cA2Mn/CqLuAgi7TE=
Date: Mon, 22 Jun 2026 12:09:57 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] media: i2c: vd55g1: Fix manual digital gain on color
 variant
Message-ID: <ajkJ3u4VdXHWEePt@zed>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-3-4f745a83b87e@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-vd55g4_and_fixes-v1-3-4f745a83b87e@foss.st.com>

Hi Benjamin

On Tue, Apr 28, 2026 at 10:40:57AM +0200, Benjamin Mugnier wrote:
> Apply digital gain to all channels, each channel representing a color.
>
> Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")

Also cc stable here

>
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/vd55g1.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index e44174056ace..2c962fcb41d2 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -60,7 +60,10 @@
>  #define VD55G1_PATGEN_ENABLE				BIT(0)
>  #define VD55G1_REG_MANUAL_ANALOG_GAIN			CCI_REG8(0x0501)
>  #define VD55G1_REG_MANUAL_COARSE_EXPOSURE		CCI_REG16_LE(0x0502)
> -#define VD55G1_REG_MANUAL_DIGITAL_GAIN			CCI_REG16_LE(0x0504)
> +#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH0		CCI_REG16_LE(0x0504)
> +#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH1		CCI_REG16_LE(0x0506)
> +#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH2		CCI_REG16_LE(0x0508)
> +#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH3		CCI_REG16_LE(0x050a)
>  #define VD55G1_REG_APPLIED_COARSE_EXPOSURE		CCI_REG16_LE(0x00e8)
>  #define VD55G1_REG_APPLIED_ANALOG_GAIN			CCI_REG16_LE(0x00ea)
>  #define VD55G1_REG_APPLIED_DIGITAL_GAIN			CCI_REG16_LE(0x00ec)
> @@ -850,9 +853,16 @@ static int vd55g1_update_expo_cluster(struct vd55g1 *sensor, bool is_auto)
>  		vd55g1_write(sensor, VD55G1_REG_MANUAL_ANALOG_GAIN,
>  			     sensor->again_ctrl->val, &ret);
>
> -	if (!is_auto && sensor->dgain_ctrl->is_new)
> -		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN,
> +	if (!is_auto && sensor->dgain_ctrl->is_new) {
> +		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH0,
>  			     sensor->dgain_ctrl->val, &ret);
> +		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH1,
> +			     sensor->dgain_ctrl->val, &ret);
> +		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH2,
> +			     sensor->dgain_ctrl->val, &ret);
> +		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH3,
> +			     sensor->dgain_ctrl->val, &ret);
> +	}
>
>  	return ret;
>  }
>
> --
> 2.43.0
>
>
