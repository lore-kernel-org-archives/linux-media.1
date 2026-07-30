Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460932B130;
	Thu, 30 Jul 2026 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398854; cv=none; b=KcKhAJLIjWCBh7sit6Lpd+GU+tsPzCoNgSYfMwbSBCpv2jP8Ivy3IxQPhnGA7eQo2e+EK1Ppx0NcjeMyMUKUtfUIQpGHcFT+VaiiC2nEcNslAnjND/EW8jIjQQW1FP/IJb1CpUbJlnybx6IZo5oWdWBgvl64dUrBsI8qOqkV08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398854; c=relaxed/simple;
	bh=XDXRMGOIFnQs1ciSRt7xHH9nY+uTkw1+eXjeWiVf6tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMjTnQDtp5M6a0OTlCPCBHRMo3X0/N+L5VTSfMBhHMYNVR2jtGWYYbIyEHtkuLorv+zvQ3Sb3gzZRT0FCMYeNogtRjxfF8QXy17dJo0g6GFMlSP7C6E7g95ZJHF6gf65I98gob+1cHnf9/seRU19PkPtvgfdgZRaG73RsmSGT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABVAxXZl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABVAxXZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785398850; x=1816934850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XDXRMGOIFnQs1ciSRt7xHH9nY+uTkw1+eXjeWiVf6tg=;
  b=ABVAxXZlIYUFr/6tg5w6eJgVN04o2ax5F14jIkoBtr2u9MpfasauILfQ
   ax6jxPPNbymWggoy/MixzP9uCJnt4E+fFSc5m68viB012MtX71WY5Kzgk
   paXvgFam9GG8zBfmNpmdqdwGp+wss7AmakAnzbdYqGeQM45zo0S52Uv1d
   rH3YjK8LMVD6GA0RvbH6dbIsJ+1u5gOyPv+4bcTO3oU61qc7CLuX5qyXB
   ZrOBwXKo48pBZC3HkDN5C6xPHWdxFXmINovxiqd3eG9oyNcdnV/t48HgH
   J/+W/L2ayYhhjBsyRKf1/yIscvyBnEzPDoilre5ggdboKs9R/VDZHp8Z6
   A==;
X-CSE-ConnectionGUID: ndJhrU5JRDCBTnW67Xg6QQ==
X-CSE-MsgGUID: vufU7MynQyexpyqh1qw7LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97387484"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97387484"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 01:07:27 -0700
X-CSE-ConnectionGUID: BA6DsUApQfO2GQIy2Gf7BA==
X-CSE-MsgGUID: kDQ7+mqeQYid1Qg+VgzOzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256900446"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.137])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 01:07:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 11738121C09;
	Thu, 30 Jul 2026 11:07:27 +0300 (EEST)
Date: Thu, 30 Jul 2026 11:07:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: i2c: mt9p031: Fix Use-After-Free in
 mt9p031_parse_properties()
Message-ID: <amsGPtIz30neKeYr@kekkonen.localdomain>
References: <20260619081926.18855-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619081926.18855-2-birenpandya@gmail.com>

Hi Biren,

On Fri, Jun 19, 2026 at 01:49:27PM +0530, Biren Pandya wrote:
> The mt9p031_parse_properties() function calls fwnode_handle_put(np) to
> release the fwnode handle. However, immediately after this call, np is
> used in fwnode_property_read_u32(), leading to a Use-After-Free bug.
> 
> Use the __free(fwnode_handle) attribute for the np pointer to automate
> cleanup. This allows us to remove the manual fwnode_handle_put(np) call,
> ensuring the handle is only dropped when the function returns, thus
> preventing the Use-After-Free.
> 
> Fixes: 8d4da37c3006 ("[media] media: i2c: mt9p031: add OF support")
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>

This should be cc'd to stable.

> ---
> Changes in v3:
> - Fixed the incorrect commit hash in the Fixes tag that caused checkpatch to fail.
> 
> Changes in v2:
> - Utilized __free(fwnode_handle) to automate cleanup and safely fix the UAF
>   as suggested by reviewers.
> ---
>  drivers/media/i2c/mt9p031.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index ea5d43d925ffa..3b3714b0ef8f3 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1067,15 +1067,14 @@ static int mt9p031_parse_properties(struct mt9p031 *mt9p031, struct device *dev)
>  	struct v4l2_fwnode_endpoint endpoint = {
>  		.bus_type = V4L2_MBUS_PARALLEL
>  	};
> -	struct fwnode_handle *np;
> +	struct fwnode_handle *np __free(fwnode_handle) =
> +		fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);

Can you call fwnode_graph_get_next_endpoint() where it used to be called,
also declaring np there?

>  	int ret;
>  
> -	np = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>  	if (!np)
>  		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
>  
>  	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
> -	fwnode_handle_put(np);
>  	if (ret)
>  		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
>  

-- 
Regards,

Sakari Ailus
