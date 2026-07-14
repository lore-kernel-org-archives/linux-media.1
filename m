Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B0C448CEA;
	Tue, 14 Jul 2026 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032336; cv=none; b=Th1El332uQybriTvutxwKZANT+Err4OK1HU3DeX+4Xd/amcjCqa5Ap6P+roFtzCmmbJv5GyuHIOzwwylVFTrqGx4kbdymMcnyEX24Dn/LLOlkyTiwBtnDXUEOEEsTdAT+MS5GvAVRlAWoOKNetbC+fdBZA7856hG8J1nVzE+ZxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032336; c=relaxed/simple;
	bh=AwGj/aULw0ap2zcBlgk9XblBB8FzAQcjt5bN4ozwdoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvilkKExoVCofQPx3tQVWA/VPFxf/l1gR3G1LVFE6Kkd7lq8ReKEGBvFGiXOgYcYcBeIvQWdXaMq8LPrQIblpWC3xj79+Vji7KjjN1aIKEeWf9ou70Bnx9IrZ3uAX1xVi3dNOI54FG0E+oubyc6MwsUN9uLhVi5GCfmYAm/77UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJoZFQ4d; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJoZFQ4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784032330; x=1815568330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AwGj/aULw0ap2zcBlgk9XblBB8FzAQcjt5bN4ozwdoA=;
  b=QJoZFQ4d69KoTKzgtCEMQvt5Vf0h0Gfm+tFCGtONl//GiXhcSlHSTXVj
   qyfgX7W/Gvcx/w/3qlpYwEAmRsQtv8WYlGPMh6Ya3ZJKdiKmdYdSC7dLm
   zxrkVdnpS+q81HaHD+/BbHf/WGahbiHdeuoz2PPy65qThCBR86KEKQSh4
   /G71j5Itm4aLBllPVJsYMS4ef93kBBYQCbZA4jmP2l7WXQ1+uTO5qT4my
   bq7itPmBSULxWTmfYgKYPMzSOkPEqLOW93wOddB8kIYQq5SRqsu4FzI/P
   OkBv944mMRNV9w9Yqd8b0RPPMHcnZNEhb4dPIkbgFs3bDZYxSQ01UGyGe
   Q==;
X-CSE-ConnectionGUID: 2bw4FlfOTEqwJJE69GHWjQ==
X-CSE-MsgGUID: gmbuGEicQBqFtsLa6nHaLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84505937"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84505937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 05:32:03 -0700
X-CSE-ConnectionGUID: 3125c8FoR2qvWopXgXJmLw==
X-CSE-MsgGUID: B6p71w4eSfax1z7VER5UDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="259693331"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.245])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 05:32:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E598B11F8AD;
	Tue, 14 Jul 2026 15:31:59 +0300 (EEST)
Date: Tue, 14 Jul 2026 15:31:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: Re: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power management
 code
Message-ID: <alYsP882m2iB3UFk@kekkonen.localdomain>
References: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
 <54ae65ff1286e2192b5a6575277e347469d4c44b.camel@perches.com>
 <alYaJNtPID_c3eZn@kekkonen.localdomain>
 <3e7b6acec459836275940908320db45a84f170b7.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e7b6acec459836275940908320db45a84f170b7.camel@perches.com>

Hi Joe,

On Tue, Jul 14, 2026 at 05:11:17AM -0700, Joe Perches wrote:
> On Tue, 2026-07-14 at 14:14 +0300, Sakari Ailus wrote:
> > > Given this patch, checkpatch's message would be something like
> > > 
> > "Deprecated use of 'v4l2_pipeline_pm_get', prefer '' instead"
> > 
> > That's even technically correct: these functions serve no useful purpose
> > anymore, all new drivers effectively use Runtime PM anyway.
> 
> OK, but given that there are only 32 uses in 16 files in all
> of -next, why not just fix the uses then delete the functions?
> 
> $ git grep -P -w 'v4l2_pipeline_(?:link_notify|pm_get|pm_put)' | \
>   grep -vP '^(?:include|drivers/media/v4l2-core)' | \
>   wc -l
> 32
> 
> $ git grep -P -w -l 'v4l2_pipeline_(?:link_notify|pm_get|pm_put)' | \
>   grep -vP '^(?:include|drivers/media/v4l2-core)' | \
>   wc -l
> 16

There are about 20 V4L2 sub-device drivers that implement the s_power()
sub-device video callback used by the v4l2_pipeline_*() functions. These
are generally old drivers and the conversion is typically not entirely
trivial.

The intent here is to avoid adding new users to these functions now -- some
have slipped through recently.

> 
> > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > []
> > > > @@ -879,6 +879,9 @@ our %deprecated_apis = (
> > > >  	"DEFINE_IDR"				=> "DEFINE_XARRAY",
> > > >  	"idr_init"				=> "xa_init",
> > > >  	"idr_init_base"				=> "xa_init_flags",
> > > > +	"v4l2_pipeline_link_notify"		=> "",
> > > > +	"v4l2_pipeline_pm_get"			=> "",
> > > > +	"v4l2_pipeline_pm_put"			=> "",
> > > 
> > > Add something like "v4l2 runtime power management API" instead
> > > At least point out what that is.
> > 
> > How about simply "Runtime PM"?
> 
> Better than nothing IMO.

I'll send v2 with that.

-- 
Regards,

Sakari Ailus
