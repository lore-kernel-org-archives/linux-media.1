Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59525331EC4;
	Tue, 30 Jun 2026 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833051; cv=none; b=btXDhJFX/u/GjKUBm09XQY/wx0NTBWvPm6axuOpdPKl5Z2vaJsBVxNom35jr8TIbpSsc3IQUx2PPE7QN5V/w1U0BftXlaRGbtOSJ/5eRLPVCeSe/rRHe1PCPBNbf/p3fiTQQZIEwa+dyZ18GyBEX4NNVE9iIgOPEgyLw4CGht/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833051; c=relaxed/simple;
	bh=rffeOx1ZNGZ/71pnrS5g5M7MX9Nh/43FzsVfPNKxPXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbizKhPsZOyFsY2l+EJRrYKmJZ7Q21cO6TgrH/pnKsFmuQO+cOUTH/XIFeu+ahAMmVYYb7rAmqeRPxQtFHJhesQKvaw1mQ4B/Nlf6eNem7y4OK8KFpaWwKigoXimzQ2a0b4mnDXxPosXG6/KJGGUZwNCAwPRrYeq2Xm4NiuxOpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8WYt1Ll; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8WYt1Ll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782833050; x=1814369050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rffeOx1ZNGZ/71pnrS5g5M7MX9Nh/43FzsVfPNKxPXo=;
  b=f8WYt1LlplxgSXrvhX+Vy7hKvTDjUpq8sUrNa3CNP3L5+V3nKhrEMQHU
   9nwvRuiyPGVEPPxU45RX6AszO47po5AXdbVNwPe2Vs7JlOD3LPV8Z0PTJ
   f+inO5qsbiFq820RyiCpXh4xsVdpY0RNVv8nn0OwUtEUeVAQbNt2f/0QG
   WOZd+WCQTBY6ALDxbKgjiUJRad0dn/qlXVvWXun2Aqs2wCnBydUU2bR5X
   ykzDeizoBMFRv8yNztwwbRctyDtbe4qIEMiQclPJn9QF7s4AG1frPwjeP
   l6qQZ5akwyeYPSvhEo6WJrQU1LUdT6ez/BeOgvlMkRXQIUK/Crxz0Y57I
   w==;
X-CSE-ConnectionGUID: 3GpNtapRQie6Jr3uOtlYqA==
X-CSE-MsgGUID: nOLVOUXfSuW35Lt/bI7MJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="95053253"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="95053253"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:24:10 -0700
X-CSE-ConnectionGUID: sKtIce60T7OZ38UwmOE+Qw==
X-CSE-MsgGUID: LzRQ8voRSf24oUL9Ro6r1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="254200766"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:24:07 -0700
Date: Tue, 30 Jun 2026 17:24:00 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/15] media: i2c: os05b10: split common and
 mode-specific init registers
Message-ID: <akPfZLgX7zTVWt_6@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-5-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-5-tarang.raval@siliconsignals.io>

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:50PM +0530, Tarang Raval wrote:
> Separate common initialization registers from mode-specific settings.
> Move resolution-dependent registers into a per-mode register list and
> program them during stream enable.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

--
Kind Regards
Mehdi Djait
