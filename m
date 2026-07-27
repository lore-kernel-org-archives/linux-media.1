Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4DD41A793;
	Mon, 27 Jul 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160185; cv=none; b=fjLjumbgGJKStNlBPRPbfa30FlOsxV8WYqbZz2jf5F5mXaY5mCk4V5+CrQ1n1+SNa5yuNfamKhHQadZu+jWrR2Gd+mUBF6/UYdcKHp+P6TBN6H4nPn8NOtbxzNrYwUoAEz7g95+NnL0Yd5epne2sSBOV28x8osGouVQYW+3JSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160185; c=relaxed/simple;
	bh=YLmRhM4T4IUEsliz60QNC4pPjAI6GdON453Kw1b6sZk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OmCrLAHXMgGK8w71pEoaUZXaBx545rVrJpygILEq1Ju5ZILR7k+dx/fspn9O9hu66w2tctxZ+XtmkIHhbtuBwLtqqAK78rs7y2ml+ElJ3R+TWrFzjvhHaWM8KRz+G1VcMP20NymEpptAYXueF2qqkWpgGwSRLVr9I/ufUNamlYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=go6rpx1v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="go6rpx1v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053881F000E9;
	Mon, 27 Jul 2026 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785160181;
	bh=jVHZMOJIAI4rU+heyq7DS6MNz5r0XykWshamkVMDkkU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=go6rpx1vdvqiE0MjTsgaWIkcy5NPPhRZrT68/sYDKepLhEPbRdnW+sVaLHAKTh3uk
	 rf1fIgoJ/XW0DW7A33g0ygBZ2dyvkgSJA7Uls9rVCoQbp8ZUCOLawUWsvIatxVAuj0
	 l9SrWXClu9hgxupvnXL+i82Iwz4RoxtipM3qxhDQdDfNJFx2KGWrqesgeiGfb93Au+
	 QguNz2NZionbSJ1Mv2TZmlfYjhZ7O3WEg4JysWoIN8MIhOI9zutqvCnjwJXkTkY+Op
	 oz4OZMDXQeRX+p3T71mr1A0VXpI/Stvgv7Klot+7pew+eYHc9+iwxmVNNBgeDg829a
	 gO/TzPdVv3YHw==
Message-ID: <23512cf4-1991-4ee8-96c5-a83e8ba197ca@kernel.org>
Date: Mon, 27 Jul 2026 15:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3 10/13] media: stm32: dcmipp: pixelproc: addition of
 dcmipp-pixelproc subdev
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
 <20260724-stm32-dcmipp-pixel-pipes-support-v3-10-f77fe7e723d9@foss.st.com>
Content-Language: en-US, nl
In-Reply-To: <20260724-stm32-dcmipp-pixel-pipes-support-v3-10-f77fe7e723d9@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alain,

Some control-related comments:

On 24/07/2026 18:13, Alain Volmat wrote:
> Addition of the driver for dcmipp-pixelproc subdev.  This subdev is the
> last one before the capture device at the tail of both main and
> aux pipelines.
> 
> It is in charge of:
>   - framerate adjustment
>   - downscale
>   - gamma correction
>   - color conversion
>   - pixel packing
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   4 +
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 941 +++++++++++++++++++++
>  3 files changed, 946 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> index a708534a51af4..7178934bb116b 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
> -stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o
> +stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o dcmipp-pixelproc.o
>  
>  obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> index e04fde86550a5..8f41473605aae 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> @@ -285,5 +285,9 @@ void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
>  struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
>  					      struct dcmipp_device *dcmipp);
>  void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
> +struct dcmipp_ent_device *
> +dcmipp_pixelproc_ent_init(const char *entity_name,
> +			  struct dcmipp_device *dcmipp);
> +void dcmipp_pixelproc_ent_release(struct dcmipp_ent_device *ved);
>  
>  #endif
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
> new file mode 100644
> index 0000000000000..4372c75508725
> --- /dev/null
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c

<snip>

> +/*
> + * Functions handling controls
> + */
> +#define V4L2_CID_PIXELPROC_GAMMA_CORRECTION	(V4L2_CID_USER_BASE | 0x1001)

You need to reserve a range in include/uapi/linux/v4l2-controls.h for this
driver (search for V4L2_CID_USER_MALI_C55_BASE).

And the define should include the driver name. 'PIXELPROC' is much too generic.
It probably should be called DCMIPP_PIXELPROC.

Please document what this control does. Typically a new header is added to
include/linux/uapi for this driver containing the CID and the documentation.
See: include/uapi/linux/dw100.h

> +
> +static int dcmipp_pixelproc_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct dcmipp_pixelproc_device *pixelproc =
> +		container_of(ctrl->handler,
> +			     struct dcmipp_pixelproc_device, ctrls);
> +
> +	if (!pm_runtime_get_if_in_use(pixelproc->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_PIXELPROC_GAMMA_CORRECTION:
> +		reg_write(pixelproc, DCMIPP_PxGMCR(pixelproc->pipe_id),
> +			  (ctrl->val ? DCMIPP_PxGMCR_ENABLE : 0));
> +		break;
> +	}
> +
> +	pm_runtime_put(pixelproc->dev);
> +
> +	return 0;
> +};
> +
> +static const struct v4l2_ctrl_ops dcmipp_pixelproc_ctrl_ops = {
> +	.s_ctrl = dcmipp_pixelproc_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config dcmipp_pixelproc_ctrls[] = {
> +	{
> +		.ops		= &dcmipp_pixelproc_ctrl_ops,
> +		.id		= V4L2_CID_PIXELPROC_GAMMA_CORRECTION,
> +		.type		= V4L2_CTRL_TYPE_BOOLEAN,
> +		.name		= "Gamma correction",

"Gamma Correction". More likely, "Gamma Correction Enable" (and ENABLE should probably
be in the CID define as well).

> +		.min = 0,
> +		.max = 1,
> +		.step = 1,
> +		.def = 0,
> +	}
> +};
> +

<snip>

Regards,

	Hans
