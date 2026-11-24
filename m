Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549581;
	b=hMUmvxgQdIp7RXVeaxHT7klD8Q/3FyCsmVluJWCUu/W4Zldgu4yKV2UupR+m7t/Ufx5h
	 oZ9cwPDRrK826TjeONmLwmn03Y2b4Wg6PMLi25cAmmb8tCa9NMZzoqW199c+4+Gi/0I+k
	 rK0oOYPIVzCqAlueG0ljs9n4mdWlP7dJ/XmHP11T391qdaM3ARxp5BPHRLi0nO4Lo7scL
	 HfVoVf+sv5O1vWhEupCXscKEdUoZ+0vjoGq6MA4adO0+VXsrjQbflHlwXBKZ1FRFeAaxi
	 790PEyxDBS6WpugG6sKUCEF7EXTFA6BS2ZxUZL1jexB0wkPCyNRul9oHQn/tdpUEINQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
	b=E9fmXvsYR+uQv7hWpZ6fYn2fCetEPRBpEnYAlqopvzR81b6yPIcSVtq58fUaulkeE01v
	 J01E4UJj0cxp22vDJEejhT3hy6ezD2VkpCQrjsyWvEWIBD1luqfNWq0CHDxaUw18PUT5T
	 xPsodWhQyyX3jPZQegQI/bVD94WsaaFiNXqzysMpe0xTZ4dnzIemv5JYM8WbUcjJ6a3z6
	 Y4w0JzGUBUfQ7Xt0UgcqBzV9qRXxWtoDHV9C751ZEDw6IrpBWbvp7taWsxtn4W0dZCHUR
	 oMWwa4iK4jk+Zm2PLBXE3dhTVjQQZv1hE7e7SBq5SDS5kfPZixdaF7+b+t2pniux02Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hNzo9bKF;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CD0606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CD0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hNzo9bKF
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55b8cd4e2abso52807041cf.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 11:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795549580; x=1796154380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
        b=hNzo9bKFfhVQc9qzPT4XFVGb8WWDhkAsWzEGNeoMtQsVv/UieKFHIx8duXK+pVyc+7
         K5tuXAPvt7SnRa+oW1TYccovCbxEoQMg8PMSal3gZtNqnBkfc9eaI8iRduIFPXdXeGyC
         7IqbxUGwhapkSK1PkTGpbVYuC07dIRe3KRRo51bldaV5T8p/83gXtSNREqT8fVb1HMZP
         lRwnNEOCDprIXQY+fn4dNi7XyHXAEaKdOG2aZhU8DQiLg94XiGTcamJqB2smYFg1x/Sg
         siI5MDO2hfLOudZP5xdAkje683/c7T63Kjq3de7kKz2KbuVb5db1oTFbL+o0yYQz2SQS
         i3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549580; x=1796154380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
        b=gmOYfc8J86gBUqu3xQaa8b7ppIc8bEMpBN/27DsDhf1579xfK47zM0RZaSVxRFNYuK
         l+nzOAIbzAg0oWXpC9SoasmDc+vnO7opmaUwmlGE+nwq2Tk3SJr9dRne+5XQ16qBy5ZF
         NXABxMKzL7a+ca1ns5zfqQsBEk5m5xN7j/I+p9PEBMZdSkLHWkAwZL9sKKrywQehiEml
         yr1Pha/2UBP3rthJhiRDYBGZMP++rZPsJX2E5j0xAsnkSsnpmGLxDDefkQ4OcHZ/oxNr
         6TyLQULQpQIqZd74N/nWt7+QOJOaLY4VFRVu6y+1/nPRvxq1KxU+II70IQP061wrk1IQ
         UOVw==
X-Forwarded-Encrypted: i=1; AL+hErEsVNdt3pghxWthABtK8uUONQgVovUo0ZCVTRjwXon7GswH0/CRdems52T03FYoiTOre6xm246mt6+UXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z93lKlvIyYhYQ7GrGCwkJuaNlaTonW/thcNYmiGxqpinNEsU63m
	mXKXggC4jqptbLvnpjNI/eVm1VoTc4xldGRIrtS9W5aENDO/+uTcmkYZlpGAHN76Eiw=
X-Gm-Gg: AZFdTZfSbr0YNZnUcTFd0syDj7/SUnXkFSPwRhbMg3hfxW+9tGwc1MJY1xktcHb6RXp
	DJ2H9uRnn1TGvVCzDtkgA4c2EGufwmsi2XbnxBWn1OvgeXO/2SeKcqEM3LPRaRsgXRBffTvi2nN
	6ud5j/wW7EXpWmcVv/sTEPpmfKtR2bkZIu8AHLTWGD0GcJ73rcb/pA7qjBxUo7Ld7COFKOKWLq4
	gdJPKNEpKKmcVGYBUq3S7VgvYqizdC5Qufc72D9UaySgXjkKbcylQt4lv79dYbyElntWUZrULUH
	0ttFVvmTKV0LQylOY702gQQ8mseh8/SKmXvCpub2ntecsfve3UqRoaYKlQMQDRDbA/RbEpIBAzR
	caWlXi81VYxi4TJydFtYanCxkvQma0UdWj2tQmF4ornvkpm+/onuXZtlxgIbsWT+IhbqsdbEAhc
	WcnAJBCjvSWjSd4XWakXOugvePqvb3ioEAPiifEhvH/r9lYCOuHNtq1QD9eYd94Ayu0PpPWrmj8
	XUPoZswWieqaPihat2b9U126z4z90DT+PFqh+3W2zkGtxSfArzzKx2VVLHXvyyehNletjMUG1wv
	wNorGA==
X-Received: by 2002:ac8:5c8a:0:b0:55c:66f0:5bfe with SMTP id d75a77b69052e-55d76a6f55fmr288174681cf.22.1795549579924;
        Tue, 24 Nov 2026 11:46:19 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882ea2dsm135596661cf.15.2026.11.24.11.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:46:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVwT4-0000000113s-3B2s;
	Tue, 24 Nov 2026 15:46:18 -0400
Date: Tue, 24 Nov 2026 15:46:18 -0400
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
Message-ID: <20261124194618.GC114530@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
 <20261124142032.GN9566@ziepe.ca>
 <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>
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
In-Reply-To: <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>

On Tue, Nov 24, 2026 at 05:02:31PM +0100, Christian König wrote:
> The whole conversion from phys_vec to DMA addresses is something
> some API should provide based on the data the exporter/importer have
> negotiated (e.g. p2pdma_provider for example).

Yeah, probably, and this is exactly why I think it will take some
time. Building a new something in lib/ like this is not a
straightforward task.

But also, this:

> > You need to negotiate the actual C data types too, especially if you
> > want to do that nasty idea where dmabuf populates an iommu domain.
> 
> Yeah agree as well, but to be honest that task is negligible. We
> first need to figure out where to put the code.

Means you need to get the phys_addr_t into the dma-buf code so it can
do this conversion.

I'm still absolutely NAKity against allowing any DRM driver visibility
to an importer's iommu_domain if we do this hack.

I don't see how to meet all these concerns without making dma-buf into
a "converter" framework...

Regards,
Jason
