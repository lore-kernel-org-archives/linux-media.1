Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B910346E46
	for <linux-media@vger.kernel.org>; Sat,  2 May 2026 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777743582; cv=none; b=iPMtP9VhNPbIkBG0IOzT1Pobu5JuUllOjwzN+zNlrZezlZrzv7LDk82JU7+Wdz3cS//xloTeiQk/MxhOSG0V1yvFoLv53RqWVCycyxjcHesV64jpjGIaNP1npJhcKsqADmgny0rLsULWDc65R9DicF7vwLwOJGtl2SWFXT3a6FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777743582; c=relaxed/simple;
	bh=jN37WTXJ4cQjjvlsoHSIcGjoOf0fYpj28ukSu7y+WGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OErfrvKNmzOAdzrvoxndppRhWXDaK/q4GEhwAbAgNA8Erzx2A1FsmE5STN/YXzH2x9oI7ME6x7EFhC4LVqTrPzgM2UaYZvjzaYjllsWhkSky0M23s4dfBizzp3+8+yvE02JX/GPwgq5oj2J9xJVWk+7kYW8BxrJ0m6xcVtPHDsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DolQjWiS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DolQjWiS"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9820E177;
	Sat,  2 May 2026 19:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777743578;
	bh=jN37WTXJ4cQjjvlsoHSIcGjoOf0fYpj28ukSu7y+WGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DolQjWiSSFljxQij1RRDmx0oSWbc3lof/HGlvv69Pb2SM2sBlfoCvzRxgzAO2riL8
	 O6P3UPZuUZARVo8+RHdtUqGI/DOaWTVt/vT5efvZfgvlgs23CpmPrSrwcrN6GqBdDw
	 Ns9VdFGZpvyo85eWWgCsRRfRxIZ/hMG062kIyDgI=
Date: Sat, 2 May 2026 20:39:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] media: uapi: rkisp: Correct name version enum
Message-ID: <20260502173937.GD488660@killaraus.ideasonboard.com>
References: <20260501190339.3449193-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501190339.3449193-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, May 01, 2026 at 09:03:39PM +0200, Niklas Söderlund wrote:
> The name of the enum to hold the mapping of parameter buffer versions
> have a typo in the name, correct it. While this is a uAPI header the
> impact should be minimal as the enum is only used as a collection for
> the one version number supported.
> 
> Fixes: e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/uapi/linux/rkisp1-config.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index b2d2a71f7baf..7638b2220600 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -1535,11 +1535,11 @@ struct rkisp1_ext_params_wdr_config {
>  	sizeof(struct rkisp1_ext_params_wdr_config))
>  
>  /**
> - * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
> + * enum rkisp1_ext_param_buffer_version - RkISP1 extensible parameters version
>   *
>   * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
>   */
> -enum rksip1_ext_param_buffer_version {
> +enum rkisp1_ext_param_buffer_version {
>  	RKISP1_EXT_PARAM_BUFFER_V1 = V4L2_ISP_PARAMS_VERSION_V1,
>  };
>  
> @@ -1601,7 +1601,7 @@ enum rksip1_ext_param_buffer_version {
>   *	+---------------------------------------------------------------------+
>   *
>   * @version: The RkISP1 extensible parameters buffer version, see
> - *	     :c:type:`rksip1_ext_param_buffer_version`
> + *	     :c:type:`rkisp1_ext_param_buffer_version`
>   * @data_size: The RkISP1 configuration data effective size, excluding this
>   *	       header
>   * @data: The RkISP1 extensible configuration data blocks

-- 
Regards,

Laurent Pinchart
