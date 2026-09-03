Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745E4B1464
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443399; cv=none; b=sJe+TU2PFlu/+GOYE6iKKxitXbSyYxKeLtGujSrllZCWtG4Xjfsvt4FTsTOf9fGCWH/yd+peVFluMoYEYM/1uLZYOrW2X+ED8bQW+qkEMrQsoh6SWsfTFV8FzA0Kd6jucEO2sVKV3Wj1nTgPe0ll/j5UDfbTXaPxlBUkw6hMj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443399; c=relaxed/simple;
	bh=tSyD1Hrg7szl6jqzgDqZId8g0ww2LMpu6Dfemvgzz8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXl720Tw/8F+IgWt/kONFy5N30hWI0rgrgjyqf0aC2Pc0Kg2blCuH7m0O+DtR9pJ65sO/Lj5ri5n1aT6OxlqlPY59NMExh/IEreQHmiA/Zd4PV3KYzGq9PpWiRAZTdeRVRxctwWNbb72xUXCDSoPNcIPQmCnSUnvo4ScHuZXSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MpPJsuDe; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MpPJsuDe"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-936e393176fso197557985a.0
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788443381; x=1789048181; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0FzzBf86DLShcrb30vlY9xIuH5mW18Cg/ZW31lMTS4=;
        b=MpPJsuDexzOd7SuYo7TZrLszXuq+B5jx0n3e880yaVs+/VWFG0FA+XKvNrgPxPQV+3
         iEe092RSaGDKUx33b50nHCBVRyTT/H9HIp2NlCKfeuJBKAnZ3FgCmkSJt0g/7n0HOKLM
         mkugSzMVSZyJ8EvZA94i32GgC0FDe51SSik/DSmNZi/kk2hWxsO3Pf30Y2Sz0fiER3cK
         JFd07dZrt7iVrfPZqW0am5ofXh7LkRiONBBylGiSnj9yl6Plt5y/jcd3EwTor5LPy7GL
         g8nl9Sy1otolDHEXwK9YokB2KHmse4yIKASpWQZBRvYjV4lUDLkcxWdKds6yEgne3Jt4
         yZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443381; x=1789048181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W0FzzBf86DLShcrb30vlY9xIuH5mW18Cg/ZW31lMTS4=;
        b=aAZJWjb1N9jRZHknigne8mrYp0Qjlz2R/zPWm2gJhsjm3uP+c7decOaIG0XSYLxNWT
         KFyqvk7yTMMdzPNwt+Whrq2V1Kul8MBgFiiovlov9zaCevOnLVFI13UKzwGQBvJB4Har
         LouYJ6eU9UJVmZcvBM3x0vxdvbJFUeddBLMxwXnjP6syd5tjh8XH8cCi3cNwQ2mK7QBu
         mxZta0mQzn9hIF9h02ERKfisDVghaQBitaP6nxVKwK+KqcvgfkWyAVvgzP51TpouNmKP
         U0jzo8YoGG+pto5ZaKqz2k7GPo961RXgUBeBj4Vvp97VuUL9ZemKULGR2FywMzt3AWAP
         taqA==
X-Forwarded-Encrypted: i=1; AKwUvByljK0YVhioVsD4aFF3SHr5A1O8r+YhgMA68eu+vBEdVjbNMDFWQHGRFmZ2uUwGurpO7fVZymrkSDGRYg==@vger.kernel.org
X-Gm-Message-State: AFuF++nUGAn+uoTs6LDducYfgp5XgS5tau0nAkah36SlbiqY3DVWzYnx
	7+r4HDkrra9xPWk2fc+jHM6rgqqKXgSmx3z7Dbm8HAFsZN03qMwPnGiE64B8qIu1lbE=
