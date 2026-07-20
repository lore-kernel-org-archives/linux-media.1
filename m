Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6E3CF97F
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536762; cv=none; b=e/j53jkYRSrskeapnrITagAQJLwK1ABTlKrgUffHryW+D4IIZusuGxkxkASPnMlOpWcq1sxbuTctdei2eToxKAvcGADsMTSO+d1pDmN+MleSjluKHow9odeFQ+ipPBdpGPDxLMzF+pFU4Ki6302tYqcjHJpt2D0YtfVjmZ/aQww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536762; c=relaxed/simple;
	bh=0KcgAKyDdsNzmOopOnGOv5p/vQnI3AGpZsbsfAXDONQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwUnZPukmPPd4JHJ/z3dfTgYnUivqJ49X7TiLxZU3mSkooZf4UsviS/6t3KPrzeYZrY0Xpznfj7ps+5JFVDNXM+Qwlv5cfB6LOrZ9A5dq4SMZpmgkAG6A68Jhd8oZ/Hud6YATPigK/W8v51OHBqwQeOftxPM15L7gCCIdDNXTNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkXP8uSJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkXP8uSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784536759; x=1816072759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0KcgAKyDdsNzmOopOnGOv5p/vQnI3AGpZsbsfAXDONQ=;
  b=EkXP8uSJF2HAkbM9kPYIwtEYjXHkRTgZLEchUIbDZGXZCyfjL5uZIga5
   1waVHWPe5/0Kk29coDswd79KQiQCMitevFpCT+Oey4xi2LsncUNBGll+A
   saIyH3agGk1ybwQccZaF2FW/0FL1F5BkVClrek5mEDIc7SthghKnq/KSM
   cCaau/Sw8q0VeY5E0vHvfXmzWbAFoBEiZxNMUYrzN480rodbm0i8NTSLe
   ZZMczo87RV1r9sapOsO7/xn+fExxOBPxhGY6cm2wQVW9JM27pK1B/Nais
   +qBIF/eqiLHcSLF22feNdWWPWfLHrV562Zu8JFzqjB9yyYVz+AZZ6OTrY
   Q==;
X-CSE-ConnectionGUID: srk9yfFWQVGkuNAWaXFdNA==
X-CSE-MsgGUID: OMTXfrm6R5GVzfTJmoAqKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84966467"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="84966467"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 01:39:18 -0700
X-CSE-ConnectionGUID: V2qQv81/RbehLaJ9zz7acA==
X-CSE-MsgGUID: +2bp/jNrS7OfSXHMr7+nyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="261684321"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 01:39:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9F275121C02;
	Mon, 20 Jul 2026 11:39:13 +0300 (EEST)
Date: Mon, 20 Jul 2026 11:39:13 +0300
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
Subject: Re: [PATCH v6 07/16] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <al3esWGRI4js12H7@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-7-sakari.ailus@linux.intel.com>
 <20260720063556.GD2208631@killaraus.ideasonboard.com>
 <al3MWLt9yQOAftm0@kekkonen.localdomain>
 <20260720083153.GC3679@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720083153.GC3679@killaraus.ideasonboard.com>

On Mon, Jul 20, 2026 at 11:31:53AM +0300, Laurent Pinchart wrote:
> On Mon, Jul 20, 2026 at 10:20:56AM +0300, Sakari Ailus wrote:
> > On Mon, Jul 20, 2026 at 09:35:56AM +0300, Laurent Pinchart wrote:
> > > On Wed, Jul 01, 2026 at 03:26:24PM +0300, Sakari Ailus wrote:
> > > > Add struct v4l2_subdev_client_info to hold sub-device client capability
> > > > bits that used to be stored in the client_caps field of struct
> > > > v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> > > > pad operation callbacks for capability information. The main reason why
> > > > this is a new struct instead of a u64 field is that modifying the callback
> > > > arguments requires touching almost every sub-device driver and that is
> > > > desirable to avoid in the future, should more than the client capability bits
> > > > need to be known to the callbacks.
> > > > 
> > > > To be squashed to the previous patch.
> > > 
> > > It looks like you forgot to take my review comments from v5 into
> > > account.
> > 
> > I'll drop that line for v7. I thought I already removed them all but this
> > one was left.
> 
> There was also at least one other comment you agreed with in v5.

Indeed. Thanks for pointing that out! I'll fix that for v7.

-- 
Sakari Ailus
