Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDBE4908BB
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816381; cv=none; b=sjG3K0w+BJJL5r+BY6Mb+umOUEF88ntpoXzm1xa5w7yhjH7zSONUo3eAnz4YxzGrhAmhXlnnvMDx4gSbHnUx/yNYOoFH3mBSNmkzb2lN2sdRJag53QWexVxcCTDGl6MPTpCRvEs7P+bWqT2MjZvtbzFqMou9F+T2LcoZRccKKP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816381; c=relaxed/simple;
	bh=YarLj6Tl5drs4d48GxIIPRySQhK4PE3lDvu4dKT16oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igwWgk+udOmpJPWEXTVBxzhg5VYUlrM7GDKE1GA1d3i5wls261cKJuaGtMNPUyEpHtSpLeUX2FeGkHdqYQh2rU/xOMxFv7AB4GJl1SMuFiUbafiUr/tuxK1/0XEaApQnry8ZnglSxG1eGUyuIbuA22W2QfpihsHkX7gLcfrobM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Z66BZ70G; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Z66BZ70G"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53397325663so21287221cf.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791816378; x=1792421178; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVDh4BcUbgvIW1O8+CoyCzwwqxHQNia8D9+ovujPztQ=;
        b=Z66BZ70GrL+G3fRSAa++wQ031ECfO0fS51Dh7ERYYOaggt42Ne8wL05RkyY1CINEJx
         dAH4bDpFvoxbV3Nbjo3T5t/TWrmGZHrIaHJ9rcDe6CzZ9JrhHdcdLybNTy1l+a5THPKR
         S8kXtrdBlOtRke0qkwgW0ZzCpt6Wqs/1kXrxSZcTNVeiBcEKEEZvvz/TgLuQTSihrHNf
         WBCQjBquZ+J0ZmdWo4+Qm1Nuj90rzq5A1TlecjN39HHMKV8Q0WhqMj1Bjf/7FOQjpsJC
         GuPr1dSttLysga5Bo4FH5pVFcvDbUY/9aZgigWdULgd+2dTZVipw3eKr12O3MtUUSavl
         2fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816378; x=1792421178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kVDh4BcUbgvIW1O8+CoyCzwwqxHQNia8D9+ovujPztQ=;
        b=hu95RlHoti8tEpny5I+ZmU4DlhEiGDpHgR4Irrpc/6+UXUJEqmHil16qZWEAjYfXtM
         YxrY9pUREiif0V0I0H88aMbItXcc4HROgQ/oO24e8x5/DCgDmY5Lm8J6pY7pC1O9CTpL
         KcMI+x3cwS59Oe4h0JeQgC8zj13qqNTZ/4Dj7XfMnUcTdtgowtSQZcbHzBmeU4qqGeEL
         EJOHquR5lc3E8jvAC7z5aGlkfrxpGR+ks5rUywa9YTi+aL1UvtWQy+7em//+Wy9zZRs9
         2/BRDFi3TRIMTK2g2FS4r99SJ2wI6Sp1dJan2Hg2M6b6BEk6MTjv8Ms8ZO+NRvA/PjdK
         RMyA==
X-Forwarded-Encrypted: i=1; AKwUvBx8X6ksebpz/42Cdf9d0AiiBXoTUgOXAPdMo9AjU4tCWWX5DZkEyuB5OAq9Z0CesgKvKRBdNRjfZTmGPQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL3OOqnQvSpk8cBAPMt82WwRNIwH3r9H8XDkcx8Z4NkxQnRba1r
	e0id36kSfOk9Wjt3DN7360oFbUqryP88OidV22c3RETutLXLz7dM21udsp64xPiS3z0=
X-Gm-Gg: AYBFou13MVmH3r54DtCzk1XzCZtngTC5aDkemGWgEDJaAYZ1P1WMVGcOa0zWyH6D3G4
	xDF0xolM9ZaUO03BOSqWoA+V4CiTMh6ktTm8oT7R9UAZ/rZy8khpMSJGEWLj2H5KWBv866Z1OYU
	H8BMeJMl9Pv6cVCQZ8BMTPWkhwQ5dLw3SA+rxvajuJcUJh2vUkA9dhvXXlhQdI82O65h51k8UTJ
	B6XH5xHA3ZQ+uPJLM8Zasc79bKcNxlG/WryDbZ7H4D7HKX+fKcuwk66+DalH3wsNJ1gtwB4WB0O
	az6kFKLT4JIyoaRPA8AmxkaZRb8g0pAmiTH1DI/V4hEzc4YBo6erTycjCpFPC9NYz9j3ehZGNrH
	Ixi82EyrL9x/ml386YGD4aQBM8SMlfAR3l4Arg3XifkYo4u/cbZsDA1eQHH8e555E30+8XMCu/r
	/fHotCwWAljWhJTja1L+V13orBOg5wCxlj10dfWzrMCufsiNHlpN2rMJV/wqpQO/LgHChMa6Jc5
	+JyYMWP83itC70RC/zOaWVx5v0Iltuk11DGvWH23b/4jnncZo+y77CB
X-Received: by 2002:a05:622a:2487:b0:535:1134:91b with SMTP id d75a77b69052e-5359faead4bmr160454661cf.14.1791816378499;
        Mon, 12 Oct 2026 07:46:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535e652f3c7sm3157041cf.26.2026.10.12.07.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:46:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGHI8-00000006SW2-2nlk;
	Mon, 12 Oct 2026 11:46:16 -0300
Date: Mon, 12 Oct 2026 11:46:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 2/6] dma-buf: Add get_phys() to describe a physical
 run
Message-ID: <20261012144616.GF14213@ziepe.ca>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
 <20261005132046.30025-1-griffoul@gmail.com>
 <f0077cec-10fe-400a-b229-f7434e297364@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0077cec-10fe-400a-b229-f7434e297364@amd.com>

On Mon, Oct 05, 2026 at 04:53:34PM +0200, Christian König wrote:
> > KVM gets its frames through the KVM-private guest_memfd provider
> > interface from David's series. iommufd gets them through a private
> > interface with the exporter, as it already does for vfio-pci. The new
> > version adds a small registry in iommufd for that, which replaces the
> > symbol_get() of the sample in David's series. The dma-buf is then only
> > the handle and the existing revoke.
> 
> Yeah that approach sounds totally sane to me.
> 
> We have drivers which stuff all kind of resources, not just memory,
> into a DMA-buf. That ranges from MMIO BARs to trigger FW operations
> (doorbells) over full HW blocks (ordered appends, global wave sync
> etc...) where two or more applications need to share which one is
> used.
> 
> That you then have a exporter private interface is for accessing
> this is perfectly ok.
> 
> The problem you are facing here is more that this is not limited to
> one driver/module but multiple ones and you don't want module inter
> dependencies because of the symbols.
> 
> So symbol_get() is probably the right thing to do as long as we
> don't have something like weak symbols or similar.

I don't want to keep expanding this hack in iommufd. If dmabuf is to
be used then dmabuf needs to provide a pluggable way to fill the
iommu_domain that many exporters can plug into. I don't want to
hardwire every exporter into iommufd, that makes no sense.

The existing arrangement is to motivate solving this problem
generically, not something to be expanded on.

Jason
