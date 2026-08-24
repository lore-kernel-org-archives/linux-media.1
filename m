Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8163AAF4E;
	Mon, 24 Aug 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566773; cv=pass; b=GhJlnswEMoG+fKZPKBRm7uTdd4NP3BZ0AVGQ2SMXONDNkhZ1yp/K6AZE3mLPu0cMS7J3ePEqGpTAU19+DYY1qzW16+P1cxYXsmP9587dUPThMOD78do31snafACF7ksizwMakTOa3WPuuXW8Q4xjuEkm/i18CJimERCIbKqUnWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566773; c=relaxed/simple;
	bh=8IvqVJegfrzxXfD6aDARfzFkmnnU6I9HAFD0qXmgSgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyGu2u9QxBlaM1vBfZhQeflQqzYIoorryrAwtH4gFfj2MaF+JB14zAknNlMcb8LipEX+PMPLhdst4d9r55HneQV9a7NSZqd0FCRtll8ud0fGDwGe6pdLmseRaUWnWh5bWejImU12OO3IfzDAfw/QyM2hyAtdvr6jODX3tennyKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=VQWKNZIz; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="VQWKNZIz"
ARC-Seal: i=1; a=rsa-sha256; t=1787566757; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NjkPGi2z90N/qcNSj4UVefeV77WR0yv0SVaqGlT2liozH2pFcoflpzgC4eZlsSnwetPsvZfxjlE9LPVYoZcDBuVDvvjXvakrOOOT5Gr+xHsub1Ss4zWug7FZ1T2DHOf50VMpMGd3WN3NFsVu4UV1PYBPVofVM1TZIy7pyGTf4pQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787566757; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EDaqviIjZuxlDEo1LAssKWLXNSktY9rLgZN6ZXeVI1w=; 
	b=WVbe/PAa2IUSNI89XeSdGdH4KFQozxlc1Y0Do5kU880Oc5g40MLCB/32mTp3sHqRMzRbgET1uGS5pdTYfoeib0dP5qQVHRCxNelENTx0xmapjFQkMLVdNO30f1C43AJ+FzTvfCOwBqHhz++zdjXGlSXzVabSfTZCk53xvDPhcvQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787566757;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EDaqviIjZuxlDEo1LAssKWLXNSktY9rLgZN6ZXeVI1w=;
	b=VQWKNZIzXORzcUOUp75yxFwQlROELLB11epx4N3ll/oQagvx1T1n+dGLRoHx4Q+T
	dlOfA6PMuZpRqgV6c6d/DAl3HTPa1BOD4omzh+gfasefQeEDuk2dx3Drf+/WNdrM1EX
	BbntqT8c5J+akvYBJbAn5oH4woltNCxiTksVRW7I=
Received: by mx.zohomail.com with SMTPS id 1787566756102122.65970812260821;
	Mon, 24 Aug 2026 03:19:16 -0700 (PDT)
Message-ID: <fdd0ff49-4603-4868-ad9f-ddecf1408eab@collabora.com>
Date: Mon, 24 Aug 2026 12:19:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: verisilicon: Complete the request on the
 ->run() error paths
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
 <20260824-rk3588-jpegdec-v1-2-180a30a2852d@pengutronix.de>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260824-rk3588-jpegdec-v1-2-180a30a2852d@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 24/08/2026 à 08:39, Sascha Hauer a écrit :
