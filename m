Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669E03537F8;
	Mon,  3 Aug 2026 16:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773950; cv=none; b=ZYhdBHg1ka2MmR4BwsaFhC0xEpNSXzS/BPGx7TuMZhgs2rePcQGqt27YI9JIOBqpDU6kYR9iVOGR0jYsS/Pjk+3W6RQ6/iHw9O0Ac5GFcVKy7Vr4Sd681q+j6pCPewzbZ3RBA+RF3ll3VvOlIJ0cLSi50RliwQ4eRAUOREsEPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773950; c=relaxed/simple;
	bh=KvnvtX66JfDsUJCVw8VZjzywo4V45Y/eg/vF8VD2S9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkMYpPBkjdQg7g8PGoG4PNx26Aig+C9/7YFMNQkf+sEZ8XFx7eDC5GHkqWXJr0H/y9OyzgQMuTGK7b/8OqG4k6VNSdpxbwZb77dkGsT94zfrBWewxETFp5ewpSVTK4MtU7EeBtFD6XZR5b55/FZzdewpsKAk4whT3AIN2cuR6iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQZ6tPSj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQZ6tPSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785773946; x=1817309946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KvnvtX66JfDsUJCVw8VZjzywo4V45Y/eg/vF8VD2S9s=;
  b=GQZ6tPSjC9nyjPMMhOjhJA++W++GblazPC9tBnwDpsKj2KAMnRcjb0bg
   ySGOb/Bem3UXGhDUcydtuDnGGS4B0vsnyoyWGWsKFi5+JMNptlx7uXhPZ
   8n7J6aiu/AWdqDV3/bJ2S1zcg/LCNpWHKiTdpjAEXlimdEWcR9qsOGYf0
   lp8Jiy4q3ERbiIQbLcvfX81KhSUokvfk8lvoQfzwuCZK7ipFVLZNTcNKk
   isZzzIAmnimqTyv/iS+8aDwsat0uNeIXm7xOYFDZlFS41QV9sPZkmzbbc
   9cMG75LvJoF+sI6QF2agr40x3hY3J10EfIYFu7nbhnIkcYwlYH2tnjgZ6
   g==;
X-CSE-ConnectionGUID: XbFDGgXOThWoDAILGnrUmA==
X-CSE-MsgGUID: YJrwADNLRQCG9gYWSNvVxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86436959"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86436959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 09:19:04 -0700
X-CSE-ConnectionGUID: wfHPExFhSRGWUHYGc41GIQ==
X-CSE-MsgGUID: 4UOCdOT2Q8yHd8QKmb85eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="265529062"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 09:19:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BCD841205B0;
	Mon, 03 Aug 2026 19:19:06 +0300 (EEST)
Date: Mon, 3 Aug 2026 19:19:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: media: fix spelling errors
Message-ID: <anC_eghhYa9mtlJB@kekkonen.localdomain>
References: <20260730142126.11714-1-shaikhkamal2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730142126.11714-1-shaikhkamal2012@gmail.com>

Hi Shaikh,

On Thu, Jul 30, 2026 at 07:51:26PM +0530, Shaikh Kamaluddin wrote:
> Fix two spelling errors reported by codespell: a misspelling of
> "there" in vidioc-subdev-g-routing.rst and a misspelling of
> "struct" in legacy_dvb_video.rst.
> 
> No functional change.
> 
> Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> ---
> v3: regenerate from a clean branch to drop the unrelated
>     prerequisite-patch-id lines (Sakari)
> v2: - use Documentation: subject prefix (Sakari)
>     - use full name in From/Signed-off-by (Sakari)
>     - reword commit message for the media CI spell check

Uh, it seems Hans already merged v1. :-p Thanks for the effort in any case.

-- 
Kind regards,

Sakari Ailus
