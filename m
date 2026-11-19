Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101191;
	b=AiNmvtPC4Zy3RpkMAGO7cyAGWjnfFCLSsy2PSmRxiaTkDns12P/Yz9yZ4bttm1B5mjjJ
	 6Ol0KJvc6RN7EeONe3Rk3Whcig30x1YE9BCDEKA27J4Csogj3fKRLa30I7f6ve5M9gQ7C
	 B8xhOObHoG2c7D5Be4vzhz47j5CYaNAaUBNwUdiAu+lFWZLFVbHCMd31Hos4bkwgEq52m
	 saw+VVPRD+DXmAKmtOI10WcXXpgOcB17UX0Ypv5Jb3kWGRHRAq1hfpB6IdxuzVCmLw8Jz
	 9letVerjiKgS8PXC4osDqIDTOWdbkkDs5LSjeMVtaewJET2r7BSKwzeqX9BjFXJAolA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101191;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aUaUnGVOD0AnB0qQi2tHlDtmvMhT+a6tdGKKo0EDxDI=;
	b=DyPoQwXqgNv/K2rmKiw0wM4jzhZe3ZVdPbt2RzylMonUZKmS9HJdFFZWw6C3bhI1h8zt
	 xmr15dUW1EXamv6NcwtpHmGqYNWfnskSFbAN4LnEPMf1ia9XPGZi8c7Efg8Y6zv1fvOFq
	 L1YuTEGYgE1RKwlLheGoEjjNWD2xm49w+SOvULMq/i/Owymvjt/VvGsCyrmQSv4hAi43d
	 y1rp0b/eWbsQ1J+nK2KTfyZOi1Aj8Wxy5++kS90IOcduRKYbhB70ilTQrUBOo9RBET2DF
	 GW6x3VqCT8Oqj+kKWIea4h3gRtxVz9SUHahk65mN4RexlzxMuDJTuFzsMeX5iGgbj/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VTbJfbah;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uIMFT2Q8;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F8606A325
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 15:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31F8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VTbJfbah;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uIMFT2Q8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795101189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aUaUnGVOD0AnB0qQi2tHlDtmvMhT+a6tdGKKo0EDxDI=;
	b=VTbJfbahtRNgoHNldoSLE+xHzwGgT19Ebi5/BQWa1OQLowQ81WhBlrPmTL0669bBo3t8Jq
	FHOKVKnKDsRa7ENCWW0W2NIerIii38xVQyqFRo6FJ+7g4GHgKis89QjmfDTMcqZKMTYrPt
	KaePe6T5D/qiDEdn7vOsx+CkLHl2qTs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-rwwzah9BP4uBv18PQGS8pQ-1; Thu, 19 Nov 2026 10:13:07 -0500
X-MC-Unique: rwwzah9BP4uBv18PQGS8pQ-1
X-Mimecast-MFC-AGG-ID: rwwzah9BP4uBv18PQGS8pQ_1795101186
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso12870445e9.1
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 07:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795101186; x=1795705986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aUaUnGVOD0AnB0qQi2tHlDtmvMhT+a6tdGKKo0EDxDI=;
        b=uIMFT2Q8PmwavS9NEqE0h+UAUF0TVPPrepbqUcVYtImSmrBGEpC/IpWDBJ7mtY6zmZ
         sbQ1uIr2CnqNvfjn1DlAq6AtwD9dPCNLnMyGzQZgSFvqMbuC2DAP99pBymaYMf/xx20o
         MWpEpEK77N6KDJ7HYgKlPRvaT5Vh+DrnsqbQGV/jf8N3qI+dtm52bKMcItGA8tnsm9bi
         8hCR9ok+WZR2vRkBQvA7jIbMBoCw/f51ruQWTRjG2j+wEHH2yKf7N+i3kTeh7lEevBdM
         TS5ZR73v3NH8ivc0PEGN3k8BOrxCae2Jol/+r4LzeRpe0hV8im4QOJb7GaN20LQHP8Wc
         eBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101186; x=1795705986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUaUnGVOD0AnB0qQi2tHlDtmvMhT+a6tdGKKo0EDxDI=;
        b=2MnoIyiGPsvUblpelPXk36Ga83bKuHdLTURvzOLbbBF5F1OICPSVMZ9Lz4B46I4cXO
         fRcH12NBwNiSthJ1TcY+8LFgeajvb4HX9ESDr5p6okmLGx6ZujABORM4MND12ocHn4M5
         WBku7csKAqYbuBdVlQsIEwlrOVAavh2H3ey3SO3xs//VXh5X19arnlgSecz3xpFPzcAM
         4ZkNf9wFTqyhzAzMTBu+Ni2Fog5Tto0F1TcIfp199hH9NEm3DNuYlFCoICqltI703mYB
         fA5R4qvgx9hOrSZ/r6xv51mHd8BDpf23jzh1KYHelCHMhqfo/8D7ID2YJnsQOiMEixFL
         CV9Q==
