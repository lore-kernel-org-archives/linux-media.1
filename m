Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835376;
	b=ytjuNsUFAYUk0l1JFYb5a5A6G0WQDWQwqjy/fA2AQPOAj9fzF+kxN9xyKXbdnzPW5rJD
	 bS9xZ6oDaiG49Yzwn4Ae/iYraMJB6O3Dm+qrHOWd15FHod3HEBSjqOypcb2L5y2NGmB9J
	 3CTGnqhfgAsBAOZwyI6KBMREAQ1F7+V8CYYHHh1cKbtn6ARHQNdZXAEwRyVYSiOSN/CJh
	 fx0zZy0JjMRDNDAy0xGXUTM6u7lp/I6PNtYZeCzmhD5JEuph7eUPIr5wRm1OPe2C//muz
	 a3EBviJi80uQ8v5gvEyf771xeIWRoandjbOYL2sdJtQBKXeyraVey1mYpT2CDk5ZI8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Ip0og70Tt8f+28eOZ5F6oTc6DjrtMrQ1wymW+Uokrdw=;
	b=jv1xvA/jQdU493vFs3bHFcXyBTiPP0XvbxTPFsdloQPdQPpr79NLH3Pisr96DifJQmL7
	 Jx+NTDnRfiinSRhjdhiXS9HdiZxzZgNDp4b9AC4+3HtDjeJqGATW7K1Y57nkiaxrOyHgZ
	 40Y8SHv5djQG0kpTT4urqvo3YXzv4+8MEfVfwlBzrqNlNpesa7NXS2T4LFERC+D3HqeBU
	 ryjVRDPT5Zwh7coEWngov5XRz3kBl13Ia7C3g9MoCb1vWiHyehJNDB6xnokqSl1+VjDLV
	 rtuy7ycP0IsE56Ign7a7uIYnRkpIFsSK5HrBAOiI/C/CVN666Sn8sSbFSB5tMfk4V3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YncDRgrI;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E734606A32C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 13:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E734606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YncDRgrI
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ecbdf5343so56910276d6.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 05:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794835375; x=1795440175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ip0og70Tt8f+28eOZ5F6oTc6DjrtMrQ1wymW+Uokrdw=;
        b=YncDRgrIS4sDvp/lXZEV+1uTnJ5sm909nERAkFgNzixv9GWUpigEGN2kHVFp91srki
         rnN1ZUqF6tJwwfnK+BEDJcYZ/Yj6gv6f3OSmTp9cJbjw/7dL7E2pChys2gzZwldkD6QV
         Y/fcw57iYoax8wV0TfHemCWb0Wgp4bijyRm8nqi8rqJi2ZY0ncSGM2iyphdw6Cd6wb6Q
         joNPcvAcfGo0IUnV2wGw0SUHy7ABOkU5MlGheUl2DUDQb6KcoPiwTjlAgB7HQq28FJ4D
         qgEQNeV2fxv6eWM+/xQbgRFHgJpyzrReqrr1wDVLVRlBAz+HjrITbebvHMtuhj5pEpjk
         OlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835375; x=1795440175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ip0og70Tt8f+28eOZ5F6oTc6DjrtMrQ1wymW+Uokrdw=;
        b=mdIjDuULSYnr2zM+nUvK1sbZx3DG90Rf0UIEIQn5tO8u6wBWlkC51amkG5vvluLEcw
         s4snLspqUc2YAY6rF+b+7P+/EAagBzJsgIScNvvGNUI52CKW1tAQHOV+i7h8y/I46374
         XyzP1H4e14fV44OBBZmmMtMTpEB2dviS4xUvDTZIaqhHukw06xxFfa1EGHy/lDw3nd6k
         WuckVykox17xlkcJ5FiM2J8o7eRQh6eFIfh2ShIKEbhdBCrqfQgxDs6TEGCaGHIwAB6q
         RZRPZbOk6isB9XGIxXYLXnKPpjNXMjJNX08szm/SQ/hP8CqLoFq/l0C779RwRku+RXur
         j0Vw==
X-Forwarded-Encrypted: i=1; AL+hErGsTKB8LtUrPwDzcKBPgIdOsKwxkzVryeWTrS+oHyaE2EjRbZBvX+JzKp0DVVicdPxjDadmF/lVy18Cwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8KkJOM2DT7QNE3d1VJqbW57DgATmsn1Aqc3NMmHr5zi16SY+ne
	JVFSF2ehNKGnUQZQ+A7ib0W+b2mx+1vXj+EiSUgQ6WKLEc48o3Yl/4QoU12xCQ8D4K0=
