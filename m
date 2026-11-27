Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784277;
	b=t7+zd234DmvgCBHqcOGcy2OeZtaA9V9Q5Q3mzt/bLrgUWV4EJaViq5ezYFrFasWGQXd+
	 CINXepdW4YMWiCoS0hGUB9NoR8lRDwYsdJBFO4n1kclRwhRZqHa0QwLgOn9r16RHShlBN
	 7amFCOzKDKyMu96BtUyaWuhdGHxY6jFJInGHisxVlezI3EvQY+sPi44NObmbVSjLpbN5X
	 /ODoiBE0WbKYxLPqaS6fI1HEhMElpOcxOE8oMGpNymj4XSh6k/+gcy6gRZ9JUM9yqpIgG
	 uPkE4D5iXb4eCVkDc3L4EZ7DiHPfuPf1AhuVvIBYLb7/Ah4VaFEEqozjug6Km0MceRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=hpgxxji67KrMZBTg6jUjcNbfY5cNwEwJL3jB25wL4Zo=;
	b=UUca3OVdCwNvaPX3Raa+hXNYVcWeYhUnBcUOeew85lO0xzniH9yk1r5AJhjzll+CjM9T
	 tgA9i0Awy26LUIDmM4eAagkTi9BNgWa2Elelt+m/81NuzLpmgTbkLI/cK8mmr1BBJgjzW
	 I11FwSxPc0S+6dEs2S3IzTs8ymxAR+awWKPngfemg4G67w7yKXRPkHRmsXDSJe7aPgSDh
	 XkS+k/s4feizWIXIVmrlZ6Po+cgkDzeGoFilpB/VOA5bzGXVaCXimj+JdSwsoR9Fz2mJg
	 ytdNsn829BVGS8vkGlo1jxI3SFbrsMuJI2On4HA45Iry5OfNsji6gyJMRpKYvsDJ4Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=j7O+BfN8;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48C606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC48C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=j7O+BfN8
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5363316fa0cso83568951cf.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795784275; x=1796389075; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpgxxji67KrMZBTg6jUjcNbfY5cNwEwJL3jB25wL4Zo=;
        b=j7O+BfN8/f6PwjasmxVhCBoceSC0sabwtMYxOvl/V+So2Mtlli7upfWXQOxdcMdwlP
         kdbWoj9wMH2VLhhxx9/W4qCwnXSv4SqCJA4dPFpucC+JLWjduqow4FxZ+HWokuT7I32r
         ZWkzzsm9oj4IR+X9hFXovpTueZ77GXxtTqpSEnUit2eZjN+4tGNr/uSL7JrpEgDwlfsZ
         gb6ILQTqqyaZeZUvLD8uZG2VKKCPgLdNfX2MOIWU/36VOy9usYwIOe5sNoISKHnEYyvA
         l0mQ01iQ4VywPJOhfdj9Spm6TD5MFnNoXSCtVssrDxM7oa6Cq3wIYpgkEkUlt2jLsmWD
         VJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784275; x=1796389075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hpgxxji67KrMZBTg6jUjcNbfY5cNwEwJL3jB25wL4Zo=;
        b=WXE4JY/29j1iH03pt2mn/BoG+i80SZAHNu4LLnBcuqrbfCdp/8HBqBgFJVKzqh9pza
         TLQPxt709wdqyCaqcOTwzKsu3wgrRqgG7BlTxjlsheksE+WxblgbUpTX8qb4jEidNMut
         cs3c6mpgA7wYYBOcVTsfPo7UXddNqAioMGYJrOxk4vJ7yVFimtIw871G7SjpToB5Bggi
         xwsbkULhfItLSgkaS93sxEOIuWYPXc4oZw7M5cDQVnzrAbtGtAQv26io5XkEWO9oNfOP
         hYbKyaNTYW0VrBl5VYLtwOnVIUDb8QEyCa1dA45CMTfu0SoC5eqfCuQo4/WIXwpPmf9h
         TtwA==
X-Forwarded-Encrypted: i=1; AL+hErF2Af6qD/4xEMdrfpcmzotL4EbhhBsvGgNBjCxUT3MXYxg0bWLdvh0DWrNhx0AMeFlPoFnwI2HgnhrM0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/nv+K+7pQTF7urV3KvFWOHoGxSRtN4epDblpSwnfGG5ZQG7/T
	rKDg5ECRBFaRZ/PIbPs8KpcSUeHkOiNdctK78ZiUI+ZNVq21VGIFHR1EJAdcnK2wz0M=
