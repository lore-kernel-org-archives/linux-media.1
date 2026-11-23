Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435378;
	b=g3FkYhHCv/CplKxSzf3gaAqO63MOGJTAdiDQNthTeQWfSWdWNvEgoFGbgjt3+kXvIQoT
	 AhzhnF+qWmVQ4uvqzUwpCMeRHUxeftISzFTBqsBnPD4fH6ZdUCpJe7eCAOb1ANvjLedEV
	 CIyDj9CHM5pI3nZj+8vwXiW4Gdi3webajs/+ZvlgiQOGytE/krTEFEpPYnLj2aoSKreiH
	 vcm4DM6X70SAEXRf6IikgwvLYIcJZxUGEeNMWKwNgu7Cu2yqtw8p80fIZ2XG4tCrlnBXa
	 jU/NlqujGoUapYnV+G8to3eTT9xfq9Fb5NdtGxdIII72wSh+LZxB5rjpQe3PY2mYjOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435378;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=iSUJ4w7HNsUA1AV5J8KfCtvntmRxWfaygmnZcXxE73s=;
	b=s43KoieSC5u/B2/MVGCOhGlKQZPSTIANY4EuXRaBB0K7BpsuKVsxf6coQbUPiJcEkPlj
	 z8pcX0gcHCTHDSGkIOgjXcWq7REYmv3CjBAb4AyBiR+2gnJn25DqICDaYua3fGxrtKXRH
	 ts74zvSHIhYdxXDQUDdtUDM8cc20vnpYganHPr0mJ2oTQX3JYzMjfBY7+CdqIFPsTt4qt
	 B6yj2g1kpZwJp+MFlDOIr/MW31QVNfs4k4yRImFFziHz8sI+6lAookRzi5+YpQujhWyOM
	 hL4lhBzpoVDOQ+zxe+gN5obfoOq2WZX05XGYd0EliIWLRJOaPwIJLCa+E/sI8k93ijQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hBNsdgqr;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E8B606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hBNsdgqr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795435378; x=1826971378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5iqAlGNfPRv5Uyfh3+gs/45AbHiOkl1utUZka5WIRI0=;
  b=hBNsdgqr8yy1goT7Y920qoUkl20mU/YmpP6YnnTfaQPSr73c+C7BSyBW
   v+0RLHYKRS5Ubnn0Q1T5D5pESEW4fYwHWW/RinQlhpwwL5nGW8a780LZ7
   LSezB7OYSqm/8fiDHzLshoPvHDPJvH3FkVXORzzdY/ZmWNBuDDvC3Fvs6
   Dd2VFOP7wwpdDbcTmTaG5nEB67rnWs8QGJFCv3Tm6db/u37r7EhB1mUlm
   iEjuTgyfKtfHBbnGaiHcN057Xj0JsxC9eh0i8+bTF0PtvNlofcVfe/cKf
   JLJS5+DLwFkLfSs8okpMkFWo26xc5VRNg6zhDjKNzyVhCRm8RdPOeQ6I8
   w==;
X-CSE-ConnectionGUID: 8b267tAZSmyaWSX1s/rjUQ==
X-CSE-MsgGUID: KGS0AEK+Qr2Y+AMTDUNYKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4137489"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4137489"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:02:28 -0800
X-CSE-ConnectionGUID: pdYP4nXETmSd9emBNHZYlA==
X-CSE-MsgGUID: mo0gdX3mSS2RgiOT7fp0jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11268227"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:02:26 -0800
Date: Mon, 23 Nov 2026 14:02:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: vunny.sodhi@intel.com
Cc: linux-drivers-review@eclists.intel.com, linux-media@vger.kernel.org
Subject: Re: [linux-drivers-review] [PATCH 1/3] media: i2c: max_serdes: fix
 uninitialized doubled_bpp on zero bpps
Message-ID: <awQrUJTFbaXXZvmi@ashevche-desk.local>
References: <20261122234313.327866-1-vunny.sodhi@intel.com>
 <20261122234313.327866-2-vunny.sodhi@intel.com>
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
In-Reply-To: <20261122234313.327866-2-vunny.sodhi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 07:43:11AM +0800, vunny.sodhi@intel.com wrote:
> 
> max_serdes_process_bpps() returns early when bpps is zero, leaving the
> caller's doubled_bpp uninitialized. Callers then read doubled_bpp and
> may act on garbage, misconfiguring double mode and data padding.
> 
> Initialize *doubled_bpp before the early return so callers always observe a
> valid value.

Why do you think it's not a caller's issue? Maybe the max_serdes_process_bpps()
has to return a (dedicated) error code in this case?

-- 
With Best Regards,
Andy Shevchenko


