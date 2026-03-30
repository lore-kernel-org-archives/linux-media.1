Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2BB3815FF;
	Mon, 30 Mar 2026 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855941; cv=none; b=TAHhJOJ0+246zSAdNn4CEhzWyXOu8U3nkzMuAfPKiNwagxKbdgh1ctkI1voNtFri6vua5do87fiB/yYQ5XuM4Nuiwd15b5ojdE+WHdfy0FrEx2QzZvtOkWuegXJecrgE762Y2N9v5fLuRM0+4rGImCNoC25ar1243qaxfHJblQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855941; c=relaxed/simple;
	bh=RScmPTJCFGHozUAfWa6DwkKrXcGYeujAXdBwTS8OFwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc71GA4ITRtk4LAoNG9i2m1RJF8/9bgkVqYm7c2NdOk72GFf/cjrTEG/Ssvh8/Maw6GUZspcW5yy3NDsQEWDQukBGou9ZWNLnQhgwQYk/q0i4WxJEji9H8c9rUqBzQpe2l37YoFn5u5pO8FXT+he84rcjeKkg672X2GEqHSAqW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QKS40oLP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QKS40oLP"
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDACF20FF;
	Mon, 30 Mar 2026 09:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774855856;
	bh=RScmPTJCFGHozUAfWa6DwkKrXcGYeujAXdBwTS8OFwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QKS40oLPneyOaDi8/bOF3dWzFjVtJhzqym6wR6tLhy+8/VzVmQWQXUHIgnTQ759Td
	 /1h6sjjQydERHRPDgkfBqEQElmL+jW9Vh4WCSNFduXhbCTYMecEHQhQb1xVyszZ0G4
	 u068n2wEr2e3bzZxFCgx+CTh7vU+Yi7UH1KZ4vUs=
Message-ID: <355f2cf1-b70f-4558-8900-438a17807afa@ideasonboard.com>
Date: Mon, 30 Mar 2026 08:32:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] media: rzg2l-cru: Use proper guard() in irq handler
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
 <20260327-b4-cru-rework-v1-4-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-4-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The irq handler uses a scoped_guard() that covers the whole function
> body.
> 
> Replace it with a more appropriate guard() and reduce the indentation.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 104 ++++++++++-----------
>   1 file changed, 52 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 2d7ac9f37291..b041c72837c6 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -671,70 +671,70 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   	u32 irq_status;
>   	int slot;
>   
> -	scoped_guard(spinlock, &cru->qlock) {
> -		irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> -		if (!irq_status)
> -			return IRQ_NONE;
> +	guard(spinlock)(&cru->qlock);
>   
> -		dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> +	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> +	if (!irq_status)
> +		return IRQ_NONE;
>   
> -		rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> +	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
>   
> -		/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> -		if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> -			dev_dbg(cru->dev, "IRQ while state stopped\n");
> -			return IRQ_HANDLED;
> -		}
> +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
>   
> -		if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> -			if (irq_status & CRUnINTS2_FExS(0) ||
> -			    irq_status & CRUnINTS2_FExS(1) ||
> -			    irq_status & CRUnINTS2_FExS(2) ||
> -			    irq_status & CRUnINTS2_FExS(3))
> -				dev_dbg(cru->dev, "IRQ while state stopping\n");
> -			return IRQ_HANDLED;
> -		}
> +	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> +	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> +		dev_dbg(cru->dev, "IRQ while state stopped\n");
> +		return IRQ_HANDLED;
> +	}
>   
> -		slot = rzg3e_cru_get_current_slot(cru);
> -		if (slot < 0)
> -			return IRQ_HANDLED;
> +	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> +		if (irq_status & CRUnINTS2_FExS(0) ||
> +		    irq_status & CRUnINTS2_FExS(1) ||
> +		    irq_status & CRUnINTS2_FExS(2) ||
> +		    irq_status & CRUnINTS2_FExS(3))
> +			dev_dbg(cru->dev, "IRQ while state stopping\n");
> +		return IRQ_HANDLED;
> +	}
>   
> -		dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> -		cru->buf_addr[slot] = 0;
> -
> -		/*
> -		 * To hand buffers back in a known order to userspace start
> -		 * to capture first from slot 0.
> -		 */
> -		if (cru->state == RZG2L_CRU_DMA_STARTING) {
> -			if (slot != 0) {
> -				dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> -				return IRQ_HANDLED;
> -			}
> -			dev_dbg(cru->dev, "Capture start synced!\n");
> -			cru->state = RZG2L_CRU_DMA_RUNNING;
> -		}
> +	slot = rzg3e_cru_get_current_slot(cru);
> +	if (slot < 0)
> +		return IRQ_HANDLED;
>   
> -		/* Capture frame */
> -		if (cru->queue_buf[slot]) {
> -			struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
> -
> -			buf->field = cru->format.field;
> -			buf->sequence = cru->sequence;
> -			buf->vb2_buf.timestamp = ktime_get_ns();
> -			vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
> -			cru->queue_buf[slot] = NULL;
> -		} else {
> -			/* Scratch buffer was used, dropping frame. */
> -			dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
> +	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> +	cru->buf_addr[slot] = 0;
> +
> +	/*
> +	 * To hand buffers back in a known order to userspace start
> +	 * to capture first from slot 0.
> +	 */
> +	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> +		if (slot != 0) {
> +			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> +			return IRQ_HANDLED;
>   		}
> +		dev_dbg(cru->dev, "Capture start synced!\n");
> +		cru->state = RZG2L_CRU_DMA_RUNNING;
> +	}
>   
> -		cru->sequence++;
> +	/* Capture frame */
> +	if (cru->queue_buf[slot]) {
> +		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
>   
> -		/* Prepare for next frame */
> -		rzg2l_cru_fill_hw_slot(cru, slot);
> +		buf->field = cru->format.field;
> +		buf->sequence = cru->sequence;
> +		buf->vb2_buf.timestamp = ktime_get_ns();
> +		vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
> +		cru->queue_buf[slot] = NULL;
> +	} else {
> +		/* Scratch buffer was used, dropping frame. */
> +		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
>   	}
>   
> +	cru->sequence++;
> +
> +	/* Prepare for next frame */
> +	rzg2l_cru_fill_hw_slot(cru, slot);
> +
>   	return IRQ_HANDLED;
>   }
>   
> 

