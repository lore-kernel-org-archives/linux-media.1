Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA153DC4CE;
	Wed, 22 Apr 2026 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861525; cv=none; b=sKbO51ayLcSwbQU8nHTZFZlEOoqmHcQpP6FcuBHT2d2AOOP2ScTyLNflGTiD8rRWvfxiU47qbjV2lsKCKTR+5pLD1neDtSQBy+xLaKNr1siRbju60evO5qJbyI6gtHrZ0apXsfhENFnJ5mHoTPofrfDfGMESaC2RpkQpfS/AUKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861525; c=relaxed/simple;
	bh=xH0Kba6RWmQUQR7OixHbv50JcWu3NtwEQ2BrXjkN5oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1nfrgty7/392epv7AVVJfltlRMsu+Ow3GOjBeO0Hf5sBdAfrCH/MenK8auQH+nAuDJSqueoOfSEIa6SwyLUWbMt+l+cuwJdjX88V4+vAen5hB+AZL6SeFPMBgCGVK5qqRQ7bYd0WKez2Ig727KMFX4iGurAYp3QmI16gDufVfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVT1Ikxz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVT1Ikxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776861523; x=1808397523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xH0Kba6RWmQUQR7OixHbv50JcWu3NtwEQ2BrXjkN5oQ=;
  b=jVT1IkxzaNCak00QqxaT5AytKZuQK2b97w+7RG/ieHJNGpdYxaNZGcIq
   WoXEJrRuzQzv/Bbg6IHQozG6Q0R5wHw5iiCocMQ4hBEKGHnIopsnS8zQn
   C0Mhh+yndxMB6nY+3SoTHMsXudW3qTfpSV1ojLk7jAETmhPtiUc1yJ4O9
   ccPxVEaTAR88aiLiO7mF0JOePj6+IFNCpBXEZF9n5fiWcwVXryBioGKUO
   cX47x8XR9IsCYBLcNp0TVxTk812z9XxQA2LMwdZpolxO1r87cOV+wAhrk
   KTj6+0RBf8eHSuEBu57XelKzPEJOsxA7J5////B+GNAWjw0lyCjANWvy8
   g==;
X-CSE-ConnectionGUID: N5YdrGP3SRKpTdDpg9ClSw==
X-CSE-MsgGUID: WYcH/bt0SbqHQCcQRHvvNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="65347347"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="65347347"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:38:41 -0700
X-CSE-ConnectionGUID: OwpGkRE8RMCPSNu5QwZu+Q==
X-CSE-MsgGUID: 8DruK/aXT3ONHvVy/Iyrvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="236714989"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:38:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DFDC7120D05;
	Wed, 22 Apr 2026 15:38:36 +0300 (EEST)
Date: Wed, 22 Apr 2026 15:38:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: andy.shevchenko@gmail.com, andy@kernel.org, gregkh@linuxfoundation.org,
	hansg@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v4 1/2] media: atomisp: csi2: Remove unimplemented DPCM
 decompression
Message-ID: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
References: <aeiuhvqcT189lL5U@kekkonen.localdomain>
 <20260422122006.29390-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422122006.29390-1-debjeetbanerjee48@gmail.com>

Hi Debjeet,

On Wed, Apr 22, 2026 at 05:50:05PM +0530, Debjeet Banerjee wrote:
> The source pad format handling attempted to map DPCM-compressed mbus
> codes to their uncompressed equivalents. However, the rest of the
> driver does not support DPCM decompression, making this dead code.
> 
> Remove the DPCM unmapping logic and simplify to directly copy the sink
> pad format to the source pad. Add an explicit comment stating that
> DPCM is not supported.
> 
> Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
> ---
> v4:
> - Complete removal of DPCM decompression attempt (per Sakari Ailus feedback)
> - Keep source pad simply copying sink pad format without unmapping
> - Replace detailed comment with explicit "DPCM is not supported" statement
> 
> v3:
> - Drop "staging:" prefix in subject (per Andy Shevchenko)
> 
> v2:
> - Rebased onto latest media tree (fix CI apply failure)
> - Fix missing linux-staging recipient (typo in v1)
> - Fix indentation
> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> index e723304bec80..64419c1a805e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> @@ -107,17 +107,10 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
>  					     &tmp_ffmt);
>  	}
>  
> -	/*
> -	 * The source pad must expose the uncompressed format even when the sink
> -	 * pad receives DPCM-compressed data. The hardware decompresses DPCM
> -	 * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
> -	 * so propagate the sink format but map the mbus code to its uncompressed
> -	 * equivalent. atomisp_subdev_uncompressed_code() returns the code
> -	 * unchanged for formats that are not DPCM-compressed.
> -	 */
> -	*actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
> -	actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
> -	*ffmt = *actual_ffmt;

This won't apply to my atomisp branch.

> +	/* Source pad format is copied from sink pad. DPCM is not supported. */
> +	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
> +						  CSI2_PAD_SINK);
> +
>  	return 0;
>  }
>  

-- 
Regards,

Sakari Ailus
