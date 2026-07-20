Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE72C026C
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537489; cv=none; b=Lmc3N4NAInQabN011+asB5iASEUjlplCth96ThffyHR/EMqIReVnA6uwCwE4Ng7rJlpGkJbv/3sgwEFCUfGLYhORB66ojT6zu+pvQKWvQGVtdulayGIk9I/rCAkqZBe7rNg4Gdrakd33rBQk0TOlvjDEXP/eMofm9jnR20bRLhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537489; c=relaxed/simple;
	bh=/iM2UVkSxBZfA01X6XOKYSmESk3/rCUICO1bh4JgUz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxIqDPrbEj8+SK45Ymuh/J7gjgF4sLLC3wHF7NLf/uP9nsnkGoE8CnuwBNWY4vl1GXPJai6kM0rCoTddYhdHas74VDwoIw5oAMntcbStmuXE9CD0i1LqohIwy7/sBDUXmrI8111XaBt5BBxQiubiwl0RKL/eeG0yXiMonVK+PmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ewxtewm4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ewxtewm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784537488; x=1816073488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/iM2UVkSxBZfA01X6XOKYSmESk3/rCUICO1bh4JgUz4=;
  b=Ewxtewm4bvfaPNwbGOFbnRXXQFQeEGLF9TS6HBmaXS3yQsMvGHzQ8HZB
   uyyuBoK/t8bWeeLIuZz0TnZ0DiW6172zkh3WDEM3NdVEQ5Ck0i2kNsXOd
   SuHnKofbFldzmaZ6rCR3ECoMLzPk9lDya2LJjb0xnmZq2bK7z+d3WVeZQ
   cbCBBTHNoy/yVSZ1Bm2e6FMp0xSpE3hEMJlklwnp0aavPXa5VluJDQJvH
   IaTVAGZoU8bwn9ByjOuLIXIolQs+PRYn7453R2Bgk3MRuhJSKLMhepCt6
   1ZbWiRPJZA8jHFMZ66MEvPpRQHrhuDEh2g/UR3PTWM3TX83OiEDiW3t8o
   A==;
X-CSE-ConnectionGUID: ttVGK6izRT6VnDpynojvxQ==
X-CSE-MsgGUID: te2o6YBKRBuFXmfHMEGQFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84967503"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="84967503"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 01:51:27 -0700
X-CSE-ConnectionGUID: fTS2tQ7USvW+oDqrV/5Sag==
X-CSE-MsgGUID: 0BkUacb2RRmoulvb/FHD9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="261687729"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 01:51:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6BD69121C02;
	Mon, 20 Jul 2026 11:51:23 +0300 (EEST)
Date: Mon, 20 Jul 2026 11:51:23 +0300
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
Subject: Re: [PATCH v6 13/16] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <al3hi3-oTj1CCxaD@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
 <20260720084553.GD3679@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720084553.GD3679@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Jul 20, 2026 at 11:45:53AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Jul 01, 2026 at 03:26:30PM +0300, Sakari Ailus wrote:
> > Add v4l2_subdev_call_ci_state_active(), and
> > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > cannot be called using v4l2_subdev_call_state_active() or
> > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > state argument.
> 
> Is there a reason why the state argument can't go first ? This patch
> then wouldn't be needed.

The client capabilities are constant as is the sub-device itself (at least
in terms of this call) whereas the callback operates on the state, followed
by its arguments. That is a more natural order of arguments IMO.

-- 
Kind regards,

Sakari Ailus
