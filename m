Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794041877;
	b=AwSWnLqsGfGODxStMoXf3+b0nqwwuRwqphs17LhIwjwIQty5azzHXt0dNI1u0lwCf8ca
	 vxX3Tc56zYl7YbZaGMgFQABn8XOfp6XUjmLip9VWO23SYNvrGl2UT0UcINjw1XYQ/DH5E
	 Q7TrJAn1bqAZeGBJwBkFKuCJTvruFob7sOG2ZAPep5nbv3SmxcsTWkduTV8/rlPbISPAK
	 pk8ugVLM163IdBGHqOm/p3SlwnYJRBtwjU8+qunpshEd2JeqRTfv+ujNwZcieWLc/2kqR
	 mSzY2eMZq6/ntP49JkxRSL16VnOVfrrWUuEfCYX/nG7fz0t3ETNgDdYq0RMKd2hl/Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794041877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kw2zLGhVUDQnO5rFq8cwt1gUENr7fOzbT4vb4xG8V9g=;
	b=0S0T4zS+t/3VxCYXGESrPg3p1qydtgcVAtV53B3H008oIBa4ZrgosGguuw9T1uEU9BZq
	 UUjcVWBIQUO4FT6NMQv5sCjIy/6MORY89ymSlVSPJiy8cScmUEKjef5JTrDZ3LbqwnooV
	 K2LwLPp6S+YAPYTtTpA4gl0z3obv9N56mIcPvMnlOG4Pz6s1SCjHwoFqcr8L0OuzuceFu
	 Fv3tywVdpoPT4T4DtcMNdLzzvGEaKQ7zzqW+gId99+Qvqdd4dSEcI6DDOqP2gILAyNwh5
	 GrkjLE4TvTslu/5rBKDCX4+MiZiJrHQy5UYn16I/1nJEeP50kSLsbsyUx342Ltn33Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRpHPSXl;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29659606A32C
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 08:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29659606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRpHPSXl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso13010975e9.1
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 00:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794041875; x=1794646675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kw2zLGhVUDQnO5rFq8cwt1gUENr7fOzbT4vb4xG8V9g=;
        b=lRpHPSXl3OIr5GNRw75fM5ZVnwTATltcAGYuVDQrLmWlSaBacYmaetJd4o5f9uMRYU
         DMX7l+/tuuZFYvaoIeUpeGqnN8iBg54fGc4dx9tLUJVuWK/+HFoYsScHTNkhMM7GVBxB
         mLyHawMWuiONSA8LiJKkIrHvjPDEc3AbES34AOLSaJxGBQAde/NUpJ/ThkRJJ4+RS4RB
         sC8YxfIrvJ8/GJmqqXRCc6x9YLqpY4tlKjYhYzsOrOaNhbyyI+Cw28y5pLNJvgoWuw0E
         YPcPunJtCM2x/5gGAKnET9uHIB7H8FPhQzVHOBFNpmXv6dhQHtcVQEg2DDWQWYgFFWo5
         mgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794041875; x=1794646675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kw2zLGhVUDQnO5rFq8cwt1gUENr7fOzbT4vb4xG8V9g=;
        b=gkZg/MBD2zVK7aY7JF4mQONHFfSf/AJeQuByjTGKX3cdPlyfY4AfsAtXDBV+0jy6dk
         midIwo7vbmfEKS+DpNuq8vjPG997Z22+Wp7+U2IRJHDBelYPytM4zSY+hsLOg5D2SZq3
         WaC2VCWdDZVEY3WapD8YzPODE3kwdcJHzW+hsn0e7Vgp1FMntiHkMTJ5ztaNrMDWLF9N
         9t89TWXVH8Q6EY6JGCV7ZWFxws71gl27kHh0inhmyjVKdZg1RdMI3LBCZ6Ik2eOW3Y3C
         x2athwBp3y+1005mprO1kWtyzC0Tio/NGZcU3C1+aXWAgLBfGus28d4tflmieM5VERY4
         ON4A==
X-Forwarded-Encrypted: i=1; AKwUvBxO7y7P89XFwITyyxWxT9iNWyREliRpN1vj8ZhmkRL1Isu9tyxxxTxFjuUY6lFOOgrxyrg+qPSCDCBi/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jVVyUySqmbhomCUJrpuD7jSHm+sR1EkUY+uGohQ+2HZ+Ys/uJ
	a8HS4ovOb+4JUuDNeIVppi8mpfPS3RlCS3iv9JSGsLf4lyxI5uholg5v
