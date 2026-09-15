Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAE33D9525
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486448; cv=pass; b=MxbRIlB5KJyQmBntfyPA8a3WiIGhwq6mTz86Htvgt/d79wAIpD5fs+ewdAsfFxHEt8JChOIsaXNOoUDv2u+P30ddh87bTZr0NdpAQH0VQQPKIbLraMaIf5SPrdmbCELhTxAj9IAl+cmx4UifZ9O7Qr351uneOHhViWQ8oc6HPi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486448; c=relaxed/simple;
	bh=Csgbxe10Z+ZCPKzBVB/A4IDZsvLPwkzNJLNs1a1qPT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyMTgj3WsOQaQFxhAFJLqI6o5uQDvIr1Ymg8CIr2vC3XbiKH6Hpuyo0YOaS8OA/iPqFUACSnvgYCJsG8zuK0ShcasoYX6/g+deGD7EgAdk9QmdvQtB/SWFds59nGu4Ci+Eb8frmA/mC+iNlfae5qUGsY93bXwtHTv9HdgPAGEbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i+jo+a4C; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i+jo+a4C"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d5fc2cd8so53371cf.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789486445; cv=none;
        d=google.com; s=arc-20260327;
        b=mpvPvXB+uA/aNm+3+KysCzKC8EdHJhFLdA2bXJB1UQAyWaLRpbmPxCcS4Gz26+GPbe
         a5Lu9TmPKR7iEclHyZHPbc5Acs85qLY+tdFa7tU6T8HYYqzmGNMNN/BE/5V9DLoosqq9
         dviDRmPEfZ7YASOeWsYfRK2xWlErjU1jqCJ5oYpvaYAgq21XmSSCGTeP4jkNSFw2X7aR
         kEu5opMu+CSnDam1TjqOvTEwkJDEyH/D4sSMM10P5uboPyp0lw8bT2JuzA0bq4avmM8u
         5IpzFJ6xjdO3BCuVDC3DTqKu5bY55Ch+1wzFoY1ZY1WE9kT7d7RHCRWufM0S2kZYoi2j
         st5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gt2obvr/vrzXbdJZb7+7fZvd97UZ/AmDVWmrtkgr1HY=;
        fh=YjkMB63BiqqNEi2P7gwny37Sfm1CtJf22Atu60EX0J4=;
        b=Cw6NZZHLZKmvVsJQgfbZNlOF6YQr6kMUzUNOWly69M4d9m8RjF6z7QW1madOlOWgyH
         r6B5SIuPAm7Eyu45a30E23D2Wlv679N0iJiMy7wweVs6g/y7CSVe7fy+vNa9rPv9YikI
         Vf+hZnJ6ORrYbkh6F3hM6cG7Fq1YtEoFYhpy9PnS1czEfW7n+iVNIj1PulkIlrJpprH1
         Yf1Xv2zCA8Rss6f+FLuZvGlRwfJP9FlHsRoltk0DschB/psy5Vm0gLfhGdeX10T+dWZn
         wdKoQTYCxDo/RXOvFwT+u5k78Pv2HEOadPUHNd5J79HaUPmNs8zYz+uHGMIrizwo6Yv9
         Z7hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789486445; x=1790091245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gt2obvr/vrzXbdJZb7+7fZvd97UZ/AmDVWmrtkgr1HY=;
        b=i+jo+a4CRzr1Y6Y6HoWjtiD5fZWAMAyYTDmUSoPgBV9gdmQGoof5pj2e9bU/cYvTT1
         0ZEmTtIvFjq+LNqby5kFN4s/Pi2Lu4GB94aY3A8W8S/eEhqyHbmigOzgiYktjz0OZ1PG
         lp5fXjfCuSBnDj/iK4yS6HebqS4ktH18uRucxR9lriWUoz7/IU85Vy6UlMG8q/Qn0ax4
         +dBjjtk25B3jW/p1YXRdpq7gPH3fuj7YGSkNbaXj8kfGU5UzRt48rSH2cwnnCJcCPnNc
         IaJ3pbd1qATezIUCV492+Ne6q2PO0glVEYF4OF01IpSYwY+dYyOWLaPpdb1lsBMfuYiA
         E9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486445; x=1790091245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt2obvr/vrzXbdJZb7+7fZvd97UZ/AmDVWmrtkgr1HY=;
        b=TIMzRPPOidLIyMo77POQcNIiEDkLFlIXO08kTTRsWQW3i+lIce2ywV+Jva6eMxs8Qg
         PMtRKlB4iVMKk5sU2ClCALb6q6hxpjC06ndrqT1/t9tnkMZhmRq2zvnJjeaumtoV7Bgr
         3hk37qobKOTScIjBV3WrVAyCXA0KSJw8UxEo0eyn7DHh5INiKlPA3lcipDzGTxXhzvIx
         ZST+VaEtQohaykI/sMAOWoQgUvtpyzKWoFAMu/hxPJEksRvbbIdlEyrOxsGIyvSpxt0Q
         ZzwTdx6A3aiMquJk4GSQ4cehihyig4uO+Q7nTn2u8BJKmSmT7OPo28h7AwLWmLVw6ldr
         pG0A==
