Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1B13D3D02
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489618; cv=pass; b=a9gyMiI4Jyv61P5KepP1DKP8liM26lsKtWowpboSQYhhfz2zd4O21GwIza3Ygeqj2jMgB1xtFuhkRN8hFiDi9WRLBrjfriPfcZmYRnoCFqPZC6Byr586EJ8jBX3Gpsq2tvdRiMDMeZSG19Y27pRd0FNnVsZVjqbry8mWS4GcVTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489618; c=relaxed/simple;
	bh=5OP+R3pM76gS/l5NYt8QUkiNU62yG9a3CywRT5+GqOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZv7cB9F3Ja81u+9YdANPagecUBX7ZTkX+0ftJsgr3h6C2p6O3OMeVhTXtb+MkuE7RUwR48IlOP67n02Go/qb2+Juy3WRlB2CwEYcgn1RsfIDiEYMMTuntmV3uX0MokiAoYOO6fzPY92UQcb6flHy+rEvaiLc3PI/B6mdoTe28w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uuZG1tdt; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uuZG1tdt"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so85721cf.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789489615; cv=none;
        d=google.com; s=arc-20260327;
        b=og5CTx1yJut42gh751n7dqRUeS+O2NJLQmOg/Rl4E/e0pdVkhFvx/s7MFi8vFCGE1L
         RS2y5bcxThMeYKrpeqC3J4/Pgat3ceHOUA7TdnHsqkIoPjHPPmgJyKpXidaxveed3/1m
         GI5jKtO74E8N+Ba/GGXbAtXbxuFRpH5+vCJQ/HkzKkVO7oRZ+N0VHJSKzZWNTvnoSgPH
         fpVePEHz5ePpRcUA9yUYXlQZI+l+U6lIyQaopHyu7XOv3/xkTla15/goLtqpZ3I3V7DB
         DCtftirSM9fX6TgyduteIKxQIdHGsv71qrfqt788sNdWALhWViEJ8Zr8mivaAAdDNIuk
         La3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yVsdbL4Nf3Bwu61qw5TPwMH34bzVbrtCOAxvi0a+fbY=;
        fh=f/Gp78qMN9x4PQkVmtGT02IKdkb6FOIrwjtFqty72HI=;
        b=EsKsIJUUyfTjVb5l1bUxeurmUz8erMr3MvOKUOuWnW83gZTl817SRUd/8sfA6utRH5
         dJqgcGMeouFeZCL/xcUdenjhr29qfI7cK94MfROCxtTQyJ6Wt+LnkhrLCRjSxR4FW3jm
         4X3wrNRfSUfnzi5nvgOP9fEJNHzZUV0C7Bixo13qNfrzSHbjVifsovXFZ9gZne8KAxZT
         bPlq3rktQTDu4glCehi/EIRk7uJ2b6XCWit3+w2IaBHC8wpnQ8eSKX+AWN4XCet6Scrg
         OC7Gyi5JiFZNhD1qCmxuX0yQ4TXtQV7Oe0993lujyhuIjHhMXyPopLQkNXgwlATILd9O
         glpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789489615; x=1790094415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVsdbL4Nf3Bwu61qw5TPwMH34bzVbrtCOAxvi0a+fbY=;
        b=uuZG1tdtb/PJRu/iUo+YrSvKYapXW0yxFykt7ip2bMN/ZWDVj5OqfOHSQNKD1P+ycr
         G0Mte6fxZFrm3rFfT0k3/f7on4R3PF+Lc7XWXqm3FQK7laz7VjJysw6bTq1zmohHhHml
         +Qh5jRfqO/PIgmeHDR01wfuT01dhDKz4flPyHHkX1SldRVuHDXhsEXoMNrvxPaxXoVYY
         dIczomOBWUslp/vy/Tj1mrkSQaipYyDem6R7iN617RwVBFUfCJnF2r5l56hT51Vj8aXh
         +8AJPCOFQiM4oFjS4kK7rdM3L1YUYUpUiOv6b0TPNw1eSOpKfFR3SKsYimZX4ALrm/zA
         AzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789489615; x=1790094415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVsdbL4Nf3Bwu61qw5TPwMH34bzVbrtCOAxvi0a+fbY=;
        b=Mmy1ZGNxSD4zTImSPf1v1ydtXs5XY8y2Mj+EpFxrQ+COf+E1vMKePnG4dITECWaWA9
         26VgypPH+eLzwqdB61XnOn+kEVKwvnWJzGjgBYomvqrrdNPbuL3AHSwtPlKwHjGhuxpV
         BK/B5cLnIGwIpFRRnJ9VpbRZkWBQT5/st3EeiUCEO/Bv9ysHVU56HhMVQuaGHbwnH05D
         hqRp9ik5pefQd/LkQszVm7Zptrkj7y5uLyn1fKqoM+LIsVQG1ysnF/plf4CHwjMKeh0i
         CJAUUaslMXmjjgphkotEaSuoag4zX1y2yH/ve4L2DQQUn4uATIiT8j6bgVW6cIThhSEK
         CdRQ==
