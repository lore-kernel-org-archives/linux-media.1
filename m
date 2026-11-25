Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597842;
	b=ria49bbcNF+goafmJly8hUiAHctwxnAiysuN9ipiGIOwcximeazvhK1ufnRDQB4qNl6r
	 dRydIv9SVc/ClTZ1n/ZeSUGWJAXTrN99R77PzVlBrIIAiGKZEwVrjNUL2twkZLsuSGC4E
	 +FMuMFrJDPAVzVI5hog+4h7MLfd+KbC/9Ism6lNalo47wxu9Rb+ZrJ8mcI0VEBMxBG8Bp
	 YoALRiSaqaW2naxYBcfzzz3dDdg/39SO8aQo6YdG+6OlgwYbD+3jtMN9UQf/uhmO7qEz0
	 l6L8LHDh7mA+Nop44GjRbaTRPWVhgtuke5REBbHIi96KxHSJM3gIDcUiwYhGE1J+UfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597842;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NCdpM3lYLmW1+CJuRlqZci1R9M8SZdltum5UAnZZX60=;
	b=qS7IxXH18h8tpJ3urB+OnCJDobPSZRLjv54+sRDsnHYGXfGWf+1PcX1v9hpnIoR69EZA
	 G5iHfIkQ7/hSwSP7D27MFfyu0k8J8MbNpBJxZdBeTgn/7B+02eafVaSh8YPUqUme0Wl14
	 rt2NQ4NLroZC/tOdOC0PS3kFdqyX4FFhPclDjXkeQnYzLFlrQBMAKEZP/tQ2u7a8BVoJB
	 faUUEyN8yPgpksFSf5hA/lPI08GBAJwWWGNLYRTEK+yHKM0GZVkC6Cmsq2vbzbEx+z9gz
	 GQzKp260JJULtmk2cYsM7EFIU/v6loUHNkx/kh3HkSCt3ZyRzK2N1M3ZQ47OFyJqhkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LokNliiQ;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74075606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74075606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LokNliiQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795597841; x=1827133841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JDov9zzyvuQ9BfTqbjm2wIEFdZcFuJW74vJtlyELi2c=;
  b=LokNliiQv8AhWWXmp8xv8Z1Yrja8DYSXY1uIblmTqQ1NnV6frDCVAddn
   3RPXrWSAviow17WprrEJ/viN0W42ZwEky51FynNivxi9AWt1yEcIGyS4m
   /EIkg1/ZT8HnWQbHxaBk7UQxZjrN7wjYqBJGRFBrzJqNFY01a8lSCFywX
   Kh4VSsOYCxMbwTpDgmtIVvcLrMr/D8BQGk2CAZRAw/fC16wML/1DXTgnN
   ccyCNWmp4dNztlFSgOk7UVQbe4gN1mE1714LHZwf9ozEAJTLUtGTRM4M1
   B0zvd8vtTa/ATcUSkB6b57MYbX1QkFN+ZocEhMzk29uP2SXvSwtkzqlDW
   Q==;
X-CSE-ConnectionGUID: eh+NFF/FSZOI/3Qe4taXvg==
X-CSE-MsgGUID: wXwepKW1SWmISe0lkjjNsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4368852"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4368852"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:10:27 -0800
X-CSE-ConnectionGUID: S3zvZ3WaTIOD7UN6k+ZCfA==
X-CSE-MsgGUID: xieTa/vwRYGFoABiW4M0Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12028676"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:10:25 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AD68611F739;
	Wed, 25 Nov 2026 11:10:29 +0200 (EET)
Date: Wed, 25 Nov 2026 11:10:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tobias Wies <tobiaswies@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [BUG] media: ipu-bridge: HIMX1092 entry prevents IPU6 RGB camera
 from working when no HM1092 driver binds (Dell Precision 5680)
Message-ID: <awamBS3INWs2kydH@kekkonen.localdomain>
References: <CAN8C2X1qgNpFjKqS1GwZw8C8HkZQcMmpfmpy8chYnCBo0Y2hWg@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8C2X1qgNpFjKqS1GwZw8C8HkZQcMmpfmpy8chYnCBo0Y2hWg@mail.gmail.com>

Hi Tobias,

On Tue, Nov 24, 2026 at 09:31:09PM +0100, Tobias Wies wrote:
> Hi,
> 
> Since ipu-bridge gained an entry for the Himax HM1092 IR sensor
> ("media: ipu-bridge: Add Himax HM1092 IR sensor", 4fdb0342f05e),
> the RGB camera on my Dell Precision 5680 no longer works. The IPU6
> async notifier now waits for the HM1092, but no driver ever binds
> to it, so the notifier never completes and the sub-device node for
> the RGB sensor (ov02c10) is never created.

I believe this has been fixed by commit
7260f78c05051fdcfaf337eb1ebef69ec0436c3c in the fixes branch of the
media-committers tree (not yet in Linus's tree though).

-- 
Regards,

Sakari Ailus
