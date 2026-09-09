Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836293CA499
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 07:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937514; cv=none; b=LPohmr9xteD4OCW11AepPLZCp+pOQnQIh3FJdLxHeTDTA4lokp3tmd7QEM2wBfIJgtGxXl01YCrwIpr8z5XklPpISgyCF1EL+YZcjRfPkiK81hHGzXdcN8zG+hU6hj/5hn7/ZdutVKSHzw5i0TkzABqHMiAWHR7rg2HwwIMLUa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937514; c=relaxed/simple;
	bh=TZzR7hCrXC+9A30lwzXhiFQPL9LDoMIdxGvw2a64yWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZeaHt2fmurH9gfwg1FmMPOGffwUS67QGgvFTK1NciHLxiRuXcfPl8VZa/sgilwUoWLJKLEBXtp8uO4h8YwxM/bAFm7rpubhS6ASC8TVvxbXrkQ5f5zllnEeP9NE8fxPJsVZa3QmtbhriyTgIQGOzhXxtFdpXpXpKNfXTVm6pcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ds15zw0L; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds15zw0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788937513; x=1820473513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TZzR7hCrXC+9A30lwzXhiFQPL9LDoMIdxGvw2a64yWM=;
  b=ds15zw0LxLbhrf017tEGWwSZdopLWeRelxnp2P+VOVVMzZjMVa+G1Y7P
   mccwh2w7/tHwF07fXqHz2BAsON4UmzpyzSIGjwVEoBj7qrdAJYpCl2h1r
   uU8IlSc78VPgBJ50CC+xdJkOixc1MBX9yigDMSR/lsO+SJGRL+0MlYP1Z
   Y7r30kegHrZzsiCZ/dMkouMVp6ZetEs4QWKYnV3IcAk106w/S/sqU8r0R
   zBUVNmtyyYmtK5GUmD/kRMwWp5bMmJrx3wW1dBq4zDQVBzm/uxUl7aj5w
   ukGk9tTQqnFKXiDUQu7YcJiEBwQap7GzMNQaJCzgrfQ95fo80Qfgz83MX
   Q==;
X-CSE-ConnectionGUID: w8XGM7KtSqGW2gYTru9dlA==
X-CSE-MsgGUID: /U1XkGkeQd+2yn5nrDP5Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100512462"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="100512462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:05:12 -0700
X-CSE-ConnectionGUID: 6ZaId+/FTgqLWPe07jTP4g==
X-CSE-MsgGUID: 98yrw8mpSM2vBtsDivP5+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="309495340"
Received: from dwoodwor-mobl2.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.146])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:05:10 -0700
Date: Wed, 9 Sep 2026 10:05:06 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: Re: [PATCH 1/3] media: ipu-bridge: Add ipu_bridge_get_ipu6()
Message-ID: <aqEFImO0tbU0YGmc@alaakso-desk>
References: <20260907203142.2775925-1-sakari.ailus@linux.intel.com>
 <20260907203142.2775925-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907203142.2775925-2-sakari.ailus@linux.intel.com>

Hi Sakari,

On Mon, Sep 07, 2026 at 11:31:40PM +0300, Sakari Ailus wrote:
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 16fac765456e..373c63f98999 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -169,12 +169,14 @@ struct ipu_bridge {
>  };
>  
>  #if IS_ENABLED(CONFIG_IPU_BRIDGE)
> +struct pci_dev *ipu_bridge_get_ipu6(void);
>  int ipu_bridge_init(struct device *dev,
>  		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode);
>  int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
>  int ipu_bridge_instantiate_vcm(struct device *sensor);
>  #else
>  /* Use a define to avoid the @parse_sensor_fwnode argument getting evaluated */
> +struct pci_dev *ipu_bridge_get_ipu6(void) { return NULL; }

I think this should be above the comment line. Should this also be
static?

>  #define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
>  static inline int ipu_bridge_instantiate_vcm(struct device *s) { return 0; }
>  #endif
> -- 
> 2.47.3
> 
> 
