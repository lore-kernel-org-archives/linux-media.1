Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B985D4D9563
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 13:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983128; cv=none; b=qfUiBVDY5CIAN/zZrvebdYuFZ+g8PHwrLhPXddHfWA4XR0lFmYdaeagmc8G7Tgsk4Ung9m8+avKR9UiPlCi1eo+9HLFRvX9U/mhTWhrRUcz95kCcQlGAAavpbtZ0nkYtm0kqEWdTmwOoESJf5SiB3sSFl5zXJmQ2us2ZuZEFcBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983128; c=relaxed/simple;
	bh=WDIrICH8ErmG3IAK1EILh2SPlKNRkyZjbz6C9IfwoRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gmx6ERQ3w+Fm+F0LVyGnyYKwGc/XZi3iyi0Y/h6fb50PCdyqxB4GBmX8sW4P+Kw8qV23V8zfqLNg7cdZA/tVN6nDo1ECKqKT79I70uPRfFTgK/h4yxP4xzPatsL88zB2SFWM+gpNS23xpUk10eaw3dlo9TIkKzHcXW56bIktfqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4nSSO8k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4nSSO8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791983126; x=1823519126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WDIrICH8ErmG3IAK1EILh2SPlKNRkyZjbz6C9IfwoRY=;
  b=I4nSSO8kcO1h7RhkiwoV36j8BryJ2XLO5kJ9iorDfix2nifQaR/iBVHJ
   jzkfadmA734kCcawXQdWaR+nuhqcRHzBlFa4Xe6jtRRe6e46uC0Sub6mF
   9UJK8KwV3EtkNNSz+Tsf871rm6xHfU7HykNPin5JUkqBUhgnWeu1KDEqi
   vVtEPWUoeggS7Vb2Bcwtt2fFXpF2pYTJnG8J862dGjxc4tAVnA/u1kMO0
   n8xNSuKkr3Gf5x+lgnS+15SxbNgHfjhkf92iBxlC0oHCu9Jj2X61bclu6
   F24sZdwGlJbgwLvIxYyAZrMUd9PryWzHzDWJGn/qXbdlN8FxvyiujvwnE
   Q==;
X-CSE-ConnectionGUID: eX/xF0gRQ42RcS4g0+Bl3g==
X-CSE-MsgGUID: gwAFCmZhS2ydjyWKphXkag==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="826748"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="826748"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:05:25 -0700
X-CSE-ConnectionGUID: cWjrKkdTTnyDEz+po9wq8w==
X-CSE-MsgGUID: fT6ZubusRomP/sFFFdMJAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1498983"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO alaakso-desk) ([10.125.110.19])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:05:19 -0700
Date: Wed, 14 Oct 2026 16:05:15 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: Re: [PATCH v2 0/5] IPU reset workaround changes
Message-ID: <as9-C50a3C69v_al@alaakso-desk>
References: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>

Hi Sakari,
On Mon, Oct 12, 2026 at 02:39:57PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> Maybe I should have labelled these as RFC instead... this set reworks based on
> what the ISYS is reset and how that affects UAPI.
> 
> It seems there are some issues on IPU7; at times (around once in a few hundred
> cases) streaming with yavta results capturing a single frame only and an ISYS
> power reset is needed to recover from that. No reboot (or driver reload) is
> needed with these patches though.
> 
> Similarly with these, an ISYS reset is avoided in regular streaming cases for 
> IPU7. 
> 
> Comments are welcome (as always).
> 
> since v1:
> 
> - Fix error handling in start_streaming() in the 4th patch.
> 

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

> Sakari Ailus (5):
>   media: ipu6: Don't mark need_reset based on returned buffers
>   media: ipu6: Tell about not being able to obtain frame descriptor
>   media: ipu6: Prevent starting streaming if ISYS needs reset
>   media: ipu6: Remove need_reset check from video device open
>   media: ipu6: Return errors from stream stop and close
> 
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  6 +-
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 18 ++---
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 74 +++++++++++--------
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  4 +-
>  4 files changed, 55 insertions(+), 47 deletions(-)
> 
> 
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
> -- 
> 2.47.3
> 
> 
