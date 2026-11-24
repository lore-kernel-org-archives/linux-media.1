Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525676;
	b=gi0CMWUHteJsMdXbc4WTln0oJyFuosmPKEDxdLMU+fTRspeuDtgCSJpllFXTukw1+f0K
	 hDCUN+CHEE2Aay794/hKPILQd4p/lMAWS1OpzopKMlEUP5+meORBmXS5rQBxK16oRSf0f
	 M5+vpHJoiwxYdCagmC/x3I2dHuODXevnH3uGnkwlxKkZaqT23ruDJI3M0OTdMEYqm7Iqj
	 5lmgcDlPeNl/PR+ED4GmV3OuX0JnDhZsYoH/w7QPDCRXUGJ20WxUfXhzeAF6NXob1sIGN
	 IqON13mN5c0fyV/0/tlCmnHVtJOpUoKRf6Ki4bvBVEIUQ59mB8GpKRMJruvAUw3hGXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=2Jqv6h2U/zwufJIWy6q7C5BzrR7eGEBWyzupif8ezko=;
	b=UkteYWKp6Zfe9PCgRnY0V2KaY4A6eBWWhS7O9isgCIJbb6FJVrDxe03hg/sioeyNYJuS
	 PnEJTOQVPjJqTSCf+ExxtvRaC8CJMPUr4sZswS0YbKJ18p8eR/AsGlFjqGs2H5bHGO0dV
	 XJBPYFLXk4lUrDCK2153v+EYq3MEjm+MWtFSwhP7iGWX8/kJrOS/AMMAa7Afo9JohmSf4
	 Jl1Nf6YX0fjPk6wvPx7gGq6eh5RQpSOU6kBVpWDpop2vM8VSGIZBV7qZ7Mz5h7G44ohqX
	 asKkYE0DcnVXVnCnIVEbTPIyTDZRAWcfBhkgQ8LkfLFUQJnT6xAyh/ycewDj2Sn1H0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=BQRkf3KG;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C0A606A327
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C0A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=BQRkf3KG
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9496577d4c4so518018285a.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 05:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795525675; x=1796130475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Jqv6h2U/zwufJIWy6q7C5BzrR7eGEBWyzupif8ezko=;
        b=BQRkf3KG9mx/SZHc+udE8Yysa91aiZNQ/xsFvbHJfyKUQU7ubzqUgIXcaxmYD5H2RI
         7O0/g3Ne5Y4GAQFzhRc2CIS45SMVYN3Ui67rM/Js3rymeAESdZQNhSmbduFcUfNWxuS+
         E2hjJM1+ofgQ2qYdjQFBGp9BWPdozioHUzTOOGIMrqiEuIRSSHayW/OeurPed1Vpv5It
         9zhM7k+B5+yUhFcc/NmfZexwDKhLgfsGzWI+l0GiM5eMj3dbgoB4Ywk7PIwWBuiMP/KK
         AKH7rghpHpbub+CXqv+ZG5yaYSQ0/Fl/flBiJYxbzK3ZR4Fr9QmFhmiCA4lDlIId0f81
         FVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525675; x=1796130475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Jqv6h2U/zwufJIWy6q7C5BzrR7eGEBWyzupif8ezko=;
        b=YwDbgDzC/8obzqVID70UW5WLU5uqMg5XKHD+psjcmIGo4o6D28diKvG33g9WVgkb/a
         wdEHlw4S/E68t1IVJXPu+BMV6warFge91VGb6yA/Aa4rL1dkIYUHN0b3w2JvMD8WZ0UJ
         uYCVKlSCWF6PuRQShir9+d0hxzh7CMrw36LcUnJ5KksShMwpKY8qQUJTHiljJ9DfFzVh
         hAXeXjZKwajtZhJ+ogAoNRs+2hEhL3oV4So1N0zHYkvKAlcIs9sL2yksA3XDm153ohJf
         nQtpnM+f6ybWsYG9ZF5MnbajxA//LRdrcP0neuRxV8pt22cNtig8Do4+6Ksy1rl7SGjX
         XcXw==
