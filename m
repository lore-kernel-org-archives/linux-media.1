Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA635473C87
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057641; cv=none; b=P++5sSYxaxQhiDqzURt1uoDVlCgNOvFb1mK1HmQLeVZzuLYkTs8cBeis0jXrDVLdZtDoisvu1Vcky1pAIXPpYyLfC6q61oW5liv/uHdb569Yipt18DDmKCbTLo/yxldaf0BKEt4yUThxjW+QuDnQEZat//rftDrDSbjnNDhfgSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057641; c=relaxed/simple;
	bh=NwU5TLaCkzOyPWAX4VPubu3QsyHhlIgwVadkFHdKUi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XU2K6F8iZDQedYc0ePuinLICmcz4jz4xfsGlqH/kEDID6F81SK2rdHQYinz042nQXdsjepIWqZOSLSpj9L9+bkWE+tVKDkKjEjsBYXUC+FWEteOKdde/aZp9A0wbI93aWxVWrQdrwEAIBDR/tOv0+Q98F25UUWdxpr2eZJp4nBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJ3XNU9j; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJ3XNU9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787057639; x=1818593639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NwU5TLaCkzOyPWAX4VPubu3QsyHhlIgwVadkFHdKUi8=;
  b=YJ3XNU9jh3ElplW/BlZZ9jxy3SZ0MrdOJTKanEouOFJRVfFwiN/H750/
   akklHDd870ZtmbpYrfvc6t/G2KxxsfhGkxz/fl9khqpP+t2aRqGaVdSaj
   WmZcNMQ48mCjL/uUp3dP4QpJe4gCyHXPwu04i4+h+ceuKZu58ZkxfqT1h
   NzOB/h+QVVSJ408t0KrP23KLgpjqAjOHWiTZIEJmqstOYsyUVPGAOQjdS
   32grYNjseXOtuHOn8Y5at3wWElkeOUbQ6nLDdDVsadKg5fnTj/30zsKva
   y0rYDXktj6ZF8C/hcj1KjUz0L5lb0oFDTzAMbpJTNF+JM7RYJ/AVjG5hn
   g==;
X-CSE-ConnectionGUID: 2G83p1nxRzuYI3PRR4Ccgg==
X-CSE-MsgGUID: TzMa9feSQXCSDdOqLLR3cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87670999"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87670999"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 05:53:40 -0700
X-CSE-ConnectionGUID: /iKOoQO5RPygC0Rrqy49PA==
X-CSE-MsgGUID: RKBckIuzRW+oBCEAS8jGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261933090"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.254])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 05:53:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 535D0121504;
	Tue, 18 Aug 2026 15:53:43 +0300 (EEST)
Date: Tue, 18 Aug 2026 15:53:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 00/17] Rework frame descriptors
Message-ID: <aoRV18TXSBQj6U49@kekkonen.localdomain>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <87pkzl15fs.fsf@kernel.org>
 <2b31cfaf-82ca-4585-b7c8-41a15e5dcc91@ideasonboard.com>
 <87mrup129s.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrup129s.fsf@kernel.org>

Hi Mattijs, Tomi,

On Fri, Aug 14, 2026 at 11:26:23AM +0200, Mattijs Korpershoek wrote:
> Hi Tomi,
> 
> On Fri, Aug 14, 2026 at 11:21, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
> > Hi,
> >
> > On 14/08/2026 11:17, Mattijs Korpershoek wrote:
> >> Hi Sakari,
> >> 
> >> Thank you for the series.
> >> 
> >> On Mon, May 18, 2026 at 19:43, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >> 
> >>> Hi folks,
> >>>
> >>> This smallish set makes frame descriptors dynamically allocated and
> >>> implements a single-entry frame descriptor based on the device's format,
> >>> using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
> >>> do not obtain their frame descriptor from upstream are converted. The
> >>> helper also obtains a frame descriptor for the desired type (parallel or
> >>> CSI-2) and checks there's at least one entry there. These checks are
> >>> removed from drivers that currently perform them. (Some drivers also check
> >>> there's exactly a single frame descriptor entry but I think in most cases
> >>> this check could be loosened. That could be done after this set.)
> >>>
> >>> On callee side these patches introduce no changes as the number of
> >>> pre-allocated memory for 8 frame descriptors remains as-is. The
> >>> get_frame_desc() pad op can return more than 8 frame descriptors by
> >>> setting the num_entries to the desired number and returning -ENOSPC.
> >>>
> >>> If people prefer using cleanup.h / __free() to release the dynamically
> >>> allocated array (I think I'd almost require that), I'll merge the
> >>> now-separate __v4l2_subdev_get_frame_desc() into
> >>> v4l2_subdev_get_frame_desc().
> >>>
> >>> More formats can be added to df-to-mbus conversion as needed. These are
> >>> meant to be initial formats that are enough for typical raw sensors (and
> >>> one RGB format, too).
> >> 
> >> I've tried this out on a AM69-SK with the Arducam FPD V3Link[1] using
> >> the following device tree overlays:
> >>    ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo
> >> 
> >> See TI's documentation about this [2]
> >> 
> >> I (naively) assumed that this series would replace Tomi's patch [3], but
> >> it did not. I see the following in dmesg:
> >> 
> >> [  286.686574] cdns-csi2rx 4504000.csi-bridge: collect_streams: "cdns_csi2rx.4504000.csi-bridge":1: found 0x1 enabled 0x0
> >> [  286.686754] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
> >> [  286.700147] ds90ub960 7-0030: Failed to get source frame desc for pad 0
> >> [  286.712679] j721e-csi2rx 4500000.ticsi2rx: enable streams "ds90ub960 7-0030":4/0x1
> >> [  286.712684] ds90ub960 7-0030: collect_streams: "ds90ub960 7-0030":4: found 0x1 enabled 0x0
> >> [  286.712690] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
> >> [  286.725884] j721e-csi2rx 4500000.ticsi2rx: enable streams 4:0x1 failed: -515
> >> 
> >> Here is my camera topology:
> >> https://paste.debian.net/hidden/7f56f635
> >> 
> >> I also made the following patch to attempt to convert over j721e-csi2rx:
> >> https://paste.debian.net/hidden/314f9c32
> >> 
> >> Is this series indeed aimed to replace all sensor-specific
> >> implementations of .get_frame_desc() or are patches such as the one send
> >> from Tomi [3] still useful?
> > I don't remember the details anymore, but probably related to my comment 
> > in this thread:
> >
> > "It also looks like you only modified platform drivers. Did you check 
> > the i2c drivers? Some call get_frame_desc().". So I think ub953 is 
> > missing the conversion to v4l2_subdev_get_frame_desc().
> 
> Thanks for the hint.
> 
> ub953 and ub960 (which I both use) indirectly call .get_frame_desc() via
> v4l2_subdev_get_frame_desc_passthrough().
> 
> So maybe v4l2_subdev_get_frame_desc_passthrough() needs an update as
> well in this series.

Using v4l2_subdev_call() is still ok as such but it won't be able to return
more routes than it used to.

I've made some changes since which I have pushed to my frame-desc branch in
my linuxtv.org (and FDo) trees but I'm not sure if these address the issue.

-- 
Regards,

Sakari Ailus
