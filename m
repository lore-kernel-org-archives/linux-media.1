Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633628;
	b=UT94T6Zl16ruNKt8MckGeNX6BXWBrWdh37M4hE06n133SABVfMV+2usuE5NlammT55WR
	 1W7jbTtyjlRKN3gStPewGHZH5O8JjRKZF7hqmjdRKbACQlXeNRyg/iO4hUKfv+DPa051H
	 J1hPU8pQ5S6ME4U5xbuj5/Wpl7v01qI3FSxe8KBHPi+OKexNFTmTslF7L7S0KiKaCvEaD
	 AJmNmzb0SjqHIj5Zp1YXMrREMkDT7mEZDE07rDA5vyxSXudCBdVdHHaCucFmzWkCytftU
	 O7/tDS+i5GtirEKEDu2dTq+NzyLGlQK68GxQaE4NrEwzTyFjpoDZBLyzUc8M2aiWUuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=JisVSgs385NGuntA6erRX4QYHX+VR40SrOV715tgnK0=;
	b=qV3HLMD8n/W2XjSV+Cbh/ZF6eY1ekkaevhKrXWurQ1m3P+AUCz4jMQDcAJbT1SdxE6kL
	 /o/AA/P9nOxDqbsnbrTNhnOaaaGzNvT3TB/uG8bAFm94td0wCqDlHwY6ayOaFFW7rwZVM
	 CrhRNhrUZEd0Q+mvPy1/0+lJhYcM+Y3qfiECecZooWWbAfCxegEeA26LxYbcBMiMB2h4B
	 z8vuWnN7/XWmakOOpOcR8R0aSx5QHV22p5IZOKX0dcWGTrx0FKVbSxtBnQfAsYtsQRBmZ
	 w6oWVCr0s6GDWF9OUbsadRv5jUDtN+cYl8kNzZ3jWxdm0ZR14+rQEAL+XP83MZHIweA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FcYwuSIU;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD4C606A327
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD4C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FcYwuSIU
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9495d543b91so376595685a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795633627; x=1796238427; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JisVSgs385NGuntA6erRX4QYHX+VR40SrOV715tgnK0=;
        b=FcYwuSIUDw5OYWXKXjcI6QMvdjmCHVjCuBBGlVf+WjZpNlD0CSOQhxBMr8usmyz0ed
         rvtoMbTF2eX4vk9Y9h9Nl4g3xiltHQiqgKO2s4RackGmi+H09P7UFu7jXDEMWAJch8Lu
         Bez5vSdqY2qlX/U/yq0a0mho64/iizuPGyUtu1j22nAqTe87sbuUkE5K3s0Y4oVoD3Q2
         3aZUQ7ci3LolsgjUbNvUcckL1dOvbbGYesd0YLqXsnjyEO32+hlSIJbbGPaLcKvqzKfe
         drPhJMtyWdGvDZ8ppj9FApzJK+zHEu9C8REXRTErfSS3i04bujQ5JM7rKTqiYFVsn08k
         dQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633627; x=1796238427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JisVSgs385NGuntA6erRX4QYHX+VR40SrOV715tgnK0=;
        b=ACtiCDuQ/cDyAAOSOaYeIOTYvm1enhXP+IRC2GVEgZi/TdgsefbWUJT4n5CbwlQ6n0
         D7gDcTtYo14Eq/gGDTHl23WeIJ817drfPWDbWWUBp25Q5FBFJYD5/XobFfnJKpkAbuUr
         JfCU6T8kGUDGTs1h/rrQRl8zzeBB005YCnXT9g7cx93eq7AZ20SltYkBRYWrvBVLma3H
         yRPDNdbqz0FiIN2Ud0mP6PKjOd/+tqvlrLV9wXFTOt1lhrUpmb29BxiHyvbQw8GEwYR/
         qvFcOGlbU6gRq1XuuHel/k2As8uTKVbz0m070EtKOKAP0dNP488F5/09zMw/bYNWkYJP
         XLKA==
X-Forwarded-Encrypted: i=1; AL+hErHB8pQT5u5FUncKpUT1vcuo0wVcWXXXpplwHHV1h+UETyGzxkwOcyGK05QX8h9SklQUreVzFIAqBo8orA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9S9RhJ4knDnwgnc7cmEijIh/LH3VIFX74uRHI0GSqD7x/krLZR
	a5/XRmdpYv7GvyUcz02eCdHNVnRaRqpQe1Ls0KUcmSHwic5/jMu6PAti7Hah3N6HGtU=
