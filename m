Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446045;
	b=WVEm4HQz5ynve/z7nExPDi7FoxAW2qIWoFmNIz7HECWrRpknJvAzxIqQX4s+gUKEwU3X
	 y6eFEpemVq/7zqci+jhCPz6KHjN6eB9V5PajQ96gTBK8IDdY+r3Atz4e2VIh4CqHBw0lZ
	 JosZCiDfkYeUwEmQrCfpXy+d1lB1P/PVP/JiGI6FlGlhRhA+dguPP758dr+OXJJFiBXCf
	 o5uypwRT/0x2pxbtxzei8Yu1hrdmx5yPXhqsRt6SBTuJ6CDWulC1eEkjVJQPaz9K0QQgT
	 bPSVF8YW7tSS4eIOqdpRPTdtqgc41TXmTp7MvHXMf6mUyURrid16cUzT0bRvVO1B8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8YXzoVkoKKTn5S6189qRHpEA8zSaXUAPSQ685ax1F0I=;
	b=ba4u7bLZ2UfCatc//j6/yrSZe3Q0pX18STC7KpjR25iTEcRbQBpdQvIBGgvSquIW2fPq
	 S3ctjNkdZXZuVZ0bFnzGACvVEifTkpW6N+44MOfYDK3gqxHs0NhQRgEFjDBk66zNLfBA/
	 /2rW05PMGRO5FSrZID+p97xi69i4c4+MYugRReBupcu3vz/Acpc+bKk7Drfy6VP0Sp+2P
	 2V2c5N3nPbhTFxysBBoXcLr7lQmsuUJ7SshCR/cioyth+l80kZdL3ikrAL3T3S3Tqf72n
	 MLeT5FHP4/Ie3lC7JQUiuFEqJVtywLfsvLh2hJv/NGhl1OytI0tuSiPWFbrAP4ck69A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=QHBb1knb;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B7A606A6A7
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B7A606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=QHBb1knb
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9215934a14cso8603876d6.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795446044; x=1796050844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8YXzoVkoKKTn5S6189qRHpEA8zSaXUAPSQ685ax1F0I=;
        b=QHBb1knb768zKDS2vkRealnRswiR3Uv0a+YXzX2Rn0iEeme0s4HHbPt5QcN/AFNDiz
         MPiW6YrOH5b4T9rDIqr9x+cnVvraTToPQBy5ZVT6gC0kgklAhnoeJswTYgHpTzzV7Nua
         NuExt8oy/2bGJk4MZio8kcpqYD+LjA4fbYIooAbOvmUqdE2XIfcUZlMHmYlZloDE+MRr
         1yPOUbwBot0AuFkpBYq5ueXD5Lf+jLWQuuYFdMYjDYRk9TRGOnx4eRquXVHGpnzGGR3R
         aPhGJ9ITK0ngLQtDRCyiR4UCLkacgW214noa2qBC8NAvMDpz97xeKbEOyTJjn2c3E1Se
         8PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446044; x=1796050844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YXzoVkoKKTn5S6189qRHpEA8zSaXUAPSQ685ax1F0I=;
        b=Fcq6iOvk+qSmDMexKU+afhZjBAuiC7Uej/62Pv+xCziyueSxMfyXVrp8yJTAa24hmO
         ehAPpIWkMEM5GcJ3u4SE0N+xQGh+3uu9o0gVAMn6026BGwHlsr/+dxZ/f0YER1xXFtav
         QHJe2XqaAypdHGx3/Hv4YtZ3OaS+YNelSdaM8s5TkCDcbCcLBFKzKbv1Gp7KHb4I6Mv6
         g3zR7vRpHauuQ4LTqpeCXoF6aIAhndh/nUOsym4yUX3yelocBS7HngwsqQYc+HASsZTQ
         SnTqw6+RgUQvrNGYTPgXQPN2LISHC2A69wGm/qxyAlKcqQ5GqRicPhpEvVwEQiu60s7l
         OgLw==
X-Forwarded-Encrypted: i=1; AL+hErF6n3YK1P7CAilmeiI1B7Vhxq/zOqAVSaDn5ZTTpwmaSl+Jv9X0UJZWqLZUjj+uFhGBXvXDVfBoCf9VRQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wTa54KbFy9yQ8dSe/PWW03Z6eQ8WMOHrUMq0mGYJZoW/gCE3y
	e3+ANux5vL6jQfU6fOswM3M+3o5cqGEIBc+XwIXvCOoDmcSyOFBl4E7xUI+vEnD9gAU=
