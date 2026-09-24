Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496EB30D41F
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252337; cv=none; b=swf8I5gxfRWNhWHW4sZq5popfJaIl2tTQFp5VdxYFPYs2QuuRwsECjz0xTo/7m2UJLxlY9qADZs2JTm8k4z323M4mbDFc74WXhpg6VXC4zmcjJ2a7P9ssXwAPrSm3y3ETAEgredSPoWRzBeJPfPKKnu5LaNmLpQ18ZaITSoAu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252337; c=relaxed/simple;
	bh=h3Alwd6+TKT9vV9UOQgWhd5/QcU4jig5hbbK40F+/CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQ84SG4xz4IN1aP3D4TFL/kveHXAYGVzObFs+Th5BnggRdeP8P+QnX+STWC6vD8SNDCyg520J4k4dAQOvuuu/Q7PAl0pvzvsss1QSlQz99sdPw5Z3GOZkvPDkVaq75Oh/QrBYdwzTdcTM3ynF3JwlkbQ1MqePBykVSIS7aRJ4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAcKK6u0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAcKK6u0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790252336; x=1821788336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h3Alwd6+TKT9vV9UOQgWhd5/QcU4jig5hbbK40F+/CQ=;
  b=OAcKK6u0IUpjW4dWHHygRPi0O7ykBJC5AQMcGpDJtqFsBQ3FD1yYBowK
   Ka0hrCPz7+WseMm/gjja+PDtooYHyuw0pXa3UHBXIv+Gsrv8jYODm1k+W
   1jyUc9xXK7PMmgs95H3HPYpwC0btfw0KkTkyLME7mlegnHH6C0n+ixcno
   KbyizyqhMXKbVdp9BiSuYRDO+qYwwIu7+pVJseUwShgeHDKJXNf5VrbR/
   Sf4d7+UaP2jeIoomzzB6c8N94ZRF2IaSdrnUiErahfKoDFOqkxy4lmWM+
   VNg5kENnuXD3h/ab3mzlv/WPl7DTmgXGCT19I4ovbSujGY0lc0orNsLtS
   Q==;
X-CSE-ConnectionGUID: M8YalVWgRyGQLP9BAaAQqw==
X-CSE-MsgGUID: MLqdVWIkSE++kOuY2VBURA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101550977"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="101550977"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 05:18:55 -0700
X-CSE-ConnectionGUID: eLn/dw40Rhask4b7N+leoA==
X-CSE-MsgGUID: gDIOGM1yTKGZDl43KGjM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273143780"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.155])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 05:18:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2749911F8A5;
	Thu, 24 Sep 2026 15:18:53 +0300 (EEST)
Date: Thu, 24 Sep 2026 15:18:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, sarang.sapre@intel.com, error27@gmail.com
Subject: Re: [PATCH] media: ipu6: Fix bus device use-after-free
Message-ID: <arUVLRraz_JzMdfw@kekkonen.localdomain>
References: <20260924120634.1420687-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924120634.1420687-1-antti.laakso@linux.intel.com>

Hi Antti,

Thanks for the patch.

On Thu, Sep 24, 2026 at 03:06:34PM +0300, Antti Laakso wrote:
> The ipu6_bus_del_devices() will uninitialize and free bus devices and
> dereferencing isp->psys and isp->isys will lead to use-after-free.
> 
> While at it, remove unnecessary checks for isp->isys/psys.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>

Closes: https://lore.kernel.org/linux-media/aqlXAXcXvMM3HWtJ@stanley.mountain/T/#u

-- 
Sakari Ailus
