Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59C1E2614
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787642886; cv=none; b=HEpE+y3/aOM+9qHcNHAZBfuV8KNYXSgMXs4Y9hBKFeaprfO3puK9m1GCsIoy9VdmUQG8mSwYAoZo+zwMX0UBTYd7xtXvTT5EDFUd2ORj9i7F6crm5w5rwSuzeUtrEl/V50gam1pSpvbN4ovsJpDeatplLbEi8gaodPboFJ9z26w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787642886; c=relaxed/simple;
	bh=kiAECcGxqtTndPld8RaQBkFyIoPgD28AeVWW7Es6eBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOfudl5NSAlvb17/W7bY2263J/o14/GO42h3Np4Y7pIFX5naf8ZqVTeQbRNQqsIiho5ila/6l/+IppySEYJpgl5P0chicD2xT4LVEIDOCpieVmyWTFQwzwTDwpXZewqOqSdumjPcQ95ShvKg33paHbantX+vQ0y9BYAbd1PHd+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHoqwl5i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHoqwl5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787642884; x=1819178884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kiAECcGxqtTndPld8RaQBkFyIoPgD28AeVWW7Es6eBw=;
  b=EHoqwl5iGv+3Ju9JW3t8BDlQx4W5Q7Zm2VrtIcc7JnrNO3BY6XAgul/2
   Wg3+KmIshhew+vUSLh95UNNWvXgmoanEM2EDX49kMKe+kfVl11Dvht+Hl
   WXH+620R/lFReKTqJ7eCdrWkiaaFd9JCaSuUF1fIIXt4d9o4M4j/PWn1C
   i1ZkVRG3JQj+jTgJeFYTdHnfYOzvaP0YWfJ573e16kiHSHDpr+l7UnzZK
   iqZmNIxogmyVFgD3icTLU4PfXaUObZO3n0DcK0vFsKWCHBqo1P/6I195F
   2XFPlvWoDdbRRuJC4ouPEXzc+yW5KGAoXN8KimKjJ3nrOwfiOVrf0G04a
   g==;
X-CSE-ConnectionGUID: t5YHBcKrT3+Oe+PYoswjgg==
X-CSE-MsgGUID: HZC3dDFWQ/KbTa8FEa+tQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91783950"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="91783950"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:28:03 -0700
X-CSE-ConnectionGUID: GLQg1r3BQq2yvJmBJGtZ/w==
X-CSE-MsgGUID: nmy+OvaQQtqAaaqmcfztJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="272434356"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.50])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:28:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3A89E12033D;
	Tue, 25 Aug 2026 10:28:12 +0300 (EEST)
Date: Tue, 25 Aug 2026 10:28:12 +0300
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
Message-ID: <ao1EDI3kFvR6I2SI@kekkonen.localdomain>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <87pkzl15fs.fsf@kernel.org>
 <2b31cfaf-82ca-4585-b7c8-41a15e5dcc91@ideasonboard.com>
 <87mrup129s.fsf@kernel.org>
 <aoRV18TXSBQj6U49@kekkonen.localdomain>
 <87pkzegw83.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pkzegw83.fsf@kernel.org>

Hi Mattijs,

