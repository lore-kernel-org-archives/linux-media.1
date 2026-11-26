Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795732202;
	b=K9781HXVXVYkwMzYA0/gn3NI2NDAXzBfI6vbEYRYLqVNT1xSKjkAWfdoJ9ah7uUmhshb
	 WD6TlKq6ura63BGFzedakECOxWpyIQPXWfQ2NmvM0buC8Yd1Kfd7w4H8e/txNBLBGuwxH
	 e8D/8kTL0nQCsIoauZyXKpbXOYWtj3mhzYAylxsp2ioQV2JLB8IwaHSM/mID3TXfyVYPp
	 scATMnBhV1iWpGV98ObpWp8GxpvGuNO/KETXVw/jHK6u2SRFAYl2l4NYTeLk2395oe4FA
	 Z08j3v7G4KdDLLpz+x1AMBRpQIx4iJG//5vXi5ySH69YFg5JszKSCVmf1WTROVQbCrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
	b=lqGKMG8EF6zK80buywLy5IZ55fpaZma1+kJSnEzr/UTUm+l7nHAwWGOm/15SnHd2jIfV
	 ctwARdglqASCG8v0hjVEWf1P+WWeyplDznGDnJeYM5+FI/k0UPHBJ+feM3zcWmmK1oD9q
	 4IHy6Brpix4U2O5Rtf/HeVTEKy9Y3tXwXMRjJ/32L1C9DTnv1CVUMtBoD34VcOr0lP/Kc
	 AlI/78KrmPgZZUfyKdkokko6C7ejHpcyjj7H14WmpeigI//PfPlYquk6/uPMapxwB/AYK
	 o9N/CiB4KWRLC94Vh3HGdS4YE75cr1skCsPMZGt2A2JSYpR0lHh4VyUKatVycMHSJUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wc3hcrgp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3DE606A321
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 22:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B3DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wc3hcrgp
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-921342fae7eso76144416d6.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 14:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795732201; cv=none;
        d=google.com; s=arc-20260327;
        b=e+do5K0ErB5FrnF67GlHfZAFwDb6WctTytuTWDQlFRc02rFkXWYvJi75XmDS7euCaC
         8ltoe1ly2jKSzWfB9zKZICi9AumF1Ym7thM8TgwLcx36uHvuzn0/nSa6M6tqQ//HzLMZ
         9tx/DMKto9YzrwdDsN5/z3Oyxx8n8YtO1fLaLK3eJ2RsgVFX3UmGIzuZ76Qz94dtWj5+
         gOwcTQ8KM6GlhUwKoEP9FfCTJa4ISvBvvfs30OacccBk0gQIgwBHIGvmqWadCzvr2n+z
         CX7Xn2AwOoCoeixv3tLGMJx9aLErZ/Ql8klw1iLiuLoFbYeNxhiF232suh9k2hwmtE+x
         +dSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        fh=vwkkpZ9w0YYjq8rUQW6cHH0bMrfvI8UZvy2cCklYYdI=;
        b=AL+ZMWk7S/SyCNd/31P7kWtoMeuAU6XDdeB7EaaQlArRHeyMwgomcFu9J+oxiFk6Me
         L+fxzWOqbLF8owxA72QCP7X0n++OE7BGTDVIpsYJl0JYdVzwSmUgBdzSC9noTIcZ4D13
         v5q90fW+Ie6UQkTNYK4n+JLhXbpugjeOKgwSdpACx3nB/OtZ1j3GrPG4nV3IJKf6f7ZZ
         9qsSZyigB/bSmxBsxbKwlRgdAuUnsfs12jEaxGevf20z/a7X/SKITGHWFi4P3W3tIGoR
         xeWbZc2VCR89nQrxB3XHAlRfLbcEBQ6AtBuv2NSAXrU8OQYC9MmhP4kUkMcEB30i1Ub4
         Y1tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732201; x=1796337001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        b=wc3hcrgpQyGy3NzEGt5a1A+uGla3D/nfNujGZRFuKyIiFzGqOi21KC7DS2glXgMkkm
         9h+Y4LWOCdhZ4sEeYplSgjFWfGOy0iCWIPHuZnevX4/R3jFDvCOgmtppJtyFtx1IxNdH
         eXAQ2kMqLigrG3VQ7L3vaBZAxoIJsEIOVBSmO4v+20XWj5DUiAY/3UBMNyfrzs40DHnk
         r46jDcx/WuEV9uFDWfB6U3jrMvrhigI8lr20ob33mdCUncAOmSF/tRl+SKLEvXo5d4my
         7a5UMj4aKiGjOk5KCF0X2jdUx9ks4t5/JZk8hoF6YckdILXvMPn98jKHI73lbTL6bDfW
         9Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732201; x=1796337001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        b=EzKbypQwgB7a35vjjQg3ujJvGnCWJxl7Jo7bQCyZ5VA+/0c87s5i13E0j2PQIQdCvt
         V3sAVe4eXgjfst8bbHd1KEpBpFh/ZrY5A2UuekeB5HMDk/uT9Ra3OhmK/N+MUcRJaPlM
         lCcGDsx9nT3t7DJVKxgZwpM/GLXRAnba81QqB6A2wNGAfo/nxW6mQpmx4yMOc3nyZCU+
         kI2xxXL4l4SFXCYKn9Ilvar9OZB2s3lqNwewR7xPERcmCSPo68tGtGnRiolFfYSEzC0f
         /XKezgYvaI52e0UWDIYc50DKQbSGL4fZpzD7ZE3nv/YKwtPb+YZlssNdNlwIcieHdQGG
         kKhg==
