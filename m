Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF4352002
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 21:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113871; cv=none; b=hwBgqRcGVi9CWiU39t3124EDKMSNFNS2QoUrgA4+3CTgBHZtUmfgXyyy55Xq3DPJibQhb6kOybun/SzEsxGz6+bS8Jgl+FitTeSKb94rNen3RSM/YuVpoKPZhJyXALZ73d4QI63XAUvla6jDeLySI0jtTsEHdjKnpyMKtaXvsZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113871; c=relaxed/simple;
	bh=1my2TMZlkdT2BythqYoo841nJWoXq9KvJDiYYm3GFqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHaekO0f4Ups5MEd/cvdv0wqfpuoTYp4s9+gE7tUchdFdQAD+IoWwZLJoF7fqlD8J9avtUI9N70Iy2ycmkl7I6IvjPwvb/mK4B35L6izGEYh/YAr/2cV/1w87FwSX234s0QflEpK5nhOeUdk/TZuvo7bJP/o86POTzaxsejd2k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbD3vhiz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbD3vhiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783113870; x=1814649870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1my2TMZlkdT2BythqYoo841nJWoXq9KvJDiYYm3GFqc=;
  b=dbD3vhizTrSHHAPUba7KeeqxXAnH1btdYRIi0ZRjmLqr6QgCk0XXvn/B
   78mQPgR+3Cr1YKaTeln4aLO56NnmSUIf2ArBCbdIOyyhVbQ29Wi3MeBb8
   +q3biMuDSaVuVkptpbpjI5MNqaJU9sdb80WIAhV6BRg/Rz+/VNo5D6t1w
   +Kpo/IVz7i6lf4uV54wOneKZJhkRIhS27mu4SmSIX+W39N+J4fecSdMuL
   x82LpHiyEquXky96O10kzAQO7nu7GvI/c25hYh8P+W+9TXw8joknpMjZ7
   9REG+g2nR9LEOJsjfcP5udGq8yKpHWW0hEczo8OM7fTzEt4R5IvNr0sN/
   A==;
X-CSE-ConnectionGUID: OfsXkFHtRFivWTkmfEMePA==
X-CSE-MsgGUID: LC6zvxCkRH++NZtEiWQ1Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94508762"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94508762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 14:24:29 -0700
X-CSE-ConnectionGUID: goiuDWKlQ/GsTTLlsq15Og==
X-CSE-MsgGUID: MsUY5XBsSJeX5k68OM8tyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="255107585"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.217])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 14:24:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2641E120443;
	Sat, 04 Jul 2026 00:24:25 +0300 (EEST)
Date: Sat, 4 Jul 2026 00:24:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	daxing.li@intel.com, ong.hock.yu@intel.com
Subject: Re: [PATCH 00/41] media: ipu6: Add support for ipu7 hardware
Message-ID: <akgoiXheHnjrDtqW@kekkonen.localdomain>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
 <2dd5cef71eb1ce5c246e64105ebd0d5cd593a0e0.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dd5cef71eb1ce5c246e64105ebd0d5cd593a0e0.camel@ndufresne.ca>

Hi Nicolas,

On Fri, Jul 03, 2026 at 12:17:17PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le vendredi 03 juillet 2026 à 18:24 +0300, Antti Laakso a écrit :
> > Hello,
> > 
> > The 7th Gen Intel Imaging Processing Unit is a PCI device including
> > input system and processing system. This set adds support for ISYS
> > in IPU7.
> > 
> > At this point only IPU7 is supported, not 7.5.
> 
> Is this implementation replacing the staging driver in
> ./drivers/staging/media/ipu7 ? Can you outline the plan ? Compare this

That's correct: there's no longer need for the staging driver once the ipu6
driver has support for both IPU7 and IPU7.5.

> implementation against the other one ? Or perhaps its just a different component
> of the camera?

-- 
Kind regards,

Sakari Ailus
