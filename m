Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B8D492E4D
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 07:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939926; cv=none; b=POyvlByB3MZmYQV1ypa7A0LuJO3KipVLY58Ky63KlbFDmiR1mJ8PFcPsNzUm5PTsR5Rqt6x2xMCS8zoDMOOo6JXVxC14KebeD8tU+V+OIm0nUHwiYZ/8AK4KAVad2KxZMm2N9TFBocfnVyX7T+/PWdbgxsEAYcRMOVack/kX1WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939926; c=relaxed/simple;
	bh=fyZ5qoAd9KTU7JjWt/07nYMR89ptJHzqThiNToGL+XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbqJiZft21mKvPcNmzMsA9A6vSZEN2a5LcuPTfSoo8mXZro0fh2kMc5F+rvaf32CJ8uSHk5IKfN1EUN71D801+SME78vNgPez8xCk3+ckFQ4YMoYMceS1VUKjVAEO5+6b3/YMBg2m6wRafsG9x548Op3LOlw8duX/1scmydXmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c01KU6xO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c01KU6xO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788939925; x=1820475925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fyZ5qoAd9KTU7JjWt/07nYMR89ptJHzqThiNToGL+XQ=;
  b=c01KU6xOKneHLU9gD8RQLSaGbBbpzrh32MSURm8j/Gy7thlhNyWaol1r
   M+5I2Tkz4OBK47hbjMUe60At50FxZS2rDdLGWF8MdAXOTj8m19qjn88N0
   Rv85A4c4z03JYvxs/tYcENZXUGcQU+A9a5I0RA1ddJGrqXh34W8p/tD5P
   +bZ+0/qRpw5679BFAU1EJj85SMszPdICDqA1Tg8B9msy4HtssAECNG9D8
   bMRHGAvW9miERA4K/cRfzgb1laYTxJwQNhuENoGUpDoSQEAHp+Mx+Td8r
   g+x9c9sgSzdhZuJOBlHwge3d6M1If4Kpc8Dylyh8XMJ/f4aQaNPcRLhaQ
   w==;
X-CSE-ConnectionGUID: Turz/upFR6O72MYyFRHE2w==
X-CSE-MsgGUID: PpaU+iHaTaSqByluOIcJeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89562533"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89562533"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:45:24 -0700
X-CSE-ConnectionGUID: Y5azK4v/RnuKU4nDnjtYDA==
X-CSE-MsgGUID: JWFMnsDWTICwCUCwlFtBpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="269486476"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:45:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 36EEE121BD2;
	Wed, 09 Sep 2026 10:45:24 +0300 (EEST)
Date: Wed, 9 Sep 2026 10:45:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: Re: [PATCH 1/3] media: ipu-bridge: Add ipu_bridge_get_ipu6()
Message-ID: <aqEOlAh-6vDG01xF@kekkonen.localdomain>
References: <20260907203142.2775925-1-sakari.ailus@linux.intel.com>
 <20260907203142.2775925-2-sakari.ailus@linux.intel.com>
 <aqEFImO0tbU0YGmc@alaakso-desk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqEFImO0tbU0YGmc@alaakso-desk>

Moi,

On Wed, Sep 09, 2026 at 10:05:06AM +0300, Antti Laakso wrote:
> Hi Sakari,
> 
> On Mon, Sep 07, 2026 at 11:31:40PM +0300, Sakari Ailus wrote:
> > diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> > index 16fac765456e..373c63f98999 100644
> > --- a/include/media/ipu-bridge.h
> > +++ b/include/media/ipu-bridge.h
> > @@ -169,12 +169,14 @@ struct ipu_bridge {
> >  };
> >  
> >  #if IS_ENABLED(CONFIG_IPU_BRIDGE)
> > +struct pci_dev *ipu_bridge_get_ipu6(void);
> >  int ipu_bridge_init(struct device *dev,
> >  		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode);
> >  int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
> >  int ipu_bridge_instantiate_vcm(struct device *sensor);
> >  #else
> >  /* Use a define to avoid the @parse_sensor_fwnode argument getting evaluated */
> > +struct pci_dev *ipu_bridge_get_ipu6(void) { return NULL; }
> 
> I think this should be above the comment line. Should this also be
> static?

Indeed. I'll fix this for v2.

> 
> >  #define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
> >  static inline int ipu_bridge_instantiate_vcm(struct device *s) { return 0; }
> >  #endif

-- 
Terveisin,

Sakari Ailus
