Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE1B4848A3
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658159; cv=none; b=qMhxPAnSjYa6JQQB+PVLqoJTgCJFxLTwjQHpBoAiU2y3BBpaHyi4Xvn+WqraeSUOIE4wD+cFd16ejBNmBYZX0rfmRddWQSwUwztnwzoqn8eHx1OhN5iHlQ9IPZVjkxMGp+kmvHTZsz4MuGLqRA1BnB8uYCHMvGfRtPmSCgRMxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658159; c=relaxed/simple;
	bh=jmjcmemHiZ7FQbMcc82ajlGpQ++hpMbdtAMvlMwreUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvFfX7HrSN7pDtpquqe2biC4Y0FT+JDXxilSOBkWnOtwrCyM85XucGEL9T+rXtcEeYA33QD3afXY+YSSuU5/suCayqwj0PZ0ri4cbXhiSdD9hGXGyFTzTkYQQ07kHzi+2clc8oMoRmGu+GtZwShuaY1/T2REJSxSc7toRaxnKYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hMnAZyHw; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hMnAZyHw"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910431849a0so7846336d6.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 08:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789658143; x=1790262943; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNGwdDF4ki7ojFW7+l1TCezZJgsNPf4Ld7gCqIxw2+Y=;
        b=hMnAZyHwuLe+WK1huXgIHORUDTjlIttYmjLzQO/1mm70XIJ0fXaawEQ6q+Hl6M/zL0
         McllzMs7MlG//myhlUuaRyedgRG+Lq44IgBsLzPV/Z+CyjT7Gn/bwnMEMZnv0TrAi5V9
         X0a6fo55wCSL50AupjIqflIqBcyoIh0O6aYHPZD7dcW3GPESP+8eX61F5bQBfQBaMFit
         +v0E82pwFIxVOAil4E++tBNHe6do82PUt26pHLDa7+zPS1hyaqLEPgZVtgsapeWaN4XR
         u2hOV/j7lCm6bWbnp5Vp52TNkciiQJFebxiTIzZM0gxMQqE3ioPgwnnnYDqsjAyP4ME/
         HUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658143; x=1790262943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eNGwdDF4ki7ojFW7+l1TCezZJgsNPf4Ld7gCqIxw2+Y=;
        b=DD6IWVrNAhQAlUr7nluQtg50qImiJMJupjP/+e6S5BGfjhmGpnuX2BnlfBX5lIYbQT
         c74IIlDT/olJfH2J3MQN2g8a1EAHzkKyaTQsRm5NgLolGKne3ZV/utkyBq72ZW1QPCBz
         B0sBj5vQrW1cjtaHcS8eaG+y7Fq9PBECJbsF9dCtBYSXI8Ge4cdDlsggGBPehXu1zw2t
         9BTeKCh+aurSgrT4Q3DXh4rVsl21It5nWaBfRfN+mNwY/8Lz/dEWvHWUVApgb7BXaTVt
         tnYC2GcGIIoVLE7RgFrh9DnEG6KTo0Zz3aUXmhAwNUDRmD+y3/8plsz7YBGtestQadiz
         coBg==
X-Forwarded-Encrypted: i=1; AKwUvBxkzHEF5HqIPH6+G8Sy9YYIswZocg/07zmrdeCz5LkSHwTX6bWMyqTRFAuKy1O0Q6GuDSoyhoasHIHnUg==@vger.kernel.org
X-Gm-Message-State: AFuF++mjJmDPESoaUEhgZYryfgD2u2874BOMQA8cgKPANc4R8Upb+Crl
	OjTIJoW48tQoeLOV6G2lcOV+y7M8ypYHX8O+b6kqOtncBU6YvpcZ9/ot6n0rSpvM7wQ=
X-Gm-Gg: AYBFou2IPd0PqpR/EiM1aE9NGj7sQt8eHE3aEu5itoFW6GazMvbDZK8bgLje0O/lDUB
	V17xOUDyUjjDQ+VVGxzG+G52KNqilXez9FiN6TXcdewEaJW/T/8Ug5QFkNJP2zhaIYnPCwcWy0h
	X1/xz6a0ij9F25dufm0y1UR8tTowrjl3++2jFDijGRJqLzYQSBWjYdvAn8zeIWoev/f9gM76Xh/
	LJUjv8YU5TssutuWgbzezTlPBD8ixhXPf9O5bvhlwbP+NKA27/FdWIS9se0CQK7/nHRnveRXZhJ
	FsGfhMrC+MBL96FX0zPe2WaA+m9xPGlEdJY+gPPlFxAORp3b4iIpA0UqwszDVCqQgBRLFwsrRn0
	NRrfdIK71YhZ3jMpGLSy16mIMUicTurG9Zpur7cyaJncoAGXwPlI/bk7QkeTDxu2HXHulScYibM
	5l8MEu5O8hceQjfhsoRs1MddiHofMAqdisJZqYCo02UzvSaFfMOpoZL9Ky481X1WWuw2czM/Yzj
	7X04nKguozzi+J1xoGLmZflFYxYx1iNnCJboeSnQx7PFKQEzgqHQLQk
