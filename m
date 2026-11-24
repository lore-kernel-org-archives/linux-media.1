Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527984;
	b=DV6bVfK0C38LOakrO9jp20xmicpXAJZOwNoFlbYWfJhaph6LRGUlUTD5a55bZ/QG6gIp
	 mZ/xAdJ+A+XFtTsXony2WsaYhSuSrNhgpoKtIK8LHBwN2E8VbP+3Zs5lDYtAQou/Pjyvn
	 QwyxaFB1fy57noMvUcp7E2DZH2FIrQGzSlkuI7pe4yyEb8r+iRCvHIhzi5e6tyGcDp6Ye
	 p6nlHM4JYNi6bhvZ2a2DNp+Q0zdkG970sY+B8JXYssVTSResHVWGOCAZ7X+Y4+j75CubO
	 yZDBvgNdKdKtamqneMIMdT5uEyj2eph/OjSKzonb+cwh1LXHT9fPWnYa2Vo+uD9/AtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zc7zKgD/SDYnIbkY4MVpBd0Jo9DiJTva6Dv7og4GVfM=;
	b=eYocY56SL8FFPEQlgS4+jnZ5v6u3t0KjPDh14H2d3mwPPQ2NWvjnNYr10XD41OMOjg08
	 JB9W5V7sl3mbmMAALbil3yTk0aqibbkWffwTmk7olkHVLeC0KFWS2jwlOfFhZyj9CVjcT
	 mOqyVbIZFHzUccX/Qf5m0OacTpo5Y2iHHVu0hqq/K6+EISQiDO+mF0FMZ48kJKW+l7Eba
	 hIDW/jIbSE7hJSjUId5y0YGEUsRDIaapx3mbsm3LGdEP/eEDOYeH5m0xBv9MkpsDhrj+5
	 KPLM1c0X1WOL9jdnvL0ocW56GNXu3Gabdn0gDppZNY606fGgH3w+dmqoco33oe1yHLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JjPDcJ9f;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1882606A337
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1882606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JjPDcJ9f
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53664b4860bso52277551cf.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 05:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795527983; x=1796132783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zc7zKgD/SDYnIbkY4MVpBd0Jo9DiJTva6Dv7og4GVfM=;
        b=JjPDcJ9fzA9Lvqxl0J4iEn7zSmwuVsnnmXso1DnQNI41aZL2tpMQ72Lr5D+eDc9J0K
         YLa4xhXmyXe4x8403vG7oF8n+fB4Np0HDU2Lu4t5d+z17uO0EdOXbv6gFvinLmA7rMww
         Id6NWuci0Wft6+qUf+pPVXjDOF7wC7eZ1WZJm+hoNsfMQ4LTRmgI/d4z1xCYTyELw1e4
         lUSHK6uOwK3G7nCKBjbL3kUU3spyquCDXerxZOrA6OldDYWJ8jUL9KyLJJcf6XpNzFq/
         W1zWNfihIE9SSp0nIPShw4W+G3kb4fl6I59AGFV6dXyF8YTNHzsi19TLjDGSrE4jBUgK
         p8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527983; x=1796132783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zc7zKgD/SDYnIbkY4MVpBd0Jo9DiJTva6Dv7og4GVfM=;
        b=yUtmrWACbHFl1w3xQ+wd77pOAzP5Vu/9HmpVoSk54iXipW2Tf777pJ8xVOzdvplPOO
         UGQ1OqHloB9Tbg6NlvAu1Az/dGFjfbE0RqnserE4o/NBkU1BUEOWAMMgfFc+rPmPEj0c
         oLRRNY1h3CVdHXpZ3h037G1R8ax/Xzi+bFFBxqYjPtyy9blV678go/trqhkdJ+gMyIK1
         oS4VUjm3/jPgN9fXmDjx6dCXA8BeSrmV3+e3xayTlLYtYsc7onEC8hV2yxzJs8I7n4GI
         xfSAakmRdVqIFisP3Ta4hLj6y3yAORV+Bs3CQdk+9qQMo511rNI5mQHPHdR/DduYto/T
         aA3A==
X-Forwarded-Encrypted: i=1; AL+hErE+a8A51G53eVjKO6B6UzWnDj6WxZiF8S1HDLrqihiagdQjA4kzZnDaC9vJlwVyp09BRVHv/xD2zfGJ/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/IglcegioPqBEky7gC0wJ0ZWTuoezhMAwp/x12mzGjSJsZreo8
	UGEPS7en7LkOOOa1RZD78NAvLmYruaiPnQzQQyRbd0mvyZJMmfVVr4zuqMd1MdAtUGk=
X-Gm-Gg: AZFdTZcIPVqUcjj1x/Bpr6YfGNOZVMZfyxZq1h/6y/E5h9/r2vLdAIt8pFSePjSvbKT
	DWY8XSg1wFHcyaISMKvPaqwYf2CC820N3JoTBjRSizmktpvXiFTb4DrjZvwpRQe1GZDaaw98UfR
	c4LDM6ZUJo/h532BoxF223n3d96hcj0gMjQwEzpSoZZp5NdN+JzP8uEPt5/mZ7cTgLZNi2z0s0s
	ZgUNJNiAj81xtcJBIROB2mShl00XxVfqvxdxA+EmPBq4LoOXOoIF5sTbp8aylgioUfUFtNmf7wI
	LVSQI7z3+igFExJf+wtMz/NzzbCYLaq9L6jNdJUFopBQACUt0nvFgPE1XypTsbrsZr26ldX/txz
	z5dFQU8Yzp85vQtDyFDFTwvhkPUFlV08LnrEzvePrxX4t+ImKsr+1davjpcGqQREfjEMUIhyB2b
	gMss/yaVHg2ugAgv8s9Gp4tmyF2Xl4o2jeoqW/duz2hpSx+PclEto1K4zGADF+lpI2CgjxHARaH
	m+WXyvS40Pb8am39yA00M0qzP0IPw/HcghnOEihZ3G/D9sj+y5DVOb4VFY0aZJtghWn4FAQqZ8D
	E+5SZw==
X-Received: by 2002:a05:622a:120c:b0:535:a5f9:752e with SMTP id d75a77b69052e-55d76aed568mr264410241cf.77.1795527982900;
        Tue, 24 Nov 2026 05:46:22 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78451407sm128368371cf.2.2026.11.24.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:46:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqqj-00000000QIG-3EJB;
	Tue, 24 Nov 2026 09:46:21 -0400
Date: Tue, 24 Nov 2026 09:46:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
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
Message-ID: <20261124134621.GI9566@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-5-aneesh.kumar@kernel.org>
 <awQd81MwZqi55gf8@arm.com>
 <yq5aa4mybbmv.fsf@kernel.org>
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
In-Reply-To: <yq5aa4mybbmv.fsf@kernel.org>

On Tue, Nov 24, 2026 at 07:00:00PM +0530, Aneesh Kumar K.V wrote:

> Taking Jason's feedback into account, we could have the allocator
> request compound pages and recover the actual allocation order with
> compound_order(). That would avoid passing an order to free:
> 
> void *alloc_cc_shared_node(int nid, gfp_t gfp, unsigned int order);
> void *alloc_cc_shared(gfp_t gfp, unsigned int order);
> void free_cc_shared(void *addr);

It probably shouldn't be order here, that is hard to use. Just size_t
len

And round up internally

If we ever want to do some kind of slab sharing scheme then the API is
already set up for it.

> As you noted, dma-buf would need virt_to_page() to obtain the pages for
> its scatterlist.

I think that is fine, other places working with kalloc/vmap already do
that.

Jason
