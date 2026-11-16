Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846529;
	b=wqb4W6wlgtTz4adCbhd9NKNZKyRavj6xidLYEGkhDs9394XUMjoAxpEORjV6DV9Br+z4
	 YpBG8hNt1fI11d+R+x5ZDn+7b+5ygFlw2FPRtx+Y3N9WkX04cMp6zhU2VI+M87E2KDP9N
	 p50vy3fM+JP+OLMccQmX6Jm1lwmsnmkuMFmCcUJMa2CaYPhJ+Tkr6HncklQo42n5nlNqI
	 jktvPUkaCrfsjlGXIpO8ATJhbOtqOOy70V7A7pDAnCb/thEDpKbkdr/IwsxhQ/NRVNi+L
	 hUufiIPgff9wW7aCLe7DokVwqI5hV4aH0JgHzGjdzrJOVwONNVu1z8ZuCbrXmJsRQaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846529;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=eqhrbr8iKieSrVR0UuN7fPro2ug2CEul2vf55oUadPY=;
	b=tHTsuId+8YC0IX4Er9iXPwUyxxWj93NKjfnQEzqYm53ptm8UVoFAD/L+XSKwiM+EF2U9
	 YTfHnHHlOmnzupYrIva7huVHtHmpC5Kuie2/tzfhkA2euY58POAhScrbOlgI7KZ9X0uad
	 nzwYn2pWmt1R/R5wyvffY8Sp9D1XVIA/0kAtfPYeuaL4Cn7941MX6dA9FD45AeAAIK0Mt
	 iVQ9Wvyufr9OBfyRkmdjZtx5o+EZYOjkqenGDM3LFGh3OuRcKyaL6t7Xd4B7/srRQ2z8h
	 dzQXedwzovzTzfwlC0NaxA3KAOEeA1F1G3XO5e6CQxPn+CqSyrOy3nKBYHTlBN7GqTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="ucu/USF5";
	arc=none smtp.remote-ip=95.215.58.118
Received: from mta1.migadu.com (out-118.mta1.migadu.com [95.215.58.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F250606A883
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F250606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ucu/USF5
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eqhrbr8iKieSrVR0UuN7fPro2ug2CEul2vf55oUadPY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794846526; v=1; x=1795451326;
 b=ucu/USF5L6j3xx8be3/FBm299AV+a47dsd2tH64gH3jq95m+jjGg9LGcprLI3q9oULItOeUt
 Qc39SLVTcnghWOkNSUl1uK3rrukH4CmW9GJc+FCrCro7iw4B6m6d8S+12zKFL1B779157/6jKvP
 9pjfCsJg5MA9gmWzf/d3q6RY=
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0358fb73c5d122f4;
	Mon, 16 Nov 2026 16:28:46 +0000
X-Mizu-Trace-ID: 0358fb73c5d122f4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso9770e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF4mbTOfdWWHmaxxWXBS5jy9D3xRadimcdWZlTt7QotOdaQPuFuhIFjgokegErzNE+9igbhE7+bEvaAEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8LwjxkkWW1puHg8hC7BprFA7b5Bp9QMbUv70dlmQdOKTWh5NL2
	esQcIdPDYpUoqh4Uf0TSCoprb7sR9f4zeVoBoQolTtXFunD8z5U4QBj9d6GdHJU4NqT9GrkGblH
	1+5gJMFvwrrN4Y+62qbXZJgPmygQvOtqwjEh6xdgh
X-Received: by 2002:a05:6512:1290:b0:5c1:5209:5a44 with SMTP id
 2adb3069b0e04-5c17d8cd72fmr248826e87.4.1794846521147; Mon, 16 Nov 2026
 08:28:41 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-3-aneesh.kumar@kernel.org> <CA+EHjTw7QzzkQYKV3jyvW5mqZQMenTfm=kus9i87tYqACDOv0Q@mail.gmail.com>
 <yq5ah5hgyj1p.fsf@kernel.org> <20261116140259.GL2532299@ziepe.ca>
In-Reply-To: <20261116140259.GL2532299@ziepe.ca>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:28:04 +0000
X-Gmail-Original-Message-ID: <CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com>
X-Gm-Features: AclHuK8v9DG_RUNyj3rKA0Y0tmAlsYWqFzMKzPZz5wl1VueI09Ml-h3rn0SbMmg
Message-ID: <CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com>
Subject: Re: [PATCH v10 02/13] mm: Zero memory during shared memory transitions
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Radu Rendec <radu@rendec.net>, 
	"T.J. Mercier" <tjmercier@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, 
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jason, Aneesh,

On Mon, 16 Nov 2026 14:02:59 +0000, Jason Gunthorpe <jgg@ziepe.ca> wrote:
[...]
> Just like you are wrapping set_memory_decrypted() in an allocator API
> the user that wants to have the no-change sharing needs its own
> special API too.

That works. A separate API can cover no-change sharing when a user
needs it, so I'm fine with set_memory_decrypted() zeroing.

Aneesh, the pKVM hunk does need cache maintenance after the memset(),
which I have in the Cc: stable patch I posted earlier today [1].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261116110549.1863653-1-fuad.tabba@linux.dev/

On Mon, 16 Nov 2026 at 14:03, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 16, 2026 at 07:28:42PM +0530, Aneesh Kumar K.V wrote:
> > Fuad Tabba <fuad.tabba@linux.dev> writes:
> >
> > > Hi Aneesh,
> > >
> > > On Mon, 16 Nov 2026 at 09:12, Aneesh Kumar K.V (Arm)
> > > <aneesh.kumar@kernel.org> wrote:
> > > [...]
> > >> Keep allocations on platforms without memory encryption on the ordinary page
> > >> allocator path so the original GFP constraints, including __GFP_ZERO, remain
> > >> intact. Remove post-transition memset() calls that are now redundant and
> > >> explicitly clear allocations on paths where no transition occurs.
> > >>
> > >> This intentionally makes every private-to-shared transition destructive;
> > >> callers can no longer use set_memory_decrypted() to preserve existing contents.
> > >
> > > pKVM shares memory in place, and a guest has to be able to share
> > > memory it has already set up, as Vincent pointed out [1]. That was one
> > > of the primary reasons for in-place conversion in guest_memfd.
> > >
> > > Cheers,
> > > /fuad
> > >
> > > [1] https://lore.kernel.org/all/avro44jUWOARFzul@google.com/
> >
> >
> > Thanks for catching this. We discussed it before, but I reached the
> > opposite conclusion:
> >
> > https://lore.kernel.org/all/yq5a5wzw2ree.fsf@kernel.org
> >
> > My mistake. How do you suggest we handle this? We want to avoid zeroing
> > pages multiple times with different CoCo configurations. For example, to
> > allocate a zeroed page, we currently do:
> >
> > alloc_pages(__GFP_ZERO)
> > set_memory_decrypted()
> > memset(0, PAGE_SIZE)
>
> Just like you are wrapping set_memory_decrypted() in an allocator API
> the user that wants to have the no-change sharing needs its own
> special API too.
>
> Then you can bury a special implementation for pkvm there.
>
> Where is this special user in the kernel anyhow?
>
> Jason
>