X-Gm-Gg: AYBFou3QTuki9iNuYrCVInrcQy8X0xXePnrsmyT45pGgIWCM/Fd+NkfD2G+SmgPQBtT
	ApzFGYdUcUr+yxTL4oRoDTsYIfZfEQ+UvYFNNm/DCFl3W/H1Z5t8BkAbKCnA5S/qblDh5jXnX6Y
	HgcG8nBveG4qDQEERGtacHX7CL1cK6h8FaJhZqiIWn/i8N44kSm9yx5KhcGFlAw4/F7o6pWOd7r
	DBwldbpsKlkJZTv9PKl8TYgNi72qk6zf3Tq0ZVEisTL01BrnDMDPGpgJK+WBRxl38WT8K8PVVXp
	aur21x7YPHiFR/nOsTvaAF6jbMc3nnf/Qw0dnMcjLIWkF5nHNJ1/ayjEAmzW9OpSQjL+oduyly9
	ndjEAw0kVqIWiVrwWCVfjp9NF9UNKeC1L2JIg7mqSj02tMLlx/k6LaIqUt8D4F4OmlW+RtkV5St
	W8yb+X84QFOX2rlb0u3Ix1qwCnzpbLmtyMnZ6wX+Oif1aShNtAOk6rlrDBxPlSjgNBJda1KQI+o
	Bz3FSUG0BO5OIdgdeuY2WyqoVkeFMF9mbcNmizum6IJG+dbyBUrSr07F+ipUXVQgQVux2+188N8
	12B9sQ==
X-Received: by 2002:a05:622a:e190:20b0:55b:9d8d:f29e with SMTP id d75a77b69052e-55b9d8df528mr93734571cf.9.1794835373441;
        Mon, 16 Nov 2026 05:22:53 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0f07afesm80824241cf.16.2026.11.16.05.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:22:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSwfb-00000009Kvw-33KL;
	Mon, 16 Nov 2026 09:22:51 -0400
Date: Mon, 16 Nov 2026 09:22:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
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
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev,
	Alexey Kardashevskiy <aik@amd.com>,
	Michael Roth <michael.roth@amd.com>, pankaj.gupta@amd.com
Subject: Re: [PATCH v10 00/13] coco: guest: Add a shared-granule allocator
 for host-shared memory
Message-ID: <20261116132251.GJ2532299@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <0524abf4-2306-4046-aade-c23aa7d1e0e6@arm.com>
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
In-Reply-To: <0524abf4-2306-4046-aade-c23aa7d1e0e6@arm.com>

On Mon, Nov 16, 2026 at 10:09:35AM +0000, Suzuki K Poulose wrote:
> Cc Michael Roth, Alexey, Pankaj Gupta
> 
> On 16/11/2026 09:11, Aneesh Kumar K.V (Arm) wrote:
> > 
> > This series tightens the alignment requirements for buffers that are shared
> > between confidential-computing guests and the host, and adds a common
> > allocator for host-shared memory.
> > 
> > When a guest runs with private memory, buffers shared with the hypervisor
> > are not only accessed by the guest. They are also accessed by the host
> > kernel, and the host may manage the corresponding shared/private state at a
> > granularity larger than the guest page size.
> > 
> > Architectures such as Arm can detect incorrect accesses to Realm physical
> > address space PFNs through GPC faults. However, relying on that as the only
> > line of defence is fragile and can still lead to kernel crashes. The risk
> > is especially visible for shared buffers that are later mmapped into
> > userspace, such as guest_memfd or dma-buf backed allocations. Once
> > userspace can access the mapping, the kernel cannot guarantee that
> > applications will only touch the intended 4K region rather than the whole
> > host page mapped into their address space. Those userspace addresses may
> > also be passed back into the kernel and accessed through the linear map,
> > resulting in a GPC fault.
> 
> IIUC, AMD SEV-SNP also has a similar requirement for other reasons, to
> align the "shared" allocations within a guest (2MB ?, as mentioned by
> David Kaplan at the LPC).
> 
> Michael, Alexey,
> 
> Please could you share your thoughts on this series ?

Yes, I think we concluded at LPC that AMD should use this series with
a 2MB setting rather than try to do their HW assisted smash/unsmash

Jason
