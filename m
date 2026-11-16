Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837786;
	b=LeVDRylQYe4mncniUqYJ/0cSdBl+61s9ZuGku0JulujF4CVEfTN5zME2TKm6s9XxMWON
	 niQngCXSrR2rE4ANXmhBQDVPrb1nRhsZfk2f305jP2La1aos85vYO9dXh35y7lpjr9Am7
	 R9qB6+iwibsrOI6LMkS1/oNsw2/kwHOWTiHEXXij1DOUQX5BcM7abZ468ngC0hgXeq27w
	 sJSfCQ4UUnUW5e4j/wxjBnSkDJ273oUVUzJ1+r6FUpcFKTw27eta0WLh6+qcOyuPL3gAv
	 31kNUaViJOxKYZTV43Vxb2sDKxqTSlcEM5+VNzRp0c/Se2R38yt43oAehEMCYOC8O3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8htNjDuwhthg5uXuXp42Sb+r8eU4x+ykq7/WcmWSjZg=;
	b=JHpU7OUvixYj9XNOoYZKzZubePu3XDN2Ps6y6T7HjVJEES+dhBEQZ6rNxFU1TdAhsIRs
	 yXvIXyGkrKXv47gw04A37tadFmvNEqZTP3RK6Nbszl3LXXQuvOLvq9hy2PVfEUnU9aYT4
	 21/UPO8wNJWJCkufaL/K+2SjuC7HgMNTAbQV6OpjGu3ux7fhJPJu0FADT4saOJ7ojwxzh
	 x+HXf+lqsNZhgKNlSw073dXZm8HmpFfXW3897Zb67DsnX0iYyW7TGrc7Kn+X4W6bvnu57
	 ZITcwAlRv4nC3ew3glt7LcskPXo4C8IMySuI0pUcfsDYGftJgqaMTlYVjHDIeVKkWDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SG17XEez;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D883606A881
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 14:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D883606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SG17XEez
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67990a45e02so3580263d50.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 06:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794837784; x=1795442584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8htNjDuwhthg5uXuXp42Sb+r8eU4x+ykq7/WcmWSjZg=;
        b=SG17XEez5mwjnqi0HbKubbaOfKmbQZY5U4lKa5mROrWt9YtqApdrH4jXpkDm0Pc5M/
         DGnTVldDp4wPhR4hOabFA09ppmuG1TUA/ZPXjIHhXlD9D9twB0onvGMF+5aPNXdX2m1w
         4TWgsS4kB/zVAoZR9X4qv0E8yAO3ECjuKafGWv2xC9FIsV8gyKopXDGnMQuOxeksqu3v
         xPHs4UvRXietpgIwk+OuhmTppUdCrr9b6Svc05RV8YZGp3d19h/SjeDZ3EWLonhVtbKu
         wrOEMafxS/knLA2DRYdzdatk4yvDz7/fZ6lXMuPh7u1eC2h5L+ukqvIkVZlIvZKJsSGA
         HorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837784; x=1795442584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8htNjDuwhthg5uXuXp42Sb+r8eU4x+ykq7/WcmWSjZg=;
        b=Ub+1DsT4y4DbwvQAvj0NrjrkrIOLGtel3vYpNSmLvsDCRoRVXz/fBX1otEHl9Je9IY
         VcbZ0ETUArCcdyfc6YSHxPmwFJKFrXHChcV1v4HNLURHRoPhKVkBXL04Ej+ib9/4CZvv
         bPvH6EO+6wArzt/gf04StAIKkggsKxIdczKX2wWeVbrbuIjj0CduoqsWppqR3Ya4jyN9
         MF7ZzbNMQy376ZRzsSuhPARYVcNVKQjc/EkOZHaSLl3e7xRL6w2pPqdP0g4ne3zrGPFJ
         DN5uNRMANV1jyaADZsZhTR6UZiSOO8RRU22I0wmSRXc5Fyw8GYiKGRvcF5iWX3tdQZCP
         ST8A==
X-Forwarded-Encrypted: i=1; AL+hErEbnTA321ybh7VETNQTC4w+ZhTUcPjPewRxg2yv3AOSfpbX7Txowmih5mJJ3xpaf8ko4O8pjlorV9gAIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hbZS0LxLgjfsmQKe8f1xRXdQ9vlSJls/5XQc/gr/n0qyjyKn1
	OkQjKQ3L4u1de3/Tzy29OuUJEzMaRDSpM0gjJXVmvl1zKYoRf2KrIGNgOwn4nMjjTq1cyT895I6
	8YMY1
