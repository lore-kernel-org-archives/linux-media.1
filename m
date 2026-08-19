Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9E437461
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131088; cv=none; b=aQjNpNdspqjZ6C3wz01Cg6Jr0+nvCK6KKAjtvFpJQkiGfnFHpXkKjtQ41rP1CKAfJfZhmAQL8F73kpdSgukK6IOIr04GNMiUbYHy0yV96BfLyuNEYZJEBA5HbgB5l/6v9gmsIsDddE2DlHG0tpkTibzgcAvEe1OIUHuN/DkHUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131088; c=relaxed/simple;
	bh=Ru7B0mPr2JsnfJ+ro+GK4Tqh+Gd4Cb7qZT9U2T70g3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfTmuhrKKFMR5CfJYG7TZ1Iy8Y9uSr5hSaU+FWIONe7VcITfTCqu5znfcgEIx5GW2G3jkJWDb9MFRVQDVIZlKiM/tSiXMUVp8A33Q3puXxrUbKpfeWH2BcSsMwjOZOhnyZ3dSOp5vGek46aiS6ozuZJ/D+ianoDd/pUdsbiQA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=olfnIeXu; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="olfnIeXu"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so1422990a12.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787131070; x=1787735870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CRcM97D6GL/t9v6yCpx9B64ow1SHjswDGV+6IEYsHvE=;
        b=olfnIeXubneBVehC8oEcniNyjVfqck66+5ANveZgk89uf0HUJOZ8ucL4FMQpVeBXsn
         liOSC61IMRDMUWE1FXGhLqmgbPl9EUaclowaJEsYz4NUpE7BuwNr5Zl956+YjUiMEXwH
         dnvmphIuQ9NzDeI0ehBAE8+am2skfEir/eSfLmRQ6OhRMPeYHbTVOlGMGE0Tm7fpxgCl
         n9pJwFNHg3Hdk18sLFJp7RjY4F4YnUXiom++L0c74CaWXzxUvxxNN6pbMORqWLYWU3Sh
         xLDXT92PJr2buim4Yh766eLuZ6mRfDwpst8wGvG/5qaxF+mnh3JzT42EtEYAsRzeR8HD
         2+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131070; x=1787735870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRcM97D6GL/t9v6yCpx9B64ow1SHjswDGV+6IEYsHvE=;
        b=nyAj7VnKm7oAw8rYK6GGZJdmZ4txIeQOTjvKhp+kvRD5IYlktTRuvb8sRdbIa3/fBE
         wKvVD/9TGHdqSSclwFbTTtUAzB6RPy8i8ULEC3L2R08fLrHvmv/6/IOBGn27jv8OLjVE
         byd3VvBPYUA7Cjh8JKIp+f9fJBaZBYtNfUH0rYMTw0HS0g1BLoOGDZVQfuESMI/5eL2C
         kaNIowxxvP5MbEgyIMJar+HQU32BwZ4goJ0Cu271V6RufbT4b4J7E1QEtJJtQNVweCub
         0UYafYKPsf2hsDaDLcpCXKHU7M58XOnwLrRUUBblgWmtB5t601hI3mjSEZFm8wX1cdow
         vH4w==
X-Forwarded-Encrypted: i=1; AHgh+RpAi24hRpJvcT7MWxEOGFZSy1bxqhM8BR3dy46CnYrlypPn0ZhtHvxA/PkoP/dj+ca+6Z79iZgWfYQ9pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+Weh1IItk0xMjI23HLnnnOE0qLf82A357fLlLFcuRA8hv5/u
	K6mq2RiGaERbdXDLo1cW1/yqQyMAcQFZ11esZwF0fjteC2SoEk1DrUoNVH8EvyCYkYpRq+x3Yeq
	g1PHaUq5qSUI=
X-Gm-Gg: AR+sD1077AMHW2d7jK+0s18iHkc6mGOTMIkiGVk4Y3NHabXYQ1ZpG00p6CxChRVAuK+
	kHWCutN3NzXMyX9o6s/79kkKJiYVZLBq/lnW9w+oS6tLxScacjWlxMTFdvWT6lHhKtU3Q+7yT9m
	LasUuAeni3w4zeqMucjS51GagWBBpIR0kzuJkNn41tg2xiODvt2fY6QYcj87fx2BcmlZyDkn/p/
	esJmzdzzkHKIB8Ss8cQ5ftUvRF+kCZe024HezsrAuZy8LMOlxqy1JLEZtI7c9g2Yl2fsCSPWrPO
	fkLKxDfqwuhYdXBnY+1irhE/BIHt0QitlVHsXA2qJYUJBT2L1xoXs8haoAb4AJ8/zbGkOTZojG7
	QNA9Rq2FYYKu6b/UUn3otDqxhfc5GgzF/yKesv38f/3w+56iu98F7evSTItUtiqBjHHOSQCMY9B
	7OVJVWueKUy1qRb3MyEe5WrMsls+NO61a35pSWAZMwvinuRKAfAhvwaFIHwJcAXmRXzna+fM+39
	nkKyhiMdpLmd35MSjsNLdg9AY3tZwR4SL8wuQy6j4M=
