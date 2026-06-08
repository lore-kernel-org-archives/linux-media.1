Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9876D3D332B
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927665; cv=none; b=C6s0y3MCa6qSrJt9qq7cJYJF2ee3wuaGS65q2vZ90cwT4HIwmzlMNsECSKaQF+l7lmzLUVCshXQn+BglwFAqGk5ipRGf3MScIxPKHYPp8APnf8sB3/t/CJGZbJwIaBNQLyrK2Wb7sMKwTJzR6vMfqf70yzSIAc+KW9aAuod1u88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927665; c=relaxed/simple;
	bh=h5qV2U4pt4NiIS9ETU9PcYvE4GSviKjh3QPY2dd1HDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1xjQ0+xRIOmez6eoktYGW+1UDsNLiX6deDtVt+e0OCnZ7x8WU0qFN7vS/UcRohmA8VAqtvfylmMd3byQ1KrpdKSH3vG4bhp1DQkdf8IVWkZ8xujeuRIIW0rbU2oSFwkHwZERF2iTHwDcK8YlNJiHeFQ4SOKrsITNT69iubEPO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neLeXoui; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neLeXoui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780927664; x=1812463664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5qV2U4pt4NiIS9ETU9PcYvE4GSviKjh3QPY2dd1HDI=;
  b=neLeXouinT9CxbvJ0/kAvWBjtu024MJCbFSuHENLGWq5AaNbh0G1UiGy
   99EWImutKI86WBUnBpBlZFeGE/HD+51fEJ40PtlZ0EZZGEpMU0KaDko6/
   5mr818NmGvNHapAhEzwxhVOz2zqm98acP1UiKN+SVa/HJAtRhvQeS+Dng
   821jbPDz3zVBttscdHEwVgS8eUtY4kV/jOxqonlFn0j5yoHTyjC3rTSP0
   qrSelgffDvhCUEfHPDIaDSW28tWUCsvwnrcGAz1ZeTk7nWVOOwqlEf8mO
   NcJWlphO+2YvxcIT02VEMrWfKztDr5AsM8MgIqViT5djVsjITdI2uLrTK
   Q==;
X-CSE-ConnectionGUID: vMkfnAUlSsCY/7sDq2xYSw==
X-CSE-MsgGUID: wYO7f1trTbqGVxnxtbGW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="91988211"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="91988211"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:07:44 -0700
X-CSE-ConnectionGUID: T274YFZySryC8s0fqWFWRA==
X-CSE-MsgGUID: L+Xi2HdzSDuAcf4NyE0oeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="247425712"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:07:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 82DF6121C67;
	Mon, 08 Jun 2026 17:07:34 +0300 (EEST)
Date: Mon, 8 Jun 2026 17:07:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <aibMpvdVNraURHIE@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <20260608091026.GB772117@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608091026.GB772117@killaraus.ideasonboard.com>

Hi Laurent, Jacopo,

On Mon, Jun 08, 2026 at 12:10:26PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> > 
> > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > When vertical analogue binning is in use, the minimum frame length in
> > > lines decreases to around half of the normal. In relation to the sensor's
> > > output size this means vertical blanking can be negative but that's not an
> > > issue as control values are signed. Remove the workaround for this
> > 
> > Didn't we just discussed two weeks ago in media summit how negative
> > blankings are a bad idea, and of all drivers one could decide to play
> > with imx219 is probably the worse due it's large use base and the fact
> > libcamera doesn't support negative blankings ?
> 
> I also think that negative blanking values are a bad idea, for this
> driver or any other driver. I still haven't seen any compelling
> argument.

Note that the blanking controls haven't expressed blanking in other
configurations than those that do not use binning, either analogue or
digital, or cropping. The fact that negative values would result due to
sensor configuration does not mean the values would be somehow incorrect,
they simply do not reflect actual blanking configuration on the sensor.

In retrospect, we should have always had frame length in lines and line
length in pixels controls instead, or possibly besides the blanking
controls. But as the two blanking controls have been in use for conveying
frame length in lines and line length in pixels, relative to a reference
size, we can't re-purpose them for something else anymore without breaking
pretty much all userspace.

Multiplying the pixel rate and either frame length in lines or line length
in pixels by a constant does not make the blanking controls magically
correct.

I hope the above summarises my position in an understandable way.

I believe removing the rate_factor is necesary if we want to add support
for the Common Raw Sensor Model to the imx219 driver. Otherwise, we'll be
left with a single example driver only, the ov2740, which is an entirely
register list based driver.

-- 
Kind regards,

Sakari Ailus
