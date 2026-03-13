Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A7387347;
	Fri, 13 Mar 2026 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397610; cv=none; b=m9nG6D8pnJDGIbXT3sEQRTOrz+MEaGjYeY+L5EL6rDTPWV5DOFvHnzv1ofeIn7hBQU5aRWajvr8jDJEvODgKMzVRO4yQs0Wexb+1b5Vj17M+zwr9ZKqgNulRgWxFpawww/vSCa75IBJTndIiKwsOUu9Kwxwh/GNZ9Qhbzp+Fby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397610; c=relaxed/simple;
	bh=lQpGYEnaHMFKKuxpTbNjB8KciXQJWiVo9haEk+Ps4dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqF59++hWN9nNw22ThrYwjwz7AppSfVjgMvYhgdOnlEqg8JuPoSeHWcALUAX1Y+CeN47H3f1FHy3br9unEq93yHyBy/vlrrzX/a4NmUtOgaLxJH3O6/bE2k9aO2UyZd3I3HWxrndulPYuHtTQDRs3T/by1U0gMOIRCJINMeRKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzNZ7xOO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzNZ7xOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773397610; x=1804933610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lQpGYEnaHMFKKuxpTbNjB8KciXQJWiVo9haEk+Ps4dc=;
  b=FzNZ7xOOo3RaKRAzmOVtrHDhAQLY/u6de6bH8rN6kXcmzgdRcnFtBaIJ
   ENG0piRG6EHCvtpvbeGJrIhdJO8v+bRymWS4l530Jhe7eCuIsKS2LKK9B
   roxfe4QcTI6OmlLGvejQi4Ijb7Ad/HPDNqgKVNqylyLTUQ8AoR6GZeU2V
   mvYVkag375jq+1oXsPlH7RN1AUwPfaBJ4mSaSJD1gev2mW2DE2xT2YGC1
   9Mwp/dMrzRLWVvul2jHPTeA9FoEWNujdbNcZ27VX6f+nMmx+BtnWJwSsa
   6FtY+aEA6uW1iC9Koqo4sMNTca/3V+MB0js9cukpWYhKauHL8W9VY5kSq
   Q==;
X-CSE-ConnectionGUID: COrFhc2xQ52W1UFf4QP3Eg==
X-CSE-MsgGUID: Kt93skD9TBKgZDyLTZA4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78353728"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="78353728"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:26:49 -0700
X-CSE-ConnectionGUID: TBSWd9mqRkCy5MMzBhUHxg==
X-CSE-MsgGUID: b2id4E6IQ2yggfINJGDVgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="259026688"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.224])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:26:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1BBB311F7D8;
	Fri, 13 Mar 2026 12:28:45 +0200 (EET)
Date: Fri, 13 Mar 2026 12:28:45 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "luo.liu" <luo.liu.linux@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media:v4l2-async:debugfs for registered subdevices
Message-ID: <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313075824.2818713-1-luo.liu.linux@163.com>

Hi Luo,

On Fri, Mar 13, 2026 at 03:58:24PM +0800, luo.liu wrote:
> Add a new debugfs file "registered_subdevices" under the "v4l2-async"
> directory to display all registered subdevices in the subdev_list. This
> helps with debugging by providing a clear view of all currently registered
> V4L2 subdevices.

Could you elaborate a little how has providing this information over
debugfs helped you?

-- 
Regards,

Sakari Ailus
