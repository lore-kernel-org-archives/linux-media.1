Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD4264A65;
	Tue,  7 Apr 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543738; cv=none; b=UggoYBAPJj7QhYVJjSzCSXOpEk1rmIL6y3xT0eBGg6LLMhh3t/7dAmfk7HH86kvkg9ndviDHzwYQrsqbQeHXjJIxgQm9S292gwsoFBono/OjSn5+Jt0OTFNu0K3GNz+7tsVi6FtWfmZoqW7Pi41C5JYkrbc+jl4QVeqWtmQuqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543738; c=relaxed/simple;
	bh=/AyfRzbMhmR3sUp54dDUaJ9/uRxwkMu1xJmuIBNQkFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0OtEYVlAtJREn/nb+LlBFw5EKpwoLb3bgodO7F8sbHXsNj+mdYDe97NUm02jKQ64jLnUQzq/zKG7AxHPvyLaZAbcfkJmhnC9xAhLhr45/u63rRElXZffzkwSTFw3tazeOaxzrf37GvC1kpNiPXvH3431dCg3/3EslUVuCOYLA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzMVjEla; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzMVjEla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775543737; x=1807079737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/AyfRzbMhmR3sUp54dDUaJ9/uRxwkMu1xJmuIBNQkFM=;
  b=EzMVjElaoqaDWAdqbfrdDyCI3rvKZZ9EX68MCWfqVytRMuo+9W/7LSgW
   Uj4EAjQq8zMIMDOBINcThHi5M1HXkZUTzEbEjJQPsubL/P0RIkEvf/e8j
   PLF/cHeqsTBs8BkfJ12doI8zXicm/q3KDwcNTYdJ1HFLMDKA8pwgBO9Za
   csD7ECsS60nInzaGKUerjI4zl76OzBZJUMDoYMZrBcb2W2SV8favlqwJO
   4qc+mYx6H7IipOyri6xze/lPnUbiC+hWTsUIzvauUE5XVR2vPa9y6KTMu
   Fmf+Za6KcUjrpk9kLo6lIaYanu6S+Ialunu2HbA+kSjx+6sVQATQ2/4Pf
   g==;
X-CSE-ConnectionGUID: y4rmzuawRua8sm4K7/sJcA==
X-CSE-MsgGUID: LdMO+99PTkyaBkdJZr8yDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76395718"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76395718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:35:37 -0700
X-CSE-ConnectionGUID: PJCVQdVMSAGo9Up32AO8Zw==
X-CSE-MsgGUID: UhwZPLkET1atF3vAFZh5bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="232116306"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.123])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:35:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1F27E12080D;
	Tue, 07 Apr 2026 09:35:46 +0300 (EEST)
Date: Tue, 7 Apr 2026 09:35:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: "Du, Bin" <Bin.Du@amd.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sultan@kerneltoast.com" <sultan@kerneltoast.com>,
	"Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
	"Li, King" <King.Li@amd.com>,
	"gjorgji.rosikopulos@amd.com" <gjorgji.rosikopulos@amd.com>,
	"Jawich, Phil" <Phil.Jawich@amd.com>,
	"Antony, Dominic" <Dominic.Antony@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	"Tsao, Anson" <anson.tsao@amd.com>
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
Message-ID: <adSlwqPVF81feLHx@kekkonen.localdomain>
References: <20260320084146.200988-1-Bin.Du@amd.com>
 <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
 <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>

Hi Bin,

On Fri, Apr 03, 2026 at 03:17:18AM +0000, Du, Bin wrote:
> Hi Laurent and Sakari,
> 
> Just a gentle reminder regarding the review request below. When you have 
> a moment, I would appreciate it if you could take a look at this patch 
> series. Your feedback would be very helpful to ensure the changes align 
> with upstream expectations and maintainability.
> Thank you very much for your time and support.

The set is in my tree (amdisp4 branch) and I intend to send a PR for 7.2
once we have rc1 in the media tree (or whatever process we manage to get
working by then).

I updated the state in patchwork, too. I understand
<20260303224433.87242-1-kinncj@gmail.com> isn't needed, is that right?

-- 
Kind regards,

Sakari Ailus
