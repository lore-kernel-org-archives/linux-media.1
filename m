Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D381AA797
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787336260; cv=none; b=GuqiWIslDtLUxMT/6CAk6EINk0wIElcRlsRd+G2lQr8j4EsEbWZSAV+ecLSED1BiDS0/H2GZY5c0QRS1uXdOQyiwfCTQgFb0B2me1JDYYv/BuDRr0tn2pv6DMDJxnZjrqXcuy5IJAfoGYN6JwC+gW6hqsbbj0mJwjwfJQ3oWaqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787336260; c=relaxed/simple;
	bh=/Ah/B4JHOkt9V137k0U9B9g6HgR+OHP+V+r6aCvK20w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw6OT2KJRv7RKdkASi8TYQCmkj+nKod9STjG9zN7hvrxffAPuVmjrQiN2jlBx/0hg/yZ0UhIeuHFURWYE5x+YIX8GmnOi7KKpqmbJCktczI7aAnNRScXrREZLNgEo/0BV/Xrh/y9OsehoGivrfyMYCHV4uUa9Ii+gbHiFH7XsC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4Njmoz3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4Njmoz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787336258; x=1818872258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Ah/B4JHOkt9V137k0U9B9g6HgR+OHP+V+r6aCvK20w=;
  b=Y4Njmoz3eaJUGReVEUwMyjby0y7sC6N44MzWKi2UdxGDMQZxbODeEO6c
   5zMq4kiwSpKaD70HU5tNF/6QIpeCe8bcTYHVK0qErALPjlNZ2sznrd57t
   FknceS1RV5aiaw3g13TBtflSAyAwSd2eNFDIOirzYCRWLpJ1b52ocYcJs
   Hpii1IvOytqzPLeCyBG3q0+Rpk+3LQWzUTnwJYfUUVEWf406zcBV8h0TS
   0mKJrQQZqiYnYt080yN2s4pKXS5CwYNSJO7y5sKGJXBHD3Y0ek1MSh4Yg
   kEnpUsRtrVN46JG66STpw5hXAAjLL/qkrUfC24o4b9ha1R9hA1MYP/wI6
   A==;
X-CSE-ConnectionGUID: 2bihw5IpQLmhYcfnGEv8GA==
X-CSE-MsgGUID: nBumjXIqR0Klg3Mtwr+ezQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="88093817"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="88093817"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 11:17:37 -0700
X-CSE-ConnectionGUID: dCSActDvQ6aZ5Wopc69smA==
X-CSE-MsgGUID: /rvKeXM3QA211pYuSkeEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="269893503"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.37])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 11:17:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B55E1121BE2;
	Fri, 21 Aug 2026 21:17:43 +0300 (EEST)
Date: Fri, 21 Aug 2026 21:17:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: Re: [PATCH v2 39/44] media: ipu6: Move isys fw mapping to pci_probe
Message-ID: <aoiWR5EVWPKguO8g@kekkonen.localdomain>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
 <20260821114302.365532-40-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821114302.365532-40-antti.laakso@linux.intel.com>

Moi,

Thanks for the update!

On Fri, Aug 21, 2026 at 02:42:57PM +0300, Antti Laakso wrote:
> We are bout to add ipu7 firmware mapping. It is slightly different from

s/bout/about/

