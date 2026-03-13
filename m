Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9791B374751;
	Fri, 13 Mar 2026 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773402048; cv=none; b=Nvix4Wiq83jo+108vVnj4OwFkO80Vcr4Hntnag/3DnBRnZV7btGJCCGjHoSLE7Xt5/RupISeacsB/yjv41Mp3AkA9H30yj0/MsT4SboSK1yh4UcZz4DNW1xtI98WxBHThqr0CXMsU5vKeF322fbDir5v8VQNi8ioA1zQ7GE9PZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773402048; c=relaxed/simple;
	bh=H/4KkyB6xfiL99yZtTiZXLfBQVdnEZZ0F6JAd5R6IqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqyg8Vw11GHiiRfZ6iZj1mFfEc3rKjKe+qkedME/gQ1JPFKzakf1NDDYjlWNRqRRAqdgZ4M/z8l3Q8LKzmNHw+udLxXcdfviFa/JFWq3VnTeZSFekCXh9nvsxfcWzdT8P++s2+fTcrFX215NsxfVAo8Ud0J5d+cft0lQGpYNhZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnmRhsbc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnmRhsbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773402048; x=1804938048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=H/4KkyB6xfiL99yZtTiZXLfBQVdnEZZ0F6JAd5R6IqQ=;
  b=hnmRhsbc8LDJKa1Gj5iV57rZ/dfoM3F9Rz2uTQhXvWilO994eaLAEHD6
   bMdka9AlxmJXZ1QzTgjsLo7uyhe/cRa74hQDNniw0cMxy9cQ7xlxLgaJ2
   m4qOe7Bpe6seQadH5gZW8mnKEST81QX2n8GYqyqa3ZyECA3/nxZG20FVi
   7QcfhoEZUdrU8YJCQtY1jBQ3KAFX3sjTNGObKxrs1WlmFA9IWnTVw9kEC
   oiAoEWDWqF25hKR3dikP46q9UUcH3+PjA+3f2fNkd6A579DHdRBxPzciz
   g136jpR6HcFyBj+amss7/OiKnMELmxzP2VRnW/wnWA3/Lbn4eNDIqCZ50
   Q==;
X-CSE-ConnectionGUID: MX9M64FyR/eyDnb3LqOCHw==
X-CSE-MsgGUID: gBWFtDHbRoihamK18BzLBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85136705"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="85136705"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:40:47 -0700
X-CSE-ConnectionGUID: mFVTCsR0Q/uVT83VmZ6rCg==
X-CSE-MsgGUID: r7WiJAvyR7iRVAcUP6xadg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="220215804"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.224])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:40:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6CD8B11F7D8;
	Fri, 13 Mar 2026 13:42:42 +0200 (EET)
Date: Fri, 13 Mar 2026 13:42:42 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "luo.liu.linux" <luo.liu.linux@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media:v4l2-async:debugfs for registered subdevices
Message-ID: <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
 <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>

Hi Luo,

On Fri, Mar 13, 2026 at 07:21:42PM +0800, luo.liu.linux wrote:
> 
> Hi Sakari，
> 
>     Thank you very much for your reply.
> 
>      When building a pipeline in the camera subsystem via Media Entities
>  
> (e.g., Sensor -> DPHY -> MIPI-CSI2 -> ISP), it is crucial to verify that the registration
> 
>  and unregistration processes for each sub-device (subdev) driver within the pipeline 
> 
> are functioning correctly.

You don't need a debugfs interface for that, do you? We have a large number
of things that can go wrong that are much more complicated than this (and
there's no debugfs interface to verify those either, no, largely because it
wouldn't be meaningful).

-- 
Regards,

Sakari Ailus