X-Forwarded-Encrypted: i=1; AL+hErFjFOTg/V0gPg8cFca2uFKwni+sf4b/E8qfcSR5ZWCqNrL3gmJmWInhtH+dVYX+dMouHb2CmJQTBDPsQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JbAKxE7/pz7tU835PCvknFaza6nRhwtCHnLhEeDfWX/dCDx/g
	vM9tSCwsugldMx8b2elHfS17GoCncBbLfX5ZxXZkpfsMQWeJavDQ3hiMxEdPj4BOlGU0ZhjrQem
	0p+wGDrf8IWnvdqD/0S2bUvR80Y6BTO8=
X-Gm-Gg: AZFdTZch0zQbxmjNzkVz8Y2b/7QgkhuxjaIogAALOoipWW4HZr55VgGUaPZJN9+yHGK
	ygVITEw9LATRo8Qw1QcgDsFjNDa8/PFsOjNTPctcoWQIRuaoQEnf2cx1MXP9HPccCRD4IZO2GFT
	pnY782RO7VtpSqvTQ8pXB358GkUC7C5E+Pz0KVPFZJUl40Jv3CsL5VLazRJXVCFsjzTbBIwfJ1q
	hL9GS90jVa/BPIgCmyiL6KDrzkkDvifqBVj5MS+31OxShH+pTNXxOIj6PO8z+QXeEKmZTyGmVMo
	UizRRu+I3suNsAg+XpLOGn9Or69AiedzWbb08JQRvM7OCSVLosKaSCU6dc0LKND3XEn6bk0AmJ/
	s8m1//nszQK49FCAimKqWQMm+EYY88LbRhmwSfBUtrlLHyLCHsYijFi96XrLtCeRctUyfthUxkY
	iksLJAbcfnFGpEWG9O2vMjEQ==
X-Received: by 2002:ad4:5d61:0:b0:91e:8bb3:82 with SMTP id 6a1803df08f44-92134988818mr432424486d6.4.1795732201165;
 Thu, 26 Nov 2026 14:30:01 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com> <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com> <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
In-Reply-To: <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Nov 2026 08:29:49 +1000
X-Gm-Features: Aa3M54rvnH00v1NCtGrc73zPMs4ZrSy5Ip3saymlbe4-GLTg5bt7TBC0zEJEFjg
Message-ID: <CAPM=9txheaE3=fp7=n4fYh-xshxOm+Tv=eQn9wvHVAc-b1JKDQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/24] dma-buf: Add the SGT DMA mapping type
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Dongwon Kim <dongwon.kim@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
	Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com, treding@nvidia.com, jhubbard@nvidia.com, 
	chaitanyak@nvidia.com, Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 at 03:26, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 11/24/26 07:23, Alistair Popple wrote:
