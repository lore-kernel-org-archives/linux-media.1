Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26E0402422;
	Mon, 24 Aug 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566716; cv=pass; b=UWjDcuoGviFw2ave8pdz8Nqw+9JxFmAtd2jTCm49oZnOrfSwLNwXfoYZRffEbEWRKuVQJ7z5KxLh7hByt2p5ufBvt9w7Bh6WtdqjSAk+Bj9ChLoAdVSMbAtc1+eXt+8QQiikHyYVjg7enKqSphh2fyYnHSa8Bt9c/xutwZCvcSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566716; c=relaxed/simple;
	bh=J+GwaJ9wvciWTMuP8maP+/zic+fOVb/0BWhBh9fsHnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyLaEObiP/zhFh0GlJa2WNDl8V+Pr+3L5CuTGSMPUaer0yu132dUop5npi9J08o8GjBktvuVAU3ChVjlQvlbQqEaq1qzZ6BcRLcLNH8zPc9EcoJNFO4a1b+prCdrHI1y56sDglW8G23OLSL2byMB9o/pOXKoq6YAJlF3EEjtVBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=XPtRbULA; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="XPtRbULA"
ARC-Seal: i=1; a=rsa-sha256; t=1787566695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vty+lnonCfkUWiOF/SSVZY92GjXasmd1w9NuoRw8rVeRiWT3l4tVpmPwWzzQEmgyLKxIDgoUZSb0Uprk5CGPFZkKaNUiiKnBdbMCQ9nlBbchSPx+3AAQl/qWo/ZcpH5h24F4KgdMb8JTuPb0QzsKyDSAtxaCSQzdXivnzlxNbag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787566695; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9TPOtzbmQGRV73MYqtxOj+BiN3+8SVX1XW9kMVr6SL8=; 
	b=Vy8wzpbbHQuasDws18W6snVeEqxdJEV4QS7zIsu3xZI0SEy5HmigOS28RgFlgOUcAhdmE5ejUM1rfd/fC9EZqEI1HbpEhc+yyt0HtQnfpiz9kg7Di2aeT07sgyA0tcdlHkOrAoRzZbeAeHFYue2wFvNu5ZNhno8lYgA4mMzuzAk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787566695;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9TPOtzbmQGRV73MYqtxOj+BiN3+8SVX1XW9kMVr6SL8=;
	b=XPtRbULAn4jq/NdvDbzor9DYIvRF+TpYBD26bQf5oh0UXtw5pn5Nnuk+TSx8+ZdR
	rgR4qxSBci5vHavVyIZd2WyntoGXqlGNDoI3lXynJB5p8opg+bZUTP0RqmAVB0N8aTp
	BBFaCrbWe/lio0FBrUoEKwd6Zsg3yQ3NH3lynOs0=
Received: by mx.zohomail.com with SMTPS id 1787566694200896.890085447856;
	Mon, 24 Aug 2026 03:18:14 -0700 (PDT)
Message-ID: <72c028ad-a7c5-45d8-b50f-b39cbca19879@collabora.com>
Date: Mon, 24 Aug 2026 12:18:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: verisilicon: Fix the cleanup when a codec
 ->run() fails
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
 <20260824-rk3588-jpegdec-v1-1-180a30a2852d@pengutronix.de>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260824-rk3588-jpegdec-v1-1-180a30a2852d@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 24/08/2026 à 08:39, Sascha Hauer a écrit :
