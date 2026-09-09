Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9604A9D4F
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 10:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948401; cv=none; b=ZYRB3pvjxx2U8Zoe0eevbVv3rRVJDA9h8p6GMT9M41rwCV4GtpnKiGngOskPxxZFdlIgsKyGmUNVhsaZwOQ4iJAFRFj8rlpV9P38ZM27UHY2zS+FZYact/RncQrT8SjWDCYRGKENhid0K8OZDPa+WLTOXZ5ru8kr5AlkHmDO+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948401; c=relaxed/simple;
	bh=4v6cl+3tt+t1rDxLx90fkt87gVsvwinmTNQ3wPikn1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjHrIFzE/iinJ6PT1TnQan9YwaTTnFOOQHCGlZwY6/BE1LGAHaa0RzI8UNPKcsWGmjIiamqgGhthjmcNsP9OwbbDwIqYiZgaAf4XD9mzRo77EpFRUQhVM/WAtOwy6Ov4s6OSm/+e+baKAkl5BTKqQ1hdIpIHif24Fpv1H7SAxUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtNf9AiF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtNf9AiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788948399; x=1820484399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4v6cl+3tt+t1rDxLx90fkt87gVsvwinmTNQ3wPikn1Y=;
  b=EtNf9AiFSJCBOnjoBE1vbGKJolJSCTA5z8ULjqYy7qUneKqEWUlTVc+h
   oUIOkPSa81C2BvmUMqycxa3o4bSUf/VfNtzjB1br3MnTo0LlljgawWjpv
   F+N/M+5ck29pZDruSEq4ZiRuE9BjqG05FGlvC8h3X8n4dK1QBaofhUTQy
   lJ+hSaGxuMpzKS29Rz9mFVbbJAX5igWv9GF7/1wU9Js49Gc9feeT+M/1g
   MUTWJ4v+gJRvKnr04jta2nLynlaMpfuf/g1x6RGNqJL9ImVfGVxNmhrSL
   vIoLaDKHDpjU3VtyE+96iLQc9XgyKv6LgMSiEWb3JuTWo5p5aHHccM8nG
   w==;
X-CSE-ConnectionGUID: yDoXvxSBR2u/P2B0X28sNA==
X-CSE-MsgGUID: E2Rp5LVAQR2/g99NIQyegw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91882397"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="91882397"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 03:06:39 -0700
X-CSE-ConnectionGUID: 8MYb2L1vQQ6X3i+urIZkww==
X-CSE-MsgGUID: i+WUPWI5RWuGXoZrznJSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275048649"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 03:06:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 22361121BCE;
	Wed, 09 Sep 2026 13:06:35 +0300 (EEST)
Date: Wed, 9 Sep 2026 13:06:35 +0300
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
Subject: Re: [PATCH v3 22/29] media: rkisp1: Use v4l2_subdev_get_frame_desc()
Message-ID: <aqEvq1oGKmOBPpe9@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-23-sakari.ailus@linux.intel.com>
 <CAD++jLm33oaLUmtKp4ZEYa9CvaKwvQ0rF1wWDU1QWLr2gYKsPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm33oaLUmtKp4ZEYa9CvaKwvQ0rF1wWDU1QWLr2gYKsPA@mail.gmail.com>

Hej Linus,

On Fri, Sep 04, 2026 at 03:12:20PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> > preferred over calling the get_frame_desc() pad operation directly.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> (...)
> >         source_sd = media_entity_to_v4l2_subdev(source->entity);
> > -       ret = v4l2_subdev_call(source_sd, pad, get_frame_desc,
> > -                              source->index, &fd);
> > -       if (ret) {
> > +
> > +       struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> > +               v4l2_subdev_get_frame_desc(source_sd, source->index,
> > +                                          V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> 
> 
> This is one of those cases where this should be
> TYPE_PARALLEL rather than TYPE_CSI2,
> and I think you said you would look into that so it will
> be fixed in the next iteration.
> 
> i.MX8MP uses the VeriSilicon ISP which is wrongly named
> "rockchip" but actually used in i.MX8MP ... it's a big confusion
> for the head...
> 
> Check for example this device tree overlay:
> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso:

It seems both DVP and CSI-2 are possible. I'll address this for v4.

> 
> &isp_0 {
>         status = "okay";
> 
>         ports {
>                 port@1 {
>                         isp0_in: endpoint {
>                                 bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>                                 remote-endpoint = <&mipi_csi_0_out>;
>                         };
>                 };
>         };
> };
> 
> Whoa!
> 

-- 
Sakari Ailus
