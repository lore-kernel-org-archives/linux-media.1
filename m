Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB1137647B;
	Tue, 21 Jul 2026 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654747; cv=none; b=IcU+DgN1mAs+vKiKxLtJ1b/FexL8TmF7DaQVq/SZtpq082Rwk7GEtyrn1R0kl08YCUbWqOSex9MLxYImVCavxLMvKRncQsBpzzIVlny4s4JX+glf+bf2C5VWPba5G1szm96FmSObdZ70/Ti8pTDVRJ/9kLbAt6Z+OeEek5/Lr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654747; c=relaxed/simple;
	bh=NW2Q3chx4yYM8cg4ACInu5HpGBt6D13LwvpoenPsGck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2L5KPPU/F2/Zu6FZUom3mALP1NDxsQb7eqACJlwOKVM9L7JdNy7JDyg3tCJ3xK88MFi3KnNp1Ee4SpAobvzLEzu8KdCiH1ljIrEB3JwATtw9oJDgQ3bpG8+ea6mGPAdSoS7t17RK5DFbfE0HhAjtvxaa4EM9qPg7iP+wAK6iRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdYdPu3E; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdYdPu3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784654746; x=1816190746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NW2Q3chx4yYM8cg4ACInu5HpGBt6D13LwvpoenPsGck=;
  b=QdYdPu3ENz+eYbZY44g5T2dhYIoNbBknpCzv9jF6c6f05viVsxI4O3SP
   Iwxr2WzcCg6zincS8SlrJ7G8mYSW0i/yH5Jx+qiHXyX6uX7SHFEgWo96z
   m8RiZJMa8mQcNxYQZ6FgaHYgOMywGulap/61wSHNpcErWa6Jc67QXrH8h
   +ubO+HNuSUYJlSFk1xsaWnapMJIWS5yq/KWEz8uuOv13iEgY6o3Wp1p39
   7MyKFNxylOJHFqiUZIgAkGMPmpC4x5ZJntPIm9oWeV+9AQXkzsetbAu4R
   QsHkFKqsg0y3Iz/MVD+s0L6zLHut5YP6WIsmIomvk/Qke/bsnNX7jyrYb
   A==;
X-CSE-ConnectionGUID: H4YtWabITT+NyxPslos79Q==
X-CSE-MsgGUID: SDrsI5V7R3SD/BrpoOHEzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108054274"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="108054274"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:25:46 -0700
X-CSE-ConnectionGUID: zAEqI98jSFKhbcZ20+Gvfg==
X-CSE-MsgGUID: cULryjK4S2yeL8i/gE4zog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="287864741"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.135])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:25:44 -0700
Date: Tue, 21 Jul 2026 19:25:34 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/17] media: i2c: os05b10: add register definitions
 and use them in init table
Message-ID: <al-rS1Oso9pNfKQG@mdjait-mobl>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-4-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718200912.16001-4-tarang.raval@siliconsignals.io>

Hi Tarang,

On Sun, Jul 19, 2026 at 01:38:54AM +0530, Tarang Raval wrote:
> Define named register macros for OS05B10 and replace raw register
> addresses in the common initialization array with the new definitions.
> This improves readability and maintainability without changing
> functionality.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

--
Kind Regards
Mehdi Djait
