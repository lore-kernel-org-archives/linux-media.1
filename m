Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0230F92E
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943149; cv=none; b=AX6wB13S2kpfBL5DQ/cmYYVD+FDHBVpFTMkA6ABt4YC+JMHB8MQ7PoZWPDYAyTj/US4Sa72Xe+V+PbISZtiwRw5gSo9K08GiZ/nkx7XqDVhIM5qD6YnFZ5xC+AghAr1XuRt9rpOvZ1ur0f1wfYNt5zvgudtgtB7+ZqaUlLTUe9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943149; c=relaxed/simple;
	bh=n4C9Lz9RgX/HVlVXZpkegKMSFUQdxtXmEjcrp7kwOzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBuO7iYy6EUx0QRKNP0HGX2Y7wgkCcSTHRpXCu0a3Cd4oiDDZPFqXjkvT/gq18VkAKNFambF40odURQPDNaBd5NTOiL606B8soRO2zKbAYEmbDlmQGHDscf/61YDD0Oq4xpD7V78OdXKA168M62Po676yX/IqFn8RkWm9VatLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhd54a9X; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhd54a9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788943146; x=1820479146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=n4C9Lz9RgX/HVlVXZpkegKMSFUQdxtXmEjcrp7kwOzE=;
  b=dhd54a9Xr5dcMYnYUV9MWEoNMnYFhRCIBq+PWPDaXcLcqUkJGr16y3WY
   CW2o9IQsUNk0nfift3fGEGeW29KlOB99BKCDahi50liDMWYZYf7QLD+eS
   +fjivyuIaLzi86rwIUPlxzFG2IbCKc9PILfNotwqvNsYShstUWESloYLx
   eqAtmsk4nUm6rEUnsEI487jvmVxbuAMXKfy8jmFBJe/90jSBSKZOZW3X5
   u3522d3xZgDPG5T5tbHvXFQ4SjueCquwNaKuYaTIMV0cny1LRa/ZCORwk
   hKgDKhJMGKg8oqPAVjC6S46N0qcIHKCunSDQIIxV2CTnbhplIX5odTVMA
   g==;
X-CSE-ConnectionGUID: pFYuRJ+UQbCEvpCAFuX2Ow==
X-CSE-MsgGUID: tRXidHnUTye9AhgrvghDHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89391824"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89391824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:39:06 -0700
X-CSE-ConnectionGUID: QidlcA0/Qj+It6vRgQIBSg==
X-CSE-MsgGUID: sHjb6tc8T/G5Zz4db96yHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="296187857"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:39:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 39BEA121BD2;
	Wed, 09 Sep 2026 11:39:06 +0300 (EEST)
Date: Wed, 9 Sep 2026 11:39:06 +0300
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
Subject: Re: [PATCH v3 13/29] media: cdn-csi2rc: media: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <aqEbKrGY2vCK3iB8@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-14-sakari.ailus@linux.intel.com>
 <CAD++jLksx58CCswrGMOerNzKcF_uYgrH2Ykvi3YY8wqV5S6J5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLksx58CCswrGMOerNzKcF_uYgrH2Ykvi3YY8wqV5S6J5Q@mail.gmail.com>

Hej Linus,

On Tue, Sep 01, 2026 at 11:43:38PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!
> 
> Subject has media twice, is that intentional?

No, it isn't. I'll drop it.

> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to allow
> > compatibility with drivers that do not implement get_frame_desc() pad op.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> (...)
> > -       .get_frame_desc         = v4l2_subdev_get_frame_desc_passthrough,
> > +       .get_frame_desc         = v4l2_subdev_get_frame_desc_passthrough_csi2,
> 
> This looks right, but elsewhere in this driver we have this:
> 
> static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
>                                              struct v4l2_mbus_frame_desc *fd)
> {
>         struct media_pad *remote_pad;
> 
>         remote_pad =
> media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
>         if (IS_ERR(remote_pad)) {
>                 dev_err(csi2rx->dev, "No remote pad found for sink\n");
>                 return PTR_ERR(remote_pad);
>         }
> 
>         return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
>                                 remote_pad->index, fd);
> }
> 
> Is it really all right for this helper to still call get_frame_desc() through
> v4l2_subdev_call() like this, or should it rather call
> v4l2_subdev_get_frame_desc() in some way?

There's a patch later on in the series changing that. I guess I could
squash driver specific patches into one, right now they're separate.

> 
> (maybe this is fixed elsewhere in the series, I'm admittedly
> a bit unfamiliar with the code...)
> 
> Yours,
> Linus Walleij

-- 
Med trevliga hälsningar,

Sakari Ailus