> > On 2026-11-24 at 05:37 +1100, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote...
> >> On 11/23/26 17:57, Jason Gunthorpe wrote:
> >>> On Mon, Nov 23, 2026 at 02:36:46PM +0100, Christian K=C3=B6nig wrote:
> >>>> On 11/20/26 06:55, Alistair Popple wrote:
> >>>>> From: Jason Gunthorpe <jgg@nvidia.com>
> >>>>>
> >>>>> The SGT (Scatter Gather Table) DMA mapping type represents the exis=
ting
> >>>>> sg_table/scatterlist based DMA mapping. For now it continues to use=
 a
> >>>>> sg_table for map/unmap, but this will allow a future patch series t=
o
> >>>>> convert to using a different data structure for importers without h=
aving
> >>>>> to convert all at once.
> >>>>
> >>>> I strongly think we shouldn't have an SGT mapping type in the new DM=
A-buf mapping API.
> >>>>
> >>>> Instead we should have something like either an array or an xarray
> >>>> of DMA addresses.
> >>>
> >>> My plan was always to get there, but I don't think it is reasonable t=
o
> >>> start there? There are too many places all over the place that are
> >>> just hardwired to do SGT right now.
> >
> > Right. There are around 70 drivers upstream that make use of the sg_tab=
le handed
> > down via a dma-buf import, so I don't think it's tractable to convert t=
hem all
> > in one go. So obviously we will need some way of phasing this in to giv=
e time
> > for each driver change to be implemented, reviewed, etc.
>
> My suggestion is not to convert all drivers in one go, but rather to come=
 up with some sane representation of the DMA addresses instead of using an =
SGT in the new interface.
>
> > Obviously some of those will share a common structure/helper and conver=
sions
> > will be similar, so that is an over-estimate. But based on an initial p=
oke
> > around there are plenty of drivers that bake the sg_table more deeply i=
nto their
> > data structures.
> >
> >>> Part of the design of this series was to allow the conversion away
> >>> from SGT to be done incrementally without breaking compatibility.
> >>
> >> Do you know the joke from the hitchhikers guide to the galaxy where th=
e dolphins are happy for exactly the same reasons?
> >>
> >> I'm pushing against this plan for exactly the same reason because I th=
ink it will make the conversation away from SGT even more problematic than =
it already is.
> >>
> >>> So it is effectively this:
> >>>
> >>>> The framework should then either connect the SGT directly if both
> >>>> importer and export are using the "classic" interface
> >>
> >> Yeah but that should not be a separate mapping type, it's rather that =
we just convert back and forth from DMA addresses to SGT for compatibility =
reasons.
> >
> > Right, I think this is actually fairly close to my plan, which is to pr=
ovide a type
> > for each address class an exporter can produce - either a CPU physical =
address
> > or some device context + P2P/MMIO address but in future could be some o=
ther
> > interconnect type.
> >
> > The core then negotiates compatible types and adds converters between t=
hem,
>
> I have strong objections to that plan and would potentially NAK it.
>
> DMA-buf should *NEVER* accept CPU physical addresses nor provide conversi=
on between different address types.
>
> Keep in mind that DMA-buf is solely a container for DMA addresses, nothin=
g else and it should not provide any mapping functionality whatsoever.

Is that because it's called dma-buf, if we just called it's shared-buf
would that alleviate things? I just feel like there are use-cases
where it containing CPU physical addresses might be what is optimal
for a certain scenario, and re-creating a whole parallel
infrastructure that ends up being 'I-can't-believe-it's-not-dma-buf'
would end up being bad.

If we need to shared object backings and have clearly typed and
negotiated on what the backing contains then we should allow it.
However I mostly agree on the mapping thing, I'd want drivers to
negotiate and natively support whatever backings they can rather than
having an intermediate trying to handle the conversions Not saying the
code doing the conversions can't be a helper, bit it shouldn't ever be
autoamtic or outside driver control.

Dave.
