Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA4A4908D5;
	Sat, 25 Jul 2026 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785018050; cv=none; b=VXEyWHpAQAbN0h85kiuy+3QAs5e2aGUDLCSpjGQDKqbZSLAd08mF8bZYGlt6w8oQcYWbPiSY7M8OAnUXU18CkP3UeK3Gy/QMR/5J2kKt8IeUIKQLShkJAYdbGJidMYnqs02SUso6GkRqTvh/X7D6ZHSIZSfZsTQJoDnAQtQ6TyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785018050; c=relaxed/simple;
	bh=oxvL0zIpEhw1lD6/RiE8jLZySOEMN+IxQ35FNtKHaQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ4LUO2e5zG4YGj3PXCw/kYqbHVC3eM8Mt5cObuGOIYgWylTbnDJb9EEupJBQD8+vQ6laLqUiqUhdzLncg/T/tzFe6Qsw1Fvc2fOtoVB6/IIah3FrjksC9lMnrpu6aAj54cuco15VQS9F1/gPY5m/RPNebmf+ueUqLKrzRfDc+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXKbeZDT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXKbeZDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785018047; x=1816554047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oxvL0zIpEhw1lD6/RiE8jLZySOEMN+IxQ35FNtKHaQM=;
  b=QXKbeZDTBCcb6/OkrK49G2EprsJTgiQcgMB5hiUj4G1lVIelm65+q/xy
   mj8LLtlQI7Pl8ShVc3lQDswun64R5UPbSTrDQu2DyoP9OHX2Qqkeff0J9
   tdzm9qBLAWfqeUIgQaDe5dUdeuxgnBsZh4n7TCVtW+g+H0UQa8ElOEIzX
   AiDEWud0LlhdF6HJajB/k+5GXIQo2WZHEu8m2K1cOzdD9DsNDZF+pBMQT
   tpZ1CJ/Kqm3c/wbVitv7mvY6vBRpsQyEAKw54RgppBMaxhAKt4S35+/Ii
   HL3V0UWx269E/Heioh10WqwtaxmXQIyh3pNRN+cy2kHN7bbC+H7G3DV7L
   Q==;
X-CSE-ConnectionGUID: VnKH4ksMRPWbhNlHbkCB8g==
X-CSE-MsgGUID: k+w2n+LxRU6a5uQgSJMiWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="103051971"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="103051971"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 15:20:47 -0700
X-CSE-ConnectionGUID: blAusxlYRRqkTvLz0mL6Mg==
X-CSE-MsgGUID: NrnvRwWiTOCwO49g5bZjTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="255672969"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.127])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 15:20:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 220A611FB4A;
	Sun, 26 Jul 2026 01:20:43 +0300 (EEST)
Date: Sun, 26 Jul 2026 01:20:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: ov5648: Fix order of a call to
 pm_runtime_set_suspended
Message-ID: <amU2uzRmHEGcaoTZ@kekkonen.localdomain>
References: <20260725120556.2262456-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260725120556.2262456-1-megi@xff.cz>

Hi Ondřej,

Thanks for the patch.

On Sat, Jul 25, 2026 at 02:05:52PM +0200, Ondřej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> It should be done when RPM is disabled.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
>  drivers/media/i2c/ov5648.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index f0b839cd65f1..0643440a6f5d 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2566,8 +2566,8 @@ static int ov5648_probe(struct i2c_client *client)
>  
>  	/* Runtime PM */
>  
> -	pm_runtime_enable(sensor->dev);
>  	pm_runtime_set_suspended(sensor->dev);
> +	pm_runtime_enable(sensor->dev);

Runtime PM API usage in this driver appears to be very broken. :-( I guess
it got merged just before we started paying more attention to Runtime PM as
a whole. Either way, feel free to fix this all, I could provide a patch as
well (but can't test it).

>  
>  	/* V4L2 subdev register */
>  

-- 
Kind regards,

Sakari Ailus
