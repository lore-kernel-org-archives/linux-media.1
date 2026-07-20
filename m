Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE3C38C40C
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556820; cv=none; b=YPoYzDmGy30gcRfIkqkh8zKm+4abYR+NWv1e9Dn60X/PBiIRGwT2rHo4wwieXiZ2q50MGMzdITjsSxAPyGdTnwFfIMeZBqffIcwrbOiYEDKVGPCTuGkMtIcEZjrW/jboYkvnVru2cd34wn7nKP8DmXE5BmdTQxtL3Til/sYNP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556820; c=relaxed/simple;
	bh=puhdLhuRoke0s76W7Rati63RDEwMRchyb4bINHzgH0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H83r/y+3vaDsVJmEAkIg98N/SrtUALVjgb8UpkVdESX6mOrb69SjvBuYIDiZ03/GrzN3JuX2xjBS+JnnzvgionI2Uvdl/ZOOFpyD8r1XeOwVE1+buqczLnC6rQEO/hFY0wx5xcBpJhy/VV1apXyjzKcmW0OFqijp8kECovjGTNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvWsUubf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvWsUubf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784556818; x=1816092818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=puhdLhuRoke0s76W7Rati63RDEwMRchyb4bINHzgH0c=;
  b=OvWsUubfhzS4gbWNfer8TnVQKUJAig0Xi8hcvy7jlyPCkNjTx5k2zuXU
   e0SUCJo6lewE/t/cZZIqGj/eO/qgu1/U7zEauXzTjuA7JAgI9C6a1We9b
   OmVusGvSql6+6BkIctt41io9FLgHa/A/tIcaZcWwYfL48+DSsfS04Npj+
   MWKNEcZvfIHmdL5Ra5l5ldnB4eZevZ/wljyuOIrU8Yiph7MwUMOw75MK6
   bmAGqz+JtBqAothRftfK0IRvln4trC/vbIuqEwdHSAxp5aWehErTXnM5n
   8n3bmp/MUy5W4vhjJxfoVXkO6ewufEDF/6C2OuJ+AAPH10I0NjJcJJgCE
   w==;
X-CSE-ConnectionGUID: ijOPdsJnS2SQvCNrwqg5yA==
X-CSE-MsgGUID: bPDwR4xyQq++Di/Z4YDDlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="102558123"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="102558123"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 07:13:37 -0700
X-CSE-ConnectionGUID: fII0tMQxTeilmKSgVropag==
X-CSE-MsgGUID: kkUF3DriT2S+asnATIwEEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="254063631"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 07:13:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2EE9D121C2B;
	Mon, 20 Jul 2026 17:13:31 +0300 (EEST)
Date: Mon, 20 Jul 2026 17:13:31 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: hans@jjverkuil.nl, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
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
Subject: Re: [PATCH v6 13/16] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <al4tC7BsVWiVBqOg@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
 <20260720084553.GD3679@killaraus.ideasonboard.com>
 <al3hi3-oTj1CCxaD@kekkonen.localdomain>
 <20260720124651.GA9442@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720124651.GA9442@killaraus.ideasonboard.com>

On Mon, Jul 20, 2026 at 03:46:51PM +0300, Laurent Pinchart wrote:
> On Mon, Jul 20, 2026 at 11:51:23AM +0300, Sakari Ailus wrote:
> > On Mon, Jul 20, 2026 at 11:45:53AM +0300, Laurent Pinchart wrote:
> > > On Wed, Jul 01, 2026 at 03:26:30PM +0300, Sakari Ailus wrote:
> > > > Add v4l2_subdev_call_ci_state_active(), and
> > > > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > > > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > > > cannot be called using v4l2_subdev_call_state_active() or
> > > > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > > > state argument.
> > > 
> > > Is there a reason why the state argument can't go first ? This patch
> > > then wouldn't be needed.
> > 
> > The client capabilities are constant as is the sub-device itself (at least
> > in terms of this call) whereas the callback operates on the state, followed
> > by its arguments. That is a more natural order of arguments IMO.
> 
> At the cost of lots of complexity when calling operations. Is it worth
> it ?

There's only a single implementation of the macros whereas the callers are
spread out in the framework and all the drivers. I prefer keeping the API
nice for the drivers and the rest of the framework, and in this case that
does indeed bring some complexity.

I wonder what Hans thinks.

-- 
Sakari Ailus
