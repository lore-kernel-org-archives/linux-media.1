Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473363B7751
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532070; cv=none; b=bG2w1F669XwkiQCqUjGmEr1nKBET0Jl6ry0vpnhfxh5YgfSp9w0YafSPQDDoghO7je7bJJda0H1ykCCzW3aCtYP4equatZ4/50cAVdu7stNLldOpCUEn+UntwSJ/UzfYG346JNc7UJMMrSJQrunNfnx0kuNDOlkt7bmL6IwA27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532070; c=relaxed/simple;
	bh=fBTisUKk2GAfPI+EFncb5DfTz1SbVYqBAGOZPEirgis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3wgTGwA5xAxrvlwIIsqa4eDWSesMTLgVJejZlkInYJ8TFmPaZStFeeN2Ej/AGa4UK5PuR2tkcgvgCgijciK1mtOblfj2clvGfubR5Xpv2X94/TDA4mhuJbGYy92ZmE1m00Etrh43i0TneRPDBiWD5tQ2ckRMaYQT5mPtuDMvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHXGpfdg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHXGpfdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784532067; x=1816068067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fBTisUKk2GAfPI+EFncb5DfTz1SbVYqBAGOZPEirgis=;
  b=mHXGpfdgRptWvFH0uSNDZoS4+bHst6ppePilkHypp2SvpIEBnHTpVET8
   lqVf/6kLorHQv/X+SE358MhE8MXmZbxbhcUWjRBUj2tcht6eyq981fd+y
   xRLbZ1UqYMTEj1XXZA+bmyenfqRWJ+PSoL5hgOAazTr5O6nfhXPBBrhti
   zHZLJjq4jQe9USNCEhjKk8+diuFiMz3uvmGjseY+LLzcxz/lZmwnv4YFV
   ZT1kpaDQBz1ZZ8GfurG85V5oRsAip14lAuGK8vYxbLyOf+ioctU2uvMme
   v2UhwfRrP5gNzcp9rQ0KjyFiX94p2NyCy1KHZBdAym2fV0jgHqEDDT90r
   w==;
X-CSE-ConnectionGUID: URle2+/PR+CU/4sU7fLhvw==
X-CSE-MsgGUID: quOUhYRGQo66cXMiSH66dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95756801"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="95756801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:21:00 -0700
X-CSE-ConnectionGUID: 92X0RgbUQF64eWNE+rvUHA==
X-CSE-MsgGUID: Rz3dkx1vTuOpXSWdX+sB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="258020832"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:20:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 96845121C02;
	Mon, 20 Jul 2026 10:20:56 +0300 (EEST)
Date: Mon, 20 Jul 2026 10:20:56 +0300
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
Message-ID: <al3MWLt9yQOAftm0@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-7-sakari.ailus@linux.intel.com>
 <20260720063556.GD2208631@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063556.GD2208631@killaraus.ideasonboard.com>

On Mon, Jul 20, 2026 at 09:35:56AM +0300, Laurent Pinchart wrote:
> On Wed, Jul 01, 2026 at 03:26:24PM +0300, Sakari Ailus wrote:
> > Add struct v4l2_subdev_client_info to hold sub-device client capability
> > bits that used to be stored in the client_caps field of struct
> > v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> > pad operation callbacks for capability information. The main reason why
> > this is a new struct instead of a u64 field is that modifying the callback
> > arguments requires touching almost every sub-device driver and that is
> > desirable to avoid in the future, should more than the client capability bits
> > need to be known to the callbacks.
> > 
> > To be squashed to the previous patch.
> 
> It looks like you forgot to take my review comments from v5 into
> account.

I'll drop that line for v7. I thought I already removed them all but this
one was left.

-- 
Sakari Ailus
