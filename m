Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088893;
	b=5Tz0Nkrz4RN52ZLeeHC0KMofU6HJ0oIy1VARw5U5eWYKEtKUm0u7AGQOVuaWLCh/Jq09
	 JfLpSVW/GkwD6eSgT0O1FVAzhHiNpZ92P1Xmu2JwlAA2vfVmoNi8nK3Veui5bnQXY4dAl
	 umj0wG6tbEVrjmx6l9BJzaRUOF0ddTvuoeJ9q7IL0B1pnhGe+xwBw22bSMRotMgArWrFy
	 xRLCn7HTCHKa9pyC5NHSUmPz1OvPfdd8XmiyoUBoD1ueIICxRiPHJiZv1RLi17DdkE3fN
	 ZUi2ptFSJ+UHyOWotX3QVLBoXUmX1Kt3pis0fgEDtlzbenC1CkaGcp8OgK5cmUQRvSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088893;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=suGL218ECM2sKYjiRn0B28C0iB/J4pTyRAE4LSStIeI=;
	b=mKuKs7UGIebTPVyN9G8ocU43wzDniDU/zgFqeHJ+fkB+cZfHKDnbN6QaKHkthcFw1Qkf
	 8ckQwwxw0S2s/klGtcwvHExqlumIzKXJR0sUxCAshE34MtooUXwOZH9WlQAq+wEqb39nr
	 tvZcj7U3Nkz6tnk1peRBjpnaVgw7Z9ygMdneBp/hTAGm6pnrJMQC8v90zKYMFuGmKotuK
	 9eb7+03lZoHxJdhRAkFUoSlZE2mwqojfTxuWJQmHNe/5fdsWq5SnR20xbdSOxyABoDTM9
	 Az0xJNwrRsfhL/4mLYkU6u7nyQz/AFrZMOAQmSYgllOcZsJsSyRV4y2CqThPoX/Bj9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=jtNb8yBI;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DF606A32F
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495DF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=jtNb8yBI
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261119114810euoutp02cc7412454ffac3e1ed6f0f4a3a91b981~pb9XHhXGr0968409684euoutp02I
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:48:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261119114810euoutp02cc7412454ffac3e1ed6f0f4a3a91b981~pb9XHhXGr0968409684euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795088890;
	bh=suGL218ECM2sKYjiRn0B28C0iB/J4pTyRAE4LSStIeI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=jtNb8yBIrAjA1FED2ZskEXNhHB5lngqr5afhOZjI8TfcRcNxExeXw4/rTdBybFkak
	 LOtfVF0DgpOqfEGiattBNo5VaVc/8CcrxCdU1gERMzO5HvD1p1T6JmfLXoIrb3OQmt
	 r8rcnPo0KllTbDMO/+lWkW5+Kc0VSNaiCl0Co/HI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261119114810eucas1p2032b8cb48b3256fac00cdd4a9d5a37c6~pb9Wus3VB2556725567eucas1p2_;
	Thu, 19 Nov 2026 11:48:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261119114808eusmtip2d6897b1778e76b3b377806e1bac8f1d9~pb9VmnSh33064130641eusmtip2f;
	Thu, 19 Nov 2026 11:48:08 +0000 (GMT)
Message-ID: <cfb54920-2f3f-4074-a113-5b8d96314f18@samsung.com>
Date: Thu, 19 Nov 2026 12:48:08 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 2/5] media: videobuf2: Allow exporting of a struct
 dmabuf
To: Jai Luthra <jai.luthra@ideasonboard.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
	Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261118-b4-vchiq-isp-v7-2-b8c81d193abf@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261119114810eucas1p2032b8cb48b3256fac00cdd4a9d5a37c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261118180853eucas1p291138c4dcc01ae203505ea9d0dd91ad5
X-EPHeader: CA
X-CMS-RootMailID: 20261118180853eucas1p291138c4dcc01ae203505ea9d0dd91ad5
References: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
	<CGME20261118180853eucas1p291138c4dcc01ae203505ea9d0dd91ad5@eucas1p2.samsung.com>
	<20261118-b4-vchiq-isp-v7-2-b8c81d193abf@ideasonboard.com>

