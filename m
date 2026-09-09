Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094C37F006
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945122; cv=none; b=Hnhd7W4gJSvUGY0T2pGMBLukvAw4RKaBLt8XJ+NxZBrvOFUaPPevVcImgr9goIKvySrY/2OJ5iSX3mUBkm1H37AY6ye1NT00+rBgUVjTAOy8Lj67NRoId522gp/YOP7n7M7e1aiSPx5Ajk45s4Yeot6VPyLHbYhdoNDQeE1Wns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945122; c=relaxed/simple;
	bh=k5uHIQrSOso3XXwHK58dxSIL6RlIKFzUzVQTGvlj/Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7d2zUEnIS4nGgMJqW0XOuAccxpqywhtpIlXrNkYOmA/knZZkLYwxxRIbCUO4G4XOn64sz0Y8ysSwk2jTHPvBdIvZzSIphgv79pNbgu1ZcuXwQ5vxQ8VK3j+xJ67xSZyUfxnBPw0xs01ZSi2AEeKwRlmtKF5SoZ3ErhnuOBTAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgVZ61ah; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgVZ61ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945121; x=1820481121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k5uHIQrSOso3XXwHK58dxSIL6RlIKFzUzVQTGvlj/Vg=;
  b=YgVZ61ahkebef7+6Avj/cd6vd+ZmlMXP7T6I014icuqa2LPAO8CIS92a
   rJUdYRzzCjuuVtO9ND8Qi71Tp6avkB7CxBsEdhhaRBAw71MiUlAtkLfXc
   wG8mFjEhAtuaNo7T4i+g05f9JmoBcZXltyDDu31UIaLxa0YKyLARVwhvM
   oT5GiMW5F2i7xDga0oIH5RX5mijMmc0vCoiPPjY7AGr7JTxcgoKOTtftm
   hSzYPOincDouG1DAIz/GEkabTOlLN8jxCTAFe0KMZwXzwvNn0cuWlIK2z
   24h35blhVaVZOoDEnCQXPf/gitrvk4/P8iCLX+yX++x/97GTvnpyb4uSM
   A==;
X-CSE-ConnectionGUID: G67RKlTgSkuSZy1Fy7Bp5A==
X-CSE-MsgGUID: hdViOO9rRCu99POTaXEWWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89201087"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89201087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:12:01 -0700
X-CSE-ConnectionGUID: neqcAZH9Q0i+I2epGA1rtQ==
X-CSE-MsgGUID: f5bMYb1RToSJZ7LzKAwtzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266975314"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:11:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 313F5121BD2;
	Wed, 09 Sep 2026 12:12:01 +0300 (EEST)
Date: Wed, 9 Sep 2026 12:12:01 +0300
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
Message-ID: <aqEi4X52QSb15xnP@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-16-sakari.ailus@linux.intel.com>
 <CAD++jLnQzEoo46orVAHtoTDxXmQqsVkD1B55GUuua6drePZUbQ@mail.gmail.com>
 <CAD++jLkaN01pneNKjhd5mxCqBJ3n8fYM7oYBwt_Ci94kM=3P4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkaN01pneNKjhd5mxCqBJ3n8fYM7oYBwt_Ci94kM=3P4A@mail.gmail.com>

On Wed, Sep 02, 2026 at 11:34:19AM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> one more thing!
> 
> On Wed, Sep 2, 2026 at 7:44 AM Linus Walleij <linusw@kernel.org> wrote:
> 
> > > +       if (num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> > > +               fd->entry = kzalloc_objs(*fd->entry, num_entries, GFP_KERNEL);
> >
> > So if it's more entries than the preallocated ones we kzalloc_ new ones.
> 
> If we do allocate some more dynamic descriptors here, and do not
> free them at err_free, where are they actually kfree():ed?
> 
> I just can't follow that part, maybe I'm just missing details in the
> other parts of the patch series.

The caller is responsible for releasing them, as documented for
v4l2_subdev_get_frame_desc().

-- 
Sakari Ailus
