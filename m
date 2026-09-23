Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467FB47F3D0
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165526; cv=none; b=kYh4AsxHFCCzR2RcYscD/upn5g4WL5XND3geZI32t7c+aWnT7G1vmIiPVRyHUChyp0lR+g/dJNpZoloD1T3hzLO/R3KNt8gCHk3tHTmm839Tg2pgkIGq3x3/FfSudjpsJ/M3azJjC1sHG8F8gTgZwi0wXk2gzmWrBxyWKff7F1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165526; c=relaxed/simple;
	bh=jbcf4PInueH6euHIFurAdQd9+Erhm7gjayc/48I+lyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ff7yw3d6g5S2Y/Sw/oj6SaS6TVzI6Avmm0iKosOoPGoguDkDyx7/13BI0jNjirElZ8mzAt1MwWlcjVF7Jz2vM9ZxDC+vRAPX/SkHXw/mh9qrO6O2R/2V4J3qPD4h+OXanI9bRN9KvvexKhPUQ0Qr5KgPmx0Out9QemRg3NcZWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu1dx6v8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu1dx6v8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790165523; x=1821701523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jbcf4PInueH6euHIFurAdQd9+Erhm7gjayc/48I+lyM=;
  b=Tu1dx6v896Ktc4Wyl1Kn1jcGGKY9LENIfo9fZE2Iw9VwjduknmwPOel1
   JZS1xs0dotVrzqDanho0O17gf1K3iuzM0OKDIuDrAC6lA8NTli6dVxKjv
   iplhtoFqcIGv/whWT/dghKvTxIdNslQXWVERKWjW8D1kw9NatbbC9Qmww
   avbHYFRN5FUWwwjaokqtF0fVb3MfVPsxKgDsihJEddnccoN8hg4XySp/9
   OiS6ldDOLK+jsx6TYyBVLOjZv9pNljaUn84OP73eWnEvbdkRGk32OH8Nw
   CUX8UgThHwd7davjCVuSlbyOCVSvxUacE6/F7JLLNPoBWmOUXItC4Av3t
   g==;
X-CSE-ConnectionGUID: M00gnpkCQy+T0F1f7CVLPQ==
X-CSE-MsgGUID: 0+cNoPpVTsKToKYFxzFcmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90968229"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90968229"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:12:02 -0700
X-CSE-ConnectionGUID: 9J5MyHBcTxyV7Klq+12SNA==
X-CSE-MsgGUID: 9XLDllDeRhqheNsyZYZHUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270100316"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:12:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A5A4912080C;
	Wed, 23 Sep 2026 15:11:59 +0300 (EEST)
Date: Wed, 23 Sep 2026 15:11:59 +0300
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
Subject: Re: [PATCH v3 05/29] media: v4l2-subdev: Allow allocating frame
 descriptors based on the need
Message-ID: <arPCD2WzFyT0GSNx@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-6-sakari.ailus@linux.intel.com>
 <CAD++jLnruxXqtgm2ckQQhKvuNQvawH0xZpq8ipYSjFLKDbpnyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnruxXqtgm2ckQQhKvuNQvawH0xZpq8ipYSjFLKDbpnyQ@mail.gmail.com>

Hej Linus,

On Mon, Aug 31, 2026 at 03:18:50PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!

Tack för kritiken!

> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Frame descriptors entries require a small amount of memory per entry (20
> > bytes), but if the number of entries in a frame descriptor is large, an
> > unreasonably large amount of memory would need to be allocated in the
> > stack. Therefore the number of entries has been limited to 8.
> >
> > Support larger frame descriptors by making the entry field a pointer that
> > by default points to a pre-allocated array while the get_frame_desc() pad
> > o may allocate as much memory as required, up to V4L2_FRAME_DESC_ENTRY_MAX
> > which is changed to 64.
> >
> > The caller is also responsible for releasing the allocated memory by
> > calling v4l2_subdev_free_frame_desc().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> (...)
> 
> > @@ -63,10 +63,6 @@ static bool v4l2_subdev_enable_streams_api;
> >  /*
> >   * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
> >   * of streams.
> > - *
> > - * Note that V4L2_FRAME_DESC_ENTRY_MAX is related: V4L2_FRAME_DESC_ENTRY_MAX
> > - * restricts the total number of streams in a pad, although the stream ID is
> > - * not restricted.
> >   */
> >  #define V4L2_SUBDEV_MAX_STREAM_ID 63
> >
> > @@ -354,6 +350,7 @@ static int call_set_frame_interval(struct v4l2_subdev *sd,
> >  static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >                                struct v4l2_mbus_frame_desc *fd)
> >  {
> > +       unsigned int type;
> 
> This is again an enum, right?

Yes, seems so...

> 
> > @@ -362,16 +359,26 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >                 return -EOPNOTSUPP;
> >  #endif
> >
> > -       memset(fd, 0, sizeof(*fd));
> 
> So passing an unititialized or re-used struct v4l2_mbus_frame_desc foo
> used to be fine...
> 
> > +       type = fd->type;
> > +       memset_after(fd, 0, type);
> 
> ...and is not fine anymore.
> 
> I guess later patches in this series fixes up all users so no-one
> passes in some garbage here?

After the set, we have all drivers converted to use
v4l2_subdev_get_frame_desc(), so this means some amount of inter-set
breakage. I wouldn't see this as a serious issue but if someone thinks so,
then we may need to introduce an intermediate wrapper that sets the type
for this.

I'll also include patches for the recently merged drivers calling
get_frame_desc() in v4.

> 
> > +               if (desc->num_entries > desc->len_entries) {
> > +                       dev_dbg(sd->dev,
> 
> When you get to this check, isn't that after this loop:
> 
> for (i = 0; i < fd->num_entries; i++) { (...)
> 
> so you should check num_entries agains len_entries before this
> loop?
> 
> (I might be misreading the patch, maybe I should actually apply
> it and inspect the result.)

The earlier arrangement was that the caller made the allocation but that's
no longer the case, so this is a fatal error now. Still, if num_entries
exceeds len_entries, the access of unallocated memory has probably already
been committed, so this check would still take effect retrospectively even
if moved to call_get_frame_desc(). I'll do that now in any case, the other
sensible option would be just removing it.

-- 
Med trevliga hälsningar,

Sakari Ailus