X-Forwarded-Encrypted: i=1; AKwUvBzZxxtqhVMFTxhs3fiGFiTqERhxyBJH4MUEIw0QxZwNW8A4x6Tr1bznZs3BVLuTl0VOru0JhGEQcO0kWA==@vger.kernel.org
X-Gm-Message-State: AFuF++n9BMIy2+5766T9nVns/cGO+p47GCeVaV2OlTLur1k7JO8ChWik
	RDXYndztnA9pzZuGh38L4kjWC2Ez6vF+r+16CmS/e1FraLbqo4JpXMrtF7uqaCBFViJCeO5lQOa
	XeJG1zq6fxxU4pMbuRT3Ej4IzxV5UeSKZ6KxarWDk
X-Gm-Gg: AYBFou2LoLZfbO+LtT+GyFWjcXHFVivJlQUQLxmR28EquL9s6HuhJHgZktp3Ut1x1jo
	hNzGDL1C5QT47Ue14fXjnD3g5Q35UZCt/rsZ7gJ9Ob/r6bA07c9xFStsmKVkXjZ/EpM+g+LEcQI
	swQ9jaxKj1uCVBrCvb9kWimnlDXu/hiwBdyRAII2u/Yrkx6YCrNU0kLVhtSUHkgPfIfXYwPpUIE
	r3eRvMpkjgYvj5E4qfM2A60sAwFxO7U6r9lVyDLrLJ/8AJkZsYWGeb2fYkd2+k2WkmVukAGnNbW
	0CJ6h/FK/XppC2yFIRphr1RB0ur8YOkj6He6vfAJ5il2UBTaKISQomV8Azu60hkwzniTzqAZfSy
	6/q/l1nKWBVhevOAxmX7LoR9MIW1Jd5feXS8La8EajQ==
X-Received: by 2002:a05:622a:5809:b0:530:3f93:9023 with SMTP id
 d75a77b69052e-5311a5c4ddbmr20364911cf.4.1789486444831; Tue, 15 Sep 2026
 08:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914212258.2657788-1-dave@stgolabs.net> <20260914212258.2657788-2-dave@stgolabs.net>
 <54ae0d83-d777-4357-8e87-dfc3a5c7b835@amd.com>
In-Reply-To: <54ae0d83-d777-4357-8e87-dfc3a5c7b835@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 15 Sep 2026 08:33:50 -0700
X-Gm-Features: AcwNN1UtZ4NVKEtG0gDNaQN9gNuUkQxhk8G8OfUhBdsUri_jipzZr0yInGwVu2Y
Message-ID: <CABdmKX1ky3Jfr7B-Oqaz17aLJwo1SSh1huZ05NG7D44SMF=9fw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: system_heap: add a 2MB allocation order for
 IOMMU superpages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, sumit.semwal@linaro.org, phasta@kernel.org, 
	benjamin.gaignard@collabora.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:41=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/14/26 23:22, Davidlohr Bueso wrote:
