Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167435;
	b=dUX+3H5qfuQZPH0TOH/Z5pJyABVvWU2iG8zg3H9RZlm5p//u7UKJ33bKv5LY4NaJ9Q3C
	 RF1U+4/6MzYnh7kfgLUbHi/nvjgfprZdOnGfbgbcEgMu0bQaCvMCrrzIrlek0s2RZLjyD
	 C6YA+DPqHneQmmqFiySVYJ4eU9ZnghvsoUD9kawYHkd+YIwjm+jyMx4LTqMr0Tfi0ec6Y
	 n2EIfEYLz6HUaWPDNkqS9BnDkn+yhcIylKHRAmw7XNFLp1aG41vgVdOpxECZF7fMBTW5r
	 qLW/GQO34rbB/4Q7M+2ozaz31qLLGkxUJfU3vNlAre1BakKeaB6TJEVzzkTvVgH5xHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167435;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MrNarIVU0YX4mWeXh4vyBELTR6sZxtTEz/XfzxTFPVE=;
	b=bWwmjf0t5h5t+2XNj88UvvN6ESF5h7xVMldzMkOItTJOCTAVUgi9W5UX2LNqxQQaoZ6Q
	 /T1uFAwA8QHTEMG/GHqJl7dmdsxNBE3/RFlQ01N4vRCjdwtoKCXDXdor+L4XhB8tOvgPZ
	 bAN/Fn9m5nnWkJ1SbjOg1kJim8A+jN+P1yG3Ov1Yz8udosQGzyJ07XfahgC96yPmv8wWi
	 qcdQhI0r29Z6wZBdT6UoA04cYwsYXnddkZp7nN8lQIO20K/I+yY+XRuDCK4IQs40bbfcU
	 aO5gT8YOVpoyBmvtET1lD92t2EZ3PQywqyYNBAW6g2sHygiTqCTtS/jgUMkoidVgEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bz8Zhy4w;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86757606A33D;
	Fri, 20 Nov 2026 09:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86757606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bz8Zhy4w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795167435; x=1826703435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rlHqRw8hS+FTCGK5Viu7WJ5pApqs6rhAMq0KeFmr74A=;
  b=Bz8Zhy4woSNtdWIH+npdZxZew+v+WCLQ5bzMRCk+J0Sfm0qbn1fpXVaP
   0y9wawGc9JYq3fIX3uzQjkh6AFzPoC3fp99/h6n8X/Ux4NyWJqUUrHX1J
   QSXItMuzajKTalkIB5QCg1cepHR8d+UiyOoL1JdcNwY/Sol/T3j6S6KfM
   wKag8nMcvKS26fftuQoAU4diejnwJegVYME5hNQQkt4K7XyQpqJyqA02J
   wA/nXjMeMTa0urS9xFNOOFbGUurT4Esv64/TkWxL1Hu+PXkMkLL1xJa5C
   J83lX0JgYmmOJ57d5KvMyE8VRk5b6KdenAGV590x9dDrFiTCS6C1y0gzw
   w==;
X-CSE-ConnectionGUID: Dka6nkWsQpCXkuopLNWGDw==
X-CSE-MsgGUID: MVateqPURN+/wGbERm3K2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3934024"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3934024"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:37:14 -0800
X-CSE-ConnectionGUID: UMEumKBHSk6L3a6qHfAsPQ==
X-CSE-MsgGUID: E2Xk2eg7QCu/USZPLDoWiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="11092297"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:37:12 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B3854121B99;
	Fri, 20 Nov 2026 11:37:10 +0200 (EET)
Date: Fri, 20 Nov 2026 11:37:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Marco Ziliani <rylos78@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>,
	Tony Garcia <tony@loafecho.com>,
	Simon Kruse <simon0x+git@proton.me>,
	"D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers on
 stream start
Message-ID: <awAUxukyHCqtABs_@kekkonen.localdomain>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
 <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>

Hi Marco,

On Thu, Oct 29, 2026 at 10:27:52AM +0100, Marco Ziliani wrote:
> ov5693_mode_configure() is only called from the runtime PM resume path,
> through ov5693_sensor_init(). If the sensor stays powered between two
> streams with different modes, the settings for the second mode are never
> written to the hardware.
> 
> Move the call from ov5693_sensor_init() to ov5693_s_stream(), before the
> controls are applied, so that the mode is written on every stream start.
> 
> Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
> Link: https://github.com/linux-surface/kernel/pull/181
> Signed-off-by: Marco Ziliani <rylos78@gmail.com>
> ---
>  drivers/media/i2c/ov5693.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 56599f9ca..d09095c3e 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -663,11 +663,6 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
>  		return dev_err_probe(ov5693->dev, ret,
>  				     "global settings error\n");
>  
> -	ret = ov5693_mode_configure(ov5693);
> -	if (ret)
> -		return dev_err_probe(ov5693->dev, ret,
> -				     "mode configure error\n");
> -
>  	ret = ov5693_enable_streaming(ov5693, false);
>  	if (ret)
>  		dev_err(ov5693->dev, "stop streaming error\n");
> @@ -1000,6 +995,19 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>  			return ret;
>  
>  		mutex_lock(&ov5693->lock);
> +
> +		/*
> +		 * Program the mode on every stream start, so that a format
> +		 * change also reaches a sensor that stayed powered since the
> +		 * previous stream, and before the controls so that the mode
> +		 * registers don't clobber them.
> +		 */

This doesn't seem quite right. The static register list should be written
on power-on and the rest when they change. Also there shouldn't be overlap
between the register list and the registers programmatically determined by
the driver.

> +		ret = ov5693_mode_configure(ov5693);
> +		if (ret) {
> +			mutex_unlock(&ov5693->lock);
> +			goto err_power_down;
> +		}
> +
>  		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
>  		if (ret) {
>  			mutex_unlock(&ov5693->lock);
> 

-- 
Regards,

Sakari Ailus
