Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793276010;
	b=y1sLWqTRkFAiZKCqRiJoTOB2YhLDpurJbmerwEWkGcn17bd9xymckLjq+qL6Y5DGRW5f
	 7QimPauxUGrFuCl/r0hmMYYZEVZErmyNIavsj1z9RPtzVmQMsvGIwqnul1mynBMd/RNbZ
	 CPgXWAVrLaF9McdD9hmFkyXUlN4Un6wv1RA8oz9xzCFL9tDYMlaBhkBcJGH837ROgZOxS
	 JmQJUh9K0xaH+3jqWK2wgrBV7mQMgUMN4OHHijeioRDWmohjTJzmAf19UX1/76KzcOgAG
	 HS77UWEpqb9nW2rxFtEHP4AxiR51TcMs8AKvuXPfkZDuVjiL0jrzhMhWBxd1rYXmDZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276010;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=zjdoIEVHYTHxXi/t4xgSK93FIdoKarm/Zf+72Ns8eZs=;
	b=JRTQKZdP/OwwpQ9h1uBYd3S6nNzHVZ9naJ04QN41vu6noc/j39tdPgyOMyU9gjWUMyFy
	 7CuLoJmEa/f8Guiq1lg++Zi/pyFhYfjqlMb1mqw2cviRbSN/eZc1vA25j2lh+MaPgT25z
	 3Ae9NUdq9x8YQLQ/aGsWlaG+54R3r7xB25b2u1YHTKDFYB1U9q5Ce9+q5v8Ups8AO/ZLK
	 N3buYacuCKUQuYGgEJbPZz1Ip5M6Gor2wVpJnMtS9lIjO+F0f5WIANSTnlIWjwOiB7hb5
	 0/EE5pDEvImZCacTfBswLeVMu1YGdveFAq+ekcudK+JiFIAWMik4/XuYVEreqJaPkrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AuHHDboX;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30166606A324
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 12:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30166606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AuHHDboX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793276011; x=1824812011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dkYlAt3UgtyFZ60odxLPPQyFYoiqazxqu+lmA8aDvs8=;
  b=AuHHDboXSgzoTGxb/kjsHLdrd2eq7jXzuoyTwrG8v5I5y1IIGb7cIK4A
   iFqM6iKkJz+9pZThFe0e+dUlcXJP64/pfUnEJ2YIRwb4zediXASFf8SUm
   F+naQLNPAtxThQVf9qxNek4OKeHOGsGf4M8L/GwUSErYqhK1i7OENSpr0
   XAWBLUww9LO0tszQGw0RXzLv53WVDITgxQITx5Y5c63JTBSyiUoIkSVqe
   cIJH18KJuMvRsiREI4R5BvOVspiVb7PCACks/EUgKE+HRrF2Xiygx7X+S
   f7nZo7bUwLKKUydLmhg/TcW/9/J0vFpl+BBPA6o9LV5VQ2cgKaVangPPr
   g==;
X-CSE-ConnectionGUID: voQ9gc9vS/CB49TNA50BAA==
X-CSE-MsgGUID: WotypvCCTteBMAfzxVdnYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1914282"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1914282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:13:30 -0700
X-CSE-ConnectionGUID: m2RrgxPxR8aoT+FrY6CzhA==
X-CSE-MsgGUID: 5MiWlQK9TKW7R0wlliksww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5230773"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:13:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1DE63121BCA;
	Thu, 29 Oct 2026 14:13:33 +0200 (EET)
Date: Thu, 29 Oct 2026 14:13:33 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 16/29] media: v4l2-subdev: Always return at least one
 frame descriptor
Message-ID: <auM4bZXkpSSQDZA5@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-17-sakari.ailus@linux.intel.com>
 <CAD++jLnWXeFWuj+Jy2qFe8N_wQzUxu2TLKU8SqsvbA98aq7HOA@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnWXeFWuj+Jy2qFe8N_wQzUxu2TLKU8SqsvbA98aq7HOA@mail.gmail.com>

Hi Linus,

On Fri, Sep 04, 2026 at 12:27:31PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > +               if (!desc->num_entries) {
> > +                       dev_dbg(sd->dev, "no frame descriptor entries\n");
> > +                       ret = -EINVAL;
> 
> I think I saw -ENODATA; used in other cases like this, is this the right
> return code? (Just asking, I guess no big deal.)

Most probably the error code here gets returned back via VIDIOC_STREAMON
IOCTL. EINVAL, EPIPE and ENOLINK are documented as valid error codes. None
is an exact match, this rather signals a driver bug.

-- 
Regards,

Sakari Ailus
