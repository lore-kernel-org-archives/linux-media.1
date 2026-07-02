Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9F40E8CA;
	Thu,  2 Jul 2026 08:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979573; cv=none; b=UTDfoCpFoT7yYiNFMnMRMJzslW41BkvQpzolXA6yN/bzvHX028/K8u/uittGdKpzGrxdy+LpHxFruIoyO2ftpb8lDhNyuhky8s2cBlfPe8kULE0Oo35Q84jPt8CgzxvkDsW77mMlS13Bp5AhuYI3uljnntr5kFlMCCmr+caZq0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979573; c=relaxed/simple;
	bh=7t7WnVtxPVyOF3Dtdu7a/6PGVlN2TQ/JQ+P4dvEogjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtn2jkl4/U6pDp2F7kJB/gOD01Cm5h3KdgHFbytl583jsgYZbSGOkgMr3uWzIUwDXNCj19tfUJBhQWC7YK9C4shTFGNpP/nSmwZk0CJrB7NRGNCS7qB8cKHXDcI4JmQ1obneXnZTfo4+0NOMQ69r1aE1TrAEJmSNJtt8LYuWctM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ypl0vtWA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ypl0vtWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782979572; x=1814515572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7t7WnVtxPVyOF3Dtdu7a/6PGVlN2TQ/JQ+P4dvEogjQ=;
  b=Ypl0vtWA1YJCWQsLvQX6L0CsbRt7Elk6Gk93E6jYN+J7+cZ955WCmHO5
   66G8OoSFVJPtZEdwJdAGl0dBlWNgmMTT3NaLtWF1svljvB9GJKfwHdyTa
   VO6w5kHyluly4UCpevHw30v4MEhGpbxjny+s1B2b26FxClRHhTYdG5xTS
   DPLr5sM0AY1D3Zmm38ExbauBeRcqzZQ8QsfzrHBe16/a+vej5SjCPiuO0
   bnGhnUp3f8+unoE+9kUqs0kXfKupl6ViMCXK2ECXa484WEUhDc9PQGxF5
   VR+0r2zkj3am9a3Ne8K4UXqF5BKwOVwX7lXsKRy+2VyLNY2pY853yUyfG
   Q==;
X-CSE-ConnectionGUID: pbaVx3syTxmEXxMrM0CkYQ==
X-CSE-MsgGUID: 0rySsSZKS+a9RPSwCltkUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="86267506"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="86267506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:06:11 -0700
X-CSE-ConnectionGUID: 0kJYRbZhShKJ8ohEZzY8xg==
X-CSE-MsgGUID: ooAdG657Rl2hnEZo0wDuqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256365713"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.231])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:06:09 -0700
Date: Thu, 2 Jul 2026 10:06:01 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/15] media: i2c: os05b10: Add H/V flip support
Message-ID: <akYbG3uxuCAAV0q_@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-7-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-7-tarang.raval@siliconsignals.io>

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:52PM +0530, Tarang Raval wrote:
> Add HFLIP and VFLIP controls, lock them while streaming,
> and update the reported Bayer format based on the flip state.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 59 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 2f47b02149b7..bf848eb9ba52 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -96,6 +96,10 @@
>  #define OS05B10_MIRROR			BIT(3)
>  #define OS05B10_FLIP			GENMASK(5, 4)
>  
> +#define OS05B10_REG_ANALOG_FLIP         CCI_REG8(0x3716)
> +#define OS05B10_FLIP_ENABLE             0x04
> +#define OS05B10_FLIP_DISABLE            0x24
> +
>  #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
>  #define OS05B10_HDR_ENABLE		0x04

[..]

> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		ret = cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
> +				      GENMASK(5, 3),

OS05B10_MIRROR and OS05B10_FLIP can be used here instead of GENMASK(5,
3)

> +				      (!os05b10->hflip->val) << 3 |
> +				      os05b10->vflip->val << 5 |
> +				      os05b10->vflip->val << 4, NULL);

And here also.

This will make the code much cleaner.

> +		if (ret)
> +			return ret;
> +
> +		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
> +				(os05b10->vflip->val == 1) ?
> +				OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
> +				NULL);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;

--
Kind Regards
Mehdi Djait
