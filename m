Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A84E50BF
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774252; cv=none; b=EAYAUrsav7pkTVpfS9ccLp6SmJrzkPhgdRypbr2MUqsTjvPDsxbLAAZwLA9N9vX3/cdpZns6nhf04TY4/eZ/6gmzaZLJA8gFL0CYdKyetFWcmrS+yxAKR1riezYFoY3BBPRox3Umm81eAvrhd5AD/aCtom+jWktCMzbp6e4FfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774252; c=relaxed/simple;
	bh=bcWIQFuYT4Jcqw9TsIp9qw/3089EPSQU/zyWhEzh/g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfFH/oT07R6+OxyDloLKuTUNtEDU2bFHqB3cN6bIxCU7HNd/QoaH9w+Y23z4Ll1Pzu70UJhyzxcvrdshRKggNKBNOuoBxjAMU0uDoZnpUSA+erSESA3UHTzSiay0Gt25J3RAs7j3qKfwW3rZsRmRuJhSMb7eku7uRRST+jDGmbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRWri9cU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRWri9cU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790774242; x=1822310242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bcWIQFuYT4Jcqw9TsIp9qw/3089EPSQU/zyWhEzh/g8=;
  b=MRWri9cUzX7+cdZ5iCksKAU+yZqN3lT8/tAy7yzAFQIEnxz2IY6qzDaR
   tzrstsoDVaYyyuF2n2jG1STjroPRN6mDnXpfvYyhRl0Ri7KhXlu1eF10n
   6IAtrN7QzU3aG21lNedlCNanhpd1a1hvcB/NLIa8Da56cM8E3leC+glOj
   A0a+Jc7c0yXUDSoD32T7QdJdHEByuznGI7Tg7pvTvzR6GUhSgfBuqhXUh
   Plo+OHGH7qHM3mjUX0nYtuahTRFWWiirFhUUz0R2MUfHt/D6pj9ol6PZ3
   UBZ4FjhcnVuP5w06SQcVCeTQJfessCXHB9fWyC4l3cOrc/u6o3Rs6vkO7
   A==;
X-CSE-ConnectionGUID: aMHqB8s4Q6SzUPiA5s7hBA==
X-CSE-MsgGUID: LbZpv7GVQcm0gaDH6jnTZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102081976"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102081976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:17:14 -0700
X-CSE-ConnectionGUID: Hr6NoqjISXCZ8lh9TUiqxQ==
X-CSE-MsgGUID: WqYId7PvR1KexYlViXr35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279021179"
Received: from jmaxwel1-mobl.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:17:14 -0700
Date: Wed, 30 Sep 2026 16:17:09 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Manik Bajpai <manik.bajpai@intel.com>
Cc: sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	sarang.sapre@intel.com
Subject: Re: [PATCH v2 2/4] media: ipu6: Always run cleanup in ipu7 power
 on/off on timeout
Message-ID: <ar0L1fJ33u6w2YNY@alaakso-desk>
References: <arpYuzb0yJinlDyH@kekkonen.localdomain>
 <20260929083130.88381-1-manik.bajpai@intel.com>
 <20260929083130.88381-3-manik.bajpai@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929083130.88381-3-manik.bajpai@intel.com>

Hi Manik,
On Tue, Sep 29, 2026 at 02:01:28PM +0530, Manik Bajpai wrote:
> __ipu7_power_on() and __ipu7_power_off() both return early when the
> pwr_status readl_poll_timeout() call times out, skipping cleanup that
> was previously done only on the success path:
> 
>  - __ipu7_power_on() left the clock-ownership override bit set in
>    SLEEP_LEVEL_CFG instead of clearing it, which could break
>    subsequent power transitions.
> 
>  - __ipu7_power_off() skipped D2D power-down and NDE-disable, leaving
>    those subsystems powered despite reporting a failure.
> 
>  - Additionally, the return value of ipu7_isys_d2d_power() in
>    __ipu7_power_off() was discarded, silently masking D2D power-down
>    failures.
> 
> Always run the clock-override clear / D2D-NDE teardown regardless of
> whether the status poll timed out, and propagate a D2D power-down
> failure through the return value when the poll itself succeeded.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Manik Bajpai <manik.bajpai@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c | 24 ++++++++++++--------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> index 105de1744dff..06a773b5b66b 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> @@ -530,16 +530,15 @@ static int __ipu7_power_on(struct device *dev,
>  	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
>  				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
>  				 100, BUTTRESS_POWER_TIMEOUT_US);
> -	if (ret) {
> +	if (ret)
>  		dev_err(&isp->pdev->dev,
>  			"Change power status timeout with 0x%x\n", val);
> -		return ret;
> -	}
>  
> +	/* Always drop the clock override, even if the poll above timed out. */
>  	slp = readl(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
>  	writel(slp & ~ovrd_clk, isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int __ipu7_power_off(struct device *dev,
> @@ -555,18 +554,25 @@ static int __ipu7_power_off(struct device *dev,
>  	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
>  				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
>  				 100, BUTTRESS_POWER_TIMEOUT_US);
> -	if (ret) {
> +	if (ret)
>  		dev_err(&isp->pdev->dev,
>  			"Change power status timeout with 0x%x\n", val);
> -		return ret;
> -	}
>  

I wonder if powering down D2D/NDE is right thing to do. In a caller,
bus_pm_runtime_suspend(), we try to recover from error and call
isys_runtime_pm_resume(). But after this change the D2D and NDE
would be powered off and recovery would not make sense.

> +	/* Always release D2D/NDE, even if the power status poll timed out. */
>  	if (ctrl->subsys_id == IPU_ISYS) {
> -		ipu7_isys_d2d_power(isp, false);
> +		int d2d_ret;
> +
> +		d2d_ret = ipu7_isys_d2d_power(isp, false);
> +		if (d2d_ret) {
> +			dev_err(&isp->pdev->dev,
> +				"D2D power down failed (%d)\n", d2d_ret);
> +			if (!ret)
> +				ret = d2d_ret;
> +		}
>  		ipu7_nde_control(isp, false);
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int __ipu6_power(struct device *dev,
> -- 
> 2.53.0
> 
