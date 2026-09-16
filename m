Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F944E05B
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547539; cv=none; b=ZMFnCJ6MiKiA+UYYsPowPwiuNglV1oJ/BCK1stifz3kp1ke08u9nXWNHXQEVwy4Ttd6YwIEkEPgoDHGMS1glNP2HtKQY4Wydy+VBcSOqF3Ob4Zt0Xuh5SGBa2pQQKU9ppeCjbgUN+RlanyULhFZCd3qOHo92RNkf+KtGr4zOijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547539; c=relaxed/simple;
	bh=ckiYq+5awP97X4lYEmoXjd/VJa4ipNZSwkr3NyczJo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlDRu9yJdRaGlfOyVzY6eK7E6ruw+tRJRw3ZUjDg+hm6X+0ys3PX/LcXKldQkC4SmbVho9wfy0BJd0WBQS8UZtClSuQD8lArnWVxiYMZ4guSjm6/J7N5A8hWkdroQqz3e1te2l4+cIqGHqUVE/xI5MdVOpLf1hk6Q728JlNMLUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+Vz2VIS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+Vz2VIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789547538; x=1821083538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ckiYq+5awP97X4lYEmoXjd/VJa4ipNZSwkr3NyczJo8=;
  b=g+Vz2VIS8PkiEw3fj5KdzaYxooHO1L21Q25UpjjB8Z0ohCEtTOaPuGFF
   i2SX3EF5uz6tIKQYqw/hjK9G80N8H4d8QwghHusD0MnnzbZyQCSl2qNzh
   wm257mOFN7URc/IWKmF66+Zhj8E8N/ufEJUJDSRD51SKmWlcoVeDxs5yN
   TzB3vIe29l1q2Jbf0IIbIXlhvGE6dAW5ZVk0odVDgSIXTn8/GuzqjZ0e2
   /M0xDiPN3zKrrkMW2Xo90qyGhntZtzR2hetJ86dmwTrAjJTtJuKbBkf2Q
   5GAMIFh2pg/8tOoqMz3iOSkS2hafSfIp94nSExaXzoK3dox2i2PiNP6Lw
   A==;
X-CSE-ConnectionGUID: g4S7+EBiRpyQxkrUU4bvWQ==
X-CSE-MsgGUID: yTJFGH0OQl6LwGHjeCuJjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100516230"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100516230"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:32:17 -0700
X-CSE-ConnectionGUID: U07BAgtbSBeTjaHq6Lri8g==
X-CSE-MsgGUID: 3tq1aEsLTyK9BjMBAXE2cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296764828"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.126])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:32:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3ED3A11FB00;
	Wed, 16 Sep 2026 11:32:23 +0300 (EEST)
Date: Wed, 16 Sep 2026 11:32:23 +0300
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
Subject: Re: [PATCH v3 29/29] media: j721e-csi2rx: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aqpUFxlGCwNf7jn3@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-30-sakari.ailus@linux.intel.com>
 <CAD++jLk0LTcyBTLMWdA4W7bF2pHwOAmvXZP=Q9QuYB0JJ8+4xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLk0LTcyBTLMWdA4W7bF2pHwOAmvXZP=Q9QuYB0JJ8+4xw@mail.gmail.com>

Hej Linus,

On Fri, Sep 04, 2026 at 10:54:20PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> > preferred over calling the get_frame_desc() pad operation directly.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> (...)
> 
> this is not your code I guess but:
> 
> > -               for (j = 0; j < fd.num_entries; j++) {
> > -                       if (curr_ctx->stream == fd.entry[j].stream) {
> > -                               curr_ctx->vc = fd.entry[j].bus.csi2.vc;
> > -                               curr_ctx->dt = fd.entry[j].bus.csi2.dt;
> > +               for (j = 0; j < fd->num_entries; j++) {
> > +                       if (curr_ctx->stream == fd->entry[j].stream) {
> > +                               curr_ctx->vc = fd->entry[j].bus.csi2.vc;
> > +                               curr_ctx->dt = fd->entry[j].bus.csi2.dt;
> >                                 break;
> >                         }
> >
> >                         /* Return error if no matching stream found */
> > -                       if (j == fd.num_entries)
> > +                       if (j == fd->num_entries)
> 
> for j = 0; j < num_entries; j++ right.
> 
> how would j == fd->num_entries??
> 
> should this be if (j == fd->num_entries - 1)?

I'll move the check out of the loop, that's where I guess it has been
intended to be located.

-- 
Med trevliga hälsningar,

Sakari Ailus
