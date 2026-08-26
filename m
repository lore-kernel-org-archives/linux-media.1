Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1B3AA1A9
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727440; cv=none; b=TsZHQfSlZMkoEQYiHdUHxemtSTRbZufH72Qzw0qNvM5ftEUzxfad4UBD3ssAgX5Lq/fk5veAG79rnAq9BqLaNqU1C6xfPGU923HCC9cFvmgF7xV0lWhCr4ifFiayJ2M9CroQsp9HZKHGqm8pcKBH3w9NIlHm0UNSfD8JV7JMcrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727440; c=relaxed/simple;
	bh=Z8Y8EqxmGYmU3EQyNqx33XwH+Qpm+fIhw+VzKYdzPRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZghnBBQJ1PuGuMksRSse5mxj71LFQtEm1TgRNsRQ8BVPD0pYnOxpqweXQt2gmycinZfmUh/jfbkGrPhEpg7Jb1yG8bxdASSxK7zGJ3+gpf9pdZx/6nPNejnkc4bU21Qa2L6WtbDDXvOq/hXEMQnPdIDwHBaPA4ThKCaVetSXz4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrAd3rt2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrAd3rt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787727438; x=1819263438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8Y8EqxmGYmU3EQyNqx33XwH+Qpm+fIhw+VzKYdzPRA=;
  b=VrAd3rt2hfJ0XvM5w2yzqjXVRApVYJq/DaQDrdPDKdQWFiwRpJj5ZGRZ
   vm6VYJKN4MqowOoMDKCW0zCTlmaFs90glQWT2RKgKmW2EB9r2aS1MsNsI
   Pqqx0A5S0DxOhay0unCgi2V/KesoJM0gf9Q0ZIUt+hd7R6KsYafxzJfB6
   A9b1j9wex3gMJXZ0AzR3vSfyN9KYtx17FMa66M6tX3r3xEw/ApFgFv6vg
   2EK94jJRZDLRqzpgDrElBwPNhMl2IRbdWzPVOTeuDm4nGC6NmLjlWWVVY
   jdZ7/MEZa3aExcsoDsm30uht2YJ8QRF10w57L/Ecrl+DyFybych88PUDw
   A==;
X-CSE-ConnectionGUID: x7ZOqc5+SW2aCCUmZd5vzw==
X-CSE-MsgGUID: fXi9asNQR+qMjynrPzfT7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99725540"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="99725540"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 23:56:12 -0700
X-CSE-ConnectionGUID: lgWrqJdxR4KoVPGwasHPgg==
X-CSE-MsgGUID: LUovogiPTruPH/G9wVoAJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="264238255"
Received: from wgawrons-mobl1.ger.corp.intel.com (HELO alaakso-desk) ([10.245.246.23])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 23:56:09 -0700
Date: Wed, 26 Aug 2026 09:56:05 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: Re: [PATCH v2 40/44] media: ipu6: Map ipu7 firmware
Message-ID: <ao6OBTIeSlWACg2W@alaakso-desk>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
 <20260821114302.365532-41-antti.laakso@linux.intel.com>
 <aoiXpNR2Zoa9EEDu@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoiXpNR2Zoa9EEDu@kekkonen.localdomain>

Moi,
On Fri, Aug 21, 2026 at 09:23:32PM +0300, Sakari Ailus wrote:
> > @@ -728,18 +787,22 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
> >  	struct ipu6_device *isp = pci_get_drvdata(pdev);
> >  	struct ipu6_mmu *isys_mmu = isp->isys->mmu;
> >  	struct ipu6_mmu *psys_mmu = isp->psys->mmu;
> > +	unsigned long dir;
> >  
> >  	devm_free_irq(&pdev->dev, pdev->irq, isp);
> > -	ipu6_cpd_free_pkg_dir(isp->psys);
> >  
> > -	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
> > +	dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
> 
> Why is there a need for a bi-directional mapping for ipu7?
> 
In un-secure mode the mapped area includes firmware data window, thus
bi-directional. In secure mode the firmware can be read-only. I'll
adjust and limit the bi-directional mapping to un-secure mode only.

> > +	ipu6_cpd_free_pkg_dir(isp->psys);
> > +	ipu6_unmap_fw_region(isp->psys, dir);
> >  
> >  	if (isp->isys) {
> >  		ipu6_cpd_free_pkg_dir(isp->isys);
> >  		if (isp->isys->fw_sgt.nents)
> > -			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
> > +			ipu6_unmap_fw_region(isp->isys, dir);
> >  	}
> >  
> > +	vfree(isp->fw_code_region);
> > +
> >  	ipu6_buttress_exit(isp);
> >  
> >  	ipu6_bus_del_devices(pdev);
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
> > index 6bef45a02c2b..a2992ffe8e3c 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu6.h
> > @@ -70,6 +70,7 @@ struct ipu6_device {
> >  	bool secure_mode;
> >  	u8 hw_ver;
> >  	bool bus_ready_to_probe;
> > +	u32 *fw_code_region;
> >  };
> >  
> >  #define IPU_PSYS	0
> 
> -- 
> Terveisin,
> 
> Sakari Ailus
> 