X-Forwarded-Encrypted: i=1; AKwUvByWOEavyyiTDdYOqmUZG2NW8sIleVY9VIFrQL8whhEe+nfJNfkGYxSQqpvRWU1s5BC5H+bWPqXkgayT+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nNf50XdRwR78UimROXLX3R/mbRAWyRadVOCPcvexJ1uwu88Cr1
	JgNKHsv6SVPXv7Fu+dhUKaZYLWU+KR2TemIG17nAFmwzZdvtxjz7ggRSrmXPeSTzAVrZ72ZbIbS
	JVNYXPMAVovkHfrE7w/Dfbsg/seDJv9mXUbymzZjz
X-Gm-Gg: AYBFou2wwv6k0HuUkmLjoOMrLe3OZ4Ybq7OQDBfJwhfnuWoD/l3xQrJH2bnJthKwZMR
	HhAUtS+pgEoJUJA/W5DTPVYMHntg9xrnbe6mqBgC+iiPiu0v+mcSYVbUhmSpo0beCsBoH2c83J0
	XrltSvZNzxGHUY+zVozl6XTqLYfpQ48jk0KNEV7broACuoPvqNUidPw4pjsbGPofzp/2LKQCe5/
	gAkp4eZQlzzJHbDmqFVGy45Z/vINFCCFWnYa29KQ0LqPmEI9ocbq6nGcacvCKzbz7ktz/59K3q0
	oCJe1Vn0jqCCXQQAA4ltQGHRO+/oG6sj+IXqWcpbHg3KbYICXNDYzqI3wlDtxM6DonpGWTp51II
	2rI5DIHmCf2EFPcpT0xlFFp3gUh5FUjFoRvzcvtNrGieOKFwAwEMd
X-Received: by 2002:ac8:7e92:0:b0:530:4381:e745 with SMTP id
 d75a77b69052e-5311c75235cmr16483171cf.10.1789489614432; Tue, 15 Sep 2026
 09:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914212258.2657788-1-dave@stgolabs.net> <20260914212258.2657788-2-dave@stgolabs.net>
 <54ae0d83-d777-4357-8e87-dfc3a5c7b835@amd.com> <CABdmKX1ky3Jfr7B-Oqaz17aLJwo1SSh1huZ05NG7D44SMF=9fw@mail.gmail.com>
 <871b6fc6-e126-429f-881c-9cc517ee8dcc@amd.com>
In-Reply-To: <871b6fc6-e126-429f-881c-9cc517ee8dcc@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 15 Sep 2026 09:26:39 -0700
X-Gm-Features: AcwNN1Ublkw1G4b_G7djr5SdAcXDGM_6QerSz9j4ZUwkBsSgS1ICq54mARllNGQ
Message-ID: <CABdmKX1g=wcLHOFkRN6DLPTABrnn2uWmgCKpCtixhiV_b+9J1g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: system_heap: add a 2MB allocation order for
 IOMMU superpages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, sumit.semwal@linaro.org, phasta@kernel.org, 
	benjamin.gaignard@collabora.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 8:44=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/15/26 17:33, T.J. Mercier wrote:
> > On Tue, Sep 15, 2026 at 1:41=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 9/14/26 23:22, Davidlohr Bueso wrote:
> >>> With 4KB base pages, the system heap allocates buffers in 1MB, 64KB
> >>> and 4KB chunks. The conventional Intel VT-d second-stage and AMD-Vi v=
2
> >>> page-table formats, and Arm SMMU's 64-bit long-descriptor format with
> >>> a 4KB translation granule, define 4KB pages and 2MB/1GB large-page
> >>> mappings, but no 1MB leaf. A 1MB chunk therefore requires 256 4KB lea=
f
> >>> entries unless it can be combined with adjacent chunks into a
> >>> suitably aligned larger mapping.
> >>
> >> Yes, it was an intentional design choice to *NOT* optimize for AMD nor=
 Intels IOMMU here.
