Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C3509F18
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858665; cv=none; b=vDU8y/lodLSTr/dfSbNx0ky2hDxwv3GiAxGblsU9qQm1KQDl/JRarcq5kHZ0vwzB3eBG0CjKhKpqxIZPespAm+HmXyOg7+9URA+uDkNxCjK9qGi9Z24ozVrCjRwyyek2o94OFkhDy2SqC/KJQ959wNKzOrKJv2AZfvbuzuI0eNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858665; c=relaxed/simple;
	bh=PvXsmkWYs08Fb6emr0vNeygHcdGIKgZy2QeAteTTf+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHIj40+zrMMDxS69gju333vhFmnRG/kWrCANbSTq1symgQ8GgS17vhM5TgYs5+keGKs3xdJbbqQQ3yvKRIXpzDHb9kE3fa+wVPjk7Zjn6h7wzY4gsU9dUtBmrIkkiydrN37pYH888YJp3J2vzgqc44Q1g3PN9z/zs67GmMlqKas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=od9zMfWD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="od9zMfWD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so44140805e9.2
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788858660; x=1789463460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jO5c4Bt3ZAdytp/EWde+NVli4TynjxjjAsIpB98Fp84=;
        b=od9zMfWDcF4OHQCHDnTSp+IxWBh7YcrsnqnYcySKIEcmm/ceS5PK+Ald4WsDAMQGca
         JtStGdPNa4jsxYXMI/49ZgEEFYt9UcWI8IyRBsO3AybC/oohRQiO3QSxj3hPa2MT3HmE
         jG815bbsxFI0fkVFJ6+wGUaARnLJaKxSfY22sakMY30hoTw9lRCpmnZd9jHdxlPxrk9a
         IhrRS2O3xf1/jf1vWiD+7YlOF/bR52YD3FZlFwsuobxev0U4c3rqbs0WfcZmcYym8q6G
         JzkgBiT4ugQ/LjmCIyf9fuaf6Rc5IxypahVG3fBdT3jSyDWYo8B9u4GFtEseJ8rKv28I
         CGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858660; x=1789463460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jO5c4Bt3ZAdytp/EWde+NVli4TynjxjjAsIpB98Fp84=;
        b=UNL2v1U4yhw2SzbrdVqrMf5MQLkQSvTxSB3Kyi5X/uk0b2+iWTzj4khxtWtTT9rKeg
         A9JkCyr5xdv9zwV5+cWCe2y/3b14DQk/pD7RWHjCqhU72LsRLYVAz94saTx6qtF1a6Et
         T8qWafIOUiGSGa7JusaO9Pbt0QS5oCHfc3z2Fkzqshqjkf+jbc3m9b1pJjYskrq1Wbzs
         CY5Az7uZrLgVG4DI2WyWkkw4POPvia/PLXiRZUT9/ncT/qpC1u4Spb3itG4rPbProjKW
         fQ6fbhMGcxhDpRke8b/dIL0Y8JFbMvZI5swVO7i/LjRIccioL3j+HIaTw46nxfvUdIpt
         73fA==
X-Forwarded-Encrypted: i=1; AKwUvBzWbE9EJRFRXLn0zn4CXuxutN3VSCd5rykwoMeRq6snWqqiHxQW61eVWD5M5VzZMYrUgA4gCXAe8/Jh6A==@vger.kernel.org
X-Gm-Message-State: AFuF++nxRVBPAfgZs5uzL/Ftg3sfusWUSkbIBXyDFf2J69m1ZZY+8UFx
	sojeCqfyRCf17Cf55xSM0e17LsXgRacOO65ajreQ3DqrZl28Y5rZnoDct7/Sj9wwEQ==
X-Gm-Gg: AYBFou2t2uj7YBPlX0QQjOs89mw3N/BuJTngdkocsu5U+mCahoL8rYiDY1SNkIs2KPA
	CBlwFEvkDyUs6g/37pitAB3XEUK02eyq1Yp0B+Pseuzn99enlA0wesUQqqKjnuMwl8Xu+jJAnQz
	ffO/naBukISfjVQINNHgSBXCUSCfZlQqRx4ZWT9g+AMdCmP7Zkj0HXCxEVlN2Vl/J9g/X27DAfS
	+HXXPDltcbe+bPGUUb5AUihEZR41T3D5b/B56lwiLryDkRUk5gjIC78XXuD+IIGFT4fImcw3NrJ
	6J0vjRcdy+HLWzl/ZxefbDNEUM/xD0IxIQxbZDnej/ESOeDwTMd8q8BysQygEQ2JhJmlUQViv5a
	o6Ku5W9cElEb8nMvEuyVE59Nx0RzOmby3LwOdtCorw10YzeAYWQVF02RAPE3PfwICBCXdF1O21g
	Iw2aXe5Dt33DswdIyFpJ9mFkzUCVLryF0xoCaLID2Dh7aJFstxB+eAqtmeiKLhP2kczvWcTesCv
	XIejDihXbUYIfcIRpWOl5ymaFQi/A9GZDk6YCctENE=
