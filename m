Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C258B6A8
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963870; cv=none; b=EhtDAxfwXGzInqz2JnZb8bgb67BJ/w3IwbdrUxei1X5G3iSxzs4+SilqZ9bWLWOsKKEQFy3XX19112AjmGQi2pauLqYeSbX89Sg1WjgtDJyDcuAW7fQZESrQPUZO8EvWCWN5i5MvRFoQ0OwzS5lj3N+yF9l+qe/AgXZ6XP/rIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963870; c=relaxed/simple;
	bh=htE8V4VpXwZSr2NcFu63ddvPVRjgHG9oq6/7yIMBDwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETdf68nf84TQ/ij8Db+jXMzroAzYqcVAMkk5fdnGNhwxgdxjZkMDZGtdM72KKV1RMFpXzzsByxZ+IMCiPjFVCcDYfVtlSGhuL2ILrClfCByXH7I3GV58bHkv94nZq7tDahAgN4aEkWlko5FZf03t09SZ5X8soGxjWt+RAMsA83k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OpwVrIru; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OpwVrIru"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F06F4B0;
	Wed,  9 Sep 2026 16:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788963769;
	bh=htE8V4VpXwZSr2NcFu63ddvPVRjgHG9oq6/7yIMBDwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OpwVrIrulpPmNpWJSwG/QtdMjcLx/fACDQgxITiNy6PuA8PIH58/I+RYbGe0G9MwX
	 MR9J2ivsdK2jRJkctsJJEqB/QFf/Fc/ZRfEClPgYgJjAdphs5z/hrR8Ki6wSjQeqRx
	 Zb8qUzq7tf8r2R1xmu2rtcpqrFYXvkfPUNiRvpc0=
Message-ID: <edd88b99-b440-4514-b0ae-2ca2c1965fdf@ideasonboard.com>
Date: Wed, 9 Sep 2026 15:24:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: ipu-bridge: Add ipu_bridge_get_ipu6()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: antti.laakso@intel.com, Lixu Zhang <lixu.zhang@intel.com>,
 Miguel Vadillo <miguel.vadillo@intel.com>, Hans de Goede <hansg@kernel.org>,
 "Sapre, Sarang" <sarang.sapre@intel.com>
References: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
 <20260909081953.3089179-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260909081953.3089179-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari

On 09/09/2026 09:19, Sakari Ailus wrote:
> Add ipu_bridge_get_ipu6() for obtaining the IPU 6 (or soon later) PCI
> device. This isn't technically a job of the IPU bridge, but the
> functionality is required in conjunction with the firmware definitions
> that necessitate the use of the IPU bridge on many systems.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
>   include/media/ipu-bridge.h           |  2 ++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 7e65491faf6d..67a1f233c4c6 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -8,6 +8,7 @@
>   #include <linux/dmi.h>
>   #include <linux/i2c.h>
>   #include <linux/mei_cl_bus.h>
> +#include <linux/pci.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/property.h>
> @@ -15,6 +16,7 @@
>   #include <linux/workqueue.h>
>   
>   #include <media/ipu-bridge.h>
> +#include <media/ipu6-pci-table.h>
>   #include <media/v4l2-fwnode.h>
>   
>   #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))
> @@ -950,6 +952,18 @@ static int ipu_bridge_check_fwnode_graph(struct fwnode_handle *fwnode)
>   	return ipu_bridge_check_fwnode_graph(fwnode->secondary);
>   }
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
>   static DEFINE_MUTEX(ipu_bridge_mutex);
>   
>   int ipu_bridge_init(struct device *dev,
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 16fac765456e..b46b6693f856 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -169,11 +169,13 @@ struct ipu_bridge {
>   };
>   
>   #if IS_ENABLED(CONFIG_IPU_BRIDGE)
> +struct pci_dev *ipu_bridge_get_ipu6(void);
>   int ipu_bridge_init(struct device *dev,
>   		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode);
>   int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
>   int ipu_bridge_instantiate_vcm(struct device *sensor);
>   #else
> +static inline struct pci_dev *ipu_bridge_get_ipu6(void) { return NULL; }
>   /* Use a define to avoid the @parse_sensor_fwnode argument getting evaluated */
>   #define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
>   static inline int ipu_bridge_instantiate_vcm(struct device *s) { return 0; }

