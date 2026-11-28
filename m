Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883998;
	b=KZndkp+X/arf8y5+NGcnlNnHp9fr1f4kVU7Q6XJmJ5hUDaCfzAfJgl2rFQyMpjVS9hme
	 SCbCIXd2cLcDQmUzYWIMXJSnTbaHqKG8dSeCQabo2jYf1l1SF3JF1BbF2g2nTe+fkNEMX
	 T3iHNalKKdSGsGygjnWz5dZVMCgzlr4/t/zQ7l+g6uQaH10MZe3ngcerNr6t0KG26a88n
	 L6mvhSafVnKAgD+bkarNzcSiier2Y/7NLvTOHEz+7d11NuEhPNx+A0MPIfpls82iNvc4L
	 bre+vNErqidCRqcL5FQpV6uaWVNzIUXVM5GrDZpbz3+DTLl4m+FfPLZz654ppCStz8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883998;
	h=Received:DKIM-Signature:X-Mailer:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Xmj5oVcG3ZMhpzMx9V8DGIeVZkPO3QyI7dk0nE0g6aE=;
	b=T10zNHO5HerJI3kc0fCqH70jvMEvXuNdssb+BjI65bv4sCgpW/Pzpo3vl9pBdwDdHJLd
	 S5J9FmH88kNgMk9fHWt+ZinNOzB4Wg9ew0A9PzOwrBk1yFNDHir6G7ysF1pcQJnpvAkdt
	 0j56aA8f6fnn+FrTCB9CvehupMlSZlPEHE9HH+jNAcD2dGRCiYQwHhFmnxtDH+EAM97Dm
	 D5zLjYAGztnXZX4ucV60GVWgmtQ68wow4WSRsWlR/YzRfw6XsXnhjfXKHrKKVYbx5QwF6
	 Rhg3YU6WmmT8p/xwm7iayJwE9g6Afbu9iDBEnG9c0CHdhleoncga6MEjG5m6XK3hlXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nKWFooM/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A03C606A329;
	Sat, 28 Nov 2026 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKWFooM/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CBB1F00897;
	Sat, 28 Nov 2026 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795883997;
	bh=Xmj5oVcG3ZMhpzMx9V8DGIeVZkPO3QyI7dk0nE0g6aE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nKWFooM/99UZc3nMM8dhy5+pchlXWnzblw1BIM6mYzA6LTHOSU1sM6pPviNuuKekm
	 vePaUIaCuvueIrLnTbqh/J2MJIcNTNBrLs9cJYrksU+kvs4gQjhSturwzYa+PRYUq2
	 DHlaQAG652HC86XLbpu8HyPnfJofUYY9RiolyqAAZ/MIxYtEZpqx3ZrO+UrD4g1DUd
	 YG3NPHT0j/s1Jrp1TsaRllREXrcilKBhiixEJmB2a56KiYGCua7ZBpD3EJN5NSx8MC
	 5IBTRkRoo4l3SJtgZGTZ91399ktjQOeTGKJsFHvU1K7WnXhIQ7ZpfTAY5uWu27O8Ge
	 LQn10Y2qr+zug==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-coco@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Christian K?nig <christian.koenig@amd.com>,
	Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Radu Rendec <radu@rendec.net>,
	"T.J. Mercier" <tjmercier@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org,
	kvmarm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v10 04/13] irqchip/gic-v3-its: Allocate shared tables
 using CoCo shared memory allocator
In-Reply-To: <awhVoDXluqpncgcd@arm.com>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-5-aneesh.kumar@kernel.org>
 <awQd81MwZqi55gf8@arm.com> <yq5aa4mybbmv.fsf@kernel.org>
 <20261124134621.GI9566@ziepe.ca> <awhVoDXluqpncgcd@arm.com>
Date: Sat, 28 Nov 2026 22:09:33 +0530
Message-ID: <yq5ao6b83o6y.fsf@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Tue, Nov 24, 2026 at 09:46:21AM -0400, Jason Gunthorpe wrote:
>> On Tue, Nov 24, 2026 at 07:00:00PM +0530, Aneesh Kumar K.V wrote:
>> 
>> > Taking Jason's feedback into account, we could have the allocator
>> > request compound pages and recover the actual allocation order with
>> > compound_order(). That would avoid passing an order to free:
>> > 
>> > void *alloc_cc_shared_node(int nid, gfp_t gfp, unsigned int order);
>> > void *alloc_cc_shared(gfp_t gfp, unsigned int order);
>> > void free_cc_shared(void *addr);
>> 
>> It probably shouldn't be order here, that is hard to use. Just size_t
>> len
>> 
>> And round up internally
>
> Minor point in favour of keeping the '_pages' naming and order is that
> it makes it more obvious what alignment is returned for code that needs
> it like the ITS. Otherwise we can just document it, I don't have a
> strong opinion either way (only that it's simpler than what was proposed
> earlier).
>

Thanks. I'll keep the byte-based interface for now and document the
returned alignment:

void *alloc_cc_shared_node(int nid, gfp_t gfp, size_t len);
void *alloc_cc_shared(gfp_t gfp, size_t len);
void free_cc_shared(void *addr);

This leaves room for a kmalloc-style shared buffer cache in the future,
where allocations could come from already-shared backing memory. Callers
would request a byte count without needing to know the underlying
allocation order.

For now, the implementation will round up the size internally, allocate
compound pages, and share the entire allocation. Will add this to the
kernel doc?

 * Allocate a physically contiguous block of at least @len bytes, rounded
 * up to the sharing granule and then to a power-of-two number of pages.
 * The physical base address is aligned to the full allocation size.
 * The entire allocation is shared and zeroed.

-aneesh
