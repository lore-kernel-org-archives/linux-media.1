Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91683475331
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326816; cv=none; b=kgXpajuUfDcsrfSbw8kZnVOJgNe/El1c8HObLEuFKpecLEAY9CCyGr9ykKVCMVfZIxZHfkAbNO2WYsRBYf9ey0dAED2uP2EP+teP+nwfied8+aTTJr5xaX/eZyCZpfDfP6/X/4aiVbBPGT4nU6Givgqr3UKQQfGAUlv/Vt0TXT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326816; c=relaxed/simple;
	bh=00sD8im+4srg0YH8Ei/UZR9rL/CK1NqTzCvWE4kbs8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjIhRKmSHBtjHnGFD+mfKYrRltzvS9ad4k2K8XjQQw6qVMLF6vJbN0hu6T9Y+0Ytjk14+4HE/qyz6Wf2A4h61Vc40adQfYZYu9TUw2g+vUiDJDItt4JQJokyh7pogpfuin2aUJ5nkRvllIO/gscf9TF3+GJ4mQ/jDsf7WSVy8Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPbsX/nk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPbsX/nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790326814; x=1821862814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=00sD8im+4srg0YH8Ei/UZR9rL/CK1NqTzCvWE4kbs8w=;
  b=DPbsX/nk6e43UqKboj2J2fNt9YBnbCywA2NF5baHd7iT7f/yDIe+XmKJ
   OcGmblIZBkJLaiIkzhxPeknbC4SMUpn4gry31DLvYK1BtQFGTzNpFh4vF
   F2Ku/e8SYWQr0IwpFD9i9nGoGc89r1I4e98NOwXhM0dxglQBE39cr+pfa
   1RNhX8pGCi1XKcCgoYNCInIfLk5PSVHf+UaC0+HWNS2vQ9u9519TBoga7
   6HujaUE2kh9nMt5sTyrrfHa7weVeuLzYnMKuEJLxou6Gz+HqxrcmMHE1T
   YmzdyDF+4OAO0g3JrmaupxfxaSVwwF7PWBgxuPESVnZEex833UbbreHdE
   A==;
X-CSE-ConnectionGUID: y/c6V+qpRc603Kms7iIrIQ==
X-CSE-MsgGUID: mZOAube3QcGXkau+TfFFIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116638078"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116638078"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:00:14 -0700
X-CSE-ConnectionGUID: jp5v3QdVSNK0LE5cXz2riQ==
X-CSE-MsgGUID: ac95kZzRQmWX8+aLlGidiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="300543736"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:00:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C0F0211F84B;
	Fri, 25 Sep 2026 12:00:12 +0300 (EEST)
Date: Fri, 25 Sep 2026 12:00:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	linux-media@vger.kernel.org
Subject: Re: [RFC] ipu-bridge: supplying a vendor-prefixed property
Message-ID: <arY4HDSQZYAGJwYR@kekkonen.localdomain>
References: <20260924215857.48545-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924215857.48545-1-lsa.uz@pm.me>

Hi Sergey,

On Thu, Sep 24, 2026 at 09:59:02PM +0000, Sergey Lebedev wrote:
> The one thing that stops me: every property ipu-bridge supplies today is
> a generic name, and "st,leds" is not. The two ways I can see are
> 
>   - a vendor-prefixed property is fine in a software node ipu-bridge
>     builds, and I add it beside rotation; or

I'm fine with putting that st,leds property there, to the end of the list.
If we get much more of these, we can revisit the topic. But I think there
won't be many, this is rather special. But overall, I prefer keeping the
ugly things in the ipu-brudge (or int3742) rather than polluting all sensor
drivers with this -- there's just one ipu-bridge but almost 100 sensor
drivers.

-- 
Regards,

Sakari Ailus
