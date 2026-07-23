Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7937F334;
	Thu, 23 Jul 2026 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822736; cv=pass; b=pNocRV0MtncQrEHZZuO+6Vv/txxjqDJfcTQxLXhieJ2ByRSysNEta3XOYVrD/dwAvnvj0bk6od47IuJS8eCcSt/wUMfOXYmN/hn+d84fcwjh9x687HfwEDzS0pQn2+5Si5YKg8h879bOklP0JMWWDZpdROVsR0MG3h2JM7sj3pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822736; c=relaxed/simple;
	bh=skLBzy+/vuF2Wqr1DEtLmyZrUGnFRZ3Dc/xMGl47KD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8R7nUAB+R0HKufhkVxAwuVZb6opatev8zOggM/RogtpsYbtmWcaPfQymTJkU0esTsnG31S3PpVb03s5wBFbQ7GjwrDg35KqmuxsJeAV4xiqxtJOpj/10Bky/bctjTh7rh2EcL2dx5JMfm7MWKr7f+TvMadQmumYV/6/KhE3NzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=eJpZoht0; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="eJpZoht0"
ARC-Seal: i=1; a=rsa-sha256; t=1784822708; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bHIn2xAiyt58HkFzp8U/ErAnHctniV0Mph1/awebdm1RH/oFCdM/TK10IcA3T5ZMvCqj0wzVHZfFjjzLMn0fcKB0AjisnyyEvpSLh6HThV5IZuS6HcR14dN4hkGzDAGeECVdpKIIT/aSCSHAAEDayYH9jewG3o6lCv38TWRlb0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784822708; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jWaDF4Uendc6ROAfttQ+OOquYaHx6ZKga5wEFtSlfs8=; 
	b=jxZJ8I11B2gyDFF4mvu6V+iDhjEB3haISOrA+2aq1GLIhWyFkyEklOWXoe9tk3bhuxlWwivUKSdUadMUTgLaIRPdyWd5Cl5q0pOB776ILNFn7fh4cc8E7hKV5Z8UMQYpTj0pjSJlYpSsaUjxfW9CARw1qr87iLAB8qruX0sS4Mk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784822708;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jWaDF4Uendc6ROAfttQ+OOquYaHx6ZKga5wEFtSlfs8=;
	b=eJpZoht0fbVBi7sGRWtb7OXyoAw6dusENukbaco7c5lA9xLpINlI8LimibApz6ya
	9TTyyFEtWEWrG1rWQUUkhgGEjcu3tPG/WkqQ/zftCZv9DE3RLX1I80LCSFgGSqwjSOl
	Z7/rakAMLCSJBMk+MFScVT2ywVyiy9D9zB3cwJAs=
Received: by mx.zohomail.com with SMTPS id 1784822706512651.4039423768537;
	Thu, 23 Jul 2026 09:05:06 -0700 (PDT)
Message-ID: <62e3c0b4-831b-45bb-a7b0-b97be2cb3722@collabora.com>
Date: Thu, 23 Jul 2026 18:05:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: vp9: do not arm watchdog on
 preparation failure
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 me@brighamcamplbell.com, jkoolstra@xs4all.nl
References: <20260723153656.2167-1-tharitt97@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260723153656.2167-1-tharitt97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 23/07/2026 à 17:36, Tharit Tangkijwanichakul a écrit :
> hantro_g2_vp9_dec_run() calls hantro_end_prepare_run() when
> start_prepare_run() fails to find one of the required VP9 controls.
>
> hantro_end_prepare_run() completes the control request, but also schedules
> the hardware watchdog. Since the decode operation has not been started on
> this error path, the watchdog should not be scheduled.
>
> Factor the control-request completion out of hantro_end_prepare_run() and
> call it directly from the VP9 preparation error path. This preserves the
> pairing with hantro_start_prepare_run() without scheduling the watchdog.

Nack.
First it schedules a software timer not an hardware timer, which led after
timeout to call hantro_job_finish_no_pm() with VB2_BUF_STATE_ERROR parameter.
We need this call to complete v4l2_m2m job.

If you want to stop the task before the timeout you need to add something like
hantro_end_prepare_run_with_error() where you do the correct sequence.

Regards,
Benjamin

>
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
> Testing:
>
> - Built with the Verisilicon Hantro driver enabled.
> - Not runtime-tested: the available RK3588 board does not expose a Hantro
>    G2 VP9 decoder.
>
>   drivers/media/platform/verisilicon/hantro_drv.c    | 13 +++++++++----
>   .../media/platform/verisilicon/hantro_g2_vp9_dec.c | 14 +++++++++-----
>   drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
>   3 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..04167e4be003 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -147,10 +147,17 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
>   	}
>   }
>   
> -void hantro_end_prepare_run(struct hantro_ctx *ctx)
> +void hantro_complete_ctrl_request(struct hantro_ctx *ctx)
>   {
>   	struct vb2_v4l2_buffer *src_buf;
>   
> +	src_buf = hantro_get_src_buf(ctx);
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +				   &ctx->ctrl_handler);
> +}
> +
> +void hantro_end_prepare_run(struct hantro_ctx *ctx)
> +{
>   	if (!ctx->is_encoder && ctx->dev->variant->late_postproc) {
>   		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
>   			hantro_postproc_enable(ctx);
> @@ -158,9 +165,7 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>   			hantro_postproc_disable(ctx);
>   	}
>   
> -	src_buf = hantro_get_src_buf(ctx);
> -	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> -				   &ctx->ctrl_handler);
> +	hantro_complete_ctrl_request(ctx);
>   
>   	/* Kick the watchdog. */
>   	schedule_delayed_work(&ctx->dev->watchdog_work,
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> index 56c79e339030..e08db6e3f6f9 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -36,12 +36,14 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
>   
>   	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP9_FRAME);
>   	if (WARN_ON(!ctrl))
> -		return -EINVAL;
> +		goto err_complete_request;
> +
>   	*dec_params = ctrl->p_cur.p;
>   
>   	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
>   	if (WARN_ON(!ctrl))
> -		return -EINVAL;
> +		goto err_complete_request;
> +
>   	prob_updates = ctrl->p_cur.p;
>   	vp9_ctx->cur.tx_mode = prob_updates->tx_mode;
>   
> @@ -86,6 +88,10 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
>   	v4l2_vp9_fw_update_probs(&vp9_ctx->probability_tables, prob_updates, *dec_params);
>   
>   	return 0;
> +
> +err_complete_request:
> +	hantro_complete_ctrl_request(ctx);
> +	return -EINVAL;
>   }
>   
>   static struct hantro_decoded_buffer *
> @@ -894,10 +900,8 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
>   	int ret;
>   
>   	ret = start_prepare_run(ctx, &decode_params);
> -	if (ret) {
> -		hantro_end_prepare_run(ctx);
> +	if (ret)
>   		return ret;
> -	}
>   
>   	src = hantro_get_src_buf(ctx);
>   	dst = hantro_get_dst_buf(ctx);
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index 13e573f1f19d..9d4e858f17c7 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -430,6 +430,7 @@ void hantro_watchdog(struct work_struct *work);
>   void hantro_irq_done(struct hantro_dev *vpu,
>   		     enum vb2_buffer_state result);
>   void hantro_start_prepare_run(struct hantro_ctx *ctx);
> +void hantro_complete_ctrl_request(struct hantro_ctx *ctx);
>   void hantro_end_prepare_run(struct hantro_ctx *ctx);
>   
>   irqreturn_t hantro_g1_irq(int irq, void *dev_id);
>
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
