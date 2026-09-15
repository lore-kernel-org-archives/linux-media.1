Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C44B1465
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493205; cv=pass; b=NdnUdtfxULGJyE01Vq1SfH1CXCxTu/s7RGA3bJfQfZuoAnVXG6G+K5dzkWKYMFp8/fcBvT20uEadjGdcxBnXe0p/p82CG+gOI8PByVhiQUP07sISm08vN3mb+o33Mne9vX1zdFfeY7BDfxf9pRANHp2cIsAN1Z2uA4DYbefK0u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493205; c=relaxed/simple;
	bh=XyRzHt6X4sN41gTWH0wrM7q3zYQOcR1GRF9O/XG+8yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3oN416SKoEUiGbQReCxtXZQ29EAX9EKg4gmwoQtpPSwxYfDiZw3QghgC/Ay49USzvNmmWFrE/mQk0K+LJji1IiCrlIclTadgAy1fBOPW8RGneU4g496UZJGOlAlPCh4Dpk2juU5EoiSuEbxD4wFaL6HX4VFdr9KJEm79OeZjM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DMxXf6oj; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DMxXf6oj"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d5fc2cd8so8441cf.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789493202; cv=none;
        d=google.com; s=arc-20260327;
        b=gqXZFx7fTXIY6lRZor/Vcv6fKSGksBfWL/6IShbNacJ7cnqCIpn12cSzIK+xNBultC
         +pQ8W9Ne/ACv6C5PX4zbEk4P9djETV+S/VCXHBGs9zID4aESipC2wamPc9VFRD8pefP/
         FufbW2rKezWoyQchlBebbivcceFtFokE1v9Md+GYe2/F17eVjbXWyqTghChMDomRsqYI
         R6Gz9HaPTlhJTp5nzMrPnakjONXYRj7VWd9sHPKgjTobVeoyV+tWaOc3t2uUWTGK7ucZ
         51fodVFJpIN0Erggq45C7QR7DnIGg0gTbEKnHUg+R5Wi7MnTflLPvA9G1LpY1rHn26Ua
         RbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLaqbeOPsXClMTG3juLppJfmRTdwa3EBaFJjE6KcofM=;
        fh=Y715mCuPY8DJ+voo2OYlxOx1ZicM5rKzESbfzUdVx24=;
        b=bsRfZUVEvXqji2pJgOKQ9rekBG+3c8OgAnvP0a1mn19IlDCfuAolSYPmVODtdi/e6u
         mPdbZwVYHEkVpEICLCPCQZlpXic+bDXMm7rEWvSME/AC4w2/0OKqOIrWlwZoMeS6dk8+
         1YLM2R7pMFmcNdOEZDXN3ifB0l5pTXNcRjT6XnVfYU5F1MfQ6ezzuu+KIVfGJI7tjH43
         E3rSPqQnuTLSucbvnJVVZYnQQpoimnc/SyM236cFG2YEiXkBBvm6YC46DfA0ehn/i2E4
         w9cwS9AdarRNKqCCi+BXn8iqSFBtMbnk4j/FNAoXYbmnVVMvO/JXnAlEm2O9KJH1soTN
         hp/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789493202; x=1790098002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLaqbeOPsXClMTG3juLppJfmRTdwa3EBaFJjE6KcofM=;
        b=DMxXf6oj8sLqdupCWx+NXbT5/Ny39o0X9UtBCy8B66UX9N3dgbsxqdhu9hNcf/2udV
         4aIzB+959XBS+C4pafUQzxKGgYmEzuH2DMKYGe7DgBNkqoZ3Fbcl/YryUnmKoaML44Q9
         ordAMgsrv9yZWJ8vdTtIdgFpFzlnU6YSPe8q2YobNAV3jxd/C+AOX/rHFs0JMjOXIUb8
         yK27rbBw3PzgIdUi8JNZtxSLc1rl7G6MH+FJPW/l0FUZlf446/bp5oc6mXIzq+oT59Vy
         5h3/vBhsLh0rDSqhATQdmkmCkzd1aAbcrpVJrUVe6zDIuTTe9TOG1bvWyq2QmmSBYQ35
         r2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493202; x=1790098002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLaqbeOPsXClMTG3juLppJfmRTdwa3EBaFJjE6KcofM=;
        b=mzQoY0cSJk2XXmEDXkBq/1KrMP5OTa45PuAydKYlq7gaTJy4ZUL34Xxc+buThU0O5L
         85sVq+gkS96fDOkUvevLayEOCHKBTIkuFhAQDuiNwQxMv4t2Tte7oiGbap2LQmfMUYYk
         nXOlItkCo43acg0giPZTp2lX7evi0keCrZpYEn1zehQQZPqmKQBId4dTTBeRSIG6ZIlf
         OS4aVGO4dr8uGRvw2O85UGXOpUtvV7C7RS5nnZ7T4oX/QlB4qUdjFQD0gKr7rrBC2LR7
         NP3fO5ljl2Wy+XaXGLKROrSMlZ2ulHzLBhOFXVLG64B7QF7nT+1qpUfkOhAeF6xxS3TX
         2wVg==
