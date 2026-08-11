Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044DB2236F7
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432842; cv=none; b=Ohg06peUMjV0dWvkbZfsE0O2YhLXVci5Nen/A4VFY18vxj34VCiCmISeI6zO23hcjMAukRIxf1qYGc11pXAS3xCAXEIun8C1i0CobHkShzKJ5C76OLQtv2mGdXcuSF1omUAcjTPrUWRW/esA8RCPbrhsibYJL2lKuW5pJwct9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432842; c=relaxed/simple;
	bh=E3f8koVHLoYRlt0ywlWm8sOEFKM1rm3CyB45carfoQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNeAm9wBLeOr2wnaEIAki56DrTj/uNKFmYYmV3VZlnCn067QB2WD/sccgtjLF50uLvj0R8YVITp/U1yRka7RKzELpy5eY7the2/ZJ/IRScuOwzfzWyAMlW7kvXZGeHuFKT8TClSXObxj1dAQDtx6m84r+JsCgcYUb4G1Goor9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bee4oTmg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bee4oTmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786432841; x=1817968841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3f8koVHLoYRlt0ywlWm8sOEFKM1rm3CyB45carfoQA=;
  b=bee4oTmgN+qJVJOpoFdGH9zQjU9n9I7GShFEx59mm+l568ueTt6E1Xyg
   M/B0zWlaaosxJxoB78VfnZxAOPovTftjFdfuCi1bAIW0r/qcCFEqGlxR+
   +RrUlkaVCUOwex81JZTFI6Rpbque7g9KXA7Kdt5O8e1FcP71bKNY3GWyT
   J2rjwEZAro1tWdwmBrhfgjBQRoO6mTx9XJS2JQhIrV459mL3twSMZ5Egd
   4u1SQyQ2dAqWSqlZBxKjQ3hFHhYRc1BfhAqLCDrT544kYbYII2nb8VkI5
   sxu7eOMmdZUk7fyrKlcUNvbUN4dDrMxk7OXd2+dUze+UO3IyBPfvWip1m
   Q==;
X-CSE-ConnectionGUID: IvfQRDrGRmWrTuglUDhkEw==
X-CSE-MsgGUID: WW3CAA75SAOGi5AsKQWO7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90839664"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="90839664"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 00:20:40 -0700
X-CSE-ConnectionGUID: WdCkbeI1SbiG12QbF1FmqQ==
X-CSE-MsgGUID: a6Mhd34dTb+/xjEK7bv9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="286675743"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 00:20:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E3B3111FC6D;
	Tue, 11 Aug 2026 10:20:32 +0300 (EEST)
Date: Tue, 11 Aug 2026 10:20:32 +0300
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
Message-ID: <anrNQN93dT51kM3s@kekkonen.localdomain>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-12-sakari.ailus@linux.intel.com>
 <65b0c3ab-ae76-49ec-824a-b9d882c28a5c@kernel.org>
 <20260810153207.GC3011310@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810153207.GC3011310@killaraus.ideasonboard.com>

Hi Hans, Laurent,

On Mon, Aug 10, 2026 at 06:32:07PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 10, 2026 at 04:12:31PM +0200, Hans Verkuil wrote:
> > On 07/08/2026 14:24, Sakari Ailus wrote:
> > > Add v4l2_subdev_call_ci_state_active(), and
> > > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > > cannot be called using v4l2_subdev_call_state_active() or
> > > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > > state argument.
> > 
> > So if we have to jump through all these hoops just because the client_info
> > pointer precedes the state pointer in the pad op argument list, wouldn't it
> > be better to swap the order? For example by moving the client_info pointer
> > as the last argument?
> > 
> > Honestly, these macros are getting really hard to follow, and I'm not sure
> > it is worth it just to keep the client_info before the state pointer. Yes, that's
> > the logical order, but at the price of some very hard to read defines.
> > 
> > Or am I missing something?
> 
> Those are exactly the points I raised in the review of v6 :-)

And my answer then was that I prefer some additional complexity on the
framework side -- where we have a single implementation of this -- over
pushing less than ideal APIs to all the drivers.

To give some idea, we currently have about 200 drivers implementing the
set_fmt() pad op. I also expect the number of pad ops where we need client
info will grow over time, making this quite a bit more visible in the
drivers than the scope (set_fmt, get_selection and set_selection)
introduced in this set.

-- 
Kind regards,

Sakari Ailus
