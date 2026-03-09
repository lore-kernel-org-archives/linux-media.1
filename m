Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30C92C08D0;
	Mon,  9 Mar 2026 13:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062998; cv=none; b=OadS88a2kfgs58hpb/OA2TKyCdueYG9Q+ZRajiUrY15FeVmqHxS9ZPjji66rmqp0r6gGltSSefl6UldTs1Yolwzxd5aN4DwQL1p9Z3WA41ur9utFFgZB52c6ezUhsi4jDMgN2fk1OXc6JifqW5rCdloymJ7onEFNJkb1Xv/XpEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062998; c=relaxed/simple;
	bh=sfeAM/gsaybKWxBrmZwFsQfi3no1u2UYlvLFV/QT3CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnxHmX8H0UONlHJfbX4eXL4O6kXQckby9IBHAA7kqBIJhS2V2sdDeLk+7JTwT1LMBXG2uCzDctCf70DUFdmDD0mfZzndWSm6u8188l0HI4KxP2FEcjV/1lHXeIB49S8BXJcvSwBEWaQNVmiKB6WXoJGU9wihXkXlvhpYfKyMe9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrzcsVQV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrzcsVQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773062996; x=1804598996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sfeAM/gsaybKWxBrmZwFsQfi3no1u2UYlvLFV/QT3CA=;
  b=QrzcsVQV3PZ8IyoZw8a3jQzPrTeTOACMrwEgU7AAHPmpJWzNSN5HkyhO
   3pgmZTa18SgVwwtRiczBfRuyIOKZMvgYr14T19eGUD34HxsBy72Rbyrzr
   UyNmsmg0Otx0s6S77EBbPQW0ZCUEsIKr7afUSJ4uJMPreqkC9p4OhBfCk
   PUZn7oYq+dGs8cyGGmHdwEXbxoXx/goG56OM8P5lvG4E0EQqzWmfNKY8i
   4RPHETS7wK6WIWFitd1HVMIvB5xClJCmxocQ3fhqHNhDtjiIHC5nwNd4C
   7PknWZ/uAyfJqu9Whl0gEwVZDQXjQI4GL0UQ5W6PGc8tDjiMmyrirlhMv
   A==;
X-CSE-ConnectionGUID: O+jl6wlXR0mEUHMM1ww4LQ==
X-CSE-MsgGUID: prrQnSzpRdKxYrCnP1kFVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="61653025"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="61653025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 06:29:55 -0700
X-CSE-ConnectionGUID: ZkM+BkBWSnaAnO983jVyPw==
X-CSE-MsgGUID: OSvLrP7PQPq38OQiN/Jztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218961986"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 06:29:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 55052121D1F;
	Mon, 09 Mar 2026 15:30:23 +0200 (EET)
Date: Mon, 9 Mar 2026 15:30:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: intel/ipu6: fix error pointer dereference
Message-ID: <aa7LbxSuRfvyrr3T@kekkonen.localdomain>
References: <20260307030355.26840-1-ethantidmore06@gmail.com>
 <DGWCQ95L9FW0.11AOY3NZF4U2B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGWCQ95L9FW0.11AOY3NZF4U2B@gmail.com>

Hi Ethan,

On Sat, Mar 07, 2026 at 12:55:14AM -0600, Ethan Tidmore wrote:
> On Fri Mar 6, 2026 at 9:03 PM CST, Ethan Tidmore wrote:
> > In a error path isp->psys is confirmed to be an error pointer not NULL
> > so this condition is true and the error pointer is dereferenced. So
> > isp-psys should be set to NULL beforegoing to out_ipu6_bus_del_devices.
> 
> Just noticed typo "beforegoing", will send v3 correcting this.

No need to; I did that while applying the patch.

Thanks!

-- 
Regards,

Sakari Ailus
