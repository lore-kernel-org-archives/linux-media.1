Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEF3D524D;
	Mon, 30 Mar 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878459; cv=none; b=fB3l6C0XzBoPJZ9gdp3e6jNxlZ1xXHvuoI4jdUPxFGCAyVs/VYgbTLcppodssM/B3I27kLCfZhyfmRnwbrREqV1IGJ5XdxwFXwo4x9/syLNVzyHxRwRV7hT0LMGLXoLVadoVXppGKm+Qt4w0bFW2AjsgpsRdalwYubx4depdVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878459; c=relaxed/simple;
	bh=tW7F7tEGPFoL90JxYoLNV/lHQ1bY67L+5jY+HNQP5+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzG13KDYEqy+ro3vNPYTywFWHXqitoCT9VvJvJxBBQe0pqilIPyLOcCvrtbNdPhWjD7YJsX2TX1U62l80XjQim5F3aWBwmssJxq6vb/El9fuIZvLsC7pGarorvHTERIVYEvVSEcDgJMOKdd+i938RHq2I7Iq/haDzOQP06PbZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g/oYdHJA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g/oYdHJA"
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30DA023B9;
	Mon, 30 Mar 2026 15:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774878374;
	bh=tW7F7tEGPFoL90JxYoLNV/lHQ1bY67L+5jY+HNQP5+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g/oYdHJAtXVbkYBRtjHWpW2horTlEh0En0DfRgif8P+pytdSta5buBnHCvcJ8GC//
	 Uy9xnKtz9wAWF964ImhC/aZSiPoOtUpLBvURft3saFaSfyl8QtjsrtcLbTWwv/NBEp
	 9HybgKV919jsfDOkvX7v1rNXde0+baajz53u0Fp8=
Message-ID: <61ba4a74-2176-4fdc-89ce-0f77944f2f17@ideasonboard.com>
Date: Mon, 30 Mar 2026 14:47:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] media: rzg2l-cru: Remove locking from start/stop
 routines
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-5-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-5-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The start/stop streaming routines do not need to lock the whole function
> body against possible concurrent accesses to the CRU buffers or hardware
> registers.
> 
> The stop function starts by disabling interrupts, and only this portion
> needs to be protected not to race against a possible IRQ.
> 
> Once interrupts are disabled, nothing in the video device driver can race
> and once the peripheral has been disabled we can release all pending
> buffers.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Looks ok to me:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index b041c72837c6..43b1d35fb963 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -341,23 +341,19 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>   void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>   {
>   	unsigned int retries = 0;
> -	unsigned long flags;
>   	u32 icnms;
>   
> -	spin_lock_irqsave(&cru->qlock, flags);
> -
> -	/* Disable and clear the interrupt */
> -	cru->info->disable_interrupts(cru);
> +	scoped_guard(spinlock_irq, &cru->qlock) {
> +		/* Disable and clear the interrupt */
> +		cru->info->disable_interrupts(cru);
> +	}
>   
>   	/* Stop the operation of image conversion */
>   	rzg2l_cru_write(cru, ICnEN, 0);
>   
>   	/* Wait for streaming to stop */
> -	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES) {
> -		spin_unlock_irqrestore(&cru->qlock, flags);
> +	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES)
>   		msleep(RZG2L_TIMEOUT_MS);
> -		spin_lock_irqsave(&cru->qlock, flags);
> -	}
>   
>   	icnms = rzg2l_cru_read(cru, ICnMS) & ICnMS_IA;
>   	if (icnms)
> @@ -401,8 +397,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>   
>   	/* Resets the image processing module */
>   	rzg2l_cru_write(cru, CRUnRST, 0);
> -
> -	spin_unlock_irqrestore(&cru->qlock, flags);
>   }
>   
>   static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> @@ -470,8 +464,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>   	csi_vc = ret;
>   	cru->svc_channel = csi_vc;
>   
> -	guard(spinlock_irqsave)(&cru->qlock);
> -
>   	/* Select a video input */
>   	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
>   
> 

