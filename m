Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB7371056
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776789278; cv=none; b=j4iGHnZMkSYmcajSAV/NPXZ4kVmH04IgCwos/5tolFkWEd15G3FjhlMSc8N326mLVIWoa5xwThqJMBWyHLYyFMx0RgG6oRYJD910mYG2GFPfc/RixdcqR9FYG6vfNvfyUtwJ8buJBFcK2ONJhFdrSa3q2fSzBQrsHMU89IDBD34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776789278; c=relaxed/simple;
	bh=hAfeCDcR8LlEZfSe3qOoITAETIvZim/W5cequqMq3VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxmWw820D3+zWSJuomUZf22pdB4sOXy75HimTxnLnvwEy0O91x2AyYQXawO3j4nZVZ75MJ3mP4weKP+NalJ4W5WKGOYztxRlpdcCa2aB0NYQiM1CDaEQ78st4mSQ9VekJk5+9PL0xJMLgkPVJqrfFesJg9q1MoHpE+jWAnQ+UAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gs1YoTWu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gs1YoTWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776789278; x=1808325278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hAfeCDcR8LlEZfSe3qOoITAETIvZim/W5cequqMq3VA=;
  b=Gs1YoTWuMK7zD1DMb986OXkvtvTlhFfCsVzM06s8ZYcu1OygY6VyoSdc
   v+4RNrcHFm1I1SUzKuew+RLb8A8uMhE7iZ8ps/lz391BNzIdYiswg2VO9
   Js4YYwkecOxRB7S5qrumevNwTCJ05RSuf5yhhClOsVTNwaaf/Cyai2opR
   uz3D9pzDM9B17R8zXqa2phlrveegTUJKqyTn7gbYoxZRcO4btTOI1sOzv
   rEoMDkIayKBNbb6SX0yrkyYs5JSWDk5S4Oqe6SjVDWJvQ/qlW54ZtYj2a
   R+X/gV28wZ771ZNsvzZO3prVm2n6sYAfS8QoCjmCMKZO9Z7yPcXcu/g7d
   w==;
X-CSE-ConnectionGUID: iCvtKhHBS8GOHQVmMkkzAQ==
X-CSE-MsgGUID: ZIkgTsvvQy+N9zVaW0jUNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77642800"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77642800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:34:37 -0700
X-CSE-ConnectionGUID: D8CDj7pOTtaqGQSWTiRo6g==
X-CSE-MsgGUID: Azc3MZEeTYqXvWSzf8a85g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237100098"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:34:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A93C9120D05;
	Tue, 21 Apr 2026 19:34:28 +0300 (EEST)
Date: Tue, 21 Apr 2026 19:34:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 27/29] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_active_state
Message-ID: <aeenFDVEUazcoTAy@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-28-sakari.ailus@linux.intel.com>
 <20260416173821.GA1824072@killaraus.ideasonboard.com>
 <aeegCr3fF5cb770c@kekkonen.localdomain>
 <20260421161220.GC2360857@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421161220.GC2360857@killaraus.ideasonboard.com>

Hi Laurent,

On Tue, Apr 21, 2026 at 07:12:20PM +0300, Laurent Pinchart wrote:
> On Tue, Apr 21, 2026 at 07:04:26PM +0300, Sakari Ailus wrote:
> > On Thu, Apr 16, 2026 at 08:38:21PM +0300, Laurent Pinchart wrote:
> > > On Wed, Apr 08, 2026 at 06:39:36PM +0300, Sakari Ailus wrote:
> > > > Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
> > > > take struct v4l2_subdev_client_info pointer as an argument.
> > > 
> > > If we drop the client info parameter from .get_fmt(), the only driver
> > > calling this new macro will be
> > > drivers/media/platform/ti/cal/cal-video.c. I would just pass NULL
> > > explicitly there and drop this patch.
> > 
> > That'd make the arguments for set_fmt and get_fmt different. I'm not sure
> > if that'd be a problem in practice, perhaps not.
> 
> All drivers should eventually implement .get_fmt() using the
> v4l2_subdev_get_fmt() helper. There should be no need for client info
> there.
> 
> > I could imagine in the end we'll need to include the client flags in more
> > callbacks than set_fmt(). It might not be a bad idea to add them to all pad
> > ops. Of course we could revisit this later when needed.
> 
> We should really minimize addition of new client caps flags, and really,
> really try to implement them all in the subdev core.

Yes -- if we can. In this case the common raw sensor model affects how the
driver's UAPI works so there's no really an option. I could imagine there
are other such capability flags as well. But let's see.

-- 
Kind regards,

Sakari Ailus
