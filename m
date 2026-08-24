Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668294048B1;
	Mon, 24 Aug 2026 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566814; cv=pass; b=hICBzBXvnA8mlShf1k768LalrYpg3SNB+umtiD4d8Tc04mGXQgTUgrS0sBiwuskuWYyJiQKHw962stB5sthOZ77QNOFYF1ccFc09YGrRyCbDtTVR2+KMGVJ0QXmw9QOZiQe+2AQzPLTwAFqSvC0PJju6WZNgF9r+/bjvJCs7OZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566814; c=relaxed/simple;
	bh=mSDtZf5R7Mv4pJZj6Bs5ZFH0wrIAjVRTTf3Hie+xe/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mg9KBegReePiqvPMw90jdm8NaI64QetIleS+nYEKd+p8tcDwzLLbyMv5F0r8nueYFrO6407+tViG0q3/+H2WyY9dXC7xuXuUaqF+gWXJs9Cbj1TluFMtMOFsuFvwoO7mhwW6Vd3YyTThKtzvbzLROEGQYW5MhouxTy+rCCQKzYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=MXQa01zm; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="MXQa01zm"
ARC-Seal: i=1; a=rsa-sha256; t=1787566799; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MjlXq010zON+lhCukkiDKvUkuY8wnt1XnNGvuBKXbURyCVOL4FS47MC31P2QnjSKZiE9XZk7xLR9OrxBjSn3LT8druCQf9oql09xzqfsBSiDVniQXQAyvZcRvGGnOcMeg05nSqfdkPkyOiSm8rt/tTYj0Y6tQZoC+oqmm+EZELA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787566799; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kP4bmdXmXS3DS6R8vDn0Rac2upM01LYINyBFr62ugPo=; 
	b=meWbWJYT3NkBsUR8+RQuHM6446urMJohtPi8nJNa1x5wjk2gP2zBi5aZE0RxlhHBJlTyoa0KNtHsZ852hObqb4DnFF0MFpXVGXGAF4jhrwpgAwSdPqd36RVojLhEi9RB7j6Umf9oQrkdI5z4VHqSoK09e8ccvhqiYiU9ogFhTXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787566799;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kP4bmdXmXS3DS6R8vDn0Rac2upM01LYINyBFr62ugPo=;
	b=MXQa01zm9fNrYBbSS58u6mFLXD0DDjh4TsB9mkoL/a4eWFlrcAV7CdIMyGm4Ta4L
	47ISE3IjNS2kQidHF7n+t6Gr6zZkSiYGGKqtlxxg8XtFc9iDdd4vw1WZ0wPQM0DuIvR
	tjbdt+3rPSrCfAVH8tWkEjKFyUN96qb5A5NhZ77A=
Received: by mx.zohomail.com with SMTPS id 1787566797597783.6306751888679;
	Mon, 24 Aug 2026 03:19:57 -0700 (PDT)
Message-ID: <e6e917df-21d8-4641-9116-64fac30b8f63@collabora.com>
Date: Mon, 24 Aug 2026 12:19:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: verisilicon: Allow the EOS event to be
 subscribed
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
 <20260824-rk3588-jpegdec-v1-3-180a30a2852d@pengutronix.de>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260824-rk3588-jpegdec-v1-3-180a30a2852d@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 24/08/2026 à 08:39, Sascha Hauer a écrit :
> hantro queues a V4L2_EVENT_EOS in three places.  vidioc_encoder_cmd()
> sends it when a V4L2_ENC_CMD_STOP has drained the encoder:
>
> 	if (ec->cmd == V4L2_ENC_CMD_STOP &&
> 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> 		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
>
> hantro_buf_queue() sends it for a capture buffer queued after the last
> one, and hantro_stop_streaming() when the output queue stops while
> draining.
>
> No application can ask for any of them.  The ioctl ops offer
>
> 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>
> and v4l2_ctrl_subscribe_event() only knows about V4L2_EVENT_CTRL, so
> VIDIOC_SUBSCRIBE_EVENT for V4L2_EVENT_EOS fails with -EINVAL and the
> queued events are dropped on the floor.  An application following the
> drain sequence in the stateful encoder documentation has to fall back to
> V4L2_BUF_FLAG_LAST, which hantro does set, so this has gone unnoticed.
>
> Dispatch on the event type and hand V4L2_EVENT_EOS to
> v4l2_event_subscribe(), the way coda-common.c does.  Everything else
> keeps going to the control handler.
>
> V4L2_EVENT_SOURCE_CHANGE is deliberately not added, hantro never sends
> one.
>
> Fixes: daf3999c12dc ("media: hantro: Implement support for encoder commands")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_v4l2.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 83af9fa1ce949..9e19daffe0075 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -765,6 +765,17 @@ static int vidioc_encoder_cmd(struct file *file, void *priv,
>   	return 0;
>   }
>   
> +static int hantro_subscribe_event(struct v4l2_fh *fh,
> +				  const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_EOS:
> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
> +	default:
> +		return v4l2_ctrl_subscribe_event(fh, sub);
> +	}
> +}
> +
>   const struct v4l2_ioctl_ops hantro_ioctl_ops = {
>   	.vidioc_querycap = vidioc_querycap,
>   	.vidioc_enum_framesizes = vidioc_enum_framesizes,
> @@ -787,7 +798,7 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
>   	.vidioc_remove_bufs = v4l2_m2m_ioctl_remove_bufs,
>   	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
>   
> -	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_subscribe_event = hantro_subscribe_event,
>   	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>   
>   	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
>
