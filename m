Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125276;
	b=YPBg7XDyFsJeVsNfPOpxpRl2r0LMUZyu0et3z9S/HIPtZXVmy53ShU0FtAplu8LTMDd8
	 JC9uv7QoMBJZc1CoJn6TQCXpEQ4myX3GpjUie9Z/SlmGiO/pGbpQJlaYNS9yVcnXy6fr4
	 gAxOzE2FtXbsLYknRjaIrC6k/vzgQs5wyMMGId80PWVBSvQmmIMTkXT5FPW1pKC65c5e/
	 bn0B4eqJAQgEgK8kFIyFHm0tF0ZEegzQa1yNWyR/h+OpowsJOxWEC2UWN9Zap8grsW5pZ
	 KBorM0ChWLiFG/Su+coEeadXByn64Egh2dBFUvmi8DPpWNGJTSBLCd1DKUoZ+CETv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125276;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y/35aAW1ut1aIdfVgHyUsY8D8nkA1UgxzF7RGCR+4yU=;
	b=Zu10VKXXiv/cHIKkU9PmK3aOL8Vc9mQSSl7D/OW8fql/f03BxnzKjqaQ2mm8dPv28H+i
	 mQLH9MWvlo28SQoSlV63B4hHnJdAwL9G18uI0LLImPPEfl/A2CWvUAlJAE21anuQmngIB
	 upyFisHotuKGVd17MU2+S5ReKvC/BGPsrRxxApiQJuSIFwhIV+4UfPBauIIrzFOgM4IJD
	 N2B/OCeSVlBX9iOKMswtFrNETuEEcp8AcWi9StBF/4Wiri14mAh/ooj1d5S39dkDiwvMy
	 pNoS+EDca+ytanhRyhr0plwx/Qv9BvvCbn/ZxKQBgLmye5ubU7LbcXAyn0dH0PyMJ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="DC/GXQaE";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D3606A33B;
	Thu, 19 Nov 2026 21:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 839D3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DC/GXQaE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795125277; x=1826661277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4OWh6EnK/Uxnm9WiSZa44kHgClL7HInOJ3m6ycBkMwk=;
  b=DC/GXQaE6MlEV/oR/YNuMg+I29bVqYSNBsHrIb6CtjMiWJQ1D11wYevA
   lhlrVMM0zv+Uv9ywtafNIjsx3Nuc84lwzs+qHK6/T6hG2qt3/1uge+4Zd
   cv/QH+15OdwnYuni0JDU+sdK3T/deaLYa71aXFaYb2a0fCO6cQm++Rah5
   dOYHaSeIqEeEsldRiLFxgDNRMM6rExJXUwuxsTAf5TnmQ2m3Bo1Td3vBY
   CQC4TxOF+ygvFGqkBEmDa9pgl2SNBXyCxdwMOEpMi7CYItknWMbl8zU1h
   hc5jHJZoI7sPDVl3953vs7S4zTn5AKcT/CTYny99x/HualCgoMdps3NrF
   A==;
X-CSE-ConnectionGUID: c71L8c7iRNaJt93QEmRgLg==
X-CSE-MsgGUID: HfJE6ZZOScmyvxfU31qocw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4074215"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4074215"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:54:36 -0800
X-CSE-ConnectionGUID: AL5YJNshRpCEqqT8lLQFUw==
X-CSE-MsgGUID: I/VexjLDTFafFpDR6ckD+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10453962"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:54:34 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4B69C121B5E;
	Thu, 19 Nov 2026 23:54:32 +0200 (EET)
Date: Thu, 19 Nov 2026 23:54:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: armandas.kvietkus@proton.me
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] media: i2c: Samsung S5K3T2 image sensor
Message-ID: <av9wGCsEhX-kIW9H@kekkonen.localdomain>
References: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me>
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
In-Reply-To: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me>

Hi Armandas,

On Tue, Nov 17, 2026 at 09:20:03PM +0100, Armandas Kvietkus via B4 Relay wrote:
> - The link frequency still follows the mode. The question about it on
>   v3 is still open.

I don't remember whether this was discussed earlier, but link frequency
determines which modes are available, even in a register list based driver.
This makes it easier to write a freely configurable driver later on without
affecting this bit of UAPI at least.

-- 
Regards,

Sakari Ailus
