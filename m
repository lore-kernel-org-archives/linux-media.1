Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A13EB81E
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510690; cv=none; b=abDAU9ut8v6bcdDGKASx4PL1ZCbDYPt0ohU63fztZERHf69sW4AL8XpeZjfSeVnD2T2gXTqJeq6hH5+y9QGlEoI9uQhZMhLdIv1rF2vN4vIz9prsrqzy56z/eqpl5rxx0cDKYzCw6ngf7yDc3TIa5DqbQAMs3LBMgvMVdfRIOfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510690; c=relaxed/simple;
	bh=mzTRXQWxz6TlIrNlz+yVRQnSIGMY7Dbeypni0t8u++k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RP5eRCQqaVd3ZfQ7MgtmS33omvQtWysI/y+drl6NFT/wL2LYrpuNbRE/aqB9rUoKWj2w95K9zweBvVnHlclOXh1X5PLwtCZ34xvKmp33ewpnVcWsQdHk1iQWrNWbP6wYR+7WMY1+ZoM1vSyO+YT+IoVZ6q5AzrQYMUEQGXgVk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msBrFKvf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msBrFKvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788510687; x=1820046687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzTRXQWxz6TlIrNlz+yVRQnSIGMY7Dbeypni0t8u++k=;
  b=msBrFKvfVlKw1LnnhM1Rmh2iXrYXGlvwSECWARJ3dmkQ+kWpW2V2rAvB
   vhuP0MWeAv7EbeOuZ4cRtaRLGe+c+aYFlr/dfo2TTE9mJKoMWOG3eVGE5
   m2528Xr1vzlaMrengbk4vpwvKCDnE+ZAsZmRrIzc+0Dn4NI2HiZ45zxr2
   dCp2FpO9nwUYRZnTV/I002IEQ/IKhR/e0xTLMt64snaLbu3+gyhQZ+Zhc
   pKvxk6PwlVo/V6L9agSvU8HPlA6+HHBJeBlwsv22wfVspoSXgV58PY29X
   JXzeJk5N0L91UZWdalCyzAPPV4WpzJtv8puFrvEQ8qxDm2HFL7mRTajyy
   w==;
X-CSE-ConnectionGUID: vNK1LAxqQISlxmjA+YU5eg==
X-CSE-MsgGUID: OW+qWdMTRCC8AheNQW8JVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100526785"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100526785"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 01:31:27 -0700
X-CSE-ConnectionGUID: iZhqst8NTKyBiYbr9y2wcg==
X-CSE-MsgGUID: NZJvc7ldQry8XY+QmCwLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293489833"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.250])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 01:31:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C5DBD1201A2;
	Fri, 04 Sep 2026 11:31:23 +0300 (EEST)
Date: Fri, 4 Sep 2026 11:31:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: German <germanpapulindez@gmail.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: staging: ipu7: declare firmware files with
 MODULE_FIRMWARE
Message-ID: <apqB28RBDZV4BlDZ@kekkonen.localdomain>
References: <20260903084052.17893-1-germanpapulindez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903084052.17893-1-germanpapulindez@gmail.com>

Hi German,

On Thu, Sep 03, 2026 at 10:40:51AM +0200, German wrote:
> drivers/staging/media/ipu7/ipu7.h already defines the three firmware
> blob names the driver can request at runtime depending on the SoC
> generation:
> 
>     IPU7_FIRMWARE_NAME    "intel/ipu/ipu7_fw.bin"
>     IPU7P5_FIRMWARE_NAME  "intel/ipu/ipu7ptl_fw.bin"
>     IPU8_FIRMWARE_NAME    "intel/ipu/ipu8_fw.bin"
> 
> but ipu7.c never declares them via MODULE_FIRMWARE(), so tools that
> rely on modinfo to discover firmware dependencies (most initramfs/
> initrd generators, e.g. mkinitcpio, dracut) can't automatically
> include the right blob for this driver.

The patch seems fine but we're about to remove this driver in favour of the
ipu6 driver. Therefore I don't think we'll need this anymore. The ipu6
driver though also appears to be also missing these.

-- 
Sakari Ailus
