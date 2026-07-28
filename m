Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C8243786A;
	Tue, 28 Jul 2026 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242077; cv=none; b=KEbcMehqSkBM4T21UG0CxdMUkPfXIgYmjWV6kG+4zRxm5ykOLWFm6PWok1cZ1X8iMGV8GZIFzH7VWy15XUqtrDzBduqjgi4vPPAiCzkPkyZmW//DMVYgx0/ZjHmSYKanrezdXhuu7UuO4aW727Stb1JgehifirgaLZsQywWjYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242077; c=relaxed/simple;
	bh=qS+ACjhQz5lnG+4tvxGsYp9mXLT1MtrxulXQHcyZeTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzbdkPou0XXFtS4rzR9fWMapa5KZOY6oo4BuAgnBjNdAwIS0qzBiP1WkMFBwUWHLIgwiWlVu13uGaBEQi6BkFwGZlYc0LbPOoDDk1XJKm9iHmVzH0os+2XsVo/VaSfzobtFZDQoVPaORjlXZS8lKNKawb2rAaTdNNObA9Fkcrl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ud8D75BO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ud8D75BO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785242075; x=1816778075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qS+ACjhQz5lnG+4tvxGsYp9mXLT1MtrxulXQHcyZeTk=;
  b=Ud8D75BOUwaSUd/UpBGJfWVPVgslnZIdSxgzDq1ddPC47s3nA787pREM
   uOtzZv03qy0atynGtjZ/flBucSjh77K9EnVEILM4tbcfUOhwjlCip2263
   aI9EdR4TMjh3rTIMZE6vpUr5d/QUD66dfhdI3nu6T2sB6lsqGIy76qLar
   pbEDhstvpLoWBmpBAEJ6eg4EZtNSBoWvAdwuiq+Md8bTX/Qu3T4VV3xRa
   8XkVCBIwO92L1/mDQdfjSoUcRoRdZxara4VavHiz+n5qj2IfpddJkc1qy
   K9Tg1MLQUbOYy6dy2Ghasc4mHNm9g8ilz5/iUjcbXcx3rOh1Je5z+J91T
   g==;
X-CSE-ConnectionGUID: bWCMfUpjQTetE+6YCqDUcg==
X-CSE-MsgGUID: di/EhyI7TxWUyC4l3orgLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96410985"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="96410985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:34:34 -0700
X-CSE-ConnectionGUID: kQgSw5xqSXmlmdy9NgUggw==
X-CSE-MsgGUID: cTq5CH+1S26MjrH8uhhxZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="297922174"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:34:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9C00E121BFD;
	Tue, 28 Jul 2026 15:34:30 +0300 (EEST)
Date: Tue, 28 Jul 2026 15:34:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx471: Add line length PCK setting
Message-ID: <amih1psHfejzUs55@kekkonen.localdomain>
References: <20260728042013.23707-1-hpa@redhat.com>
 <178521646078.4139729.8353081240992310969@freya>
 <CAEth8oHn7MqqZ1hN5EYazdiVmHPm8TToo07KfR8f0Rikm59ztQ@mail.gmail.com>
 <amhfibBuw6N0usWl@kekkonen.localdomain>
 <CAEth8oEhDR_2UqNiiW2EaUYGGeR9NbkFWidQBXB0Hc+m4sbTbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEth8oEhDR_2UqNiiW2EaUYGGeR9NbkFWidQBXB0Hc+m4sbTbQ@mail.gmail.com>

Hi Kate,

On Tue, Jul 28, 2026 at 04:33:38PM +0800, Kate Hsuan wrote:
> Good suggestion. I'll try to tune vblank and possible configs and hope it works.
> I scratched my head trying to find the solutions and now I can focus
> on tuning the parameter to fix the issue.

Horizontal blanking is likely to affect image defects whereas vertical
blanking can be used to adjust the frame rate. If changing the horizontal
blanking does have that effect, we should probably think of using a fixed
value for it. Then the question is what is that value and what does it
depend on (likely PLL configuration and external clock frequency, possibly
binning etc.).

-- 
Regards,

Sakari Ailus