X-Forwarded-Encrypted: i=1; AL+hErGtdmSjLn1F+fJoAJubT6KokjXUoizRPUP1mUtgTs7I4aSR1jBp+BHnN6JLFjLSuqPAdGAMFUN52HRKWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UpORIUetsLktf/CLnaFSwfXOG9ThzmCGIG4ndEYD3q8KVtbUC
	0sCntvSJWGh4pYX1ik4QPglg2e0wSns3GulSb/OkSeZp7+0RiZMwNk6+WfLxy7mVlBdBoQQjBgj
	tWp0Lcc63YQuGGu7ZWZ/UePNK6CtMWyNHKtDqBjMFQBDYxYDdqVc2MgDK0rFfBh/C
X-Gm-Gg: AYBFou2shl7rsocMNPoZhvMtHdgC+IUK0qxEa0fZnZo93KIFPqLNVxTpnDRcv8dygw1
	Y5V5G10kwBDyp+v4KIi6DMJDpuM/e24az5XzYhAs0NMnZixm1heiBax6DSUc6vxr+ZETE4y0uPv
	kNN/opgPN7d6plTqFEMVH4oAsM/GFoBi9pjcxLEvCxPSlq5cBjIShiEjO/pdAhHuMvzfFY2xjdp
	MiXvEhJnW5UkDqtNv3vKV/LgUW+3gFObislsOHUFbzuGvdl17MQ3sG9xLwEjOIatAGNVRSI9Rbt
	kGClhMi4g0LJ/ZuKIByn8UWVnLNonybBn/xTNxSJFsycFX6RWENg67CRCE6Loi9tHjQ4rcD89M7
	KUiI2heAj5GUNWOGnF91OrgQu6dMZGr9EoBl6qSw7Mw==
X-Received: by 2002:a05:600c:3107:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb7da1272cmr124142395e9.8.1795101185863;
        Thu, 19 Nov 2026 07:13:05 -0800 (PST)
X-Received: by 2002:a05:600c:3107:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb7da1272cmr124141275e9.8.1795101185168;
        Thu, 19 Nov 2026 07:13:05 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm3221365e9.10.2026.11.19.07.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:13:04 -0800 (PST)
Date: Thu, 19 Nov 2026 10:12:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tao Cui <cui.tao@linux.dev>
Cc: akpm@linux-foundation.org, dgilbert@interlog.com, mkp@kernel.org,
	loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com,
	vivek.kasireddy@intel.com, jasowangio@gmail.com,
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org,
	jgg@ziepe.ca, kevin.tian@intel.com, axboe@kernel.dk,
	linux-mm@kvack.org, James.Bottomley@hansenpartnership.com,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	phasta@kernel.org, joro@8bytes.org, will@kernel.org,
	linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
	bobbyeshleman@meta.com, mathieu.desnoyers@efficios.com,
	robin.murphy@arm.com, mason@kernel.org, aesteve@redhat.com,
	tjmercier@google.com, harry@kernel.org, vbabka@suse.cz,
	cuitao@kylinos.cn
Subject: Re: [PATCH 3/7] vhost: account the per-device kernel allocations to
 memcg
Message-ID: <20261119101239-mutt-send-email-mst@kernel.org>
References: <20261106131829.3228926-1-cui.tao@linux.dev>
 <20261106131829.3228926-4-cui.tao@linux.dev>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106131829.3228926-4-cui.tao@linux.dev>

On Fri, Nov 06, 2026 at 09:18:25PM +0800, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> Everything except the worker struct is allocated with plain GFP_KERNEL:
> the per-vq iovec and log arrays at VHOST_SET_OWNER, the memory table at
> VHOST_SET_MEM_TABLE whose size follows the user supplied region count,
> the pending message nodes, and the vhost_net/vhost_vsock device structs
> with their fallback to vmalloc.  The worker has been accounted since the
> vhost_task conversion.
> 
> A container that can open /dev/vhost-net or /dev/vhost-vsock, which
> device plugins hand out with passthrough, holds roughly 150KB of
> resident kernel memory per device after SET_OWNER.  Charge the rest the
> same way the worker already is.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

should each patch be merged individually?


