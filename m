Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5740E3EA66;
	Fri, 22 May 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446408; cv=none; b=uf7beC2cGf78QAZvzFQ2JuqfqmbnWRHDKu3PWnPU/fGpaIDU6E7IWppR1FzfduJlIvziLvxjrcECc5erYRfVP0Valf9XCNaTmv6GwLFR/vT2jGFc2FwlzAdCz0mlThETT/RciEgazPacXTdA/WF5isCRHfF3NieKHOEFJjtBBz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446408; c=relaxed/simple;
	bh=KmLTA2ttrpDNmep2c0zkpxAjkyegMRStM7afFp1cLPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doBn8+ZEhYz56ejwgWhDxXeiFsusLw/36oPwQ1ZrtanKdBQPBgONANfYjT1XKjV6tGQ2LDQp1sB2Hfho77sYLfWR1/m1SfwmXe6i5NfxqAryWix9zJbM2SlAISksFX5AxNwPRdfnhEjoAPBq+8jUNIjQCISyX76VtwfZdAGP8Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTlgRBbB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTlgRBbB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779446408; x=1810982408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KmLTA2ttrpDNmep2c0zkpxAjkyegMRStM7afFp1cLPk=;
  b=jTlgRBbBiNARgQYd4mNhC1gXCkVgtQXYEe+hvkRDEU+bLNVhbJS/q9g9
   skhWSLwYK9tlYus292dxWSv1BCvGu+xzmXTyEzbHmghWqGakFMgQDKM2M
   tOeHAg5X4NJe2IIODa/FMYAvi96vkI6VKt14zHOHVJZidyl+iBW2aLAkX
   Q2kUO2EHeq3cgdPki6WNisJyIawDCKifAICIfgRDybCoXEO5jbTeh9kUC
   +NxAWkrcxx/KvhE63l6y/ok9R4Cv10sOWS6tyYgOlGrtiRf8onj5++9WH
   knFK6tKbF/DfYt4/lmw3PKoj4tZ1J59wVuhVp7OFlAmkLY5akprPRMTDZ
   Q==;
X-CSE-ConnectionGUID: 7XqHa0sgQve3ebra5CO01Q==
X-CSE-MsgGUID: j327yWGZRBCPmgczErwTUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91064548"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91064548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:40:07 -0700
X-CSE-ConnectionGUID: KFRWXTUaT4CvlAQd6PjrvQ==
X-CSE-MsgGUID: iGMeiGkkR7WEiq8m0dkaag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="271225579"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.224])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:40:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6812A120333;
	Fri, 22 May 2026 13:40:00 +0300 (EEST)
Date: Fri, 22 May 2026 13:40:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: martin.hecht@avnet.eu, michael.roeder@avnet.eu, stable@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: alvium: Fix: correct typo in
 alvium_set_ctrl_auto_exposure
Message-ID: <ahAygCHt1psTkpjB@kekkonen.localdomain>
References: <20260505072658.1228578-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505072658.1228578-1-mhecht73@gmail.com>

Hi Martin,

Considering the subject, I think it looks like more than a typo: the wrong
register gets written here before the patch. I think it'd be reasonable to
say that.

On Tue, May 05, 2026 at 09:26:52AM +0200, Martin Hecht wrote:
> write value for auto-exposure into register REG_BCRM_EXPOSURE_AUTO_RW
> instead of wrong register REG_BCRM_WHITE_BALANCE_AUTO_RW.

The sententence should begin with a capital letter.

> 
> Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>

Cc: stable..., please.

> ---
>  drivers/media/i2c/alvium-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> index 955b7072a560..b62b45a4f2fc 100644
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -1290,7 +1290,7 @@ static int alvium_set_ctrl_auto_exposure(struct alvium_dev *alvium, bool on)
>  	struct device *dev = &alvium->i2c_client->dev;
>  	int ret;
>  
> -	ret = alvium_write_hshake(alvium, REG_BCRM_WHITE_BALANCE_AUTO_RW,
> +	ret = alvium_write_hshake(alvium, REG_BCRM_EXPOSURE_AUTO_RW,
>  				  on ? 0x02 : 0x00);
>  	if (ret) {
>  		dev_err(dev, "Fail to set autoexposure reg\n");

-- 
Kind regards,

Sakari Ailus
