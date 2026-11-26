Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710700;
	b=0batFNcBtwUj6jtP5EcxwOTQJY4udslsu4jYwXIlDEiohj/FPCID46WX9iLUgqfZf8D1
	 4w0Cm64U/X4QbaeUN56EdvuscDCKhOnYVrBxjyufyahozWktFtJyUvUfsNBaFliFUztVB
	 +MlnWbMEj2XswX7FKaL1sL3k3TL//pR61rn+eK4gPc2KKrSf5XGfySQyK89RZrEAQi1un
	 rQBXp5zasK7IQc39ZM6nLcTJCmP0BMBbm780GyWocBjcOc8zTlPjNSkGuUSY7OJ5m2l1S
	 dzi8Uy14G1bo4wWU2o5XaAm8v2/TyDCKYqu5tP2keI62YAJ3gI4d3AbMEykV758DLUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mKMGXbvF/sfX9s9vl5jaq/5p/tKCIj66clg+e7onQEc=;
	b=0lms9kYE1fwfUpOcsDy3z9T292Erh4FK1Y+cobSzsYuw48TvKLGf5W9MXOQYoTj0DZLQ
	 9VH27TLNUOy2kJrm8MJayNVkTur208AvZj6UI1hnxR6R5yB8MhPWRaegG18dg/UU3DRyH
	 MMNsZGUZpCJHuTuJmFEYuHEtVvLt2eKxdPURlOQFL6L6l/ZNwGGS9QbrBTfF2UThrngBw
	 xt81tcAyMnu5FKzGJvuS8MnVegYjZOSlJOjgTyJ1NdK9G2KmgVikWVlUt84JoZSPsA1l9
	 DaKJTBMWsxAWQqWYC+D0N3yds63/juZbKw5uEW/PqWIZkbORlfMFI310nE+cMnN0P4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mAA7XOzm;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56688606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 16:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56688606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mAA7XOzm
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67c0bd676eeso5085034d50.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795710699; x=1796315499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mKMGXbvF/sfX9s9vl5jaq/5p/tKCIj66clg+e7onQEc=;
        b=mAA7XOzm4ooCRVLkWm1vyqEs90jtrmQ5RLrClIv7UTeNG6VGuaK8xf+RZKFZJgtqoq
         SxwGt9IDVDfzg1AVeFrJ7kl56uujHLr/J8TtCc53pQFQV51xKwsNAAiLBlR/6Ubh8lPT
         jw2GxaHg4WDO9FxXlj16HttZg0fzEirSb86SzUmZRrb5pOhtTrQqqlHKNg03Zm5S4taF
         ySE2fgM5UBBgBTwSNLIsjlsS0MUbkNJJna/LPTB5tG1w6f7OfN+9p//xg6znRZWTupHg
         l0/1u2FmCZmH0QyS2AuQCE8eV9PN+DAF9PMbvmfKGG9v6mu64Ae6dLeA+y9f3knmqwzL
         dVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710699; x=1796315499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKMGXbvF/sfX9s9vl5jaq/5p/tKCIj66clg+e7onQEc=;
        b=kiLCQjytxGSqctWcDB5D01xb2Oos7iliLXNG6BaFJeMKJlWikmYHX4xCux/8MHwWzR
         lhsAUSVQJ0DpPxjFr6UeOH9HC/bV4jERxhRwmdzGRvNEyD/OiaYPebQ1gUHaoOgjmAZr
         1hCybCYwBtKJTfV1tYmpJbEOZYTniyhOWLHunI/PkVdvoeJ5H3EdMyIi5/Q5JQfTmhY6
         ffebaTXcLabcdDmfk4xEwhsuPjkz10ragSJQhv17lPkmT4TOAb0qBozTGsgGST26fuzn
         fJxwEBjjKiaMysqtjAALylkAEB1Q+0hK7UnFm45sPW2D2s2Bu4NIF+gSulSS+JA6Z8f6
         412w==
