Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528842;
	b=mu3964oho4559jKTIyGF28x9aFrjbnLHoD1irAmZKA7pNInrPCtHAUM5YMUvmLxRbip2
	 jAuPz8CNDYGLHI6CuiUMdTVXpfdsvj5/zBnNpO9PPsNOIqLHtt05t3CrkCH9GzUspYl8Q
	 5+3z5//qZVvrm+egSpHlnQgrNvzgzdG3aAO4+XV3gINa9Ev/TgERSuuf8ZYUPO33oH/Bx
	 ADVn61fkInNzFbxkIcrk6TJ+bgqGuv/ygtfWrti5IG7nlTV2GaryhahEUNrbERFcj9XUu
	 yMR8NyvJjsSu2UZwL1Gpkjt8XHM/xeEPdRSUzepIt+HP3CXreVDWj4DX4e3F5zqQSBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
	b=BcLVuLiHSIDvqbPcT1w8nOzN7cB/5mGeaZJ8p7+eruaYBmb/oS0hJDlRZ61p7mEO2CXc
	 dB/VM65h+3tkW4BzThx5RVgTwJHztb7KVY/y8DPlCNDvOPGU/cjy0Qd3uRCgGd7+d+MRy
	 s/3OuRbaNjyhXJHwLSvzDTcHlNPF9RHwwpVZ1Q2QHd+oRlN3/76P0ATO3QgXGhiTZw08D
	 kRwYRmx5/ufzAZ/WCMZMc6TgWLUnpEI2Ry/nwW5mDwpd3QfYUVo+HpIQDYc8jZcSy3vih
	 XQWTjJS6Sehu+tgj1CmKA7zzsKQbLVMFq033nMklehtzhTT/FqF1w58AJIF9V/EGIeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=V30Q+iur;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E985B606A326
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 14:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E985B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=V30Q+iur
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50933bdf4bso902231466b.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795528840; x=1796133640; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
        b=V30Q+iurO56H29PrX9q7wVWHAj934LHyh9dyaSa8KHPs1wYEL79KlkRZ8Ndk67ZYFP
         8Moy2ZuuvXyGxj6hxEU5MHXoHu4tO+Fkx1FOmb3i6VmcSl2yRSR7ozCFXelACXZQQdpH
         73eeCdMmnAdK5bgaPJM2yLbbq+7EGbpzKQXhHQ+LiUd9gwn3Zcp08lnZgZpi+N/nP0qn
         CCEUWkIh7w7v7yFw7Ka90+w4XwePfoZZMNmE95Z67q//yab58k2vPq4mUMHNrX/ny0rT
         lztbpD17efmc4Yo1kTZgqTWxQyLSdMFoAnYsApctQXm4VrrSm5WoZqx2pG7gjDZXr6oU
         zvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528840; x=1796133640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
        b=PeEIuJBuM0iq8vZ7J++SW7Y+rzxP0e2rlsa9BeaF4/PO4AFH0TnBx49YQqV5n8kwPj
         ArJlb0IAZusScV/S61e3o0mpD/BcWVi6kuMGi7zoIPsuZe71lMkuxx8l/1d56BR5qYkT
         4Algs7X14Mc8Df3asWLXs3h1NvW2QnrrKOlb6oJYGYn+BmHsGZgYe/hfQo/O1T+8lrdN
         tY+0wz3U3y1siNR/cmB4gs2UF59oT8KMSGPCbLCjc9W7ZLqYyNsVpeb6MiDUm4IS/FgP
         jkb/tRJ8f+aTW8yx+L8QceAACxhAtv+ASRU8P3xcIosZTaLRH9POnL2ieZWkD6OQz3pG
         VVsw==
