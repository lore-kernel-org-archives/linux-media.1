Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BFA45D92C
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758419; cv=none; b=bS1gCWc9uaO3Mi2xNuUapFv3EgrGVTy2CmQXSj9M6eDdqVMPW7D6XQ7N/83QVngPlYOXFckCPnIQ+sWVFJfMVIzdqwT5tVMuTrfOESYeARkpf+EPSZWMwKg0jEDssUV9Kb8xCUNnXAuwlEsdSRJ39M8oR6JGCeI6jmuPtObsOlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758419; c=relaxed/simple;
	bh=NAU6++ODk0NHRPzDs+3GpRDCyiND5PkiZO83ERTpMlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEWz/McWA/r4NPyFqxQ3q1AVLiYXCSAkkjpgAzi5zXZdCgCWGSei+j9igqNB5asIEr/fLBBcQ2fvnsjMnxYDmkPBrCeTYAGC1iB+O8cHxjymWmJaJPXY76e8/XBveYvpXK2gse3V0jp0S028/ml1y3m2GDxXZb6Sau5g+F+nMXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7jSco29; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7jSco29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790758415; x=1822294415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NAU6++ODk0NHRPzDs+3GpRDCyiND5PkiZO83ERTpMlI=;
  b=B7jSco29l6/H+vHu21M8IkGpdmVxwZtJ/t7Vb7PXH/z0TjG1HZg8opTv
   PzW7mPjYowSryFPZrnoqutq3wJZhf+lqThpse0/pWC2NxDSc4+6gPOHR1
   jphKue0VI28N+LK00Ut9KtOgbSGtt4GdZToKa/A8m4TYgPo59FyK2kLQD
   VPTsbhkzydBWHbVJBctBZtSXvV6idIsOrtzgJKiYsW+kMghNzk9yWHvfK
   hOJiXW4piRMNmqBVkfhBFFeAdnMnQ6Ig3no/iFJnoyekvAAs9/AThw7s6
   WHPllFgIq7d0UvkAlcCtCMuPzWc/OmJ/z8ssMLtYqV0qQlsr2lU5aKEdx
   A==;
X-CSE-ConnectionGUID: pUaRavelSAm8noOUH34V8g==
X-CSE-MsgGUID: seSrNbkUR0iJy/gjMXa7Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90256573"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90256573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:53:34 -0700
X-CSE-ConnectionGUID: /8k60e3eQXmYhuBVnqkw3w==
X-CSE-MsgGUID: EbGEhRVpSAyrPHSHlL750A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="273720638"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:53:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3189A11F8A5;
	Wed, 30 Sep 2026 11:53:37 +0300 (EEST)
Date: Wed, 30 Sep 2026 11:53:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Manik Bajpai <manik.bajpai@intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: Re: [PATCH v2 1/4] media: ipu6: Free boot config on queue memory
 alloc failure
Message-ID: <arzOEbZugSnqCbkW@kekkonen.localdomain>
References: <arpYuzb0yJinlDyH@kekkonen.localdomain>
 <20260929083130.88381-1-manik.bajpai@intel.com>
 <20260929083130.88381-2-manik.bajpai@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929083130.88381-2-manik.bajpai@intel.com>

Hi Manik,

On Tue, Sep 29, 2026 at 02:01:27PM +0530, Manik Bajpai wrote:
> If the queue_mem allocation in ipu7_init_boot_config() fails, the
> function returned -ENOMEM without freeing the boot_config buffer it
> had already allocated. The current caller happens to clean up via
> ipu7_fw_isys_cleanup() -> ipu7_release_boot_config() on any failure
> from this function, so this is not an active leak today, but
> ipu7_init_boot_config() should not rely on a specific caller undoing
> its partial allocations.
> 
> Call the existing ipu7_release_boot_config() helper before returning,
> so the function cleans up after itself on its own error path,
> independent of what the caller does.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Manik Bajpai <manik.bajpai@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu7-boot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.c b/drivers/media/pci/intel/ipu6/ipu7-boot.c
> index 5bd5281ec107..225f802cfd1c 100644
> --- a/drivers/media/pci/intel/ipu6/ipu7-boot.c
> +++ b/drivers/media/pci/intel/ipu6/ipu7-boot.c
> @@ -246,6 +246,7 @@ int ipu7_init_boot_config(struct ipu6_bus_device *adev,
>  					  GFP_KERNEL, 0);
>  	if (!fwctx->queue_mem) {
>  		dev_err(dev, "Failed to allocate queue memory.\n");
> +		ipu7_release_boot_config(adev);

I believe on error, the caller already calls ipu7_fw_isys_cleanup() that
includes a call to ipu7_release_boot_config().

The rest of the patches seem fine to me.

>  		return -ENOMEM;
>  	}
>  	fwctx->queue_mem_size = total_queue_size_aligned;

-- 
Kind regards,

Sakari Ailus
