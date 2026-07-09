Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F54B23BCE3;
	Thu,  9 Jul 2026 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603064; cv=none; b=krQmryoTN0c3ns2rM4sXwrecv9mbIJLOY0IX/MF4opMeJEYNHxYNV/EwFQtjIu+RxIDM+pJeA3forhLcOfnDSydDae0rK0RerDaEhjc5o3ycXnylxmR8u6xtRj+VHbinmmiObhjQP7ALJ/oK7IfMV0FjseDc8mYk/3spayY66vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603064; c=relaxed/simple;
	bh=jGLDSTsznRqr49fzmaWLUB+7Y5uPnEr49q0Aj4TdYnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf17ErNEW81qQgke9RR7+jBx78e3RwPN+MYZ+yBXqFMtLRaYvdXkni5lIIeJjCrqX0dMvqSGdKycPBhdkuDHDFG948xfccmdpQbnLaGgRImlDCofi7H4kofpt+rsK2jeSq09hwOumrmcuIa56bmGiD5fqWUBYyge3wVHc6mwT9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bFSQ8upD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bFSQ8upD"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B5F112F;
	Thu,  9 Jul 2026 15:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783603010;
	bh=jGLDSTsznRqr49fzmaWLUB+7Y5uPnEr49q0Aj4TdYnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFSQ8upDc4I9xMYW2zSZrbiaKTpOj0dq7CuiheqvAtr429xKiuc+uVAHeZy8dngBl
	 7jOMmxnMrEm5wbPIlLNyrYYwA0Uki5prJYZQi9r6kjZeXyMAsIrZewh+CRhYm1ezbF
	 nxH3LEQpvAOeJAq+nvEsZxWfsI7IFIOplFu8iBs0=
Message-ID: <20aafae9-16fb-474e-985f-19c09b1307a7@ideasonboard.com>
Date: Thu, 9 Jul 2026 14:17:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ov5693: add OVTI5693 ACPI HID for IPU6 Surface
 devices
To: Fernando Rimoli <fernandorimoli11@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20260708213633.18392-1-fernandorimoli11@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260708213633.18392-1-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fernando,thanks for the patch

On 08/07/2026 22:36, Fernando Rimoli wrote:
> The ov5693 driver only matches the "INT33BE" ACPI HID. Some Intel IPU6
> Surface devices (e.g. Microsoft Surface Pro 9) enumerate the same OV5693
> front camera with the ACPI HID "OVTI5693" instead. Without this HID the
> i2c core never binds the driver, and the IPU bridge never builds the
> firmware node graph for the sensor, so the front camera is unusable.
> 
> Add "OVTI5693" to the sensor driver's ACPI match table and to the IPU
> bridge's supported-sensor list. The link frequency (419200000) matches
> the existing INT33BE entry, as it is the same sensor. Devices that use
> "INT33BE" (e.g. Surface Go 4) are unaffected.
> 
> Tested on Surface Pro 9 (IPU6): the sensor enumerates as OVTI5693:00
> (ACPI path \_SB_.PC00.I2C3.CAMF) and binds with this change.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/2171
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---

Looks good to me:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> Note: this HID addition makes the sensor bind and enumerate, but a fully
> working front camera on IPU6 also requires programming MIPI_CTRL00
> (0x4800 = 0x2d) before stream-on, otherwise the IPU6 CSI-2 receiver never
> locks and capture times out. That register change is being handled
> separately (see the Link: above). This patch is independent and useful on
> its own for enumeration, so I'm sending it standalone; happy to reorder if
> you'd prefer it after the register fix.

Standalone is fine :)


Thanks
Dan

> 
>   drivers/media/i2c/ov5693.c           | 1 +
>   drivers/media/pci/intel/ipu-bridge.c | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 4cc796bbe..02236f3db 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -1396,6 +1396,7 @@ static const struct dev_pm_ops ov5693_pm_ops = {
>   
>   static const struct acpi_device_id ov5693_acpi_match[] = {
>   	{"INT33BE"},
> +	{"OVTI5693"},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 88581a4c0..b70d61099 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -93,6 +93,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>   	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
>   	/* Omnivision OV5675 */
>   	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
> +	/* Omnivision OV5693 */
> +	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
>   	/* Omnivision OV8856 */
>   	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
>   	/* Sony IMX471 */

