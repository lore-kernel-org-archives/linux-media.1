Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323847D935
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 12:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350772; cv=none; b=mwtLpdjgU2mIjwfPaTv11ptbj12WTt3HjRtLrRuEai3Kzw1lpxkeb/GS+OsM+kwssFhcZlnycQr9OL79gT97HeEWOWBfFiUo10yAiTsgrTxuj1EzSNGnSc7mPeg9RCVWKWi0+rW/SXrJMbRRW+qUHQQJ9H866R02BRpVbNlJUQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350772; c=relaxed/simple;
	bh=HvXgmOppL7eKB1zgPHIUzglVvUeZ2B7c6+CUOH+tlUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCcG6r2r2A+AiPzympls3FrKp9iZleHxwQxx3aKn7DyAOtSCany9YZmP0es/ij9RDzQREem+MaJseilY1Zozkfwgp3QfN23TPvEmZLgrMNwnA9T5SfVGfNbFRVEnm+LV0qZOFJrvhPRYoZSnGo33ZCddnV/L+Jen9+KZtEMCpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/TSc1JD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/TSc1JD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788350759; x=1819886759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HvXgmOppL7eKB1zgPHIUzglVvUeZ2B7c6+CUOH+tlUc=;
  b=C/TSc1JD4NjmdZi8Oz2+clSy8pw6pEHbtU0tDTrChDHza+Oeatxu98pt
   YpKa4p3AFw/LE05JqOzbnFepo64QgrecIiovFpXpYWaaza1oDw6TGG4pn
   gfB0vD3l16AfArYG3T5yR/zDOx6J2H6w18xl6s0ZA0qHF4wb1lAWkNLgr
   4PIp01yKNuruQNoQttIfCahTm7VlNl32bi2u3Abao61S/wv1NAxFPYEhZ
   /8Ya/P9+biQ92PC7cCm2RW88Aexx8R4etWKafZpcrTkJwPFGihYP1mazl
   lKIi6GOyxmoHx80XkP2QqdhEasUz4c4tuCfVNNGBqLWB0/EJKQh4X2OpW
   A==;
X-CSE-ConnectionGUID: L1kCmcmSTNSljhPe67gU9Q==
X-CSE-MsgGUID: X8QJdEBKQ2WQ5Rop0rJhLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88732468"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88732468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:05:55 -0700
X-CSE-ConnectionGUID: CyPdLJmlSG2joMeOXUwCgw==
X-CSE-MsgGUID: VGSK28mHQb62id/UrOBhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="268086024"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:05:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3C57712150E;
	Wed, 02 Sep 2026 15:05:49 +0300 (EEST)
Date: Wed, 2 Sep 2026 15:05:49 +0300
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
Subject: Re: [PATCH v3 08/29] media: ds90ub913: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <apgRHft0VSu7_ZVA@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-9-sakari.ailus@linux.intel.com>
 <CAD++jL=5sGegH+cSxDocEVJnYMQ=ijsE45KOapHR0UNtQhjrVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=5sGegH+cSxDocEVJnYMQ=ijsE45KOapHR0UNtQhjrVw@mail.gmail.com>

Hej Linus,

On Tue, Sep 01, 2026 at 03:12:02PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch?

Var så god! :-)

> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> > the frame descriptor type in the get_frame_desc() callback.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> (...)
> > -       .get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
> > +       .get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
> 
> But is this right?
> Shouldn't this be te _dvp (what I want to rename _parallel) version of
> the callback?
> I can't see anything CSI2-related in this driver.

I guess you're right. There are CSI-2 to DVP bridges that just pass through
the CSI-2 frame descriptor, but this certainly isn't one of them. I'll use
DVP for v4.

> 
> Look at commit d6113cdd221964ebcfd479f56b1b7e9c4e28e7d4
> "media: i2c: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough"
> by Tomi:
> 
> -       ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
> -                              priv->source_sd_pad, &source_fd);
> -       if (ret)
> -               return ret;
> -
> -       fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> -
> -       state = v4l2_subdev_lock_and_get_active_state(sd);
> 

-- 
Sakari Ailus
