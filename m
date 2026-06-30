Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3CB37A481;
	Tue, 30 Jun 2026 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833243; cv=none; b=ZvoPUCzfeYLIiXth0z6XBsERMjS5sd8kOBxR1zsAXWUZnymYwQrVOZeoVbqX73ApupjB3NycNXtYmWahKLpC1QvxG60KsUut+8Qui/T/9HWfWplOcTp3tHVgF2B2ScvqV2Clad3CgzPji42+7qG61Lh2txXYpBCW6BJDgRdyl9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833243; c=relaxed/simple;
	bh=4ZvzZLTV0oZKhXvKeMSAuWkFYlim30RaWe2PRRPd2aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trbRmfl9vMmUlI3aNYXtgzevAF47MQn6rhFQNmvEMuccctnchM3TsEiw5pWQp9PaDpBhRjiG8B6Q5ZCds2SACC2tu9rmXbxDQStRtNc9LUag5bUOMV2IKSEZcQZhmTsnYkVJeG9mzHsouyhJN/vAE0NhGncRMrWQ3IVQOYA4CMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amk6F+8t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amk6F+8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782833240; x=1814369240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ZvzZLTV0oZKhXvKeMSAuWkFYlim30RaWe2PRRPd2aw=;
  b=amk6F+8tWb1q93VJs6nYx8IrBte21XLn6yLlUI91dN+cnhVnDAjTFJR9
   fqCGJvOfwl+Bhbwfho6zRPmZP66kIaufFMsfhgi2MmiBdkP+P8zfvju5c
   UbUNBnj1O/giPQzKvIDUOdXeSw7o2GX7hBGaImRazXyQirqEbr79zIG4M
   Cevidel6Z4vHdYV5NQXuHo+/XF7qC3LoIdWL94KLxHaYJfplHrf6f2gxZ
   p1y8kgg7DrmO41vaI3GWnWjk2YxT9BqBJXI2RE74R9f8QsbA74Km3AFyX
   wrHhTzTOdUXgLcs/y6afgdpL9zABp2G3Nm/lEiBj1FtS7HGRUwiH/WTfO
   g==;
X-CSE-ConnectionGUID: Xm14JlahQ1uxf2ZaQc638Q==
X-CSE-MsgGUID: IRcKERVcSnyW/nAt7+4Alw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83577764"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83577764"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:27:19 -0700
X-CSE-ConnectionGUID: PAQ7cBfaRR6nnHwXmeXnhg==
X-CSE-MsgGUID: /wEwOQ3VSwWh45jB8JkNoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="255884125"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.241])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:27:17 -0700
Date: Tue, 30 Jun 2026 17:27:09 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/15] media: i2c: os05b10: add V4L2 digital gain
 control
Message-ID: <akPgL7EX95O_iEi9@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-6-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-6-tarang.raval@siliconsignals.io>

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:51PM +0530, Tarang Raval wrote:
> Stop programming digital gain in the common register sequence and expose it as
> a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
> in the ctrl callback.

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com> 

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

--
Kind Regards
Mehdi Djait
