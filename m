Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001554;
	b=rqh7lp8R3nf+Ff9TTuamCTVEnEqeT3/Gd1V2xCFp8/83zxS+WEne4/xSEiec6qhe03h/
	 Obzy/6oOsGE7d3J4506iQ1Ddrwj+A17kalqLVS4gE+PoGVdwein/VppdAF2F9f7DBLPql
	 sryQPkGmGD4+QoePmQWI468UuY/BUGPpujh1pxUaW9Ei9UyVvcDhHQ9qaJrqKLNEMfeP5
	 xsWFQjXl/1OVKkTQpdZG553LuTgul+4YNIORTQLJkyqR1i845QoLeKiMbC7TW7O7g5EK4
	 QusR0OuyT5vpCPG078eT1l01TEIbXywcEOubrUp3pJiaqCslpAeG3QPBk1vbtfTFEfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001554;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aTn2TCJftFrQcjFW3PjA+4u4l+dCEluOrUERM1gp3h8=;
	b=K6nI7xT2gZgg16XoChPxZy1kwiln018sLb4zA0XhZguwu54BM1WjjB6JmK/loSha0Xm4
	 FXSUsDDJX+9m2IWWqxUDf9lyeafzp7SfZdNDA3i+wq/GA0egzZRNzWXUXOJZhk8+K/rp5
	 SnPJJgUreTwhnxzDj4pVndRsjoHzko8nEiZRnqfsCccpQpJunazPNEMMI+Bwkf5T+DoT6
	 qktVXx3r8ghiExrma9LiswKUjK0/9MzD+fvdTlOIY5zWEHqCbjAq1J/uc4asFKiZV6xiu
	 HhnY/ir0MLf1FBgeA2R9XTPUpyEoUHNgzUDSIkLVqo9pUXLK9Okyt+hr1Ks5R8zDD7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aIYoemd+;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C10F606A320;
	Wed, 18 Nov 2026 11:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C10F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aIYoemd+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795001554; x=1826537554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NFnWDBhLRuLnoG+Wd51C14eK9xiBcw4DRsn9WMOefmI=;
  b=aIYoemd+78CpI9Vpp1PbcWDqsGERl6Tnlsyz+TaCitQr2nQYn5CyOEYd
   1ITyv2JFxYePUadfbdRNdb2zpg/uK7ATxKus0a28LXufMo5itGAHsWm3R
   gUk8o3+jpwwLlQb53GBW/KbGIJuitzOTv/wvmXtSo9Bc/1qekOcS/HCwi
   XT3Ak9nFG2YEGTSMG/iig7p53cA7FbSZSYdYl8ap5MRfWHJ/d0XfKj027
   Br8KoB6V9XLJEVGkKy2OV4OzYLe+MooD7/6Ag1HrNtnLg6C1aPNb8T0NM
   8IEbqEmdQ2SLlzKvH++WI8/XqEvAHLEKhc0ISAxWTJC/2GGdmawymfQ8S
   w==;
X-CSE-ConnectionGUID: YTog2F1bSUmnp44QzKLuKw==
X-CSE-MsgGUID: duVzgHlISgKbzVyXO9se8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3655556"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3655556"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:32:34 -0800
X-CSE-ConnectionGUID: Znnbo5KrSmmzYywMrCBbGA==
X-CSE-MsgGUID: il3ajXlvRVeG50ClETylRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10489712"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.243])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:32:31 -0800
Date: Wed, 18 Nov 2026 12:32:24 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:XILINX VIDEO IP CORES" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
Message-ID: <av2MP0VlOKC5RUXk@mdjait-mobl>
References: <8c5500e70fcd2b4da35e985b9f8a976afa1991b0.1794999782.git.michal.simek@amd.com>
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
In-Reply-To: <8c5500e70fcd2b4da35e985b9f8a976afa1991b0.1794999782.git.michal.simek@amd.com>

Hi Michal,

On Wed, Nov 18, 2026 at 12:03:04PM +0100, Michal Simek wrote:
> There is missing return value check from clk_prepare_enable(). Fix it by
> using devm_clk_get_enabled() macro.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---

[..]

>  void xvip_cleanup_resources(struct xvip_device *xvip)
>  {
> -	clk_disable_unprepare(xvip->clk);

so the xvip_cleanup_resources() is empty after removing the
clk_disable_unprepare() call.

It is also called in xilinx-tpg.c and xilinx-vtc.c

>  }
>  EXPORT_SYMBOL_GPL(xvip_cleanup_resources);

--
Kind Regards
Mehdi Djait
