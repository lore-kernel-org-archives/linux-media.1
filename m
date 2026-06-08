Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC7739B48F
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906482; cv=none; b=dtd8jBRBYgRaqTA6Tnr48gCT3TWESS7zTjU7Gv+mvUvxuX2fGIrSy0ii6jGk+/FKSk8aMBgYoUB9AE/meD66wJRTAzi3Zl2fZ08fS2/ZX9cl5DUvLabcpbwmKKYvoc9vAWCwK3K+5aykKC1naPCHXHWu6UiUEwTAjCKe7tqOb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906482; c=relaxed/simple;
	bh=Ntow/3sWGI2DquH6T6AMNWvtEeiLAiV0hd6oAWdVYqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFoYBzn107Uw1Zk7W3hlNm0XKUlATaRDYt544mRDKm85rVp7vF92Cs9W2+nTVRDs1vNzL4GjXxAeEVPSPse+CXqvNvZ3r28/R1Bx0y85OF13gH1RG0s5a9PosoRLHHV9xNhEqY6xg2nEZrQO+fElTyTBEXowCsOFEuNr8N9lB4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnQFKE3c; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnQFKE3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780906480; x=1812442480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ntow/3sWGI2DquH6T6AMNWvtEeiLAiV0hd6oAWdVYqc=;
  b=EnQFKE3cnu2TWXIKKKNpUdkXVgT9QR4T9Zmk1zKtgkvHZ5FqHaxQOb/o
   SPgL2uSAT7eZArTbQzwAkpd0hoN0xA5Wh1zenWTvOdFW+YyuWs08/XGZq
   +3Le8lnyxEMyJbtJXRRKdwvcdtdM/gOBvzzrUfko5/MBjJhrpW1DgrreZ
   2y2UsJOzxWjuVkLWIDmfROXeJwtx+7HLuHNG0tvpJgJwBKPm/w0mfefMM
   3H7eeRX7irldyhaj57QJDvHyaSkLomqn6PUvgm31SyT7ZnlhZvg/X6Fqe
   bNerLYFT/sufNBw4iZeHsrN5+Ejvtw9aZzdGSrlr9sZ0kwfYii3exLNMt
   w==;
X-CSE-ConnectionGUID: K2bzma1kTZW4gdymVUQ9VA==
X-CSE-MsgGUID: XYjXvQ5DQoaIX5+tLBsY+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81612063"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81612063"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 01:14:40 -0700
X-CSE-ConnectionGUID: tPICT975R22BK8tV+RJ70g==
X-CSE-MsgGUID: N/IKvZReS4+miQy0rri1yg==
X-ExtLoop1: 1
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 01:14:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 39EE911FBC5;
	Mon, 08 Jun 2026 11:14:32 +0300 (EEST)
Date: Mon, 8 Jun 2026 11:14:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 04/10] media: imx219: Make control handler ops for
 PIXEL_RATE NULL
Message-ID: <aiZ56IgNJ2FeXN0o@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-5-sakari.ailus@linux.intel.com>
 <20260608073653.GD370380@killaraus.ideasonboard.com>
 <aiZ0a3nGqp6N7GD3@zed>
 <20260608080338.GF370380@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608080338.GF370380@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Jun 08, 2026 at 11:03:38AM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 09:53:17AM +0200, Jacopo Mondi wrote:
> > Hi Laurent
> >   sorry if I reply in place of Sakari but I got this fresh
> 
> Thanks :-)
> 
> > On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> > > > The PIXEL_RATE control exists to convey the value to the userspace and has
> > > > no configuration that would need to be programmed to the sensor. Make the
> > > > control handler ops for the PIXEL_RATE control NULL and avoid a warning
> > > > (as well as returning an error) from the driver.
> > >
> > > I thought the standard way to handle pixel rate being read only was to
> > > set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
> > > V4L2_CID_LINK_FREQ. Is that not correct ?
> > 
> > PIXEL_RATE is RO by default
> > 
> > drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
> > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
> > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;
> > 
> > The purpose of setting the ctrl_ops member to NULL is to avoid having
> > to handle RO controls in the driver implementation of .s_ctrl().
> 
> Shouldn't the V4L2 control framework avoid .s_ctrl() calls for read-only
> controls ? I thought it did already.

The control may be read-only on the UAPI but the driver could still do
something about it in its s_ctrl() callback. I don't know if any driver
depends on this though.

-- 
Regards,

Sakari Ailus
