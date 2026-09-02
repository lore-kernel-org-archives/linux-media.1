Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F27D47DD4B
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351736; cv=none; b=fFB0WsbHs6NlgAHOo8GXktm0V16P2FR8uUyuvnMAbhTnMxgi5y7fJixspnbDSEuk3f0jcGZ6Fkb7gNSaOSCohNn3iJGJdoiEiiP/tfP2FuWwqSK4+e8pmtTviW+5/l1M4ef4Mf3aMhg5WvA/B5wH8N0ZBMMT0llSm0tZp/gElN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351736; c=relaxed/simple;
	bh=Sz28JTGHWpuLZ+przZje/pIm1QpHTX1ubGzfDFJJnF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnIB21Dej+IWdD4yt97zeBq6IxdAbqtl5EHhMKxxIDswSuyuREhf+MYePsClOwKCY9A8FXyfbIoI4X8XA3wP/uslYPwv9i3hHvarLo2AUIDwKNQJEat8UqY3Vdfoki/DVMjp9QSn+ueO5nlwIypvifKco4Pf+0b5BtFIfEtFoT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dljXqGcX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dljXqGcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788351734; x=1819887734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Sz28JTGHWpuLZ+przZje/pIm1QpHTX1ubGzfDFJJnF8=;
  b=dljXqGcX9xquhR8hWw5n9Q22/dWfSU0s+V8NCCedxKOMoqAGMZgbQMTL
   +sc8tvHmB3fOO4Vfdu8p7atLS5DGL6Ji6dSspsFcEXoeI7G3JyEqa81+5
   PEabBG15YKqjB5X71RfegEVs7UyswKuwnlYCgodx03i/m+UpvI1DU96pu
   QuCLOnH/whxy0sBkmP039Op4LWt7NtQ56kqp3J75Qm/rrv/CHSGOriwj/
   zCqivSkUk6+MmHVD7AZqmp8+D3ibw9UaNNTRJFUdBSDcTRjZ9laxChQfI
   THem/1z+VSJEySoG6TlPdWjs51PaMG91/Mx1jWw6PqsP4qMztGfbvMxyp
   Q==;
X-CSE-ConnectionGUID: Zi4nTue7T3CZTDYfBUtIuA==
X-CSE-MsgGUID: eYK9BF63Qe6NApaqN1Hi0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100162339"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="100162339"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:22:13 -0700
X-CSE-ConnectionGUID: 5R/UZOC0Tp60/5HlgwI4gg==
X-CSE-MsgGUID: DQv14iR0Q22O40IXncMuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="299273366"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:22:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6139E12150E;
	Wed, 02 Sep 2026 15:22:07 +0300 (EEST)
Date: Wed, 2 Sep 2026 15:22:07 +0300
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
Subject: Re: [PATCH v3 11/29] media: rzg2l-cru: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <apgU7yKJ34-62c22@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-12-sakari.ailus@linux.intel.com>
 <CAD++jL=1HUxGjjNa4WMJhV558ME4vMbCSRwPd2kASENDRi5W3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=1HUxGjjNa4WMJhV558ME4vMbCSRwPd2kASENDRi5W3Q@mail.gmail.com>

Hej Linus,

On Tue, Sep 01, 2026 at 11:18:43PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> > the frame descriptor type in the get_frame_desc() callback.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> (...)
> 
> This looks dangerous, you remove this:
> 
> > -static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > -                                    struct v4l2_mbus_frame_desc *fd)
> > -{
> > -       struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
> > -       struct media_pad *remote_pad;
> > -
> > -       if (!csi2->remote_source)
> > -               return -ENODEV;
> > -
> > -       remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
> > -       if (IS_ERR(remote_pad)) {
> > -               dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
> > -                       csi2->remote_source->name, remote_pad);
> > -               return PTR_ERR(remote_pad);
> > -       }
> > -       return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
> > -                               remote_pad->index, fd);
> > -}
> > -
> >  static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
> >         .s_stream = rzg2l_csi2_s_stream,
> >         .pre_streamon = rzg2l_csi2_pre_streamon,
> > @@ -752,7 +733,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
> >         .enum_frame_size = rzg2l_csi2_enum_frame_size,
> >         .set_fmt = rzg2l_csi2_set_format,
> >         .get_fmt = v4l2_subdev_get_fmt,
> > -       .get_frame_desc = rzg2l_csi2_get_frame_desc,
> > +       .get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
> 
> And replace with this callback, despite the driver just sets:
> 
>         csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> 
> I.e. it does *not* set V4L2_SUBDEV_FL_STREAMS and doesn't have
> any .set_routing, so it's not using the streams API. The other drivers
> you changed so far in the series had this flag set.
> 
> Yet it now shall support multiple streams?
> 
> I don't get it tell me what I'm missing here.

I'm relying on those having the hardware to test. X-)

But more seriously, I'll add some compatibility code to handle sub-device
drivers that have no streams support. I somehow though it was there to
begin with but turns out it isn't. The function is meant to be more generic
that it already is.

-- 
Med trevliga hälsningar,

Sakari Ailus
