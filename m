Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D5385D9C
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849092; cv=none; b=dcgcHEYz3DjHxXVJ7wKJHRnEowHfyC8U4/9ikgbPARcJwHcavUX/irfe48AIDykLSW0WAOzSg2JQIcV9L/XwuL7bDRU9Xzxrn/H/A3TQp9cQ/NhUZruPmOG1CvtK3WmBXuGg0q+JbtAAAB4scFl4abwsPRQsnPDETGAr/zGGd+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849092; c=relaxed/simple;
	bh=mJTLjYzp/toBvOiBC5SSmMgqEo1ZiQK40Ya5mQ6FN1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qw611zogKxnZ7Jwk4NAaA/721/hkvWgO9J4AiDsTbvSqKVrlv5YehlIqNkTHjGUqXGjgWPebCmZ+s80zMP1IdUseUsficXR+oxF8NG8JqHO9yzBgvHQIcHamLUSn0hs1EHG+2cnDVk6NH6KwYHeSG82a66vSNElhF+GsnpO6MbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRQECKQt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRQECKQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790849090; x=1822385090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mJTLjYzp/toBvOiBC5SSmMgqEo1ZiQK40Ya5mQ6FN1c=;
  b=DRQECKQtq3Ju5DGfjysyba9Ppzu64dGj9pX+QGqX+WynM1j/Y/VES9Dt
   Fpyp8Klo8Njfpxjs7El70+e5vRuVLw8I8620LvKikYgAhd9y+oyyV0QZZ
   10f78oACvL7UF2Ae7DSDnhwvMvx6FkhhCN/1P8q9I3LdVQm8cVkKYdKl6
   s5U7zBqM7aoc8pFKNcNrKeg+vLvpwA4hnZgUaD22I6zpf+Sw3BiygpO8i
   KlMrVQ3/WqVhggYdp5vHKMiby4qj75+RGvCQcLYF2M3OKvLxJxEQ1M6j8
   j6n4sPAZ+ivmEzBeIzZEr9n25KSTzlaho1mvNvZgyKzY/sPVHgRfqlit9
   w==;
X-CSE-ConnectionGUID: Ry9E3qF7R22tLsB/7T/9TA==
X-CSE-MsgGUID: 6swgtn40SA6AfHIrfk/BCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90460763"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90460763"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:04:49 -0700
X-CSE-ConnectionGUID: lW/VYCv8Svm6uumJhzxuvQ==
X-CSE-MsgGUID: OaFagjeFS7iS5vcWsK5niw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279259435"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:04:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 820A8121D05;
	Thu, 01 Oct 2026 13:04:44 +0300 (EEST)
Date: Thu, 1 Oct 2026 13:04:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Manik Bajpai <manik.bajpai@intel.com>
Cc: Divyamani Tripathi <divyamani.tripathi@intel.com>,
	linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: Re: [PATCH v2 7/7] media: ipu6: add PCI ID for IPU8
Message-ID: <ar4wPI9lbn77TaFF@kekkonen.localdomain>
References: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
 <20261001073134.4031143-8-divyamani.tripathi@intel.com>
 <ar4PdptP1Rqol6h5@kekkonen.localdomain>
 <08543aa9-c6b7-da9d-eadf-2426635860f7@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08543aa9-c6b7-da9d-eadf-2426635860f7@intel.com>

Hi Manik,

On Thu, Oct 01, 2026 at 03:24:25PM +0530, Manik Bajpai wrote:
> 
> Hi Sakari,
> 
> On Thu, 1 Oct 2026, Sakari Ailus wrote:
> 
> > Hi Divyamani,
> > 
> > On Thu, Oct 01, 2026 at 10:31:34AM +0300, Divyamani Tripathi wrote:
> > >  static const struct ipu6_buttress_registers ipu6_buttress_regs = {
> > >  	/* Registers */
> > >  	.irq_status	= BUTTRESS_REG_ISR_STATUS,
> > > @@ -624,7 +646,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >  	int ret;
> > >  
> > >  	if ((id->device == PCI_DEVICE_ID_INTEL_IPU7 ||
> > > -	     id->device == PCI_DEVICE_ID_INTEL_IPU7P5) && force_no_probe_ipu7)
> > > +	     id->device == PCI_DEVICE_ID_INTEL_IPU7P5 ||
> > > +	     id->device == PCI_DEVICE_ID_INTEL_IPU8) && force_no_probe_ipu7)
> > 
> > One question about this -- is there a need to do this for IPU8? There's no
> > IPU8 support in the ipu7 staging driver so I might leave this as-is.
> 
> If I go through the (rest of) the patches from Divyamani, I do see some 
> IPU8 functionality being added. I was wondering if we still needed to do 
> away with this portion of code.

Yes, I'll drop this when merging the patch.

I didn't notice the pattern regarding the 4th patch so I'll leave that for
a later cleanup.

-- 
Regards,

Sakari Ailus
