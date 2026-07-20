Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EAA390CAE
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531871; cv=none; b=ggPlQwF6DBiN5BqBD0OS9RgboGKrScMDkTVSdDWHNsiUza8Ripm3v5z2h8uLvhvKCTSItPW71Dea7fx9D5kVx40SkGng8EP1BlHQ2q27/3nBBAMXMdL3ahL7hOGorneKPC9JJUO1q5FpY4+jskaN1pUP+mmtGDn4zsfTFfeaQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531871; c=relaxed/simple;
	bh=rt6VRX8E8bZyz80/yomDrD8ltDGUsDGqnr6virTcC7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNQ6VqmDl7SdftLfZSlacfmoDdMDzru0ZrebHgZX+bPrzpFBKIXblan4P85cia3ipbnaxf+9VDOqLz/A9nXR/D9igqYqnBAs+Lu8lMVFlaYYbQuG5AVXlFH/8fxxKA5/wMH4G4QCz9JdpM5FNrCsCCV6E7kTAs/qxYz05cs7SEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdosAkhg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdosAkhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784531869; x=1816067869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rt6VRX8E8bZyz80/yomDrD8ltDGUsDGqnr6virTcC7M=;
  b=AdosAkhgRwfLxded9huznY99RNtmmEfolOB5SJ727/Tx/bbvnRSDi1k+
   Olx8x72QVoF5+batA/YFQYKZd6vipl5o8E3W3v/JPP4v0YMkKgADWQeik
   95EmbTx6Ti0p4+dr5fkIAH6UsgCjZgiT380jN/dJbhUFJm7CVwwpuXGO2
   x3YwVGV6c6vjOaDKoOIHTvkQbfeSkUEozsawbYLLPGTDRojHT+V/861ts
   MDVdiN8OG2uLpgY8rkG9rWKgttMDStvewKzJUK+6/iLLUBuCDriV5DMIo
   hxBEDGuVBWNtC/eIfCy75BIoytXu9KL5N37pZSpcJXtD1sPf85WKjswTB
   g==;
X-CSE-ConnectionGUID: 6qN4H8rgThaUDVJ75GbQ1Q==
X-CSE-MsgGUID: N6fZ+S++Q7uNR+yZHzb+Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="88782589"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="88782589"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:17:49 -0700
X-CSE-ConnectionGUID: pb+Dd5RpQUeVTUo4HUEj8Q==
X-CSE-MsgGUID: 5g4tje6ESf+UXzAiNPCPeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="258019838"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:17:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A5CEC121C02;
	Mon, 20 Jul 2026 10:17:45 +0300 (EEST)
Date: Mon, 20 Jul 2026 10:17:45 +0300
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
Subject: Re: [PATCH v6 04/16] media: imx219: The horizontal blanking step is 8
Message-ID: <al3LmaU1AcKw7MGU@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-4-sakari.ailus@linux.intel.com>
 <20260720062836.GB2208631@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720062836.GB2208631@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Jul 20, 2026 at 09:28:36AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review!

> 
> On Wed, Jul 01, 2026 at 03:26:21PM +0300, Sakari Ailus wrote:
> > The step for horizontal blanking on imx219 is 8. Take this into account in
> 
> I'd write "for the LINE_LENGTH register" or something similar here,
> unless the constraint is really on the blanking.

I'll use FRM_LENGTH_A.

> 
> > creating and modifying the horizontal blanking control. The minimum line
> > length in pixels as well as the horizontal blanking values are already
> > divisible by 8.
> > 
> > Fixes: cd5e2fd89923 ("media: i2c: imx219: make HBLANK r/w to allow longer exposures")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
