Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C8273803;
	Fri,  6 Mar 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804178; cv=none; b=DTDg5EHXELJiKMR2XG0GxD1pos6jqwFDh7WQc4oGdOwFoUfB7MIQOvvWPlfz6pHgWjvemMfDpv7koF8dkSES/+FFJavWs1H0QvlFILerEeJwmOzOh+f7vibLPF2i7p+UOPnes4/RjEKMzaC9TMN+L2igzyOo/6GX2/Q5GhlGgWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804178; c=relaxed/simple;
	bh=+6D4OxpZqcg4DuFOSca3tuunByhsEAjHV3Hnv7eqygI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhNrA3VfAt8DInJtV3dhuUyMOYHW7EI0T4Dv9AwKpX6W9ChLy7207Y3gEqBH5m+ic9PHL4QNfG8XpR1b/tSK1YPA9tgYf9IY2jf5f98SgaKtLkAs1BWxphc1RrK/iPZJhMxYxX1rKsjZ0YYDzYgF9cG3Y7LG1nQOqiUctoYlTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbnT14hv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbnT14hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772804177; x=1804340177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+6D4OxpZqcg4DuFOSca3tuunByhsEAjHV3Hnv7eqygI=;
  b=mbnT14hvZ4KGXzO7THa+ZBVYIC7djt+ykZtUoxhSz9JOpTBE4GvqjBfu
   eZpwWaJymdUvLvFHMHcqLp3bURRbUcj5QmHQJpzCUgEnrDBCWZD2UD3RL
   AOg3UUXjE0I1xVPUMVLJbjH6D9Faz4ys1BM/361tSUWMI9zeHQbZfn2c7
   DsA8kcR5psQeLOUG3X+YpgfFgKCeKWJhrAz/4UU4TKzScG1QNRuVaH8qu
   Y0T8uH37jrZOw86iXBf34KsN8szLMXYSHnGHWq7Mqx5hHXDZBpXDkp5po
   Kz9OMmv11hMoAGguOs6DatGC9Ifn3kGMfOGuSbuGhTdwSjmXBrHxNZQGT
   g==;
X-CSE-ConnectionGUID: EzkoW/WTRxCkd6kRn1VRPg==
X-CSE-MsgGUID: 0wrSJu31R0CXPUBIcQ29dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74099151"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="74099151"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 05:36:17 -0800
X-CSE-ConnectionGUID: zL5i0zlITMilStrk8xP5gQ==
X-CSE-MsgGUID: nc0smv/CQtapU82CY7Vqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="219143991"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.201])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 05:36:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BD236121DC0;
	Fri, 06 Mar 2026 15:36:44 +0200 (EET)
Date: Fri, 6 Mar 2026 15:36:44 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: mehdi.djait@linux.intel.com,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] media: i2c: os05b10: Update active format before
 adjusting framing controls
Message-ID: <aarYbAf8jnodZ4UV@kekkonen.localdomain>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
 <20260306123304.76722-12-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306123304.76722-12-tarang.raval@siliconsignals.io>

Hi Tarang,

On Fri, Mar 06, 2026 at 06:03:01PM +0530, Tarang Raval wrote:
> os05b10_set_pad_format() calls os05b10_set_framing_limits() before updating
> the ACTIVE format. As a result, the VBLANK control handler uses the old
> height when recalculating exposure limits, causing -ERANGE when switching
> to a larger resolution.
> 
> Update the ACTIVE format before adjusting framing controls so control
> callbacks use the correct dimensions.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 4601e33b7e8f..476dbcb49351 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -902,14 +902,14 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
>  
>  	format = v4l2_subdev_state_get_format(sd_state, 0);
>  
> +	*format = fmt->format;
> +
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		ret = os05b10_set_framing_limits(os05b10, mode);

Does it take a driver bug for this to happen? Presumably? I guess the
result would be somewhat inconsistent state in any case.

>  		if (ret)
>  			return ret;
>  	}
>  
> -	*format = fmt->format;
> -
>  	return 0;
>  }
>  

-- 
Regards,

Sakari Ailus
