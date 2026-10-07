Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D856A40F75C
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 20:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406190; cv=none; b=P6hhgeTDeX9ZzAYQpEPnrNCSTzmFY7Xsd88Gm2RtWW/kTuZOu5VoNMGb/uM2Ew4IRm1Xtbl0ajfMbEXFL/oCESmwfM2PeF5rYIE9hhcUqeWHnu/5HH6HvSi4CJuj8BSFmgayHiRNS95TQEukw3otZUiV34mlnBsSqpOqwv6zFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406190; c=relaxed/simple;
	bh=cse9sC/s5QrI44Ci7DvOfeC6Zy7+z5Sf5yMaF7ZytBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrpX1GFh8BgKfbB8Xpg4ozCJU5tWaP5ObJqMkqPqO8s7d4BBVDAQRfc8wpDFQyf+g9Cz+lS60Q3yioUU7n5ZyoCze7PtZY/Gdn7obMEi2x4OGV49/edzqFknUOMzhM8Q8NiacwOe1OmK9brirxpQRYH5GeuAL4yFHZEYBxo0IdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhLFFOoB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhLFFOoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791406189; x=1822942189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cse9sC/s5QrI44Ci7DvOfeC6Zy7+z5Sf5yMaF7ZytBc=;
  b=IhLFFOoB9jkbyWxKIcRUKKbuZHSIYyX1SOW8F5XM9UaL5VgwXzfvioy2
   trEaoihLzQOs3QxolV+en1Zf/RIKEtuBXuUlFKpYwFwU3WLp1iFUQyEnd
   TueABveOmILxp1VU8wq26nFYcL8lNRdEXJs3bVgtYNps9BsKpwBqD7k9O
   OoZgYAVGWKXa7owRK/lfrnom+HyT7PDTrWeBhQCf0bsph118cOvONeNMg
   kr83154NNfPuuU7G8bRrlKwdVclPWWeemm6jNntvA1H/gkEooaaZY2rpt
   gZbJwuwC5LGU/rz7kNlP0do/9JNFySxoDkCDIlK6tRsmcc/KzS+13o0qj
   A==;
X-CSE-ConnectionGUID: ADhbCQMdSqmLICXm5ZPlAg==
X-CSE-MsgGUID: AkB7JtszSUOwPpk95cetoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="176838"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="176838"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:49:48 -0700
X-CSE-ConnectionGUID: 2wTyJQLjRKePxrbE//Oykw==
X-CSE-MsgGUID: 3VYHVCgoR/+j7sUfUlF0pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="137653"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:49:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6D5BE121BA5;
	Wed, 07 Oct 2026 23:49:47 +0300 (EEST)
Date: Wed, 7 Oct 2026 23:49:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"antti.laakso@linux.intel.com" <antti.laakso@linux.intel.com>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Message-ID: <asawa0An61oo2U37@kekkonen.localdomain>
References: <20261001061250.37734-1-sakari.ailus@linux.intel.com>
 <PN3P287MB1829F9B24FB03D373358AF358B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829F9B24FB03D373358AF358B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Wed, Oct 07, 2026 at 03:39:55PM +0000, Tarang Raval wrote:
> Hi Sakari, Hao,
> 
> I identified a few issues. Could you please check the comments below?

Thank you for the review. I'll address these in follow-up patches.

-- 
Regards,

Sakari Ailus
