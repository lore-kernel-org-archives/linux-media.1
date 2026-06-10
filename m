Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9429372670
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077959; cv=none; b=mwvmaChK3WHuHqMRuo3mkITJVHOL6y2nx0eE4Xf/W/KV/s4VqIo2StI0nmehkcCoiU4VXyk1ng8ED4AIbR/NKd0HYl3ph2UBH2mclLopuoP5VOlN4SPUSXlzTfCVBzLjmDTojOByXOi6XNWNHa9qy9RFaNnhFPw7M1jOIxBtyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077959; c=relaxed/simple;
	bh=ap/Ryu+KjLToKs8iSceXNGYcif+i9DLU8OoiyrgjXCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxOD9y61RvNPjnXzMlmrhMWekzjj8814yJ7IWleutumDKTKIS0vh0YmlNWzd2EhKpArlu5ZVflamxDo8c4VdNVOAs/nJ+/fPav1tfsXiGGNxaKoqDao/9LyJsi9u0COz2AgySbSs0trQD0Gh3ry1lrzmB/TKIk1eUwV9DmC/czA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ju3ZIN9H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ju3ZIN9H"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D39D1E6;
	Wed, 10 Jun 2026 09:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781077927;
	bh=ap/Ryu+KjLToKs8iSceXNGYcif+i9DLU8OoiyrgjXCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ju3ZIN9HrItP9Kl1CyvOln7x+ohuy1GjTLUQ4dcmTJHY6mf3cDZn2shLntLzBeluQ
	 kpGExuag0+9XWTSXOWNGSn7i6noIewJ4kQOgQoCc6tctHxf1Ja6C8PwDtzav0+/sQk
	 gj2QdDpRW074/poTurdoZDiCS88tuYPlg/BTFiJE=
Message-ID: <6a599060-0e44-45d1-8387-30d355233ee3@ideasonboard.com>
Date: Wed, 10 Jun 2026 08:52:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ov8865: Drop PM runtime reference if
 stream start fails
To: Jurison Murati <eng.juri@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20260609232255.13559-1-eng.juri@gmail.com>
 <20260609232255.13559-2-eng.juri@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260609232255.13559-2-eng.juri@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jurison

On 10/06/2026 00:22, Jurison Murati wrote:
> ov8865_s_stream() takes a runtime PM reference when enabling the
> stream, but returns without releasing it if ov8865_sw_standby()
> fails, leaving the reference unbalanced and the sensor powered
> indefinitely.
> 
> Signed-off-by: Jurison Murati <eng.juri@gmail.com>
> ---

Good spot, thanks:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2647,8 +2647,11 @@
>   	ret = ov8865_sw_standby(sensor, !enable);
>   	mutex_unlock(&sensor->mutex);
>   
> -	if (ret)
> +	if (ret) {
> +		if (enable)
> +			pm_runtime_put(sensor->dev);
>   		return ret;
> +	}
>   
>   	state->streaming = !!enable;
>   