X-Forwarded-Encrypted: i=1; AL+hErGSb8pn25ctlCMTXY9sjayS9xX97yZh1GWFvoblzockW7CyUIQzYPTOwU5+zj36O92TseGl6mvlpFXg0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rmddMGji5xKXNk6C4enYSW1/7g0ozvhzH7Hhd+XG+yqDZao0R
	/5STatnPXH38oFwycIM6LvMP7J+16oiZcAv0mXDirLxK5cKQT5fYFsOhfDsMZdx5epg=
X-Gm-Gg: AZFdTZfqhryxWL1eWZN60plOGKSDvE1BByP3tJmFMYa6gdF5k1IZcSx1nVZa2S4rSAg
	hz2IrfOmU8TTQPI7jxP10igs7ca8opRSHaWAaG3EQwiumx3zGA7k0EkGu3xswpy7ameMuofsKd0
	xhZnK1bUz9KJqts5H7RZd/DMYksI5S4oTv67cdOB29MOtRp2olOf07vb1OPmqow4Wu5MavLPKv5
	lAbUgRsDZkFqOH9thLpM08M771xuFit3RLWz7pGu0v6anksy7sd83/ueMnHQLf/99sLGVUfNCwL
	DgQz1nANqxBAXxsfu8ZzVbu7aAIlqNliCt2H4aqTgvHI5fbapkX4mtWO3EorVzQGeEv7RavuMpm
	If/4OHNcHs+sFXoj0NM7KkOtBWt1MdY7HoY7h3AElL8eSOHwy/ddBHaH/nOKDIfouivTFe/sBl9
	/bbIJjSC4ZlPTi38wWD8r2O1UfJ9M4e1ILUoE/4LgbyFHK4U4AE9137S3wZd1YOGPa+I3WRkHiL
	brhnyO1AEOGraM2FSP7tj9927GGczGollQB2Znp8n/KdInjx9CyVbI96it2CUp3i4JuuUFf8quu
	e3l1hA==
X-Received: by 2002:a05:690e:13cb:b0:66f:c1be:a64f with SMTP id 956f58d0204a3-67df4444c30mr10219064d50.65.1795710699306;
        Thu, 26 Nov 2026 08:31:39 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a15b99sm192865986d6.38.2026.11.26.08.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:31:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWcNl-00000004WQW-3ltS;
	Thu, 26 Nov 2026 12:31:37 -0400
Date: Thu, 26 Nov 2026 12:31:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
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
Message-ID: <20261126163137.GQ246011@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-5-aneesh.kumar@kernel.org>
 <awQd81MwZqi55gf8@arm.com>
 <yq5aa4mybbmv.fsf@kernel.org>
 <20261124134621.GI9566@ziepe.ca>
 <awhVoDXluqpncgcd@arm.com>
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
In-Reply-To: <awhVoDXluqpncgcd@arm.com>

On Thu, Nov 26, 2026 at 03:52:00PM +0000, Catalin Marinas wrote:
> On Tue, Nov 24, 2026 at 09:46:21AM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 24, 2026 at 07:00:00PM +0530, Aneesh Kumar K.V wrote:
> > 
> > > Taking Jason's feedback into account, we could have the allocator
> > > request compound pages and recover the actual allocation order with
> > > compound_order(). That would avoid passing an order to free:
> > > 
> > > void *alloc_cc_shared_node(int nid, gfp_t gfp, unsigned int order);
> > > void *alloc_cc_shared(gfp_t gfp, unsigned int order);
> > > void free_cc_shared(void *addr);
> > 
> > It probably shouldn't be order here, that is hard to use. Just size_t
> > len
> > 
> > And round up internally
> 
> Minor point in favour of keeping the '_pages' naming and order is that
> it makes it more obvious what alignment is returned for code that needs
> it like the ITS. Otherwise we can just document it, I don't have a
> strong opinion either way (only that it's simpler than what was proposed
> earlier).

All our allocators return things aligned to their size, does ITS need
higher alignment than that?

Jason
