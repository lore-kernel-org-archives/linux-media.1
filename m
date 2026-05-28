Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACAD2F9D85;
	Thu, 28 May 2026 20:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779999620; cv=none; b=cXIB7D2hP+l9hZDg5V/pwYaZpTwlT0z7WwcMQ1hMQDN4Uwk+mPLkMxJJeCV65pGv+uF7dLgn2eXJSuUgJgw0Fb2teLWpMpuntlIcF+vHiA2cC4B2eeDtYoslZERtLuPuLADBn7Zg/c/WMprXwBmSXdD+LvmlYw/htC5NxGxUQgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779999620; c=relaxed/simple;
	bh=ZCGyZI8wifIjhFDagvUrX6gqM7stQBYBDK9vq/+R0C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJpv7bryxoS5iUTeCXKUll78T/bu7wHr1pdNrec5cD7XbDrHD1OvR4KbmtRji1vbwUsJVRtJKsTd4/rmG51xzJRtmi2Vxn6bEk1q3eC8Te4lBTpDsopyE9o5EWgxmDtRSwGk8v/A7akEvLFifySpU+y7vWX5vv2nV1ZjBYGTTQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCoC1s65; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCoC1s65"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A721F00A3A;
	Thu, 28 May 2026 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779999618;
	bh=nKN4dqnwegO9FlUIRMbPnjBCgtWScrSJFHv/7vsDYU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dCoC1s65+4P4jVfwSVXrstsl5s+yJle/OUhDuOlouGo9c0mqvBzWrEga9Fbjf/KR8
	 PncXTP9sWCGu6G6W7aXuL8wJNSZ+AZaBIg53F4GdgOPNhEYNL0ZLNUshXMTu2zEKGC
	 KYOneGmVl5wQu1zh/dosrIdgbWnaKlADYfZfinQA38OPmSQLUJRyaV+Kfso5UkQUvD
	 6OXdXEeiBvi7zIi5rLs5fR+QrFijU2PhdPUTD6CXjBpDcHsH9qfEdX2ltpSyK4J7zB
	 lXF3Yc4v4X3emCQ8hnSwEQZvNbPcGsqYlNNQmdw+EH3SYjB0yWGIEIBw15HamnNM+t
	 8UgNQ1kmL4C+w==
Message-ID: <0431e778-cc48-4053-a96e-21222aab8551@kernel.org>
Date: Thu, 28 May 2026 23:20:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] media: microchip-isc: smooth AWB gains with EMA
 filter
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 stable@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
 <20260527-microchip-isc-fixes-v5-11-b0ec1bb954be@microchip.com>
From: Eugen Hristev <ehristev@kernel.org>
Content-Language: en-US
In-Reply-To: <20260527-microchip-isc-fixes-v5-11-b0ec1bb954be@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/27/26 14:07, Balakrishnan Sambath wrote:
> Apply exponential moving average (alpha=0.25) to reduce per-frame
> flicker from sensor noise.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/media/platform/microchip/microchip-isc-base.c | 19 ++++++++++++++++---
>  drivers/media/platform/microchip/microchip-isc.h      |  1 +
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
> index a2719830d39b..d07ea2fa33c6 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -94,6 +94,7 @@ static inline void isc_reset_awb_ctrls(struct isc_device *isc)
>  	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
>  		/* gains have a fixed point at 9 decimals */
>  		ctrls->gain[c] = 1 << 9;
> +		ctrls->gain_smooth[c] = 1 << 9;
>  		/* offsets are in 2's complements */
>  		ctrls->offset[c] = 0;
>  	}
> @@ -1477,11 +1478,23 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
>  		/* Combine stretch and grey-world gains; result stays in Q9. */
>  		gain = (s_gain * gw_gain) >> 9;
>  
> -		ctrls->gain[c] = clamp_val(gain, 0, GENMASK(12, 0));
> +		/*
> +		 * Smooth gain updates with an exponential weighted average
> +		 * to suppress per-frame flicker:
> +		 *   smooth[n] = (3 * smooth[n-1] + gain) / 4
> +		 * Clamp to the hardware register width to prevent unbounded
> +		 * accumulation under degenerate (near-empty histogram) inputs.
> +		 */
> +		ctrls->gain_smooth[c] = (3 * ctrls->gain_smooth[c] + gain) / 4;
> +		ctrls->gain_smooth[c] = min_t(u32, ctrls->gain_smooth[c],
> +					      GENMASK(12, 0));
> +
> +		ctrls->gain[c] = ctrls->gain_smooth[c];

If now 'gain' becomes 'gain_smooth' , what is the purpose of still
having 'gain' at all ?
Does it make sense to just recompute gain in the new way ?


>  
>  		dev_dbg(isc->dev,
> -			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u",
> -			c, hist_min, channel_avg, s_gain, gw_gain, gain);
> +			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u smooth=%u\n",
> +			c, hist_min, channel_avg, s_gain, gw_gain, gain,
> +			ctrls->gain_smooth[c]);
>  	}
>  }
>  
> diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
> index 45168c62e3bc..0ae9b4e8f32d 100644
> --- a/drivers/media/platform/microchip/microchip-isc.h
> +++ b/drivers/media/platform/microchip/microchip-isc.h
> @@ -149,6 +149,7 @@ struct isc_ctrls {
>  
>  	/* one for each component : GR, R, GB, B */
>  	u32 gain[HIST_BAYER];
> +	u32 gain_smooth[HIST_BAYER];
>  	s32 offset[HIST_BAYER];
>  
>  	u32 hist_entry[HIST_ENTRIES];
> 

