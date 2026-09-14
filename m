Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B189441D22E
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378601; cv=none; b=gP0W9OODT0IJvuYWeIgYd/7o4+V8PssRxLq9qvQwG0GH69pNJnpowhjw4zAmnqwFzaqXW0SFRniAYbkfk8SXbpTkUxelVp8Q0NgkTtA4HnH+4Zdwsizp0U1zprfP2mI+hh9wF7dGvy7C85QYVFcCfM+7S+s19E6DWVPkBFU69uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378601; c=relaxed/simple;
	bh=e1BQJWRcGE4QvxUhjcL3FVAmA1oV7NnizpHH4ccof3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrMyvYgXyLaDhx5TvNDN1iw5yonffNTWgojdKsSJkfFh80ahIlvjXUnq8L7OpcPpc2mPv68YkUr2lOBNoMY7FvkuJD5cGIRrunTEqjablV6g+l+UndQKjys+UTQ8PmLyxxzVsyWhltVYXd034o9uyYUa1b+C+FOJYEWh7yW8ZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I580+lNj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I580+lNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789378600; x=1820914600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e1BQJWRcGE4QvxUhjcL3FVAmA1oV7NnizpHH4ccof3s=;
  b=I580+lNjihc/wkQ0orCcf2uREfMS26T1wcYD9jyTVu3LoPQWSBKekOpQ
   pC6vEsNI1UhOcGWR+MCXhTPs3z4BGPT5DvR2Sbp4MHjeZFNGvkWgtukC7
   W07Bw6NYJnRhOvasFXh5u2jzHaJA2odP76WkycvmvVLffm/EsYkEP9EOF
   77mkPepSZCAX1oG+GQkoxT7p27Bm5mPy4TP9x/rup89M4PD99W3EijaSO
   xpQDDMB2xJga2WeA98adzUEddX59AjL5VB0kqz5p1QYtL57VI0jzdVcgw
   UWRc4RfUFU9k3BoXappddKCkPF/C2iQmpLkvFlzaeAAOvA5CvztiJtso9
   g==;
X-CSE-ConnectionGUID: 3r3Luci8RoO/R5O2P9xRHQ==
X-CSE-MsgGUID: moGZ49uxRA6AGpoyXBJrbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="101079659"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="101079659"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 02:36:39 -0700
X-CSE-ConnectionGUID: k6kjd97cQq6ldSp9513HuQ==
X-CSE-MsgGUID: Loyz+whcQum+UyhI65F8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="276338361"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 02:36:38 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Manuel Knitza <manuel.knitza@googlemail.com>
Cc: Sergey Zagursky <gvozdoder@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Mon, 14 Sep 2026 17:36:29 +0800
Message-ID: <20260914093629.639591-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914074130.24756-1-manuel.knitza@googlemail.com>
References: <20260914074130.24756-1-manuel.knitza@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 09:41:16 +0200, Manuel Knitza wrote:
> The driver is a hard dependency of the 7.2 CVS path,
> not an ancillary sub-driver, so hiding it behind
> MEDIA_HIDE_ANCILLARY_SUBDRV means distros silently ship
> a kernel whose bridge routes to a driver they cannot
> build.

Agreed, and it is already on the list ;)
https://lore.kernel.org/r/20260913125345.588586-1-junjie.cao@intel.com

With it, Arch's config gets VIDEO_INTEL_CVS=m on
olddefconfig. If you get a chance to confirm the same
on a linux-ptl build, a Tested-by there would be much
appreciated.