> A codec ->run() operation that fails leaves three things behind, and they
> cannot be untangled one at a time, so fix them together.
>
> hantro_start_prepare_run() sets up the controls of the request attached
> to the source buffer, hantro_end_prepare_run() completes them again and
> arms the watchdog for the job that is about to be started. That pairing
> does not survive the error paths. The two ->run() operations that do
> reach hantro_end_prepare_run() arm a watchdog for a job that is never
> started: device_run() finishes the job synchronously via
> hantro_job_finish_no_pm() and nothing cancels the delayed work, so it
> expires two seconds later and aborts whatever unrelated job happens to be
> running by then.
>
> Split the two jobs hantro_end_prepare_run() would otherwise have to do.
> It keeps its meaning for the success path, complete the request and arm
> the watchdog, and a new hantro_abort_prepare_run() completes the request
> and nothing else for the error paths. Note the resulting invariant: after
> hantro_end_prepare_run() the ->run() operation must return 0, as the
> watchdog is armed and only the interrupt handler disarms it.
>
> rockchip_vpu981_av1_dec_run() then calls hantro_irq_done() on its error
> path and returns the error code to device_run(), which finishes the job a
> second time. The buffers have already been given back by then, so the
> second attempt trips the WARN_ON(!src) in hantro_job_finish_no_pm() and
> bails out. Without the watchdog change this at least reached the first
> finish by accident, because the cancel_delayed_work() in
> hantro_irq_done() returned true for the watchdog the error path had just
> armed. Neither behaviour is something to rely on, so drop the call and
> let device_run() clean the job up. No other codec calls hantro_irq_done()
> from ->run().
>
> That leaves device_run() itself. It takes a pm_runtime reference and
> enables the clocks, then on any subsequent failure jumps to a single
> err_cancel_job label that calls hantro_job_finish_no_pm() - which
> releases neither. Release the acquired resources there.
>
> This last part is what ties the three together. hantro_irq_done() ends up
> in hantro_job_finish(), which already drops the pm reference and disables
> the clocks, so as long as the AV1 error path still goes through it,
> releasing the same resources in device_run() would trip the
>
>    WARN_ON(core->enable_count == 0)
>
> in clk_core_disable() and underflow dev->power.usage_count. Conversely,
> as soon as a failed job no longer arms the watchdog, hantro_irq_done()
> stops releasing anything at all and the resources are leaked until
> device_run() takes over.
>
> The late_postproc setup is skipped on the error path as well. It is part
> of preparing the run, the hardware is not started and the next job
> configures it again, so hantro_abort_prepare_run() simply does not have
> it. Only the sunxi variant sets late_postproc, and its only decoder is
> VP9.
>
> Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by Benjamin Gaignard <benjamin.gaignard@gmail.com>

> ---
>   drivers/media/platform/verisilicon/hantro_drv.c    | 35 ++++++++++++++++++++--
>   .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  2 +-
>   drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |  3 +-
>   4 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3b..a9ebf856096e6 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -147,6 +147,18 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
>   	}
>   }
>   
> +/**
> + * hantro_end_prepare_run() - finish the preparation of a job and arm the
> + *			      watchdog
> + * @ctx:	context the job belongs to
> + *
> + * Complete the controls of the request that hantro_start_prepare_run() set up
> + * and arm the watchdog. The caller must go on and start the hardware, as only
> + * the interrupt handler disarms the watchdog again.
> + *
> + * A ->run() operation that gives up before the hardware is started must call
> + * hantro_abort_prepare_run() instead.
> + */
>   void hantro_end_prepare_run(struct hantro_ctx *ctx)
>   {
>   	struct vb2_v4l2_buffer *src_buf;
> @@ -167,6 +179,21 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>   			      msecs_to_jiffies(2000));
>   }
>   
> +/**
> + * hantro_abort_prepare_run() - give up on a job before the hardware is started
> + * @ctx:	context the job belongs to
> + *
> + * Counterpart of hantro_end_prepare_run() for the error paths of ->run().
> + */
> +void hantro_abort_prepare_run(struct hantro_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *src_buf;
> +
> +	src_buf = hantro_get_src_buf(ctx);
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +				   &ctx->ctrl_handler);
> +}
> +
>   static void device_run(void *priv)
>   {
>   	struct hantro_ctx *ctx = priv;
> @@ -182,15 +209,19 @@ static void device_run(void *priv)
>   
>   	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
>   	if (ret)
> -		goto err_cancel_job;
> +		goto err_pm_put;
>   
>   	v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   	if (ctx->codec_ops->run(ctx))
> -		goto err_cancel_job;
> +		goto err_clk_disable;
>   
>   	return;
>   
> +err_clk_disable:
> +	clk_bulk_disable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> +err_pm_put:
> +	pm_runtime_put_autosuspend(ctx->dev->dev);
>   err_cancel_job:
>   	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
>   }
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> index 56c79e339030e..78100d1c7e850 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -895,7 +895,7 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
>   
>   	ret = start_prepare_run(ctx, &decode_params);
>   	if (ret) {
> -		hantro_end_prepare_run(ctx);
> +		hantro_abort_prepare_run(ctx);
>   		return ret;
>   	}
>   
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index 13e573f1f19de..c6addab4d758b 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -431,6 +431,7 @@ void hantro_irq_done(struct hantro_dev *vpu,
>   		     enum vb2_buffer_state result);
>   void hantro_start_prepare_run(struct hantro_ctx *ctx);
>   void hantro_end_prepare_run(struct hantro_ctx *ctx);
> +void hantro_abort_prepare_run(struct hantro_ctx *ctx);
>   
>   irqreturn_t hantro_g1_irq(int irq, void *dev_id);
>   void hantro_g1_reset(struct hantro_ctx *ctx);
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad373233..99ffb4a743764 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -2192,8 +2192,7 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
>   	return 0;
>   
>   prepare_error:
> -	hantro_end_prepare_run(ctx);
> -	hantro_irq_done(vpu, VB2_BUF_STATE_ERROR);
> +	hantro_abort_prepare_run(ctx);
>   	return ret;
>   }
>   
>
