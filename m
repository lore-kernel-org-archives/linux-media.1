Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F937483BEB
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329591; cv=none; b=c6zZvcsspLLgzYwOVC4G3LzUen3JdQtg8UnnNZ4X76KW4arqzm6IXUwB8mhRPyjWt5O/gGRO7co5pidoYkSuhKNU/zQ/lNOAUjT3D2fRFSUUmAMzGeNL3fjZtK8+S3zzQxaREK0jd41E6bhAKHGOII8XR6ZrHW7PBLepGlAj0yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329591; c=relaxed/simple;
	bh=35SKJBeT/ZtkuinekZNZZBCyOZGB8wtVbZQ8HAgZuT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlaMSojIT7z8oAbBXsDsRYBxpjkZyZ58VUN0MFHpnoy0qK5RR6+LLskcyWp3KQ8POeR4cgm9WIS+IZ5HUguqo+oox6tn7jvWhC+xRd5lx1Kbdg4k1edv43TUZxQotEG5yyC1AZe+sj/ZzEmM1O0tIWrmQPSWxYs4YjF7Vwwsd+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WIvX7sUv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WIvX7sUv"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06096C1;
	Fri, 25 Sep 2026 11:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790329479;
	bh=35SKJBeT/ZtkuinekZNZZBCyOZGB8wtVbZQ8HAgZuT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIvX7sUvQzmJ0Bz0zbfF7M1YdnX/lkbpjq5dQ6niJmazTm2jr9KuIDbZ5CuVfI7zK
	 jIbhcL/qJm5SWCt6m5n6mQSFDIvTdu0gFVDF5/XfZ1ZpB7rhOhvT4tvlu6x7PpPSdS
	 is6hkaPi+Fk41D9xrPp1s5pbTYnnQNWloITRB2as=
Date: Fri, 25 Sep 2026 11:46:24 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Ignore disconnected queues when
 checking readiness
Message-ID: <arZBmp6VyYx-RvzO@zed>
References: <20260923-mali-c55-tpg-capture-v1-1-7c79bc9e98da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923-mali-c55-tpg-capture-v1-1-7c79bc9e98da@kernel.org>

Hi Linus

On Wed, Sep 23, 2026 at 11:10:33PM +0200, Linus Walleij wrote:
> mali_c55_pipeline_ready() waits for every video queue to enter its
> start_streaming callback, regardless of whether its media link is enabled.
>
> When libcamera uses the TPG, it disables the statistics and parameters
> links and queues only image buffers. Although STREAMON succeeds on the
> metadata nodes, videobuf2 never invokes their callbacks without queued
> buffers. The ISP and TPG are therefore never enabled and capture hangs.
>
> An unused full-resolution or downscaled output can similarly prevent the
> pipeline from starting.
>
> Only require queues connected through enabled media links to have started.
>
> Use media_pad_remote_pad_first() to check the video node pads, retaining
> the capability check before accessing the optional downscale device.
>
> The shared readiness check also keeps stream-off consistent: the first
> active queue to stop disables the ISP.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Wait only for video queues connected by enabled media links. This allows
> TPG capture without metadata buffers and capture through a single output.

Oh great, TPG was broken since a long time now

>
> Tested on the Renesas RZ/V2H:
>
> root@localhost:~# cam -c 1 --capture=32
> INFO Camera camera_manager.cpp:340 libcamera v0.7.2+152-0024628d
> INFO Camera camera_manager.cpp:223 Adding camera 'mali-c55 tpg' for
>      pipeline handler mali-c55
> WARN MaliC55 mali-c55.cpp:1878 Unable to find CRU for memory input
> Using camera mali-c55 tpg as cam0
> INFO Camera camera.cpp:1216 configuring streams: (0) 1920x1080-RGB565/Unset
> cam0: Capture 32 frames
> 30.914700 (0.00 fps) cam0-stream0 seq: 000000 bytesused: 4147200
> 31.132789 (4.59 fps) cam0-stream0 seq: 000001 bytesused: 4147200
> 31.241978 (9.16 fps) cam0-stream0 seq: 000002 bytesused: 4147200
> 31.351047 (9.17 fps) cam0-stream0 seq: 000003 bytesused: 4147200
> (...)
>
> Also tested with camshark, but only solid black test pattern works,
> because of something random:
> to_bgr888 failed: No backend could handle RGB565 with given options
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index f28e9f4354ac..ab2ad51c9e0b 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -510,11 +510,16 @@ bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55)
>  	struct mali_c55_params *params = &mali_c55->params;
>  	struct mali_c55_stats *stats = &mali_c55->stats;
>
> -	return vb2_start_streaming_called(&fr->queue) &&
> +	/* Only wait for queues connected through enabled media links. */
> +	return (!media_pad_remote_pad_first(&fr->pad) ||
> +		vb2_start_streaming_called(&fr->queue)) &&
>  	       (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED) ||
> +		!media_pad_remote_pad_first(&ds->pad) ||
>  		vb2_start_streaming_called(&ds->queue)) &&
> -	       vb2_start_streaming_called(&params->queue) &&
> -	       vb2_start_streaming_called(&stats->queue);
> +	       (!media_pad_remote_pad_first(&params->pad) ||
> +		vb2_start_streaming_called(&params->queue)) &&
> +	       (!media_pad_remote_pad_first(&stats->pad) ||
> +		vb2_start_streaming_called(&stats->queue));

Using media_pad_remote_pad_first() might sound a bit count-intuitive
to check if a link is enabled, but it works indeed and I found no
other easy way to check for this.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  }
>
>  static int mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
>
> ---
> base-commit: 5316e507dc6ffa668122d000ac83e2daf2a2a865
> change-id: 20260923-mali-c55-tpg-capture-be029caacc1e
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
