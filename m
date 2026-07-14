Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EF137E316;
	Tue, 14 Jul 2026 11:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027691; cv=none; b=BQMrbjaMAhCos9rKP5niN8ElcjWe2tHDNakfRnxWGhDqcczhdnksMc2Z+9llVX7xysUZERU9aETDE3umICOyKXEGW6hC2qqkqmjo9zqwUQKxYvQhVBIAN8qk+TdoSB72/g91KSaLhCtXtxBqCimBlMuEzV5FpIJjFzNMCQd9hjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027691; c=relaxed/simple;
	bh=qQrwrHYx8cRM3oa6lWly2Rut3pgouXoDKfZfik3XUFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzfxaOS+VDBU4IFaFn0csS5VjQ9t7gIWJ2HJ3RWo1qZpd6BJIdBNqAlK6XJqLZvAfQ854fhPQAvTngt3fc95jhBdFe0o9uqqUAizLM46Bs9L3aD/n9J00WpMz1YX5qhJhx/5lvSorqbIXa2pSGQ1b4i4EwGf9PGfT/ypL/v43v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJ+5NY8Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJ+5NY8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784027690; x=1815563690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qQrwrHYx8cRM3oa6lWly2Rut3pgouXoDKfZfik3XUFA=;
  b=cJ+5NY8Q1hdGyE1YaCPav5Qh+W6LNeQKnIwkHWBeJB/JvBgz8NhSdi5r
   dJ1NJgD5kIURUAt2XaNaxMaJjDDphT5Yt8skTG0qs/tJhBIPeLB9tb98w
   k9RsKOFDXTvJ7rzRSQiV4sWmefMkvfVxgPHaA7N35TnItR++PqbP3CWw3
   1VjhE15/UhlskcgaVr4m5nkUKysV4MP7sxJLgRRQ2ZUqNKbADJHUbAvdw
   g5ZjoMo+HRWG+O+FM4BJPLvcUIoLc/fyiFYa37+SG8v71waMLc+3aqEy9
   OBFsWm7g/9F3n3zbXuHfeSUeZcjsgybRJ/1PuK9N2AK+9cBP2MIvG2tYu
   w==;
X-CSE-ConnectionGUID: 1nFwB2hLTq2GMTpJFYx6kA==
X-CSE-MsgGUID: FcQ6oKGLRTWNg9DZexWeDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83767929"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="83767929"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:14:48 -0700
X-CSE-ConnectionGUID: 00oqJKDNQSOW58YS0IDmdg==
X-CSE-MsgGUID: UUkvYSlIQk+VNvVBo5ditw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="252444536"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.245])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:14:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5760511F8AD;
	Tue, 14 Jul 2026 14:14:44 +0300 (EEST)
Date: Tue, 14 Jul 2026 14:14:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: Re: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power management
 code
Message-ID: <alYaJNtPID_c3eZn@kekkonen.localdomain>
References: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
 <54ae65ff1286e2192b5a6575277e347469d4c44b.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54ae65ff1286e2192b5a6575277e347469d4c44b.camel@perches.com>

Hi Joe,

On Tue, Jul 14, 2026 at 03:28:13AM -0700, Joe Perches wrote:
> On Mon, 2026-07-13 at 19:13 +0300, Sakari Ailus wrote:
> > The V4L2 pipeline power management code, in particular
> > v4l2_pipeline_link_notify(), v4l2_pipeline_pm_get() and
> > v4l2_pipeline_pm_put() are deprecated and shall not be used in new code.
> > 
> > The drivers need to use the Runtime PM instead.
> 
> Nack. Say that in the error output.
> 
> Given this patch, checkpatch's message would be something like
> 
> "Deprecated use of 'v4l2_pipeline_pm_get', prefer '' instead"

That's even technically correct: these functions serve no useful purpose
anymore, all new drivers effectively use Runtime PM anyway.

> 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -879,6 +879,9 @@ our %deprecated_apis = (
> >  	"DEFINE_IDR"				=> "DEFINE_XARRAY",
> >  	"idr_init"				=> "xa_init",
> >  	"idr_init_base"				=> "xa_init_flags",
> > +	"v4l2_pipeline_link_notify"		=> "",
> > +	"v4l2_pipeline_pm_get"			=> "",
> > +	"v4l2_pipeline_pm_put"			=> "",
> 
> Add something like "v4l2 runtime power management API" instead
> At least point out what that is.

How about simply "Runtime PM"?

> 
> And in today's '-next' there's seems to be no indication in
> documentation or code these calls are deprecated.

The deprecation notes were introduced in commits
b97213a41140b87f48865ba594a1f4b5c5566631 and
4ec2caab775606c4bf9d0f026f8942a0b33e2255, the latter of which was merged in
2024.

-- 
Regards,

Sakari Ailus
