Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35B38238F
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787336611; cv=none; b=sn0SHTp5u37v9DalMoh4fg6o0cPJwr7MgBzXh3LMmTbMJ+0kpSn4gSHF5BUDi6LNLxVUicNBMPVjq1FhdOtat9uYnhVxCClQbrXpZZNHGefFnQOwfGbKrxJ95yjUfGqZzS4V0bbmDfJHxlVCcTSXfsn2XZnmtYVs+2toP/VDcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787336611; c=relaxed/simple;
	bh=ErLF5il60X5HfGdvVqZIcHK4GjZAKNjBtXNF/OjwxiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3rgVxl0wAN3iJmSRmCF4xm5aAvMiij8kOriFDxAIjyDTuzzumpj6Ww62PY1sOLTF8Y82sBIWBdamD1bU9koQJHpN+86nx46rdnmz1CFjfFO2FoLvIpXPX/haQJ3CasJpOrsU106x5TaBTzBN1f2BmxUKPIhi1F1wPhrhGT2Ca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mg3iLpj/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mg3iLpj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787336610; x=1818872610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ErLF5il60X5HfGdvVqZIcHK4GjZAKNjBtXNF/OjwxiA=;
  b=Mg3iLpj/ysF3PkZfeY4i0gepMANTK2gp9ZAHHqpgGsrMaJAsT2qvYd24
   /uPh+dQBl20kX2yFxCuxqd7YC6m8pO/LogVLT0QxqmxQltph9fM8ZfdnU
   OgDgefKtI5Gn546KclVKqrfDoIg31RxTae3yX2prTk6KzWrPXbhEL1MI+
   2O8i1FsdSHQ0GX/eBLcLTZFN6kGmYBpu2xlFncUYlYi5/HSUPO9nDNTyF
   LREG608VmoUrgcOj0fzs+cVwsXoB99NyahpTevtaPNlveYmdWpd/AJ/uy
   NNywsBgxPA+LbvL1q9SW4vkV95imrxsL5nZq8qsLkvWCNznYXXJryUXtH
   g==;
X-CSE-ConnectionGUID: Q4y68aq8Qyi/WEr/MD1HNQ==
X-CSE-MsgGUID: 6i4vbg3/TOyetXAokWPZFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="99414084"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="99414084"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 11:23:29 -0700
X-CSE-ConnectionGUID: sBymfWosQeGXnIKeXzFTvQ==
X-CSE-MsgGUID: +rEa3kmuQqKQ+PbqFFcGkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="268369679"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.37])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 11:23:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0B198121BE2;
	Fri, 21 Aug 2026 21:23:33 +0300 (EEST)
Date: Fri, 21 Aug 2026 21:23:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: Re: [PATCH v2 40/44] media: ipu6: Map ipu7 firmware
Message-ID: <aoiXpNR2Zoa9EEDu@kekkonen.localdomain>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
 <20260821114302.365532-41-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821114302.365532-41-antti.laakso@linux.intel.com>

Moi,

