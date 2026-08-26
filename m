Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298F38F945
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730719; cv=none; b=EOqiiFl/tetNdORobnRc5eA/j9mi3e1jji+PBWlnP9VigKJzSLGFnZaGoIBud/JQgW/oVshsbde/gj1MvDq3kgBAINRVDGTUkUfa267z0A/M4XQ/wmKxlgnVPmxPd6/QISWyEiWDb5wqGke4fndfKTalb0BD812SC6uIixaYRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730719; c=relaxed/simple;
	bh=ujZvB2YfwBYhKXlUGwrc64D+ZKi+63OL2aZ9lQabgEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0Jbi2Mlq5khlSSlCu/ToW3UMhbGOnbf8Q9GVfPRjs1JezF65ZCEZapjvGsRxrN0PVapwIasjtDCbKEWBysh6EaWEByXj37sMautousHA4GR55kPnMoZ3+KyekcqqEYLYukOa26Egs3fAFf7HdNpO3ggpA3fcSk9RFwisTuVl5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUfELXLN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUfELXLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787730717; x=1819266717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ujZvB2YfwBYhKXlUGwrc64D+ZKi+63OL2aZ9lQabgEk=;
  b=cUfELXLN+KdUPUzwbm56cvfZa5T1absAy8NGlVHyMUPE3EbWOvSUi5Ve
   yhKDJwpPjsQdCl3lif1vYIOpnlB8Vi5762X0zbFidTphNFMa3A+6VptJi
   6Yhtj0pqszLTF36OQ56UPws84PeMt+nTFOV04AjuoCN4gw6wNX8IBRxW3
   zmnu2c5I5SRtI7b1aGAWa3DuFvjWWuXqDRmRIr6psRutIPWDjBVfKArjX
   BW+j6qs01MvP4BD5iqeFPZUnQlrEzMPNs2c4p1yf34ss/ITMvU0GemEgM
   z/o0Cr81Xz4y6BLmNR0JEXci483y7/8gmgZxECq/gpTDNYFWp+iw5dylf
   w==;
X-CSE-ConnectionGUID: Zr1lzP3AR+aXgwYpTF8ejw==
X-CSE-MsgGUID: CHdLvKPFSZ+JSL/xtAMnVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88234232"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88234232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 00:51:53 -0700
X-CSE-ConnectionGUID: oZSsZsDiTz6dwFEjd0g61g==
X-CSE-MsgGUID: X2mvFVVeRGOW3gScWc6wdg==
X-ExtLoop1: 1
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.215])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 00:51:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 97EC011F961;
	Wed, 26 Aug 2026 10:51:59 +0300 (EEST)
Date: Wed, 26 Aug 2026 10:51:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
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
Subject: Re: [PATCH v7 11/14] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <ao6bHyVUrhr44eIu@kekkonen.localdomain>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-12-sakari.ailus@linux.intel.com>
 <65b0c3ab-ae76-49ec-824a-b9d882c28a5c@kernel.org>
 <20260810153207.GC3011310@killaraus.ideasonboard.com>
 <anrNQN93dT51kM3s@kekkonen.localdomain>
 <20260811083854.GA3120099@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811083854.GA3120099@killaraus.ideasonboard.com>

On Tue, Aug 11, 2026 at 11:38:54AM +0300, Laurent Pinchart wrote:
> On Tue, Aug 11, 2026 at 10:20:32AM +0300, Sakari Ailus wrote:
> > On Mon, Aug 10, 2026 at 06:32:07PM +0300, Laurent Pinchart wrote:
> > > On Mon, Aug 10, 2026 at 04:12:31PM +0200, Hans Verkuil wrote:
> > > > On 07/08/2026 14:24, Sakari Ailus wrote:
> > > > > Add v4l2_subdev_call_ci_state_active(), and
> > > > > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > > > > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > > > > cannot be called using v4l2_subdev_call_state_active() or
> > > > > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > > > > state argument.
> > > > 
> > > > So if we have to jump through all these hoops just because the client_info
> > > > pointer precedes the state pointer in the pad op argument list, wouldn't it
> > > > be better to swap the order? For example by moving the client_info pointer
> > > > as the last argument?
> > > > 
> > > > Honestly, these macros are getting really hard to follow, and I'm not sure
> > > > it is worth it just to keep the client_info before the state pointer. Yes, that's
> > > > the logical order, but at the price of some very hard to read defines.
> > > > 
> > > > Or am I missing something?
> > > 
> > > Those are exactly the points I raised in the review of v6 :-)
> > 
> > And my answer then was that I prefer some additional complexity on the
> > framework side -- where we have a single implementation of this -- over
> > pushing less than ideal APIs to all the drivers.
> 
> I'm not convinced, but I won't make that a blocker if it's only me.
> 
> > To give some idea, we currently have about 200 drivers implementing the
> > set_fmt() pad op.
> 
> Does the order of arguments really matter for drivers implementing those
> operations ?

Each driver will implement these ops and it'll just look wrong in each of
them. The complication here is rather minor so my preference is to keep it.
It's already implemented, too.

-- 
Sakari Ailus
