Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA23CB2E6;
	Mon, 20 Jul 2026 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581753; cv=none; b=VVokUi76Ek6NqO3dOdDESSLNT+UPOPRFPzbeaHN/ziQIpZ4ty9/JUDisz4eP0qrjc18wFMfY2OuArFhDRcUIkfCX9UTRoN4MlcF3GA/P1rN3H07dezqC3TamzrpVNTnRTemRq5E+TvZcvlxay4OGm7eq//X2w8RctKLQU3RW1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581753; c=relaxed/simple;
	bh=tD7WHIwmHr5k5T4EPYuX8xa1Lf7XNBC9BM4Gu+1l50s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8IvA3IidJziEVkMhBNj0pBZYk8FbosD6bl62h+EQ5p9ngQWlZFhbkX8KjQ07EzaRZx66mcWgVqYrKcFMq/E9mbpaJf06eNnz3XYbTt2j/3+vajeym17m/EoWUOaJjbQ6BvKm8nPKTz67AgzQUwxhoVIlzlvh8oEsKEiHdY1RmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=viAj5nyH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="viAj5nyH"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE30DBB;
	Mon, 20 Jul 2026 23:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784581691;
	bh=tD7WHIwmHr5k5T4EPYuX8xa1Lf7XNBC9BM4Gu+1l50s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=viAj5nyHR0tmM2/7q7oq3a+zr6QVYjVIePTOMU73vUtrzoHTYrb3FUO321e6c22Vj
	 Nn+3pGRanFMLg74cBJLYFjhznm1aKo6FaHOH3NyihQXXaPrWLVk73b741keSEW03pL
	 QCtk2JvORg88I9l3K5N6EldJ4vzENEb/eyhd+wT8=
Message-ID: <17a87acd-24d0-43ff-95b3-0bc8070895b2@ideasonboard.com>
Date: Mon, 20 Jul 2026 22:09:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: ipu-bridge: Add OVTI5693 to the list of
 supported sensors
To: Fernando Rimoli <fernandorimoli11@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Arsalan Naeem <naeemarsalan@gmail.com>, Jakob Berg Jespersen <dev@berg.pm>,
 linux-kernel@vger.kernel.org
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-3-fernandorimoli11@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260720163819.104130-3-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fernando - thanks for the set

On 20/07/2026 17:38, Fernando Rimoli wrote:
> The IPU bridge builds the firmware node graph only for sensors listed in
> ipu_supported_sensors[]. The OV5693 is currently listed only under its
> legacy "INT33BE" HID, so on Intel IPU6 Surface devices that enumerate it
> as "OVTI5693" (e.g. Microsoft Surface Pro 9) the bridge never wires up
> the sensor and the front camera is unusable.
> 
> Add an "OVTI5693" entry. The link frequency (419200000) matches the
> existing INT33BE entry, as it is the same sensor.
> 
> Tested on Surface Pro 9 (IPU6).
> 
> Link: https://github.com/linux-surface/linux-surface/pull/2171
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/pci/intel/ipu-bridge.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
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