On Fri, Aug 21, 2026 at 02:42:58PM +0300, Antti Laakso wrote:
> Mapping of ipu7 firmware is slightly different compared to ipu6. Add
> helpers for it and call them similar to ipu6.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6.c | 75 ++++++++++++++++++++++++++---
>  drivers/media/pci/intel/ipu6/ipu6.h |  1 +
>  2 files changed, 70 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index d27ffd7ac6f0..93f28ec9a74d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -19,6 +19,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/vmalloc.h>
>  
>  #include <media/ipu-bridge.h>
>  #include <media/ipu6-pci-table.h>
> @@ -27,6 +28,7 @@
>  #include "ipu6-bus.h"
>  #include "ipu6-buttress.h"
>  #include "ipu6-cpd.h"
> +#include "ipu6-dma.h"
>  #include "ipu6-isys.h"
>  #include "ipu6-mmu.h"
>  #include "ipu6-platform-buttress-regs.h"
> @@ -514,6 +516,57 @@ static int ipu6_map_fw(struct ipu6_device *isp)
>  	return 0;
>  }
>  
> +static int __ipu7_map_fw_non_secure(struct ipu6_device *isp)
> +{
> +	int ret;
> +
> +	/*
> +	 * Allocate and map memory for running the firmware. Not
> +	 * required in secure mode, in which firmware runs in IMR.
> +	 */
> +	isp->fw_code_region = vmalloc(IPU7_FW_CODE_REGION_SIZE);
> +	if (!isp->fw_code_region)
> +		return -ENOMEM;
> +
> +	ret = ipu7_cpd_copy_binary(isp->cpd_fw->data, "isys",
> +				   isp->fw_code_region, &isp->isys->fw_entry);
> +	if (ret)
> +		return ret;
> +
> +	ret = ipu6_map_fw_region(isp->isys, isp->fw_code_region,
> +				 IPU7_FW_CODE_REGION_SIZE, DMA_BIDIRECTIONAL,
> +				 DMA_ATTR_RESERVE_REGION);
> +	if (ret)
> +		return ret;
> +
> +	ret = ipu7_cpd_copy_binary(isp->cpd_fw->data, "psys",
> +				   isp->fw_code_region, &isp->psys->fw_entry);
> +	if (ret)
> +		return ret;
> +
> +	return ipu6_map_fw_region(isp->psys, isp->fw_code_region,
> +				  IPU7_FW_CODE_REGION_SIZE, DMA_BIDIRECTIONAL,
> +				  DMA_ATTR_RESERVE_REGION);
> +}
> +
> +static int ipu7_map_fw(struct ipu6_device *isp)
> +{
> +	int ret;
> +
> +	ret = isp->secure_mode ?
> +		ipu6_map_fw_region(isp->psys, isp->cpd_fw->data,
> +				   isp->cpd_fw->size, DMA_BIDIRECTIONAL, 0) :
> +		__ipu7_map_fw_non_secure(isp);
> +

No newline needed here.

> +	if (ret) {
> +		dev_err_probe(&isp->pdev->dev, ret,
> +			      "Failed to init ipu7 firmware region\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>  	const struct ipu6_buttress_ctrl *isys_ctrl, *psys_ctrl;
> @@ -523,6 +576,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct ipu6_device *isp;
>  	phys_addr_t phys;
>  	u32 val, version, sku_id;
> +	unsigned long dir;
>  	int ret;
>  
>  	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
> @@ -658,7 +712,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto out_ipu6_rpm_put;
>  	}
>  
> -	ret = ipu6_map_fw(isp);
> +	ret = IS_IPU7(isp) ? ipu7_map_fw(isp) : ipu6_map_fw(isp);
>  	if (ret)
>  		goto out_ipu6_rpm_put;
>  
> @@ -701,15 +755,20 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  out_ipu6_rpm_put:
>  	pm_runtime_put_sync(&isp->psys->auxdev.dev);
>  out_ipu6_bus_del_devices:
> +	dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
>  	if (!IS_ERR_OR_NULL(isp->psys)) {
>  		ipu6_cpd_free_pkg_dir(isp->psys);
>  		if (isp->psys->fw_sgt.nents)
> -			ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
> +			ipu6_unmap_fw_region(isp->psys, dir);
>  	}
>  	if (!IS_ERR_OR_NULL(isp->isys)) {
>  		ipu6_cpd_free_pkg_dir(isp->isys);
>  		if (isp->isys->fw_sgt.nents)
> -			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
> +			ipu6_unmap_fw_region(isp->isys, dir);
> +	}
> +	if (isp->fw_code_region) {
> +		vfree(isp->fw_code_region);
> +		isp->fw_code_region = NULL;

This can be done unconditionally -- as in the remove callback.

>  	}
>  	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
>  		ipu6_mmu_cleanup(isp->psys->mmu);
> @@ -728,18 +787,22 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
>  	struct ipu6_device *isp = pci_get_drvdata(pdev);
>  	struct ipu6_mmu *isys_mmu = isp->isys->mmu;
>  	struct ipu6_mmu *psys_mmu = isp->psys->mmu;
> +	unsigned long dir;
>  
>  	devm_free_irq(&pdev->dev, pdev->irq, isp);
> -	ipu6_cpd_free_pkg_dir(isp->psys);
>  
> -	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
> +	dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;

Why is there a need for a bi-directional mapping for ipu7?

> +	ipu6_cpd_free_pkg_dir(isp->psys);
> +	ipu6_unmap_fw_region(isp->psys, dir);
>  
>  	if (isp->isys) {
>  		ipu6_cpd_free_pkg_dir(isp->isys);
>  		if (isp->isys->fw_sgt.nents)
> -			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
> +			ipu6_unmap_fw_region(isp->isys, dir);
>  	}
>  
> +	vfree(isp->fw_code_region);
> +
>  	ipu6_buttress_exit(isp);
>  
>  	ipu6_bus_del_devices(pdev);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
> index 6bef45a02c2b..a2992ffe8e3c 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6.h
> @@ -70,6 +70,7 @@ struct ipu6_device {
>  	bool secure_mode;
>  	u8 hw_ver;
>  	bool bus_ready_to_probe;
> +	u32 *fw_code_region;
>  };
>  
>  #define IPU_PSYS	0

-- 
Terveisin,

Sakari Ailus
