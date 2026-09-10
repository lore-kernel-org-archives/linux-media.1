Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B36041DE1B
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030932; cv=none; b=OtFdT3AUmd3PnuOnGkOEqIOi6/LDKqYm7DRkzG3VdgSerrdm6p7oYQqmvij5jOTUONF5vz++6gbqciyqNNC6t/1SKjlNdXnhLRfXm9+CcorMQHmeQ+hkMOTmMjdF9Rs68u5zr8yCf4Km1FF/JxVhDXqOEyRCdXfoZj2tDaUL/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030932; c=relaxed/simple;
	bh=UVty33KuRDaqvIDIdynCC+zw/6vUWvYun/F63e7Btqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hmx9BNksmCC2hGG1K/g3h7GKyLAXFGJOwn9f7lHlGxSzEQ3vwu41Zt99bvfVcEgznFDRgaHq7S6ATcaUskNc9GTfgcMbj777AyqBshHHFWYvRTLvk/lQupp8kYaQq/tBF3uTthXh7nBbXi0zu13c7afU6SFtNh6+MQDjipPvFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+K+yF9I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+K+yF9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789030930; x=1820566930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UVty33KuRDaqvIDIdynCC+zw/6vUWvYun/F63e7Btqs=;
  b=e+K+yF9ItLK9dcuh2ymufK2VCJzUA64szZmT5lqRwwB1wbemi9GyLno5
   d69fhYyc07E3qKTC8idW9WPFdIAk6YWUDvpbFdtMLKayiZb+xPMCuplwR
   8Sel2jPboHuFG0unCZ9QI0J+bNnx69cZNwGQM6I5i3tPmUCVkvnbdpBH5
   uT4SFm2jTJhw5LBmHKsBNxPqg7nHxzBnn0LZVm30AlXK1hPp5oDNgDebv
   OvP5YKwCwdFsTBcfjBqm92vaWy7Ms8WsqLOJQ19XCZi7m66IW0qb6XRvb
   Pff7D0ytOuwm7sw8Ml6trnhNBV3DM7MjSrXMzi5BxvE3JfHffUE94cyg1
   w==;
X-CSE-ConnectionGUID: bujvNQ69SxSMmiFcACN7WQ==
X-CSE-MsgGUID: PzCf0ulfSQGJay9lAVj9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100640553"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100640553"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:02:09 -0700
X-CSE-ConnectionGUID: KwU74YopThmAZzFMZkLAQA==
X-CSE-MsgGUID: HytUO8GxTVmiRgHZJ6NUqQ==
X-ExtLoop1: 1
Received: from akmishra-mobl2.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.195])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:02:06 -0700
Date: Thu, 10 Sep 2026 12:02:02 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] media: ipu6: Fix up missing IWYU issue
Message-ID: <aqJyCjpgmIzKDEw4@alaakso-desk>
References: <20260908204956.864759-1-broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908204956.864759-1-broonie@kernel.org>

On Tue, Sep 08, 2026 at 09:49:56PM +0100, Mark Brown wrote:
> In -next:
> 
> /tmp/next/build/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:229:3: error: call to undeclared function 'clflush_cache_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   229 |                 clflush_cache_range(cpu_mapped_buf, size);
>       |                 ^
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> index f821ec5f55b26..aee9227fd66c3 100644
> --- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/cleanup.h>
> +#include <linux/cacheflush.h>
>  
>  #include "ipu6-bus.h"
>  #include "ipu6-dma.h"
> -- 
> 2.47.3
> 
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

