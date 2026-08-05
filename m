Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E59471246
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936911; cv=none; b=tDDig/0PYdCy68zLrN3oKty5ZnCfuie506JsY34b4qbrBukwKuPm3R+5ZquurlI/FdclEX9JjaTUZuW7hbzEMzabErVz5g2/QMNR+xFoLeSeXaLtH1odriHT7aaSuavkO8t0JAvBzbZ9N8Bo+xLxMGXCCparAUvKIM94EYiMJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936911; c=relaxed/simple;
	bh=EhKuObL+o6KCsRDeLOBlSNI4kaYOrMAZ2zzfcMz7fYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xkv5Xlq6zj+6RQf4lzHBGUFeX/uwUW5SMFDx9FoRtfDBm4xzTKu5QKMYRa21o891O494GYJvX5VMSzOI7aJI3AzdAAbfpxfehzluPAQu3fwaiXFtc38vPGtiAPDW7+NcwGBZ8uhj7ueEWIQCO6ERqgtIsCM4FaAx6il0G9R4Lkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gW2/Ggzn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gW2/Ggzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785936909; x=1817472909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EhKuObL+o6KCsRDeLOBlSNI4kaYOrMAZ2zzfcMz7fYs=;
  b=gW2/GgznIaHey2PJWoZYMGAuhx7whxKwR4kJp0F6immIXn8sx3lll2e8
   XeBZbYnxzaqwADIsMmFoE1Aimw2jsoAhRVoUg8tNF0iiQZfK+sRAM7fjl
   L0iHj/JCva3rqVFseJZuKO+gDoG0a9F3N1cnOy4koU6Xj9QQZCp7geWs8
   k+oD+lqmqHzwn7BalongnZO5BwL4L7SsX8uCJkknXWJ0BJ3ZkaNuSp2uM
   rdv2qE+rRKkqSZWoTS3vsAAvKnb5FWEd8v2VF40OI6H2mFyMye/AsNSaq
   w3vwYoiSIlWhQS0B7w1JJhilQHG9i9XrR4W9toGQ+5zfT5OpmDHVMhNuF
   g==;
X-CSE-ConnectionGUID: oY9LHEeoS+iJaUtW2ZmKaQ==
X-CSE-MsgGUID: MjNND6CCRB+am+uz4qeMww==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86283188"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86283188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 06:35:09 -0700
X-CSE-ConnectionGUID: JQAwjkDjTWqj1S3VbmBbew==
X-CSE-MsgGUID: 8/1yfUs4QIWr/wuE9Th/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="258475556"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.133])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 06:35:07 -0700
Date: Wed, 5 Aug 2026 15:34:59 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Miguel Vadillo <miguel.vadillo@intel.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] media: i2c: cvs: Pass link frequency explicitly to
 csi_set_link_cfg()
Message-ID: <anM7y10VH-dt27ed@mdjait-mobl>
References: <20260720073642.2290315-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720073642.2290315-1-laurent.pinchart@ideasonboard.com>

Hello Laurent,

Thank you for the patch!

On Mon, Jul 20, 2026 at 10:36:42AM +0300, Laurent Pinchart wrote:
> The link frequency, retrieved in cvs_csi_enable_streams(), is stored in
> the icvs structure to then be used right after in csi_set_link_cfg(),
> called only from the same function. Pass it as a function parameter
> instead to improve readability.

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 13 9350
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--
Kind Regards
Mehdi Djait
