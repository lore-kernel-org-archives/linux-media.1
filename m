Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F235FF6E
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077759; cv=none; b=T3fVcMHhohSDwKAWRoGN/M9ZNr8xX6DC6qomiy5+qamleNFkTAzKjfBn0l0pm0xXghUjzGjvvD2UdYWTxUx33AvTzA7Z3liR5vYL+NU+/u+nLaLfVASqvFHi8kuqk2263lsLLK6A58RcOx1FJaKRr1ZEqJk4xZkNDttY+3ubmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077759; c=relaxed/simple;
	bh=+RInYELX6ySLXnLnevw+wMAiTTAInOKYD8J0r80K6XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C71GLm7a1d/qPq/eqJ07FRZdOFJI9zoZxmfBuCcJb8QUGZ67Mlr0Yp+VWd3fkfFcEg6ryUZVojqL6YfRE1bAu1E8aYeEUvBTzD8HX/gVGmtp2H6jl30bdSx2Bf3EqrQhe69ZjR/JFRjiif2n5OUnUyUtFs4gc+nR9M2iyrAZWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hw+eWXh0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hw+eWXh0"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36CBE874;
	Wed, 10 Jun 2026 09:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781077721;
	bh=+RInYELX6ySLXnLnevw+wMAiTTAInOKYD8J0r80K6XI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hw+eWXh050W0KUPrqfbHzcKD14LDsv3o02JsOo6YEfKXrI7z2JFVCJrj1dim0z4/t
	 7VfX3dLtVKSIakiHS5cnXvX+n04TZ7HUBaz9LnvsbkBeVpJS7XYsj0WGHzWTGoj64x
	 ygUaVcQpIAjTYs5dnEWONUe/anJbuSP4fcPa43l4=
Message-ID: <0c460027-c473-439a-8493-c0248c6401c7@ideasonboard.com>
Date: Wed, 10 Jun 2026 08:49:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: i2c: ov8865: Program the mode on stream start
 if needed
To: Jurison Murati <eng.juri@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20260609232255.13559-1-eng.juri@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260609232255.13559-1-eng.juri@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jurison, thanks for the patch

On 10/06/2026 00:22, Jurison Murati wrote:
> The sensor registers are only written in the runtime PM resume
> handler; ov8865_set_fmt() merely stores the requested mode, relying on
> the sensor being runtime suspended between uses so that the next
> resume applies it.
> 
> That assumption breaks when something keeps the sensor powered. On
> IPU3 platforms, ipu_bridge instantiates the VCM device with a
> DL_FLAG_PM_RUNTIME device link to the sensor, so a userspace process
> holding the VCM subdev open (e.g. wireplumber's camera monitor) pins
> the sensor runtime-active. A subsequent set_fmt() then never reaches
> the hardware: the sensor keeps streaming the mode programmed on the
> last resume while the CSI-2 receiver expects the newly negotiated
> format.
> 
> On a Surface Book 2 (IPU3, ov8865 + dw9719 VCM), requesting the
> 3264x2448 mode while the hardware was left programmed for the
> 1632x1224 binned mode makes ipu3-cio2 report "frame sync error" and
> "payload length is 10340352, received 2585088" (exactly one binned
> frame) for every frame, and the inverse case stalls the stream after
> a single frame. Camera applications end up displaying one bogus frame
> forever.
> 
> Track the mode actually programmed into the hardware, invalidate it
> when the sensor is powered off, and reprogram the sensor on stream
> start whenever it does not match the negotiated mode, re-applying the
> control values afterwards.
> 
> Signed-off-by: Jurison Murati <eng.juri@gmail.com>
> ---
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -670,6 +670,10 @@
>   	const struct ov8865_mode *mode;
>   	u32 mbus_code;
>   
> +	/* Mode currently programmed into the hardware, NULL when unpowered. */
> +	const struct ov8865_mode *hw_mode;
> +	u32 hw_mbus_code;
> +
>   	bool streaming;
>   };
>   
> @@ -2383,6 +2387,9 @@
>   		return ret;
>   	}
>   
> +	sensor->state.hw_mode = sensor->state.mode;
> +	sensor->state.hw_mbus_code = sensor->state.mbus_code;
> +
>   	return 0;
>   }
>   
> @@ -2618,6 +2625,25 @@
>   	}
>   
>   	mutex_lock(&sensor->mutex);
> +
> +	/*
> +	 * If something else kept the sensor powered (e.g. the VCM's PM
> +	 * device link holding it active), runtime resume did not run when
> +	 * streaming was requested and the hardware may still be programmed
> +	 * for a previous mode. Reprogram it to match the current state.
> +	 */
> +	if (enable && (state->hw_mode != state->mode ||
> +		       state->hw_mbus_code != state->mbus_code)) {
> +		ret = ov8865_sensor_init(sensor);
> +		if (!ret)
> +			ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> +		if (ret) {
> +			mutex_unlock(&sensor->mutex);
> +			pm_runtime_put(sensor->dev);
> +			return ret;
> +		}
> +	}

ov8865_resume() writes the sensor configuration probably to support mid-stream suspend. If we moved 
the ov8865_sensor_init() and __v4l2_ctrl_handler_setup() calls there behind the state->streaming 
guard along with ov8865_sw_standby() then I think they could just be called unconditionally in the 
enable path in ov886_s_stream() without having to store a mode in struct ov8865_state

Thanks
Dan
>   	ret = ov8865_sw_standby(sensor, !enable);
>   	mutex_unlock(&sensor->mutex);
>   
> @@ -2895,6 +2921,8 @@
>   	ret = ov8865_sensor_power(sensor, false);
>   	if (ret)
>   		ov8865_sw_standby(sensor, false);
> +	else
> +		state->hw_mode = NULL;
>   
>   complete:
>   	mutex_unlock(&sensor->mutex);

