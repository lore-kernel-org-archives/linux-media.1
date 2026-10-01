Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F96345EDD
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840750; cv=none; b=IlyxavSyEgP9RPrRdsiepP0Ay492HZlPLU9g+8HFruj4SdJFUGyajkSmOPBYOPPtNSVhtxSPL9EEx0/kH0FAOYBfOe85PlNhXi2r/ndxV7aCif25fzoczIcPwHK2vseU3peDy13HZ12VOPys5Ws2ILYFyby4IwCt7ui5Q3qjvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840750; c=relaxed/simple;
	bh=93583s7a/c2F/QR8tnuSja1u6jmCYL5Gdkd45tcryUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4n+xR2UfcGxLbbME6dWVsPpcwVXJ33GoyQwZq4e2dflMPbOm9CaQePSucgvC8pLI9T/sBcZtxkKEVbbmVxevlcgq3Bnaboawcpkop16JBb3l2CM3by0t2eUO9lXEb9Qn0yKOEWOLo+jZBK2tWobZOlFb5QHPfdnG81M1QM8ezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Koh4gM6S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Koh4gM6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790840748; x=1822376748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93583s7a/c2F/QR8tnuSja1u6jmCYL5Gdkd45tcryUc=;
  b=Koh4gM6SjShpv4UD+7obOTSNTnjytLNJ3bdsq4UMejI0GPRZSVihSdcl
   AodWFMpV1UKzvhHLz7iPq6z4HKN75seQ7oaLkGl0DFa7XhuK8NahkbBq2
   b3Y/97qD6IS0ZOEC3ZwKzG+e5AUmg82cJeVj8aAfJFicBHiHnd1hlrmfW
   TA74V9321ojsxMfRNcMwmfI0dQAsq4Wjzl4OKrRwmuHbWN/k3ex9/BFyO
   7uXiHhPw2UBHnODUZQe1sYUGz1Tgh0GwunEaJkN2yy77HWYt1yyl1DgTS
   DyJ5cXVhGb2QdPXtvfoXLIJaHeM3IfCEm2uKYMgrDgmR9KrU/CWFbNS0M
   w==;
X-CSE-ConnectionGUID: ZHVbZ1JKSOqcU3Rdcm2slg==
X-CSE-MsgGUID: QwfkQTw4RMGcRsg/37A7iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="100923081"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="100923081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:45:48 -0700
X-CSE-ConnectionGUID: OYqvcAyKR0aPMcda6EwjNQ==
X-CSE-MsgGUID: 2b5bMP00SR67XLlM4psf/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279142084"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:45:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3A6B511F817;
	Thu, 01 Oct 2026 10:45:44 +0300 (EEST)
Date: Thu, 1 Oct 2026 10:45:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Divyamani Tripathi <divyamani.tripathi@intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
	sarang.sapre@intel.com, manik.bajpai@intel.com
Subject: Re: [PATCH v2 4/7] media: ipu6: make ipu7 gpreg stride configurable
 as per IPU version
Message-ID: <ar4PqE068w_3dyfR@kekkonen.localdomain>
References: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
 <20261001073134.4031143-5-divyamani.tripathi@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001073134.4031143-5-divyamani.tripathi@intel.com>

Hi Divyamani,

On Thu, Oct 01, 2026 at 10:31:31AM +0300, Divyamani Tripathi wrote:
> IPU8's GPREG stride is 0x2000, not IPU7's hardcoded 0x1000. Add
> csi2.gpreg_stride and use it in the two gpreg accessors instead of the
> fixed value, wiring it up for both IPU7 and IPU8 in
> ipu6_internal_pdata_init().
> 
> Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
> ---
> Changes since v1:
> - Use separate "if (IS_IPU7(isp))" / "if (IS_IPU8(isp))" blocks in
>   ipu6_internal_pdata_init() instead of "if (IS_IPU8(isp)) { ... }
>   else { ... }", so a third/unknown IPU version can't silently fall
>   into the IPU7 branch just because it isn't IPU8.
> 
>  drivers/media/pci/intel/ipu6/ipu6.c                | 7 +++++++
>  drivers/media/pci/intel/ipu6/ipu6.h                | 1 +
>  drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c   | 6 ++++--
>  drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h | 2 ++
>  4 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index 43d951735f72..965410defa09 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -373,6 +373,13 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
>  
>  	if (IS_IPU7(isp)) {
>  		isys_ipdata.csi2.gpreg = IPU7_IS_IO_CSI2_GPREGS_BASE;
> +		isys_ipdata.csi2.gpreg_stride = IPU7_IS_IO_CSI2_GPREGS_STRIDE;
> +		isys_ipdata.csi2.nports = 4;
> +	}

An else branch would be appropriate here, as both won't be true at the same
time.

> +
> +	if (IS_IPU8(isp)) {
> +		isys_ipdata.csi2.gpreg = IPU8_IS_IO_CSI2_GPREGS_BASE;
> +		isys_ipdata.csi2.gpreg_stride = IPU8_IS_IO_CSI2_GPREGS_STRIDE;
>  		isys_ipdata.csi2.nports = 4;
>  	}
>  }

-- 
Regards,

Sakari Ailus
