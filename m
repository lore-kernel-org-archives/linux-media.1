Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832239;
	b=FYWEeL0BENkSPEy+3nZnD3jO6eau2M74sGjiEYrV1hPxrOI2Rua9ROqmtqgz4Z8iBxM3
	 itF6Nhntfl/fMEqM05+5aAhHyNsnNWxEVihhFq0DWyPbrUxJ+abvVcKlRxmZQMeNHB4DB
	 BA45poG8en3lNfgbJE3hK/q5CUJ1RecNtG/GNB0Mvcd6AFbWRriXAWou2vLVyoldu9qN7
	 JAy7y7p2h/gra8fqeG0xcv7gxahW7r6CCKV+ycuVfFBqWslDKE75roeUiReqnwScJzvJR
	 iOLRXHR2xRa+9GG1UkPniI4+g1ZQDCysxpuMX65nSphhe2nMUyFOKsSQwDBTgkCdpbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832239;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jDA1aAyVWnjIq9Fx+EcQb5MTRyxEyXEOxEhq5crV9ng=;
	b=0WHL4rhVMviYifipfJxmIgMhFiYkr7eMZYS1X0OKPKtkO2JcxOpR/U9TKWqMhHN9yq7l
	 1Dxx98yTPm70R8TPVZKvakd3JlXeCdVL85cL11GDyCh9a3RJnORUCLGaMROn4VeMTqQTZ
	 jKZvFJhx8oK1I8sjXeCJ1YawkUiMJX/6BzgQwk5+FCxtDs9jcEYyt1eEYJtPPsAOxQ2+D
	 UyMZ113u2cw8FnbnzVE/nWhI8Q2IB5RuBTBJ8FeuQnBWTBG0bNi2YxHVUK6x0WVxnwT0Z
	 qcFQqKqsdPVskHReK29j2bwQE1+zpcshVv0Fm/Qd/FHndGAXvxtlZ6oVrInFSd5gmvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="a0yyjrR/";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38928606A33E
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38928606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a0yyjrR/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794832239; x=1826368239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ezBTxSBfjry/aQXug3ZwuT/PeEoF3iaNrKnCglXQhWA=;
  b=a0yyjrR/TXiEk/M75rWKEHwIij8sHvT6EAnMaZsKWsc8TX5C1igqj6Ul
   GU4auLTBzNPcE0bPrtL7LPo385/SnHccGiBfJYHP6et4q93E/lA10Bz82
   C9T74o2deiumQjsSIlk1sbSpgZUwz4omRSPnE5tC9kbLk1phzN9+SSAEE
   IaMgo5BnUokePV96IHFoQenfaujrYDqegklHQ6g/7KdRx0BkTrRzF9vgQ
   S7WJSfNNzvjACZBNDH1JXq6OF8pcMsE4JPzyDFz8ML/lQpAAJdLJjU7Jg
   si9CErf+cMlviBMIkHb8KJE9g1LtLbpQs9nGM6mBrkjPdb8Onbnpx8quY
   Q==;
X-CSE-ConnectionGUID: FZ5fvUPYTNatfJPfpeNKiw==
X-CSE-MsgGUID: +4T7Hv8oS/2eCioEzG5LOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3607389"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3607389"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:30:39 -0800
X-CSE-ConnectionGUID: MY9mhSAYQkqQck3vbU4EMQ==
X-CSE-MsgGUID: X1Z1xFGqRH6Y2yAI42pxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9375085"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:30:37 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 69852121B5D;
	Mon, 16 Nov 2026 14:30:41 +0200 (EET)
Date: Mon, 16 Nov 2026 14:30:41 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jimmy Su <jimmy.su@intel.com>
Cc: linux-media@vger.kernel.org, serin.yeh@intel.com, vicamo@gmail.com,
	sarang.sapre@intel.com
Subject: Re: [PATCH v1 1/2] media: ipu-bridge: extend upside-down matching
 with DSM module IDs
Message-ID: <avr3cTli70qfUMnw@kekkonen.localdomain>
References: <20261007034914.1654831-1-jimmy.su@intel.com>
 <20261007034914.1654831-2-jimmy.su@intel.com>
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
In-Reply-To: <20261007034914.1654831-2-jimmy.su@intel.com>

Hi Jimmy,

On Wed, Oct 07, 2026 at 11:49:13AM +0800, Jimmy Su wrote:
> The existing upside-down sensor detection relies on sensor HID matching.
> However, some platforms may source camera modules from multiple vendors.
> While the sensor HID remains the same, camera modules from different
> vendors may be mounted in different orientations.
> 
> Extend the upside-down matching mechanism to support ACPI _DSM module
> identifiers. The driver retrieves the module ID from the sensor device
> and applies a 180-degree rotation quirk when a matching module ID is
> found.
> 
> This allows platform-specific rotation handling for camera modules that
> cannot be distinguished by sensor HID alone.

On second thought -- instead I'd add a second array for module GUID
matching. I think it's cleaner that way. The resulting patches are simpler,
too.

-- 
Regards,

Sakari Ailus
