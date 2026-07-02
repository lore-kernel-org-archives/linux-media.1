Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB939417347
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003852; cv=none; b=hhAJgHf4v69LMU0y/qPK3AcRya1lc2Vgl4ruS9MmLtlye9RrGWBYnyjZOiQ2OzhI6myx1K8oiTyZk9/jxUovFuOGNdqkifCc0Ict4VqxTv56cfQYQ2OFTDH8xxYM1DXCDWYz5ZyQatwQI98S6oIoT9uMXKh0c0/aSbP1i5JxlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003852; c=relaxed/simple;
	bh=1szzfv1Ehyjshb1UlCvGEA9/05/SG6IWot0GvBtVDjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5gaRKZmdx/tbp+KXJReRKx0l14nf9IzTf68rB9YrM3laK/sK2m71gq7RX0niKJ51xfFIgzLok5omNExTyonk5J6S7pY/dnwtRqCWEg7MhIMAeFqvPycLFTuJYoAuk8/IU8NwkwJH3aIJ0yVR9mZvgRPYZwMhZezrfaCgSfjZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BERgFGmG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BERgFGmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783003851; x=1814539851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1szzfv1Ehyjshb1UlCvGEA9/05/SG6IWot0GvBtVDjg=;
  b=BERgFGmGEdHTsk6BCZ3tp+55K6R7AV2zcg2byIuPKCucm2soLUCVhzFc
   Dc/Y+SbMndxi2wJ40FjJRJkmJATgQTrtMCeEkAjppB1j5BloySeXCaCqD
   wd0qWj63Atn1PWO/WO9+RA4CEJVvHTPpdP9zhgxAlfVss5vfOu4zglkLq
   y4/NPASEJDL0YHi8mdtyhegAAnmOQCIToiEJVB7yNB2CSBn2FCbBP30df
   nSI5nzwDr7qH1j8CF3C46FjYjE9RrtFhBrOzc+44/Gxif/RUE7kcJX0XN
   HNkXteIxh3O5+3Fym6WJb7jXGiX3zDmfKNeVuXkVa7CYfJpOs9iFCfjtQ
   A==;
X-CSE-ConnectionGUID: +8YswX06SgKkCX0a2iaxqw==
X-CSE-MsgGUID: dZvgOFPrSLintf56wAMcRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87674240"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="87674240"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:50:50 -0700
X-CSE-ConnectionGUID: BimGioZORFCiRF9I4bC5SA==
X-CSE-MsgGUID: VB+tqOXWTNS3h6ld1+ghag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="246516489"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.229])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:50:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0E108121C2C;
	Thu, 02 Jul 2026 17:50:41 +0300 (EEST)
Date: Thu, 2 Jul 2026 17:50:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
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
	" Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 64/86] media: imx219: Support LINE_LENGTH_PIXELS and
 FRAME_LENGTH_LINES controls
Message-ID: <akZ6wIs9Gs2ZwTfz@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-65-sakari.ailus@linux.intel.com>
 <177929515968.2341049.14051787779723537851@selene>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177929515968.2341049.14051787779723537851@selene>

Hi Jai,

> > +/* Do not copy this function to other drivers, make it generic instead. */
> > +static int imx219_fll_llp_set(struct imx219 *imx219,
> > +                             const struct v4l2_mbus_framefmt *format,
> > +                             struct v4l2_ctrl *src)
> 
> Could this now use v4l2_subdev_sensor_fll_llp_set() that you have added in
> a previous patch in this series?

Indeed. I wrote that but forgot to remove this one.

I'll also move it to v4l2-common, it's a better fit than v4l2-mc.

-- 
Regards,

Sakari Ailus
