Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85EC3C870E
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 08:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820667; cv=none; b=h2EQjc9gJQNqWo/sQGqLo9T7W2GwH9BZhP2SDg7tWEJ4ekU+hg5LVX7z63Cv9aGo6h5a5MFqGGiwEsIw40/eAdGQTUfM54yVgdfye+hwEcl5xklcM/8wQ0ZwTRN7oAZjc6oui4hLyNsCli+zch6r6SVCopLywJP9LlsRVwbM+jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820667; c=relaxed/simple;
	bh=M/mnoZ2ovcWwqI/5BfOqx/x+LKHWlardQrJHJaygrmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvZZ2hI+HBLuMF2PlzcGy3jRq86jDmfBaJiATPQuiKbbYirYvN+MBbYc8xiBppAsmMWkRWtrhDwzCl1+1d640SgQI6UGtstX5NdSugTh4JPbAxOafbMgLX/4rgqizAc0yNkiYMuLuqRe4aW7ujo+ZgfJoXw8YMgAIAbLy1NK1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtpgT9hc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtpgT9hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787820666; x=1819356666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M/mnoZ2ovcWwqI/5BfOqx/x+LKHWlardQrJHJaygrmI=;
  b=OtpgT9hccMIo2ZBLGZbNgUzoMOiytdLyieyZtrSD9G2/tSKTML5DepWB
   sQHXB1crLuL4aksnv6gzeU1fAWbZPI3dT2rrO3OYTLBbebEFZ29WxGRfp
   J/KEVV6m/yaz0Erl+8WzRkzmMHbDmig/86jvKbHUsFWLJMM+Sj83Dcnv0
   KfJIXhaaR6N2MJ8mie58jFbIuxwc15FEaO38d5KBX+D6lbCoYL7FbeOZA
   pdCi9wnFp6cVJJizp8pXGJkF1NxRqEXVdn7xOGkS872rGzPydRLYcUUN0
   ejIrX9SeLso/o3pMjxxtC1nh8OVT6+X2n/+sv7DYean5c2d1hNRo2yCyM
   w==;
X-CSE-ConnectionGUID: TwiiQcshQRaaEOV63r8ECA==
X-CSE-MsgGUID: Xi6PgUJ8RGCz5fsdZL99RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="75856417"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="75856417"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:51:05 -0700
X-CSE-ConnectionGUID: VUv8DdzdSWqaBTOCwiv41w==
X-CSE-MsgGUID: y4ZmisNNRki+5Kc6mN44bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="266514478"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.174])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:51:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DCDA120C1D;
	Thu, 27 Aug 2026 11:51:00 +0300 (EEST)
Date: Thu, 27 Aug 2026 11:50:59 +0300
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
Subject: Re: [PATCH v3 01/29] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <ao_6cyEi6P3R3Z6D@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-2-sakari.ailus@linux.intel.com>
 <CAD++jLkMt3ztAHZta58coseqnjpHxLys1sjcR0fRmtC=-m97hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkMt3ztAHZta58coseqnjpHxLys1sjcR0fRmtC=-m97hA@mail.gmail.com>

Hi Linus,

On Wed, Aug 26, 2026 at 03:18:11PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> (long time no see!)

Indeed!

> 
> thanks for your patch!

And thank you for the review! :-)

> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> 
> > +struct media_bus_fmt_info {
> > +       u32 code;
> 
> Nit: maybe call this .bus_fmt instead?

Good question. The pixel codes are indeed called codes, not formats in this
context, but the struct name contains "fmt" which implies size as well as
other information could be included but there isn't any.

Instead I think I'd call this media_bus_code_info in fact.

> 
> > +       u8 dt;
> > +       u8 bpp;
> > +};
> (...)
> > +       { .code = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12 },
> 
> Some of these are just code + bpp
> 
> > +       { .code = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> 
> and some also have data type (dt)
> 
> So here:
> 
> > +int media_bus_fmt_to_csi2_dt(u32 bus_fmt)
> > +{
> > +       const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> 
> This will find entries as long as we find the bus format .code
> 
> > +       if (!info)
> > +               return -EINVAL;
> 
> and bail out if it doesn't, but:
> 
> > +       /* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type code */
> > +       return info->bpp ? info->dt : -EINVAL;
> 
> 
> As long as it's found, it will return info->dt even for e.g.:
> 
> { .code = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12 },
> 
> this will result in the zero-initialized data type 0x00
> which is (I think) frame start?
> 
> So maybe
> 
> if (!info || !info->dt)
>     return NULL;

The check indeed should be for info->dt, not info->bpp. The FS (frame
start) packet is a short packet and short packets aren't associated with
mbus codes so that's a non-issue.

-- 
Kind regards,

Sakari Ailus
