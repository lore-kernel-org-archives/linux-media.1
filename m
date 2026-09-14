Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52763328FC
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 23:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789428243; cv=pass; b=UH5CEX+oEJYWT2Or3f48Cl5PxLab6YoDUSnPP/DQHHqnEp9q6NFZ/Jy6QddloTgn2ky8MJ25z3bqt49gOOuJycVyztFUA2qOfbYWqFHaqCRBcejKo70hjDS1eCDDp4z4+B0mkTWMUKfKtCt3FaHAbIgM2HahD9kKHIZ/kwHBSto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789428243; c=relaxed/simple;
	bh=5AHgKLgX4FxvEY7hgdFLKJhNqrH2xubudOm2D7g+zyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7fam9rWyGlO+otHVEcOEWUlWBKP7JrB6NnaJebR5Yem+2nmufjTnGg36dRMG+s3+auAdsfiL+Yd0XDZtUtoqKdI9Gvi/Nfr/nm8aYWkCrXZFHdduvq5RINltqOMgcBgPLXZlcL2TrtatxrZaPKUP5UhiiMEaRwsZJhGJlJwVis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYGIrS/M; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYGIrS/M"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so5875e9.1
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 16:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789428239; cv=none;
        d=google.com; s=arc-20260327;
        b=Ru2wXW82qeEe07nVI/ie4DOCyAuttG92IKApCK13otkXtGNgIXif9yT5vTFe3cWIDd
         qKZ7pqnlj53LPQYY9Op+V6Nqf3U6aYn+9fwGEerYceklhQQQ3irJwAcViqqIsrgrjKMk
         cVRwK0+pA8gw1IB/gt9DBkhnS358oHFrNhOVG+AQRdqz5isEbLxCwXd+BWMcm8nxezL0
         hB8Bqxchv+kpnOMAN4UhdsxPEgQ+pUCi1jMsVI3+q89BFLLeLse2CHEBudV1nvbLel4C
         t0NeTz2IdLHSlrI4upEL9XDaM5FGsm348ray4wegxuIr/4r0+QX1ue7k17sibbt+ZcjR
         xPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7bCiBaA1KLPmBbIRbTd/usVfbjDAGvg/fHxPmUuwfOk=;
        fh=zjEqfY2WQoCX29WJnVPVqplF/4bThREKTfIW5lChJ8Y=;
        b=siE95eoMzbPv54ssnnZDrDSe8xVTEdfi9mT6SfTTF1t/VE73or7XG1zx6ZVoJQLG9z
         pWfYR6hkaF3BdGo4u2PIMcLqEYL2bZsU2iCZkJgTS2Tm7hOS/gg9KkL8pzSJLYK6CaS3
         ngRt0stNsSb6poXiKO+qful3qQx5/R3zInyVdeG5DcMUCFjSXVJvW2F2NQaPD8GaMUpA
         OaByyd4SnN2Bi42e5Om6ajtY9ZIxKjoJ9XvVISnrM1lJgOYfQN+55EIrGzGUpD8gAeZo
         5RnRw4puxFUsLVsCH1V4u6F4x5xpxNFWB9OQhOW8d4CkcDCSMiA0zBp4rYoHJSB6cKIF
         rTRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789428239; x=1790033039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7bCiBaA1KLPmBbIRbTd/usVfbjDAGvg/fHxPmUuwfOk=;
        b=bYGIrS/Mof8wtm0xJyv0Po+xMqM2kTFchMMGRCPvvIDBChzQIsOoFispqU8HF5jCQF
         TQXccC2k9osE6q9gOP8zdub4VmWCfxD7tYSWcZdm6OXwwN09oHp2juJpwoKTEbCj2e3o
         QOwXFBJsCYoR8TkWLMl0U3OSly6NHonhr/9xB8tYb71aLnAhYwjyRErk5Xerwmh+FcfP
         l+5Bu7THOwrcqzWq2A5vpxXC3sfJLmbvMJflh4fbeX3P0uxWVWUmJVJKHMIXu1upKAZb
         EwP2HN7juOhaG6YsFmyf6Rl7/anR7d76ytTwVJ1wVmj8vtj07Yqi00b/Upjl48jUbULu
         uxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789428239; x=1790033039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bCiBaA1KLPmBbIRbTd/usVfbjDAGvg/fHxPmUuwfOk=;
        b=L+I5/zweseDw9VnqggG0QhB9cojhEiVBFF7hwNC6mkZFY+UhLQkZR8BBYheAzZity7
         vZwWlVkMKuaH57tzbUa9mzi6UlCE3RQDBOTpr3XaOBbbVCEJQhLKMXWxr0FHfGjBITw8
         HW8SaDRpstDnSXvno9qiDMLwdLDXB3Z+yoYv10Gd0xRraJ+lf9yo4ydVd3mmKzHoRc2U
         A8a3BpxbyOIY5xEnat3fl3pFb/xF2DrfCotZkUabFgegtfN7wAC2fcUzElw+z9jwMKFv
         hT82/hKlLTbYifr+Lfc7qRyn6stYcL6KpORdvKEB9r/EPTSaXny519i1dmcagpggXTA5
         +F3g==
X-Forwarded-Encrypted: i=1; AKwUvByuDiAsgzyk4vMpPj4GPEx2dHeGEQGrghg9S2Ph+SGAPt72sDmQXP2/1Wdt2Tikrmlf09wljWsvzvJiXA==@vger.kernel.org
X-Gm-Message-State: AFuF++mWgT7n8vsVYpIEB9lAdl7CZr6xwQCk+U+fG8ecDNxzogTxQXVC
	VWNozwyNYn61hB428DEmebGAzh8gGN97iWGgBa+lbCVV1yWxd8ASj7ZTAVVxx6dsbtQmzAPpFrc
	CoB9Gz260Xh7yKJ8qym4hi2LRRabXv/UmCfjAw4Sb