X-Forwarded-Encrypted: i=1; AL+hErFnU8sWLl55J9ltMJ7KXJDkGUyH/YPQXN0IxaUnVe0O0/Rmt+xI0NrKa95mOsdNXssi2BNlQH1LUBBqIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+IXJsi3tsrULgwAKkkQeRi/0SOQF9kPtHgPwQ5QPTzxBY0xGHX
	Yt+wNIvF5xYSZI2GaOLJGQ4umYSANpEoPu57sWkAJs7NUHkT4c5ltevOgByiiUNrCaA=
X-Gm-Gg: AZFdTZelfJtfKRXsOwskkXUop4qFcTOI/IlXS8b4WCUD8nTgRYmJRd6+iVyC5Kop3hh
	8ohsjs1yiUnjfQowqK4dVVrEhqug9riz3tIRGNVVdbzk91JEi/kx50MM4AKtAU/xWmDczwPVZf3
	pEazSW+ST+sNxcc28uc/ZjihKHdjlTLnpr1QyHcAb72imFCkI24+EHJbf/kSPIBxQrwemin5D2r
	UrxFAlVyPn7GOnJjm4kDtOMjX5XbS8BmSRSeTExZpUxDnk4B+rYp3pxvcibmIUKTfjSmFq89hTp
	rWLQ4gVBIanvmunlGjLZuM1hQH8CRkNkLC9LThyXtN4QTbCQ90oHU5o9/T1jFDiR1UTvfQ3gZ1q
	FeGZJUpUxbVo6YwKdhkcXTX/GmWYXkrxyjAGVZOmpRG3Xl8Gt4hNlWIoKeLDHE6HtLl6Q0ZF/ro
	Abpu5BOHmXrQwlYKFej4zbk6FrMLLr1XNWDG0PUwPFUkCMhTkTpJiYX+82OU+qGfTxJqrznZNSJ
	nSdYwsj+GwAFZSmqf3UKZdq5MsTFMTanEWN82AtcaMVYY8Nmm1rFegQPxA1J2wBHgZfMsmx/rHR
	Adhpxg==
X-Received: by 2002:a17:907:3e86:b0:c36:777f:824c with SMTP id a640c23a62f3a-c51315851d7mr1405271066b.4.1795528839874;
        Tue, 24 Nov 2026 06:00:39 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm6492195a12.13.2026.11.24.06.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:00:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVr4W-00000000QnE-3MAi;
	Tue, 24 Nov 2026 10:00:36 -0400
Date: Tue, 24 Nov 2026 10:00:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com,
	treding@nvidia.com, jhubbard@nvidia.com, chaitanyak@nvidia.com,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v3 03/24] dma-buf: Add the SGT DMA mapping type
Message-ID: <20261124140036.GM9566@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
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
In-Reply-To: <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>

On Mon, Nov 23, 2026 at 07:37:41PM +0100, Christian König wrote:
> > Part of the design of this series was to allow the conversion away
> > from SGT to be done incrementally without breaking compatibility.
> 
> Do you know the joke from the hitchhikers guide to the galaxy where
> the dolphins are happy for exactly the same reasons?
> 
> I'm pushing against this plan for exactly the same reason because I
> think it will make the conversation away from SGT even more
> problematic than it already is.

I think it is well proven that trying to do big bang conversions in
software doesn't work well. :(
 
> > So it is effectively this:
> > 
> >> The framework should then either connect the SGT directly if both
> >> importer and export are using the "classic" interface 
> 
> Yeah but that should not be a separate mapping type, it's rather
> that we just convert back and forth from DMA addresses to SGT for
> compatibility reasons.

The mapping type is to support ualink/etc that don't do "DMA".

Only DMA API can create dma_addr_t's, you can't reuse those types for
something else.

And you still need a scheme to negotiate exactly what kind of
connection you need. Focusing on the SGT is missing the big picture of
why this was organized like this.

> > As this is actually quite complicated and needs discussion exactly
> > what it will look like.
> 
> Actually that is the easy step I think because quite a lot of
> drivers already convert the SGT to a DMA addr array outside of the
> DMA-buf framework anyway.

Given the importer an array is not so bad. Getting the sgt out of the
importer will be a debate.

Jason
