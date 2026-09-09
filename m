Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4FD3D5C26
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946009; cv=none; b=pRpfcyGhP+8soJ5B99HXMKUXCZO6urVK/hjrC1hpUjkaQOYLaGXx/bMsddZEGrn4TFTuBRXq03yPOTbT7SiY6uHIwq4F52CEjk29g5vdqsCIoMlxDnG2Q2M7lNf4iHwPvnqPXImX42n2zvAuI8YDE9+Bp5jROGRvnCQJltc3Jfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946009; c=relaxed/simple;
	bh=y/WP9YPSNIhh+dV9auk4PpPGIDOsRF09jjSjzuwOWyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYAOIzxqzRXaHbO+xbHoSFBBTJpcUiETJgqMCIZYS2zfWdko/4hkmhWPC3YefkA0cEbNp++zp3eXe51b1DofXpc8WLQltvYcCdo+ctI/uXbF/ecee0zYU+IzYUw+rtlhUyhdOACFB9c1Jn4jkdFCkLrOu+sgtG5GVlDAzxTy2AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDmjpZHu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDmjpZHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788946005; x=1820482005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=y/WP9YPSNIhh+dV9auk4PpPGIDOsRF09jjSjzuwOWyI=;
  b=ZDmjpZHutBtlf+Ftzn8AsUVLQyWFpLM0PVOohTPuAxkcInMyEuO4gWuO
   YqbwqgccqvZEBsIYM6ROt9eKDpxGulfEZ9gPCF+GftFeFP798rpcYvwYK
   pinFOVNoY4cdk0dUXduH/bo4M2Aq70Dto8quHtNVRbXXatHsZmS67kM7F
   mV+zPTMf1NsotiLhAPCokuPsrIoxI+wT4WQ/7/DsZMZHg38HcayPwftop
   ODEAkyH9pa2Ap4Wsyhnop8Z1BlD7tdbSrqveUUAURzV4tcAtYyE6q46ny
   Rm6DCy7SQ/01Pu193z60MxCGSFQXJtp8eadg97WeDwR4PNQ9+N9+vEqlP
   Q==;
X-CSE-ConnectionGUID: sJeRL3UbTlKJlBUhr3330A==
X-CSE-MsgGUID: LELvo+pQSMieMwW1SiCl4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89396318"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89396318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:26:44 -0700
X-CSE-ConnectionGUID: T7ERh1y3TjGGly+jxpa6Xg==
X-CSE-MsgGUID: bPOCfynHRkK9XfkcxTJuxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="271756574"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:26:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EDFAF121BD2;
	Wed, 09 Sep 2026 12:26:44 +0300 (EEST)
Date: Wed, 9 Sep 2026 12:26:44 +0300
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
Subject: Re: [PATCH v3 18/29] media: bcm2835-unicam: Remove frame descriptor
 workaround
Message-ID: <aqEmVDuu1G1jSAzc@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-19-sakari.ailus@linux.intel.com>
 <CAD++jL==kKkqyN8j9-DxDOs0Z-oRXQx46jsvPOrQx2ohevc84w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL==kKkqyN8j9-DxDOs0Z-oRXQx46jsvPOrQx2ohevc84w@mail.gmail.com>

Hej Linus,

On Fri, Sep 04, 2026 at 12:43:29PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > As the v4l2_subdev_get_frame_desc() either returns a frame descriptor or
> > returns an error, remove the workaround for drivers that didn't implement
> > the get_frame_desc() pad op. Also handle v4l2_subdev_get_frame_desc()
> > errors.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> (...)
> 
> > @@ -933,7 +933,11 @@ static void unicam_start_rx(struct unicam_device *unicam,
> >         fmtinfo = unicam_find_format_by_code(fmt->code,
> >                                              UNICAM_SD_PAD_SOURCE_IMAGE);
> >         if (WARN_ON(!fmtinfo))
> > -               return;
> > +               return -EINVAL;
> > +
> > +       ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
> > +       if (ret)
> > +               return ret;
> 
> vs
> 
> > -       ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
> > -       if (ret) {
> > -               /*
> > -                * If the source doesn't support frame descriptors, default to
> > -                * VC 0 and use the DT corresponding to the format.
> > -                */
> > -               vc = 0;
> > -               dt = fmtinfo->csi_dt;
> > -       }
> 
> I *think* what Frank is pointing out is that vc=0 and dt=0
> needs to be in this patch so we see that
> the new code works when using CCP2 data?

Indeed, this is one of the few devices that actually support CCP2. The
other one I know is omap3isp. I think then dropping this patch makes sense
instead of adding support for CCP2 in frame descriptors.

> 
> Like here:
> 
> static void unicam_cfg_image_id(struct unicam_device *unicam, u8 vc, u8 dt)
> {
>         if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
>                 /* CSI2 mode  */
>                 unicam_reg_write(unicam, UNICAM_IDI0, (vc << 6) | dt);
>         } else {
>                 /* CCP2 mode */
>                 unicam_reg_write(unicam, UNICAM_IDI0, 0x80 | dt);
>         }
> }
> 
> Other than that it LGTM (OK may not be worth much, I'm a bit
> lost in the details here):
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij

-- 
Sakari Ailus
