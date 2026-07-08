Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7851E2D23B9;
	Wed,  8 Jul 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531306; cv=none; b=lQYyLpv5/KyrJQ7RDRa5CTj97/eBB3HL50K06seuhghIW+jxSvowyFZUINezn5I0dZIvRwm3dR4LaH2GHcNSYlDqyCLlDTSNUmxt0FLrZQsrXRIkXR1Q+YXAy4WVKLHKYZYhLyjnyqUXjV01+zQGYZ8KYIMAbnwYwqjgrxl3RcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531306; c=relaxed/simple;
	bh=iBgMPL7yKYatXis6aicfPoeI+z86xezOm7giEvA/gh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNsttfpjuZR4238mwHYPEtfE22n7WkkEXKFngWtBMgSySZi+2a/xxwYfUGKzOfQNOJylsjdykfPQqKwzQh7ExOPSajwSjpTQ4O1QG7tKBZzzpBwYIJO4NqUgi5TmLu7mv19nkm8lzEHX6hkMhdy+skz50srUoyGWFV9fPOUViVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKRYfoWQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKRYfoWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783531304; x=1815067304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iBgMPL7yKYatXis6aicfPoeI+z86xezOm7giEvA/gh0=;
  b=MKRYfoWQr+DIoc4bbWOpv1qn5h1qjUdVBGELMlHGkMC2/8niaT28QpCX
   xWN1XZRwHViXfML7OtgIGH4jnj1y+joe3EsYfn3N+/oGmdCMi08AX8Ivc
   vuSr8ZqvVSPdmjANwJ331QgfBTsIYNunJ0ilsqYRGbgiXoZ3RbwC71NkV
   w/l9lkMdWOsOdFJIM4o3X3J+U0ZxlWqaNHYTqgcA3Szm1dwvE55GbNX15
   ZcRwEs5+hIIUwtrd82WeqAp1+ahIbBA44EUTkwVl3Lq0FEnB54vJaaSxE
   wa9gPUQrcOO2+n3UWlhMBCHkY47F6Wn1pJJo4DTp/fxqSDD0J1kss3IAL
   Q==;
X-CSE-ConnectionGUID: tWacdj4wRmmp0JIWtxImvg==
X-CSE-MsgGUID: pAQWLs5FT2SBiDL4jqRt8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101629764"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101629764"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 10:21:44 -0700
X-CSE-ConnectionGUID: xXIPXcLlQC+Y32ZQAP+qnw==
X-CSE-MsgGUID: yEeU/1/dRMaH5F2O4Ia4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254987189"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 10:21:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1815D120237;
	Wed, 08 Jul 2026 20:21:42 +0300 (EEST)
Date: Wed, 8 Jul 2026 20:21:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-core: Fix memory leak in
 v4l2_fwnode_parse_link
Message-ID: <ak6HJg4gNAyZLwdS@kekkonen.localdomain>
References: <20260619081129.18485-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619081129.18485-2-birenpandya@gmail.com>

Hi Biren,

Thanks for the patch.

The subject prefix should be s/core/fwnode/; please see earlier patches for
hints in the future.

On Fri, Jun 19, 2026 at 01:41:30PM +0530, Biren Pandya wrote:
> In v4l2_fwnode_parse_link(), the remote endpoint fwnode reference is
> acquired using fwnode_graph_get_remote_endpoint(). This reference is
> properly released in the error paths, but it is leaked on the success
> path.
> 
> Add the missing fwnode_handle_put() before returning 0 to prevent the
> reference leak.
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
> Changes in v2:
> - Resend because the v1 patch was lost in transit and did not appear on lore.kernel.org, causing CI to fail looking for the message ID. No code changes.
> 
>  drivers/media/v4l2-core/v4l2-fwnode.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 77f3298821b5..93ef83c591ef 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -633,6 +633,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
>  	if (!link->remote_node)
>  		goto err_put_remote_endpoint;
>  
> +	fwnode_handle_put(fwnode);

A newline here. I'll address these this time.

>  	return 0;
>  
>  err_put_remote_endpoint:

-- 
Kind regards,

Sakari Ailus