X-Gm-Gg: AZFdTZdlbePCyrfwNH7vD5XuwoXO3sThjzeLid6yFAsKp/MrURS3xDXuBN6pxxMhxYt
	aRsUR7yY2TXIjgFiUgc5YvGqvg6bPDOgLXlwQECVwfsjAlZbxLl1TJEWnewiAPkGhaRfKFKi2WO
	LlGARdGkxgpuoKs2j302GJPVBuPVVnb+RQXY4nAPDDReHW8PAFYzzzd4NkYGDHJOdDsUzhPp1Tu
	9sl8Vmcxv+84hVsRfRlfNdYK4HqG4thG8uFhXC6Ey/aHWUN73cdtKQ3uXIFXWQL/KcH4qAxgGXl
	+hVDpQlgC54OBZJDlYQw5nx+4aE3M5mNbbaX1qyfCvBcc0PtOfFU77OleJIHAAVkdRLH8ejGRTz
	LnNlILGvwFW+GuZE2BzLMyzJ1mZzJSTelMP9RyqTrUHwDQy0JvBIAkiA3kej2urAq60qu8pKf18
	HeG7bEcr3xNV8WRpuL80MfDe312iMTVwIRZTpHCuK3rgpUIdtm/OgUAbyFFdsWhYOzlWPj6DBGb
	Pz+u2HxcWsNet1XJKmagZB6Z890o+I+Yk3xfhnRfJbLwz27ahiNxBOz9XG0CuvkAlbQ2V3PDjcP
	ofpvilM=
X-Received: by 2002:a05:620a:4543:b0:949:65fe:b727 with SMTP id af79cd13be357-949ba9b99a7mr3433826285a.26.1795633626929;
        Wed, 25 Nov 2026 11:07:06 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a017cfb46sm339501085a.28.2026.11.25.11.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWIKf-00000002HLZ-3ZQi;
	Wed, 25 Nov 2026 15:07:05 -0400
Date: Wed, 25 Nov 2026 15:07:05 -0400
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
Message-ID: <20261125190705.GN246011@ziepe.ca>
References: <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
 <20261124142032.GN9566@ziepe.ca>
 <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>
 <20261124194618.GC114530@ziepe.ca>
 <awZ_Os1pXelOGaFP@nvdebian.thelocal>
 <fb9a6b12-c134-4e40-86a5-dbcb59c0b91b@amd.com>
 <20261125155559.GL246011@ziepe.ca>
 <5fb8bb60-7d9f-49b1-899c-40a890fdc14b@amd.com>
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
In-Reply-To: <5fb8bb60-7d9f-49b1-899c-40a890fdc14b@amd.com>

On Wed, Nov 25, 2026 at 07:17:51PM +0100, Christian König wrote:
> On 11/25/26 16:55, Jason Gunthorpe wrote:
> > On Wed, Nov 25, 2026 at 12:19:08PM +0100, Christian König wrote:
> >> The low level API which talks for example to the IOMMU driver for
> >> creating the information how to access the buffer is simply not the
> >> task at hand for that framework. The stuff we already handle is more
> >> than complicated enough.
> > 
> > No matter what name you give it we need something in the middle that
> > can see the phys_addr_t and the iommu_domain..
> 
> No, absolutely not. That should be given to the exporter so that the
> exporter can call the DMA API to create the DMA addresses for the
> importer.

I think I've said it many times, and I thought you agreed: NAK to
giving GPU exporter drivers an iommu domain.

> The idea here is that the importer give all the information to the
> exporter so that the exporter can do the mapping on behalves of the
> importer.

No GPU driver must touch these internal details, they must only use
standard abstracted APIs that prevent them from abusing things.

My fear of DRM drivers abusing the DMA process is equal and possibly
greater than your fear of phys_addr_t :P

We are not giving DRM a nightmare API to continue to shoot us in the
foot with.

> > The primary issue here is the exporter *direct* call to the DMA API!
> 
> Why?

Because we need things to be mapped in ways the DMA API will never
support.

DMA API will never support something like dma_buf_iommu_map(). I have
no idea at all how you expect to build this if exporters are directly
calling DMA API. It is not possible.

> > We cannot disconnect this from the DMA API, ie to use an iommu domain
> > or ualink, if exporting drivers are hardwiring calls into it.
> 
> Well the plan is to not disconnect it at all. The exporting drivers
> just says to the underlying API here is my buffer please map that
> for this importer and that result is then given back to the importer
> through the DMA API again.

DMA API will only do basic PCI DMA mappings into dma_addr_t.

It will never handle iommu_domain, it will never handle ualink/etc.

Give us a plan for those if you don't like any of these ideas.

> > Fundamentally the need is for the driver to get the phys_addr list,
> > exactly like today, and then pass it to an op which formats that into
> > the right data structure for the importer. Be it dma_addr[],
> > iommu_domain, or some ualink_addr[] - or whatever.
> 
> No, the phys_addr type should only ever been seen by the DMA API and
> not by DMA-buf.

Again, I don't care how you label things or what "library" they live
in, I can't tell if we are nitpicking names or what.

But there needs to be some kind of abstraction that takes in
phys_addr_t and makes sgt, dma_addr_t, or iommu_domain depending on
what the importer needs.

Exporters must not open code that.

Obviously DMABUF is involved here *somehow* since it is the only thing
that knows an importer even exists.

Would you be happy if we made a 'dma mapping for dmabuf' library that
did all of this and DMABUF just passes its type opaquely and drivers
just call its tightly abstracted functions?

That is the component Alistair is proposing, he just prefixed it with
dmabuf_* as the namespace because, lets be honest, only dmabuf needs
this weird looking thing.

Jason
