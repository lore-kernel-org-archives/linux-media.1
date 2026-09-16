Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244E245C6F6
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546361; cv=none; b=hbR6RyKYqxg7WgPVTAA10tJ5bOMa92ep3KvSNvEDdyDNkDj2crEBviIvStv0Y/OLfvN32XbicajfdvfLq9bs169owRLeUcx5D79dNsT9tBqcaumTDHnwSN7gCoJZRwG4no3jbM1IsOhvxbQjqySCGe8UNSAZyflKRuhHmBItYZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546361; c=relaxed/simple;
	bh=hui0ueTaxrEdSXkOKPlvRtqvdI+W20eeRGPAkV+K2bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEb2hDPWW73l2V3Akzj/QsDKaKWkgacS5umlk5uZu9vHayE25Vp9iyOMcNhnktMxdc8ZM90SWUizuhPBgSPzhAqqgO7NhE/sqMphMlWoRreMMBlV1PpNKN3acNnTXCcvdiXyGpZQPD7csLtShRmy60Mh+To9VTBe+TxOOm2/huo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdqN8A3W; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdqN8A3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789546350; x=1821082350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hui0ueTaxrEdSXkOKPlvRtqvdI+W20eeRGPAkV+K2bw=;
  b=AdqN8A3WJMx0QJB80PwMmIkqOst2mFzv5hexVeHUMjQUe/itEu6fubHg
   /R78veEFH83xHvqit3Sgh0PoeiHlWeVSsjPmh6EXw9e6ikJAQkMfTC4dy
   fqP7lC0HYHv2uo5Nz+FISOMuYRgxX14SnU7JmCbOWZ5OOxrxpzot9xzrD
   J7ISdfRbhgoed6GAr+oqMJm88tyHjkD6Uq/xSVGl3Do6g5RyKe2hMC50m
   /5HRUbWiRjzLVwk6X+jwt8U5W2U4xyJKmIqcX0nvjIW9PqCcBnZ0SWyR0
   TsLz5lRotvJm5y2v8SZrtNuzSCioNFH8dKQnEMk+2jSPM1m1JN7AmmPS5
   g==;
X-CSE-ConnectionGUID: KieDk2a+TUywBhR0KWTCTw==
X-CSE-MsgGUID: K2RZfFwwScmgpF0g/8w58g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="426592"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="426592"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:12:24 -0700
X-CSE-ConnectionGUID: u8eB05XRR3u3bD71v1RExw==
X-CSE-MsgGUID: 84dw4764SFihEBdxzln/cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275227680"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.126])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:12:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0EF0C11FB00;
	Wed, 16 Sep 2026 11:12:31 +0300 (EEST)
Date: Wed, 16 Sep 2026 11:12:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 27/29] media: cdns-csi2rc: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aqpPbgRrBqWgC59X@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-28-sakari.ailus@linux.intel.com>
 <CAD++jLmAjEvpF8qmgHQuPaYMzXBhu8Bx8+GE0ZoVzdyNtzT81Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmAjEvpF8qmgHQuPaYMzXBhu8Bx8+GE0ZoVzdyNtzT81Q@mail.gmail.com>

Hej Linus,

On Fri, Sep 04, 2026 at 10:27:52PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> On Mon, Aug 24, 2026 at 2:15 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> > preferred over calling the get_frame_desc() pad operation directly.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> I have a feeling this might be fixing some corner cases in earlier
> patches, but we can't squash everything and it's anyway the end
> result that counts, so:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thank you.

I'll move this before the driver patches switching to
v4l2_subdev_get_frame_desc().

-- 
Med trevliga hälsningar,

Sakari Ailus
