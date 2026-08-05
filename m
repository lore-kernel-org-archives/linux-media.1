Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95DA3AAF6F;
	Wed,  5 Aug 2026 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927301; cv=none; b=JD5Wk6Iqas/PF+uUUEm8oj2nJJtLIwvFseVXrn6puCL1XI7AD4WjJoFK4dsqhOntnpd6pOYZm08P8MTbpTCgPfQBEpybw3e1a/odsm3PLRi7mJgGn2b9fIW+6eXUu0I0gbqJqHku/aw9sTnKqKNZjW8v3xAdm8EtYNFh9SLOZXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927301; c=relaxed/simple;
	bh=sr7hAR1ikJ2xrpupLuWyZrGQuIl6aKRMEErnZ7UQ2TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyU8pdb57cZgCoq9fAjDNHHbTJI4dIyvOXb54cnfcxTiXPZWje6PYsfl6PHHsmZUbg5SD6tDakt5qfk0iqCIrnWrlmNgQoVpjEe/9KLcduN1UQ373Us6eeDQ8UPD1zxMvDvvi9z/8R6rWaiVsXipgOW3bdLxU4XDofaaQ3xXyUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfYLpx18; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfYLpx18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785927300; x=1817463300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sr7hAR1ikJ2xrpupLuWyZrGQuIl6aKRMEErnZ7UQ2TY=;
  b=XfYLpx18sogfP7UgAeGNkTAeTF+NLl59Def/VeoxbNrDtNLXEjvgKwAm
   quvco5jD4CoeUTaZhEQt/mZUlwGbxLade5jUibES5WJVDZE3o9Sl7cFZ6
   uF0bjhPzzD6ia6lnifQ2mJU6EXN47qfXVUJIJNNTahChIyQ0KPvXC0ZoI
   ZBu8kJ3wG5XO5zzWn4fHU2I8EEgWvt9OE1wgfPyrESAqOkjzSOUrFfBLO
   vIDDV4C4AePd2wF74y+Pn878nPs1adKeDnC5YSdBMGMy5g3KrnfVTQGSn
   drf4t/OJKOkOSt99chn4ExUg2ModBWt8DS5HVv3mAxokhIeRXaAJ9rGNg
   g==;
X-CSE-ConnectionGUID: 7Lq+Z3kVQW6IYsAdYxHBVA==
X-CSE-MsgGUID: McfWcmA6QKWQqipAlJjNOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97657963"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="97657963"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 03:55:00 -0700
X-CSE-ConnectionGUID: fWClvyZ8RZaalavlT8KQag==
X-CSE-MsgGUID: xBL1s3SNRnWvcyH7UR+4jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="260500825"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.104])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 03:54:57 -0700
Date: Wed, 5 Aug 2026 12:54:49 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Steve Kaznak <skaznak@protonmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, johannes.goede@oss.qualcomm.com, hverkuil+cisco@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: Add OV01A1B sensor config
Message-ID: <anMVPKGx64O-brRP@mdjait-mobl>
References: <20260805021154.51404-1-skaznak@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805021154.51404-1-skaznak@protonmail.com>

Hello Steve,

Thank you for the patch!

On Wed, Aug 05, 2026 at 02:12:15AM +0000, Steve Kaznak wrote:
> Add the Omnivision OV01A1B (ACPI HID OVTI01AB) to the
> ipu_supported_sensors[] table, with the same single 400 MHz link
> frequency as the OV01A10 and OV01A1S entries it shares a comment with.
> 
> The sensor is the IR camera in the Dell XPS 13 Plus 9320, behind an
> Intel Vision Sensing Controller (IVSC). Commit 36eab90d3f4f ("media:
> i2c: ov01a10: Add ov01a1b support") added driver support for it, but
> without a bridge entry no fwnode graph endpoint is created, so the
> driver never binds and the camera is not enumerated.
> 
> Tested on an XPS 13 Plus 9320: the sensor binds and streams 1296x816
> Y10 at 30 fps.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Steve Kaznak <skaznak@protonmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 88581a4c081d..7a1e3cb30721 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -73,9 +73,10 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
>  	/* Lontium lt6911uxe */
>  	IPU_SENSOR_CONFIG("INTC10C5", 0),
> -	/* Omnivision OV01A10 / OV01A1S */
> +	/* Omnivision OV01A10 / OV01A1S / OV01A1B */
>  	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
>  	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
> +	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),

small nit: The table states that  * Please keep the list sorted by ACPI HID
so OVTI01AB should go first

	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),

>  	/* Omnivision OV02C10 */
>  	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
>  	/* Omnivision OV02E10 */

--
Kind Regards
Mehdi Djait
