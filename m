Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C8367F25
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533459; cv=none; b=jNHqG3rebq/yp0XicUNffu108bvnH0tCmqsOYiJ6n2b8mzaB9XdspkhEhmcbqw8Avx1rzs5pBI+Abvr8uPDbPOye+JtPqTGMrLeNf4vqrSfVjs/G+y2CKQnoTtniC4MeDjzNICA/BYpT3+AkCjED7vaHhdUtsSodLpI0CR6KJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533459; c=relaxed/simple;
	bh=1IoFxTn5GhNoz8TqnIhrVOl7ul6ITTFc33jt9aNgYwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1gadBlK+mToEjb/3phdaylHMx8kvjWQxPh/72COGEAmKuTfA63PTiLv6IPvi98aZIWwlId/SM1n654m6vR4OV+S3qic99H8HGpblDvhsvRVm/7byEXpgTKV+BJKrVGrlmEEcqChunPjyOs2ASAw7dn80cGRrsHaY8EIBfr4SyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kR4bmUqS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kR4bmUqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791533455; x=1823069455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1IoFxTn5GhNoz8TqnIhrVOl7ul6ITTFc33jt9aNgYwI=;
  b=kR4bmUqSUnzTr/o+7/h29KOmsAYuhWXBefbNY3gsO8B5g7OAOwviq8BI
   B1DNGZJb2y2d+tNvBHc2bg2g+5GzowLkLJrhWSf3VdBigJIzZ2hylTf5K
   A1OVO1HbisGlN4y1tpHVxpNd0YKIgSrI9flLZhDYSj4yi5M7GOOq9eMVb
   VfqMxKGZ2nfalHNoiJ1U/5vBj3p/BeKhii/NFNNTlHgKyTdGapyLOFUdM
   mrfoC9vsGhfPax7ZgYRQ8NR4ZHSWzXarhGZOFmtc3qjEOdnm3VDJCyuq3
   XKMLweTZ/85H8LYNfa/rlYSeMARqISve5hTDnOk4QyYO7alF/dpiX0sr7
   w==;
X-CSE-ConnectionGUID: YqWQsnV9TxuMujEH+yIVeQ==
X-CSE-MsgGUID: ll9YCBWJTZ6Mhge7NuNOiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="333655"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="333655"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:10:55 -0700
X-CSE-ConnectionGUID: ayAgE/00Q+SmeeuHLE8r9g==
X-CSE-MsgGUID: 7nZBTqfXReSLckWgWCnCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="246885"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:10:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A335411F9E8;
	Fri, 09 Oct 2026 11:10:55 +0300 (EEST)
Date: Fri, 9 Oct 2026 11:10:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"antti.laakso@linux.intel.com" <antti.laakso@linux.intel.com>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Message-ID: <asihjx_WKqeKwmz4@kekkonen.localdomain>
References: <20261001061250.37734-1-sakari.ailus@linux.intel.com>
 <PN3P287MB1829F9B24FB03D373358AF358B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <asgDQNWy7Vfs8M7x@kekkonen.localdomain>
 <PN3P287MB182924D5AF1AA8ABA289006D8B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB182924D5AF1AA8ABA289006D8B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Fri, Oct 09, 2026 at 06:35:12AM +0000, Tarang Raval wrote:
> Hi Sakari,
> 
> > On Wed, Oct 07, 2026 at 03:39:55PM +0000, Tarang Raval wrote:
> > > > +static const struct cci_reg_sequence mode_2800_1576_30fps[] = {
> > > > +       { OV05C10_REG8(0x00, 0x20), 0x00 },
> > > > +       { OV05C10_REG8(0x00, 0x20), 0x0b },
> > > > +       { OV05C10_REG8(0x00, 0xc1), 0x09 },
> > > > +       { OV05C10_REG8(0x00, 0x21), 0x06 },
> > > > +       { OV05C10_REG8(0x00, 0x11), 0x4e },
> > > > +       { OV05C10_REG8(0x00, 0x12), 0x13 },
> > > > +       { OV05C10_REG8(0x00, 0x14), 0x96 },
> > > > +       { OV05C10_REG8(0x00, 0x1b), 0x64 },
> > > > +       { OV05C10_REG8(0x00, 0x1d), 0x02 },
> > > > +       { OV05C10_REG8(0x00, 0x1e), 0x40 },
> > > > +       { OV05C10_REG8(0x00, 0xe7), 0x03 },
> > > > +       { OV05C10_REG8(0x00, 0xe7), 0x00 },
> > >
> > > Multiple entries for the same register value seem unnecessary.
> > > You can keep the last entry only.
> >
> > There seems to be some, but in at least one case this is quite possibly
> > required: P0:0x20 is software reset, and this being Omnivision sensor, it's
> > hard to say what it actually does. The hardware reset value of the register
> > is 0xb, and it seems it won't return to 0xb when written 0 nor streaming
> > works. So it seems these two writes are needed.
> 
> I have tested the OS04D10 and OS02G10 sensors, which are similar to the
> OV05C10, and both work after removing the P0:0x20 reset writes. So the
> OV05C10 may work without them too, but this would need to be verified
> on the actual sensor.

I'm not saying it wouldn't work, at least if you have hardware reset GPIO,
but if you don't, then removing software reset could have implications.

Software reset here indeed appears to require two writes to the register.

-- 
Regards,

Sakari Ailus
