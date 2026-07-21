Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BCD3346A6;
	Tue, 21 Jul 2026 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655615; cv=none; b=F69ftFcO6YPfYYnNnRqE95dxJ3VkKEEvvcfCZidCMrNQRbHvf8eej6j/aLfIIo++eFvICMyQKg1m/AJ+50T8Y0WtNs3H8ofwha/S0WlRFhZFYY0ADE09RKsH3lGCtw9viV8/6NXkdCk14vtEdacXahrc+HvMqMqjzGSHp9991IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655615; c=relaxed/simple;
	bh=wmIFYJvuNsQafMbNOtPUvM/W89wHi73tTnpw+M/q93w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4fGNWpG/1hNTJaWybw8mVRY0mwguhdaYsvp/KwgNungCzg/62MC4OmfxUpdh5kCyVNZxajz5VL6agjtEycKIfdpedCZBhdkcNzT5kYLEyjoi6tDEYKliFn+Bv5cuHfMumZLO0qoW8CL9Ji3JMxNbqjngQGkgVQ3m/VaVTf7BBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHhchgib; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHhchgib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784655614; x=1816191614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wmIFYJvuNsQafMbNOtPUvM/W89wHi73tTnpw+M/q93w=;
  b=mHhchgibHkqQPVbqtjxuLQmDLa+vQDZC3xTN3c2aQHlUxeyeLbiEhysL
   ga29Tz27eQfZR1okVPKwA1JlbGQG/cvYetoscgTDxC87qOUN+WG8J5XPk
   4T9riEj/Wvo219rciw+0p0mdmLMxN1B1JfQKOSJuMyVJRVOsTINsWRXGI
   dCabKIUldTgIK6dKxNr0UiPwY3ioXcd9l8JkTIkbFXHf6VLjM/BBmIm/9
   G05i+w+eLYpRZiuKCLttFqA9HdhWJut0qax31Hgs/9NVB0Svl7AJHm72/
   c/9lMbGOjzXN+OgKkjrvbNOL6nmMk8njmMRkUnqio8j4VjAW32DmH860f
   Q==;
X-CSE-ConnectionGUID: fnXSM5oCSHWfaRT7FCtgkA==
X-CSE-MsgGUID: gdEz6E+iSSuHMzZ9puHkZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95861257"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="95861257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:40:13 -0700
X-CSE-ConnectionGUID: clIHukOsT7mijMrYra1bSA==
X-CSE-MsgGUID: uaFXOTLHQaSHjyHOuyMHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="262110747"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.135])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:40:11 -0700
Date: Tue, 21 Jul 2026 19:40:02 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/17] media: i2c: os05b10: split common and
 mode-specific init registers
Message-ID: <al-uzz6Q2iPJ3gJD@mdjait-mobl>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-5-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718200912.16001-5-tarang.raval@siliconsignals.io>

Hi Tarang,

On Sun, Jul 19, 2026 at 01:38:55AM +0530, Tarang Raval wrote:
> Separate common initialization registers from mode-specific settings.
> Move resolution-dependent registers into a per-mode register list and
> program them during stream enable.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

--
Kind Regards
Mehdi Djait
