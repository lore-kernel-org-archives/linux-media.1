Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE81A9F88
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231325; cv=none; b=p5x4VwY4Jtczvz3J89CLXHNcfuoZ6iYOk++ePwX+2Jr3ns8lexZUv+jJMdSdgQWORoXdJihPOjGKPLrsL1lxHNRz373WKvFw4u6ki2AkwMaEHVOgXBdmAaw5xnqZmXQomGjEde9n3/Nwfd6Kz4NqClq6pS4evDjuBPJy5+bnZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231325; c=relaxed/simple;
	bh=0FxqRp1F9QbfsplmVUzLRBvi1576SWCo+ZZOlQt8HLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMUamIQWkTM5QgRCPQPM763XirU2XJm2+6gSm0wFibwGMTBLQNIipQtFZSjVHNAN0AJVtE5TXDTXV2Bg+XV/JEFacnqZWyyQDjY758mY9sM48WawLGyTqf7xAuHfb4/jxjZFFsYzb0fFdB9gTs65VvUSgf9eHlGQrzRuE3p0O6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bo7/qFA8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bo7/qFA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771231323; x=1802767323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FxqRp1F9QbfsplmVUzLRBvi1576SWCo+ZZOlQt8HLc=;
  b=bo7/qFA8fFTZSELtP2ekTUu0Pnre8AoCV1UeWWbf7O/ei3B4wWYz/Am8
   BoqPKavwGFFRq/d/j/4nd5UluKtn5bFqtgxx1QBE9uUQnrYhN+SduSnoz
   wCAFju98LbXXDbXDy7Bfnz2BC1gGm4zmr0hKsRHsDR/6UjT5ue0n8LBVi
   18ZdJDsEO1hZjjsLS14x29yGmNB/Bp5mhI2hbrSf7apZe+IEywkm6pyET
   +NUXX5NNAaIk5gvrl58M/EifivvEQcAtGyH9crevr7fSvbbzmWDIsNP4h
   u+dy8SqMisi1iTX8ktxOpblrXMI8L1jPjzuAYNDxAMPtJGH91wziAxdha
   w==;
X-CSE-ConnectionGUID: afVOW1+jRMG4r2rMYmY1Gg==
X-CSE-MsgGUID: VccMoL6kSm+K+dQlyMPRhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="82942809"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="82942809"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 00:42:03 -0800
X-CSE-ConnectionGUID: 3dSSXfH9QeC7NASuD9h8Mg==
X-CSE-MsgGUID: PQihlRzESZWer7sK0rpV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218511982"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.203])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 00:41:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A1D24121D2E;
	Mon, 16 Feb 2026 10:42:17 +0200 (EET)
Date: Mon, 16 Feb 2026 10:42:17 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 03/14] media: Documentation: Improve LINK_FREQ
 documentation
Message-ID: <aZLYaU1x_nQj_8X0@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-4-sakari.ailus@linux.intel.com>
 <37eb7fd4-4a1d-493b-ae85-ded0bc6650f9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37eb7fd4-4a1d-493b-ae85-ded0bc6650f9@nxp.com>

Hi Mirela,

Thank you for the review.

On Sun, Feb 15, 2026 at 04:37:22PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > Add a reference to the LINK_FREQ control and precise the meaning of the
> 
> Precise is not a verb, maybe use clarify instead.

I'll use that for v3.

> 
> Other than that,
> 
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thanks!

-- 
Kind regards,

Sakari Ailus
