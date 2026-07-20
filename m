Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2A031AF1B;
	Mon, 20 Jul 2026 21:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584164; cv=none; b=g3qVaLkAY7ltSsaalJ5NHLyQG0N4SweZ61Y0MTGIWanQjevv2nUw2Jya5Hj1CerPnKLWIQ4fFo1ibU68IbT1BMxCZGcmONBmECGx/VhhcKa3ee9DsDLy/21ui8t1Lb22ZAJXiBbXyurJXLMs4OMhk66bh6rpR8DaNBRbvac8ObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584164; c=relaxed/simple;
	bh=bxeKhxPra0/TrWcL8Baz4fn4UyMC1HHMu0gQn9WgXwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=By8kXDSrDmSXWtY/JVdQNdTG7eQ8mQoHnPKfK3ZDoGArEemNaRSyxlU8jNNKUtAjRQEMMyG16zKDijwS5HCk+R63c6V/Bqj4juMRhb2GEOifivCnBwnF/TWa2XLbs5MCVC9sVMA259BU1KPJFhh2ZTD6wh7RneAHAG8Rw2+/GaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tB4D82oy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tB4D82oy"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F613289;
	Mon, 20 Jul 2026 23:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784584102;
	bh=bxeKhxPra0/TrWcL8Baz4fn4UyMC1HHMu0gQn9WgXwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tB4D82oy9LFkgPWxI3XPD/EZ1a5pVPNO/VLsjKLT0xxvh44a0ZDRYxa7PIzaH7/Kl
	 ju4kcWPWJIqRhAz79cfFuosB+XlubgavryiU9Qh2+SoXJvW5vhDQBcfZm5+utIkfo1
	 168PNjK/MlwWotoflJWoW8fFe99HdADFmWGImKI0=
Message-ID: <ef0a434f-cbe1-49f7-a573-b0a4146b8b31@ideasonboard.com>
Date: Mon, 20 Jul 2026 22:49:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: i2c: ov5693: Gate the MIPI clock lane for
 non-continuous clock
To: Fernando Rimoli <fernandorimoli11@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Arsalan Naeem <naeemarsalan@gmail.com>, Jakob Berg Jespersen <dev@berg.pm>,
 linux-kernel@vger.kernel.org
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-4-fernandorimoli11@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260720163819.104130-4-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fernando, thanks for the patch

On 20/07/2026 17:38, Fernando Rimoli wrote:
> The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
> power-on default (free-running MIPI clock). The IPU3 CSI-2 receiver
> tolerates this, but the IPU6 receiver (e.g. on Microsoft Surface Pro 8/9
> and Surface Go 4) fails to lock onto the link, so the sensor streams but
> capture times out with "stream stop time out" and no frames arrive.
> 
> Parse the "clock-noncontinuous" endpoint property (which sets the
> V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag) and, when it is present, gate
> the clock lane while idle (bit 5) and keep the bus in LP11 (bit 2) at
> stream on, matching the approach ov5647 already uses for the same
> register. When the flag is absent the register is left at its reset
> default, so IPU3 and other users are unaffected.
> 
> Gating the clock lane was determined to be necessary and sufficient by
> sweeping the register at runtime on a Surface Pro 9 (IPU6): every value
> with bit 5 set streams (300/300 frames, steady 28 fps), every value with
> bit 5 clear fails with the CSI-2 timeout; register read-back confirmed
> the power-on default is 0x00. Bit 2 (bus idle in LP11) is set as well,
> matching ov5640's value. Note that unlike ov5647 the line-sync bit
> (bit 4) is deliberately not set: adding it collapses the IPU6 stream to
> a couple of frames, so this value differs from ov5647's - the IPU6 D-PHY
> behaves differently, consistent with these settings being PHY-specific.
> 
> The "clock-noncontinuous" property is supplied by the ipu-bridge for the
> affected IPU6 variants in a subsequent patch.
> 

This one looks good to me:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> Link: https://github.com/linux-surface/linux-surface/pull/2171
> Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> Tested-by: Jakob Berg Jespersen <dev@berg.pm>
> ---
>   drivers/media/i2c/ov5693.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 02236f3db..5468e89d6 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -35,6 +35,14 @@
>   #define OV5693_STOP_STREAMING			0x00
>   #define OV5693_SW_RESET				0x01
>   
> +/* MIPI transmitter control */
> +#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
> +/* bit 5: gate the clock lane when idle; bit 2: keep the bus in LP11 when idle */
> +#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
> +#define OV5693_MIPI_CTRL00_BUS_IDLE		BIT(2)
> +#define OV5693_MIPI_CTRL00_NCONT_CLOCK		(OV5693_MIPI_CTRL00_CLOCK_LANE_GATE | \
> +						 OV5693_MIPI_CTRL00_BUS_IDLE)
> +
>   #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
>   /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
>   #define OV5693_CHIP_ID				0x5690
> @@ -144,6 +152,9 @@ struct ov5693_device {
>   	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
>   	struct clk *xvclk;
>   
> +	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
> +	bool clock_ncont;
> +
>   	struct ov5693_mode {
>   		struct v4l2_rect crop;
>   		struct v4l2_mbus_framefmt format;
> @@ -611,6 +622,19 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
>   {
>   	int ret = 0;
>   
> +	/*
> +	 * When the CSI-2 link is configured for a non-continuous clock, gate
> +	 * the MIPI clock lane while idle (bit 5) and keep the bus in LP11
> +	 * (bit 2). The power-on default of MIPI_CTRL00 is 0x00 (free-running
> +	 * clock): the IPU3 CSI-2 receiver tolerates that, but the IPU6 one
> +	 * fails to lock onto the link and capture times out. Only touch the
> +	 * register when the endpoint requests a non-continuous clock, leaving
> +	 * the reset default in place otherwise.
> +	 */
> +	if (enable && ov5693->clock_ncont)
> +		cci_write(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
> +			  OV5693_MIPI_CTRL00_NCONT_CLOCK, &ret);
> +
>   	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
>   		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
>   		  &ret);
> @@ -1259,6 +1283,9 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
>   		goto out_free_bus_cfg;
>   	}
>   
> +	ov5693->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
> +			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> +
>   out_free_bus_cfg:
>   	v4l2_fwnode_endpoint_free(&bus_cfg);
>   

