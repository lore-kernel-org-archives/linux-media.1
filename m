Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8C27FB0E;
	Wed,  4 Mar 2026 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660616; cv=none; b=GZrIPLnjeRjgzVOY/fuySmbvp54PDskp0PSZtX0UDNYwwVmhpxx5qKETEQUnx7GhbfoIikB5RZAzJmapPc8eOGvqErf6P+1o0dELsMll1CDj6WhlH/M4MLwhxsGeoLxHp5CRAo9QshBURwxVkzk1E6SU4p3lpy9EKBSeBCiyi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660616; c=relaxed/simple;
	bh=7wXP8WRiNeSyKnTYbShOZiG/e+hNJHKsu0WRVUrocSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laYYEOwKGODI3v740Tegwev4feZSXFHdfIB0Mc5/YzVWkid822tc2mGnLJaQmn+4JE5jUzXP721SVKApf93Zyru0bgWkByGgPsO2+L9rL6nrcjE3k37wdJptkkn3PW3bLq9r8Q2PxYF928+bE+q9NraeTZf2FcLZSGcaWPau8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djt0iN/L; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djt0iN/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772660615; x=1804196615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7wXP8WRiNeSyKnTYbShOZiG/e+hNJHKsu0WRVUrocSQ=;
  b=djt0iN/LX5Cu9Exh3CYvu6y4p7fM7byIgwwteFYgf6x+4+nVYwVpRfJ6
   0ktjwE3HsaE3Y1cC4+wPJ4xRl3AfkPokNzYPWQ0j1m3QF5JP/y3jNfHc1
   MjJS9gCnZO3qz4076lASbfFjml3HIjQEFOg1sXHQEZvbJ8IyFTG2iqQK5
   r9wsfQzFMgMh3CJdbx/Q1E6BpzZ/mClrcDcMPj+/bU7zfenmfmG6DwxXc
   cmomhjMchxFjoGb5A17cJkc3oNG+elHeXi4lKq+zAxFq05I6p5SCrEfHd
   byYLKEg9J4twQRmaHkw1z7iaXKOI9FZssqaDI88onPVWw/JwfKxixUW25
   Q==;
X-CSE-ConnectionGUID: IJ2pJA+hRQW4ohpZXuoqCA==
X-CSE-MsgGUID: RyymdAe8TOSCB9MKjsuXHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85206487"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="85206487"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:43:35 -0800
X-CSE-ConnectionGUID: HipjXJbqSqOXgbAMz8bTdg==
X-CSE-MsgGUID: QdS6PPkRTU2JfLIcFLOudg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217627119"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.13])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:43:33 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E5CDB120CA3;
	Wed, 04 Mar 2026 23:44:01 +0200 (EET)
Date: Wed, 4 Mar 2026 23:44:01 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Message-ID: <aainoYv6RXkXFcHv@kekkonen.localdomain>
References: <20260304185001.82988-1-clamor95@gmail.com>
 <20260304185001.82988-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304185001.82988-3-clamor95@gmail.com>

Hi Svyatoslav,

One more thing...

On Wed, Mar 04, 2026 at 08:50:01PM +0200, Svyatoslav Ryhel wrote:
> @@ -2646,9 +2658,18 @@ static void mt9m114_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(dev);
>  }
>  
> +static const struct mt9m114_model_info mt9m114_models_default = {
> +	.state_standby_polling = true,
> +};
> +
> +static const struct mt9m114_model_info mt9m114_models_aptina = {
> +	.state_standby_polling = false,
> +};
> +
>  static const struct of_device_id mt9m114_of_ids[] = {
> -	{ .compatible = "onnn,mt9m114" },
> -	{ /* sentinel */ },
> +	{ .compatible = "onnn,mt9m114", .data = &mt9m114_models_default },
> +	{ .compatible = "aptina,mi1040", .data = &mt9m114_models_aptina },
> +	{ /* sentinel */ }

The driver also supports ACPI. mt9m114_models_default needs to be added to
the ACPI data, too; otherwise ACPI support breaks.

>  };
>  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
>  

-- 
Kind regards,

Sakari Ailus
