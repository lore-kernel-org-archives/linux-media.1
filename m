Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9193932C8
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945519; cv=none; b=lXXrFWvBjtH5tmlfV/TGEEjRJab7tQRRICCd7J23Ni5Aiji2Fv3g7VxIZgMVz4XxaCEwYnwetIb8/CP+15MClidoa7Iz9RKFPRbKRzH+qHcEkJZbrKNtSp/t9dl1Smgd62rh3aOw97A4FCmUTkKMl8s/ukTdt3PegSgHHWm3ICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945519; c=relaxed/simple;
	bh=qaYUWmBqH+Qswri8mbtma5uYRm9pxcl78K2Sd5Mzick=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDJKobmHMIAPrh7mzezwpQwIkRewHf15nqDduUivwLVS8oER3LZ28Bz91uhOVfRyp4X7rhnEvjnEGpH42Y1Pv/k2IrdXL2GeHfA2x8TpV7hgegIIJ47RbsHWNrFQy5MwK0Q3Q0CWyQjQo9hZP7RqPqkg1wyM4T9vGxrGOTK8ERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAJAIcE0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAJAIcE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945518; x=1820481518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qaYUWmBqH+Qswri8mbtma5uYRm9pxcl78K2Sd5Mzick=;
  b=MAJAIcE088ii1pY0Vt3rKsYWZtYU9bVAXKikSjW9u6lbwhvdibzh8tpB
   5zpX3g+TS4b/PoLJUTlQ1OQcSYwbg7J6YexuZfY/g46LSaHvYNroYEMVA
   j9juUKUdluliwwyf110dkdb1OuNCVPSE/S2dkAlZXjohEQiX2xtqbMd90
   /wn7QsVbjX1DZE69DnL8+1Z5wXBR/6UJBXemxk4HLyQNoQGeOeTWCjKVj
   LmjozTTCzouFAm/OWu9bkp1+BADZN+E/2eDrIC3HZBa1KYY/WWlNAqCy3
   egSeGLOzN+zWxM6NCNm+3p+u1M983C2UOw6Cm7LyQKJeFWDyF90xrpVWh
   g==;
X-CSE-ConnectionGUID: at+eKB4pQpWv/6kxBoU54Q==
X-CSE-MsgGUID: aT9mxenXQeqK1zHzqknfgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89571429"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89571429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:18:35 -0700
X-CSE-ConnectionGUID: gAp0pjsMQrW+DxWgbfIWBQ==
X-CSE-MsgGUID: ZDnEJu2kTPqNAaajDo5I+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275403377"
Received: from dwoodwor-mobl2.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.146])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:18:33 -0700
Date: Wed, 9 Sep 2026 12:18:29 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: Re: [PATCH v2 1/3] media: ipu-bridge: Add ipu_bridge_get_ipu6()
Message-ID: <aqEkZRSEpIkJuyys@alaakso-desk>
References: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
 <20260909081953.3089179-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909081953.3089179-2-sakari.ailus@linux.intel.com>

On Wed, Sep 09, 2026 at 11:19:50AM +0300, Sakari Ailus wrote:
> Add ipu_bridge_get_ipu6() for obtaining the IPU 6 (or soon later) PCI
> device. This isn't technically a job of the IPU bridge, but the
> functionality is required in conjunction with the firmware definitions
> that necessitate the use of the IPU bridge on many systems.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

>  drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
>  include/media/ipu-bridge.h           |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 7e65491faf6d..67a1f233c4c6 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -8,6 +8,7 @@
>  #include <linux/dmi.h>
>  #include <linux/i2c.h>
>  #include <linux/mei_cl_bus.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -15,6 +16,7 @@
>  #include <linux/workqueue.h>
>  
>  #include <media/ipu-bridge.h>
> +#include <media/ipu6-pci-table.h>
>  #include <media/v4l2-fwnode.h>
>  
>  #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))
> @@ -950,6 +952,18 @@ static int ipu_bridge_check_fwnode_graph(struct fwnode_handle *fwnode)
>  	return ipu_bridge_check_fwnode_graph(fwnode->secondary);
>  }
>  
> +struct pci_dev *ipu_bridge_get_ipu6(void)
> +{
> +	struct pci_dev *ipu = NULL;
> +
> +	for (unsigned int i = 0; !ipu && ipu6_pci_tbl[i].vendor; i++)
> +		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
> +				     ipu6_pci_tbl[i].device, NULL);
> +
> +	return ipu;
> +}
> +EXPORT_SYMBOL_NS_GPL(ipu_bridge_get_ipu6, "INTEL_IPU_BRIDGE");
> +
>  static DEFINE_MUTEX(ipu_bridge_mutex);
>  
>  int ipu_bridge_init(struct device *dev,
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 16fac765456e..b46b6693f856 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -169,11 +169,13 @@ struct ipu_bridge {
>  };
>  
>  #if IS_ENABLED(CONFIG_IPU_BRIDGE)
> +struct pci_dev *ipu_bridge_get_ipu6(void);
>  int ipu_bridge_init(struct device *dev,
>  		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode);
>  int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
>  int ipu_bridge_instantiate_vcm(struct device *sensor);
>  #else
> +static inline struct pci_dev *ipu_bridge_get_ipu6(void) { return NULL; }
>  /* Use a define to avoid the @parse_sensor_fwnode argument getting evaluated */
>  #define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
>  static inline int ipu_bridge_instantiate_vcm(struct device *s) { return 0; }
> -- 
> 2.47.3
> 
> 
