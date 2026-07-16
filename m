Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEEB31327A
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 20:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784233102; cv=none; b=ZL0/8kuVSFPqo5WkJVFGG+9vC9GtIh3qwqT4Lnv+yooTZkJpRWMFO+lp5sAlx2+7zhMlAAVax7fhw+jiW2U9s5PYS5HpCyOXDsPoFqVpJV6NuGXGcaWUaHXrcqexwZNx8OfsJXXT5xnFyWA0Ah9/J8hZJuDj2emqLGCFCxpMsRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784233102; c=relaxed/simple;
	bh=7r2ZAjIBSkcEfSfWYq58LHVGOLuvxJOL7eXgmh7SwuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzM574iIEcVVGw+LrYfZFRMAqUu1JdTcV4OTi77q6GySnAnh5GDWuEZQIJoH9YsQ2fSmuBIy2FXmX39AOVGmqp7aUl+INlgyZDkZUW22boZLGqC/1GekXmE5IZ24FY6z2/w53Qhj1MPk0CWGX1ngqdbU6kFeMbSSlx1w922Q0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMg1dQay; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMg1dQay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784233101; x=1815769101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7r2ZAjIBSkcEfSfWYq58LHVGOLuvxJOL7eXgmh7SwuI=;
  b=cMg1dQayZW/O4MUsKvelcQq42pCciHBihzf0TkjF8JnWZfL09GztEnAs
   otifOrTsqjV1t7c/+6Lkw7PhDhFfVboxrxOJcaTbKDaru48Qfu4Febp6l
   gM12QiUyDVYWCSpOy3tBx7+slpWzhlKZM/z1aQuqyamhmVqUOD0oklD4n
   NT6dy5Ris617OtBPoVfv5y5w0D/8nwgCbFHKGHawnxMCmsDVawuABd99q
   9rzRtRgkzajcyKdPYLCdRCiFNBtnBlyGMfxqd0yLbRLymSEAhUs1NJNkT
   F66nv43o4+s3dFS95wEd+VKrYP/JTU9fTjCPBOHGN5F167q0Omw1N9wd2
   w==;
X-CSE-ConnectionGUID: GrsR6LmtSIGPbIuvVo2MsA==
X-CSE-MsgGUID: S3YrL/1ZRZSPkKsvGbOPJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="72441470"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="72441470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 13:18:20 -0700
X-CSE-ConnectionGUID: ofC6k9gUQmm+dApWMNNzIA==
X-CSE-MsgGUID: bECVOV7fQRKwvvpuP5kqsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="260894408"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 13:18:19 -0700
Date: Thu, 16 Jul 2026 23:18:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
Subject: Re: [v1,0/7] gpiolib: kill gpio_request_one()
Message-ID: <alk8iQCjTHcdhbVs@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <6a57fbc2.20aff8f6.286553.85fe@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a57fbc2.20aff8f6.286553.85fe@mx.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 02:29:38PM -0700, Patchwork Integration wrote:
> Dear Andy Shevchenko:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test media-patchstyle:rc core
> fatal: Not a valid object name 8dac27bfa2f9
> /builds/linux-media/users/patchwork/include/media/rc-map.h:265: duplicate value for rc-hauppauge
> rc-videomate-m1f.c: name #define RC_MAP_VIDEOMATE_K100 does not match rc-videomate-k100
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:125: expecting rc-rc6-mce found rc-rc5-tv
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:126: expecting rc-real-audio-220-32-keys found rc-rc6-mce
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:127: expecting rc-reddo found rc-real-audio-220-32-keys
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:128: expecting rc-siemens-gigaset-rc20 found rc-reddo
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:150: expecting rc-vega-s9x found rc-videomate-k100
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:151: expecting rc-videomate-m1f found rc-videomate-s350
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:152: expecting rc-videomate-s350 found rc-videomate-tv-pvr
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:153: expecting rc-videomate-tv-pvr found rc-videostrong-kii-pro
> /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/media/rc.yaml:154: expecting rc-videostrong-kii-pro found rc-vega-s9x
> /builds/linux-media/users/patchwork/include/media/rc-map.h:312: rc-rc5-tv does not exist
> /builds/linux-media/users/patchwork/include/media/rc-map.h:339: rc-videomate-k100 does not exist
> /builds/linux-media/users/patchwork/include/media/rc-map.h: missing entry for rc-videomate-m1f
> errors: 14

What is this?

> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/105065189/artifacts/report.htm .
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

-- 
With Best Regards,
Andy Shevchenko


