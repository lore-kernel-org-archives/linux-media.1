Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE03B8407;
	Tue, 28 Jul 2026 06:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785220134; cv=none; b=Y1ZYztO2T1bdVpcjJTurkBByvoHC3iOUn7s3FLROpHRYJefkAUxmaGo8fjHGC7E1j6myRAr2YZobE8HCxlCOPSASr631j743viRtY1g7r/dSaPIyl5yrDrE81MO3j5MUTpLx9slpKsut5yCcQiuBRoTNeMQarqTs6RiQIeSQSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785220134; c=relaxed/simple;
	bh=XaUvUARs5lhO1YopHQlJU9GbHuqDjQNwkG0slbl4UsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJPqLlbrv+nS8GGLCGc7bmHuOxxmjH7kLBj0lWQLGMrxEhzMSgkLiEJoc84UFOBrf0MjFtSqSek3BoUUzXH8IMexPuXtCNIAS4kWo6zPBz303+50boLL16YFUTSam7trO4i/YnMDt0mGjJlCzUIphPwnOeWLey08KJcZcId8PFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWHDsmJ9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWHDsmJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785220132; x=1816756132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XaUvUARs5lhO1YopHQlJU9GbHuqDjQNwkG0slbl4UsU=;
  b=hWHDsmJ9oHyY2jXy5ir0fLh4G2cet5JgTUNGyrlywik2yVvp2KGOlg/O
   Fk9Q+Jzi9lvoW2MN7Qq7yXSJBpLTN7AbQ2/PJUb7wMYtz19XyJQWSqePo
   T1VZ4JLtr4dkS3RAXkug/A33Ld2qygGBPVOl5dLFH9tt1THmQi0yVJDMV
   MApR2ezmEevFhMjmZ9GhHedfJZzqKy6nm6GkE5ugZ0XM/uQH8kjmTnKga
   +O7/rhTAvwCzc24dSyQwRmv/8to3F8I6FhxwtWzSa0414CSDVdJ1aGH71
   tUekIhJSlWDEYSkrUjJ4ZbjzLoZQIYSILFR/p7D33XbI46+efwVB9jaaQ
   g==;
X-CSE-ConnectionGUID: JJKdpP8JRwyfAcs17qCoPQ==
X-CSE-MsgGUID: CGkNQQ3pTy21FUyguQr3Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89618541"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="89618541"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 23:28:51 -0700
X-CSE-ConnectionGUID: pJAcWnyyQf6Dcc89JiTBhA==
X-CSE-MsgGUID: i32x9PoXSNqciDu7TcT9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="264608497"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 23:28:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 10BB6121C02;
	Tue, 28 Jul 2026 09:28:49 +0300 (EEST)
Date: Tue, 28 Jul 2026 09:28:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	jai.luthra@linux.dev, mchehab@kernel.org, mripard@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	r-donadkar@ti.com, devarsht@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 0/2] Support RAW12 bayer formats
Message-ID: <amhMIbajTSSuAcQ_@kekkonen.localdomain>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com>
 <178429421685.1426769.3663231526402032657@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178429421685.1426769.3663231526402032657@freya>

Hi Jai,

On Fri, Jul 17, 2026 at 06:46:56PM +0530, Jai Luthra wrote:
> Hi Abhilash,
> 
> Quoting Yemike Abhilash Chandra (2026-06-25 20:47:54)
> > Hi,
> > 
> > This small series adds support for RAW12 bayer formats in the j721e-csi2rx
> > and cdns-csi2rx.
> > 
> > Testing details: Tested on j722s-evm with v3link + IMX390 downstream driver
> > Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/805ec4662b60ad925e979d55a9515f89
> > Testing Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/RAW12
> > 
> > Jai Luthra (2):
> >   media: ti: j721e-csi2rx: Support RAW12 bayer formats
> >   media: cadence: csi2rx: Support RAW12 bayer formats
> > 
> 
> Thanks for the posting these, LGTM.
> 
> Sakari, 
>     could you please apply this if it looks good to you too?

Is that an A-b: or R-b:? :-)

-- 
Sakari Ailus
