Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647253BBFCE
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532168; cv=none; b=NITIGkUcCIOG/a3KC/GPr08zfbk1lVxzmquaH7kaxM4VVwJAGsqkp4h0ZT9DT5DsCph6vgEaCaUVmCkEJcwsHPvaeUXzpjdmhELKU35NajSMxeOD2bMcTMGpOmT47pd9cAY+s4RlB1rYNnXcLi7Ui2DliF6V2UiO1sRK+ovGc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532168; c=relaxed/simple;
	bh=RUNMetXvATuKykenUrAEJJ4+1EtSZgMLWtvPqn0m+nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqz1tNk95ZFb1yQ+8JEvSGZFHQKQQEu/OqQQD8w2qiLH/NVtuWbliNTlzUD0//CI/JDYxRnhPNGLRR3nqvplfM2cLxDv6sVw5Eeadax6LIGDOYm75GUFwfeEXMiOU+f70VlgZgPEEiEr/kwIwPIXRBdz/EniojHj0gkrJ+BwfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=et97dUgB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="et97dUgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784532164; x=1816068164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RUNMetXvATuKykenUrAEJJ4+1EtSZgMLWtvPqn0m+nU=;
  b=et97dUgBEOq0vAWA1a0kiUPFszVw9KOC2PN3S7cw4t2GHKGEd4xzOrZz
   fBHKepyPpBef/aLiSPD4dmuQ5fJF5WsUMYhjYsgqtFzNx68tIyjwaHhZ/
   itRRGouUTL6ulDDm1yFsNqcftuEUYKBqPd3gIo6ZtHsZYiS/DnmtQ1YI3
   ct001vrQkMcjCSXQaOyR/YNUHrYBz7yKE4ZDQ8d3Bdgxm9KORF2Bt73UE
   KW6SixnGbTcQ85LHqqO/N/YeKX3TMilSZRcoNIYm8p3/BGV5KBIhwEmHE
   rAiIT6X9DwQPO5IqvWQ040aC/ypmxeenoV/tP8ooQ0i/Qtqi0n+tA9aQ9
   Q==;
X-CSE-ConnectionGUID: zjl71MS8ReyOc02MQLgetw==
X-CSE-MsgGUID: qp/BE/ImRheX+ey6xLbwSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85128637"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="85128637"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:22:42 -0700
X-CSE-ConnectionGUID: Le1XlSgdSkmbWLgDvQMh2g==
X-CSE-MsgGUID: jmTWDbv5Tamwxeyw6pgadQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="261663589"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:22:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BF93B121C02;
	Mon, 20 Jul 2026 10:22:38 +0300 (EEST)
Date: Mon, 20 Jul 2026 10:22:38 +0300
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
Subject: Re: [PATCH v6 08/16] media: v4l2-subdev: Move op check to sub-device
 op wrappers
Message-ID: <al3MvhlOFGEIdZZM@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-8-sakari.ailus@linux.intel.com>
 <20260720064521.GE2208631@killaraus.ideasonboard.com>
 <20260720064559.GF2208631@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720064559.GF2208631@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Jul 20, 2026 at 09:45:59AM +0300, Laurent Pinchart wrote:
> On Mon, Jul 20, 2026 at 09:45:22AM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Jul 01, 2026 at 03:26:25PM +0300, Sakari Ailus wrote:
> > > In anticipation of performing work for sub-device operation when the
> > > driver doesn't implement one, move the check of operation existence to the
> > > wrapper itself.
> > > 
> > > No functional change intended.
> > > 
> > > Many drivers implement set_fmt() pad op that simply returns the format
> > > just as get_fmt() would do, usually because the driver only supports a
> > > single one. The arguments to set_fmt() and get_fmt() are about to get
> > > differentiated so call get_fmt() always if set_fmt() isn't supported by
> > > the driver. This avoids changing drivers now and allows removing
> > > boilerplate code from existing drivers.
> > 
> > I don't see this change in the patch. Am I missing something ?
> 
> Patch 09/16 answers my question. With this paragraph dropped from the
> commit message,

If you think the first paragraph is enough to explain why this is done, I'm
fine with dropping this one.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
