Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D233ABD95
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536676; cv=none; b=QUAX4LAHA1usJkeMQK3mDUfvbvErqomfgRRTPdJg+8RO8ypN8M2Qw/M3/SlmM6kBbLOoKBA6sJETCDRnBoFP3mTizvJ3RLmmmZu2H+DdZ9+7DtXUuEesXOeFudLp+TOIlaSpeeEGcKJmAnS1hHXxe7Cuk0ujnb5fTi4JOdKKRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536676; c=relaxed/simple;
	bh=VUIdqw0KJpCpS0IA3kfHf53Mwk8BsfoYE42BMLXcIgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFJxcolwJ0/ahZyjaPDm1suKWxlO4JceXj7qjPTWUzBNAl7E/aoo4IFLWef66jyBQhK3s0ewkuSBuXZDDtSFVn5zII3zFepKRKJmrVSSR+Zq4tn4xboqO4xpVkwWNj1Nw+2dyMBQRFSobJryRe4UQFlbZ3mf5sdZdcEj/3iY/VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzDRKqVu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzDRKqVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784536675; x=1816072675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VUIdqw0KJpCpS0IA3kfHf53Mwk8BsfoYE42BMLXcIgY=;
  b=GzDRKqVuACIcC4dPLJScSFNk9kGTb6OiWC1i7BZPB8M33Z7wox8YcXzb
   ZBF6SJCUP6VXpDEYe37uSkZPM4B+fGiLyUF4KrKax461t5+34xNnGcFfN
   mwHVDg78ACc9cccHutJRJYeA2bF3werfbTR4x8XeO1VKsRwEeoUgcoXPf
   m/a8bYHZcY45chUkttstuJyGZ/h/7dTV9k1Fw2vRQNlzs6bLY8D+UDFvC
   WBjqFr11bCntHHroNaaejGVpk1iXrZdb0XlINTk+jitn5qZNU2o1HHAEx
   AayEKgkUcsRmqAkNEZ3rCQviHi/d+Q3XPNp3UhxZ09r9C0e3Q0wnyGJAw
   w==;
X-CSE-ConnectionGUID: yeHvJoigTQiyO4ax16akTg==
X-CSE-MsgGUID: Sk4dU2lxQqKtkPVG1cHmoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84878920"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="84878920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 01:37:54 -0700
X-CSE-ConnectionGUID: pDCPC4AISeGyC7cDtm8dFg==
X-CSE-MsgGUID: rM8JwplkT26AzCSzrBFjNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="253442580"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 01:37:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 33A49121C02;
	Mon, 20 Jul 2026 11:37:51 +0300 (EEST)
Date: Mon, 20 Jul 2026 11:37:51 +0300
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
Message-ID: <al3eX-v6Y2WJDL7_@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-4-sakari.ailus@linux.intel.com>
 <20260720062836.GB2208631@killaraus.ideasonboard.com>
 <al3LmaU1AcKw7MGU@kekkonen.localdomain>
 <20260720083035.GB3679@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720083035.GB3679@killaraus.ideasonboard.com>

On Mon, Jul 20, 2026 at 11:30:35AM +0300, Laurent Pinchart wrote:
> On Mon, Jul 20, 2026 at 10:17:45AM +0300, Sakari Ailus wrote:
> > On Mon, Jul 20, 2026 at 09:28:36AM +0300, Laurent Pinchart wrote:
> > > On Wed, Jul 01, 2026 at 03:26:21PM +0300, Sakari Ailus wrote:
> > > > The step for horizontal blanking on imx219 is 8. Take this into account in
> > > 
> > > I'd write "for the LINE_LENGTH register" or something similar here,
> > > unless the constraint is really on the blanking.
> > 
> > I'll use FRM_LENGTH_A.
> 
> FRM_LENGTH is vertical.

Uh-oh.

-- 
Sakari Ailus