X-Gm-Gg: AZFdTZea1De12xCyK76wPOknAbV6j5VkOPl7oTeMPVmUwVNKrb+uugdJ72RigUxk2Ak
	Zd5YivflXDjml+WBktckp0NRmsaWcqQpgliBocNUnSJI58/bRkNkeXA0KZnr15OIpc7BOmedWXU
	RHKpLdEUTFQTyxwVMB5VXxp9GOSBZ5wIsR1nF463Fjq/v1ThlWJHdUFO+F8O9uKzYP/ja4+w4r0
	G58E9Aj7Mh0yzzPh3gLoHdXWaoatYeF8XDQmMvwqnUTyQ8ClKMr+8BCTfl8rLRfyjR4MZEvCuwt
	aPPrlvCQaWsRYt/A19uAhWjfI/bY4IHwFYDpipj5DMzKXeNve2K/6nhkt2wLbozWzTW3bT+iN//
	t4ExI+kqwu3f5ACY4nKaTOyHNYcMuY2PpQA+oOfXBpY8CAdegLZj4XAt+QikOCffykMxgtA+ftg
	vnFylyf05CC4+slvihW67TEaR3I33Yw26MRE1BcOPKu7h4+zDW6Yssq/Yi6oiQL3vhfgGXr+qgY
	pSoOIBsdKSvnXCuk86OTZ0TxtiTyY1sPzAm066IbPj32LszFYZE9s6Q9enAzl623qKxFlBwtr6i
	JwDUHOy40KnSwY13F8FnBAeGvlVA6e+E7FQ/9jkg8JVg8PnS/oadRL+Sj1AC4PJ2HNSklsAUmv2
	q8jw=
X-Received: by 2002:a05:6214:4891:b0:921:27c2:3f89 with SMTP id 6a1803df08f44-92134a3715dmr207386236d6.17.1795446043629;
        Mon, 23 Nov 2026 07:00:43 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm107600476d6.39.2026.11.23.07.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:00:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVX7-00000000rK9-14j4;
	Mon, 23 Nov 2026 11:00:41 -0400
Date: Mon, 23 Nov 2026 11:00:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
Message-ID: <20261123150041.GB179082@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-5-aneesh.kumar@kernel.org>
 <awQd81MwZqi55gf8@arm.com>
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
In-Reply-To: <awQd81MwZqi55gf8@arm.com>

On Mon, Nov 23, 2026 at 11:05:23AM +0000, Catalin Marinas wrote:
> > -	/*
> > -	 * If set_memory_decrypted() fails then we don't know what state the
> > -	 * page is in, so we can't free it. Instead we leak it.
> > -	 * set_memory_decrypted() will already have WARNed.
> > -	 */
> > -	if (ret)
> > +	if (alloc_cc_shared_pages_node(node, gfp | gfp_flags_quirk,
> > +				       PAGE_SIZE << order, &mem))
> >  		return NULL;
> >  
> > -	return page;
> > +	return mem.page;
> 
> This part is mostly fine but I do wonder why not make this alloc
> function the same as buddy alloc_pages_node() - return a struct page
> pointer.

I'd argue we shouldn't even be returning struct page here, do many
places even use the struct page? What for?

Exposing struct page to places that just want a kernel addr means they
have to call page_address and we are back to the highmem weirdness.

> >  static void its_free_pages(void *addr, unsigned int order)
> >  {
> > -	/*
> > -	 * If the memory cannot be encrypted again then we must leak the pages.
> > -	 * set_memory_encrypted() will already have WARNed.
> > -	 */
> > -	if (set_memory_encrypted((unsigned long)addr, 1 << order))
> > +	struct cc_shared_layout layout;
> > +	struct cc_shared_pages mem;
> > +
> > +	if (WARN_ON(cc_shared_calc_layout(PAGE_SIZE << order, &layout)))
> >  		return;
> > -	free_pages((unsigned long)addr, order);
> > +
> > +	mem.page = virt_to_page(addr);
> > +	mem.shared_size = layout.shared_size;
> > +	free_cc_shared_pages(&mem);
> >  }
> 
> Here it gets weird and I don't see why we can't have just a buddy-like
> interface. The kernel-doc for alloc says that shared_size must be
> retained for the corresponding free but without reading the source code,
> you can't tell that cc_shared_calc_layout() gives you the same
> shared_size populated by alloc. We have a similar pattern in dma-buf but
> using the compound page order.

This makes sense, we should not be passing size to a free function,
make a compount page/high order folio instead if the API is going to
be struct page based.

> We can get rid of layout and mem structures (or at least not as
> part of the API). Of course, this assumes that the shared granule size
> remains constant for a guest's lifetime but I don't think that's a
> problem.

It should be encoded in the struct page meta data, as the order.

> Was there a caller you had in mind that needs the common allocator to
> share less than the whole buddy block?

If we want this it definitely needs to be a void * based API not
struct page one though..

Jason
