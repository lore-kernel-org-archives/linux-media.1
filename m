Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739853D8907
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787645105; cv=none; b=CKCCjP92zG6e5lGJSYkRWY7j4EVykTxukX4HiIvX6azRiKVZ7fu7BwAqaV9i6NICilIwLU6Xq4vHrwnR83PbB3o/AXnd4wnzjpsh9WRvLwESYZrHNXSP1WkJ3z0o8oL0rkusmOCmMzmE8Ev297KReUdtj88TRdR7yR98qS/O6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787645105; c=relaxed/simple;
	bh=jpG3f7FdK9mBot409pWSt/cfek3Jfqvt2r598jhIzyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBTG/cl/5IrAnPzaKwP3bvKhFzoMRKyyOGpKpxSaieqL3HDbn6v/Xrd5P47sNAdRKLnPiIKwVOEyaGJbxQDEd/hR4/XsaD652ytVUJxXQpXYnJXTsSHgIB7dmgwpVgv2QWaMPWhvdkvGx6ElnezvI52kJuEPwh3jB/12KS5FCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWIk6qYg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWIk6qYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787645101; x=1819181101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jpG3f7FdK9mBot409pWSt/cfek3Jfqvt2r598jhIzyY=;
  b=iWIk6qYgXewKGo+4j8/Gji2qgiF4IFqhtuus4m/tiSvlBy2oG5lFy1Nm
   3ke+GqPuO1bcqG/gBaHdP14NScJqkSV+KKFPVurq4eTE5/cDHvNENhXyD
   8ATeKd7CVGInCVIL6gGKPKiuXgXFTJNegI9JrM4SKssoIqYJqKHEDT+Jf
   r2xw2Fc2h1k3YBdBMd8WSaznZpvBFNlachQB1yiPaqd0iRD8GHOEO1B23
   mOQiajIGLjhmK2TbiGsWdw2dxzsEDv34zTiCXuTZLV8Tz6Hpg2DYES4wk
   MVDUf0ZCbKtuL6QkwH4/He4gZY+YPW6g4Gp1b71YxjlbZRAGCIf4w3CMg
   g==;
X-CSE-ConnectionGUID: 322PKGgKSKKE4JmujuMaDA==
X-CSE-MsgGUID: MgspmjnlSlC7w1S2rIB+7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87966160"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87966160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 01:04:56 -0700
X-CSE-ConnectionGUID: 2wgyfazETNWAf9szYqVz6w==
X-CSE-MsgGUID: BOFicGuRTCqC+L/Zxm3ivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="266670675"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.50])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 01:04:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B2CE712033D;
	Tue, 25 Aug 2026 11:05:04 +0300 (EEST)
Date: Tue, 25 Aug 2026 11:05:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 24/29] media: ti: cal: Use v4l2_subdev_get_frame_desc()
Message-ID: <ao1MsDAIOk_O8-lL@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-25-sakari.ailus@linux.intel.com>
 <aoy27PL0_Ispirl4@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoy27PL0_Ispirl4@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Aug 24, 2026 at 05:26:04PM -0400, Frank Li wrote:
> On Mon, Aug 24, 2026 at 03:14:46PM +0300, Sakari Ailus wrote:
> > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> > preferred over calling the get_frame_desc() pad operation directly.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/ti/cal/cal-camerarx.c | 26 +++++------
> >  drivers/media/platform/ti/cal/cal.c          | 49 ++++++--------------
> >  2 files changed, 27 insertions(+), 48 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> > index 00a71dac0ff4..9ea1f3551d22 100644
> > --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> > +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> > @@ -9,6 +9,7 @@
> >   *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/mfd/syscon.h>
> > @@ -872,7 +873,8 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >  				       struct v4l2_mbus_frame_desc *fd)
> >  {
> >  	struct cal_camerarx *phy = to_cal_camerarx(sd);
> > -	struct v4l2_mbus_frame_desc remote_desc;
> > +	struct v4l2_mbus_frame_desc *remote_desc
> > +		__free(v4l2_subdev_free_frame_desc) = NULL;
> >  	const struct media_pad *remote_pad;
> >  	struct v4l2_subdev_state *state;
> >  	u32 sink_stream;
> > @@ -893,24 +895,20 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >  		goto out_unlock;
> >  	}
> >
> > -	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
> > -			       remote_pad->index, &remote_desc);
> > -	if (ret)
> > -		goto out_unlock;
> > -
> > -	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> > -		cal_err(phy->cal,
> > -			"Frame descriptor does not describe CSI-2 link");
> > -		ret = -EINVAL;
> > +	remote_desc =
> 
> cleanup prefer declean variable here
> 	struct v4l2_mbus_frame_desc *remote_desc __free(v4l2_subdev_free_frame_desc)
> 		=

Interestingly, that produces the following warning:

In file included from ./include/linux/cleanup.h:6,
                 from drivers/media/platform/ti/cal/cal-camerarx.c:12:
In function ‘IS_ERR_OR_NULL’,
    inlined from ‘__free_v4l2_subdev_free_frame_desc’ at ./include/media/v4l2-subdev.h:1867:1,
    inlined from ‘cal_camerarx_get_frame_desc’ at drivers/media/platform/ti/cal/cal-camerarx.c:896:31:
./include/linux/err.h:92:31: warning: ‘remote_desc’ may be used uninitialized [-Wmaybe-uninitialized]
   92 |         return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
drivers/media/platform/ti/cal/cal-camerarx.c: In function ‘cal_camerarx_get_frame_desc’:
drivers/media/platform/ti/cal/cal-camerarx.c:896:38: note: ‘remote_desc’ was declared here
  896 |         struct v4l2_mbus_frame_desc *remote_desc
      |                                      ^~~~~~~~~~~

My guess is that the gotos before the assignment that are the problem.

-- 
Sakari Ailus
