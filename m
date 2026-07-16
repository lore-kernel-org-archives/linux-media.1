Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7DA3148C2;
	Thu, 16 Jul 2026 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210625; cv=none; b=A9XRMsB1UNUXtr2vHBi4cnc5LA7VPGeTKFazt+koEaJttZa895Hf7aiSo7cHqwAr7WDUzKar2J8Om4orAdlozEd+9Pk/UbtvOiJgizCmJN6RM9sK3Ryji8P282K4osg1xWb4CYUKIMuhdvBq02Ypee1opi9G1m3avx/2u7A45FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210625; c=relaxed/simple;
	bh=k8lqZyi67/cE00tplYqwtKXLvQlw0UH/9cYPqGsrFLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yi/o9cPuDYb8s3LyyGjjUB5LnbSvAmJVqowTi8zulWJW1ljSDn7DMOYi36Chxx+2Vl3nWE15zJFXCr0UHWkNYo3IFhXt3x/ksS0M/zhq4Urr1FhuIJqWLPrLuqNBb0/FrCCnqJkzmdm4Jsg7Mb9ZqcZLrJcSyGcZmlhDUCBHpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jn7DH2jc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jn7DH2jc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784210625; x=1815746625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k8lqZyi67/cE00tplYqwtKXLvQlw0UH/9cYPqGsrFLQ=;
  b=Jn7DH2jc2FrjcqpaQv8+tUlHdCfjXNTNgrZnDCbneOHzDRNLalUVV0h3
   VDlyWgmJ92wS6L5tQMUH6Y9zOjAl8tBus623cm+sFahlhvzfpLRz00LrE
   3bePmjQCKU4Vy5gQC2L2ZmKCGXC7vEo3ahNua9OvID3hYe4aXljxzjSRm
   b1NpvP62UChs/eammwB5Ff0hRiP694GdqmWmyQAjv/UioKNjMWz/cu8Hh
   drhBUE7+vRH5TQVy6I/Cf8ma+YGQWLl44bdtG7nfuSM2K287VB2t0spE1
   MEv8Rwdz1VWWCifqucydmTTkuytDLVUROLPKmIzD/Z86P6DpvzQYwrsrJ
   g==;
X-CSE-ConnectionGUID: PnlXtTByREmrPuF6Bc6g+A==
X-CSE-MsgGUID: r1SkbvnTQpWrF3/+HrqN4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102297055"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="102297055"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 07:03:44 -0700
X-CSE-ConnectionGUID: bUH4yj73Sq6t7Ni1bmKhLA==
X-CSE-MsgGUID: Fdvr64eARQe4+34jGuuvyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260807402"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.85])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 07:03:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2934811F7EE;
	Thu, 16 Jul 2026 17:03:40 +0300 (EEST)
Date: Thu, 16 Jul 2026 17:03:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/21] media: i2c: imx355: Add support for 24 MHz
 external clock
Message-ID: <aljkvL3UBlF-twnT@kekkonen.localdomain>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
 <20260715-media-imx355-v4-2-f7f966fb9ffd@raspberrypi.com>
 <alfj3XIkX-2O5BGp@rdacayan>
 <alfrPmqdQxw18bk0@kekkonen.localdomain>
 <aljZf9q6GpdmGFjh@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aljZf9q6GpdmGFjh@zed>

Hi Jacopo,

On Thu, Jul 16, 2026 at 03:25:25PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Jul 15, 2026 at 11:19:10PM +0300, Sakari Ailus wrote:
> > Hi Richard,
> >
> > On Wed, Jul 15, 2026 at 03:47:41PM -0400, Richard Acayan wrote:
> > > On Wed, Jul 15, 2026 at 12:43:15PM +0100, Dave Stevenson wrote:
> > > > From: David Heidelberg <david@ixit.cz>
> > > >
> > > > The IMX355 sensor supports multiple external clock frequencies,
> > > > including 19.2 MHz and 24 MHz. The driver currently supports only
> > > > fixed 19.2 MHz input clock.
> > > >
> > > > Refactor the clock handling to make the PLL configuration dependent
> > > > on the external clock frequency and add support for 24 MHz. Introduce
> > > > a table of clock parameter sets and program the corresponding EXTCLK
> > > > frequency and PLL multipliers to maintain consistent internal VCO
> > > > frequencies across supported inputs.
> > > >
> > > > The PLL settings are adjusted so that OP VCO remains at 720 MHz
> > > >
> > > > This preserves existing timing characteristics while allowing systems
> > > > using a 24 MHz clock to operate correctly.
> > > >
> > > > No functional change for existing 19.2 MHz users.
> > > >
> > > > Assisted-by: Claude:claude-opus-4-6
> > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > >  drivers/media/i2c/imx355.c | 77 +++++++++++++++++++++++++++-------------------
> > > >  1 file changed, 45 insertions(+), 32 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > > > index ac59908f57aa..a6ee7532018f 100644
> > > > --- a/drivers/media/i2c/imx355.c
> > > > +++ b/drivers/media/i2c/imx355.c
> > > (snip)
> > > > @@ -1749,7 +1756,13 @@ static int imx355_probe(struct i2c_client *client)
> > > >  				     "failed to get clock\n");
> > > >
> > > >  	freq = clk_get_rate(imx355->clk);
> > > > -	if (freq != IMX355_EXT_CLK)
> > > > +	for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
> > >
> > > Did we start allowing variable declarations mixed with code?
> >
> > C didn't allow that until somewhat recently, hence it hasn't been used in
> > the kernel either.
> 
> Recently as in C99 ? :)
> https://en.cppreference.com/c/language/scope "Block scope"

Well, it's still "recent" for C, isn't it? ;-)

> 
> See: e8c07082a810 ("Kbuild: move to -std=gnu11")
> 
> >
> > In cases like the above it improves readability. E.g. with __free() that is
> > also the recommended pattern.
> >
> > --
> > Regards,
> >
> > Sakari Ailus

-- 
Regards,

Sakari Ailus
