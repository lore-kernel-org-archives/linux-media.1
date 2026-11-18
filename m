Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992758;
	b=l5QiozKpP9FiNDCs1U4etKI9aDULfDaxorUF5Vf/UzyK/zMR/YSBxYBfiPE5zqGAsNrL
	 mP7bZZGZxrqeRE/MXQlHxo9Kl55FA5agsysftymYSsl8TI2W1SOhMHnGqy8xJ/i0x1qp1
	 FgSkEaBqttWeJ4qis7Xv7ovLPtgqjDiC3McxJSLFHg9OBl/H+a3xhhGs3Ae7gKeh7vspi
	 Pj2cnVZPIecsE1KAuXySSirHMC4JA0Kuq8bvt+qWG1B0H1fxPy0g8vjpSz8qk/kXID9qG
	 1utyzywJS6fNpgDoHkTxRbMCBW2UcwsaZK8O9N7iAr9ASEQGvpOjhkdX6OkCbaNOVMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nF8u+l4DaC67Il48g8+iM2u6YO3Bt73ozkgu3MbLJb0=;
	b=ZZeit3+HVyuDk1ToSir78XeAt3h3zTcEVmap0VwTCeWwwSqx7G5cQL3qUR/+dVHtwE/F
	 OKaTC5wvHidiLCzW7pjWGG6rECI0SWOWnslw5ceo4HdWdy4B8K/5UhwrjrcRBsJp0D9kT
	 GALhxdvVXC676Ma3NoPKg2Ys4ImHVG+pNE7uEeHcTMOLZz/CrK8StiL9KwMyJyLi6/6Yr
	 Qgm4Uo9RQeBTjazW7NrHeRElv0eUdZvJdtQvXGyzyVtmOBoaJXC5/3dkjVtTRtyFIgzrN
	 CEWePCL/qFQtR0GoYnvbZgaDxczaeBJwtOfex24oHUJKYJXh/VgugmYUZIavjAvbMxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lPRfECPN;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F74606A31C;
	Wed, 18 Nov 2026 09:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lPRfECPN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992758; x=1826528758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=473pJ13GERioi1aQ5dJeZ4wOkbVOghsbSPijf++2wKY=;
  b=lPRfECPNpl8Yop+OJYBbXLNYdyjDt++8qvlhQUy1J98YtJimYqiQyU1U
   AWkv918jLfecxmUBDD7ygN12PbQfx+6ONVZqACykfsepAtLPgULUoWMqR
   z7JeV/APyXsXExQgGcydJJdijmkNl3jbrS9PSykt+IA9gtcxLj/rwCLkV
   UWFSRxYHInra8hBmxWQCB8dkKx5eHRp64uHNyn24IkJAta0ZBEPH3E0yY
   71T5rBm27GjN3/9enBn3bPlaoUcMMkuZ0qLL1VlRTbq1d3xP1sN0adJiy
   qXK/F2LM5pUkpUAIv2h9Uw+C+Hl4hCF/JgYE40Mw8TWhA3Pm4vgj0p1ao
   A==;
X-CSE-ConnectionGUID: bwJUWdrNRDKKbLNNU325hA==
X-CSE-MsgGUID: 9B3qVlrfTeCNk7a4k1U47Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3819943"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3819943"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:05:56 -0800
X-CSE-ConnectionGUID: PejfHLLUQCiKwc99ZdDyrA==
X-CSE-MsgGUID: r7piOe+WT+e7/ounMLSisA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10105674"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:05:54 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6FDEF121B6F;
	Wed, 18 Nov 2026 11:05:51 +0200 (EET)
Date: Wed, 18 Nov 2026 11:05:51 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/11] media: intel/ipu6: fix IOVA leak on first entry
 failure in ipu6_dma_map_sg()
Message-ID: <av1qb7JYDCYPDZ_A@kekkonen.localdomain>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
 <20261103211031.1573726-8-valerii.sokolov@pm.me>
 <austAJyXh0xorYV0@kekkonen.localdomain>
 <20261118004421.248769-1-valerii.sokolov@pm.me>
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
In-Reply-To: <20261118004421.248769-1-valerii.sokolov@pm.me>

Hi Valerii,

On Wed, Nov 18, 2026 at 12:44:42AM +0000, Valerii Sokolov wrote:
> Hi Sakari,
> 
> On Wed, Nov 04, 2026 at 03:02:56PM +0200, Sakari Ailus wrote:
> > On Tue, Nov 03, 2026 at 09:11:03PM +0000, Valerii Sokolov wrote:
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > > index 90f530a937..a923a1e4bd 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > > @@ -444,7 +444,10 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
> > >  	return nents;
> > > 
> > >  out_fail:
> > > -	ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
> > > +	if (i)
> > > +		ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
> > > +	else
> > > +		__free_iova(&mmu->dmap->iovad, iova);
> > 
> > This should be handled in ipu6_dma_unmap_sg(). I'd release the iova in the
> > beginning and reverse the order of the nents / iova checks.
> > 
> > I'll merge the rest now.
> 
> Sorry for the delayed reply, and thank you for merging the other
> patches!
> 
> Regarding handling nents == 0 inside ipu6_dma_unmap_sg():
> ipu6_dma_unmap_sg() looks up the IOVA via:
> 
> 	struct iova *iova = find_iova(&mmu->dmap->iovad,
> 				      PHYS_PFN(sg_dma_address(sglist)));
> 
> However, in ipu6_dma_map_sg(), sg_dma_address(sg) is only overwritten
> with PFN_PHYS(iova_addr) after ipu6_mmu_map() succeeds:

Right, then indeed this seems to be the least bad of the options. I'll pick
it.

-- 
Regards,

Sakari Ailus
