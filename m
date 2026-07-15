Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF42417D80;
	Wed, 15 Jul 2026 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146759; cv=none; b=Nc8m4gpSrFASeYWE00Y5PAT05GRSSZSrj68uycZg9U+KmNoHANPirK+hcVyTLIfZIh/Jk9j6yV9jFEl9TlIpN6CpbKjw8O5coAk84hZsBk08dxUz8r1VFa5iAuJkIA9tz//rh6lZDtRDXtRorv6C1YzoKD60Qrvg6CL8KMa7RVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146759; c=relaxed/simple;
	bh=bx/1S11PcAwsuh2C3qto34IcZ2XC7n+ETlUF80ADOpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVee2wHzVwptKae309hqbgVO6Nm11C5GZlE3Pqkrr8keR1SkpWe6mApDukMQzHQPulA4RFGde9qrHRNv5OW2VItyzdHTyZ0lfFNFLyG+hQi2qN5n3vg+UN4ol3ScWq5sgZQJlU0HhUho4eiNDSGQWHUrwLBK9ilP79IT8YXBeN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMOXIKxM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMOXIKxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784146757; x=1815682757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bx/1S11PcAwsuh2C3qto34IcZ2XC7n+ETlUF80ADOpU=;
  b=RMOXIKxMpwzfhuVgT5LU1zpmctDQB8KXOGaYQ8QxwU/5d+BWaZBKWHhM
   oPcBqev0F5UeWC6SYQUf3vsAexSZxvQtuKZeWWfwz1yUZYR3UXvKmIPR6
   FVe9NxDxWVEKJhekdv9HrpVWJmEdqIfUaejbv75VvmBnao76wiuvgOSEy
   xe6MZNSB6rEzAndiF125Cx3DHMTYAwSOiJCZx2JQDJBYUnz59MzR/4t9S
   Q9OntoLN6WYPZLtmM7dEDcbjkKhzNrimUVYF/YYRQ9xuxMPF2QSLtR8jA
   z5pNwrwzWnZ5w8+0ndkAhjbdD9ov26AbBiu+CO873mQD85MpXpg+CjSrk
   g==;
X-CSE-ConnectionGUID: ot37nhk7T5qxTIMrBPI7ZA==
X-CSE-MsgGUID: ccZnhpLxQzqDOwNYsCtaHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110348804"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="110348804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 13:19:14 -0700
X-CSE-ConnectionGUID: npz7CyRpRL+qw0sorQnp6A==
X-CSE-MsgGUID: 6LwJ7+tcQZ+/jLlyRHoHKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="258258698"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.106])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 13:19:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D1C23121C06;
	Wed, 15 Jul 2026 23:19:10 +0300 (EEST)
Date: Wed, 15 Jul 2026 23:19:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/21] media: i2c: imx355: Add support for 24 MHz
 external clock
Message-ID: <alfrPmqdQxw18bk0@kekkonen.localdomain>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
 <20260715-media-imx355-v4-2-f7f966fb9ffd@raspberrypi.com>
 <alfj3XIkX-2O5BGp@rdacayan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alfj3XIkX-2O5BGp@rdacayan>

Hi Richard,

On Wed, Jul 15, 2026 at 03:47:41PM -0400, Richard Acayan wrote:
> On Wed, Jul 15, 2026 at 12:43:15PM +0100, Dave Stevenson wrote:
> > From: David Heidelberg <david@ixit.cz>
> > 
> > The IMX355 sensor supports multiple external clock frequencies,
> > including 19.2 MHz and 24 MHz. The driver currently supports only
> > fixed 19.2 MHz input clock.
> > 
> > Refactor the clock handling to make the PLL configuration dependent
> > on the external clock frequency and add support for 24 MHz. Introduce
> > a table of clock parameter sets and program the corresponding EXTCLK
> > frequency and PLL multipliers to maintain consistent internal VCO
> > frequencies across supported inputs.
> > 
> > The PLL settings are adjusted so that OP VCO remains at 720 MHz
> > 
> > This preserves existing timing characteristics while allowing systems
> > using a 24 MHz clock to operate correctly.
> > 
> > No functional change for existing 19.2 MHz users.
> > 
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx355.c | 77 +++++++++++++++++++++++++++-------------------
> >  1 file changed, 45 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index ac59908f57aa..a6ee7532018f 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> (snip)
> > @@ -1749,7 +1756,13 @@ static int imx355_probe(struct i2c_client *client)
> >  				     "failed to get clock\n");
> >  
> >  	freq = clk_get_rate(imx355->clk);
> > -	if (freq != IMX355_EXT_CLK)
> > +	for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
> 
> Did we start allowing variable declarations mixed with code?

C didn't allow that until somewhat recently, hence it hasn't been used in
the kernel either.

In cases like the above it improves readability. E.g. with __free() that is
also the recommended pattern.

-- 
Regards,

Sakari Ailus
