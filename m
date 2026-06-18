Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBBD280A56;
	Thu, 18 Jun 2026 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789851; cv=none; b=pjL7Wj5dc9VgEEAPxnZVJ1VqsZlDUr8jgOjqYc/DGhQFRjWQj7gDo7ivm7fY0u6FwcyKyI3Mm5uHCTGGo2cyR8rIrL9qHVxZ8WHlG8aJ/v2ySH3KOon92RiVNwc02fQyxWhrU9LFZ73hJob5zK7jjrUBYXni3t0DfCgciRrZFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789851; c=relaxed/simple;
	bh=m50LHDfLbb5Qwx25ciboTF+H3SvHjec/c6kYVPwGNjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RncTR2QNdyd341BmvrqiX9iU/clOXqQ5UndL+Ww6NM+/tErgtaC/KzF2THn594VXS6xAbFD9T3gFsKinwdJEo0/wc1mo9hkwXsQe/suBYEwXq23/0esLoJR9G+dByq4QIbkG6OQ6JL3wgbCto0e4PrhjZuIGlNOYD44OimnXH+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0295Cte; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0295Cte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781789850; x=1813325850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m50LHDfLbb5Qwx25ciboTF+H3SvHjec/c6kYVPwGNjc=;
  b=S0295CteOB4KvRVckMNZpctkL0uJUYhFHqdyYhWwdAMLYrMhlUk3GXIr
   NIMGAneOnWRQS7DJr85ZXKMqO0lIGdtMD3d44ce+MyZ9ct6Znu+Y4wDLq
   b2v/kEjUguoQ9u73Q+bOCvwlBUHXCyu2Bvk0TMfZ++tzhTcaTil4dGcUg
   geMxc53jgPPJdo9ZfKcHsvo0maPL3GaX6103wUQ3mhCoqms1KknsBESnk
   EmB+nR3hpEZHi25pcIUSrPiL9h8h0VWflPg2Ru/W9UDQtR3GuNKmVw3ZS
   H9bIiV+2AkGs5bXE8bMYnZvbxCUUtN7xjoP9lFU9990p9OnmPAHALT388
   A==;
X-CSE-ConnectionGUID: +Qc9gg9MQM6kqc+HWwrXDw==
X-CSE-MsgGUID: ZxElzJTFSjKTxTNwK2ngUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82625811"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82625811"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:37:17 -0700
X-CSE-ConnectionGUID: 91XW35L1SDafMlxqJNyfQQ==
X-CSE-MsgGUID: lMZgLzi/SKiAm9A4DbwPDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248452594"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.107])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:36:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A1A40120A2F;
	Thu, 18 Jun 2026 16:36:14 +0300 (EEST)
Date: Thu, 18 Jun 2026 16:36:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Message-ID: <ajP0TtXuQhx40pbU@kekkonen.localdomain>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
 <ajPay8NJ233yuCLJ@kekkonen.localdomain>
 <20260618130253.GF3345533@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618130253.GF3345533@killaraus.ideasonboard.com>

Hi Laurent,

On Thu, Jun 18, 2026 at 04:02:53PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 18, 2026 at 02:47:23PM +0300, Sakari Ailus wrote:
> > Hi Elgin,
> > 
> > On Fri, Apr 24, 2026 at 02:55:47PM +0530, Elgin Perumbilly wrote:
> > > From: Tarang Raval <tarang.raval@siliconsignals.io>
> > > 
> > > Add crop support to os02g10 by implementing .set_selection() and
> > > storing the crop rectangle in subdev state.
> > > 
> > > Initialize the default crop to the active area, make set_fmt() use the
> > > current crop, and update the output format when the crop size changes.
> > > Also program the sensor window from the active crop/format state instead
> > > of using the fixed supported_modes entry.
> > > 
> > > This allows userspace to configure the sensor crop window explicitly.
> > 
> > Please wait for the Common Raw Sensor Model patches to be merged before
> > adding this -- we don't have an established way to configure cropping
> > before that. Some drivers might do something but it's all a bit haphazard.
> 
> Does it mean we should wait for the raw sensor model to merge this
> driver ?

I only suggested this for the 3rd patch.

> 
> Many existing drivers configure analog crop the same way, through the
> crop selection rectangle on the source pad. Is there harm in doing so
> already ? I wouldn't enable binning and skipping yet, that I agree with.

Which ones?

-- 
Regards,

Sakari Ailus
