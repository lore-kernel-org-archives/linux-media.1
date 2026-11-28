Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884910;
	b=MD8e2WlFaz8T6NDeosm95Q8J/UWsIIegrnUNByl3j7R86oqXu4qGjFMfSWx3nGBK3xOs
	 40aVJTWAsARNFNkaHE5YsS/3EfAz9HFbGe08zHOYXAKwv89aZxy/fr0/Wwi5Uq1vLXmmX
	 BpaK0d6CzmeFlALY7mwYHEerGx3Gi92AshB7ME2DfH6k7XO4m0cMPSrKBOkhhlkFYQmZe
	 OELYSD/VjSd4ocJkPADz5wlTvXRrFIMX1c3fBnU55tYB65mzmSeJb5nMLpKkkl97GksNR
	 pteH9Zl6ZLOqA/2ZAe9SfzTXZzonE1+eC1HpkvgbUJu+VLcxP312er+P9dWTzypaaQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884910;
	h=Received:DKIM-Signature:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned;
	bh=h2ENexUCBhkNsWkRgHkzLOUWRacRGmp4QAZHr0elrJQ=;
	b=Qvu+H9Mu2GNEj7XiAtk6DmiNh3u/AwDmrW5hJoj1xAunXXF6JlFCNaXmoj7naC/NnIsE
	 +5rhr+n7P1kfk6wFSKyjR+ppQ1EabTM3Zdp3U8J/D0XVH3jzoL8DUI5DEIuIHwK/W09OR
	 /n2TLaLNfiUf9AU6qd8jzOkZODKjQ8g0W9hZu479LUdB/muIZj7TN3OffYEojapX3JgKv
	 ThIP/6qmjF8aJO6NKtj1+wYq5vDxEfXGX4svBizHaCZfOdZtLg8WfoiTmXoB88/Kz61ST
	 EKYmpVmoSvEs/MUKa3DIE2YWNxkoE5uS2CejtwZyyNT8XY8YTIOBI4AOKHICp0ky4aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZV9834Xk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5D606A321;
	Sat, 28 Nov 2026 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZV9834Xk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD941F000C1;
	Sat, 28 Nov 2026 16:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795884909;
	bh=h2ENexUCBhkNsWkRgHkzLOUWRacRGmp4QAZHr0elrJQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZV9834Xkw3/C0gF0g1sIEKsQ9HgcX02qZytb3Vzs3rV/eDXTXAMBR7Vo3tHNODpU8
	 dF7lLOz4Qi2rcVCkhQmVElHgKXcmGYHQo3At7VhDbuKTtilBpItg7A3ZAoMRZ1UWlj
	 z1qxcC+0Fg4o+3SAnDE1kovMwsjXDK/Cn1e9myCeFAlYUg56dfPZSfKZdwY4O4Qwtg
	 OLyeuG42Xw8Cr10nTKMVlKqcWypNhR1aOS4TCrNDyeQua2QDNEPvqust5Y9C681aOF
	 HANCbJ8Jd2ui4EMhH6ki7RMOKniA4tdOjrSqibLOcpMI4GbbDvtzUTmTN9l6YxrHD9
	 QR5+mV0dLFOsw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xXLha-00000004S0c-2SwB;
	Sat, 28 Nov 2026 16:55:06 +0000
Date: Sat, 28 Nov 2026 16:55:05 +0000
Message-ID: <86o6b8yjyu.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Christian K?nig <christian.koenig@amd.com>,
	Joerg Roedel <joro@8bytes.org>,
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
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
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
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org,
	kvmarm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH v10 04/13] irqchip/gic-v3-its: Allocate shared tables using CoCo shared memory allocator
In-Reply-To: <20261126163137.GQ246011@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
	<20261116091137.94252-5-aneesh.kumar@kernel.org>
	<awQd81MwZqi55gf8@arm.com>
	<yq5aa4mybbmv.fsf@kernel.org>
	<20261124134621.GI9566@ziepe.ca>
	<awhVoDXluqpncgcd@arm.com>
	<20261126163137.GQ246011@ziepe.ca>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: jgg@ziepe.ca, catalin.marinas@arm.com, aneesh.kumar@kernel.org, linux-coco@lists.linux.dev, akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, christian.koenig@amd.com, joro@8bytes.org, m.szyprowski@samsung.com, robin.murphy@arm.com, steven.price@arm.com, sumit.semwal@linaro.org, suzuki.poulose@arm.com, tglx@kernel.org, will@kernel.org, linux@armlinux.org.uk, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, mark.rutland@arm.com, radu@rendec.net, tjmercier@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, kas@kernel.org, rick.p.edgecombe@intel.com, kys@microsoft.
 com, haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, longli@microsoft.com, pbonzini@redhat.com, vkuznets@redhat.com, luto@kernel.org, peterz@infradead.org, dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Thu, 26 Nov 2026 16:31:37 +0000,
Jason Gunthorpe <jgg@ziepe.ca> wrote:
> 
> On Thu, Nov 26, 2026 at 03:52:00PM +0000, Catalin Marinas wrote:
> > On Tue, Nov 24, 2026 at 09:46:21AM -0400, Jason Gunthorpe wrote:
> > > On Tue, Nov 24, 2026 at 07:00:00PM +0530, Aneesh Kumar K.V wrote:
> > > 
> > > > Taking Jason's feedback into account, we could have the allocator
> > > > request compound pages and recover the actual allocation order with
> > > > compound_order(). That would avoid passing an order to free:
> > > > 
> > > > void *alloc_cc_shared_node(int nid, gfp_t gfp, unsigned int order);
> > > > void *alloc_cc_shared(gfp_t gfp, unsigned int order);
> > > > void free_cc_shared(void *addr);
> > > 
> > > It probably shouldn't be order here, that is hard to use. Just size_t
> > > len
> > > 
> > > And round up internally
> > 
> > Minor point in favour of keeping the '_pages' naming and order is that
> > it makes it more obvious what alignment is returned for code that needs
> > it like the ITS. Otherwise we can just document it, I don't have a
> > strong opinion either way (only that it's simpler than what was proposed
> > earlier).
> 
> All our allocators return things aligned to their size, does ITS need
> higher alignment than that?

Yes. The ITT is always 256 byte aligned, irrespective of the size
(5.3.10 MAPD), and the command queue always aligned to 64kB,
irrespective of the size (5.2.8 The ITS command interface).

This mean that you can end up with a 16 byte ITT aligned to 256 bytes,
and a 4kB command queue aligned to 64kB.

We can of course avoid all of that by wasting even more memory, which
I am definitely happy to.

	M.

-- 
Without deviation from the norm, progress is not possible.