> Several codec ->run() operations return early without completing the
> request, even though hantro_start_prepare_run() has already run and set up
> the controls of the request attached to the source buffer.
>
> The buffers are still returned to userspace, device_run() finishes the job
> with VB2_BUF_STATE_ERROR, but nothing completes the control handler object
> bound to the media request. vb2_buffer_done() only unbinds the request
> object owned by videobuf2 itself, so num_incomplete_objects never drops to
> zero and the request stays in MEDIA_REQUEST_STATE_QUEUED forever: poll() on
> the request file descriptor never returns and MEDIA_REQUEST_IOC_REINIT
> fails with -EBUSY. The request is only cleaned up when userspace closes it.
>
> The vb2 buf_request_complete() callback does not help here, it is only
> called from __vb2_queue_cancel() for buffers that were never queued to the
> driver.
>
> Call hantro_abort_prepare_run() on those paths, which completes the request
> and leaves the watchdog alone.
>
> Fixes: 42cb2a8f27d2 ("media: hantro: change hantro_codec_ops run prototype to return errors")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_g1_h264_dec.c        | 4 +++-
>   drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c         | 4 +++-
>   drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c        | 9 +++++++--
>   drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c | 4 +++-
>   drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c | 4 +++-
>   drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c  | 4 +++-
>   6 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
> index ad5c1a6634f5c..14ebb25ea24be 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
> @@ -255,8 +255,10 @@ int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
>   
>   	/* Prepare the H264 decoder context. */
>   	ret = hantro_h264_dec_prepare_run(ctx);
> -	if (ret)
> +	if (ret) {
> +		hantro_abort_prepare_run(ctx);
>   		return ret;
> +	}
>   
>   	/* Configure hardware registers. */
>   	src_buf = hantro_get_src_buf(ctx);
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> index 851eb67f19f50..e866ff86019a0 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> @@ -442,8 +442,10 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>   	hantro_start_prepare_run(ctx);
>   
>   	hdr = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_FRAME);
> -	if (WARN_ON(!hdr))
> +	if (WARN_ON(!hdr)) {
> +		hantro_abort_prepare_run(ctx);
>   		return -EINVAL;
> +	}
>   
>   	/* Reset segment_map buffer in keyframe */
>   	if (V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index e8c2e83379def..5778813a9eb2f 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -596,7 +596,7 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>   	/* Prepare HEVC decoder context. */
>   	ret = hantro_hevc_dec_prepare_run(ctx);
>   	if (ret)
> -		return ret;
> +		goto abort_prepare_run;
>   
>   	/* Configure hardware registers. */
>   	set_params(ctx);
> @@ -604,7 +604,7 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>   	/* set reference pictures */
>   	ret = set_ref(ctx);
>   	if (ret)
> -		return ret;
> +		goto abort_prepare_run;
>   
>   	set_buffers(ctx);
>   	prepare_tile_info_buffer(ctx);
> @@ -634,4 +634,9 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>   	vdpu_write(vpu, G2_REG_INTERRUPT_DEC_E, G2_REG_INTERRUPT);
>   
>   	return 0;
> +
> +abort_prepare_run:
> +	hantro_abort_prepare_run(ctx);
> +
> +	return ret;
>   }
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
> index 6da87f5184bcb..d412d5d661226 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
> @@ -473,8 +473,10 @@ int rockchip_vpu2_h264_dec_run(struct hantro_ctx *ctx)
>   
>   	/* Prepare the H264 decoder context. */
>   	ret = hantro_h264_dec_prepare_run(ctx);
> -	if (ret)
> +	if (ret) {
> +		hantro_abort_prepare_run(ctx);
>   		return ret;
> +	}
>   
>   	src_buf = hantro_get_src_buf(ctx);
>   	set_params(ctx, src_buf);
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> index 61621b1be8a2f..0ba078b9d1875 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> @@ -143,8 +143,10 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
>   
>   	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
>   	jpeg_ctx.buffer = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> -	if (!jpeg_ctx.buffer)
> +	if (!jpeg_ctx.buffer) {
> +		hantro_abort_prepare_run(ctx);
>   		return -ENOMEM;
> +	}
>   
>   	jpeg_ctx.width = ctx->dst_fmt.width;
>   	jpeg_ctx.height = ctx->dst_fmt.height;
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
> index d079075448c96..15f4872dd2bdd 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
> @@ -519,8 +519,10 @@ int rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx)
>   	hantro_start_prepare_run(ctx);
>   
>   	hdr = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_FRAME);
> -	if (WARN_ON(!hdr))
> +	if (WARN_ON(!hdr)) {
> +		hantro_abort_prepare_run(ctx);
>   		return -EINVAL;
> +	}
>   
>   	/* Reset segment_map buffer in keyframe */
>   	if (V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
>