X-Gm-Gg: AYBFou1tgNlt6cSX9r3pKQaRGckFvPLFzS42wnnBXeZfCUOUpjqhz3SnYjeKwwOUh/b
	oY+3zddSjQbiLJ4Qew2ziZv56xtQDf80NNiFYA4PNdhO/cog7w2w1XOv7QMfeD4mKcAMnwHZyKX
	lQoufK9ChHXtFuBnUy10CX5AHm9HwtkSV4y3Fv44HcAEXvCRsoJeEC55nx14znIj5HDYCOGx//5
	IbLKpsHNs8+D1QKZhcymS6oyeoYapTDQ3YGIybNG/8zUwfmZUsLk/HiBlCY2V3LDDkaLNY/WH+2
	Z72KoTvklI7IVTCP+lQnu6GcEuAq9ee9ZannzRqhwxqt6lT0L+EZMn4fTbUgv5blwnIYt/WDkEY
	QudAKnxiBa9YHNuvMwE0KZRIGJTy238F+zzHuw967OBH7la6SqhJEV1ffpvFsBlAlAtmgKNVHLk
	Ia+I+LDwIFhc5n6LzZkMk9me4jkTuJq/MxL+kSb7aSn3CATaTQ0y3iBRU4G4npiUAPZ5AtBKfO4
	Z3iI4V8SRq1O+s/m3Ak0PpdHYhljDR9yztVBxNgCMAn7A==
X-Received: by 2002:a05:620a:47b6:b0:936:576e:227b with SMTP id af79cd13be357-93960f3c98amr1203618685a.24.1788443380734;
        Thu, 03 Sep 2026 06:49:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f398a18sm497088985a.37.2026.09.03.06.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:49:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x27ow-0000000H8XN-3MX1;
	Thu, 03 Sep 2026 10:49:38 -0300
Date: Thu, 3 Sep 2026 10:49:38 -0300
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
Message-ID: <20260903134938.GI2890729@ziepe.ca>
References: <20260901170849.4052816-1-dhu@x6u.co>
 <20260901170849.4052816-3-dhu@x6u.co>
 <20260902120832.GB2890729@ziepe.ca>
 <CABdL-LTO5OKkDmtXpiLury=2n6q6Rcm42_qqz8U+JkEu=v886Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdL-LTO5OKkDmtXpiLury=2n6q6Rcm42_qqz8U+JkEu=v886Q@mail.gmail.com>

On Wed, Sep 02, 2026 at 07:07:50PM -0400, David Hu wrote:
> On Wed, Sep 2, 2026 at 8:08 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Sep 01, 2026 at 05:08:49PM +0000, David Hu wrote:
> > > From: David Hu <xuehaohu@google.com>
> > >
> > > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> > > first entry, resulting in non-page-aligned DMA addresses for all
> > > subsequent entries.
> >
> > This patch is fine, but pedenatically a scatterlist's entry limit
> > should be bounded to dma_get_max_seg_size(), though I don't think it
> > helps this. Operating scatterlists at the size limits has proven
> > problematic in a number of places already...
> >
> > > In addition, a non-page-aligned sgl length will trigger an edge case
> > > in `ib_umem_find_best_pgsz()`. In case of a discontinuity in later
> > > buffers, we will have a `va` with lowest bit set to 1. That will lead
> > > to `ib_umem_find_best_pgsz()` always return 0, and break the promise
> > > to find best page size for the mapping on the NIC side.
> >
> > That's an IB side bug, the newer logic that joins adjacent SGLs should
> > have avoided it?
> 
> Hi Jason,
> 
> Thank you for the review. I think you are right on both counts.
> Regarding the IB side, the new SGL joining logic in
> `ib_umem_find_best_pgsz()` indeed avoids the issue. `mask |= va` is
> skipped for artifically split, contiguous SGLs. Since Christian has
> already pulled v8 into drm-misc-next, I won't spin a v9 to avoid
> creating unnecessary noise on the list. If you prefer a followup,
> please let me know.

Nope, I'm fine, it just explains why it wasn't seen in other
tested. You were backporting and mix&matched things. It confirms the
upstream kernel was fine from the start.

There are other importers besides RDMA, so I still think that this is
a good change regardless. Having each segment remain page aligned, and
staying away from ULONG_MAX that might trigger overflows is a friendly
and robust thing to do for less sophisticated importers.

Jason
