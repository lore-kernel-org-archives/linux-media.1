Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB4F3EA66;
	Tue,  4 Aug 2026 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832820; cv=none; b=iXq3iOOvm4pz1f0oUG5eSVvrpqTfBpLY4uL/UpjP3wpTEFvMMvAbz+QcL4aG2NRlH/9czcNfjTII7zmlsVCmP2Iq/TESSIhRo3dPOLiL+ZdP0GasZ64M6gGxmRbFMGGKeY4gcTy/3FpQYyc0gxD7bnV3QjUY07/FaNyhs480zw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832820; c=relaxed/simple;
	bh=SAKoJYx9wH1WLwDx1cQAo19io9UMECBI9AHrEFmaLh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skD0iMqGeE5wbWc48ugWKXehr7KjnBDD1PiUKRkz8/oAnRVpLNANCCZW149sFTCtUF58Xrwi+CAnDkkxOQ0JERUtyqj/68RPegbPjk6omrPUgIsQKvlp2CITRotFBnN9F6vD9uhrB1+vVezwv/PUWLvHhjJFQiSbegAbLPPXDdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meN7TuVu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meN7TuVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785832818; x=1817368818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SAKoJYx9wH1WLwDx1cQAo19io9UMECBI9AHrEFmaLh4=;
  b=meN7TuVuzR+9LaQWZre1dEBxea1WbM1TnFeUB+CsFGWmM4AmJC8VsDl8
   7bFUrjGwvOYXgzYgWBhTNtn6uJnMpH7j+ub/O+lFBcEQ46t4JVhG+7h2x
   63PDmAwX6onsmN+jG/NoOGkpcLDlRet5kVFWeUzlHq2dhF2Fs5vabJNyo
   NkotZ1D/GAAbA68920X9/eskRyVLKDPYHja6LmqEQmKUEtQY5RCWA8HxE
   W8SOALZ3qz3ySApMZfpU55MnA9wloVs06+YB15ymCUNt7JPIQhkQLnEyq
   0zxNnol40plMfLN6JNirsmuHVhvvJbzt5Zz0m24Z5feS7LCqoXj8tqWQv
   g==;
X-CSE-ConnectionGUID: h1jNpuQhR2eHlbSlT0HNIA==
X-CSE-MsgGUID: CX+yLugkSuaSCPGEYd+Jpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="73915345"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="73915345"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:40:18 -0700
X-CSE-ConnectionGUID: RQEX3gzNRHqpj0v0kO7qvw==
X-CSE-MsgGUID: RShWfQU1Txat2QMOBs2ANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="286104206"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.141])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:39:59 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C533121197;
	Tue, 04 Aug 2026 11:40:03 +0300 (EEST)
Date: Tue, 4 Aug 2026 11:40:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danila Tikhonov <danila@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Vasiliy Doylov <neko@altlinux.org>,
	Achill Gilgenast <achill@achill.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
Message-ID: <anGlY_kwp_I-fRnz@kekkonen.localdomain>
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>

Hi Danila,

Thank you for the patch.

On Sat, Aug 01, 2026 at 09:04:15PM +0300, Danila Tikhonov wrote:
> The DW9800W uses the same chip ID and register layout as the DW9800K,
> but requires different default VCM frequency value.

Is this a real difference between the two models or what fits for the
attached lens? Too bad the datasheet isn't publicly available. :-(

At least the differing default and constraints for dongwoon,vcm-prescale
needs to be documented in bindings.

> 
> Add a separate device match entry for the DW9800W and validate the
> common chip ID. Use the matched variant to select the appropriate
> default values.
> 
> Tested on the Nothing Phone (1) smartphone.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---
>  drivers/media/i2c/dw9719.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 3b7ba88fd67c..bb9319fc350b 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -44,6 +44,7 @@
>  
>  #define DW9719_INFO			CCI_REG8(0)
>  #define DW9719_ID			0xF1
> +#define DW9800_ID			0xF2
>  #define DW9761_ID			0xF4
>  
>  #define DW9719_CONTROL			CCI_REG8(2)
> @@ -72,6 +73,8 @@
>  #define DW9800K_MODE_SAC_SHIFT		6
>  #define DW9800K_DEFAULT_VCM_FREQ		0x10
>  
> +#define DW9800W_DEFAULT_VCM_FREQ	0x60
> +
>  #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
>  
>  enum dw9719_model {
> @@ -79,6 +82,7 @@ enum dw9719_model {
>  	DW9719,
>  	DW9761,
>  	DW9800K,
> +	DW9800W,
>  };
>  
>  struct dw9719_device {
> @@ -140,10 +144,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
>  			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
>  			goto props;
> -		case DW9800K:
> -			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
> -			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
> -			goto props;
>  		default:
>  			break;
>  		}
> @@ -159,6 +159,21 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  			dw9719->sac_mode = DW9719_DEFAULT_SAC;
>  			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
>  			break;
> +		case DW9800_ID:

Ideally the detection change would be in its own patch but I guess it's ok
as-is.

> +			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
> +			switch (dw9719->model) {
> +			case DW9800K:
> +				dw9719->model = DW9800K;
> +				dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
> +				break;
> +			case DW9800W:
> +				dw9719->model = DW9800W;
> +				dw9719->vcm_freq = DW9800W_DEFAULT_VCM_FREQ;
> +				break;
> +			default:
> +				return -ENODEV;
> +			}
> +			break;
>  		case DW9761_ID:
>  			dw9719->model = DW9761;
>  			dw9719->mode_low_bits = 0x01;
> @@ -189,6 +204,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  
>  	switch (dw9719->model) {
>  	case DW9800K:
> +	case DW9800W:
>  		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
>  		cci_write(dw9719->regmap, DW9719_MODE,
>  			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
> @@ -453,6 +469,7 @@ static const struct of_device_id dw9719_of_table[] = {
>  	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
>  	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
>  	{ .compatible = "dongwoon,dw9800k", .data = (const void *)DW9800K },
> +	{ .compatible = "dongwoon,dw9800w", .data = (const void *)DW9800W },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, dw9719_of_table);
> 

-- 
Kind regards,

Sakari Ailus
