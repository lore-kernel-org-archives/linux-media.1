Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421911;
	b=g69qCX2EfFDU2swCxdBOUQ2seSLzXJO33QiYuu1ML/wkEb7A0B55F+myiC9Y3ibxeaNM
	 Vhd98YAQ7YYDcjHOyYMSWGR7L1TQpGy4eblO2sEAqqW0n9f+kgS2hBGFgTozuvOUyhpLP
	 gKX27UaiCZ4TvhViYfXpTGL9N4C+ZAhWzFsQXzTjkyaG+RktmHmw/0iS5PeF409GXBJ7R
	 u+Bx3VHkKJmbx0OzZFHDofNZFMYEep4fU1BRfM4F2P0JgVPm1LIROe47TzMnWaADZFB1I
	 ZmZ1aQCV/d0y5tVLmmbQPu1eN6Ha3EWukpDMJSyf1sffpkSrRC2CxW96sdQUF3ZCgPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421911;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=pAi0FOlD7jecg0Jih3AEUeZr9uwQOqOruraPDjTwLmc=;
	b=vw5+CV7ADiR6dHrLlJ6zqdCX7PAM8OvLxIRgnUrW9Zc+Ys5j85cluYRTYuLwkWzBtIrG
	 R5mGa3tT5tvBHwePIxj8spVmNCXOtRjttg2Se6uA7D7kWe2lTV8lBFrVoiVYD+5DOP9O3
	 lv2LGVps7OnCY/x8f75OAO03o+tdDAsVdV04nmQJ0s+b2Rwsa2chKiUoRduWchr5dHdWb
	 /fRQVdh42dfc6be5OlYAaxv9//UkQxPBA9RaHdulELvGoY90+JNl0OjiZ8Aur3F+aJxdL
	 NDdf4Sdj1ROuxMIKv2ZGIgEQfbPBNjgNFRTzRIevAxWf4Ov1uCNjF7Nc0mxV4q7W4Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ff7Tu3cH;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71A606A321;
	Mon, 23 Nov 2026 08:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC71A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ff7Tu3cH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795421911; x=1826957911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YKa1djohSu06ZYy3q58kr/JnsMrhtdQAwwPmVBocZgw=;
  b=Ff7Tu3cHqQlWas2ytOe0nSnPIrksEw1I6pqFCrsibu8YK0/n6InVtoC0
   OuIcbPVxEcmxzNu43vuGf3SYWuIQfsKXsSoW5F7PlMp24e0x0IkwUYytV
   XNBSwuvFY88EAVnC9thrJHGXBfDfRgpuZ70vyQHk6DrTwLfkxIr9E/VRy
   9bQyt/Ikx6IKFrukRHiuivarVYhGCADz6yrFZssNOoPC1gRTf8yyOcDyO
   8cI9J5RvmywxstDa7gjm/HRblC5N8Mld45Lk/2JXqz9FzLiHrl37hCON7
   xF/dgQrdszTq9P4TzMG2WU9nxS6noXQzNA+DOS+TP03RwUImvsUENl7gG
   A==;
X-CSE-ConnectionGUID: Que+JSg0TUaTcZy3rpeHVg==
X-CSE-MsgGUID: ONWSaUv1RnmUAu/zfs3fbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4068633"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4068633"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:18:31 -0800
X-CSE-ConnectionGUID: ep+NzUUMTlGojlella1x1g==
X-CSE-MsgGUID: 6/T851vRRbK81n3gjfVcmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11562913"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:18:28 -0800
Date: Mon, 23 Nov 2026 10:18:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Fix potential firmware leak after
 partial loading
Message-ID: <awP20Wbc1Fh2dWpN@ashevche-desk.local>
References: <20261120173523.3923967-1-liguangshuo@mail.sdu.edu.cn>
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
In-Reply-To: <20261120173523.3923967-1-liguangshuo@mail.sdu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 21, 2026 at 01:35:22AM +0800, Guangshuo Li wrote:
> A failed firmware load can leave the minibuffer table and successfully
> loaded blob parameters allocated. Probe skips firmware unload, and a
> later retry overwrites the pointers to those allocations.
> 
> Unload partial firmware before freeing the IRQ. Clear all_binaries after
> freeing it so cleanup after a later failed load cannot free the old
> allocation again.
> 
> This issue was found by our static analysis tool under development.

Please, test on a real HW.

-- 
With Best Regards,
Andy Shevchenko


