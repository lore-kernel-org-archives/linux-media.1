Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1B643DA35
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781622918; cv=none; b=A9pBs5OFf0I9BoE+4IvJJ3OmyApJrLvy6ObwxE4kf0HTkgwE51ugotbZitiXGOpQcVxNXmNa5huLC9A05Ap469OraSKeeQYU3Zd0S/+8aAs9jWstKD4H5Vm4r1fkF4iW8CyU/mR3HtlRruV9/f0i4E7LBd0Wi4shjnEnAznRilQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781622918; c=relaxed/simple;
	bh=x9qSqa73UlPyOWZNxfYwQlHqIhmXNqvVBZUaoYcP3p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdtq9F74kmF7kPX8xU/dTu+e+lbGsFvSBH9QtYxUykHuEY6cWbcKTWgyfl4M8UbxFzSHlfqjWxU3t3eWdEwOGywQiO6mm0wiXoERf4AXXbIGpKe6zxzPMKGmlf4ylpilCe8110yzx8rlc2GlK5D3pYEsZBoTWCwPdCYjDtF+P3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrTWhvtv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrTWhvtv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781622917; x=1813158917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x9qSqa73UlPyOWZNxfYwQlHqIhmXNqvVBZUaoYcP3p0=;
  b=QrTWhvtvrsCEvIvDS5cFaAvREFkBVJUNpBBefDgowch5l56K8fhCUaOj
   cSRGh8fJUt0zQ9TdkSIiOS0JhEPH132jOZKGCHL2+oSiPLWSbhZXqZsMU
   unwZGB1FjN6SWpTvAA5nXtVw7G+KXGA5kWl8wHE5KaU2MEKzPUMv3vvln
   NRPbz7RuEKYDiALwstpfU7DkSdyArk6XmaUwywOb9sCe/k5ZHLq8H+kKy
   UzUpw8MyxwGVi+BeeVLXqt/ltpSFfWMHB1sY9XWEm3LMEHc+7R7vpalZT
   PgPwnW2Qu9X8elC1Ybd9+J5RZQaFHPu2q2+NnOCA6qxI3MKQBGGc+u9iA
   A==;
X-CSE-ConnectionGUID: jP6tXeQMTQuVcAdXamM9sQ==
X-CSE-MsgGUID: QyL/VdBDQrqXFF+KK3gIbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99963959"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="99963959"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 08:15:16 -0700
X-CSE-ConnectionGUID: u/q7kWwPRaSW/himVjsTQg==
X-CSE-MsgGUID: Hwu4WoF1RcuQ8ELo4o4VMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="271520665"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.8])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 08:15:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 14C26120398;
	Tue, 16 Jun 2026 18:15:14 +0300 (EEST)
Date: Tue, 16 Jun 2026 18:15:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: Re: [PATCHv2 1/6] media: core: v4l2-async.c: unreg subdev if
 asc_list is empty
Message-ID: <ajFogY-MkxTmiSN6@kekkonen.localdomain>
References: <cover.1781615432.git.hverkuil+cisco@kernel.org>
 <efb6cfeb1053399ebd51b83fcc4daee632281558.1781615432.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efb6cfeb1053399ebd51b83fcc4daee632281558.1781615432.git.hverkuil+cisco@kernel.org>

Hi Hans,

On Tue, Jun 16, 2026 at 03:10:27PM +0200, Hans Verkuil wrote:
> In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
> then v4l2_device_unregister_subdev() is never called, but that
> should still happen.
> 
> This causes crashes with em28xx that uses tvp5150: that i2c
> module uses v4l2_async, but em28xx does not as it predates
> v4l2_async.
> 
> So if sd->asc_list is empty, then just call
> v4l2_device_unregister_subdev().
> 
> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 888a2e213b08..fd0404ce9247 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -897,7 +897,9 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	kfree(sd->subdev_notifier);
>  	sd->subdev_notifier = NULL;
>  
> -	if (sd->asc_list.next) {
> +	if (list_empty(&sd->asc_list)) {

If v4l2_async_unregister_subdev() without calling
v4l2_async_register_subdev() first, sd->asc_list.next will be NULL. That
case needs to be handled here, too.

> +		v4l2_device_unregister_subdev(sd);
> +	} else {
>  		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
>  					 asc_subdev_entry) {
>  			v4l2_async_unbind_subdev_one(asc->notifier, asc);

-- 
Kind regards,

Sakari Ailus
