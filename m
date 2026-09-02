Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658F4746A5
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350926; cv=none; b=NQJpcbW51u35oPrq460u64LFvoabcaBiMB40L3j19c4IrvJ0qDQGiuEjVghtWfg/bNuuTQu+P6LEG6l3jiImEbMZfj/p0GBMtL3DVP350KxAF70dUUzxnwhgAk6i/uOLXirjYN4dK9tMkr5dJn4b662vgP+fXmZTRIUCN/DNFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350926; c=relaxed/simple;
	bh=hEgKcI0xSVAo+OQaZ6TD8YxlJUNtrHvb4B26iG5AXFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu+zMtbsMLEll2DAXYLwpOMTN+gd16PDbDxqkcaBeE305Tb5fxD+uznHXoac2OLwpYH0Ophfs8jsHLDaET8K44U7nGGR3e5/bg1bWk7k6sNTHnXv2eK9YcoR5sOVYBN1ZPd2tWDq4+643ErzVMu4zVo4xTIKCdF47GR/H4cQqK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=P3PRkCXN; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="P3PRkCXN"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5303932c4f3so2526961cf.2
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788350914; x=1788955714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=puJ4uTbfv83ic1yzfkUg8CloAoVj8WRg32Yh9dx02hk=;
        b=P3PRkCXNGcr5WbRgqSiwi7FWYnQgwhkSK8l+Nz4c3Ak6A0GJtbObjN7ZGh4Fzy7Yum
         g2c6mnKHpQS7MXhGzBtgo2LCFO9VNtXDHJ1B6uf3mXH8vv2Vd3z71rhMJ3YD+Wl5xTxp
         bxCtq89JVHhq0jhl3b7JdhZkUDspxHJoIhMCQW2yzTkxUl9Cbyx7Zc8CTM8kUstZOwgC
         LH+/UgS5PabchPBRtozJe0aO7NzMGwYEFmgbYWR6CJ2oXigtspnsHpmtIENaxKPfTUQp
         Zgu76ZiRHpm9ITQna5WEztz6HVVxDacrw8ZjBkJWMq4M5CwdYFSFkKIQAABtNYombU8l
         mkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350914; x=1788955714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puJ4uTbfv83ic1yzfkUg8CloAoVj8WRg32Yh9dx02hk=;
        b=SUWQr7/3zHn1yMM3T/cD7evXkgwEzfN6BfiJyZ29LRx3lt3rbwTUjB1NCxv7LaZhmQ
         mSX0ATvP4k49svxrhOkNKI+RTCqYKX7o0FcsqOzEuKkHlJCJsjD4uYo7bX9ZKBwVAb4d
         nDZCnjKg+fGMrtgyj7btBb/Qf6TjP+YAv+7tvTAp3scDEl21IKJsd8rIS0saHGBTnv1l
         FEvEF0pO9h297RQB7VXJNmfIaaME8SKk2PZ+kzTRxDB/0ZmiRLOfSyJhmNQ9Pom7Zl9a
         XsgD29zWd28/Nmtfpbw0LjXLunHOqgHElYTT6dyO8zsYwSV/IFL5AeDjCjM77N7IKoVB
         34LA==
X-Forwarded-Encrypted: i=1; AHgh+RryK4yWrQtbfrNPUfnqRePMuREyZw8SCpS9zdeqEv9pIkdna0WQdvePuFAfJc3zHN6RJLGtUqBd23MtEA==@vger.kernel.org
X-Gm-Message-State: AFuF++nTWbC3woDj1wNoFBFrjznmoIYneMon3F+M5ERVvyRrvVxJNq+f
	NcviuorA5o1/B5JY7PRRfHS/57NBJf4Z4Fbn33D0jF4h+fZsQ1zuZKvFIvKVq4Eb7YY=
X-Gm-Gg: AR+sD12R+81yCe4qIs8PCWVaAX2Wst5pY8xeTV3h/+kMQt/4hq/Rv3L8HIRmOpSAaY7
	kLloTKqv/6w3AcziqYuz1qkh1OTCjIot9OvBlw7SXp3Zhl8Mi8/uZg7Im5wHa4G4I/rHwW5cKpX
	GPfgPpdFdi32aLnv+ml5GHOKYw9iwq3JXRxnyBvYGJAeuu/o4GYXBL6csD8PyAY0kzRpgbaFQ+p
	5ZeG+8eFqeBvUqDivWkkGLxXHcwn6Uiy3b2BApUbHTd4Lld0tAvqF7frmKlOZ1SQVk3yVY0ABSs
	/TGTJOLoE1N8ab6W036TCg4RwgLsHH/EAlP7TqxBqTscNhbC0UjrJD/pCjQbxygfbwoI4y/ooaC
	PF7vl063yhIFZEZombDkvjE2rP41680pPtlw72EqMXwhQ1ccQioos0iJ6VLsibJBxArpe6dA5zD
	e1l4MEC6FMw+mSQdgTcY6jmPS+qTukILQVT/TvE1E83FYtxVi9mihgZ87ZmLCUKY0m3NJ4ibSL+
	KUc44ZurYrhvKX9VYzM05jRO2tzVNgaleCYfBg2Cb+XwIxsO/Of/c7w
X-Received: by 2002:a05:622a:1452:b0:52d:9c11:8937 with SMTP id d75a77b69052e-53036cc0d8amr38235061cf.26.1788350913894;
        Wed, 02 Sep 2026 05:08:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff4e90sm17442101cf.2.2026.09.02.05.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:08:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1jlY-0000000E9vh-1aE2;
	Wed, 02 Sep 2026 09:08:32 -0300
Date: Wed, 2 Sep 2026 09:08:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hu <dhu@x6u.co>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, alex@shazbot.org,
	ankita@nvidia.com, chriscli@google.com,
	david.laight.linux@gmail.com, dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev, jmoroni@google.com, kevin.tian@intel.com,
	kpberry@google.com, leon@kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolinc@nvidia.com, praan@google.com, sashiko-bot@kernel.org,
	stable@vger.kernel.org, viursachi@google.com, xuehaohu@google.com,
	Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH v8 2/2] dma-buf: Split sgl by largest page-aligned chunk
Message-ID: <20260902120832.GB2890729@ziepe.ca>
References: <20260901170849.4052816-1-dhu@x6u.co>
 <20260901170849.4052816-3-dhu@x6u.co>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901170849.4052816-3-dhu@x6u.co>

On Tue, Sep 01, 2026 at 05:08:49PM +0000, David Hu wrote:
> From: David Hu <xuehaohu@google.com>
> 
> Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> first entry, resulting in non-page-aligned DMA addresses for all
> subsequent entries.

This patch is fine, but pedenatically a scatterlist's entry limit
should be bounded to dma_get_max_seg_size(), though I don't think it
helps this. Operating scatterlists at the size limits has proven
problematic in a number of places already...

> In addition, a non-page-aligned sgl length will trigger an edge case
> in `ib_umem_find_best_pgsz()`. In case of a discontinuity in later
> buffers, we will have a `va` with lowest bit set to 1. That will lead
> to `ib_umem_find_best_pgsz()` always return 0, and break the promise
> to find best page size for the mapping on the NIC side.

That's an IB side bug, the newer logic that joins adjacent SGLs should
have avoided it?

Jason
