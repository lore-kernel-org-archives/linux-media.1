Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346223D4119
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544867; cv=none; b=SwwpdEp0PiOf6d+z67q3GJwxgPVcn19HPmhA5x9Bs5ZDpWGg0zyJLajJDGh/FmMpvcWRzQDVtSL4NDx6z87+eMlCSCyXiOD8H+IpT6SOpbK6tqOO6sP5YtmjQiia9S+Q5rRgCikoI+D0PghagrWuFeDbs31CI3eZjUcATIdiZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544867; c=relaxed/simple;
	bh=5y1kS1jJ9KgFhq/V2lHIRxItzUEnkl80kKeWRRroSp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7hTPxA333jc4YssF07DG5UjJUJVWm5CV4TkT+4A4kFEBaGXnlkcxpBbYxXddx5d3vMiLgQJhGG6lVCi9lAVE9G1EgLbuWaEd4KxbMd1SQJ6hmsbQJdSXnxSAb+nH0d98RdhzCSP626JQC3zga+A5Sh3jP7uRmFsAshbJUtB2cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0OejZIa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0OejZIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791544861; x=1823080861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5y1kS1jJ9KgFhq/V2lHIRxItzUEnkl80kKeWRRroSp0=;
  b=j0OejZIarOQ9XHD8FEDYk7WYSCIu5snZ/XGeM0XKDHon/EiHxnOTNMdv
   seCq9T9iXCcp9ybYgPL1KGmABPlVS2b2UA0P44qQUSiFQgqoABQ8a3e8u
   SD/A6aFu/cTyv04Sr/y3zk76B51y/DBuPfstEd1uDijaRdmY0kwYEN/Ya
   xmDCzDC6q9L4bgeC53NOVmY9n0Z8nij2cmmzKpOJMPE4ZhaOG44T6g+Vp
   4uqklDrO+nWdqR03390vqphWFU+Cg0YIPy29ZxKJodz/d5yx1RqOyMmNe
   oH3EH/PbcS4Sm7EipwoBwB0VW49xKrOFy1Du9JuD0UfyAgNkF1+1bRBvO
   g==;
X-CSE-ConnectionGUID: QnnuEqS3R0a8JnyYiJEFlw==
X-CSE-MsgGUID: Bi06GmdqQt6+YNk0c7G26w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="227730"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="227730"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:21:00 -0700
X-CSE-ConnectionGUID: 6BLcrRlUSgSHT7POj/exOg==
X-CSE-MsgGUID: N4iAUHwUQ5GHEdU0flG2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="749945"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:20:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 908EA121BA6;
	Fri, 09 Oct 2026 14:20:59 +0300 (EEST)
Date: Fri, 9 Oct 2026 14:20:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: Re: [PATCH 2/5] media: ipu6: Tell about not being able to obtain
 frame descriptor
Message-ID: <asjOG4vWytIm5KHJ@kekkonen.localdomain>
References: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
 <20261008085247.798156-3-sakari.ailus@linux.intel.com>
 <asjL1T0LK2F-q_GH@alaakso-desk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asjL1T0LK2F-q_GH@alaakso-desk>

Hi Antti,

On Fri, Oct 09, 2026 at 02:11:17PM +0300, Antti Laakso wrote:
> On Thu, Oct 08, 2026 at 11:52:44AM +0300, Sakari Ailus wrote:
> > Not being able to obtain a frame descriptor is a fatal error at this
> > point. The frame descriptor should be stored for the duration of the
> > streaming operation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > index 152545427930..3e9bfda2a8b9 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > @@ -749,8 +749,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
> >  	lockdep_assert_held(&csi2->isys->stream_mutex);
> >  
> >  	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
> > -	if (ret)
> > -		return ret;
> > +	if (ret) {
> > +		dev_err(sd->dev, "cannot obtain frame descriptor\n");
> > +		return 0;
> > +	}
> 
> According to title this is about logging the failure, but now this also
> masks the error. Should this tell about the error and take the cleanup
> path?

The problem here is that there's no way to do proper cleanup without frame
descriptors. I could return an error here to leave streaming status as-is.

The frame descriptors should be moved to sub-device state so there would be
no issue obtaining them anymore.

> 
> >  
> >  	sink_streams =
> >  		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,

-- 
Regards,

Sakari Ailus
