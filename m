Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE393C9880
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533760; cv=none; b=M/lcX+Kwj3wlMCFV34JGJd8s58BZnKdRhC8rdT4Uz0zv2Ff7vZCLS/dVwePCYLua3AjEF5ITvT0hpCI+r17V80NM3gxPWkOwBmLUziNa/tpssf8Ne0tDZRZb+iMHhBeQ8z8iadEWbiYGOTluMryO4EUbwBZ50VVLwO8KMxJriPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533760; c=relaxed/simple;
	bh=AXHFDeAvOmP3J1whRf+ZD/veO+o6aBBwnftqIYdX5Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arhxA+zUSgqKFyl162rznowrlGwQqAKcVYISz/QbSykgFFWLq2mK3FcB7DKn/OlnDeJyLmwaqJY6GVdrkaN49TOgDmpXzoForxVoFESf4OCNToz8PALRbufdhOQ2XLWDzaJghPJcOy7xAWEtZaVWKe+ZPbBSW3jWETG+WoKMCbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gkss4LGe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gkss4LGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791533756; x=1823069756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AXHFDeAvOmP3J1whRf+ZD/veO+o6aBBwnftqIYdX5Z0=;
  b=Gkss4LGedQfcR8BAiOYQoboLfJB0rREU2ANbjeZMQU6e0iN37oq5b/Dm
   SqDEvYVr0VbRou0bmzX7k1WdimhHhh330bkhquYTW2D2ACvTujPJNXn0m
   7IcwLjqYW0AkJWCoUEFH2kZFFT2/xDPjPCGAjfzd9h/gg1RGFSF4Uiel0
   PZPgSY0s+IT0LC4tCDb+SvrUwd3upSaTOtaK7MBYcRBr++X7qRYKsAEpn
   LBiugbbSfTYyBRrDfXC6T3O0WQcGcSovF6mBEiNsdAH8vPCjHX0GphWIU
   9ritZqt/k60dFsyZg8g87TecmLvGf7yRbaNuM7qXMvyEZVgxasRjHY2X0
   Q==;
X-CSE-ConnectionGUID: 1MP1G+noQF22PhEEStPChQ==
X-CSE-MsgGUID: tfuBTpikRLaWH1iCE/Hd2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="229728"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="229728"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:15:55 -0700
X-CSE-ConnectionGUID: OeLybeI/RSejD1bL0XbpFA==
X-CSE-MsgGUID: hkjAVilsQ8WqotHyRndMHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="278521"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:15:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6D33111F9E8;
	Fri, 09 Oct 2026 11:15:56 +0300 (EEST)
Date: Fri, 9 Oct 2026 11:15:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 3/4] media: ov05c10: Power management fixes
Message-ID: <asiivEyRy0Fe7-c2@kekkonen.localdomain>
References: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
 <20261008210503.1878442-4-sakari.ailus@linux.intel.com>
 <PN3P287MB18299D33CBBCB0F99F098AD58B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB18299D33CBBCB0F99F098AD58B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Fri, Oct 09, 2026 at 06:57:57AM +0000, Tarang Raval wrote:
> Hi Sakari,
> 
> > If the device wasn't powered on in probe(), probe failure led to it still
> > being powered off. Fix this.
> >
> > Also disable autosuspend in remove().
> 
> If v4l2_async_register_subdev_sensor() fails when full_power is true,
> the runtime PM status remains active while the sensor is powered off.
> 
> Should we call pm_runtime_set_suspended() in probe_error_rpm, under the
> full_power condition?

Correct. I missed this earlier so I'll add that in v2.

> other than that, LGTM.
> 
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>

Thanks!

-- 
Sakari Ailus