X-Forwarded-Encrypted: i=1; AKwUvByys+vHVZFKd5h+4K1in74uBR/ObO8O+tXMLbfq2o423HIiSqkoOjhMz9UhoKfZMkvXHB5EsLtvBJENLQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nCeXKSpFFqUzjSY4AOMEE2+OX8nmn1lO6wklMTNz7DY2v9y1m8
	tqnfuBYNFtu2nwy5qBbv6zeZ0sPV1FziYFHom3QkLQXwfueyibFspj3eyrQdjnZWiYB+TNMWbb1
	seJc51T9JwR8HLg7Zm484YS2HuF8fxLj3mudUDt5q
X-Gm-Gg: AYBFou3TYVj2wI3WWN+CJ8V6UNoa5ciIdMsMFej6H5djowG7YT8RrWK/ThGs9YZX2cY
	xfsxDB4eF1wKEAcW7YrDU0Suh3CLL9qFugyU9iLLavxZP68zoz0SGSjmGAkKgX10I/klO6X/4UH
	txpfD5wd+pcmMaDyfo89kPptDhq+Lr75R0wshI1lPPOa42Dyd4NZluFUIVug63p8NCHneQwtqFQ
	4Xyg/vz1jAfLYOllXvMgx+xDX02wKQjWGvGdu1AV5/N8AcEwssRQ2uQrUWmLx7bbtHfPbYkSm8b
	dK32LE9736wQyYn2k+CkqpHJUxV3TYsFj3wnvXOVFrQu6MH2MircRqoSBmflgN196JtWDQV4IYz
	fWAlgGCqV+ro+ovzhmM8bG8b/WEulLXo21w4rufD+NA==
X-Received: by 2002:a05:622a:5c9:b0:530:4381:e745 with SMTP id
 d75a77b69052e-53250834fe9mr94401cf.10.1789493201557; Tue, 15 Sep 2026
 10:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914212258.2657788-1-dave@stgolabs.net> <20260914212258.2657788-2-dave@stgolabs.net>
 <54ae0d83-d777-4357-8e87-dfc3a5c7b835@amd.com> <CABdmKX1ky3Jfr7B-Oqaz17aLJwo1SSh1huZ05NG7D44SMF=9fw@mail.gmail.com>
 <871b6fc6-e126-429f-881c-9cc517ee8dcc@amd.com> <CABdmKX1g=wcLHOFkRN6DLPTABrnn2uWmgCKpCtixhiV_b+9J1g@mail.gmail.com>
In-Reply-To: <CABdmKX1g=wcLHOFkRN6DLPTABrnn2uWmgCKpCtixhiV_b+9J1g@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 15 Sep 2026 10:26:27 -0700
X-Gm-Features: AcwNN1XgAXQrCiy3YZ1p64q4FHCH2J-I58ecoKjfCu7iBX3NTW0TOAZWTeHuVc4
Message-ID: <CABdmKX2GU0Eby=SEeALzeEp5ragEjU3Fw468Jv1yykD1Zdrgag@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: system_heap: add a 2MB allocation order for
 IOMMU superpages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, sumit.semwal@linaro.org, phasta@kernel.org, 
	benjamin.gaignard@collabora.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:26=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Tue, Sep 15, 2026 at 8:44=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > On 9/15/26 17:33, T.J. Mercier wrote:
> > > On Tue, Sep 15, 2026 at 1:41=E2=80=AFAM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > >>
> > >> On 9/14/26 23:22, Davidlohr Bueso wrote:
> > >>> With 4KB base pages, the system heap allocates buffers in 1MB, 64KB
> > >>> and 4KB chunks. The conventional Intel VT-d second-stage and AMD-Vi=
 v2
> > >>> page-table formats, and Arm SMMU's 64-bit long-descriptor format wi=
th
> > >>> a 4KB translation granule, define 4KB pages and 2MB/1GB large-page
> > >>> mappings, but no 1MB leaf. A 1MB chunk therefore requires 256 4KB l=
eaf
> > >>> entries unless it can be combined with adjacent chunks into a
> > >>> suitably aligned larger mapping.
> > >>
> > >> Yes, it was an intentional design choice to *NOT* optimize for AMD n=
or Intels IOMMU here.
> > >>
> > >>> Adding a 2MB allocation order provides naturally aligned, physicall=
y
> > >>> contiguous chunks matching the 2MB leaf size, without relying on th=
is
> > >>> being accidental for separate smaller allocations. The new cost
> > >>> is one failed order-9 attempt (keeping current large allocation sem=
antics)
> > >>> per buffer when 2MB pages are exhausted.
> > >>
> > >> We have plenty of experience with this with TTM and the overhead thi=
s results in is usually not acceptable.
> > >
> > > Overhead from compaction and reclaim to get 2M pages? That is disable=
d
> > > for non-0 page orders here in HIGH_ORDER_GFP.
> >
> > Ah! Thanks for pointing that out, I misread the code that __GFP_RECLAIM=
 is ORed into the mask.
