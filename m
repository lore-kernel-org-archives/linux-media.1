Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23DA3A7195
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080051; cv=none; b=kH53rpfvZsA6CCqOISjJfb7L3y2qr1cBkXYH4BPlYY8K5tN01LXPaMhlowUeQCfr35pO8KFq7WD/nkjYvYKCg2hp2PdXtGLxs/xHb61ib4cYXwOHtdtthxUtjexqME6aPlvAf/qDmlPb/sDWijRTAlG6oMQ66+5QuMOPy3ihtaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080051; c=relaxed/simple;
	bh=El9TeD9PBhjE29tsqUlIa8RQS80ay2fShvMWed+FtpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMmeGZ0RYtiKyYrChy/XRZSmtKyIWCJ5TWoGsUjkh+PZLCU01MOac4irtXfqLPpZyGM1xkzq/8eGcl1HHcBswoSANnNp9PL8+GozYmwWeXB+kUBRyqDlL+FNgsZUYZchT8p0AjuqRQpHela/GJzwVyBCt72Y0APewjcAYbg/ADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZ6Gg5GT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZ6Gg5GT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781080050; x=1812616050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=El9TeD9PBhjE29tsqUlIa8RQS80ay2fShvMWed+FtpI=;
  b=kZ6Gg5GTPsNCadTbb4nMetNxaoV+5G+zoov9+46DlV/4Yypkihm5X4nN
   k0gZyHBRLfx5zI7r2LzILUCKl3Etc9vk1MkJZ08fodnDJh04v7/AQqa4T
   V7zuM7WQW8KWTc2ZujqBlvvhwEO5iXJsO0cG7qQw6RkWtOm/N5mrQuWen
   Yzi4nvBlmXyF/R17KeCxna/Gxb7gcb7rH34cesWfJjE1sKxW+guzdj5f6
   qQhwFCgID6ojtrp44IHfDb1O18vstx4+M90pEFDj4Gqk0U/36k0hXFOcA
   mJUL6PHAQkKmioPhnFCJsg05F4VCFG5M2BLIU/LFTH9HeOqoEBxWl4cMK
   g==;
X-CSE-ConnectionGUID: KCjqeJIvTj6mmMcGr2zZXw==
X-CSE-MsgGUID: PyIVcIySRcavCSOqz19x2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93255106"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="93255106"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 01:27:29 -0700
X-CSE-ConnectionGUID: Uwm1K+yzRaO/MQ0XfELTNQ==
X-CSE-MsgGUID: 6MB50+GFS6KrlKF48lh8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250042489"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 01:27:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EC216121C50;
	Wed, 10 Jun 2026 11:27:18 +0300 (EEST)
Date: Wed, 10 Jun 2026 11:27:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
	"Yu , Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <aikf5r1urSvVP1Jv@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <20260608091026.GB772117@killaraus.ideasonboard.com>
 <aibMpvdVNraURHIE@kekkonen.localdomain>
 <178093582619.19620.15016359616261234139@freya>
 <20260608215213.GC944266@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608215213.GC944266@killaraus.ideasonboard.com>

Hi Laurent,

On Tue, Jun 09, 2026 at 12:52:13AM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 09:53:46PM +0530, Jai Luthra wrote:
> > Quoting Sakari Ailus (2026-06-08 19:37:34)
> > > On Mon, Jun 08, 2026 at 12:10:26PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> > > > > Hi Sakari
> > > > > 
> > > > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > > > When vertical analogue binning is in use, the minimum frame length in
> > > > > > lines decreases to around half of the normal. In relation to the sensor's
> > > > > > output size this means vertical blanking can be negative but that's not an
> > > > > > issue as control values are signed. Remove the workaround for this
> > > > > 
> > > > > Didn't we just discussed two weeks ago in media summit how negative
> > > > > blankings are a bad idea, and of all drivers one could decide to play
> > > > > with imx219 is probably the worse due it's large use base and the fact
> > > > > libcamera doesn't support negative blankings ?
> > > > 
> > > > I also think that negative blanking values are a bad idea, for this
> > > > driver or any other driver. I still haven't seen any compelling
> > > > argument.
> > > 
> > > Note that the blanking controls haven't expressed blanking in other
> > > configurations than those that do not use binning, either analogue or
> > > digital, or cropping. The fact that negative values would result due to
> > > sensor configuration does not mean the values would be somehow incorrect,
> > > they simply do not reflect actual blanking configuration on the sensor.
> > 
> > I agree.. although what is the actual blanking configuration on the sensor
> > in this case?
> > 
> > I've been banging my head for a while to figure it out (my best guess in
> > the sibling thread)
> > 
> > > In retrospect, we should have always had frame length in lines and line
> > > length in pixels controls instead, or possibly besides the blanking
> > > controls. But as the two blanking controls have been in use for conveying
> > > frame length in lines and line length in pixels, relative to a reference
> > > size,
> 
> What's the reference size ? The controls are documented as
> 
> ``V4L2_CID_VBLANK (integer)``
>     Vertical blanking. The idle period after every frame during which no
>     image data is produced. The unit of vertical blanking is a line.
>     Every line has length of the image width plus horizontal blanking at
>     the pixel rate defined by ``V4L2_CID_PIXEL_RATE`` control in the
>     same sub-device.
> 
> ``V4L2_CID_HBLANK (integer)``
>     Horizontal blanking. The idle period after every line of image data
>     during which no image data is produced. The unit of horizontal
>     blanking is pixels.
> 
> This is compatible with usage of the output size as a reference. And
> doing so wouldn't require negative blanking, would it ?

That's not true: the reference of the blanking values in fact is the
analogue crop rectangle, not the output size or anything else. However, I
believe we need to take the established usage on UAPI as a fact which is
why I wrote this
<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=5b470f2ed717705b51f4a799722dffb34a37f10a>.

I haven't posted it to the list yet.

-- 
Regards,

Sakari Ailus
