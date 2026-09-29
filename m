Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038AF51B163
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683348; cv=none; b=n4NLGLoYwrTKKGlJSNA0zZjKmEGQ6VhrQm2C0TDyh+8e4yrGpEkX5n3l7t+XsyPGiZ0e4vk0G7g57tXfDnJoWHakQvOROG/UeUZZCQ9DywHL6Nt5ld0x0QopluT+Dwg4GPGaPShP6wzhKnEndOMdZfghjfpKRzAtoCwQvYNodmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683348; c=relaxed/simple;
	bh=OTO3c1Z55KaSG1CAhfiPzBeKdlDOwaiM9M88wpEun68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hctoWU4WttmcSI9xin2sHd7wgFKMVFDF4AU0eEyAkxfPXJpTi7oLqDEhHmxwghjLaUUx0bkVRTHnG5USZF2O4W9rAsaMPckya8fUymv+CeSQa8jiVUSgy5/T7JlFYx0Pcqxjea0Df31j+7m6ULZyrk1pzsd52wqnyY9cSy9dumI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULzDGaAT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULzDGaAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790683346; x=1822219346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTO3c1Z55KaSG1CAhfiPzBeKdlDOwaiM9M88wpEun68=;
  b=ULzDGaATCKa+SA03nlfgkfoybih6R/ED+bvRjlbSsfoYzXlLnZLHwsmC
   9VMeVg6H7Rvrgy/vyzBlanTjdM30mi/17WT8h/CCrXGz5H3fk7mYmVNLs
   UI0ZDyM+x98EWu58n2o5YVeGh4kJuvvWpvYYn22+L8dv5+rMp0UJaJQON
   3JcGnvOb9/vy099v173xTGXMbvdsjrjW+0Zde7cL7s9zIQtWlDmUKtRMB
   YhQRrIt3Vfw+3ATMuhXaHXLA94vd04ToaXEA8PEiZoCQ2QT+/VFpPKfBL
   +DA3fagtUh8VkAQcm42PS+B2de1ziksJM+0j0+th3wp6FNCUULjxsTDKL
   Q==;
X-CSE-ConnectionGUID: NUWrDACUTWeOovNBk284rA==
X-CSE-MsgGUID: IA0ExgH9TjC+gJVs+Zv7mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90452641"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90452641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 05:02:26 -0700
X-CSE-ConnectionGUID: zTW94HwQQyqz8smGSVdbXg==
X-CSE-MsgGUID: bVwB4HutT4ODXebtdrrHuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="273959202"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.223])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 05:02:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B960121840;
	Tue, 29 Sep 2026 15:02:27 +0300 (EEST)
Date: Tue, 29 Sep 2026 15:02:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] media: i2c: ov02c10: Narrow chip id check down to match
 ov02c chips only
Message-ID: <aruo03AhRCNtFp0n@kekkonen.localdomain>
References: <20260621145808.2660219-1-vz@kernel.org>
 <fa69ef0f-089d-453f-b088-dfa573bf1fcf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa69ef0f-089d-453f-b088-dfa573bf1fcf@kernel.org>

Hi Vladimir,

On Tue, Sep 29, 2026 at 10:58:16AM +0300, Vladimir Zapolskiy wrote:
> Hi Sakari,
> 
> On 6/21/26 17:58, Vladimir Zapolskiy wrote:
> > Originally a chip id check in the driver's probe function is done for
> > any OmniVision "ov02" sensors, but is too wide, since there are at least
> > "ov02a", "ov02b", "ov02c", "ov02e", "ov02g", "ov02k" and likely even
> > more families of sensors with similar names, thus the check for id shall
> > be more specific and match "ov02c" exclusively and expectedly.
> > 
> > Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> > ---
> >   drivers/media/i2c/ov02c10.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> > index cf93d36032e1..b36da75d7dfa 100644
> > --- a/drivers/media/i2c/ov02c10.c
> > +++ b/drivers/media/i2c/ov02c10.c
> > @@ -18,8 +18,8 @@
> >   #define OV02C10_MCLK			19200000
> >   #define OV02C10_RGB_DEPTH		10
> > -#define OV02C10_REG_CHIP_ID		CCI_REG16(0x300a)
> > -#define OV02C10_CHIP_ID			0x5602
> > +#define OV02C10_REG_CHIP_ID		CCI_REG24(0x300a)
> > +#define OV02C10_CHIP_ID			0x560243
> >   #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
> 
> can you please start review of this trivial and long-standing change?
> 
> Thank you in advance.

Thanks for the ping. I've queued it for 7.4.

-- 
Kind regards,

Sakari Ailus