> >
> > But the question is still why? Without reclaim that is pretty much an u=
seless feature on most x86 boxes.
>
> Even on arm64 phones free 2M pages aren't likely to be available for
> very long after boot, but lately we have been doing more proactive
> reclaim triggered by userspace before launching workflows that desire
> large dma-buf allocations (and also at other times during application
> lifecycle in general). That somewhat increases the likelihood that
> high order pages will be available. I agree there's no guarantee we'll
> get any, but without __GFP_RECLAIM the attempt is pretty cheap and the
> payoff can be pretty benficial which Davidlohr's allocation and
> mapping measurements demonstrate.

Oh I forgot to add that this behavior is similar to how slab
allocations are done for slabs requiring more than an order 0 page per
slab. A large optimal order is attempted first with ~__GFP_RECLAIM,
but if that fails a fallback to a smaller min order is done. When the
optimal order allocation attempt fails, the cost is just taking the
zone lock for a quick peek at the free lists.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/=
slub.c?h=3Dv7.2#n3373

> > Regards,
> > Christian.
> >
> > >
> > >>> Two benchmarks, measured on an AMD EPYC 7313P.
> > >>
> > >> Why in the world are you testing the system heap on an AMD EPYC syst=
em?
> > >>
> > >> AMD clearly doesn't recommend using the system heap on those boxes f=
or ROCm, so I'm really wondering what combination of HW you have here?
> > >>
> > >> Regards,
> > >> Christian.
> > >>
> > >>>
> > >>> (i) Mapping, into an idle NVMe function's translated DMA-FQ domain,
> > >>> measuring map/unmap: with the v1 page table restricted to 4K/2M/1G
> > >>> (amd_iommu=3Dv2_pgsizes_only), a 1GB buffer goes from 1024 1MB chun=
ks,
> > >>> only one of whose 2MB windows was superpage-mappable in that run, t=
o
> > >>> 512 2MB chunks with all 512 mappable. dma_buf_map_attachment() cost=
s
> > >>> decrease by ~16x on average with ~32x for the worst cases. Unmappin=
g
> > >>> that buffer drops from ~500 us to 1.25 us.
> > >>>
> > >>> (ii) A microbench that measures the cost of DMA_HEAP_IOCTL_ALLOC+cl=
ose
> > >>> across various thread counts decreases by factors of ~3-7x alleviat=
ing
> > >>> allocator's zone->lock contention by being PMD order and therefore =
is
> > >>> pcpu list eligible. Once the buffer size is large enough then the c=
ost
> > >>> of the zeroing takes over.
> > >>>
> > >>> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> > >>> ---
> > >>>  drivers/dma-buf/heaps/system_heap.c | 13 +++++++------
> > >>>  1 file changed, 7 insertions(+), 6 deletions(-)
> > >>>
> > >>> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/=
heaps/system_heap.c
> > >>> index c8959eadc71d..621cf238ef97 100644
> > >>> --- a/drivers/dma-buf/heaps/system_heap.c
> > >>> +++ b/drivers/dma-buf/heaps/system_heap.c
> > >>> @@ -55,14 +55,15 @@ struct dma_heap_attachment {
> > >>>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWAR=
N \
> > >>>                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) =
\
> > >>>                                 | __GFP_COMP)
> > >>> -static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LO=
W_ORDER_GFP};
> > >>> +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP,
> > >>> +                             HIGH_ORDER_GFP, LOW_ORDER_GFP};
> > >>>  /*
> > >>> - * The selection of the orders used for allocation (1MB, 64K, 4K) =
is designed
> > >>> - * to match with the sizes often found in IOMMUs. Using order 4 pa=
ges instead
> > >>> - * of order 0 pages can significantly improve the performance of m=
any IOMMUs
> > >>> - * by reducing TLB pressure and time spent updating page tables.
> > >>> + * The selection of the orders used for allocation (2MB, 1MB, 64K,=
 4K) is
> > >>> + * designed to match with the sizes often found in IOMMUs. Using l=
arger order
> > >>> + * pages instead of order 0 pages can significantly improve the pe=
rformance of
> > >>> + * many IOMMUs by reducing TLB pressure and time spent updating pa=
ge tables.
> > >>>   */
> > >>> -static const unsigned int orders[] =3D {8, 4, 0};
> > >>> +static const unsigned int orders[] =3D {9, 8, 4, 0};
> > >>>  #define NUM_ORDERS ARRAY_SIZE(orders)
> > >>>
> > >>>  static int system_heap_set_page_decrypted(struct page *page)
> > >>> --
> > >>> 2.39.5
> > >>>
> > >>
> >
