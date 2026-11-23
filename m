Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453039;
	b=Gjcsol+TWW020M1L+rN/F/BUI0oTTzLtBFHjFsYzxMU4mxGiL+BlkVblUem3mQH90yew
	 2HMZwMeqto2vbHqMJ0c36PTbm2i0euoABcweAvvgwdMvs5MbTKuJvO4Ay7VaLC9sJ8ct6
	 18BNUUfTKQbgF0dIT4yInF5K615aPpbESL+8vzAQvciBjj+o5rPKiuOFe85/71BFmdSJN
	 WsBYNQeD5YC97YnukYuktEmRSAC3tSvcfJ/nKDkxGo73IeFazueV2Scwr/A0bYd3iwwBS
	 bw+9ie5DfUazCk0XlVudvPLLoG5M5i7XJ98eSyjfLx3Hnqce/4TFmwNIjHgqo44PD9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
	b=CtD2TR70xuZfBC+LC4yrRnWai8M63z19lmv2DLUQtvh98VQ4Hzw2CxNg6bKz+PCeoq1x
	 N6LaMtQnpIfZbGi9EtLPNzilD1UsJ3ffzrosf6u3qjOaJKDLJ2p66DmDOC+9OiSzD3ir/
	 0OZih9s+ToVNnSEBE7cwvnbn/BlxjjlWvMPK+1H6Y8lDMRpsccgWZfAPB6MhPQCU4P/wB
	 jpRWDbtnxG2tHahGn3rCcYaLo1Ndb5bH20ch/n7G8aIP69soeAaUXGKW3mgxTlUkGH0wp
	 yFWf978PPZ2Fup8p+eMzxUIom13fI8ubfDlWVAIaO2FGSwPCo3nLL1XVT1and2DIaHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=M0q5ij1L;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6E606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 16:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F6E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=M0q5ij1L
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-949dcf80821so134619585a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795453037; x=1796057837; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
        b=M0q5ij1LhLu1pt/WBsCTfGk2pgdeixAIFRjKrLvHL/TTIbhR0zt6Py+dVE/jZCi574
         A8p5TyscgxlbeCsN2akPCKF/4Um0svMxtMatqEPC/2EBpqTcJeSfimdHF7dS8Kn/NmhR
         fPcup6GYHWoAJR5DTrkXCJUmy0m0UkqFuQbOrzCu00RVDCiRq1oTKMQMxk38soR4095I
         p8ph6lOgLEJtA4VE9QO8AtZnh3D9Rp+2YCN94vxecamNCBtfMhYrqMY/8OzDajFYcYL5
         RMMotB/CqaFXeKYlXBaMAaqAxQjbgnQ7b+ojHvRq3DU6MG2WDLWnc5aQbE129lDGEHax
         NPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453037; x=1796057837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
        b=v527//C1YPsKHJAe4GDYeTmEnLsudAdpxUvd5rstXNkZSGfic4b2HQYw8oqW+EEwOq
         KIeMHM8J9b6kAMqpYF7PUzBeeiviNkQwO6Hdgz32lauhaY1UcuIMXyppHx9xAJsbWC5q
         wSeCcfWhV4wI6b7S6aZzY9S9eLbP61JKUkfNeLFRdvRvglyZ5ECYEqK9UTRgFH4/6SfY
         OEOOatU6oo2qxjXR++1lFC4e07mZpcp+jmOD+va9LaLTXJVudjCIMK/bsSzPCoEGJ18w
         r1F2VVU6FFlm/7sX6w5qQp+iI6/a5JUUaXMf9s8I6MQ14jjkerriHR/p0FOS38LzfchJ
         lAgw==
X-Forwarded-Encrypted: i=1; AL+hErG8PXaJVytlutN1Hbb8ZJe4e5Es6f1/RkKHOvtEK5bPgX2aWp6nPrJZIpCP/lRy97VnincTHRZFgi2uQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DN9oZ/r1I+mZR3pDCEZO3qRruHtZIe/rC0ux6PMG6GGBgMWcz
	e9ZBrbWPCBDJ3fi9V8aofRzr+TTnABUn/8e5ClvwpjEURhOFylbfTWqNZhwlK/TVhXw=
X-Gm-Gg: AZFdTZfpG9/ZLF+WIfQsmes4g+h5lshKhxNkMsViqZlvxQKM/RGnE5Rc70+7S38LEMv
	lIL41FABNSfepkxo383t/wjqEboBV4DSlGRaEB4hnXg08xiYjwOZJhPDAyucnYr7ldMNMu4L9L0
	bTMb4u5MlN2ZcEhBEflgjcBbeY3pn/mp86m8NB+LEG7boFY/dIJoTUev2ovlpeGkEu0As0nsEFs
	fvoCX4gUlH74DzvVjT1oomS+fXVH7q8hqPCXheeDmkswfpTc5rPNdKBDNMq44hfrK/lNRxFhMea
	sHzvA41KzNZcueB480g9bwpqwN2V+kAICOHV4DigFP2pic5TE6R7qvOETDPUgl4RkwlTgRBWLta
	b9VMfmydas0QwCSajhfgImvJSZv8yyDrA39U7EDk9vrZKDLowub0n3X4GPOhZfmY82lICtDNY3R
	golyAuAEJ2xzAt0Fg+jyZFeoxVu16zCNsUYVWm2lFaPSAIOeJ+BpYtiJcYZd8HnrFhzhi0U+8Gw
	5Oq53IpDAUWibiItYYwWzT9KAoe8bpTk1mj3fP4q+SBQiUrvyHB5qBjHtLTvuAOfor5RRHV6g6e
	UFULovJ23qaH7/s0Q2ZYxEhEjW/wRLaMN5eVuKXPmVMz57fu/4vpFZIHOI/VqDyTgcSoxXtZIXn
	i0kOTWLjtXfBNbXhy9ErJcVAT
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr1950593985a.77.1795453037117;
        Mon, 23 Nov 2026 08:57:17 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031601sm844162485a.6.2026.11.23.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVXLw-00000000woc-0Jy7;
	Mon, 23 Nov 2026 12:57:16 -0400
Date: Mon, 23 Nov 2026 12:57:16 -0400
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
Message-ID: <20261123165716.GM179082@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
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
In-Reply-To: <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>

On Mon, Nov 23, 2026 at 02:36:46PM +0100, Christian König wrote:
> On 11/20/26 06:55, Alistair Popple wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > The SGT (Scatter Gather Table) DMA mapping type represents the existing
> > sg_table/scatterlist based DMA mapping. For now it continues to use a
> > sg_table for map/unmap, but this will allow a future patch series to
> > convert to using a different data structure for importers without having
> > to convert all at once.
> 
> I strongly think we shouldn't have an SGT mapping type in the new DMA-buf mapping API.
> 
> Instead we should have something like either an array or an xarray
> of DMA addresses.

My plan was always to get there, but I don't think it is reasonable to
start there? There are too many places all over the place that are
just hardwired to do SGT right now.

Part of the design of this series was to allow the conversion away
from SGT to be done incrementally without breaking compatibility.

So it is effectively this:

> The framework should then either connect the SGT directly if both
> importer and export are using the "classic" interface 

And this:

> or convert
> from DMA-addr array to SGT and back if either of them are using this
> new interface.

Is something I imagined as a followup series.

As this is actually quite complicated and needs discussion exactly
what it will look like.

Jason
