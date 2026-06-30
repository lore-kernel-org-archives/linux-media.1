Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661B374A1C;
	Tue, 30 Jun 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833177; cv=none; b=XytTjJUBKLfABV4cgBC0uESvGFJHdGbmMP6blMiJY+cdt+ZGZ4iW0FuyhbGog4zZmZ6z00S5ZSJ0EJSRUXVBpzzF8vWBZquijRVOdids4rqF+PF79Czn7DWZG9kqHnIUdoHITpUzcr7RjjMc2gEXwly+sAySnis9LiHV7i80Rbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833177; c=relaxed/simple;
	bh=o/KAIttV6Re63XhGjKoqkqWZrj57tKWBDS5l0Xz1KgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlhpaKMSrRUS2zuY7L65n572ey4WPJBhg0wGeqBupSdhnPs0iQth9OPJPRXRS2pBewZ8/YtbAJ8KPC/uJVNy10WO0kdfeinJNzoHxCQD+R0Z6Uu1t2yLzVEzlI1Sfb0l70JUarM6QSlHSl74cF52oX3yKTPPD81aDeCj6kdvg78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnD1kzoG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnD1kzoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782833176; x=1814369176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o/KAIttV6Re63XhGjKoqkqWZrj57tKWBDS5l0Xz1KgI=;
  b=dnD1kzoG/WBfEj0lTww2nWQqS+PBNBViPJdp0QJ5dzcv3UPM5lVNEHmn
   n63Ae6TkszYYUdiBH3ge8B01Zzlyb54bARr0cxFv/urpz+GP46xk3BvHG
   TMK5VPRxgx5ysmHflD/CWty8XIATQvNlxJE1R/QMIg4fyfm8vrPgCz7Hp
   h8XuBv4Fe3Vg/LrjoNIYWkD1Rq4HIhdTCFblU5cdZEzbCN4LxG2kN0BNU
   9bWYczEwh4AGIKyKKgD4A82y2LT9g0bdb9RQVsPIQ3BB87Ux31AixiS7G
   z/SpduEQBNN1oPRhKTtCue46ifmuNgUeXt4v9hu1T7D77EyMNdZHlPLCy
   g==;
X-CSE-ConnectionGUID: y7xHLG0CReuqT+vZcNA4AQ==
X-CSE-MsgGUID: qRoJVzRbS8+S0uwziNi7JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106341813"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="106341813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:26:15 -0700
X-CSE-ConnectionGUID: 02MX0A4UTt691Pv/02updg==
X-CSE-MsgGUID: 3rMI2kktQvKxdbtHYkFFiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="290418674"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.241])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:26:13 -0700
Date: Tue, 30 Jun 2026 17:25:43 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/15] media: i2c: os05b10: split common and
 mode-specific init registers
Message-ID: <akPf3JJebqr-pEY6@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-5-tarang.raval@siliconsignals.io>
 <akPfZLgX7zTVWt_6@mdjait-mobl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akPfZLgX7zTVWt_6@mdjait-mobl>

Hi Tarang,

On Tue, Jun 30, 2026 at 05:24:09PM +0200, Mehdi Djait wrote:
> Hi Tarang,
> 
> On Wed, Mar 25, 2026 at 05:13:50PM +0530, Tarang Raval wrote:
> > Separate common initialization registers from mode-specific settings.
> > Move resolution-dependent registers into a per-mode register list and
> > program them during stream enable.
> > 
> 
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

Please ignore this, this was meant for the patch 05
