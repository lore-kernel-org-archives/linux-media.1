Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA371F4C8E;
	Wed, 10 Jun 2026 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128756; cv=none; b=LQuaT6eVBhVbbpVOI1IBkMHhfUcYN6i+iIFSCbDXD9okzv/hF8o+EHmSnipJb6usV4ZCQ6TIFPMa7PL6Skaie1DIOgT0h7RY0kPFd1r5gCQAF8cwNHXlG5rWQdtwCFvsYUaM36hf+/ecauHqGffo+TpCiDUm0qxHM8hRaLMOM48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128756; c=relaxed/simple;
	bh=LM4VJCnDZDd65Drzd6iS9kmE04YYL+RYrrqh8fEXcNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOs6OnOqV3DNmcNk99/yvs4AbyT5caVkWCUQg7bnlcSbFntJ9J27iJRW8Wl62YzCkZpeJdUYRaT8qJ+ApjT8fBM/iVaGGUno8eSvt2NnhkZg/En+V35JVnO7D1UVzA5nv2+Z1Xwcr0pT3i0Qe2C3KaAby2ZwnLxSx3ze+E++5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7wh27Ua; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7wh27Ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781128755; x=1812664755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LM4VJCnDZDd65Drzd6iS9kmE04YYL+RYrrqh8fEXcNM=;
  b=T7wh27UaVm0jz2vWXMAGPlNT8CIFPTo2gXks8G6x1VddxDCR5RPeKeTf
   DMHIWzGjBdY3eIWClX/doPPatNLgllm9LJgG4p9/c0RBaYTDtQ+mqagyx
   prkgrpzUcFrUir3E1uWuz8UbUym/uGeolYTT+U5GbEIdWuDaGW8FAZZoG
   PqcCDUk+lNDRTbV8cS/b9kxIATxUFHFktintesa4zj9ykGF9Aq35hrT84
   x3Dio0LK+9Z+qdJZxEp+2xX+UpdXwV/vAwd4s/cjR8bxxQdeEAtZw4RYd
   a65QMKqVR3vHmerbF1ZMKP61vmAUQmfOVfvfgIfYnfUO0OzGH5GVHlwlq
   w==;
X-CSE-ConnectionGUID: UADyxIEiT/+AAqXC1oC9vA==
X-CSE-MsgGUID: tQF4dmlNTHWCLoM//Z0FQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81936645"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81936645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 14:59:14 -0700
X-CSE-ConnectionGUID: KYSzKQ7AQB+x280z9FJE9g==
X-CSE-MsgGUID: +bby22zVTXi+h0xhioT3qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="242157798"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.102])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 14:59:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 43BFC11F8DF;
	Thu, 11 Jun 2026 00:59:07 +0300 (EEST)
Date: Thu, 11 Jun 2026 00:59:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
Message-ID: <aineK26VD67Fmibd@kekkonen.localdomain>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-2-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609124926.1038981-2-hpa@redhat.com>

Hi Kate,

I know several people have given you different advices but...

On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
> The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
> was displayed upside-down. Add the DMI information of Lenovo X9 to
> resolve the issue.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index fc6608e33de4..9e24aaceecdf 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -134,6 +134,38 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
>  		},
>  		.driver_data = "OVTI02C1",
>  	},
> +	{
> +		/* Lenovo X9-14 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> +		},
> +		.driver_data = "SONY471A",
> +	},
> +	{
> +		/* Lenovo X9-14 */

How are the two X9-14's different? It'd be good to have some comment here
which model this actually is: the board name is only available (typically
at least) in DMI.

> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "21QB"),
> +		},
> +		.driver_data = "SONY471A",
> +	},
> +	{
> +		/* Lenovo X9-15 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
> +		},
> +		.driver_data = "SONY471A",
> +	},
> +	{
> +		/* Lenovo X9-15 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
> +		},
> +		.driver_data = "SONY471A",
> +	},
>  	{} /* Terminating entry */
>  };
>  

-- 
Kind regards,

Sakari Ailus
