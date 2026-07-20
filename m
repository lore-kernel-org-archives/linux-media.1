Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF262E6CB8
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531733; cv=none; b=UwU7LaFXH8K3epCQKdZJAuOUlE28s2PeF/qUe1p9Jpzja4ZBcGoN8NjOt47JwyILCRirRV8FyeN/FcCwQphEL7GA33j6DImMN9t/j8PUsnNc+/voGIZOLn1kS4N7VpkwlsbbGTFmCQ28V8vGLeSRvtGlZZebe2aE41aiNhpuzt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531733; c=relaxed/simple;
	bh=dReKv7cZlwFgIt2UrbaCV4fh2hxuN9rT9H8hKeLcSqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4xflRdACDHEeeyXJPWU1UFUJGLUhlRaCZIXUEUiPRqIUTXa51vw8b4Xj/pMuTSUnYjQUAGSxRjB0MrZbMxusNKdFK3Jyt26B1ZeY1FN1oYwraMRfUtwMCbPkx/Hdr3l+9XUIzN7HLBkSMKoWNvNVphUdn2TU9lZDWXd9EzTk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnVVE78s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnVVE78s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784531731; x=1816067731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dReKv7cZlwFgIt2UrbaCV4fh2hxuN9rT9H8hKeLcSqI=;
  b=OnVVE78sxcInBZcX8APwvqs5UwhMTwc0XvhiChzpRjovvU44OQNejD0V
   u2dKTcBeYkjG8rP/cUA9jYpS6d/XbwAKYm+ozR0Gha2tGCvTZs8oqxXsH
   5A9jvCg6zz6Pf1KXZdTgwH90mBkiR/BMdp3CHtUmpLYfj8lmNm/Izs/O+
   f+/oy/MxPF/3CGHzw+di/JmgyN3GjZ8F7i81HuG7lq1x6hfWI6eB2ibyb
   6/7QagCTT4jUXJtWZRL+rViPICybGWdaSCZZTHMIU5jaJOzcH0yIF0kPR
   MWVIjbCrarq+MALJu//BH+RbrDgX95dvox0YURU4eFhyeHGPk+/rhhz+x
   A==;
X-CSE-ConnectionGUID: R6bWNLVPQ/ikiZY/YaZrjw==
X-CSE-MsgGUID: AZDVwePdRu6iGEPgKK5f5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102527929"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="102527929"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:15:30 -0700
X-CSE-ConnectionGUID: 3J/zkbqLS0CwRsyzx78PDg==
X-CSE-MsgGUID: stgIKgppSNyUCVBTDrHqIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="281848641"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:15:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9C039121C02;
	Mon, 20 Jul 2026 10:15:27 +0300 (EEST)
Date: Mon, 20 Jul 2026 10:15:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v6 03/16] media: imx219: Account for rate_factor in
 control steps
Message-ID: <al3LD8CGw7N6CX64@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-3-sakari.ailus@linux.intel.com>
 <20260717142121.GC1889304@killaraus.ideasonboard.com>
 <al0686b7StFtPfY2@kekkonen.localdomain>
 <20260720055248.GA2208631@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720055248.GA2208631@killaraus.ideasonboard.com>

On Mon, Jul 20, 2026 at 08:52:48AM +0300, Laurent Pinchart wrote:
> On Mon, Jul 20, 2026 at 12:00:35AM +0300, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Fri, Jul 17, 2026 at 05:21:21PM +0300, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Wed, Jul 01, 2026 at 03:26:20PM +0300, Sakari Ailus wrote:
> > > > The controls that are divided by the rate_factor before writing them to
> > > > the registers have the step of the value of the rate_factor. Take this
> > > > into account when the control's range is modified. The controls are
> > > > created in a configuration where rate_factor is always 1, hence there's no
> > > > need to change the code adding new controls.
> > > > 
> > > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 18 ++++++++----------
> > > >  1 file changed, 8 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index 05d9737bdc95..2aab6e7180d4 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -319,19 +319,19 @@ static const struct imx219_mode supported_modes[] = {
> > > >  		/* 1080P 30fps cropped */
> > > >  		.width = 1920,
> > > >  		.height = 1080,
> > > > -		.fll_def = 1763,
> > > > +		.fll_def = 1762,
> > > 
> > > This is not a binned mode, an odd default value is not incorrect. Is
> > > there a reason to change it ?
> > 
> > The fll_def field is used to calculate the VBLANK control range and odd
> > number here results in an odd number for the default, which is invalid and
> > so __v4l2_ctrl_modify_range() will fail as a result.
> 
> It's only invalid if the step is 2, isn't it ? The 1920x1080 mode
> doesn't use binning, so the rate factor should be 1, and the step should
> therefore be 1 as well as far as I understand. Am I missing something ?

Ah, indeed. I misread your comment first; I'll drop that change in v7.

-- 
Sakari Ailus
