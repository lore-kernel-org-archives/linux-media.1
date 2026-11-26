Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708332;
	b=YxYXGtxBo2dMAlxLMaNoccooffLLEa+tS9r5JBXuw0KHGk/OBznnOagXoO8ChqHTe6Ia
	 Ay7Lg9FpAPwjXL/T89d2zcintx7Nv+UAjscq7SnTWWcN8kY9zlaIr6FfbwOL9FGPuAkGH
	 tht8wPVeRvZK6PJqt/8iW6FxJ68T5T3gvCj42yU8TypBZRP+MrhQ1VYdKLI/2e9Ku8jB7
	 LVPnlTbofmz+/mYXTbMXSPgs+9oIIdtQqWU/DJmknmOEUwSy83BxipdIjtrkHUlyqWpHi
	 J/5HCFQnGfLxVIPsRfwa4Mjl9FD2W4bWpLvgDwSRNbKD4s4Od+TnZdKLAfM6fVD7MbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708332;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PsJrhw/qD5kUJUapuNeSh8uHKjzWdiRgnqrKaM1xuOk=;
	b=HGWV4rgjr6ifpv1rdw8hSB3+YyN7PiH9YTy/TS8FumzT0MHnyYOilmwXo9uTyHlnOFpF
	 +I1wcw1neOQm0tLUvZAHX6LwF7+PXrnA5TwcqV6TKZV9vzF08fFS7DKoTSFv/nhwRGcLE
	 yy6SraHgsg11W3zSUmLXUZIasc56bg7cQSDBsREhs/zCz7tSQxZiEbfo/hllAizv7me9Y
	 qC5V4+22ucgdVSSFYLPck9Ks7oSEGNBH/R0vdgIERBZrD9OxBGdSmZVyH2aZpNBiWVEBT
	 QnaSPudf/sYBeWopMO2RJBLwlyWZ/fCcUkYV6iX4aSl/wvHpI/2v7P0hgDXK4tkWYyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=So+WdnWi;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8304D606A323
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 15:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8304D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=So+WdnWi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE6AD1C2B;
	Thu, 26 Nov 2026 07:52:07 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D9373F632;
	Thu, 26 Nov 2026 07:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795708330; bh=t/iAXo76mNWOYi6NXRXLm9HYRbfENwEmeSuVZl+vjQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=So+WdnWiITxUEA+zPA0qZrHfIgEWB8UDt3yn4IEO5THcFQuUupbSyZ38WSbYLlzZO
	 Rdd4TpDOmHWWTHsRW+t1aSXOFu6+xeusbEXx8t6R4TR3fxZ+3I/eAfWH7BVYVPd6hg
	 fcIkARwHaaJVtuaYyOlwbtgwfzyTh/vzHdKQd+qA=
Date: Thu, 26 Nov 2026 15:52:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Christian K?nig <christian.koenig@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Mark Rutland <mark.rutland@arm.com>, Radu Rendec <radu@rendec.net>,
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
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v10 04/13] irqchip/gic-v3-its: Allocate shared tables
 using CoCo shared memory allocator
Message-ID: <awhVoDXluqpncgcd@arm.com>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-5-aneesh.kumar@kernel.org>
 <awQd81MwZqi55gf8@arm.com>
 <yq5aa4mybbmv.fsf@kernel.org>
 <20261124134621.GI9566@ziepe.ca>
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
In-Reply-To: <20261124134621.GI9566@ziepe.ca>

On Tue, Nov 24, 2026 at 09:46:21AM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 24, 2026 at 07:00:00PM +0530, Aneesh Kumar K.V wrote:
> 
> > Taking Jason's feedback into account, we could have the allocator
> > request compound pages and recover the actual allocation order with
> > compound_order(). That would avoid passing an order to free:
> > 
> > void *alloc_cc_shared_node(int nid, gfp_t gfp, unsigned int order);
> > void *alloc_cc_shared(gfp_t gfp, unsigned int order);
> > void free_cc_shared(void *addr);
> 
> It probably shouldn't be order here, that is hard to use. Just size_t
> len
> 
> And round up internally

Minor point in favour of keeping the '_pages' naming and order is that
it makes it more obvious what alignment is returned for code that needs
it like the ITS. Otherwise we can just document it, I don't have a
strong opinion either way (only that it's simpler than what was proposed
earlier).

-- 
Catalin