> > With 4KB base pages, the system heap allocates buffers in 1MB, 64KB
> > and 4KB chunks. The conventional Intel VT-d second-stage and AMD-Vi v2
> > page-table formats, and Arm SMMU's 64-bit long-descriptor format with
> > a 4KB translation granule, define 4KB pages and 2MB/1GB large-page
> > mappings, but no 1MB leaf. A 1MB chunk therefore requires 256 4KB leaf
> > entries unless it can be combined with adjacent chunks into a
> > suitably aligned larger mapping.
>
> Yes, it was an intentional design choice to *NOT* optimize for AMD nor In=
tels IOMMU here.
>
> > Adding a 2MB allocation order provides naturally aligned, physically
> > contiguous chunks matching the 2MB leaf size, without relying on this
> > being accidental for separate smaller allocations. The new cost
> > is one failed order-9 attempt (keeping current large allocation semanti=
cs)
> > per buffer when 2MB pages are exhausted.
>
> We have plenty of experience with this with TTM and the overhead this res=
ults in is usually not acceptable.

Overhead from compaction and reclaim to get 2M pages? That is disabled
for non-0 page orders here in HIGH_ORDER_GFP.

> > Two benchmarks, measured on an AMD EPYC 7313P.
>
> Why in the world are you testing the system heap on an AMD EPYC system?
>
> AMD clearly doesn't recommend using the system heap on those boxes for RO=
Cm, so I'm really wondering what combination of HW you have here?
>
> Regards,
> Christian.
>
> >
> > (i) Mapping, into an idle NVMe function's translated DMA-FQ domain,
> > measuring map/unmap: with the v1 page table restricted to 4K/2M/1G
> > (amd_iommu=3Dv2_pgsizes_only), a 1GB buffer goes from 1024 1MB chunks,
> > only one of whose 2MB windows was superpage-mappable in that run, to
> > 512 2MB chunks with all 512 mappable. dma_buf_map_attachment() costs
> > decrease by ~16x on average with ~32x for the worst cases. Unmapping
> > that buffer drops from ~500 us to 1.25 us.
> >
> > (ii) A microbench that measures the cost of DMA_HEAP_IOCTL_ALLOC+close
> > across various thread counts decreases by factors of ~3-7x alleviating
> > allocator's zone->lock contention by being PMD order and therefore is
> > pcpu list eligible. Once the buffer size is large enough then the cost
> > of the zeroing takes over.
> >
> > Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index c8959eadc71d..621cf238ef97 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -55,14 +55,15 @@ struct dma_heap_attachment {
> >  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> >                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> >                                 | __GFP_COMP)
> > -static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_OR=
DER_GFP};
> > +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP,
> > +                             HIGH_ORDER_GFP, LOW_ORDER_GFP};
> >  /*
> > - * The selection of the orders used for allocation (1MB, 64K, 4K) is d=
esigned
> > - * to match with the sizes often found in IOMMUs. Using order 4 pages =
instead
> > - * of order 0 pages can significantly improve the performance of many =
IOMMUs
> > - * by reducing TLB pressure and time spent updating page tables.
> > + * The selection of the orders used for allocation (2MB, 1MB, 64K, 4K)=
 is
> > + * designed to match with the sizes often found in IOMMUs. Using large=
r order
> > + * pages instead of order 0 pages can significantly improve the perfor=
mance of
> > + * many IOMMUs by reducing TLB pressure and time spent updating page t=
ables.
> >   */
> > -static const unsigned int orders[] =3D {8, 4, 0};
> > +static const unsigned int orders[] =3D {9, 8, 4, 0};
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >
> >  static int system_heap_set_page_decrypted(struct page *page)
> > --
> > 2.39.5
> >
>
