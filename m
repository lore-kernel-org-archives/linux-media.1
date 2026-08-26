Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF931DD97
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730849; cv=none; b=EKX5Qr46Cgr2KXcjNpY305ICnlFzoTB3eUcuRXA0okiYAUhSVUNmPxt0N8YSptVlEAwcvJN0WKNAeMmUBhpNwj/qP5V2MNgnqfYspvDkLIYZmp3ECMCS4zd4Lzhsr/fUFVoDxJUHYe9J1uSF51ue/bUQTLJ2sP/BhBCdjHt54Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730849; c=relaxed/simple;
	bh=GQtdBcpT2HS5YkmIbZD3GS2YTNmrdwffcK5BQDLfCsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCNUCz5BSMaleKlSk1bi3KaEddAktp/fxF4yL0la+H/3/GLHE2xV8R0n67ywvIFQRnLxLRXc8azy7Vc9SGibktks0tfKX9ez/UY2MDNs74l9kp4LWuhkO80mUJDp24cOftekhfCqyQJkRoi3+s50MPubVNYBshG67yF0q8HI4fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AU2iZHcI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AU2iZHcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787730847; x=1819266847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GQtdBcpT2HS5YkmIbZD3GS2YTNmrdwffcK5BQDLfCsk=;
  b=AU2iZHcIlorn48p4If2Er92GfbkPtjsXG5tiGtayha62vSoLlQeWW54K
   YpcKapAQdnMwS7+y6Zn29CIpRs0kvEDIWFAzK3JUZrnWsWklnavjsHVaJ
   NafnDMzlh88nBjKOweuQHM0BWE6X9b9dwrb/WVqSJnMLCp6M6ZMIsyiaN
   qlTXtM6JxrV52LR3Y+lzQta1IgMgLmKQ1VGOZNw8xHLHAz44riSDYMZc3
   R85yiC7vI2Z/O8xm0LuMl31XIS2cXEWQM+uAbv7DVXkj2xFxqYJPiDJmx
   CcULiihtZmqoOeehRIEG80uBLnKopDCak/bFOuhlsWn4Q9nfBMkIixIZR
   g==;
X-CSE-ConnectionGUID: 4+NoqiyfRXu3NURWAFnAPA==
X-CSE-MsgGUID: DNxkUiXGRZa0xVMSYdJvaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="105731433"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="105731433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 00:54:07 -0700
X-CSE-ConnectionGUID: F1udikhcRMKydSqtGWjhrw==
X-CSE-MsgGUID: G/lUj2/BSTuqDLY3A7fFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="267529014"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.215])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 00:54:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C3FCB11F961;
	Wed, 26 Aug 2026 10:54:17 +0300 (EEST)
Date: Wed, 26 Aug 2026 10:54:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: Re: [PATCH v2 40/44] media: ipu6: Map ipu7 firmware
Message-ID: <ao6bqZKOy-qU-QJu@kekkonen.localdomain>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
 <20260821114302.365532-41-antti.laakso@linux.intel.com>
 <aoiXpNR2Zoa9EEDu@kekkonen.localdomain>
 <ao6OBTIeSlWACg2W@alaakso-desk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao6OBTIeSlWACg2W@alaakso-desk>

On Wed, Aug 26, 2026 at 09:56:05AM +0300, Antti Laakso wrote:
> Moi,
> On Fri, Aug 21, 2026 at 09:23:32PM +0300, Sakari Ailus wrote:
> > > @@ -728,18 +787,22 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
> > >  	struct ipu6_device *isp = pci_get_drvdata(pdev);
> > >  	struct ipu6_mmu *isys_mmu = isp->isys->mmu;
> > >  	struct ipu6_mmu *psys_mmu = isp->psys->mmu;
> > > +	unsigned long dir;
> > >  
> > >  	devm_free_irq(&pdev->dev, pdev->irq, isp);
> > > -	ipu6_cpd_free_pkg_dir(isp->psys);
> > >  
> > > -	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
> > > +	dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
> > 
> > Why is there a need for a bi-directional mapping for ipu7?
> > 
> In un-secure mode the mapped area includes firmware data window, thus
> bi-directional. In secure mode the firmware can be read-only. I'll
> adjust and limit the bi-directional mapping to un-secure mode only.

Ack; sounds good!

Perhaps a small comment on the matter would be nice?

-- 
Sakari Ailus
