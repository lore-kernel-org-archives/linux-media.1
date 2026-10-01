Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FBE3CC7CD
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840707; cv=none; b=k87ySBmBdQq/14789DPHTgfHu0FCRb8r3Br20wjtyKJ+MUjM9h8hs6bhbfbs32EPFZtpljeSjoDsKZYJgfyeCb18Ut0ndTBAbD0qGTHgW/TB7WyDI2ikLlmmFRXdwJ/LOaJeji0uYhtImaaV0k23JZSaQZ1HkCh065cCEdaQer4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840707; c=relaxed/simple;
	bh=E+WPqVI8bB15TSHHeyGLNuD1AVZljalK2Ew8eRzURbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtS0m/yejQ4D7dKBRX/htNUqGQVt2zI0KOycE2AiHprQ0j2RMg0X2mchdhgE3OC3wCtjRCSUvqzz13ES8R/EZ2ZoCy+Mu9kni6n94vmmiGoqRQxSNm1A2d2HdsGBRihgIHJ3JGMUDStQYplxcLPhAXzAMSMI4zqigdAjwvP8/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHuDFhsi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHuDFhsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790840705; x=1822376705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E+WPqVI8bB15TSHHeyGLNuD1AVZljalK2Ew8eRzURbU=;
  b=mHuDFhsi8vWz/ljaZcQWWIFwCGtykHjRsLWkiPFJq24aJQm8syhrB4Ok
   /n3NQJv2N8MHEatIZeSS5LBpN2NxTUgWGZKkrv530ArHBnUWSNTRC9o9H
   XFLCIKmMXzITPramPRJg8OHcw4IfhsvdS7M6HmFtkUkx56CPokL7z7EbU
   52SlMMQE/mivlyPPL7yhFdWReNp668PWou0URdmdpdBuXQ6lyHih19WqH
   kKS9TUWJhWBMhyRxJZpEaLHTWpegg4+toQv1CJOAOOg24ma++d6JsjWYe
   +I3SCOl0vwA1R4AExhB95+R+l5WTTkQAW3B9WjqWaZhSN2MSDPoaBDUSP
   g==;
X-CSE-ConnectionGUID: 1BaSRrwnQTKByti9/LqXtg==
X-CSE-MsgGUID: oa1jmZ0KRRCV1Rzb9y2EPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="100922989"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="100922989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:44:58 -0700
X-CSE-ConnectionGUID: MH14GSuNRrCtC9ozlAkQTw==
X-CSE-MsgGUID: U+95MtBaQNW6z3fxrBBLmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="305431553"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:44:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4B70111F817;
	Thu, 01 Oct 2026 10:44:54 +0300 (EEST)
Date: Thu, 1 Oct 2026 10:44:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Divyamani Tripathi <divyamani.tripathi@intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
	sarang.sapre@intel.com, manik.bajpai@intel.com
Subject: Re: [PATCH v2 7/7] media: ipu6: add PCI ID for IPU8
Message-ID: <ar4PdptP1Rqol6h5@kekkonen.localdomain>
References: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
 <20261001073134.4031143-8-divyamani.tripathi@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001073134.4031143-8-divyamani.tripathi@intel.com>

Hi Divyamani,

On Thu, Oct 01, 2026 at 10:31:34AM +0300, Divyamani Tripathi wrote:
>  static const struct ipu6_buttress_registers ipu6_buttress_regs = {
>  	/* Registers */
>  	.irq_status	= BUTTRESS_REG_ISR_STATUS,
> @@ -624,7 +646,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	int ret;
>  
>  	if ((id->device == PCI_DEVICE_ID_INTEL_IPU7 ||
> -	     id->device == PCI_DEVICE_ID_INTEL_IPU7P5) && force_no_probe_ipu7)
> +	     id->device == PCI_DEVICE_ID_INTEL_IPU7P5 ||
> +	     id->device == PCI_DEVICE_ID_INTEL_IPU8) && force_no_probe_ipu7)

One question about this -- is there a need to do this for IPU8? There's no
IPU8 support in the ipu7 staging driver so I might leave this as-is.

>  		return -ENODEV;
>  
>  	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);

-- 
Regards,

Sakari Ailus