X-Received: by 2002:a05:600c:1549:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49cf81f47e6mr290181665e9.6.1788858659472;
        Tue, 08 Sep 2026 02:10:59 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm279081265e9.4.2026.09.08.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:10:58 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:10:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Chun Ng <chunn@nvidia.com>, Mark Rutland <mark.rutland@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org,
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
	linux-trace-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 00/12] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <ap_RH4ZDE3XI0rng@google.com>
References: <20260904-tegra-vpr-v6-0-79042cfa8de5@nvidia.com>
 <apquUWgrD9C2jWQ0@willie-the-truck>
 <ap_HzwVp-6aOKEbJ@orome>
 <ap_OFQepcu26g88u@google.com>
 <ap_QJG8EevX98SXa@orome>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_QJG8EevX98SXa@orome>

On Tue, Sep 08, 2026 at 11:08:26AM +0200, Thierry Reding wrote:
> On Tue, Sep 08, 2026 at 09:57:57AM +0100, Vincent Donnefort wrote:
> > On Tue, Sep 08, 2026 at 10:39:17AM +0200, Thierry Reding wrote:
> > > On Fri, Sep 04, 2026 at 12:41:05PM +0100, Will Deacon wrote:
> > > > Hi Thierry,
> > > > 
> > > > On Fri, Sep 04, 2026 at 12:44:51PM +0200, Thierry Reding wrote:
> > > > > This series adds support for the video protection region (VPR) used on
> > > > > Tegra SoC devices. It's a special region of memory that is protected
> > > > > from accesses by the CPU and used to store DRM protected content (both
> > > > > decrypted stream data as well as decoded video frames).
> > > > > 
> > > > > Patches 1 through 3 add DT binding documentation for the VPR and add the
> > > > > VPR to the list of memory-region items for display, host1x and NVDEC.
> > > > > 
> > > > > The set_direct_map_*_noflush() functions that will be used later in this
> > > > > series are exported in patch 4 so that the drivers that use them can be
> > > > > built as a module.
> > > > > 
> > > > > Patch 5 adds bitmap_allocate(), which is like bitmap_allocate_region()
> > > > > but works on sizes that are not a power of two.
> > > > > 
> > > > > The of_node_to_nid() function is exported in patch 6 because it is used
> > > > > in a later patch adding a driver that can be built as a module.
> > > > > 
> > > > > Patch 7 introduces new APIs needed by the Tegra VPR implementation that
> > > > > allow memory to be allocated at a fixed offset within a CMA area. Tegra
> > > > > VPR needs this in order to implement its own allocator on top of CMA to
> > > > > meet the strict hardware requirements. This replaces the dynamic CMA
> > > > > area creation patch from earlier versions.
> > > > 
> > > > Did you get a chance to see how this could work with Vincent's series:
> > > > 
> > > > https://lore.kernel.org/r/20260902104712.2399797-1-vdonnefort@google.com
> > > > 
> > > > ? I think that should remove your reliance on can_set_direct_map() and
> > > > mean that you can retain block mappings for most of the linear mapping.
> > > 
> > > I'm not sure if it would help all that much. Yes, if we mark the VPR
> > > region as LLMAP (or PTE_MAP, whichever it ends up being), it should make
> > > the checks for can_set_direct_map() redundant. However, from what I can
> > > tell, Vincent's series still forces page-granularity on these regions,
> > > so it won't retain block mappings at all for them.
> > > 
> > > The block mappings can be retained for the non-VPR memory, so that's
> > > nice. It also reduces the amount of external prerequisites, but I had
> > > kind of hoped that we could go one step further and keep block mappings
> > > even for the VPR memory if the region happened to be a multiple of the
> > > block size.
> > > 
> > > The recent addition of page count to the set_direct_map_*() functions
> > > helps reduce the amount of checks that need to be run, so maybe there's
> > > not too much to be gained from removing whole block mappings at once
> > > from the linear map.
> > > 
> > > Thierry
> > 
> > I should be able to add PMD_SIZE mapping support to the series. That was
> > actually my original idea as we can easily force the CMA allocation granule to
> > be PMD_SIZE too.
> > 
> > I didn't implement it as I thought there were not much interest in the end (and
> > also as contiguous.c is always using PAGE_SIZE granularity).
> > 
> > But now as I have implemented a specific pool (and do not use contiguous.c as
> > originally planned), if you believe it is important for the VPR driver, let me
> > see if I can extend the support in a V2.
> 
> I don't think it needs to be part of a v2 and can be a follow-up. It
> should be transparent from an API point of view and merely be an
> optimisation for that specific case.
> 
> Eventually it'd be nice to have, though it might also be worth checking
> what the actually gains are.
> 
> Thierry

Ack. I'll keep it as is then and we will see later how to extend it, if it is
necessary.

-- 
Vincent
