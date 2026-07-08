Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB0403AF3
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500886; cv=none; b=KW3sqQ06gSICkZaB4Vp0MRsOJn9EyP570J0tybN93kjWX3lCp/y28t4MD1xxBHwO/57PsF1EtBYaN5uGUZKCFnW+uoADbcCm4Yb3Fs2O2KoSZEubdoOj1G5uvzHKjpFmpEU7njLGpuAbo02wPiHPCLvaMcactc4vXd3zbj3W1cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500886; c=relaxed/simple;
	bh=GHusY9qm4DxIFScm2QgSEMMkKpfGskY7/4EHwgl915Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYHbBeUCHaqHZaoHoWCg/UzWqF1yseAyDTpf1g3vf++XDq9a+0u4TWR7lkgCrXM3hVDZ2pwvz14gfr3nvaoHfFUHFMPqHwuXdxEvkUnOcAt0M71HacTcKCsGmdb3K97Rm7SGhxQn1iU3D2tTAAyqaU+Of6lZfMXxEfqzufeZXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUKrkNXH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUKrkNXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783500886; x=1815036886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GHusY9qm4DxIFScm2QgSEMMkKpfGskY7/4EHwgl915Q=;
  b=gUKrkNXHirgg18dSDYdfTC/dR3bwGMZeRFKmJGpvMyk7BJUZkkMzUcRx
   WHsHLnfreHrr7BHPODGHtHATzw2loAvDa51+5zVU1664nNaibuizwHr4D
   1p8vAsKUgszBf4NKoSGrUsw42Hqj68zYXvMXjIi8qk7mlfv4Z85crwLuc
   44xasr8RMTEzm9oq+rynsihnnSM7ynRoQ4QhzohIvQNwrQriM/g8xXd18
   KuZliMG8VAK8kiDbUr0+ouz16c0nn/GwPMChrdBMxPrreaqoW5S96oQ4o
   P9PIeuUYQhx60kuXw7ccmcv0/ZB0jl8k17CRUpMQuffjiJ2fyJNl+VjXO
   g==;
X-CSE-ConnectionGUID: W3LRPk+VTMaKceCEmhFjXQ==
X-CSE-MsgGUID: zVUiEnLCSjKNrCEoGxHgag==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101580486"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101580486"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:54:45 -0700
X-CSE-ConnectionGUID: JGe13JAmQvaq0U5OtnOskQ==
X-CSE-MsgGUID: ecgbYFn7Rp69t0UwiayLYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250243706"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:54:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7FD0811FB4A;
	Wed, 08 Jul 2026 11:54:43 +0300 (EEST)
Date: Wed, 8 Jul 2026 11:54:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: ov5640: Drop manual
 fwnode_handle_put() via scope-based cleanup
Message-ID: <ak4QU73SRDycjGsF@kekkonen.localdomain>
References: <20260616081517.44685-1-birenpandya@gmail.com>
 <20260616081517.44685-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616081517.44685-2-birenpandya@gmail.com>

Hi Biren,

On Tue, Jun 16, 2026 at 01:45:15PM +0530, Biren Pandya wrote:
> Utilize the __free(fwnode_handle) scoped guard macro from
> <linux/cleanup.h> to automate the lifecycle management of the endpoint
> fwnode in ov5640_probe().
> 
> This eliminates the need for the manual fwnode_handle_put() call,
> preventing potential memory leaks in error paths and simplifying the
> probe routine.
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/ov5640.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 85ecc23b3587..418cade11d00 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2014-2017 Mentor Graphics Inc.
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> @@ -3845,7 +3846,7 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  static int ov5640_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct fwnode_handle *endpoint;
> +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;

The recommended pattern in __free() use is to assign something else than
NULL to it in declaration unless required otherwise.

>  	struct ov5640_dev *sensor;
>  	int ret;
>  
> @@ -3878,7 +3879,6 @@ static int ov5640_probe(struct i2c_client *client)
>  	}
>  
>  	ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
> -	fwnode_handle_put(endpoint);
>  	if (ret) {
>  		dev_err(dev, "Could not parse endpoint\n");
>  		return ret;

-- 
Regards,

Sakari Ailus