On Wed, Aug 19, 2026 at 01:56:12PM +0200, Mattijs Korpershoek wrote:
> Hi Sakari,
> 
> On Tue, Aug 18, 2026 at 15:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> 
> > Hi Mattijs, Tomi,
> >
> > On Fri, Aug 14, 2026 at 11:26:23AM +0200, Mattijs Korpershoek wrote:
> >> Hi Tomi,
> >> 
> >> On Fri, Aug 14, 2026 at 11:21, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> >> 
> >> > Hi,
> >> >
> >> > On 14/08/2026 11:17, Mattijs Korpershoek wrote:
> >> >> Hi Sakari,
> >> >> 
> >> >> Thank you for the series.
> >> >> 
> >> >> On Mon, May 18, 2026 at 19:43, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >> >> 
> >> >>> Hi folks,
> >> >>>
> >> >>> This smallish set makes frame descriptors dynamically allocated and
> >> >>> implements a single-entry frame descriptor based on the device's format,
> >> >>> using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
> >> >>> do not obtain their frame descriptor from upstream are converted. The
> >> >>> helper also obtains a frame descriptor for the desired type (parallel or
> >> >>> CSI-2) and checks there's at least one entry there. These checks are
> >> >>> removed from drivers that currently perform them. (Some drivers also check
> >> >>> there's exactly a single frame descriptor entry but I think in most cases
> >> >>> this check could be loosened. That could be done after this set.)
> >> >>>
> >> >>> On callee side these patches introduce no changes as the number of
> >> >>> pre-allocated memory for 8 frame descriptors remains as-is. The
> >> >>> get_frame_desc() pad op can return more than 8 frame descriptors by
> >> >>> setting the num_entries to the desired number and returning -ENOSPC.
> >> >>>
> >> >>> If people prefer using cleanup.h / __free() to release the dynamically
> >> >>> allocated array (I think I'd almost require that), I'll merge the
> >> >>> now-separate __v4l2_subdev_get_frame_desc() into
> >> >>> v4l2_subdev_get_frame_desc().
> >> >>>
> >> >>> More formats can be added to df-to-mbus conversion as needed. These are
> >> >>> meant to be initial formats that are enough for typical raw sensors (and
> >> >>> one RGB format, too).
> >> >> 
> >> >> I've tried this out on a AM69-SK with the Arducam FPD V3Link[1] using
> >> >> the following device tree overlays:
> >> >>    ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo
> >> >> 
> >> >> See TI's documentation about this [2]
> >> >> 
> >> >> I (naively) assumed that this series would replace Tomi's patch [3], but
> >> >> it did not. I see the following in dmesg:
> >> >> 
> >> >> [  286.686574] cdns-csi2rx 4504000.csi-bridge: collect_streams: "cdns_csi2rx.4504000.csi-bridge":1: found 0x1 enabled 0x0
> >> >> [  286.686754] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
> >> >> [  286.700147] ds90ub960 7-0030: Failed to get source frame desc for pad 0
> >> >> [  286.712679] j721e-csi2rx 4500000.ticsi2rx: enable streams "ds90ub960 7-0030":4/0x1
> >> >> [  286.712684] ds90ub960 7-0030: collect_streams: "ds90ub960 7-0030":4: found 0x1 enabled 0x0
> >> >> [  286.712690] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
> >> >> [  286.725884] j721e-csi2rx 4500000.ticsi2rx: enable streams 4:0x1 failed: -515
> >> >> 
> >> >> Here is my camera topology:
> >> >> https://paste.debian.net/hidden/7f56f635
> >> >> 
> >> >> I also made the following patch to attempt to convert over j721e-csi2rx:
> >> >> https://paste.debian.net/hidden/314f9c32
> >> >> 
> >> >> Is this series indeed aimed to replace all sensor-specific
> >> >> implementations of .get_frame_desc() or are patches such as the one send
> >> >> from Tomi [3] still useful?
> >> > I don't remember the details anymore, but probably related to my comment 
> >> > in this thread:
> >> >
> >> > "It also looks like you only modified platform drivers. Did you check 
> >> > the i2c drivers? Some call get_frame_desc().". So I think ub953 is 
> >> > missing the conversion to v4l2_subdev_get_frame_desc().
> >> 
> >> Thanks for the hint.
> >> 
> >> ub953 and ub960 (which I both use) indirectly call .get_frame_desc() via
> >> v4l2_subdev_get_frame_desc_passthrough().
> >> 
> >> So maybe v4l2_subdev_get_frame_desc_passthrough() needs an update as
> >> well in this series.
> >
> > Using v4l2_subdev_call() is still ok as such but it won't be able to return
> > more routes than it used to.
> >
> > I've made some changes since which I have pushed to my frame-desc branch in
> > my linuxtv.org (and FDo) trees but I'm not sure if these address the issue.
> 
> The frame-desc branch addresses the issue for me. With
> commit 02cef3cf1f3f ("media: v4l2-subdev: Use v4l2_subdev_get_frame_desc() for passthrough")
> 
> I see:
> 
>   root@am69-sk:~# uname -a
>   Linux am69-sk 7.2.0-rc1-00331-g02cef3cf1f3f #11 SMP PREEMPT Wed Aug 19 11:34:54 CEST 2026 aarch64 GNU/Linux
> 
>   root@am69-sk:~# yavta --capture=10 --file='capture-#-srggb8.bin' --size 1920x1080 --format SRGGB8 /dev/video4
>   [...]
>   Captured 10 frames in 0.352748 seconds (28.348849 fps, 58784172.871734 B/s).
>   8 buffers released.
> 
> And after converting to .png, the image indeed seems to be a valid capture.
> 
> Could you cc me if you post this? This way I could add a Tested-by: if
> that helps.

Thanks for testing these! I've sent v3 yesterday, it has some additional
improvements, too. I've also pushed the patches to the frame-desc branch on
my FDo (and linuxtv.org) tree.

-- 
Regards,

Sakari Ailus