X-Received: by 2002:a05:600c:528d:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499aa17d6a0mr59734605e9.6.1787130615318;
        Wed, 19 Aug 2026 02:10:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441c78sm4582317f8f.2.2026.08.19.02.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:10:13 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:10:09 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Chun Ng <chunn@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org,
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
	linux-trace-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>, pavan.kondeti@oss.qualcomm.com
Subject: Re: [PATCH v4 07/10] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <aoVy8dj8f3ll5-M4@google.com>
References: <20260807-tegra-vpr-v4-0-5510d16af89e@nvidia.com>
 <20260807-tegra-vpr-v4-7-5510d16af89e@nvidia.com>
 <an4MEI7lkc2p3nKI@google.com>
 <an8K2gb1pIqbDj6-@orome>
 <aoNDRTKCUkzd2n5G@google.com>
 <aoQ1lhZojzsSkWHQ@orome>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoQ1lhZojzsSkWHQ@orome>

On Tue, Aug 18, 2026 at 12:48:09PM +0200, Thierry Reding wrote:
> On Mon, Aug 17, 2026 at 06:22:13PM +0100, Vincent Donnefort wrote:
> > On Fri, Aug 14, 2026 at 02:56:05PM +0200, Thierry Reding wrote:
> > > On Thu, Aug 13, 2026 at 07:25:20PM +0100, Vincent Donnefort wrote:
> > > > On Fri, Aug 07, 2026 at 05:54:27PM +0200, Thierry Reding wrote:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > > 
> > > > > NVIDIA Tegra SoCs commonly define a Video-Protection-Region, which is a
> > > > > region of memory dedicated to content-protected video decode and
> > > > > playback. This memory cannot be accessed by the CPU and only certain
> > > > > hardware devices have access to it.
> > > > > 
> > > > > Expose the VPR as a DMA heap so that applications and drivers can
> > > > > allocate buffers from this region for use-cases that require this kind
> > > > > of protected memory.
> > > > > 
> > > > > VPR has a few very critical peculiarities. First, it must be a single
> > > > > contiguous region of memory (there is a single pair of registers that
> > > > > set the base address and size of the region), which is configured by
> > > > > calling back into the secure monitor. The memory region also needs to
> > > > > quite large for some use-cases because it needs to fit multiple video
> > > > > frames (8K video should be supported), so VPR sizes of ~2 GiB are
> > > > > expected. However, some devices cannot afford to reserve this amount
> > > > > of memory for a particular use-case, and therefore the VPR must be
> > > > > resizable.
> > > > > 
> > > > > Unfortunately, resizing the VPR is slightly tricky because the GPU found
> > > > > on Tegra SoCs must be in reset during the VPR resize operation. This is
> > > > > currently implemented by freezing all userspace processes and calling
> > > > > invoking the GPU's freeze() implementation, resizing and the thawing the
> > > > > GPU and userspace processes. This is quite heavy-handed, so eventually
> > > > > it might be better to implement thawing/freezing in the GPU driver in
> > > > > such a way that they block accesses to the GPU so that the VPR resize
> > > > > operation can happen without suspending all userspace.
> > > > > 
> > > > > In order to balance the memory usage versus the amount of resizing that
> > > > > needs to happen, the VPR is divided into multiple chunks. Each chunk is
> > > > > implemented as a CMA area that is completely allocated on first use to
> > > > > guarantee the contiguity of the VPR. Once all buffers from a chunk have
> > > > > been freed, the CMA area is deallocated and the memory returned to the
> > > > > system.
> > > > 
> > > > Hi,
> > > > 
> > > > I believe we (the Android team) are trying to solve similar issue to yours: Arm
> > > > CPUs can still speculatively read memory after it has been transitioned to the
> > > > Secure state, as long as they retain a cacheable mapping to it.
> > > > 
> > > > As modifying the direct mapping is difficult, the workaround ended up in the
> > > > hypervisor which unmaps the pages from the host stage-2 on intercepted FF-A Lend
> > > > invocations.
> > > > 
> > > > If convenient, this is nonetheless the wrong place to do it. Scattering the host
> > > > stage-2 is really terrible for performance and we would like to move it where it
> > > > should be, directly into the kernel...
> > > > 
> > > > This is what I thought was the attempt in v3, but I am now a bit confused
> > > > because I see you are using set_direct_map_invalid_noflush()
> > > > set_direct_map_default_noflush(), but I am not sure that works if rodata=full is
> > > > not set? So does the memory for the NVIDIA IP still need to be unmapped?
> > > 
> > > Yeah, this currently relies on the circumstances being such that
> > > can_set_direct_map() returns true, and in the case where we want to use
> > > the resizable VPR functionality, we're going to have page-granular
> > > mappings anyway.
> > > 
> > > > If so, how about having an option where the CMA allocation is backed by a direct
> > > > map with the same page granularity, or at least a smaller and aligned granule?
> > > > 
> > > > With that, we know that for whatever CMA allocation we do, we can safely unmap
> > > > from the direct map without risking splitting blocks. On CMA free, we can safely
> > > > remap into the direct map as I do not believe we coalesce yet.
> > > 
> > > This sounds intriguing. For VPR we could possibly make the size a
> > > multiple of the memblock size (or whatever might be appropriate). If we
> > > can create a page-granular linear mapping specifically for that region,
> > > that'd be ideal. I don't know if the linear mapping can be subdivided in
> > > this fashion, though.
> > 
> > Actually I don't think modifying the memblock is necessary at all!
> > 
> > Here's what I have so far:
> > 
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index d4de88770ecf..a9f81413b70d 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/fs.h>
> >  #include <linux/io.h>
> >  #include <linux/mm.h>
> > +#include <linux/of_fdt.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/set_memory.h>
> >  #include <linux/kfence.h>
> > @@ -1138,6 +1139,27 @@ static inline void arm64_kfence_map_pool(void) { }
> >  
> >  #endif /* CONFIG_KFENCE */
> >  
> > +#define MAX_FORCE_PTE_REGIONS 64 /* Greater or equal to MAX_RESERVED_REGIONS */
> > +
> > +static struct {
> > +       phys_addr_t start;
> > +       phys_addr_t end;
> > +} force_pte_regions[MAX_FORCE_PTE_REGIONS] __initdata;
> > +
> > +void __init early_init_dt_force_pte_arch(phys_addr_t start, phys_addr_t end)
> > +{
> > +       static int count;
> > +
> > +       if (force_pte_mapping())
> > +               return;
> > +
> > +       if (count >= MAX_FORCE_PTE_REGIONS)
> > +               return;
> > +
> > +       force_pte_regions[count].start = start;
> > +       force_pte_regions[count++].end = end;
> > +}
> > +
> >  static void __init map_mem(void)
> >  {
> >         static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
> > @@ -1186,6 +1208,15 @@ static void __init map_mem(void)
> >         __map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),
> >                        flags);
> >  
> > +       for (i = 0; i < ARRAY_SIZE(force_pte_regions); i++) {
> > +               if (!force_pte_regions[i].end)
> > +                       break;
> > +
> > +               __map_memblock(force_pte_regions[i].start, force_pte_regions[i].end,
> > +                              pgprot_tagged(PAGE_KERNEL),
> > +                              flags | NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
> > +       }
> 
> Interesting. I had been thinking more along the lines of adding this
> directly into memblock using a new entry in enum memblock_flags. None of
> the existing ones seem to do what we need here, though some are closely
> related. MEMBLOCK_SECURE or MEMBLOCK_PROTECTED are quite specific and
> don't necessarily mean that we need the mapping to be page-granular, so
> MEMBLOCK_PAGE_GRANULAR is perhaps clearer.

I thought it would be interesting to not have to modify memblock since it is
used for all architectures, while the DT is at least slightly less widespread.

Also, cma_init_reserved_mem() could use an order 9. In that case PTE-level isn't
necessary and we could just use PMD-level. Extending that support would be more
cumbersome with a memblock flag than with a callback.

rmem_cma_setup() hardcoding an order 0, perhaps this isn't really a problem at
the moment?

But yeah, the alternative is to create a "memblock_mark_forcepte" (it seems
memblock_setclr_flag does split memblocks) and let of_reserved_mem call that
function. Finally the arm64 mmu code can simply check for the flag before
calling __map_memblock. Perhaps it isn't that bad in the end?

>
> Adding this to memblock has the advantage of not needing that fixed-size
> force_pte_regions side-channel, but obviously it means that we can only
> operate at memblock size granularity. With the above proposal, what
> happens if the for_each_mem_range() below covers a region that you've
> already __map_memblock()'ed above?

On the following map, the walker would just see the existing mapping (at
PTE-level) and will not try to install a block. This is similar to what is done
for the [_text, __init_begin) region.

I have verified it with ptdump.

> 
> > +
> >         /* map all the memory banks */
> >         for_each_mem_range(i, &start, &end) {
> >                 /*
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> > index 42e3e2d8a2b8..445f204f01e4 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -136,6 +136,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
> >         return memblock_reserve(base, size);
> >  }
> >  
> > +void __weak early_init_dt_force_pte_arch(phys_addr_t start, phys_addr_t end) { }
> > +
> >  /*
> >   * __reserved_mem_reserve_reg() - reserve memory described in the
> >   * first entry in 'reg' property
> > @@ -168,6 +170,9 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
> >         size = s;
> >  
> >         if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
> > +               if (of_get_flat_dt_prop(node, "force-pte", NULL))
> > +                       early_init_dt_force_pte_arch(base, base + size);
> > +
> >                 fdt_fixup_reserved_mem_node(node, base, size);
> >                 pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
> >                          uname, &base, (unsigned long)(size / SZ_1M));
> > @@ -517,6 +522,9 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
> >                 return -ENOMEM;
> >         }
> >  
> > +       if (of_get_flat_dt_prop(node, "force-pte", NULL))
> > +               early_init_dt_force_pte_arch(base, base + size);
> > +
> >         fdt_fixup_reserved_mem_node(node, base, size);
> >         fdt_init_reserved_mem_node(node, uname, base, size);
> > diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> > index 51dadbaa3d63..6c73c76dee1b 100644
> > --- a/include/linux/of_fdt.h
> > +++ b/include/linux/of_fdt.h
> > @@ -74,6 +74,7 @@ extern void early_init_dt_check_for_usable_mem_range(void);
> >  extern int early_init_dt_scan_chosen_stdout(void);
> >  extern void early_init_fdt_scan_reserved_mem(void);
> >  extern void early_init_fdt_reserve_self(void);
> > +extern void early_init_dt_force_pte_arch(phys_addr_t start, phys_addr_t end);
> >  extern void early_init_dt_add_memory_arch(u64 base, u64 size);
> >  extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
> >  
> > > 
> > > > (This alignment is not necessary for upcoming systems with BBML3)
> > > > 
> > > > However, to implement this, we'd need to split memblocks and I believe the only
> > > > way at the moment is temporarily mark it as "nomap" which didn't seem very
> > > > popular in the comments on v3.
> > > 
> > > Could this be simplified if this type of allocation is always memblock
> > > aligned?
> > > 
> > > Looking at map_mem(), it seems like we could add some sort of special-
> > > casing in the for_each_mem_range() block to check if the memory is VPR
> > > (or generic, page-granular carveout, or whatever we want to call it) and
> > > set NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS in that case.
> > > 
> > > If that works, set_direct_map_*() could be enhanced to detect such cases
> > > and always work. Or perhaps a more specific API could be introduced.
> > > 
> > > Thierry
> > 
> > for set_direct_map() I think we could extend it to check if it is mapped at the
> > PTE-level and if it is we can proceed?
> > 
> > I am currently looking at extending CMA with an option "unmap-on-alloc;" that
> > would only be available if CONFIG_ARCH_HAS_SET_DIRECT_MAP, or
> > cma_set_unmap_on_alloc, or if "force-pte;" is set. 
> 
> I suppose we could add something like this into the new cma_alloc_at()
> function that I proposed in v5. The use-case for that is already quite
> specific (i.e. it essentially means the CMA is externally managed) and
> that might be what similar drivers may want to do. I don't know if it
> would be more generally applicable to regular cma_alloc() users, too.
> 
> Thierry

I had in mind to extend "shared-dma-pool" to handle
set_direct_map_invalid_noflush()/set_direct_map_default_noflush() based on an
option. But perhaps it is better to create another separate driver. And VPR
needing a specific dma-heap driver anyway, it could call the direct-map
functions there too without relying on CMA to do anything?

-- 
Vincent