X-Gm-Gg: AZFdTZegrRPo8BCHdg8aL1IuQmyUnujiMG72+7oAguF9yFKxJiMpWZhFcuROCLQHr82
	UAWhwaD2gqa2irYHzQEQ4DrHobaotJWrXfT4howrqNaL3nU/odKAI9TbrtWsznfYnR+8gyV0ehF
	JkXvqaLuhsnJ9agy6oTvsW6pMkJ9z1Ot5ss+Zr6orDhlXYpnaUT7hbrqriQbuiY5ddD2prfOU+P
	ue2lhiQCKuUWhPfn7dg2H8I9gu2CxZ1XiNAm4jl9tw4JD5iswwYcvZZduJRmPWB4gxyyrUobE3g
	7M2chxaDL24Cm9Y/qXQn3pduB4E4iZAcozvZqjhFDxpUUGOgvy3kJd03K4WyqKDwQyluoeF2I1I
	F+znkZSy6W+OkbnfcOu5pDZ0J2uMPhAGfiqohtIOuksYmri58xPHWcNQP51zW4xLVW3p3+PcXbQ
	1WtbJMr1x5qaHgR/+6aoWGezUpkv41qNjF/qq92Gz6pK5H0ox4maaAig53cXeNbn/0nkBSLnvYO
	hReSdRHbhPcL7nf0/AM/Ixow2h7CYwzYY9+YbvP5x2NY7+dNTKoKBoQp8JumeMQcqsMYZA/Y/M5
	OI6hPA==
X-Received: by 2002:a05:622a:48d:b0:55d:3689:913 with SMTP id d75a77b69052e-55d76aad14fmr455567241cf.77.1795784275571;
        Fri, 27 Nov 2026 04:57:55 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dbeae112bsm55627651cf.8.2026.11.27.04.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:57:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWvWT-00000006hYF-3LIW;
	Fri, 27 Nov 2026 08:57:53 -0400
Date: Fri, 27 Nov 2026 08:57:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
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
Message-ID: <20261127125753.GS246011@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
 <CAPM=9txheaE3=fp7=n4fYh-xshxOm+Tv=eQn9wvHVAc-b1JKDQ@mail.gmail.com>
 <79d62f9a-cea8-4149-a673-7ef86942410d@amd.com>
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
In-Reply-To: <79d62f9a-cea8-4149-a673-7ef86942410d@amd.com>

On Fri, Nov 27, 2026 at 09:04:15AM +0100, Christian König wrote:

> If we somehow prevent the CPU physical address from being casted to
> a struct page and/or used with vmf_insert_pfn/page/dma_map_page
> etc.. then there is not much of a problem with passing around
> physical addresses.

I already offered that in v1 of the series using limits on
EXPORT_SYMBOL and you NAK'd it too.

> > If we need to shared object backings and have clearly typed and
> > negotiated on what the backing contains then we should allow it.
> > However I mostly agree on the mapping thing, I'd want drivers to
> > negotiate and natively support whatever backings they can rather than
> > having an intermediate trying to handle the conversions Not saying the
> 
> Yes, exactly that's my concern as well. We need to avoid this middle
> layer trap.

You avoid middle layers by having reasonable subsystem helpers for
things to use to build their stuff, especially to encapsulate common
patterns. These helpers are part of the subsystem, or in a related
subysstem helper library.

In Linux terms middle layer almost always means something wrapping a
function pointer callback into a driver and enforcing specific actions
on top of that. The recommended counter is to have the driver perform
the actions with helpers and not wrapper the ops. It particularly came
from the block world where they stuck something like SCSI after the
block ops but before the driver.

It is hard to see that DMABUF is anywhere close to a middle layer.

This is also why we don't understand your remarks about
dma_buf_phys_vec_to_sgt(). Of course it belongs in dmabuf, it produces
the dmabuf spec'd mangled scatterlist that only dmabuf uses. Where
else would you put this code?

> > code doing the conversions can't be a helper, bit it shouldn't ever be
> > autoamtic or outside driver control.

I think you do want it automatic, if an exporter is new and makes,
say, a dma_addr_t[] and the importer is old and wants a sgt, why
should we be open coding anything in every driver to deal with this?

You can argue if it is automatic because the driver called a very
general helper or automatic because the helper is wrapping a callback,
but that should be a fairly minor quibble not a huge thread full of
NAKs.

Ultimately DMABUF has a fairly simple flow:
 1) Allow importer/exporter to negotiate what kind of interconnect
    they want to use (PCI, ualink, etc)
 2) Give the exporter enough information about the interconect path to
    make a placement decision
 3) Describe the exporter's buffer so any mappings/translation/etc can
    be setup for the importer
 4) Program the importers HW.

Many of these have very common patterns, like PCI GPUs always make the
same kind of VRAM placement decision in #2 based on P2P support. This
should all be in helpers under the dmabuf umbrella and not open coded.

Jason
