Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2C48E0D0
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945007; cv=none; b=sfCq27KL2p3rP5xcdX8PtCOuzsEQvrGTUAV8OfFFF1JssAJNC5nhi3FnQVOJ5S0fQTy9QOCMjGcr/ckP/bfgTjI5aQzzwqk1OVBLB0WU2E4x68ExwRVJPlpGCYfp+1FHuStpUxQfUr/H4AhkJvgHyO3ffc2xWCtVcSHZc9Ws4PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945007; c=relaxed/simple;
	bh=u8IG4pq1mx9iBZOFfHBM0X5LhpZxYOw5bLHEX6g7zWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDABmLtQf3CNN2W2M2itD0cIZqCZip+B6+CJfabBjG35+m7ph7+XN1Rkp23OSD/5VTG8IiLmIhwkeaV2r5EPOpwoi65p+Wh8rnMGTIIiRE2y56LMkIbQsUk/00syOhCFf+69gw5Q61uR1TDmvb03nGB9MLxaXle/LE4N/lgmO/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2X4AeqT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2X4AeqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945006; x=1820481006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u8IG4pq1mx9iBZOFfHBM0X5LhpZxYOw5bLHEX6g7zWQ=;
  b=i2X4AeqTz9zfk71RODnQqy7Vm1nXQjgnKFC+F6M9TcISx+Uob+VTd5Ei
   1PdkpFL45Iol08xVeqH1Om5polCfnq/DpHzaJWoGd4ImBzVCFxR3i6RDd
   X0C1mqd/yERHIR8xBTvpxtIF4uPyUHSJKJryq2mdWYvyUhx9PnwrY3IVM
   4pq0hFd5nKOVgSBNwHuqmsgUQh+Sk1l9JFo088Xpeabj/3mO16R/B6K6D
   d0d3hgUNMsqeSs0ZfzsYzwByUlr7qKva/j8uqXRyrA5cWoywv8oFE9wF8
   QPx2/Ho5QjYe17Q5TPwrQ2G9CLQ+YFPO7N7+bNtA2BjSADLNwQo7MbRGp
   g==;
X-CSE-ConnectionGUID: UbTFiEKiS7K92jf61QXouQ==
X-CSE-MsgGUID: mKwDRwb1Quig5j8Eu/JwTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89394314"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89394314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:05 -0700
X-CSE-ConnectionGUID: cTfdIgyCS6uzrpZ75XmwIA==
X-CSE-MsgGUID: UlQ8kwj7QpifzAlkQFUFcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="271754350"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D7B38121BD2;
	Wed, 09 Sep 2026 12:10:04 +0300 (EEST)
Date: Wed, 9 Sep 2026 12:10:04 +0300
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
Subject: Re: [PATCH v3 15/29] media: v4l2-subdev: Return dynamically
 allocated pass-through routes
Message-ID: <aqEibCCTjtQuSpMo@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-16-sakari.ailus@linux.intel.com>
 <CAD++jLnQzEoo46orVAHtoTDxXmQqsVkD1B55GUuua6drePZUbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnQzEoo46orVAHtoTDxXmQqsVkD1B55GUuua6drePZUbQ@mail.gmail.com>

Hej Linus,

On Wed, Sep 02, 2026 at 07:44:32AM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:15 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Count the number of pass-through routes, allocate memory and then return
> > the full table to the caller.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> (...)
> > +       if (num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> > +               fd->entry = kzalloc_objs(*fd->entry, num_entries, GFP_KERNEL);
> 
> So if it's more entries than the preallocated ones we kzalloc_ new ones.
> 
> And from this point in the code we want to clean up:
> 
> > +                                       goto err_free;
> (...)
> > +err_free:
> > +       kfree(fd->entry);
> 
> But what happens if the preallocated descs are enough?
> 
> Then you just kfree():ed the preallocated entries, which are
> stored in the same pointer.

Oops. I'll fix that for v4.

-- 
Med trevliga hälsningar,

Sakari Ailus
