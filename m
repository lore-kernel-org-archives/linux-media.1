Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3F2DF126;
	Mon, 17 Aug 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962565; cv=none; b=XzER3Isq5gwO1podmnzupqahGMgExvtEgwWgiS8kO0wPlKC5gqQRczfDKPfB6k88pgV3Xl2cZ+jbnjXFhTPROfWVVMbY5bzFx8Pjzbko8OOHySEFDPmtk83xaq70MUilijs6Yl/ApBqDTrUjOsa7n45nI4YH+k2fX2UrFlkBy7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962565; c=relaxed/simple;
	bh=oJ8UzoFGGMxaiyTHQKmiPoBhJ1tBBmZECG59RNS5/4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fP5pnO8dtln+F0Gni7E3XaEv10LmFkbc4NABJ4KTpkiNEhIkrZ9IQyl+pxM1wEqaxSZ7y3vj7WbkAas/sif95nEwR81IaZkL7nmI78Msmb9PUFkxuWSos1fb3Kh23kKRFaD2OyU2OsA5rZ989SYJqvhTN45Ge4HXeh3TMduvm60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZIzqGBN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZIzqGBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786962562; x=1818498562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oJ8UzoFGGMxaiyTHQKmiPoBhJ1tBBmZECG59RNS5/4A=;
  b=CZIzqGBN+IOap0/ABRp30XeTIFvDN7HN+Raxh9PX917RA3IXKpV9k+Xz
   HlsIC/jhehzlXzLN2w2AsUZLnojIMRGQExnX7Gs2/ImCqb4vjyx0Ofa7C
   H7tE/i0xvuTQ+qYQ8Kbw1Jj/tvYpVPLkRij2VS2yYWglVIxBH5AaGPLXb
   JBfjIod+pPE5aaLbtDLFjeB50Xc2wogKyupOVZNqUVpY5IVTj4SFtPMhq
   N7P0wD5hSF7TPjJq5tba/2fwYkp7S7hjA67xX4pq0BZU6YdQflKkPkc4j
   3UIItUZlwAkw4wAy9xIAhzG4RRyYuZULOs3XFo2vxdnyJlDhmlUfIm1zt
   A==;
X-CSE-ConnectionGUID: VCu1lkuVQ6+9gjBiRRYCag==
X-CSE-MsgGUID: qXZ3DrjxTbesRoxCI92nug==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98588045"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98588045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 03:29:22 -0700
X-CSE-ConnectionGUID: WbXUoK/8RxyRC69HJGVIpw==
X-CSE-MsgGUID: twHuzsZjRz2hzpcQ941FAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="269154710"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.70])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 03:29:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E363112033D;
	Mon, 17 Aug 2026 13:29:23 +0300 (EEST)
Date: Mon, 17 Aug 2026 13:29:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shravan.Chippa@microchip.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
	Valentina.FernandezAlanis@microchip.com,
	Praveen.Kumar@microchip.com
Subject: Re: [PATCH V3] media: i2c: imx334: add new link frequency
 configuration
Message-ID: <aoLigyDk1OMFvQgv@kekkonen.localdomain>
References: <20260803055034.3807438-1-shravan.chippa@microchip.com>
 <SA1PR11MB828028FC5D95B15624E030BA81A72@SA1PR11MB8280.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB828028FC5D95B15624E030BA81A72@SA1PR11MB8280.namprd11.prod.outlook.com>

Hi Shravan,

On Mon, Aug 17, 2026 at 09:31:19AM +0000, Shravan.Chippa@microchip.com wrote:
> Hi Sakari,
> 
> I am sending a gentle ping on this patch. Please let me know if you
> have any feedback or if any changes are required.

I'll pick this once we have rc1 in the media tree.

-- 
Sakari Ailus