X-Gm-Gg: AZFdTZfWrF8wRPA+Z/cIT1j268Z0VPKBrqsGNbra4VecO5/By/T9x+jzfq6BgtOk8nt
	uugrxzxzNHHZKMUhdV9ShIGc9uw+8jVs0+wxV6RA6HXe85EtAnLJGo/f2d+ECUjvxglfGCLjter
	VqfD0IKIAff1Vgz0PoCO+3cViqrpkxOCXtbvG0bjiyL+tv5gvmqTJlXSlo38JSpjGKzaiuRxzol
	Wkqn06hIfEU7J4kXUvawTqfGUXpCYpu1VmsVvrfOTH5L0MUa1hzhwZ2haGZp+AdSbrpJ9r3kPuv
	qqFabwc0DFaUxbIYN5u+xBuSSE/fRBJMRoN4e6XNEnyJuXyIbkiZVDf32hlFzNVn/ejFXAiZrvt
	RESqPLYJqDU4i5gkFzyfpxg74X7QOrxjuFLWMJzhQc1qCXIxmxaf1JzkvGoRghzmlnPlIZ6gLj4
	mmkRwNSGXCPhRRD5ONhwQvNQEdIGQ3YdEMTy0NNzOBH+qxpkNJRJqJAAxdwH2Fgoh34BNMFsJv+
	CCat4der0NcUU7jgssAcuWAy11MYMbaiz8Vazeh+kUf62xWLusTFzSHVoKHYnHXlqQVBxzj/Tha
	FxuCV72THfw2nwd8xYZiYoJJWDE=
X-Received: by 2002:a53:ccc7:0:b0:67b:f935:8639 with SMTP id 956f58d0204a3-67d89787ecdmr4996887d50.63.1794837784278;
        Mon, 16 Nov 2026 06:03:04 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm858426085a.32.2026.11.16.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:03:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSxIR-00000009Q2N-0sq0;
	Mon, 16 Nov 2026 10:02:59 -0400
Date: Mon, 16 Nov 2026 10:02:59 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-coco@lists.linux.dev,
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
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev,
	Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH v10 02/13] mm: Zero memory during shared memory
 transitions
Message-ID: <20261116140259.GL2532299@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-3-aneesh.kumar@kernel.org>
 <CA+EHjTw7QzzkQYKV3jyvW5mqZQMenTfm=kus9i87tYqACDOv0Q@mail.gmail.com>
 <yq5ah5hgyj1p.fsf@kernel.org>
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
In-Reply-To: <yq5ah5hgyj1p.fsf@kernel.org>

On Mon, Nov 16, 2026 at 07:28:42PM +0530, Aneesh Kumar K.V wrote:
> Fuad Tabba <fuad.tabba@linux.dev> writes:
> 
> > Hi Aneesh,
> >
> > On Mon, 16 Nov 2026 at 09:12, Aneesh Kumar K.V (Arm)
> > <aneesh.kumar@kernel.org> wrote:
> > [...]
> >> Keep allocations on platforms without memory encryption on the ordinary page
> >> allocator path so the original GFP constraints, including __GFP_ZERO, remain
> >> intact. Remove post-transition memset() calls that are now redundant and
> >> explicitly clear allocations on paths where no transition occurs.
> >>
> >> This intentionally makes every private-to-shared transition destructive;
> >> callers can no longer use set_memory_decrypted() to preserve existing contents.
> >
> > pKVM shares memory in place, and a guest has to be able to share
> > memory it has already set up, as Vincent pointed out [1]. That was one
> > of the primary reasons for in-place conversion in guest_memfd.
> >
> > Cheers,
> > /fuad
> >
> > [1] https://lore.kernel.org/all/avro44jUWOARFzul@google.com/
> 
> 
> Thanks for catching this. We discussed it before, but I reached the
> opposite conclusion:
> 
> https://lore.kernel.org/all/yq5a5wzw2ree.fsf@kernel.org
> 
> My mistake. How do you suggest we handle this? We want to avoid zeroing
> pages multiple times with different CoCo configurations. For example, to
> allocate a zeroed page, we currently do:
> 
> alloc_pages(__GFP_ZERO)
> set_memory_decrypted()
> memset(0, PAGE_SIZE)

Just like you are wrapping set_memory_decrypted() in an allocator API
the user that wants to have the no-change sharing needs its own
special API too.

Then you can bury a special implementation for pkvm there.

Where is this special user in the kernel anyhow?

Jason
