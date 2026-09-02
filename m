Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0116481FC5
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350575; cv=none; b=j3he4myXi3uGwNmDrrOvUGm2/V7Ep66bfsSccm+IsE5+hJ8YNLpAvqjxxcyBSkwpuGUIDuO840NXjdDyANEj/387049ucDW3eXriY088iFahJVerU9w1u6RlmkYiLjPLGLAKrj2Gxud9K/ozzOk9Ujr11G/DjwvNlMS6jNSM1lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350575; c=relaxed/simple;
	bh=r/uCvtUAtO67nnSpkfby67pzIxax25QZkpJmwhlzk98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVr1bMIoNKFogAkw9xbU38tdgEqSRzatB5LUu4tQHu6dyPMfkCyp2e/DojcKAnFlvB8ruALwuiDSTTanoacswz/6vC/H3zka30+3d1/ixqnd9Qj+Bu9eW7FSrDahdXjb1OtcidUgVJpmvsJDzCtRJc+Vx4t+0unMoXMOwFLdRgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMB06SPX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMB06SPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788350568; x=1819886568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=r/uCvtUAtO67nnSpkfby67pzIxax25QZkpJmwhlzk98=;
  b=KMB06SPXofyClvVVFHFgid0RyyNWOXVhrKPOhpbP+eEn9X+ohdGYK/dq
   iIfVPUJR/MIAKvoa2QZjEMn6uE2Xz0tOySQDWAsEGE24Mc0AtoEiNAqqV
   dSHNHG9etllboeUsJEXBDt6v6cNM/DCkEBFR8zVufwevyUTkiEPmRJU1i
   FsutTjX8rLw8VMl7qISQPkvfNJzA8KWj002GqS9BhwjJIRIFRWHo8MyQt
   l5AsNk+l3EuvjU8pz/Hq/3/gvyya4nRQnwS3zbej0+IS3YTeIQjaDwQK8
   Rd7XWDrN8DiC9ama2hQ6c08339u6wF84zNSlxAqfofPwOxk9fVl9IjQ+c
   w==;
X-CSE-ConnectionGUID: 30csonubS4Sg8eir1dbEbg==
X-CSE-MsgGUID: 3NsksTnDQOCON1MSLCSQ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100160220"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="100160220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:02:40 -0700
X-CSE-ConnectionGUID: WnX2QiQ+TniMdib1U3/CVQ==
X-CSE-MsgGUID: Waj+PNrfReWp9mvmjBn+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="299271552"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:02:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4C7C112150E;
	Wed, 02 Sep 2026 15:02:34 +0300 (EEST)
Date: Wed, 2 Sep 2026 15:02:34 +0300
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
Subject: Re: [PATCH v3 07/29] media: v4l2-subdev: Add frame descriptor
 passthrough for CSI-2 and DVP
Message-ID: <apgQWnaOD5Yh30yv@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-8-sakari.ailus@linux.intel.com>
 <CAD++jLkQiG2eoQ2yq07wLHr23XdAa4wZSma6HyE+sB7AYWQbxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkQiG2eoQ2yq07wLHr23XdAa4wZSma6HyE+sB7AYWQbxQ@mail.gmail.com>

Hi Linus,

On Tue, Sep 01, 2026 at 03:01:13PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Add frame descriptor pass-through functions specific to MIPI CSI-2 and DVP
> > (parallel) interfaces. The two new functions are needed in order to
> > support frame descriptor-less sub-device drivers.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> (...)
> 
> > +int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *sd,
> > +                                              unsigned int pad,
> > +                                              struct v4l2_mbus_frame_desc *fd)
> 
> What about calling this
> v4l2_subdev_get_frame_desc_passthrough_parallel()
> 
> because...
> 
> > +{
> > +       fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> 
> That's what it is.
> (Following the Rusty Russell API naming hierarchy)

In fact we should rename PARALLEL in most cases to DVP. The thing is that
this is some sort of de-facto industry standard but it hasn't been
documented property except by one company which calls it "DVP" (digital
video port). "PARALLEL" is just very generic and there are other parallel
interfaces supported, such as Bt 656.

> 
> Other than that it looks good so with this change:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

-- 
Regards,

Sakari Ailus