X-Gm-Gg: AYBFou0G/Yzx9OO4My4RQ527asb1sPhjOVe0rw9xKapxcjEyQoock2CULCF2J+BAn3z
	c2QRQpVcDcao9FsoHk8mye158rC8rwV1WAUrGrgLbNAbA+s4/YHMTvLqqQOoaakQ0AHfUP6w8M9
	8qTqM0JYaymQUggIwnLQ2l8KDWNcWV8v3OgBddb3F8HrdixQNilHJMSM4vI81bfAUttoXK4frGs
	IoG3dO6hvsyhBisqof3Kkzf33FVNsxUg/qXy/9ZJahNwSnE+3pk6rnjiKGkTfE0cJJJIQBxwEc1
	rfIDaG0zwV4bfResEvbEiT739QGt9cy4qsSqr8/QVnj51gvvFhHxppZoPdaRvgvSjBnsjrWHN42
	s4o3cS6d8zw==
X-Received: by 2002:a05:600c:28d:b0:49e:7981:4294 with SMTP id
 5b1f17b1804b1-49e7f0a75f7mr109195e9.5.1789428235941; Mon, 14 Sep 2026
 16:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914212258.2657788-1-dave@stgolabs.net> <20260914212258.2657788-2-dave@stgolabs.net>
In-Reply-To: <20260914212258.2657788-2-dave@stgolabs.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 14 Sep 2026 16:23:44 -0700
X-Gm-Features: AcwNN1WtjBrQlHaHMrN5leZ63LaTP-D5FEN0Ol0qz2UAQhJrFSDnK-hyD_rAvN4
Message-ID: <CABdmKX3Oum+wJPy2JUZKoke85L-E5VJKu1VJs-sy+LLbhe2LMA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: system_heap: add a 2MB allocation order for
 IOMMU superpages
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	benjamin.gaignard@collabora.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:23=E2=80=AFPM Davidlohr Bueso <dave@stgolabs.net>=
 wrote:
>
> With 4KB base pages, the system heap allocates buffers in 1MB, 64KB
> and 4KB chunks. The conventional Intel VT-d second-stage and AMD-Vi v2
> page-table formats, and Arm SMMU's 64-bit long-descriptor format with
> a 4KB translation granule, define 4KB pages and 2MB/1GB large-page
> mappings, but no 1MB leaf. A 1MB chunk therefore requires 256 4KB leaf
> entries unless it can be combined with adjacent chunks into a
> suitably aligned larger mapping.
>
> Adding a 2MB allocation order provides naturally aligned, physically
> contiguous chunks matching the 2MB leaf size, without relying on this
> being accidental for separate smaller allocations. The new cost
> is one failed order-9 attempt (keeping current large allocation semantics=
)
> per buffer when 2MB pages are exhausted.
>
> Two benchmarks, measured on an AMD EPYC 7313P.
>
> (i) Mapping, into an idle NVMe function's translated DMA-FQ domain,
> measuring map/unmap: with the v1 page table restricted to 4K/2M/1G
> (amd_iommu=3Dv2_pgsizes_only), a 1GB buffer goes from 1024 1MB chunks,
> only one of whose 2MB windows was superpage-mappable in that run, to
> 512 2MB chunks with all 512 mappable. dma_buf_map_attachment() costs
> decrease by ~16x on average with ~32x for the worst cases. Unmapping
> that buffer drops from ~500 us to 1.25 us.
>
> (ii) A microbench that measures the cost of DMA_HEAP_IOCTL_ALLOC+close
> across various thread counts decreases by factors of ~3-7x alleviating
> allocator's zone->lock contention by being PMD order and therefore is
> pcpu list eligible. Once the buffer size is large enough then the cost
> of the zeroing takes over.
>
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index c8959eadc71d..621cf238ef97 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -55,14 +55,15 @@ struct dma_heap_attachment {
>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
>                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
>                                 | __GFP_COMP)
> -static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDE=
R_GFP};
> +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP,
> +                             HIGH_ORDER_GFP, LOW_ORDER_GFP};
>  /*
> - * The selection of the orders used for allocation (1MB, 64K, 4K) is des=
igned
> - * to match with the sizes often found in IOMMUs. Using order 4 pages in=
stead
> - * of order 0 pages can significantly improve the performance of many IO=
MMUs
> - * by reducing TLB pressure and time spent updating page tables.
> + * The selection of the orders used for allocation (2MB, 1MB, 64K, 4K) i=
s
> + * designed to match with the sizes often found in IOMMUs.

and now also PMD order for allocation / page table efficiency in
addition to sizes IOMMUs can coalesce

>  Using larger order
> + * pages instead of order 0 pages can significantly improve the performa=
nce of
> + * many IOMMUs by reducing TLB pressure and time spent updating page tab=
les.
>   */
> -static const unsigned int orders[] =3D {8, 4, 0};
> +static const unsigned int orders[] =3D {9, 8, 4, 0};
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>
>  static int system_heap_set_page_decrypted(struct page *page)
> --
> 2.39.5
>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

The origin of these orders is:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/staging/android/ion/ion_system_heap.c?id=3Dbd5d6bdae118c49d194869ef7=
57fd650dcabd33e
with not a lot of justification in the commit message.

Downstream we attempt order 9 instead of 8 on heaps that we actually
ship on our devices to match the 2MB PMD size, and many other vendor
heap implementations do as well. Not that it's always likely we'll get
pages that big due to fragmentation.
