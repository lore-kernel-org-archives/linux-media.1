Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748F431AAAA;
	Tue, 10 Mar 2026 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132577; cv=none; b=In6G166l2s9wT5bjbq8w2gfU3NUwqPiezf0aTvdqdLPiZv0Lem9rwz1K6zVRJnUbVxWSuvqInsyLHKK5imK3csYfPlZ61viSHO7Df6gMt8OdDpFcmVrQWEeETaI17tcDU49Wo0iJ7DehA7COmufkNZpogI9NMVzTSOukAUFHuao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132577; c=relaxed/simple;
	bh=Sg2xCQlAj7sDu+HIy4ALfNtha+MEdbYMno1IuB4CCms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnHMeuSJ5kERuh+P1Qepsy29jmvSfSxk74ialGDt/CubkNMRNDXMg8kzcIH1RHsKWs1vnJZ1ksWDy1JVCwmqRgem+0NUMIhN1bPGqgKkofWq+xqMy0Q4UOB66W7YR4/lnCofoxAJkpO7xsgXIGkybHnb909SgrVuelOuzypNNE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRg2bSGZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRg2bSGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132577; x=1804668577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sg2xCQlAj7sDu+HIy4ALfNtha+MEdbYMno1IuB4CCms=;
  b=bRg2bSGZDVB5Io4RPN4T6H5M8nL+k+LvI4TA/qmrU3StvX7SfLvt4v0R
   9172YNmZ1xIPAbIAaonaKyRn4vWNfLv1VnKb4vb1jZn2Ei+ROQeLjgFE1
   /ajVm+qeogQxdqqXcmQtMSlSYtXJQtvF/VT4Hjcil0ZPM5gOpsHOzl0vv
   mCFEhQO8VUJzNZF36TBbQLa+RGf5c+UZ5sIbKR6fNLO+2s3R4KGm8ujBZ
   6dkXilHsn3vABjQepPbbkglBElDg32Cank4WSLbzHO/4OCqe1k7J35u+D
   1NK61D/BGR+z3DfbP/Ujn/vk4SmN75BK1Ax9i8CVUIgQ4aQAqOZFuh6Sh
   g==;
X-CSE-ConnectionGUID: TNFWPVfmTuWj8L1/0Ez5SA==
X-CSE-MsgGUID: 7I5xkJFESF+DZvpFX0CrCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78049423"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="78049423"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:49:36 -0700
X-CSE-ConnectionGUID: vSDB7XjERSOEz3rY0t8pLw==
X-CSE-MsgGUID: 07d8dJhASgK5cA7f6tIqCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="219999220"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:49:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 97DDA1206B6;
	Tue, 10 Mar 2026 10:50:04 +0200 (EET)
Date: Tue, 10 Mar 2026 10:50:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: add missing mutex in
 atomisp_vidioc_default()
Message-ID: <aa_bPHaz2Bj3ifSj@kekkonen.localdomain>
References: <20260205043730.3856488-1-n7l8m4@u.northwestern.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205043730.3856488-1-n7l8m4@u.northwestern.edu>

Hi Ziyi,

On Thu, Feb 05, 2026 at 04:37:30AM +0000, Ziyi Guo wrote:
> atomisp_vidioc_default() calls atomisp_exp_id_unlock(),
> atomisp_exp_id_capture(), and atomisp_inject_a_fake_event() without
> holding isp->mutex. However, all three functions have
> lockdep_assert_held(&isp->mutex) indicating callers must hold this lock.
> 
> Other ioctl handlers in the same driver (e.g., atomisp_start_streaming)
> properly acquire the mutex before operating on ISP state.
> 
> Add mutex_lock()/mutex_unlock() around these three ioctl cases to fix the
> missing lock protection.
> 
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>

We're disabling these for now so the locking question is no longer
relevant.

-- 
Kind regards,

Sakari Ailus