X-Gm-Gg: AYBFou3HxE7hGkcGOUXmkF78Jx7GboXsmNP+48P/70Xfom7zvUMIOy1ZkGn7RSjz2N6
	TUX9j51OoAl2QAZDp2lr+9F5FWj6ont7Buvdfe5jUUDYc2yjRdMhmA/rZCYUc+2I1qWASgdxU0u
	HNXTfCVcM1O1NtWUj8C6kU7h0TGKbaguqAqDn1C8JB6FEYECZ/OOjzda2EB0jwefrNzH20MBeEG
	lJT+x9IvMyDo5FSRy0XN6roVESfW166nhlwOpW6164CY8jDy6oFMZw3PoiQyIH0runeYyYiQP+I
	eECLGzNXeBj+ej+dqRjOHzJlkS6j0SC7jKPy1JEet2AUh5ganWIBkFkPhPtJySEj1dtEOvYkVUE
	hBbUGNuySwGYfv4itN1+gbm+8+oAbntBbAEu6yRLmTueBiFBRhrd6Utb5NoMILLKY06Jnl59ssf
	0ShLEwLunAkqg5SB3rXxIogkY2Sc5gkjk8qb/+1wewdkmwmpejWdu21grpYEhIQMLo4ZtsHk0nH
	kt8XlA5iqcuRcM/WWQg9aaDubrl84x2Lzt54nYNUB4YFmoV25K43a1gDWHx8vjcG3Cv/SlnyINQ
	Xhi336uAYEZSzFBsT/wgQ6OOJsRvVrDzDHU2F4SDwSSBLcQ3KHZaUcFs/WBQlugUXXDsMXhVE6f
	leeABEPYzN+78qGTyozdtzpxsNxAmxDGyIIGL1c58UTTOxpbqI6GtF0zMNdZCo7DR
X-Received: by 2002:a05:600c:a015:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4b6df028f04mr88902585e9.14.1794041875269;
        Sat, 07 Nov 2026 00:57:55 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-095-114-115-226.95.114.pool.telefonica.de. [95.114.115.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7701af6sm8597238f8f.38.2026.11.07.00.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:57:54 -0800 (PST)
Date: Sat, 7 Nov 2026 09:57:22 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Dongwon Kim <dongwon.kim@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-rdma@vger.kernel.org, 
	iommu@lists.linux.dev, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>, 
	zhipingz@meta.com, treding@nvidia.com, jhubbard@nvidia.com, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v2 06/23] dma-buf: Let the exporter select mapping type
 at pin/map
Message-ID: <au7mBMbRC8q6NILj@gmail.com>
References: <20261105-dma_mapping_type_v4-v2-0-78b8dc9ae80a@nvidia.com>
 <20261105-dma_mapping_type_v4-v2-6-78b8dc9ae80a@nvidia.com>
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
In-Reply-To: <20261105-dma_mapping_type_v4-v2-6-78b8dc9ae80a@nvidia.com>

On Thu, Nov 05, 2026 at 05:40:41PM +0100, Alistair Popple wrote:
> + * A pin or map that fails after dma_buf_mapping_select() may reopen the
> + * choice only if it was the one that made it. A selection that predates the
> + * call belongs to a live pin or mapping and must survive, otherwise the next
> + * pin or map would reselect under it without an invalidate.
> + */
> +void dma_buf_mapping_unselect(struct dma_buf_attachment *attach,
> +			      bool was_selected)
> +{
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	if (was_selected)
> +		return;
> +
> +	attach->selected = false;
> +	attach->selected_idx = 0;
> +}
> +

After dma_buf_invalidate_mappings(), attach->selected is false while
attach->selected_idx still holds that mapping's entry for a pending
unmap. 

If a pin/map fails before that unmap runs, was_selected is false and
dma_buf_mapping_unselect() resets attach->selected_idx to 0.

A subsequent dma_buf_unmap_sgt() then uses matches[0].

>  int dma_buf_pin(struct dma_buf_attachment *attach)
>  {
>  	struct dma_buf *dmabuf = attach->dmabuf;
> +	bool selected = attach->selected;
>  	int ret = 0;
>  
>  	WARN_ON(!attach->importer_ops);
>  
>  	dma_resv_assert_held(dmabuf->resv);
>  
> -	if (dmabuf->ops->pin)
> +	ret = dma_buf_mapping_select(attach);
> +	if (ret)
> +		return ret;
> +
> +	if (dmabuf->ops->pin) {
>  		ret = dmabuf->ops->pin(attach);
> +		if (ret)
> +			dma_buf_mapping_unselect(attach, selected);
> +	}

dma_buf_mapping_select() sets attach->selected = true before ops->pin()
and the map callbacks run.

In patches 14/15, xe/amdgpu migrate a VRAM buffer to system memory
during pin and map when the attachment does not accept P2P.

That migration calls dma_buf_invalidate_mappings() and clears
attach->selected on every attachment, also the one being pinned/mapped. 

When the callback succeeds, the attachment stays pinned or mapped with
attach->selected == false.

A later map/pin on the same attachment can then reselect without an
invalidation.

Thanks,
Karl
