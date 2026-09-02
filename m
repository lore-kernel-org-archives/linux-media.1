Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2252D472533
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348215; cv=none; b=OkfgIkDOaHkFo55hRxv/CN8zlvo0NPA+cJi/TCEiX/K9BhE3riJkhFV+0iSv7qQgSDE1ZjZHgNeYdENLB4fUFE/jO0l/cMvyiKRr2BZP0XUoeMZfI7uClz8wIurDQnAuj7yr5NQHfjNbzej0PESTEO1NkW1zaUJiPYVWGhVGVEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348215; c=relaxed/simple;
	bh=JJUz4BeUAzr8UNyrwDSiEXr4rjtAi1f3qQAq9SfRIaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVgtMBuLKwxdxJtwvagLQf+7zgjnWvPtggM9LGFPgdRtoQhz0oHihPguHA9R+tQmi4AxwBSf8e/EXLuUgHKVBDNyAPaGDSPuPkxDHvs9+5qyYVpV76D7NpAil16IoPEqMygNmTiXJH3aPYoNGOxpMoxF/8DidCcSBKVRYjiBbls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgyfmAWn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgyfmAWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788348212; x=1819884212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JJUz4BeUAzr8UNyrwDSiEXr4rjtAi1f3qQAq9SfRIaM=;
  b=CgyfmAWntZuN1e9p8zTEXpQDhdBT7QcVY+UzorzXLUXdyPld7dVnuK4x
   4BtZKYoNK0opbl7NI7026uYG7kSed498amxpc34Phz18FLZpY0Z6+zceX
   kK3japbL24I48XXq/K1NJG0dgN/iIatbN4lxIaQYTMP+eJi7RAhTc6IsU
   I9J2F9PocYW2cZjEKhmK68fYXx+dLnv0bXSAJgC5uq5MZEaJ9ba9GiL4Z
   Kx9mTZoF8rJoseFdHikS/Gz48DQOsPJy1KoWX+em8WH55BZesLmSh/gw5
   UwsKZvQIstgUys5h0icxvKBW4ceTCmKc4x1Bi1OZuk0ggMiM8rN/CQoMz
   A==;
X-CSE-ConnectionGUID: RN+zqej4Ti6bLpTqpff/PA==
X-CSE-MsgGUID: 62WFICUITK+0Nx36K9Q60A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99964902"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99964902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:23:29 -0700
X-CSE-ConnectionGUID: DxkxAHPvQwO6xWNeCjXI2Q==
X-CSE-MsgGUID: 9bghd57fQDCFZm3U19P7bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="273554644"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:23:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DA065120EB7;
	Wed, 02 Sep 2026 14:23:23 +0300 (EEST)
Date: Wed, 2 Sep 2026 14:23:23 +0300
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
Subject: Re: [PATCH v3 04/29] media: v4l2-subdev: Allow releasing frame
 descriptors on return
Message-ID: <apgHK67IeGCl_wTT@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-5-sakari.ailus@linux.intel.com>
 <CAD++jLm5FLD9DHzuThWZJRKi6_wj28_UUFqSbmpt1cO--tCyOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm5FLD9DHzuThWZJRKi6_wj28_UUFqSbmpt1cO--tCyOA@mail.gmail.com>

Hej Linus,

Tack för dina kommentarer!

On Mon, Aug 31, 2026 at 02:54:29PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> thanks for your patch!

Var så god!

> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > Use DEFINE_FREE() to allow using __free() to release frame descriptors
> > using v4l2_subdev_free_frame_desc().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Clever with guards, I like it!
> 
> Should #include <linux/cleanup.h> be in this patch? I think I saw
> it in some other patch, or was it there already?

Hmm. It's there but added by the previous patch. I'll move it here.

> 
> 
> > @@ -1798,6 +1798,11 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >   * for each frame descriptor obtained by calling this function using
> >   * v4l2_subdev_free_frame_desc().
> >   *
> > + * Use __free() to release the frame descriptor automatically::
> > + *
> > + *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
> > + *            v4l2_subdev_get_frame_desc(sd, pad, desc);
> 
> the third argument to v4l2_subdev_get_frame_desc() from patch 3
> is "type" , the desc is what you return right?

Oops, indeed. I'll fix this for v4.

> 
> +/- these nitpicks (the code looks right):
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Tack, tack!

-- 
Med trevliga hälsningar,

Sakari Ailus
