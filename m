Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5C30D403;
	Mon,  3 Aug 2026 20:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785788874; cv=none; b=jHdPdBHwoMqN86p7HPtFYfeyzgQ1usN7VTNn6NOb0CYLTfHQ9u66gcQwTaWvYtkcClLqAdebYkqwT7Uc+roBnt9FKe3YuXcl77uhbfFqU3C0hBKofnXCnJU0Tr4cllLvYGMNte/MelbmmWISCyVV2VfmyS0AXSPKpzPmKwVQsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785788874; c=relaxed/simple;
	bh=3eqhnFe5nj+8UQbt+8RvQ/Tf5YcJBE9an8Cr1OpnuO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l66jFUcWxTMD43W0wiZDmxTIdujJZwNeOktjW8PZWZc8T49V+pgCymUi3nfzXNy72OzYM9RxPw9KyD4GGtkBo5Rypi3ZDWvK4X9R2DVR0U+AVMpX9r6UgXDlhyNl2bAb2F7d0+e3GVwro/x4Q/zT8UwknutsKi34vkKm4UmZozM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXuBwIEu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXuBwIEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785788872; x=1817324872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3eqhnFe5nj+8UQbt+8RvQ/Tf5YcJBE9an8Cr1OpnuO0=;
  b=PXuBwIEux2q6djELmLHLqQ0pM5wqFnMoIgz8vdu51nfxpMKKEoXvC4EQ
   OUQ/QM2i+Ve6gdu/pYYtSQvy6lxxi+8yuhFvAecBuO0I1t2sj/VxcikDC
   12Wd9bF5znGf0ClPjZfJbxqX0/Gw8nYT6Q2U/7owLYn/2lUDM9GCkMYOQ
   3kcHrjjzqDTM1htgQ4WiA/RfcvRB/vGAUceesWtonbS3QJ+Qgp/pRDUqD
   u1tFGKp9edpVaodSJaZjCXSIdy05HTLTyH4xCo/dQtl/ywAZ3ks6GEH3V
   hVUaqWZiITY8Q0+WZg4wTR77+hfivVFHQK27U6m0OGp90b+QlmVdHtjRe
   A==;
X-CSE-ConnectionGUID: V9MxsVUeT0y6ZyHHQ1O96A==
X-CSE-MsgGUID: ahiNFS/tTGaLI9horPq7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="88862538"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="88862538"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 13:27:50 -0700
X-CSE-ConnectionGUID: 7oQ/jMS5Q62cGlIyE02aiA==
X-CSE-MsgGUID: h4tddd9+SgqiTSXyLCVuuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="260059455"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.105])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 13:27:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 65618121BF6;
	Mon, 03 Aug 2026 23:27:51 +0300 (EEST)
Date: Mon, 3 Aug 2026 23:27:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <anD5x-MXqjJ-kwvT@kekkonen.localdomain>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
 <20260727-mira220-v10-2-8825794e6095@ideasonboard.com>
 <amjAgRnL0vM2eQJl@kekkonen.localdomain>
 <amypEMpDvY47VkG5@zed>
 <anBtWwyNVdKi90Zg@kekkonen.localdomain>
 <anBzYRw1I3yo0Q8f@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anBzYRw1I3yo0Q8f@zed>

Hi Jacopo,

On Mon, Aug 03, 2026 at 12:59:31PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 03, 2026 at 01:28:43PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Fri, Jul 31, 2026 at 04:15:53PM +0200, Jacopo Mondi wrote:
> >
> > ...
> >
> > > > > +	/* Sensor control mode */
> > > > > +	{ CCI_REG8(0x0043), 0x0 }, //  Sensor Control Mode.SLEEP_POWER_MODE(0)
> > > > > +	{ CCI_REG8(0x0043), 0x0 }, //  Sensor Control Mode.IDLE_POWER_MODE(0)
> > > > > +	{ CCI_REG8(0x0043), 0x4 }, //  Sensor Control Mode.SYSTEM_CLOCK_ENABLE(0)
> > > > > +	{ CCI_REG8(0x0043), 0xC }, //  Sensor Control Mode.SRAM_CLOCK_ENABLE(0)
> > > > > +	{ CCI_REG8(0x1001), 0x41 }, //  Sensor Control Mode.EXT_EVENT_SEL(0)
> > > > > +	{ CCI_REG8(0x10f2), 0x1 }, //  Sensor Control Mode.NB_OF_FRAMES_A(0)
> > > > > +	{ CCI_REG8(0x10f3), 0x0 }, //  Sensor Control Mode.NB_OF_FRAMES_A(1)
> > > > > +	{ CCI_REG8(0x0012), 0x0 }, //  IO Drive Strength.DIG_DRIVE_STRENGTH(0)
> > > > > +	{ CCI_REG8(0x0012), 0x0 }, //  IO Drive Strength.CCI_DRIVE_STRENGTH(0)
> > > > > +	{ CCI_REG8(0x1001), 0x41 }, //  Readout && Exposure.EXT_EXP_PW_SEL(0)
> > > > > +	{ CCI_REG8(0x10d0), 0x0 }, //  Readout && Exposure.EXT_EXP_PW_DELAY(0)
> > > > > +	{ CCI_REG8(0x10d1), 0x0 }, //  Readout && Exposure.EXT_EXP_PW_DELAY(1)
> > > > > +	/* MIPI */
> > > > > +	{ CCI_REG8(0x6006), 0x0 }, //  MIPI.TX_CTRL_EN(0)
> > > > > +	{ CCI_REG8(0x5004), 0x1 }, //  MIPI.datarate
> > > > > +	{ CCI_REG8(0x5086), 0x2 }, //  MIPI.datarate
> > > > > +	{ CCI_REG8(0x5087), 0x4e }, //  MIPI.datarate
> > > > > +	{ CCI_REG8(0x5088), 0x0 }, //  MIPI.datarate
> > > > > +	{ CCI_REG8(0x5090), 0x0 }, //  MIPI.datarate
> > > >
> > > > How many of these registers are actually 16 or 32 bits? Does the sensor
> > > > support wider than single-octet writes -- few don't?
> > >
> > > The sensor is said to support both single read/write and burst read/write
> > > sequences.
> > >
> > > There is room for improvements here, but as the startup latency is not
> > > a concern for the time being, I would leave this as an exercize for
> > > later
> >
> > Related to the previous comment, it'd be nice to have human-readable names
> > also for these registers. I'm fine with that if you promise to address this
> > later. :-)
> 
> Only for the MIPI related ones you mean ?

Whatever seems feasible?

> 
> I'll have to add support for non-cont clock mode and other bus configs
> next, so this part will be reworked anyway.

Ok. Do you actually need non-continuous clock mode for something?

> 
> The other registers in the table are not all documented, so I can't
> help much there.

That's too often the case. :-\

> 
> >
> > ...
> >
> > > > > +static struct i2c_driver mira220_i2c_driver = {
> > > > > +	.driver = {
> > > > > +		.name = "mira220",
> > > > > +		.of_match_table	= mira220_dt_ids,
> > > > > +		.pm = pm_ptr(&mira220_pm_ops),
> >
> > If CONFIG_PM isn't defined, mira220_pm_ops needs to use __maybe_unused. I'd
> > just drop pm_ops() here.
> 
> Isn't pm_ptr() there exactly to avoid __maybe_unused ?
> 
> See 9ab2bd7760a9edc23dfef71bb94092359ce94024 in example

Right; this works as the symbol is still always referred. Please ignore the
comment.

-- 
Regards,

Sakari Ailus
