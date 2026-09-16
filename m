Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE744AB99
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 08:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546936; cv=none; b=jlZy4xXaA68t5d2HX7vVK01Fk46+FzfKekTn5+Gs3k8zwFU+Q71PRaUzATqheEPdHPByoQg2ntxLM+ySBLlyIx6gxbbI+f+tOUwHmlSLMQ+oEneRrGytcFEewt2g6lcoqDpdymeWZ77stjvDh0OrIHxAeqYCINC4fe0lOisGHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546936; c=relaxed/simple;
	bh=E7MPsoFwmZV1udINAxDCpS1bHnQxHVp9/EMlXY9iCaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmABQaVEzI66XG89p/p/PUeTXXP4NiBb9xch6MXiCq+Zn/6DuVmn1f/sTUu4jFGTYVPC4EGuo02d+FfyX+KHsxJmYux2ryV3TrkFRi5Ly5gdm2NMRs3gPdwet6plDk3qT9UgN6wwZ6lH4RSHfHPQy3H4594wxtFQ07jzZ5knTmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vk84rd7w; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vk84rd7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789546925; x=1821082925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=E7MPsoFwmZV1udINAxDCpS1bHnQxHVp9/EMlXY9iCaQ=;
  b=Vk84rd7w7M/ISVftf9zce8qmZZvJOlJdokHVJ5mBjn0iXgCTBCqEkdZp
   AStWprYvJWEdfatqewoivAc32mO2wOvFQA9dJlU0t9xzrIgYlujAf03hM
   e924vKFfR6XPKRhgnzbuv86pDXIfa8RFv6va0ctgtvzJg4u3siC0AL4bQ
   UaLM2u7+Y6/PfnolUPr5vhWFXZdgXzmuIvk1+84MRDYPRX/inx6akDAw/
   lKvCc31S4kcCwbyDwyXOpHkl9fWkQByosB8Flfid3MW2XJZp64Mm5xA6z
   q3Vd1bl/i9WaOh7gOR7bURJczyVp1c2/eDeayKAPS755N2tO6hiD73vqt
   Q==;
X-CSE-ConnectionGUID: TlEKjOAzQ72AcFkIwfH+Zg==
X-CSE-MsgGUID: Kpq8i5xYSB6fMNIJtXcMLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89963174"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89963174"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:22:02 -0700
X-CSE-ConnectionGUID: ecSSLTlYQCaRiCut7tW1kQ==
X-CSE-MsgGUID: 6qws6K47Tg+jmzNpmbboRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273236854"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.126])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:21:59 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5D67911FB00;
	Wed, 16 Sep 2026 11:22:07 +0300 (EEST)
Date: Wed, 16 Sep 2026 11:22:07 +0300
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
Subject: Re: [PATCH v3 28/29] media: v4l2-subdev: Use
 v4l2_subdev_get_frame_desc() for passthrough
Message-ID: <aqpRr9WEJe6xVMHM@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
 <CAD++jL=8jN+JoDue=0+R_EvwoPSpxOsa1RN9HYHWP7+AZ5X3wA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=8jN+JoDue=0+R_EvwoPSpxOsa1RN9HYHWP7+AZ5X3wA@mail.gmail.com>

Hej Linus,

On Fri, Sep 04, 2026 at 10:38:00PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> On Mon, Aug 24, 2026 at 2:15 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor in
> > __v4l2_subdev_get_frame_desc_passthrough(). This is preferred over calling
> > the get_frame_desc() pad operation directly.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> (...)
> 
> this caught my eye:
> 
> > @@ -2558,6 +2558,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >                                              unsigned int pad,
> >                                              struct v4l2_mbus_frame_desc *fd)
> >  {
> > +       struct v4l2_mbus_frame_desc *source_fd = NULL;
> (...)
> > +                               if (IS_ERR(source_fd)) {
> > +                                       ret = PTR_ERR(source_fd);
> >                                         dev_err(dev,
> >                                                 "Failed to get frame desc from remote subdev %s\n",
> >                                                 remote_sd->name);
> >                                         goto err_free;
> (...)
> >  err_free:
> > +       v4l2_subdev_free_frame_desc(source_fd);
> 
> Here you end up passing a source_fd that contains an error pointer
> to v4l2_subdev_free_frame_desc() and that seems wrong.
> 
> Maybe a separate label err_nofree: right below that statement
> could be better for this error path?

Yes, makes sense. I'll do that for v4.

-- 
Med trevliga hälsningar,

Sakari Ailus
