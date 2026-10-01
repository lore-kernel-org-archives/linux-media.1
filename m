Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313EB3D170E
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848908; cv=none; b=IwGxbI1whaBGEmkRAjSAniwd/J64NYs6iUe9zkhJjk6k1uKSoK2f1oDG0+G61kZjCmn2CjSkuzoX3OBiSDnhYlJhYHyGUvjd2/pp5IKSXBHHmKxn98qw9FMSyG+BK45wVqcCRaOEeT2RacI4mv/vpxqeEk/iiRoPw+rgEX5T6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848908; c=relaxed/simple;
	bh=UCpX40g1gozaeC1EQ++2rRwLNE6VLQVIgrMjHQgW2N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9CWbncrBClUpMFZsm7k/N42J82vaYf90n7eoMHrjFcZHBvAqpyOcvbk0VuF9Cw77mw61WkXBND/N9IObhRah0l8Ac87xGNiGRIZ9wt5VdIvJg13BL8Mj18LoL7KO6xUDGJdpgtonRNf5PJUF+3U7GnWp2ZXN4gzobJxU0wSnVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtIqj3qm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtIqj3qm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790848907; x=1822384907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UCpX40g1gozaeC1EQ++2rRwLNE6VLQVIgrMjHQgW2N0=;
  b=KtIqj3qm6VW2h9VirYcA8fYJvreEWcgrrn6BiDL3ZzSJI5lctE5FHfMu
   DPM3bT/CaiO9sKKopMdKEgdW5/nWY50WcLVlaOLpDH+QohPrMxDW8PDua
   7fVfx9VIbG0868bIkqG4kvGsv2A9L7VqRNFoU9SZbA6DLTmLSdi/7GJgO
   d3nGVoUWfTUYkNLeE9Jn6IRVpvndw6aVeCQeEV607m8G/UzDU7u9RjiwW
   RjHtI8+1KiMorbevZVYLQBVYBofhVv6RaMwnQrznuZgI/lyhsVE/xlwLd
   idPfdgfa7SetV4QNq+Uhxosul8VJQ7C5dZx6wOVVidmngWMD9ecD1fDqL
   A==;
X-CSE-ConnectionGUID: pIi0zSDSSZCrRxYi5hjX3Q==
X-CSE-MsgGUID: b8fJOwU1TKWceRgyLMYwXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79161306"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="79161306"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:01:46 -0700
X-CSE-ConnectionGUID: YI5H25UUSYqNcLM62PkJDA==
X-CSE-MsgGUID: Rw9O+uyhTdqQUljTYa4XKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="272383806"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.234])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:01:45 -0700
Date: Thu, 1 Oct 2026 13:01:40 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: Re: [PATCH 1/1] media: ipu6: Take IPU8 support into account in
 Kconfig
Message-ID: <ar4vhFJzaYvzIRur@alaakso-desk>
References: <20260930094712.2787658-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930094712.2787658-1-sakari.ailus@linux.intel.com>

Hi Sakari,
On Wed, Sep 30, 2026 at 12:47:12PM +0300, Sakari Ailus wrote:
> Update Kconfig for support of IPU 7, 7.5 and 8 in mind.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/Kconfig | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

> diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
> index a1d036a78b57..378ea84e3b1c 100644
> --- a/drivers/media/pci/intel/ipu6/Kconfig
> +++ b/drivers/media/pci/intel/ipu6/Kconfig
> @@ -1,5 +1,5 @@
>  config VIDEO_INTEL_IPU6
> -	tristate "Intel IPU6 driver"
> +	tristate "Intel IPU 6/7/8 driver"
>  	depends on ACPI || COMPILE_TEST
>  	depends on VIDEO_DEV
>  	depends on X86 && HAS_DMA
> @@ -11,17 +11,19 @@ config VIDEO_INTEL_IPU6
>  	select VIDEOBUF2_DMA_SG
>  	select V4L2_FWNODE
>  	help
> -	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
> -	  and used for capturing images and video from camera sensors.
> +	  This is the driver for 6th, 7th and 8th Gen Intel Image
> +	  Processing Units, found in Intel SoCs since Tiger lake and used
> +	  for capturing images and video from camera sensors.
>  
> -	  To compile this driver, say Y here! It contains 2 modules -
> -	  intel_ipu6 and intel_ipu6_isys.
> +	  To compile this driver, say Y here! The two modules will be
> +	  called intel_ipu6 and intel_ipu6_isys.
>  
>  config VIDEO_INTEL_IPU6_IPU7
> -	bool "Support IPU 7 and IPU 7.5 in ipu6 driver by default"
> +	bool "Support IPU 7, 7.5 and 8 in ipu6 driver by default"
>  	depends on VIDEO_INTEL_IPU6
>  	default y
>  	help
> -	  Support Intel IPU 7 and IPU 7.5 in ipu6 driver by default, instead of
> -	  the ipu7 staging driver. This behaviour can be changed at runtime with
> -	  module parameters in the respective drivers.
> +	  Support Intel IPU 7, IPU 7.5 and IPU 8 in ipu6 driver by
> +	  default, instead of the ipu7 staging driver. This behaviour can
> +	  be changed at runtime with module parameters in the respective
> +	  drivers.
> 
> -- 
> 2.47.3
> 
