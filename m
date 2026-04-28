Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07013921ED;
	Tue, 28 Apr 2026 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366181; cv=none; b=VIRZwIKnHE4QLKjMFJ/RehreunAuOhrAJZ/AsMmrf0/DKp3mlpl+NAZQS2CmpR0ldVx0SyaTW56RoYyf7dQjE1/7rNBGSW1/gF/D6nukXicIChXbgC5kTIemuxnPdZf7wwLrDjuJvphIpH+yrf5AKY/TZbvAb5Q2TAPSTaSJUmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366181; c=relaxed/simple;
	bh=VrOM1pDBOwXCblENg2mS/FezjSmA+N40VdN2OlfvH1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6sHItKgIQTXIJp9ra17ht7Rb07RQs5GOUOTp8VBLzRNHRRrEeqWPqo6Vvgywm3CQvh1j5KAcF4Q/4l1IBxEknZ2XuFr1FOZS5+JqMciK5HPZ8P5y1x5hxD0CUH10H1m6ixH4MCUrndFo94vIJHhTfkYOdo6kCzYPqZzcBWEXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdixLDRV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdixLDRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777366181; x=1808902181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VrOM1pDBOwXCblENg2mS/FezjSmA+N40VdN2OlfvH1s=;
  b=fdixLDRVYSv1wSGKXml9TijMWGme2CfPNyTOkNXRWKNBBpUAj82QItOW
   5+sldV8J0MY1nH1vryCi3wlDL3+i4/zS54Rgx1275bxqmtl13jIttgMLx
   jzoYR236Kk2CoIDARe2qKks70lGBsufOmSS3XMRuLLxK9o4xY4SBuzhws
   +Osvwch2hYpJDj+pGVwIaHMKp4SEEJYTY7h+si/EcYIkDzY9TCCMuhxAi
   HYLsO/zeVS1Lq+SPCt0hrLhQ7EfWPF27TLL7u01V1dRhB5f1rngaJ2ShG
   dBACtfPyzuT6pgyY1EcErpHZMelo1iAY31OaxXsWp4+uT96dvHaLFzlbl
   w==;
X-CSE-ConnectionGUID: Sc/ndU3wQayd7lToGZVLKA==
X-CSE-MsgGUID: zHBwaj+zRHmTPx8R6UupCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78252465"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78252465"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:49:40 -0700
X-CSE-ConnectionGUID: dlZr80qlQT2ukRrrhWSEuw==
X-CSE-MsgGUID: sfFw4ax0Sbes0Lpyw6J5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="257423480"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.231])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:49:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 399F3120B10;
	Tue, 28 Apr 2026 11:49:42 +0300 (EEST)
Date: Tue, 28 Apr 2026 11:49:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <afB0pi_kv-DoCpTS@kekkonen.localdomain>
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
 <aec9Pzr_ZUD0zBcK@kekkonen.localdomain>
 <07115433-dcfb-40a9-952a-5f841ee93947@oss.qualcomm.com>
 <aefYk9tbUOzNNdOk@kekkonen.localdomain>
 <CAEth8oGAgn9i3Fh_hes+KPhEwZCTNxKJdyOeQyt9i40inX0Kng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEth8oGAgn9i3Fh_hes+KPhEwZCTNxKJdyOeQyt9i40inX0Kng@mail.gmail.com>

Hi Kate,

On Tue, Apr 28, 2026 at 11:08:56AM +0800, Kate Hsuan wrote:
> > > >> Updating both offsets here is wrong when hflip != vflip, you
> > > >> should only update V_WIN_OFFSET when changing vflip and
> > > >> H_WIN_OFFSET when changing hflip.
> > > >
> > > > The cropping configuration should reflect the values on the sensor's pixel
> > > > array and should not be affected by flipping. At least the crop window
> > > > needs to be adjusted accordingly by the driver. Is there a need to change
> > > > flipping while streaming?
> > >
> > > Ah, that is a very valid question, no I don't think we do need to
> > > set them while streaming.
> > >
> > > Kate if you cannot get the start_x / start_y coordinate changes
> > > when changing flipping to work to get a stable bayer output
> > > pattern, then another way to fix this is to only allow changing
> > > the flip controls while not streaming and return -EBUSY otherwise.
> > >
> > > This can then be combined with reporting a flip-ctrl dependend
> > > bayer-order so that userspace sees the right bayer-order after
> > > flipping is applied as long as userspace reads the subdev format
> > > after setting the controls (which libcamera does I believe).
> >
> > It's indeed currently a bit annoying to implement this. The common raw
> > sensor model will make this easier as the driver just indicates the native
> > pattern to userspace. I don't have an estimate currently when that set
> > would be in so the wait could be very long. Libcamera will need changes,
> > too.
> >
> > >
> > > For an example of an imx driver which reports a different
> > > bayer order depending in flipping see: imx214.c and
> > > the imx214_get_format_code() helper, a call to which should
> > > be used to replace any hardcoded mbus-formats in the driver.
> >
> 
> After many configuration attempts, tweaking the X, Y coordinates can
> not get the right Bayer order for the hflip, and also breaks the
> sensor's requirement (multiple by 4). However, changing the Bayer
> format for each kind of flipping works, and the colour is correct for
> every kind of flip, including h/v flipping. The side-effect is that
> the user can't flip the image during runtime.
> 
> It also worked with libcamera. Qcam shows the right colour when
> rotating the image 180 degrees.
> I'll continue to work on this approach, :)

Sounds good. Thanks for confirming this.

-- 
Kind regards,

Sakari Ailus
