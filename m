Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002150;
	b=Bxz05D2UpH3jzN+3Nx0hlfgD/7smir6P7paQx5QuSaXKEzsuC9v6x68RWF28PTIekMU9
	 urjQImQ8Iu04s2zJHrzT5xDGFIFqn8i0yOP3ak/v6vhglHwCHOZ4b5bLl2ksVwZmDeLyA
	 npeOT6gkzrw98flIT9neXLLIxbg/mw9gge0tjV4fU/j7ARTSwHREAm0bryCp050vU9QBo
	 ZhOnM300D4/krWs1rAMNyKOdCji9PvSAwKr5jQhiAtg5mu7igX1PO8qmROweCms/ClUM7
	 igs61Ksyb9XCnJW7BGOJmMkJ8Xv8EXRQa3IG6vjDe3QVWu09U4TtBvQ3FDzeziyGLCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002150;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=523RbjkDZ8hhQbNPzYIih/Ztd74SHWj71RWXP8ok3Lo=;
	b=O3ZVwTPC2yiWesqU+cOZebsqOPSixXzTbnOFQH6YkOHuMAgx6xO3E79hvOHyEfzojXKk
	 T8j7fvwbbpTE8HoNxbElwy1GX9c/NsvX2ZJVXdhcJrzoFaD6boYHmfkGFzBHyr8YIFZhO
	 2Jdbr69ndoVsI9MQfeOOqNvREmdRRazm6xJQU7rXgxZ+/od0cLXfgYdIExhbeNzlkv7w/
	 +gg0npIIFCD0sdzO47yeeyxtPGNcsHwVZbSa9XdkasGhRjx7rvfqovi8QRVx4vMkiwDEX
	 wkkymq3jeC3BUxeRed81o7Y9te1k6UlKxfacEPRgWZxmBRiUn3N7tsdYN/z1l4d00DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSm9m762;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A221F606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A221F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSm9m762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795002150; x=1826538150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qw7yWa0FERv8vD3h8Nof6lxRINmJ3QKL6Qw8ALEI080=;
  b=CSm9m762k5a4tktw3wkV3tuTOrUKdCi6vK2YypAU5cyCdmsQHvaPveQF
   xvnwOvjIbyiW1UAQcnFETLmwKGwptZ0k1ynDfxFTR1k1WlgDOChkCJRd+
   yVEWrR5CM3bUkU7vab2KRtfreV8ykpeyIpitsZ9Olcpe3x9aQIGnggs2+
   6zNCgb30wBk/Lvhg02CPB+/jyXtW58AitbSOAXzDnlTGl/1wiL9Y7aUg5
   0ACkDhAJiTOoRVgU0mzzHDBMFgJyAmkYonfVR6/XZQNmmKpY97W/rv1gK
   HzWHeiLFHOHqbHeJeHcgqlTVSJdNW74sB7zycKVRImXTNSmCBbYJY3X7d
   Q==;
X-CSE-ConnectionGUID: 4nl4o7nsRpahlWss40o1/A==
X-CSE-MsgGUID: dtJYMRrXRCOpNIhGTW+Xag==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3700842"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3700842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:42:29 -0800
X-CSE-ConnectionGUID: aly0MsPYSnecUGKZn6/UdA==
X-CSE-MsgGUID: F/w9hYoNQVWVzUfV+pnz/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9914855"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:42:27 -0800
Date: Wed, 18 Nov 2026 12:42:20 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Antti Laakso <antti.laakso@linux.intel.com>, "Sapre, Sarang" <sarang.sapre@intel.com>, 
	Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>
Subject: Re: [PATCH 1/1] media: ipu6: Make ipu6_dma_{un,}map_sg() static
Message-ID: <av2OwW4YA7HSgV1s@mdjait-mobl>
References: <20261118095740.208482-1-sakari.ailus@linux.intel.com>
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
In-Reply-To: <20261118095740.208482-1-sakari.ailus@linux.intel.com>

Hi Sakari,

On Wed, Nov 18, 2026 at 11:57:40AM +0200, Sakari Ailus wrote:
> Make ipu6_dma_map_sg() and ipu6_dma_unmap_sg() static as they are only
> used within the same file.

This is also the case for ipu6_dma_sync_sg()

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

--
Kind Regards
Mehdi Djait