On 18.11.2026 19:08, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> videobuf2 only allowed exporting a dmabuf as a file descriptor,
> but there are instances where having the struct dma_buf is
> useful within the kernel.
>
> Split the current implementation into two, one step which
> exports a struct dma_buf, and the second which converts that
> into an fd.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changes in v6:
> - None
> Changes in v5:
> - Update documentation of return type to only ERR_PTR and not NULL
> Changes in v4:
> - Return a pointer to struct dmabuf instead of passing it as a double
>   pointer argument and returning an int for errors (Laurent)
> - Document the return type (Paul)
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 45 ++++++++++++++++---------
>  include/media/videobuf2-core.h                  | 16 +++++++++
>  2 files changed, 45 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 5e318165659f..7b99d39d7cb1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2419,50 +2419,63 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
>  	return 0;
>  }
>  
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> -		    unsigned int plane, unsigned int flags)
> +struct dma_buf *vb2_core_expbuf_dmabuf(struct vb2_queue *q,
> +				       struct vb2_buffer *vb,
> +				       unsigned int plane, unsigned int flags)
>  {
>  	struct vb2_plane *vb_plane;
> -	int ret;
> -	struct dma_buf *dbuf;
> +	struct dma_buf *dmabuf;
>  
>  	if (q->memory != VB2_MEMORY_MMAP) {
>  		dprintk(q, 1, "queue is not currently set up for mmap\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (!q->mem_ops->get_dmabuf) {
>  		dprintk(q, 1, "queue does not support DMA buffer exporting\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (flags & ~(O_CLOEXEC | O_ACCMODE)) {
> -		dprintk(q, 1, "queue does support only O_CLOEXEC and access mode flags\n");
> -		return -EINVAL;
> +		dprintk(q, 1, "queue supports only O_CLOEXEC and access mode flags\n");
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (plane >= vb->num_planes) {
>  		dprintk(q, 1, "buffer plane out of range\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (vb2_fileio_is_active(q)) {
>  		dprintk(q, 1, "expbuf: file io in progress\n");
> -		return -EBUSY;
> +		return ERR_PTR(-EBUSY);
>  	}
>  
>  	vb_plane = &vb->planes[plane];
>  
> -	dbuf = call_ptr_memop(get_dmabuf,
> -			      vb,
> -			      vb_plane->mem_priv,
> -			      flags & O_ACCMODE);
> -	if (IS_ERR_OR_NULL(dbuf)) {
> +	dmabuf = call_ptr_memop(get_dmabuf, vb, vb_plane->mem_priv,
> +				flags & O_ACCMODE);
> +	if (IS_ERR_OR_NULL(dmabuf)) {
>  		dprintk(q, 1, "failed to export buffer %d, plane %d\n",
>  			vb->index, plane);
> -		return -EINVAL;
> +		if (!dmabuf)
> +			dmabuf = ERR_PTR(-EINVAL);
>  	}
>  
> +	return dmabuf;
> +}
> +EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
> +
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> +		    unsigned int plane, unsigned int flags)
> +{
> +	struct dma_buf *dbuf;
> +	int ret;
> +
> +	dbuf = vb2_core_expbuf_dmabuf(q, vb, plane, flags);
> +	if (IS_ERR(dbuf))
> +		return PTR_ERR(dbuf);
> +
>  	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
>  	if (ret < 0) {
>  		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index feda638d0064..45bfe8a2a12a 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -954,6 +954,22 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
>   */
>  int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>  
> +/**
> + * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue
> + * @vb:		pointer to &struct vb2_buffer
> + * @plane:	index of the plane to be exported, 0 for single plane queues
> + * @flags:	file flags for newly created file, as defined at
> + *		include/uapi/asm-generic/fcntl.h.
> + *		Currently, the only used flag is %O_CLOEXEC.
> + *		is supported, refer to manual of open syscall for more details.
> + *
> + * Return: returns a pointer to &struct dma_buf on success; an ERR_PTR otherwise.
> + */
> +struct dma_buf *vb2_core_expbuf_dmabuf(struct vb2_queue *q,
> +				       struct vb2_buffer *vb,
> +				       unsigned int plane, unsigned int flags);
> +
>  /**
>   * vb2_core_expbuf() - Export a buffer as a file descriptor.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

