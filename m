Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE075285060
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786347771; cv=none; b=uOpRSPhRE63GZU8sW+vbJAWUxUaW8LVOQ8gJHe4EaQjJQ+Dm7tpCzijm3gykFJ4CpROej4LkGGHkrvPk42E2wsQjlgmrHe9zH84CYkuknLjANtp4dGtd1rGTsKo7iFkjuEolh9tzXYMcKG7kh1i9lH6r+obj2KTpWt3wjEe/jyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786347771; c=relaxed/simple;
	bh=/56FfivAzVTEuLwgr1bhSFMJ+n+3LJSYmGjNq3rTru0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCZvrXhIPW293ezf/bao5nagSjwAndJVaG4fvreQzdOk+ULTKp+AeU/3cC/UT902Tuq0+pTueLFYoZgnsrLjgqGMWriPh2uzIg1N5D25dbRGuV/ziw+S/svXVuk20YZda75bpH2zQhcwdlg6NWGBGBtOzDteIEEJqKcGk5T8F9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEMoUWYI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEMoUWYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786347770; x=1817883770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/56FfivAzVTEuLwgr1bhSFMJ+n+3LJSYmGjNq3rTru0=;
  b=UEMoUWYIDk+4nDYCGEJ5+oQxpOND3gC9eDL8366INeXQyjbUyPJwy5/x
   SBs57eUoNhSuJncZ7SXGYbGKzhjoY/Dru1vjtY2y5oEiYtE6+AlBk1iTK
   fdjOru8o0NY66Gqcq/P6rfdjniG36OZ327OXCfEU3cveLz1WvuyTTNERr
   woKHfzF68ZXdeRwHmmUzdFHioJsNQoUHOSOAKcdpEimKd1jlsCT+R2N9z
   Oyf1G5hLFrCo0tELkVru3edFmNFKhrCtgLy76owWXVraSKwjz5EFKt2tv
   2slRn2RdgA3iANxW0FEdvbgM/c3YmiYcJ8uNTIjvgCmXv/hluk4XisMM7
   A==;
X-CSE-ConnectionGUID: nqQ7e9QlSwSki1yjDDDbkA==
X-CSE-MsgGUID: 0DzsdY7yQe+mX8m/FvdJTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86963697"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="86963697"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:42:49 -0700
X-CSE-ConnectionGUID: W3ZyohqnRzuqxOKlxO2gZw==
X-CSE-MsgGUID: 6bZb75OeRxK2j7zQq0jVLg==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:42:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7F1BD121197;
	Mon, 10 Aug 2026 10:42:46 +0300 (EEST)
Date: Mon, 10 Aug 2026 10:42:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Jos=E9_Mar=EDa_Mart=EDn?= <jmmartinf@hotmail.com>
Cc: johannes.goede@oss.qualcomm.com, dan.scally@ideasonboard.com,
	bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: check all DMI entries when overriding
 sensor rotation
Message-ID: <anmA9lPTuP4gZ7pj@kekkonen.localdomain>
References: <VI6PPFD0A65370F3F49A1C8B719D27C50F3A3DF2@VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI6PPFD0A65370F3F49A1C8B719D27C50F3A3DF2@VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM>

Hi José,

Thanks for the patch.

On Mon, Aug 10, 2026 at 01:38:45AM +0200, José María Martín wrote:
> A machine can have more than one sensor whose rotation needs to be
> overridden, which takes one upside_down_sensor_dmi_ids[] entry per
> sensor, all sharing the same DMI match but with different ACPI HIDs in
> driver_data.
> 
> ipu_bridge_parse_rotation() uses dmi_first_match(), which always stops
> at the first entry matching the running machine, so any further entry
> for the same machine is unreachable and only one sensor per machine can
> ever be corrected.
> 
> No machine in the mainline table currently lists two sensors, but the
> Microsoft Surface Pro 9 has both its front (OVTI5693) and rear
> (OVTID858) cameras mounted upside down while its SSDB reports degree=0
> for both; the linux-surface downstream kernel carries such a pair of
> entries and hits this limitation.

This paragraph would better fit for a cover letter.

> 
> Walk the whole table and match every entry for the running machine
> against the sensor's ACPI HID instead.
> 
> Tested on a Surface Pro 9 (6.19-based linux-surface kernel with this
> change backported): both cameras report Rotation = 180 and render
> upright in libcamera clients.

Ditto.

> 
> Signed-off-by: José María Martín <jmmartinf@hotmail.com>

I think a Fixes: tag would be appropriate.

> ---
>  drivers/media/pci/intel/ipu-bridge.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 88581a4..75db4cb 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -298,9 +298,18 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
>  {
>  	const struct dmi_system_id *dmi_id;
>  
> -	dmi_id = dmi_first_match(upside_down_sensor_dmi_ids);
> -	if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
> -		return 180;
> +	/*
> +	 * A machine can have more than one sensor whose rotation must be
> +	 * overridden (e.g. both the front and the rear camera), listed as
> +	 * one entry per sensor sharing the same DMI match.
> +	 * dmi_first_match() only ever returns the first matching entry, so
> +	 * walk the whole table and match each candidate against the
> +	 * sensor's ACPI HID.
> +	 */

I don't think such an elaborate comment is needed, either make it shorter
or drop it altogether.

> +	for (dmi_id = dmi_first_match(upside_down_sensor_dmi_ids); dmi_id;
> +	     dmi_id = dmi_first_match(dmi_id + 1))
> +		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
> +			return 180;
>  
>  	switch (ssdb->degree) {
>  	case IPU_SENSOR_ROTATION_NORMAL:

-- 
Regards,

Sakari Ailus
