Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF2409263;
	Wed,  8 Jul 2026 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523054; cv=none; b=lL0chzSR27IVZyxeVolDGQsE7R76ewFW1xsM9f56aIJ9bC9INMDB4GEXTgRnsr9YFs4LLgOC7GsGrxE1dJljrxcmUCzfZOUcPuY+1Z4T9YtbXgGrZ/a55LDWG41Cc2o65j+myQ0N/bM/U26eWd2ToKauH6sGi7J3nkO/ND74Frk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523054; c=relaxed/simple;
	bh=ZZpg8A+rIRcn+8itiF87hNZtG2qu7fvDh8gEoQxK+lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9anzBwfQMHblNkQB4vhPLDoMN7AFwdy5KjAeaEBsep9daB87SBlTrAsOyBSYhHzjHZRcwk2dtxjRl0dyzrFPxQR+7i5JsHqNUcn+qvf0TAOz/8MjNvqAbsxeXw5KaSIEm0+JHDzzLDbmZa3oHWrQfmdkl8fN4piuVBDTWCo/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGoQ05uo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGoQ05uo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783523049; x=1815059049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZpg8A+rIRcn+8itiF87hNZtG2qu7fvDh8gEoQxK+lU=;
  b=GGoQ05uo0Ux/thE0FbUUwc02atdZcEr/USzpIdrxlSVyd7VsGeCzSAdQ
   LZIWQL9mbTSADFDYUCYZMpEWDSvVvDSE6TVG6v0tj+Te2QFotLPiY705a
   iJqZ+LYpZVikdCvdc5DTb83pWYZ5xALecHaw/u+EjnwbAIsNtAO9xEs8O
   1fxZOo+zKKNlRwKIC0Mgsm8t6aRGUfs1PozNzKPo3tHfkD0nXcjTe/Xyr
   bcD0IxlW79OmULOHBH7pVecW9lB3pX5FfR1D2AeWJ7RPucl957oJDg201
   otdsTQnvgVZPsGC+2OqsXwJ7i2BH4QQzQPi2bPpyDpI5KHBer2BZjMq6C
   g==;
X-CSE-ConnectionGUID: DwkSWqF7SuODX1jzfi3u9g==
X-CSE-MsgGUID: pkonbQAqQzyCx1vpNnbr/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109733976"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="109733976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 08:04:04 -0700
X-CSE-ConnectionGUID: hALrnO3LTSmb8a3SfS9DDA==
X-CSE-MsgGUID: umfwa/0ISpeyVFB/GMkDhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253833060"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 08:04:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E48E011FB4A;
	Wed, 08 Jul 2026 18:04:01 +0300 (EEST)
Date: Wed, 8 Jul 2026 18:04:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: rdacm21: Fix missing
 media_entity_cleanup()
Message-ID: <ak5m4UZKfO6dvz2L@kekkonen.localdomain>
References: <20260704201627.82584-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704201627.82584-2-birenpandya@gmail.com>

Hi Biren,

Thanks for the patches.

On Sun, Jul 05, 2026 at 01:46:28AM +0530, Biren Pandya wrote:
> The driver misses calling media_entity_cleanup() on the probe error path
> and during remove, leaking resources if probe fails after entity
> initialization or when the driver is unloaded.
> 
> Fix this by adding media_entity_cleanup() to the rdacm21_probe() error
> handling path and to rdacm21_remove().
> 
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
> Changes in v2:
> - Fixed a bug in v1's probe error handling where media_entity_cleanup() could be called on an uninitialized entity.
> - Added Signed-off-by tag which was missing in v1.
> 
>  drivers/media/i2c/rdacm21.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index bcab462708c70..ece8a410e7ced 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -588,10 +588,12 @@ static int rdacm21_probe(struct i2c_client *client)
>  
>  	ret = v4l2_async_register_subdev(&dev->sd);
>  	if (ret)
> -		goto error_free_ctrls;
> +		goto error_entity_cleanup;
>  
>  	return 0;
>  
> +error_entity_cleanup:
> +	media_entity_cleanup(&dev->sd.entity);

A newline would be nice here.

Somehow the patch can't be found in linuxtv.org...

>  error_free_ctrls:
>  	v4l2_ctrl_handler_free(&dev->ctrls);
>  error:
> @@ -606,6 +608,7 @@ static void rdacm21_remove(struct i2c_client *client)
>  
>  	v4l2_async_unregister_subdev(&dev->sd);
>  	v4l2_ctrl_handler_free(&dev->ctrls);
> +	media_entity_cleanup(&dev->sd.entity);
>  	i2c_unregister_device(dev->isp);
>  }
>  

-- 
Regards,

Sakari Ailus
