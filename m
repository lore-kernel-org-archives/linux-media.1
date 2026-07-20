Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C799541166D;
	Mon, 20 Jul 2026 21:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584607; cv=none; b=sbxDSxHwGfPeQU1VodPXGi15Aa0l048Oz0uwsnC0phkki8/g+tIrAn0ljRPekF6iEg2hTyE8B7pQ4VJjT7iUf3SsbvTCo4ZJWLjdz6+jXwbGjQt9k3G89xv2ucMJOHidbgOzYz6fgGyE3o8svrergncjnqpQF8N/FtXTOsmhYaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584607; c=relaxed/simple;
	bh=4jSSZsGSBsfmfXHMTSqL9Ue71xosgXFeDY+SAbEd0hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJ8g5HnEAnJ2DESdI3JW8MeTHK2ohXDn6ItL4i/YtwTx+kW0z6jxFJgrrVds0EZcttUM7hF2u4uN0CjJb7KkT9+T5JY2gCM7goQOIi3OzmxCLk1s0GJ4mtHct9f9s4+S7bLDBEJ9GHI2DP9hqKNzWQlvg9OsB+ylqZTY4qmriPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wPQrbp5A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wPQrbp5A"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0645289;
	Mon, 20 Jul 2026 23:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784584545;
	bh=4jSSZsGSBsfmfXHMTSqL9Ue71xosgXFeDY+SAbEd0hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wPQrbp5AL9Ey9d1Zii4baL/BP44Qkf9xFxUa5/40PtVJ8OaWrfmMWSCRUKaFAcWzS
	 wvmDt2Y9NRAxkfN3M8bY++gQI7lORFMrWnCjXkD9LawiTYfpKw+JKxjVWNxQoGBw5m
	 xPfZ9UxVwG84v3SYWSxjLieVOxr6i/obGOz0DC3E=
Message-ID: <13d6659f-4b51-4041-8aff-70b991ac306e@ideasonboard.com>
Date: Mon, 20 Jul 2026 22:56:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: ipu-bridge: Request non-continuous clock
 for ov5693 on IPU6
To: Fernando Rimoli <fernandorimoli11@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Arsalan Naeem <naeemarsalan@gmail.com>, Jakob Berg Jespersen <dev@berg.pm>,
 linux-kernel@vger.kernel.org
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-5-fernandorimoli11@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260720163819.104130-5-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fernando

On 20/07/2026 17:38, Fernando Rimoli wrote:
> The ov5693 (INT33BE / OVTI5693) needs its MIPI clock lane gated while
> idle for the IPU6 CSI-2 receiver to lock onto the link; otherwise the
> sensor streams but capture times out and no frames arrive. The sensor
> driver gates the clock lane when the endpoint requests a non-continuous
> clock, so the bridge has to supply that property.
> 
> The same sensor works with a free-running clock on the IPU3, and other
> sensors are unaffected, so add the "clock-noncontinuous" endpoint
> property only for the ov5693 and only when the bridge sits on an IPU6
> (matched against ipu6_pci_tbl). Non-PCI bridge instances (e.g. the IVSC
> mei_csi path) are skipped.

Hm, I think this is functionally fine, but matching on PCI ID and sensor does seem a bit quirky...do 
you know if the IPU3 case is fine with the clock-noncontinuous flag too? If not I can test it tomorrow.

Thanks
Dan


> 
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
>   drivers/media/pci/intel/ipu-bridge.c | 30 ++++++++++++++++++++++++++++
>   include/media/ipu-bridge.h           |  2 +-
>   2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index b70d61099..98773a99a 100644
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
> @@ -383,6 +385,25 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
>   }
>   EXPORT_SYMBOL_NS_GPL(ipu_bridge_parse_ssdb, "INTEL_IPU_BRIDGE");
>   
> +/*
> + * The ov5693 (INT33BE / OVTI5693, on Microsoft Surface devices) only locks
> + * onto the IPU6 CSI-2 receiver when its clock lane is gated while idle, which
> + * the sensor driver does when the endpoint requests a non-continuous clock.
> + * The same sensor works with a free-running clock on the IPU3, so only request
> + * the non-continuous clock on the IPU6 variants, keyed off the bridge's PCI ID.
> + */
> +static bool ipu_bridge_needs_ncont_clock(struct ipu_bridge *bridge,
> +					 const struct ipu_sensor_config *cfg)
> +{
> +	if (strcmp(cfg->hid, "INT33BE") && strcmp(cfg->hid, "OVTI5693"))
> +		return false;
> +
> +	if (!dev_is_pci(bridge->dev))
> +		return false;
> +
> +	return !!pci_match_id(ipu6_pci_tbl, to_pci_dev(bridge->dev));
> +}
> +
>   static void ipu_bridge_create_fwnode_properties(
>   	struct ipu_sensor *sensor,
>   	struct ipu_bridge *bridge,
> @@ -463,6 +484,15 @@ static void ipu_bridge_create_fwnode_properties(
>   			cfg->link_freqs,
>   			cfg->nr_link_freqs);
>   
> +	/*
> +	 * This must stay after the link-frequencies above: the property array
> +	 * is NULL-terminated, so the entry only takes effect when a preceding
> +	 * slot is populated. All IPU6 ov5693 configs define a link frequency.
> +	 */
> +	if (ipu_bridge_needs_ncont_clock(bridge, cfg))
> +		sensor->ep_properties[4] =
> +			PROPERTY_ENTRY_BOOL("clock-noncontinuous");
> +
>   	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
>   					sensor->prop_names.data_lanes,
>   					bridge->data_lanes, sensor->lanes);
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 16fac7654..48eb1e270 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -141,7 +141,7 @@ struct ipu_sensor {
>   	const char *vcm_type;
>   
>   	struct ipu_property_names prop_names;
> -	struct property_entry ep_properties[5];
> +	struct property_entry ep_properties[6];
>   	struct property_entry dev_properties[5];
>   	struct property_entry ipu_properties[3];
>   	struct property_entry ivsc_properties[1];

