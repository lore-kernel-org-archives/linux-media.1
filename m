Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CBC385539;
	Thu, 30 Jul 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397931; cv=none; b=TkaXfeAuts2uM4VQ8BNn099LGWGTZjDyNsWvLnUvQiJhQ4SdAim3h0LKGvjV+Gzj6tAXN5hFx6WHOtmYAFQt7nMCEz4yR5gYb3tMJNLUX2YbEB9Q6G05ztkN5BD0deSADBVEwQMCodTUKhbRITSpzdZ7gHh0CvdRB8hZq0hcutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397931; c=relaxed/simple;
	bh=rsMbKCsfngMPYOIsdftAhioL7ArB6hTMJcOnumwUm9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6tHGN9ql3K4S9ID8cFHBshWZlTivP/MxsrEmb3BbLiNjyFIcK2894fZarmY7hL+dtSy85UVn4befLdorBgji1G2qtTTsydO7jutzPnAMTEXqdCiXrgw6BEke/O0F+ARUdhatszOL0CV8DLcUP9+Zv37N0lET2ojx0r8GUclBJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEpD9PLs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEpD9PLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785397929; x=1816933929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rsMbKCsfngMPYOIsdftAhioL7ArB6hTMJcOnumwUm9Q=;
  b=IEpD9PLs2UMtxMvAt2isDwZ9XbXfc4Uh0FrONDcXrd+TdkmuEaWZ51wG
   Ws26dpSRr4hcC5VzlESchQHxJZUMaH3c0mIgSPt1tA/r6eUkSupJcredC
   RB3F6Y1LE5ReWA6LvEZVNXGAH20Mr+7ojQtve5B48KNdSIj3sTrYgoNrH
   90TD45V6p+q1eQ1qkfzavluPMVCbvad2tHeTAh4JKF2w2Tdk/hhD2B3z5
   9Z1x0nFMLTF5jIQnlp3QbKivJhXGAD5ZBUOufVydznnorI9MZefe5dO/5
   qMGPmpncRTZDpIboDnos0eynNAOo29JJynewpFGqbRzhz5Ew3iy+N1UE5
   w==;
X-CSE-ConnectionGUID: ELwqVAz8RRyFv3ljVdAXKg==
X-CSE-MsgGUID: qyNTFPkpSAKstcaA1asFdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97386443"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97386443"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 00:52:08 -0700
X-CSE-ConnectionGUID: Y6joLEaZRBm43r0LSmwQ6Q==
X-CSE-MsgGUID: uRLCjUqcSzqsSY/C7lPZIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256896448"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.137])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 00:52:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C06A121C09;
	Thu, 30 Jul 2026 10:52:07 +0300 (EEST)
Date: Thu, 30 Jul 2026 10:52:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: v4l2-core: Drop manual fwnode_handle_put() via
 scope-based cleanup
Message-ID: <amsCpw6dlp2-Hge6@kekkonen.localdomain>
References: <20260619080132.17735-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619080132.17735-2-birenpandya@gmail.com>

Hi Biren,

On the subject: s/core/subdev/ .

On Fri, Jun 19, 2026 at 01:31:33PM +0530, Biren Pandya wrote:
> Simplify v4l2_subdev_get_fwnode_pad_1_to_1() by converting the local
> fwnode variable to use the __free(fwnode_handle) scope-based cleanup
> macro.
> 
> This removes the need for manual fwnode_handle_put() calls and naturally
> ensures the fwnode reference is held during the device_match_fwnode()
> comparison.
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
> Changes in v3:
> - Resend as a standalone patch to resolve Media CI robot grouping error caused by duplicate Message-IDs in the v2 thread. No code changes.
> - Link to v2: https://lore.kernel.org/all/20260616162208.56488-2-birenpandya@gmail.com/
> 
> Changes in v2:
> - Updated the commit message to remove the "Use-After-Free" language,
>   as there is no vulnerability in practice.
> - Adjusted the implementation to declare `struct fwnode_handle *fwnode`
>   directly at the point of initialization, rather than at the top of the
>   block, conforming to recommended usage.
> - Renamed the patch subject to better reflect the true nature of the change.
> - Link to v1: https://lore.kernel.org/all/20260616092516.46339-1-birenpandya@gmail.com/
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e6b133ef7850..806b059410ce 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1243,15 +1243,14 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
>  int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  				      struct fwnode_endpoint *endpoint)
>  {
> -	struct fwnode_handle *fwnode;
> +	struct fwnode_handle *fwnode __free(fwnode_handle) =

__free() is declared in linux/cleanup.h.

> +		fwnode_graph_get_port_parent(endpoint->local_fwnode);

Can you declare this where fwnode_graph_get_port_parent() was called
previously?

>  	struct v4l2_subdev *sd;
>  
>  	if (!is_media_entity_v4l2_subdev(entity))
>  		return -EINVAL;
>  
>  	sd = media_entity_to_v4l2_subdev(entity);
>  
> -	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
> -	fwnode_handle_put(fwnode);
>  
>  	if (device_match_fwnode(sd->dev, fwnode))
>  		return endpoint->port;
>  

-- 
Regards,

Sakari Ailus
