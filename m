Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1963DE45C;
	Tue, 28 Jul 2026 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225348; cv=none; b=tCHg05LN9DwzBlEnGlS+aXijopo/TV0LEsDmYx5UIUloI6nC9hOqcq/S9OXVn8/XeMzu3r24IsIeXzGeIo/BL0ZxBh8TDNgfti5Y5QXXE3IgosY+/04q9pnBNUr+pEDOMQ+NWCPb4wKtY3ThbiD90AoKBlKCtGV/ndtYI7/6//s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225348; c=relaxed/simple;
	bh=a0wKCAcU37/n7n9stGE/bcPp3sYEn9/Fd6eZ52Mx5nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+3lSYOeKs0pFjvo+hs7pdVWDF/TdnaqjHzHuM9bBDAOXPwppIiYCkpW2uvy6zoze4mPmTIvSHXqfEY6auJPT1TL1Jw4U/JI3Zpbr9ibh7l2WLQYHhZfqnRNdywG+1CwzbehEtRDfqhQpzp9uqW/OM3hTtLsILcZk18SLNuZDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGWUe88W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGWUe88W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785225347; x=1816761347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a0wKCAcU37/n7n9stGE/bcPp3sYEn9/Fd6eZ52Mx5nQ=;
  b=kGWUe88Wj3CqQCaBnBxhS2234xood3NVV31+xLL4f+6fzzQsAuGuSrvT
   rGXw/6CnEzlsh8H7ktUytxhDZMU69XcxcMlaIZ7JB1PymmOyQfXI+gsKw
   Q1gBIZbmNWn7nezRn7LPfO0UzG3JjVyqcTXrOVjKyq/neiC1Mc1y8uhRX
   cypbry7jkOeOESrXF2uCU90ZroKsgVCQmi3be1S26tpsgqEKJPojJfQGx
   XM+SRAJOH5xRRK26NeS3FMF+NWNQlcPkt+/7d5uEN5OG9ZyS/SlDKJIex
   KuzOJUKJm1A+uECgRQpHRRrPIC1+JEy3DcEwZ5NHL9bAK/ACvEBD1N8WV
   w==;
X-CSE-ConnectionGUID: tPQv3VF+R5O0tkGP450pOA==
X-CSE-MsgGUID: 3IfN67lES92q1tlevWVYcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="73339639"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="73339639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 00:55:44 -0700
X-CSE-ConnectionGUID: 1CG8Jr/XQpCrmDeZh+8ZFg==
X-CSE-MsgGUID: xbTPseBATgaMLGWeU3b2vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="259070139"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 00:55:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 50D81121BFD;
	Tue, 28 Jul 2026 10:55:41 +0300 (EEST)
Date: Tue, 28 Jul 2026 10:55:41 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?B?5bKz56eJ5Z2k?= <yuebingkun@kylinos.cn>
Cc: mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix a few typo and wording issues
Message-ID: <amhgfZ3lLS6NCv2t@kekkonen.localdomain>
References: <20260728030748.45399-1-yuebingkun@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728030748.45399-1-yuebingkun@kylinos.cn>

Hi 岳秉坤,

On Tue, Jul 28, 2026 at 11:07:48AM +0800, 岳秉坤 wrote:
> Hi,
> 
> This patch fixes a few small documentation issues in Documentation/ files.
> 
> I am a newcomer to the Linux community, and I am eager to contribute
> and learn through small, helpful fixes like this one.
> 
> These changes are limited to spelling and wording corrections and do not
> change behavior.
> 
> Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>

Could you split this into two, to ABI changes and those that are merged via
the media tree (under Documentation/userspace-api/media).

> ---
>  Documentation/ABI/README                                        | 2 +-
>  Documentation/ABI/testing/sysfs-edac-memory-repair              | 2 +-
>  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

-- 
Regards,

Sakari Ailus
