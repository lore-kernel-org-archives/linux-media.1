Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904237C118;
	Thu,  5 Mar 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704711; cv=none; b=OjC2RHmsYT6GepzQgKaQs7oI2MamODsP0JYUBhV87u10Sz/m3vU3NEmEC/JKRb/a3S2gY50UlsCqa8M8qmeqEHer+qLbY+PlbVxDx1N6rRsoBLmpKU+Jiz8g3TEpFWRVpXirTvTQUCOl8pptUPJ9oxx6YxnIza3qtQiWiVxIrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704711; c=relaxed/simple;
	bh=wIpQyW0ykDAdmWOF/3FXPJsdOUrAF5yHahjueKN14W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJmmn9fcaA2wmM81J5SeaqmasfjKYT8Y0YuWtjgiUWnDMzNXIOsctBn/JXIdQrTlHh0EV3Wg4z0mSUfSb20qYWOiOFBqhayB5cglrgCbbZJop62/XRPQVJvwnDqi5tDDX+RdAnlSgtjQT2EcFm/mqtoaLpUgJss70SuybVWlBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I4sDyQYT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I4sDyQYT"
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E23D066B;
	Thu,  5 Mar 2026 10:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772704632;
	bh=wIpQyW0ykDAdmWOF/3FXPJsdOUrAF5yHahjueKN14W0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4sDyQYTTNw3Z+s7iIwfe8zlA2MhbgtqLiiL7wZP3tzuBveCyCm786qvKT7S+E8V2
	 3slfmkR2fCfvs9UX/bVDy4fUZb+LTm2DKJ7cSfF7f6wZwkNT2v0bDrGpSlTgG4vfKo
	 D8uhDk+7WtPPxv8+esn8d2RufrtKHmsOpo3U6Kjo=
Message-ID: <17d66a50-f1a3-468b-89c4-837ab328f738@ideasonboard.com>
Date: Thu, 5 Mar 2026 09:58:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: Check return value of
 media_pad_remote_pad_unique()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: jacopo.mondi@ideasonboard.com, mchehab@kernel.org,
 hverkuil+cisco@kernel.org, nayden.kanchev@arm.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305052032.827341-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260305052032.827341-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chen - thanks for the patch

On 05/03/2026 05:20, Chen Ni wrote:
> media_pad_remote_pad_unique() can return an error pointer if the link is
> missing or ambiguous. The current code dereferences the returned pointer
> without checking for errors, which leads to a kernel crash.
> 
> Fix this by adding an IS_ERR() check and returning the error via
> dev_err_probe().
> 
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

A similar patch was already submitted to fix this issue:

https://lore.kernel.org/linux-media/20260207091822.601255-1-alperyasinak1@gmail.com/

Thanks
Dan

>   drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> index 497f25fbdd13..7c58da3ee331 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> @@ -360,6 +360,10 @@ static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
>   
>   	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
>   	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
> +	if (IS_ERR(isp->remote_src))
> +		return dev_err_probe(mali_c55->dev, PTR_ERR(isp->remote_src),
> +				     "Failed to get unique remote pad\n");
> +
>   	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
>   
>   	isp->frame_sequence = 0;