> ---
>  drivers/vhost/net.c   | 14 ++++++++------
>  drivers/vhost/vhost.c | 16 ++++++++++------
>  drivers/vhost/vsock.c |  5 +++--
>  3 files changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index 4570a4ffbab2..bab6597c696d 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -249,7 +249,7 @@ vhost_net_ubuf_alloc(struct vhost_virtqueue *vq, bool zcopy)
>  	/* No zero copy backend? Nothing to count. */
>  	if (!zcopy)
>  		return NULL;
> -	ubufs = kmalloc_obj(*ubufs);
> +	ubufs = kmalloc_obj(*ubufs, GFP_KERNEL_ACCOUNT);
>  	if (!ubufs)
>  		return ERR_PTR(-ENOMEM);
>  	atomic_set(&ubufs->refcount, 1);
> @@ -302,7 +302,8 @@ static int vhost_net_set_ubuf_info(struct vhost_net *n)
>  		if (!zcopy)
>  			continue;
>  		n->vqs[i].ubuf_info =
> -			kmalloc_objs(*n->vqs[i].ubuf_info, UIO_MAXIOV);
> +			kmalloc_objs(*n->vqs[i].ubuf_info, UIO_MAXIOV,
> +				     GFP_KERNEL_ACCOUNT);
>  		if  (!n->vqs[i].ubuf_info)
>  			goto err;
>  	}
> @@ -1344,17 +1345,18 @@ static int vhost_net_open(struct inode *inode, struct file *f)
>  	struct xdp_buff *xdp;
>  	int i;
>  
> -	n = kvmalloc_obj(*n, GFP_KERNEL | __GFP_RETRY_MAYFAIL);
> +	n = kvmalloc_obj(*n, GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> +			 __GFP_ACCOUNT);
>  	if (!n)
>  		return -ENOMEM;
> -	vqs = kmalloc_objs(*vqs, VHOST_NET_VQ_MAX);
> +	vqs = kmalloc_objs(*vqs, VHOST_NET_VQ_MAX, GFP_KERNEL_ACCOUNT);
>  	if (!vqs) {
>  		kvfree(n);
>  		return -ENOMEM;
>  	}
>  
>  	queue = kmalloc_array(VHOST_NET_BATCH, sizeof(void *),
> -			      GFP_KERNEL);
> +			      GFP_KERNEL_ACCOUNT);
>  	if (!queue) {
>  		kfree(vqs);
>  		kvfree(n);
> @@ -1362,7 +1364,7 @@ static int vhost_net_open(struct inode *inode, struct file *f)
>  	}
>  	n->vqs[VHOST_NET_VQ_RX].rxq.queue = queue;
>  
> -	xdp = kmalloc_objs(*xdp, VHOST_NET_BATCH);
> +	xdp = kmalloc_objs(*xdp, VHOST_NET_BATCH, GFP_KERNEL_ACCOUNT);
>  	if (!xdp) {
>  		kfree(vqs);
>  		kvfree(n);
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index ea127af58ada..d1274106ad5d 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -526,11 +526,14 @@ static long vhost_dev_alloc_iovecs(struct vhost_dev *dev)
>  
>  	for (i = 0; i < dev->nvqs; ++i) {
>  		vq = dev->vqs[i];
> -		vq->indirect = kmalloc_objs(*vq->indirect, UIO_MAXIOV);
> -		vq->log = kmalloc_objs(*vq->log, dev->iov_limit);
> -		vq->heads = kmalloc_objs(*vq->heads, dev->iov_limit);
> +		vq->indirect = kmalloc_objs(*vq->indirect, UIO_MAXIOV,
> +					    GFP_KERNEL_ACCOUNT);
> +		vq->log = kmalloc_objs(*vq->log, dev->iov_limit,
> +				       GFP_KERNEL_ACCOUNT);
> +		vq->heads = kmalloc_objs(*vq->heads, dev->iov_limit,
> +					 GFP_KERNEL_ACCOUNT);
>  		vq->nheads = kmalloc_array(dev->iov_limit, sizeof(*vq->nheads),
> -					   GFP_KERNEL);
> +					   GFP_KERNEL_ACCOUNT);
>  		if (!vq->indirect || !vq->log || !vq->heads || !vq->nheads)
>  			goto err_nomem;
>  	}
> @@ -2053,7 +2056,8 @@ static long vhost_set_memory(struct vhost_dev *d, struct vhost_memory __user *m)
>  		return -E2BIG;
>  	if (max_iotlb_entries <= 0)
>  		return -EINVAL;
> -	newmem = kvzalloc_flex(*newmem, regions, mem.nregions);
> +	newmem = kvzalloc_flex(*newmem, regions, mem.nregions,
> +			       GFP_KERNEL_ACCOUNT);
>  	if (!newmem)
>  		return -ENOMEM;
>  
> @@ -3405,7 +3409,7 @@ EXPORT_SYMBOL_GPL(vhost_disable_notify);
>  struct vhost_msg_node *vhost_new_msg(struct vhost_virtqueue *vq, int type)
>  {
>  	/* Make sure all padding within the structure is initialized. */
> -	struct vhost_msg_node *node = kzalloc_obj(*node);
> +	struct vhost_msg_node *node = kzalloc_obj(*node, GFP_KERNEL_ACCOUNT);
>  	if (!node)
>  		return NULL;
>  
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index 0cb87971d749..600daeb05e7b 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -721,11 +721,12 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
>  	/* This struct is large and allocation could fail, fall back to vmalloc
>  	 * if there is no other way.
>  	 */
> -	vsock = kvmalloc_obj(*vsock, GFP_KERNEL | __GFP_RETRY_MAYFAIL);
> +	vsock = kvmalloc_obj(*vsock, GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> +			     __GFP_ACCOUNT);
>  	if (!vsock)
>  		return -ENOMEM;
>  
> -	vqs = kmalloc_objs(*vqs, ARRAY_SIZE(vsock->vqs));
> +	vqs = kmalloc_objs(*vqs, ARRAY_SIZE(vsock->vqs), GFP_KERNEL_ACCOUNT);
>  	if (!vqs) {
>  		ret = -ENOMEM;
>  		goto out;
> -- 
> 2.43.0

