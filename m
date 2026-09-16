Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ECC34DCCD
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546189; cv=none; b=eu+V7BK5q9PFXZ1Ae30T5AWQ2BtviOZd1VaY735CMIUIP/IKlVToG+74jT0SD82i3811vbrXJglPB/kNBiUg1jQJQfP+bFs3FxXIO+BatNkfp25LmybhGBxAj1tWjmSDwoMFb/28IzzW1V1+zSY0mf9UaVsn43n9k0bsWSa3ZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546189; c=relaxed/simple;
	bh=PA/rhI8eQAUpU3Ntc2VsoikJBRtgMf3U7AOuK+YYWpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOG0fZZPPWCS7aYLyq6/pVbCsfl8MXPeI/dFBzBmvYU5z/abAs7+SUdfCRSV+aG0ID0uoYT4xWm4osuDo5B0VjY9rRtJZDvhQUmScBrULK8fV5WWNjEuN8nH3nSVEYeCnJiQYyv5OBI/vPbEYTGjNdMQaJMcYpYfg3mAfqf9tOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqZOhtkC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqZOhtkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789546179; x=1821082179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PA/rhI8eQAUpU3Ntc2VsoikJBRtgMf3U7AOuK+YYWpY=;
  b=VqZOhtkCge71ad404PY0Ox3slgQS2Wv3j4lCDcPuQp9gm7v1rNdeGSwP
   PC+08ErWUYTwvbdBdHKY7QG9s7sx8rP5gV0X9BkUbLnQXB+/PyIzbuNsr
   2r+3MqzYo/B5fJkdKiqCYcmychxiK6Uh0JUu+t38+57enf0TDmkEAxOBB
   eJPf3tq/T41LlTH5U6uCY+e26NckFVs6wwVFsj0KozBOM7nmAykBMntLZ
   HzOLyEntdR0EDW7/100L6vduRDTGt8jy+IiowXriJfUiRSrRf8RKEvxJE
   u8O9cn1XVLF9XdDJlaPhg5B+V9SAGHyB77YO6vNmaYwNie14IpfpaCH5g
   w==;
X-CSE-ConnectionGUID: 9F0NL+7aR9+K/W2srTCO6w==
X-CSE-MsgGUID: b/r3bxKgSOq3remyb59Gpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93619411"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93619411"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:09:36 -0700
X-CSE-ConnectionGUID: 1L+k16MYTmekxXVAp67deA==
X-CSE-MsgGUID: 4cL28+fxSfGx0Az8wvSgKg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.126])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:09:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 728BD11FB41;
	Wed, 16 Sep 2026 11:09:41 +0300 (EEST)
Date: Wed, 16 Sep 2026 11:09:41 +0300
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
Subject: Re: [PATCH v3 25/29] media: ipu6: Use v4l2_subdev_get_frame_desc()
Message-ID: <aqpOxcjiNXQms_7K@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-26-sakari.ailus@linux.intel.com>
 <CAD++jLkPuVcNEdJkk3eRzoHCLzNiaSrifXRMeHVnEYt4SmjbPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkPuVcNEdJkk3eRzoHCLzNiaSrifXRMeHVnEYt4SmjbPg@mail.gmail.com>

Hej Linus,

On Fri, Sep 04, 2026 at 10:21:31PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > -       ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
> > -       if (ret)
> > -               return ret;
> 
> This will have the subdev do the desc and type conversion IIUC.
> 
> In the current IPU6 subdev in ipu6-isys-subdev.c there is this big table
> to do this:
> 
> unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
> {
>     switch (code) {
>     case MEDIA_BUS_FMT_RGB565_1X16:
>         return MIPI_CSI2_DT_RGB565;
>     case MEDIA_BUS_FMT_RGB888_1X24:
>         return MIPI_CSI2_DT_RGB888;
> (...)
>     case MEDIA_BUS_FMT_META_8:
>     case MEDIA_BUS_FMT_META_10:
>     case MEDIA_BUS_FMT_META_12:
>     case MEDIA_BUS_FMT_META_16:
>     case MEDIA_BUS_FMT_META_24:
>         return MIPI_CSI2_DT_EMBEDDED_8B;
> }
> 
> And now we have this:
> 
> > +       struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
> > +               v4l2_subdev_get_frame_desc(source, pad->index,
> > +                                          V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> 
> I suppose this will invoke instead the big lookup table from patch 1?
> 
> Is there any point in keeping the old IPU6 lookup table around after this,
> it looks vaguely confusing to me.

I agree it should be removed. There are lots of other things ongoing with
that driver currently so I think this can be left for later to avoid
conflicts.

> 
> But removing it might be better as a separate cleanup, so:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Tack, tack!

-- 
Med trevliga hälsningar,

Sakari Ailus
