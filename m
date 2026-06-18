Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187E3CA48C;
	Thu, 18 Jun 2026 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783251; cv=none; b=lRh2kZikm7uE7cpq89jJQuMDesZZg5de/J3nFm58Tjsrz6ViOwgDVepjq0bH+OaxBCgLO5WJX1bm1i5i+JxRQSuUqXwSHCIqWZp1KeWKExcQvaHc2F3urtDlaZMV/5bYmdz7CvsoTLuJh9Bh6crYD8q3JyD/BF2z6mNXueRrIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783251; c=relaxed/simple;
	bh=2AyTVEOcfIplggsOzRpCQy1y0t5E3yfRbiMIkx3K1Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJNyKBdyCN3oL/w2n7Qd3esFEjgWVYvvHHIOniZqQL6YoPbgkD2i6R3swQZU4ACHZehJojtxEXHfth7n1gN/yvXBJhtenwFJilk/GsjgGDXddSF96Ip6mj9Wu5SsdjDmm6tx41cC9ijAvjf96qC09YcLXjAfo8EhSmz6CZh/UXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d62vWRH0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d62vWRH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781783250; x=1813319250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2AyTVEOcfIplggsOzRpCQy1y0t5E3yfRbiMIkx3K1Wc=;
  b=d62vWRH0jcvVKRGRR5ZW3TaoKhLBQRTVL5RciQKiLE26evg7nkbAFQkO
   tNb5jF91xTuu+p/JT+l6tatL4hZZenpPhNCbfJaZj6GPi4cUpMMP9ZYGj
   rnRhp+31f4muY8+t8PueTkaiKm7uq1Yne/wBD342acNRB+KxdO94CP/Sk
   5Sqh+vF/ei6Nz/B3Fn8y1XY+v7wYJd+BKcYki5RyZJzNKYLLKEQZiCefp
   +w5Sska19uEXyA/dZPWwur/EauL3SWkPEA+kKIeRm+7PGaM358CAsz3Wk
   OkrB5hEhiffuI1pDc71t0h5mtOQ6v+z6C9cDEwu62mguSvpPue7f8gYYA
   A==;
X-CSE-ConnectionGUID: hgpTPQB2QIyR+E6OSwK0HQ==
X-CSE-MsgGUID: w1CEQthBTBSQy4DToQg4tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86293066"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="86293066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:47:29 -0700
X-CSE-ConnectionGUID: vs5gv65vQ6CdD8E8RulLiw==
X-CSE-MsgGUID: xiqVDC6hS/qlo/AeqHwgEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="252245369"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.24])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:47:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EF1CB121C36;
	Thu, 18 Jun 2026 14:47:23 +0300 (EEST)
Date: Thu, 18 Jun 2026 14:47:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: laurent.pinchart@ideasonboard.com,
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
Message-ID: <ajPay8NJ233yuCLJ@kekkonen.localdomain>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>

Hi Elgin,

On Fri, Apr 24, 2026 at 02:55:47PM +0530, Elgin Perumbilly wrote:
> From: Tarang Raval <tarang.raval@siliconsignals.io>
> 
> Add crop support to os02g10 by implementing .set_selection() and
> storing the crop rectangle in subdev state.
> 
> Initialize the default crop to the active area, make set_fmt() use the
> current crop, and update the output format when the crop size changes.
> Also program the sensor window from the active crop/format state instead
> of using the fixed supported_modes entry.
> 
> This allows userspace to configure the sensor crop window explicitly.

Please wait for the Common Raw Sensor Model patches to be merged before
adding this -- we don't have an established way to configure cropping
before that. Some drivers might do something but it's all a bit haphazard.

-- 
Kind regards,

Sakari Ailus