X-Forwarded-Encrypted: i=1; AL+hErGm4gqM+zVL7tPL4AYjhGn6segh8w258JHOz6zc5xsuO/eeGX/ejsFvz8lGe5csatxgQOEsnzSTzrL1og==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FOq1d8OHVVsuQMvC6I6EPK6ACRu2k1QWeM9804ljf3DIqVF9U
	Wq8SCG4oo1epmaPFUZYGq+05rk2bpAapQoWyS9c44VMavlSCBCbRm2FKMoG6FWZkysE=
X-Gm-Gg: AZFdTZc9LuS8A7bPMTsIhSda8NAVMYXKp1/5y0AlDCPXabVT2mL3nuBUwYgT5m6+kvy
	4kMKTAt/tCEaSOgUVstz3HEtscllUl4n1JaLjqhSKMLtNG4KQRbsBS8S3MQra2QX/xd4i2XVAtO
	Ei1z2yCYWZaql/8sy26pY+O9LZSvDs7Thf20CPWD3JL9c6jVE/bUSxqPKVEpBaG1a9GJCRskAMO
	TUuEnIyWuq7ER6ByvYpTr1bYewkBHf7t4AiTKsQ6jjVOW3rw2SZJjc6vTQySc0ykM3o+a/zUFGv
	NQ/UPycRmxi3dGP2xjBv3BwGPFUm/e4hJdrRWdRbRKOvq9EvgQIjErvPX94daAmpmoc1VEfnqFZ
	7bQgA9lu6k9u0KsF12cGjcsliWOnUA3PBRLZA61M3kqLrgEjYwsgW+dnJkFc4tsGIKNdQGuhqHk
	ur8I4sSRf6QbmgG1vYFhgmEj2bI/ZbWFuCMdc8ERcwMJAtvsK4rOwgNyMgIqc/GGOJlBcBFiY1/
	PpYd3erMJOrjlWfbDPjs/s2OQnmuqhJAoU+4wo0EOdONaYlSS/rFQyomtyC0KYOyDsgq0WUP7C0
	eW3kKA==
X-Received: by 2002:a05:620a:2705:b0:949:8ee5:6faa with SMTP id af79cd13be357-949ba818db4mr2224332285a.4.1795525675010;
        Tue, 24 Nov 2026 05:07:55 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4219c4sm1034879485a.41.2026.11.24.05.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:07:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqFV-00000000OKe-3ac5;
	Tue, 24 Nov 2026 09:07:53 -0400
Date: Tue, 24 Nov 2026 09:07:53 -0400
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
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v10 04/13] irqchip/gic-v3-its: Allocate shared tables
 using CoCo shared memory allocator
Message-ID: <20261124130753.GD9566@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-5-aneesh.kumar@kernel.org>
 <awQd81MwZqi55gf8@arm.com>
 <20261123150041.GB179082@ziepe.ca>
 <awSGBdS1AiFhJzZV@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awSGBdS1AiFhJzZV@arm.com>

On Mon, Nov 23, 2026 at 06:29:25PM +0000, Catalin Marinas wrote:

> > Exposing struct page to places that just want a kernel addr means they
> > have to call page_address and we are back to the highmem weirdness.
> 
> dma-buf system heap needs struct page for scatterlist, so we need the
> virt_to_page() conversion if we return a VA.

Yeah, but if that is a one off I'd give it is own API..

> > > Was there a caller you had in mind that needs the common allocator to
> > > share less than the whole buddy block?
> > 
> > If we want this it definitely needs to be a void * based API not
> > struct page one though..
> 
> For whole-block sharing, either a VA or a folio works for me. If the
> allocator takes an order, the requested size and the sharing granule are
> both powers of two. Rounding up to the granule already gives a valid
> buddy block size, so there’s no need for a separate shared_size.

But you still will need the allocator to use the struct page metadata
for its own tracking information, so it shouldn't be exposed to the
caller..

Jason
