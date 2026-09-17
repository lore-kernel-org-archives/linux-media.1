Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E896D3939B1
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636709; cv=none; b=BbEwjvHfsMGJSd2wMUVOXp6uSOAlPFHWalzaRKJgKdnMFMfQ6xLfSKZDyNh8+YKVtVZo5Gxp0iKRAhB1+TpxNS+LZhSb6PuOspwfb29dugB2MgR4qaOHAmZKv43c+MW62NUmhRp/Y//DYNMRXiVURnHyolYZcvrk9J0KM/UOZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636709; c=relaxed/simple;
	bh=00SPpc3am1+ku+pJpGzLoPo3CXBg65DFSgRcQPaEcIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIqG64NUBj3UY1mClBM1ogGzLH65qVLoO8o6EPuqszsU/8MW77ul+7dBSSnMrrdkKlReJ4n1Veb2w9rr4++68+TIaCeyzLXEVgm3SqK4deRGwanOoVxz3Esm4CO5bBgSq/6tUIRHKeT7I1Da0gDM97lDC4afeUjh3/e8YR8IKsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKc+Sjiz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKc+Sjiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789636708; x=1821172708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=00SPpc3am1+ku+pJpGzLoPo3CXBg65DFSgRcQPaEcIc=;
  b=XKc+SjizmCQDyXAsMqn0dtDqWNkwilcqyG58Ck0I2NMffy7pHh7ZR6UT
   L1KxqKPqkT8sEFzIpz8NoT97Rsd9ikka8mTjdX2rzhTzop3R+Z/PAfjJ5
   8WeFGeGxWsFqA7tUpOutL0YbZG9Yk7Hb0oAUaMs7TqxmgLx+sLfahacLI
   I8ZCHMdgpj+5WLRIR24kWjvjLHinz0sCCYyvyslDlnFjPImag5lrCaK5K
   TXdPAsSCrtFcYy2Q8rT64Kt9GSowQTvXoxDm5TZ27KWQ0JklFfHR+ZPzx
   r9tfg2UwmDAZjxAkvLcbTVuysPQjpOQwzDnlHYWXGktnF8W4jsE3m7AEq
   Q==;
X-CSE-ConnectionGUID: teLb4wBkSpO90DyDBxkoKQ==
X-CSE-MsgGUID: mJuIPtUzSWK00QPg10TJyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89175976"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89175976"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:18:27 -0700
X-CSE-ConnectionGUID: 6e6Id1a9RPOK9HtSaZh8Eg==
X-CSE-MsgGUID: Bxem8GA1QQmkwRtyiA7SZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1880129"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:18:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4004B11F894;
	Thu, 17 Sep 2026 12:18:23 +0300 (EEST)
Date: Thu, 17 Sep 2026 12:18:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: Re: [PATCH 16/21] media: ipu6: Bridge the gap between streams in
 V4L2 and IPU6 firmware
Message-ID: <aquwX3mpy6AWBJEo@kekkonen.localdomain>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
 <20260914205358.735307-17-sakari.ailus@linux.intel.com>
 <aqq_P3pGvZCwqkMQ@alaakso-desk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqq_P3pGvZCwqkMQ@alaakso-desk>

Moi,

On Wed, Sep 16, 2026 at 07:09:35PM +0300, Antti Laakso wrote:
> > +	input_pin->dt = entry->bus.csi2.dt;
> >  	input_pin->dt = av->dt;
> 
> Old path for dt should be removed for ipu7 too.

Thanks, I'll fix this for v2. I'll remote the dt and vc fields in struct
ipu6_isys_video, too; they're redundant now.

-- 
Terveisin,

Sakari Ailus
