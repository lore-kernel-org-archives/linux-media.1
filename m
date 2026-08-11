Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F629D29F;
	Tue, 11 Aug 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443158; cv=none; b=UY4GNeh9+0OF760soAfTqElKCv/E/A18Amfi3RQ+6qEr56Dzgm75gHRtg6QK6l5BvjrnGBWyrf/ljcctTyRN2MFxbn5PY0NBkJOjF9DWJN1aMUctQ3l8TIMfwzyIsYrbR7GC1W/o4olgpKCyF/yfkBCrcca+RacY+HMSzv5NcXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443158; c=relaxed/simple;
	bh=/kAOnHyuarOKueut2GQG+WxET23EAqz4Py4OOG/++Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlsFWfsoQrl8OyOeIOaWcvBW4ZCq5393tMYt1oJdF88mMKYrXkYpGm/u5AacrpHDYgMCEWwXwvjqqVS13adRnGohcnsPzSxf8JL/IP2SA6UBTUYhKGi5zWLcJP4mzA0HhHu8z2wt9JRWumQaYffvv22sLhPu8TbJLBac060Rw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rJRWCGMW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rJRWCGMW"
Received: from ideasonboard.com (mob-109-113-74-220.net.vodafone.it [109.113.74.220])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A4D54DC;
	Tue, 11 Aug 2026 12:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786443070;
	bh=/kAOnHyuarOKueut2GQG+WxET23EAqz4Py4OOG/++Qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJRWCGMWbNVFpzJ2ki5KAVs5rLUp8Y3Hd6tcFj90u0b1/uCiSuybvZwWcTUsEs1QQ
	 SqqqaYNcLQvdEfqzCmokImh/45zjpE5a+3nFJF6xkRZ7DQsydkaKBxXRhz6k777nRn
	 zkTLjVoWiCqrlexN2PRA6RsvawXmTZfeUjbmCtkI=
Date: Tue, 11 Aug 2026 12:12:21 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: raoxu <raoxu@uniontech.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: m2m-deinterlace: fix default capture field
Message-ID: <anr1DLTi2UUdWWZ0@zed>
References: <2F5126811A6B9396+20260811015222.3467910-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2F5126811A6B9396+20260811015222.3467910-1-raoxu@uniontech.com>

Hi Xu Rao

On Tue, Aug 11, 2026 at 09:52:22AM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
>
> queue_init() initializes default formats for both the source and capture
> queues.  It first sets the source field to V4L2_FIELD_SEQ_TB, but then
> stores the capture default, V4L2_FIELD_INTERLACED_TB, in the source queue
> again while initializing the capture queue.
>
> This overwrites the valid source default and leaves the capture field at
> its zero-initialized value, V4L2_FIELD_ANY.  vidioc_streamon() accepts
> only V4L2_FIELD_SEQ_TB or V4L2_FIELD_SEQ_BT on the source queue, and
> requires the capture queue to use a compatible interlaced or NONE field.
> Userspace that relies on the default formats can therefore get -EINVAL
> when starting streaming.
>
> Initialize the capture field instead.  The bug is usually hidden because
> mem2mem applications commonly call S_FMT on both queues before streaming;
> the TRY_FMT paths normalize the fields and S_FMT overwrites q_data[].field.
>
> Fixes: 8f0755c06b90 ("[media] media: Add mem2mem deinterlacing driver")

Missing

Cc: stable@vger.kernel.org

> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/media/platform/m2m-deinterlace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
> index 1d0e70eaea3d..9dcc4bd6cbdd 100644
> --- a/drivers/media/platform/m2m-deinterlace.c
> +++ b/drivers/media/platform/m2m-deinterlace.c
> @@ -822,7 +822,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>  	q_data[V4L2_M2M_DST].width = 640;
>  	q_data[V4L2_M2M_DST].height = 480;
>  	q_data[V4L2_M2M_DST].sizeimage = (640 * 480 * 3) / 2;
> -	q_data[V4L2_M2M_SRC].field = V4L2_FIELD_INTERLACED_TB;
> +	q_data[V4L2_M2M_DST].field = V4L2_FIELD_INTERLACED_TB;

Looks like a bug indeed. As you said, set_fmt re-initializes the field
to V4L2_FIELD_INTERLACED_TB so it should be harmless, but there are no
reasons not to fix the initialization.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  	return vb2_queue_init(dst_vq);
>  }
> --
> 2.50.1
>
