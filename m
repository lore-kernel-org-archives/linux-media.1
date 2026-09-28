Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132BC4ACC61
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597308; cv=none; b=S7gbAhlVTkVF8nFMfu5IV3oyb/CHd+qtOaeKusNWCuYUDQMmKfZk65VvQgtcrboTFijRa+AhOhJY1st265L4ub0ZFjvwc8apxtjJvMMWisLFF5Sxw7k8iPgIn6J6+bbPfWR7DG3tAOnsUJ+hpMFzM5Qv37auilofzUS8vAsy+pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597308; c=relaxed/simple;
	bh=IsNVdutoJNzV9P4x6uy/hpCuTjZ19JmkQgTV2u4yYW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q88cM3106+NbhGQUiDZtFm1o8mizG+Nb/q6/IVHRxovme8h5GYFrzow+nLM8zC+xo3+JQjr/bh6uxnJfehSg8wLPJJZSSzU2wZDF1Doj+sTRvZAOdhbqEeB+a2ob2wck8+qinsow8Q2lNB7pU2xQJESjDlpYkuME4yMZAiPBKhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtJ/qT5U; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtJ/qT5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790597307; x=1822133307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IsNVdutoJNzV9P4x6uy/hpCuTjZ19JmkQgTV2u4yYW8=;
  b=PtJ/qT5UUiRt/ZASQTvOvU0Mahdmkr8Pg9sx6PVOmAGWVJHOOZEARZv7
   y7UXg0IZMbMPK0kGTKNvgk1Z/6vrhmACWXxBH8sfQy9MwVvd+TuP2j8jC
   wf59+zVHUHccglFHU6RoJVQjSUZRbro4Y97EPV8913rK5fB3foFqth0ET
   qCWfNCnwe58TAcjJGTp4EAwXMLXmlKqPHkdLhUsnLGokunA2Ds0fVs7fU
   B9IQGpeqwp0b/CN1qpLlQ2vztJ1bbDnfXaZ/RanImjJTdV8UF4bbzoowJ
   IYweX9D+KRozXpNhLZ//YsueGb8GQ2m6mE2hebdW4sco/SiZjqfU2z9yH
   Q==;
X-CSE-ConnectionGUID: /E3vsUPUTH6IY9uizjt8eQ==
X-CSE-MsgGUID: 32TjkAIARMmBe59tnUR8Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="94174737"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="94174737"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:08:27 -0700
X-CSE-ConnectionGUID: qyjHwViCTqq6UMqXYnNFWg==
X-CSE-MsgGUID: KZw8OQNtSBGm0JvuWPAAoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274157345"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:08:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 864C2121B96;
	Mon, 28 Sep 2026 15:08:27 +0300 (EEST)
Date: Mon, 28 Sep 2026 15:08:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Manik Bajpai <manik.bajpai@intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: Re: [PATCH v1 4/4] media: ipu6: Fix NULL deref in
 ipu6_mmu_iova_to_phys()
Message-ID: <arpYuzb0yJinlDyH@kekkonen.localdomain>
References: <20260928115646.77399-1-manik.bajpai@intel.com>
 <20260928115646.77399-5-manik.bajpai@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928115646.77399-5-manik.bajpai@intel.com>

Hi Manik,

On Mon, Sep 28, 2026 at 05:26:46PM +0530, Manik Bajpai wrote:
> ipu6_mmu_iova_to_phys() looked up the L2 page table for the given iova
> and dereferenced it immediately, without checking whether the
> corresponding L1 entry is actually mapped. l2_map() and l2_unmap()
> already guard the equivalent lookup by checking the L1 entry against
> mmu_info->dummy_l2_pteval before touching l2_pts[].
> 
> An unmapped iova (e.g. a stale address passed from a debug path)
> would dereference an invalid pointer and crash.
> 
> Add the same "is this L1 entry mapped" check used by l2_map()/
> l2_unmap(), returning 0 for an unmapped iova instead of crashing.

Have you observed this somewhere? I guess it shouldn't happen, but if it
has happened, I think we should add a Fixes: tag and Cc: stable here.

-- 
Regards,

Sakari Ailus