X-Received: by 2002:a05:6214:5903:b0:90e:8be9:c384 with SMTP id 6a1803df08f44-9123d7b301dmr139360466d6.27.1789658138557;
        Thu, 17 Sep 2026 08:15:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cb0b52sm26856d6.28.2026.09.17.08.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7Dpp-0000000CyZf-0zOc;
	Thu, 17 Sep 2026 12:15:37 -0300
Date: Thu, 17 Sep 2026 12:15:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v6 18/18] RDMA/mlx5: Ask P2PDMA whether ATS takes a
 direct peer-to-peer route
Message-ID: <20260917151537.GJ3196566@ziepe.ca>
References: <20260914-fix-p2p-acs-v4-0-v6-0-5ef07ec9ef06@nvidia.com>
 <20260914-fix-p2p-acs-v4-0-v6-18-5ef07ec9ef06@nvidia.com>
 <321890690ce83d1943b2f678bd9bee9b8c895b66.camel@linux.intel.com>
 <20260917140253.GG3196566@ziepe.ca>
 <7d8118ee06f29b73988108c0892022b3a2626f1d.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d8118ee06f29b73988108c0892022b3a2626f1d.camel@linux.intel.com>

On Thu, Sep 17, 2026 at 04:16:57PM +0200, Thomas Hellström wrote:
> On Thu, 2026-09-17 at 11:02 -0300, Jason Gunthorpe wrote:
> > On Thu, Sep 17, 2026 at 03:56:12PM +0200, Thomas Hellström wrote:
> > 
> > > That is, a flag to tell the topology check that some transactions
> > > *will* take the host-bridge path due to IOVA being used, and that
> > > the
> > > computations including pci_p2pdma_distance() need to check whether
> > > that
> > > is possible (checking whitelist etc.) and return the corresponding
> > > THRU_HOST_BRIDGE mapping type. Translated transactions taking a
> > > short-
> > > cut using the bus-address would then be hidden from the driver.
> > 
> > I imagined it would work by the driver passing in what modes it
> > supports and Intel GPU would simply pass in ATS only.
> > 
> > Even something like mlx has variation, only some operations can opt
> > into ATS, many others are never-ATS.
> > 
> > Driver should not make statements like " *will* take the host-bridge
> > path" since it has no idea.
> 
> Yes, agreed, but anyway DMA-BUF would then, as part of the
> dynamic_attach negotiation have an interface that takes an ATS only
> flag and use it to determine whether P2P is possible at all, and use
> them at mapping time to set up the correct SG list (IOVA or BUS
> address).

Yeah, where I was going with mapping type was to have the core code
"DMA buf PCI bus mapping type" perform the pci p2p operations,
(especially the calc distance that has been open coded in GPU
drivers!!) and I imagined it would take in information from the
exporter and importer about things like ATS capabilities.

There is worse coming here soon people are working on multi-path PCI
and we even already have such systems. Multi-path PCI means you have
to select the best quality path from a NxM matrix of options and then
inform both sides which path you picked.

> Similarly the dma_map_page() needs to know these flags for p2pdma pages
> so that it never sets up a BUS_ADDRESS to an ATS-enabled device that
> didn't explicitly ask for it?

You don't use dma_map_page() with P2P, use the new interface and then
the details are visible and the mapper can do the right logic.

> And this all (and in addition the previous discussion around pcie
> subsystems calls from within dma-buf, and data-types for mapping
> information) makes me think that abstracting fast dma-buf interconnects
> along with our previous discussions is a good thing. Then interconnect
> details and cross-subsystem dependencies can be hidden in the
> interconnect implementations, suitably placed in the tree.

Right exactly, I guess Christain will be more comfortable if we have a
dma-mapping-type-pci.c that has all of this and only PCI drivers use
that code so it makes logical layering sense with the needs of the
embedded non-PCI drivers..

Jason
