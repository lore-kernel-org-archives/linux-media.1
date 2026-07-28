Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E62F259498;
	Tue, 28 Jul 2026 22:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785277834; cv=none; b=EojIbDosnYsmJZDsesgPsNsRgzyBblC645AfvrtjwD+YY4VrGv5Qvka1+BZo5/kwyeImHRiVBZrCzb8cjcnJz25cuV45QI3K+ZrHR4aQSjP44JCWGRqPPUTf6WIvJjhzPhGj3DJiTVthkqgw7/oHViYOdTTyrMaXvdQIz8sTr4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785277834; c=relaxed/simple;
	bh=mEgud/HSKPVZ3JZXR5zMmNL53ErL1BS/YbQ5N3MxBt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hE6F6TSF6LhtooX35etXTpX0/6b1gjci1YrZSiMGmTKitzf/39ylCgy9seuJglWvCj/D9iP59ULwy7EqRxWjsPApyvLgJ8jm23UwWBBNjmfNTUIDUD3ruLu+OPxdv0EFo8PO5lf+UkwKq9qTBRBnCB3n3/pzrOdhs837Z6rfrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGIUifKp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGIUifKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785277832; x=1816813832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mEgud/HSKPVZ3JZXR5zMmNL53ErL1BS/YbQ5N3MxBt4=;
  b=bGIUifKpLpJcJwBKww6UlrYpB/0XL7no/msqUAZUFrkt9mxh3y+r7e/F
   HC6eIqHRXpiy/U8khwdWxYF6naNGc0V0tiHhkN584E4fob5MzNPgen39x
   8yVj6Xqw2ppRIoEttCS/ppGdz+/8vDDzHoUup5+3E0aHF89OCaZqeqRnY
   4NQEyDRJX6SmiDZ07alr2S3FHxpUF3AhD/NIMj+GQS1HUg5qMeiqWhUlm
   VnsNAncbm7hz1Y1QT/SGPSU7t+VEy4iuauxcfTaxskX0JQjgROZhgWfjH
   Wce7aQMiE3W+Amom8oFzt4hdaXdcR0+Uyy+wTKCu/n0kzMdIxxAGU5jZs
   A==;
X-CSE-ConnectionGUID: luAuJ1FqRnGkNBj/ORzm+g==
X-CSE-MsgGUID: Ejl5H6mbQl6ijbVFAQqSeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103283689"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="103283689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:30:32 -0700
X-CSE-ConnectionGUID: S2KfWcTKQqiQ5xGs5uDsqg==
X-CSE-MsgGUID: VqVZSpxxSWq7L89yVsFiGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="289787340"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:30:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 747C711F978;
	Wed, 29 Jul 2026 01:30:27 +0300 (EEST)
Date: Wed, 29 Jul 2026 01:30:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jakob Berg Jespersen <dev@berg.pm>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Tooraj Taraz <tooraj.taraz@yahoo.com>,
	"Joseph V. Lavigne" <jlavig88@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] media: i2c: ov8865: fix horizontal flip control
 polarity
Message-ID: <amktg0O4JqGJEHMc@kekkonen.localdomain>
References: <20260720-sp7plus-ov-flips-v1-0-5f345b0673de@berg.pm>
 <20260720-sp7plus-ov-flips-v1-1-5f345b0673de@berg.pm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-sp7plus-ov-flips-v1-1-5f345b0673de@berg.pm>

Hi Jacob,

Thanks for the set.

On Mon, Jul 20, 2026 at 04:28:40PM +0200, Jakob Berg Jespersen wrote:
> The ov8865's native readout is horizontally mirrored and the
> FORMAT2 FLIP_HORZ bits (reg 0x3821) un-mirror it: with the bits
> cleared the image is mirrored, with them set it is not. The driver
> maps V4L2_CID_HFLIP=1 to setting the bits, so requesting a flip
> produces an unflipped image and vice versa.
> 
> This is user-visible on the Surface Pro 7+ rear camera (mounted with a
> 180 degree rotation, SSDB degree=180): libcamera requests HFLIP=1+VFLIP=1
> to undo the mount rotation and gets a horizontally flipped image.
> 
> Verified by a live 4-state flip/image matrix on the streaming sensor:
> 
>   hflip=0 vflip=0 -> 180 degree rotation (both flips)
>   hflip=1 vflip=0 -> vertical flip only
>   hflip=0 vflip=1 -> correct image
>   hflip=1 vflip=1 -> horizontal flip only
> 
> (vertical flip = reflection over a horizontal mirror line, as on water;
> horizontal flip = reflection over a vertical mirror line, as in a mirror)
> 
> which is only consistent with an inverted HFLIP and a correct VFLIP.
> 
> Invert the polarity so HFLIP=0 yields the unflipped image.

Is this just about, looking at the patch, that the driver before this patch
effectively implements an inverted HFLIP control? I think the description
could be simplified.

> 
> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
> ---
>  drivers/media/i2c/ov8865.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index c6d53c3d55ca..901ea7c16395 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2204,8 +2204,14 @@ static int ov8865_flip_horz_configure(struct ov8865_sensor *sensor, bool enable)
>  	u8 bits = OV8865_FORMAT2_FLIP_HORZ_ISP_EN |
>  		  OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN;
>  
> +	/*
> +	 * The sensor's native readout is horizontally mirrored; the
> +	 * FLIP_HORZ bits un-mirror it. Map the control so that HFLIP=0
> +	 * yields an unmirrored image (verified on Surface Pro 7+ rear
> +	 * camera by a live flip-control/image matrix test).
> +	 */

Just a comment saying this is inverted in the sensor considering HFLIP
should be enough here.

>  	return ov8865_update_bits(sensor, OV8865_FORMAT2_REG, bits,
> -				  enable ? bits : 0);
> +				  enable ? 0 : bits);
>  }
>  
>  /* Test Pattern */
> 

-- 
Regards,

Sakari Ailus
