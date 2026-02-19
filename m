Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C87A199920;
	Thu, 19 Feb 2026 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492388; cv=none; b=UfAo6q2HdIODHdPG9042hu8JUgTP8ZUsh80RNNSS4eRjS24snSpIASN/d1gyHKBt9C3C5lKPJN/hCoA4B/SLLi3+4QKfiiNVyq0zRAlANKoSXDvidHjSW3aLq8ScjgOcxZ29dame64GovnLyxTLRe09kJ5EU04wpq57ILsmPMMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492388; c=relaxed/simple;
	bh=HSw2h+PZEBOcIa2i7rTmCujXGFzGYpL5hEUHndKzeRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUifQMwCjkrx+npGiMUo79aULJfWijzF8gEHCDLhGWkDM/G1jMqoB+NZlngINGij6hUOlcinXNjfHjlaHJbM8dEYSf4JnlC2GO0pqxh7maIpFN/zmCfCVX5aXSBzUD7Zwlkd53C35abtIEFReU7TqzMC2Vdzrt3HDF7TP9MMizM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HszjY5/r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HszjY5/r"
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 542E2673;
	Thu, 19 Feb 2026 10:12:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771492332;
	bh=HSw2h+PZEBOcIa2i7rTmCujXGFzGYpL5hEUHndKzeRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HszjY5/rLUzrykPGKIPj1SgQOmYuEhYgV3T4IEkVnLwJIeAbNYAs4QbThIoAl2BIy
	 U/3Znrgq7n3AvNy2REVaTYa4cAcnBgJaWR3WZjQiIeSiTw98QYl4nyV67sm+VIl2Y3
	 rqjBLKuZTQObnUI94nmkGXUS79sj/23DLxbFbHww=
Date: Thu, 19 Feb 2026 10:13:01 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: michael.riesch@collabora.com
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: comply with minimum number
 of buffers requirement
Message-ID: <20260219091301.GF520738@killaraus.ideasonboard.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
 <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com>

On Mon, Feb 16, 2026 at 02:49:57PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Each stream requires CIF_REQ_BUFS_MIN=1 buffers to enable streaming.
> However, it failed with only one buffer provided.
> 
> Comply with the minimum number of buffers requirement and accept
> exactly one buffer.
> 
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> Cc: stable@kernel.org
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++-----------
>  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index e00010a91e8b..5a5ab9e7e86e 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -106,19 +106,6 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
>  {
>  	struct v4l2_pix_format_mplane *pix = &stream->pix;
>  
> -	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> -	if (!stream->buffers[0])
> -		goto err_buff_0;
> -
> -	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> -	if (!stream->buffers[1])
> -		goto err_buff_1;
> -
> -	if (stream->queue_buffer) {
> -		stream->queue_buffer(stream, 0);
> -		stream->queue_buffer(stream, 1);
> -	}
> -
>  	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
>  	stream->dummy.vaddr =
>  		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> @@ -132,16 +119,30 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
>  			stream->dummy.buffer.buff_addr[i - 1] +
>  			pix->plane_fmt[i - 1].bytesperline * pix->height;
>  
> -	return 0;
> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[0])
> +		goto err_buff_0;

Why do you move this after allocation of the dummy buffer, to then add
dma_free_attrs() in the err_buff_0 error path ?

>  
> -err_dummy:
> -	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> -	stream->buffers[1] = NULL;
> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[1]) {
> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> +	}
> +
> +	if (stream->queue_buffer) {
> +		stream->queue_buffer(stream, 0);
> +		stream->queue_buffer(stream, 1);
> +	}
> +
> +	return 0;
>  
> -err_buff_1:
> -	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> -	stream->buffers[0] = NULL;
>  err_buff_0:
> +	dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> +		       stream->dummy.vaddr,
> +		       stream->dummy.buffer.buff_addr[0],
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> +	stream->dummy.vaddr = NULL;
> +err_dummy:
>  	return -EINVAL;

You can drop the err_dummy label and return -EINVAL directly. Except you
should probably return -ENOMEM as the failure comes from
dma_alloc_attrs().

>  }
>  

-- 
Regards,

Laurent Pinchart
