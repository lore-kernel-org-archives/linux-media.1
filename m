Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A439FCCC;
	Tue, 28 Jul 2026 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260158; cv=none; b=O4mZPkXj6rlXfyQMxcxsh3oL7gToZAR5xAC1V+pvt1L4v4bBPJ5D9jTdsNMumA+LKfctjcICWYAsTGC9f6yATKVy9YcrxpXaWs/zdjQFtSejTTM7ZBbHxofkS930wVUU3sGnkJekayffN8v9o+eVgukOYKuF2YfDiSXgwjHPr74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260158; c=relaxed/simple;
	bh=wKSbUJYBsVouSkuQ34d7LY8bCLzU9cyYRqWbp5y1s6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWFK/ybE2m/q75aB+LhAU0k8aXFytBuq1Q/BO4BF9g3AWKvc2eCm7QNWBlA0gP+rcjVUGCnxlNi54+QLXVwOJCnxYXejhiHHgHVXO38igyQd3jySaSARoVbM/BvaIX/B1PPAV1LiJUbQu63CVnjKwd9YRtssmztLV49ouwICTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7wQwAV3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7wQwAV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785260156; x=1816796156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wKSbUJYBsVouSkuQ34d7LY8bCLzU9cyYRqWbp5y1s6Q=;
  b=S7wQwAV3lb+VblSONv1FDlbicWdEKDi+TzKjy1a1AGMswe7HnK/9jram
   DGILbhj/0ek/EHRpNyVj6PoELDoU4Ml4KronCNWqDv/HRnqahqoy6q5/0
   +qvF0gptbMmIajJmuAQeGbSO9ZGGrGuvGL8oKQhgZTOMqEzx6SLONmugy
   0j1E/v1ks1LXWvp+FdgL/n+Ct4ozZCWnMMe20TxDthhC6344ducYKgJwU
   UxyMhlyk2QcRVqOL6g9GFlcK+5HDQkPOKkMe3waE+XKGOXUBbv/qHRF4I
   xWX4oHVSpqOiO/oRhjeD3WXWPFxfwG34FtXtBxIu6yp9kgFMiPtqHDlNp
   A==;
X-CSE-ConnectionGUID: /Mgj+NIaT5eImtBAbLnr+w==
X-CSE-MsgGUID: wR552PdPTHWUxYyiRfLtMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89744021"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="89744021"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:35:55 -0700
X-CSE-ConnectionGUID: WQ4eIaXiQ5eQoJS4qYqcBw==
X-CSE-MsgGUID: Rbxi6+lWQaWmyQLE5C5lUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257095261"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:35:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8BD6F121C2B;
	Tue, 28 Jul 2026 20:35:51 +0300 (EEST)
Date: Tue, 28 Jul 2026 20:35:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Yifei Gao <gyf161023@gmail.com>
Cc: Bin Du <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: amd: isp4: fix self-deadlock in
 isp4sd_pwron_and_init() error path
Message-ID: <amjod6Yc7-rRAKDw@kekkonen.localdomain>
References: <20260727183500.298036-1-gyf161023@gmail.com>
 <20260728141659.62310-1-gyf161023@gmail.com>
 <20260728141659.62310-3-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728141659.62310-3-gyf161023@gmail.com>

Hi Yifei,

On Tue, Jul 28, 2026 at 02:16:50PM +0000, Yifei Gao wrote:
> isp4sd_pwron_and_init() holds ops_mutex through guard(mutex) for the
> whole function. On any initialization failure it jumps to the err_deinit
> label and calls isp4sd_pwroff_and_deinit(), which takes the same
> ops_mutex through its own guard(mutex). Because the guard in
> isp4sd_pwron_and_init() still holds the lock at err_deinit, the call
> re-acquires a non-recursive mutex held by the same thread and deadlocks
> on any initialization failure.
> 
> The error path cannot simply drop the lock and keep calling the full
> teardown, because that teardown is not valid at the earlier failure
> points. In particular, pm_runtime_resume_and_get() drops the usage
> counter again on failure (via pm_runtime_put_noidle()), so no PM
> reference is held when it returns an error; calling pm_runtime_put_sync()
> unconditionally would underflow the usage count, and the teardown would
> also touch ISP MMIO while the device is not powered. This was previously
> masked by the deadlock, since the thread never reached the teardown body.
> 
> Replace the single teardown call with staged labels that unwind only the
> resources actually acquired at each failure point. The error path no
> longer calls the locked isp4sd_pwroff_and_deinit(), which removes the
> deadlock, and each failure now skips the steps it never reached, keeping
> the runtime-PM count balanced and not accessing MMIO while unpowered.
> isp4if_start() and isp4sd_start_resp_proc_threads() already clean up
> after themselves on failure, so their resources are not unwound again.

Please make this more concise; the issue being addressed by the patch below
is much easier understood by looking at the patch than reading the above
explanation -- that shouldn't be the case. The aim here is not to describe
each detail of the change.

> 
> Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
> Assisted-by: Claude:claude-opus-4-8 smatch
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> ---
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 48deea79ce6c..868d1c74d35e 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -687,7 +687,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  		if (ret) {
>  			dev_err(dev, "fail to power on isp_subdev ret %d\n",
>  				ret);
> -			goto err_deinit;
> +			goto err_module_disable;
>  		}
>  
>  		/* ISPPG ISP Power Status */
> @@ -697,7 +697,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  			dev_err(dev,
>  				"fail to set performance state %u, ret %d\n",
>  				perf_state, ret);
> -			goto err_deinit;
> +			goto err_power_off;
>  		}
>  
>  		ispif->status = ISP4IF_STATUS_PWR_ON;
> @@ -709,12 +709,12 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  	ret = isp4if_start(ispif);
>  	if (ret) {
>  		dev_err(dev, "fail to start isp_subdev interface\n");
> -		goto err_deinit;
> +		goto err_perf_restore;
>  	}
>  
>  	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
>  		dev_err(dev, "isp_start_resp_proc_threads fail\n");
> -		goto err_deinit;
> +		goto err_stop_interface;
>  	}
>  
>  	dev_dbg(dev, "create resp threads ok\n");
> @@ -724,8 +724,24 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  	isp_subdev->irq_enabled = true;
>  
>  	return 0;
> -err_deinit:
> -	isp4sd_pwroff_and_deinit(sd);
> +
> +err_stop_interface:
> +	isp4if_stop(ispif);
> +err_perf_restore:
> +	ret = dev_pm_genpd_set_performance_state(dev, ISP4SD_PERFORMANCE_STATE_LOW);
> +	if (ret)
> +		dev_err(dev, "fail to set performance state %u, ret %d\n",
> +			ISP4SD_PERFORMANCE_STATE_LOW, ret);
> +err_power_off:
> +	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
> +	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
> +	ret = pm_runtime_put_sync(dev);
> +	if (ret)
> +		dev_err(dev, "power off isp_subdev fail %d\n", ret);
> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
> +err_module_disable:
> +	isp4sd_module_enable(isp_subdev, false);
> +	msleep(20);
>  	return -EINVAL;
>  }
>  

-- 
Regards,

Sakari Ailus
