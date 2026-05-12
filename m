Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F05384CF3;
	Tue, 12 May 2026 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613161; cv=none; b=VpkczhhejawF6tmcGtLmvB0BdZpklg+vhy2HFcelhhQwNEkv+nj33YdwKNDi6Xxv0ZqERp6/6IvB2+tP+F2nevFLtGUBmFd3ibbJLanuiHeHWGU54xQFsgEUwAT0pWeDsm3+oPjXE/nOpx0jHhnqFIqBmlKYYCb/ZSGw+RrE6sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613161; c=relaxed/simple;
	bh=8BjGPrnQM70b57w1jGZJVBmSrPOyLceL5ySQyt4/yEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aq/XD0gc0ibf6fHLVqBPdTKxrsBp6b6/uHcc/hOr6g+8bYRe7i9+z01kijsiPWvcRIJywkY5Hq/ZqRdVVDqACGJf/I4+VgIXZy7E0dM2riALUX/3egB6lOJ6deP9r8EkDc39rKTKafUredTPrgWz7NxbGP8ddqiAgDsZ0jqK4vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LH7EGeHO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LH7EGeHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778613158; x=1810149158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8BjGPrnQM70b57w1jGZJVBmSrPOyLceL5ySQyt4/yEQ=;
  b=LH7EGeHOEqEow68U6YVdoxW3Z2/Rq+Jch9htjiHb8HNcf8fJ4uDUYpgp
   s5yuallXn08ofFL6EhF7BdsEvucTmpL0IYOK8i2j0AXbJgJmkLTzk0CBw
   SsORV7+FJRGBdeIC/8YuYOOavyRsmRMs5eoa7+rXCceaadLp/kONsuDRA
   vV3T9strA3l009yVkBKPwPEiMvIpF1Oafp7k36Y+h44H0f1yE2VHkzF5I
   8/fnIGL3TwsU2u05YXCKFpi/uANbooZqfcn3H8Hlhd/x9YFG3H3E229/f
   bMU0yC/5WArPAIYZY/P63Cn2BiMscH2Mo8DR/T9kTtVNKA3CS9Q5BFDOf
   w==;
X-CSE-ConnectionGUID: HEjP3yBeRBOcKg1xL+JtJg==
X-CSE-MsgGUID: SLUzmQxaTvSHIlF7AWDeYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89835024"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="89835024"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:12:37 -0700
X-CSE-ConnectionGUID: tP23t8gURMyztcvxawApOw==
X-CSE-MsgGUID: i6EKHiaiRhuQzevfyJPAQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="241869370"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:12:35 -0700
Date: Tue, 12 May 2026 22:12:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Melih Emik <melihemik@noirlang.tr>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] atomisp: replace dbg_func parameter with dynamic debug
Message-ID: <agN7odzJiulkNckJ@ashevche-desk.local>
References: <CAHp75VebM9wwKpjnZKEGVvwA=TfmF4MDDuYssNAFWDnXsXyRTw@mail.gmail.com>
 <20260512180958.18098-1-melihemik@noirlang.tr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512180958.18098-1-melihemik@noirlang.tr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 12, 2026 at 09:09:58PM +0300, Melih Emik wrote:
> The dbg_func module parameter in atomisp_v4l2.c toggles the CSS
> debug_print callback through a writable module parameter. Removing only
> the parameter drops the runtime switch that users had through sysfs.
> 
> Keep the debug path available at runtime by routing CSS debug output
> through dynamic debug instead. The callback remains installed, but its
> output is controlled by the dynamic debug callsite. CSS error output
> continues to use vprintk().
> 
> Remove the obsolete parameter, its global state and the unused get/set
> helpers.

Okay, this is the move to the right direction (however we leave dbg_level for
whatever it means).

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