> ipu6. Handling this and possible errors is easier when both isys and
> psys mapping is in one place.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-bus.h  |  1 -
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 29 -----------
>  drivers/media/pci/intel/ipu6/ipu6.c      | 63 +++++++++++++++++++-----
>  3 files changed, 50 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
> index aef8e4a66c4a..d2f93eb03dea 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
> @@ -26,7 +26,6 @@ struct ipu6_bus_device {
>  	struct ipu6_mmu *mmu;
>  	struct ipu6_device *isp;
>  	const struct ipu6_buttress_ctrl *ctrl;
> -	const struct firmware *fw;
>  	struct sg_table fw_sgt;
>  	u64 *pkg_dir;
>  	dma_addr_t pkg_dir_dma_addr;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index 459121e6c1cb..3fb34d2d189c 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -995,7 +995,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata;
>  	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
>  	struct ipu6_device *isp = adev->isp;
> -	const struct firmware *fw;
>  	struct ipu6_isys *isys;
>  	unsigned int i;
>  	int ret;
> @@ -1040,18 +1039,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  
>  	isys_stream_init(isys);
>  
> -	if (!isp->secure_mode) {
> -		fw = isp->cpd_fw;
> -		ret = ipu6_map_fw_region(adev, fw->data, fw->size,
> -					 DMA_TO_DEVICE, 0);
> -		if (ret)
> -			goto release_firmware;
> -
> -		ret = ipu6_cpd_create_pkg_dir(adev, isp->cpd_fw->data);
> -		if (ret)
> -			goto remove_shared_buffer;
> -	}
> -
>  	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
>  
>  	ret = alloc_fw_msg_bufs(isys, 20);
> @@ -1079,14 +1066,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  	free_fw_msg_bufs(isys);
>  out_remove_pkg_dir_shared_buffer:
>  	cpu_latency_qos_remove_request(&isys->pm_qos);
> -	if (!isp->secure_mode)
> -		ipu6_cpd_free_pkg_dir(adev);
> -remove_shared_buffer:
> -	if (!isp->secure_mode)
> -		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
> -release_firmware:
> -	if (!isp->secure_mode)
> -		release_firmware(adev->fw);
>  
>  	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
>  		mutex_destroy(&isys->streams[i].mutex);
> @@ -1099,9 +1078,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  
>  static void isys_remove(struct auxiliary_device *auxdev)
>  {
> -	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
>  	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
> -	struct ipu6_device *isp = adev->isp;
>  	unsigned int i;
>  
>  	free_fw_msg_bufs(isys);
> @@ -1111,12 +1088,6 @@ static void isys_remove(struct auxiliary_device *auxdev)
>  
>  	cpu_latency_qos_remove_request(&isys->pm_qos);
>  
> -	if (!isp->secure_mode) {
> -		ipu6_cpd_free_pkg_dir(adev);
> -		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
> -		release_firmware(adev->fw);
> -	}
> -
>  	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
>  		mutex_destroy(&isys->streams[i].mutex);
>  
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index af5581da7149..d27ffd7ac6f0 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -480,6 +480,40 @@ static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
>  	writel(val, isp->base + BUTTRESS_REG_BTRS_CTRL);
>  }
>  
> +static int __ipu6_map_fw_by_sys(struct ipu6_device *isp, struct ipu6_bus_device *adev)
> +{
> +	int ret = ipu6_map_fw_region(adev, isp->cpd_fw->data, isp->cpd_fw->size,

Please avoid assigning variables in declaration block when there are errors
to check.

> +				 DMA_TO_DEVICE, 0);
> +
> +	if (ret) {
> +		dev_err_probe(&isp->pdev->dev, ret,
> +			      "Firmware mapping failed\n");
> +		return ret;
> +	}
> +
> +	ret = ipu6_cpd_create_pkg_dir(adev, isp->cpd_fw->data);
> +	if (ret) {
> +		dev_err_probe(&isp->pdev->dev, ret,
> +			      "failed to create pkg dir\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ipu6_map_fw(struct ipu6_device *isp)
> +{
> +	int ret = __ipu6_map_fw_by_sys(isp, isp->psys);

Ditto.

> +
> +	if (ret)
> +		return ret;
> +
> +	if (!isp->secure_mode)
> +		return __ipu6_map_fw_by_sys(isp, isp->isys);
> +
> +	return 0;
> +}
> +
>  static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>  	const struct ipu6_buttress_ctrl *isys_ctrl, *psys_ctrl;
> @@ -624,19 +658,9 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto out_ipu6_rpm_put;
>  	}
>  
> -	ret = ipu6_map_fw_region(isp->psys, isp->cpd_fw->data,
> -				 isp->cpd_fw->size, DMA_TO_DEVICE, 0);
> -	if (ret) {
> -		dev_err_probe(&isp->pdev->dev, ret, "failed to map fw image\n");
> -		goto out_ipu6_rpm_put;
> -	}
> -
> -	ret = ipu6_cpd_create_pkg_dir(isp->psys, isp->cpd_fw->data);
> -	if (ret) {
> -		dev_err_probe(&isp->pdev->dev, ret,
> -			      "failed to create pkg dir\n");
> +	ret = ipu6_map_fw(isp);
> +	if (ret)
>  		goto out_ipu6_rpm_put;
> -	}
>  
>  	ret = devm_request_threaded_irq(dev, pdev->irq, ipu6_buttress_isr,
>  					ipu6_buttress_isr_threaded,
> @@ -679,7 +703,13 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  out_ipu6_bus_del_devices:
>  	if (!IS_ERR_OR_NULL(isp->psys)) {
>  		ipu6_cpd_free_pkg_dir(isp->psys);
> -		ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
> +		if (isp->psys->fw_sgt.nents)
> +			ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
> +	}
> +	if (!IS_ERR_OR_NULL(isp->isys)) {
> +		ipu6_cpd_free_pkg_dir(isp->isys);
> +		if (isp->isys->fw_sgt.nents)
> +			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
>  	}
>  	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
>  		ipu6_mmu_cleanup(isp->psys->mmu);
> @@ -703,6 +733,13 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
>  	ipu6_cpd_free_pkg_dir(isp->psys);
>  
>  	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
> +
> +	if (isp->isys) {
> +		ipu6_cpd_free_pkg_dir(isp->isys);
> +		if (isp->isys->fw_sgt.nents)
> +			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
> +	}
> +
>  	ipu6_buttress_exit(isp);
>  
>  	ipu6_bus_del_devices(pdev);

-- 
Terveisin,

Sakari Ailus