> >>
> >>> Adding a 2MB allocation order provides naturally aligned, physically
> >>> contiguous chunks matching the 2MB leaf size, without relying on this
> >>> being accidental for separate smaller allocations. The new cost
> >>> is one failed order-9 attempt (keeping current large allocation seman=
tics)
> >>> per buffer when 2MB pages are exhausted.
> >>
> >> We have plenty of experience with this with TTM and the overhead this =
results in is usually not acceptable.
> >
> > Overhead from compaction and reclaim to get 2M pages? That is disabled
> > for non-0 page orders here in HIGH_ORDER_GFP.
>
> Ah! Thanks for pointing that out, I misread the code that __GFP_RECLAIM i=
s ORed into the mask.
>
> But the question is still why? Without reclaim that is pretty much an use=
less feature on most x86 boxes.

Even on arm64 phones free 2M pages aren't likely to be available for
very long after boot, but lately we have been doing more proactive
reclaim triggered by userspace before launching workflows that desire
large dma-buf allocations (and also at other times during application
lifecycle in general). That somewhat increases the likelihood that
high order pages will be available. I agree there's no guarantee we'll
get any, but without __GFP_RECLAIM the attempt is pretty cheap and the
payoff can be pretty benficial which Davidlohr's allocation and
mapping measurements demonstrate.


> Regards,
> Christian.
>
> >
> >>> Two benchmarks, measured on an AMD EPYC 7313P.
> >>
> >> Why in the world are you testing the system heap on an AMD EPYC system=
?
> >>
> >> AMD clearly doesn't recommend using the system heap on those boxes for=
 ROCm, so I'm really wondering what combination of HW you have here?
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> (i) Mapping, into an idle NVMe function's translated DMA-FQ domain,
> >>> measuring map/unmap: with the v1 page table restricted to 4K/2M/1G
> >>> (amd_iommu=3Dv2_pgsizes_only), a 1GB buffer goes from 1024 1MB chunks=
,
> >>> only one of whose 2MB windows was superpage-mappable in that run, to
> >>> 512 2MB chunks with all 512 mappable. dma_buf_map_attachment() costs
> >>> decrease by ~16x on average with ~32x for the worst cases. Unmapping
> >>> that buffer drops from ~500 us to 1.25 us.
> >>>
> >>> (ii) A microbench that measures the cost of DMA_HEAP_IOCTL_ALLOC+clos=
e
> >>> across various thread counts decreases by factors of ~3-7x alleviatin=
g
> >>> allocator's zone->lock contention by being PMD order and therefore is
> >>> pcpu list eligible. Once the buffer size is large enough then the cos=
t
> >>> of the zeroing takes over.
> >>>
> >>> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> >>> ---
> >>>  drivers/dma-buf/heaps/system_heap.c | 13 +++++++------
> >>>  1 file changed, 7 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/he=
aps/system_heap.c
> >>> index c8959eadc71d..621cf238ef97 100644
> >>> --- a/drivers/dma-buf/heaps/system_heap.c
> >>> +++ b/drivers/dma-buf/heaps/system_heap.c
> >>> @@ -55,14 +55,15 @@ struct dma_heap_attachment {
> >>>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN =
\
> >>>                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> >>>                                 | __GFP_COMP)
> >>> -static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_=
ORDER_GFP};
> >>> +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP,
> >>> +                             HIGH_ORDER_GFP, LOW_ORDER_GFP};
> >>>  /*
> >>> - * The selection of the orders used for allocation (1MB, 64K, 4K) is=
 designed
> >>> - * to match with the sizes often found in IOMMUs. Using order 4 page=
s instead
> >>> - * of order 0 pages can significantly improve the performance of man=
y IOMMUs
> >>> - * by reducing TLB pressure and time spent updating page tables.
> >>> + * The selection of the orders used for allocation (2MB, 1MB, 64K, 4=
K) is
> >>> + * designed to match with the sizes often found in IOMMUs. Using lar=
ger order
> >>> + * pages instead of order 0 pages can significantly improve the perf=
ormance of
> >>> + * many IOMMUs by reducing TLB pressure and time spent updating page=
 tables.
> >>>   */
> >>> -static const unsigned int orders[] =3D {8, 4, 0};
> >>> +static const unsigned int orders[] =3D {9, 8, 4, 0};
> >>>  #define NUM_ORDERS ARRAY_SIZE(orders)
> >>>
> >>>  static int system_heap_set_page_decrypted(struct page *page)
> >>> --
> >>> 2.39.5
> >>>
> >>
>
