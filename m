Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9C47044E
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347215; cv=none; b=E+seuq5TBltYKC1jyMllFDl2fUQfZhEWzgOTAbPMwi27q85XzeW/nY88MloUCAe+pGCfUx9PuYHeY8KvLstoLFExCpDWG5z2F+TbRyM7sqJRpJ0HDViAA41JuuboADBL2klvHoKhhCLtgReSGSxbLs7vgeN2XnhcCZw+hwBMceQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347215; c=relaxed/simple;
	bh=dOfcSlElWfLTpZtiRjUPLR+VHMS9mccy8k9Uv3qweYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRNgOTXxpAC/qEBV1QZKebYeybyqrik9bk1bH+pT4mbRSncAlYcmaGFkagOBTJ5XYX0CU0oIL8RpyRBFnHtlKi6uheXW4Eyme5Vg0gMW4dHaQqnV9c6bt50DGQzanctOk4eVW9ncxY6mAgtj0/krqXnBuwfAuycjOo0TPxd12lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC6g/1DB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC6g/1DB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788347214; x=1819883214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dOfcSlElWfLTpZtiRjUPLR+VHMS9mccy8k9Uv3qweYI=;
  b=KC6g/1DBb2p8S4Tu8Tsi5ZvoqBfpRY+zaGt02V3o4BmDmkOhvg5YkmS1
   DH9gNB8sF9er0f7J4rJ70WTkXfSJc2qzJe4ZxjLyzLYuvqnS9LMm3sHmq
   9JNnHrpgcfaA85xsXGr+CXOMXulV1MgtcDObrITDMpu/EtBZr33JnqvYv
   IzGepk1pEmkao71/1Yf7lcao1/x6V+o6tRj3yTDXzDIhQ69OQG68CQoX/
   4GYmKGV7UGFwrCBM/oPWXJr/xhnYmeES6Ncr9qa+W8u5/CPKFGIQ8i7EN
   zsTK2sclxulQhsrYxRaEQ1eTNDnQfbqrNuIEIzq5gTYzOK85EaODuD8QY
   g==;
X-CSE-ConnectionGUID: Sbrw2lUkSjK4z2Xrl5QUFA==
X-CSE-MsgGUID: 9RAs8a29SJKGYUW9q+07JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92622321"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="92622321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:06:54 -0700
X-CSE-ConnectionGUID: pES6FVHcRlSDuUDO0odm4g==
X-CSE-MsgGUID: y391AEXLTTePh+THqEqSOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="268837831"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:06:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D11CA120EB7;
	Wed, 02 Sep 2026 14:06:43 +0300 (EEST)
Date: Wed, 2 Sep 2026 14:06:43 +0300
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
Subject: Re: [PATCH v7 10/14] media: v4l2-subdev: Don't assign set_fmt where
 it's equivalent to get_fmt
Message-ID: <apgDQ0l8U8pgmyh1@kekkonen.localdomain>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-11-sakari.ailus@linux.intel.com>
 <20260810153048.GB3011310@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810153048.GB3011310@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Aug 10, 2026 at 06:30:48PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 07, 2026 at 03:24:05PM +0300, Sakari Ailus wrote:
> > Do not assign the set_fmt() pad op where it is the same as get_fmt(). The
> > get_fmt() pad op is called by the framework now in absence of set_fmt()
> > op.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ak881x.c                | 1 -
> >  drivers/media/i2c/gc0310.c                | 1 -
> 
> You forgot ml86v7667.c. imx678.c has been added since v6 and should also
> be addressed here.

Thanks for spotting this. I'll address it for v8.

> 
> With that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Sakari Ailus
