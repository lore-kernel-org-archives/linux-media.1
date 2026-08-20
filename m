Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3F437F00C;
	Thu, 20 Aug 2026 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247266; cv=none; b=ZYTeq1xF3zF1Uc1q/TcaRfEWNyo+i5zI+AaEa+Ob99b9bAE3mrKifDbWg8LglkWLNr6C9mNwLYQ2RQYpeRTqarsfDBQaeX9XzWQW/6y5Vg6lLUDkXEKXlxpfmNQWjH/fk9ejZ7h0b3h8eD2ZmHwz+4c39wxlvp92vpQf7MyzEP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247266; c=relaxed/simple;
	bh=6d6trshcrhxKprGt8zElAF+25dO3pSF+3PnYMjOG1Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2rskfRuVVFAKacD4j2yOD994iiDNa+ZM9HL1wwKxXS+7sTyEa6xlkvlsQPWBk6O1YmzbQBt8O+N+xRUhCkUA5JhbSAf597YXUt1WffuUFJRuDWMGbkCnyR0isVooMAPtSBPoqil9ZP0Hv6XnHstblSzLLZz7aGX87UOlhGE6JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sxFv9IFT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sxFv9IFT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B8F0153B;
	Thu, 20 Aug 2026 10:34:20 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 572343F763;
	Thu, 20 Aug 2026 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787247263; bh=6d6trshcrhxKprGt8zElAF+25dO3pSF+3PnYMjOG1Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxFv9IFTYkN8Xo1ymDdk2vtFJhiuGmQoQ157j2zvBhiI90N/E4mEHbkJRLpQWAsAK
	 dS4Lm1AjLN/91wNStVmRGf6h0/geeaqGVlhxsrmWC0yj1v+h+5Ms/F4Rc6Roeoy24e
	 lid5+NmZ0RNTNXX6NoYhH1Iow72w5iIdD3alcqk0=
Date: Thu, 20 Aug 2026 18:34:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Steven Price <steven.price@arm.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH 0/2] Clear shared pages after private-to-shared conversion
Message-ID: <aoc6mkzdqtqigv3n@arm.com>
References: <20260820105026.53208-1-steven.price@arm.com>
 <20260820122048.GB18100@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820122048.GB18100@ziepe.ca>

On Thu, Aug 20, 2026 at 09:20:48AM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 20, 2026 at 11:50:23AM +0100, Steven Price wrote:
> > Arm CCA includes "Memory Encryption Contexts" (MEC) which allows the
> > private and shared data accessible to a guest to have different memory
> > encryption keys. Consequently when converting memory to shared, the
> > memory encryption key used to access the physical page will change.
> > 
> > Both the GICv3 ITS driver and the system_cc_shared dma-buf heap
> > currently allocate memory with __GFP_ZERO and then decrypt it. With MEC
> > the zeroing is done with the wrong encryption key and the data visible
> > after decryption may be ciphertext. The RMM is required to scrub the
> > data, but may perform this scrub with a different encryption key to the
> > eventual key that will be used for shared access.
> > 
> > Fix these two sites by avoiding the __GFP_ZERO during the allocation and
> > performing a clear_pages() call after the decryption.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> This whole set_memory_decrypted() API is awful. It really should be improved.
> 
> alloc_pages_decrypted() ?

At some point I suggested GFP_DECRYPTED but if we don't want to
interfere with the slab allocator, an alloc_pages_decrypted() would do:

https://lore.kernel.org/all/ZmNJdSxSz-sYpVgI@arm.com/

And we had a vmalloc_decrypted() proposal as well that paves the way for
decrupted pages. I forgot what we concluded:

https://lore.kernel.org/all/20260521205834.1012925-1-kameroncarr@linux.microsoft.com/

Actually, this last series had a lot back and forth around __GFP_ZERO
that's relevant to this series.

I'll comment on v2, I see it posted already.

-- 
Catalin
