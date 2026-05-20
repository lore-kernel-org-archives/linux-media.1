Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7AC3D34AA;
	Wed, 20 May 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271308; cv=none; b=FS4CKZZ/Iw49t1cV52/8XDRkLHVnaQu8GUclrEF5oPtmryUr75zO/cCQ45TvLIgluxdKF/5Hwfvxp/35xvPUNisFs7i33YiaBkYeuebZatgJTxHr1gTPnZMk2jVu/fnpVujDUYYAiwKOFLj17h5enrSXc4gWXY89CzVayABvYfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271308; c=relaxed/simple;
	bh=YnLknIGS4XbkHZnWaiPwfs5cFREV1ywnq4Fc7QqDOtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIlH2e+dCfiyfuSfgltOCFhTl+mjm0uCoiBNgD48zO4Y7FbYnvqeO63m8YjZkIugvr+7E24NA9xipbmR/6pzxJPcdQA2ZLwAJ+bSpwl0hWnxC5pYhREABpo0W2kTDiMnBIqCERGqsPTNEBP6UPcnJ83Jj90/DolvBo1lERXKQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fj3ResDl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fj3ResDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779271307; x=1810807307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YnLknIGS4XbkHZnWaiPwfs5cFREV1ywnq4Fc7QqDOtc=;
  b=fj3ResDl/9UeVZAVmQTfRId4gyztbX9Yq4+JjLG/DO8j8u5h6OnJFETX
   PQO+VyGmnBcRwD+UqJ80WyfcDs8gxixzi/orAfyM7ulIRV2Z4vmKkOHZL
   zEqAma6mjisuo1+UGThBt9B5WW7CiY6VlRKWzmZYpIJnz5mGdefw85o9r
   9aIV7Gun7Te+VRVotuoCtM6HboqkNyS+GWR9AOwShchBwJIzQj97Q+upT
   i4Ttg0cSDJr42kEe+F7Ld7CcaQemitV7AfDpgOdWqPpe6oHMNDuxYDW1z
   Dku7a00mtD49wxqL9nPzqwMbnnBE4fQI37BCbuRmuPv8k+Fvy69sa89gA
   w==;
X-CSE-ConnectionGUID: dV695rkfQiGBY/eDzEET2w==
X-CSE-MsgGUID: KUe25qC5RQOSfd54kIcb7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79189189"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="79189189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:01:46 -0700
X-CSE-ConnectionGUID: Lvx7cLpGSnmAI5VxUelhIw==
X-CSE-MsgGUID: 1zfTYh5AQSCBGKQEOoMyoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="239973475"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:01:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7A4A211F951;
	Wed, 20 May 2026 13:01:40 +0300 (EEST)
Date: Wed, 20 May 2026 13:01:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>, Ma Ke <make24@iscas.ac.cn>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-dev: do not fire driver's release on
 __video_register_device() failure
Message-ID: <ag2GhHyuomEqUq88@kekkonen.localdomain>
References: <20260520090624.1071139-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520090624.1071139-1-lgs201920130244@gmail.com>

Hi Guangshuo,

Thanks for the patch.

On Wed, May 20, 2026 at 05:06:24PM +0800, Guangshuo Li wrote:
> video_register_device() / __video_register_device() registers vdev->dev
> with device_register(). Before the call the video core sets
> 
> 	vdev->dev.release = v4l2_device_release;
> 
> v4l2_device_release() invokes vdev->release(vdev) as its last step, and
> the driver's vdev->release hook is commonly video_device_release(), which
> kfree()s the vdev that the driver allocated with video_device_alloc().
> 
> When device_register() fails inside __video_register_device() the core
> does
> 
> 	put_device(&vdev->dev);
> 	return ret;
> 
> which drops the only reference and fires the v4l2_device_release()
> chain:
> 
>   __video_register_device()
>     device_register() -> -E*
>     put_device(&vdev->dev)
>       -> v4l2_device_release()
>          -> vdev->release(vdev)
>             -> video_device_release(vdev)   /* kfree(vdev), free #1 */
> 
> video_register_device() returns the error to the driver. Drivers that
> follow the documented ownership contract release vdev on their own error
> path, e.g.
> 
>   driver_probe()
>     if (video_register_device(vdev, ...))
>       goto err_release_vdev;
>     ...
>   err_release_vdev:
>     video_device_release(vdev);   /* free #2 -- DOUBLE FREE */
> 
> This is the contract documented in
> Documentation/driver-api/media/v4l2-dev.rst: the driver owns vdev and
> is responsible for releasing it if video_register_device() fails. As
> Hans Verkuil pointed out, the right place to fix this is the v4l2 core
> rather than every individual driver, because drivers are expected to
> follow the documented ownership contract.
> 
> Neutralise vdev->release around put_device() in the device_register()
> failure path so the device core cleanup does not run the driver's
> release hook. The driver-supplied release is restored before returning
> so the caller can release vdev according to the documented contract.
> Successful registration is unchanged, so the normal teardown sequence
> continues to call the driver's release hook and free vdev exactly once on
> unregister.

May I ask how the issue was found?

> 
> Fixes: 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 6ce623a1245a..73648549eb2a 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1075,9 +1075,14 @@ int __video_register_device(struct video_device *vdev,
>  	mutex_lock(&videodev_lock);
>  	ret = device_register(&vdev->dev);
>  	if (ret < 0) {
> +		void (*release)(struct video_device *) = vdev->release;
> +
>  		mutex_unlock(&videodev_lock);
>  		pr_err("%s: device_register failed\n", __func__);
> +
> +		vdev->release = video_device_release_empty;
>  		put_device(&vdev->dev);
> +		vdev->release = release;

This would largely solve the problem but not quite. The release callback
may well do more than just release the the video device. This is the case
for e.g. the rp1-cfe driver.

I wonder what Hans thinks.

>  		return ret;
>  	}
>  

-- 
Regards,

Sakari Ailus
