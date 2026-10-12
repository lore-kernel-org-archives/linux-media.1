Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D83E765A
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 21:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840201; cv=none; b=LgmqakBTn5ZcXmx2yjuq3lcN9/8GfF/FD+jNuCCJ7V9V3tu1ZByBxcef3LuUMA9qFYegKUGDg97JdA9Xu0W9RUaUePO9ErzZsGrXQrB9Y4hrBkZ3j58Y3eAljOxYqb5uBH/6yO7jGT1dS5O/yKZAGRB4R7J3YXHo2lRoZmr90GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840201; c=relaxed/simple;
	bh=oLikO/2NwksavMgF+ssjnX+vc49uxtEzkjRqIjITTdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2Vt8tNjo1rxmQsOMc9xoXZA+3aeTsuzfSQw/cJzN5+KFu59J2DSOqZ3hkCyzo82nzafs25A3t1qgq7TR8MYpzQnnkhpaAkDYE9usRaRLQKF4IVtW4dnYc//pNqvOJeFtous9XOaaPIJ8IANiSG6pgS6J4TkMMryXiZcHsjL6ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ahce+UEt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ahce+UEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791840200; x=1823376200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oLikO/2NwksavMgF+ssjnX+vc49uxtEzkjRqIjITTdk=;
  b=Ahce+UEtPo09YWM6navV2SNlcseybzPRO8VHRkJ3wVLGQtQlp7MI5j+y
   HbMPDw7grUc2kcfBemYd1XfAy1l/2/TSXexwTsW6PYaNO8UW9ya7mz0rT
   krqiRlCrUtyACyjiDk2nnyR+iWbZGfstUDIB5F55yO+Nd0TtJ9TC/PoYG
   nrsb1BPXQVRn5lCmGK4KJGZy2vFZwQO/BPM5jJC/PcI3tqB2RUytqUmLj
   PwkOy+TlhFfFf/EKDBxp2z5lkRp0CM1h7oBuav4hSIge/vFqjWY58+8o+
   5YEQYku2Ns9BTltU4cITWnVDQd/0R4EDXBRH3uHg3iTyRjkX1Ec56Sugh
   g==;
X-CSE-ConnectionGUID: aIahk4MwTUatDpe2yIKsVQ==
X-CSE-MsgGUID: WyGzOVBGQciJZDBVkMpEKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="552669"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="552669"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:23:19 -0700
X-CSE-ConnectionGUID: aPERsKGTQLeMJaNmcYkG4g==
X-CSE-MsgGUID: 1GXTOmO0RfqKSCXLLBZIPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2749066"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:23:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6FFF5121BA6;
	Tue, 13 Oct 2026 00:23:21 +0300 (EEST)
Date: Tue, 13 Oct 2026 00:23:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, miguel.vadillo@intel.com,
	mehdi.djait@linux.intel.com
Subject: Re: [PATCH 2/2] media: cvs: Remove runtime PM support
Message-ID: <as1PySfZ5TbRYaCG@kekkonen.localdomain>
References: <cover.1791831649.git.antti.laakso@linux.intel.com>
 <347b1ce25fd4d3197dbe47db2b23b6d0535b0bae.1791831649.git.antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <347b1ce25fd4d3197dbe47db2b23b6d0535b0bae.1791831649.git.antti.laakso@linux.intel.com>

Moi,

On Mon, Oct 12, 2026 at 10:25:25PM +0300, Antti Laakso wrote:
> The CSI link is handed to the host on stream enable and back to the
> CVS on stream disable. The runtime PM is doing the same, and is now
> unnecessary. Remove runtime PM.

The sensor driver may access sensor's registers when the device is powered
on, e.g. for setting controls when streaming is disabled. Not every driver
does that but that's why the Runtime PM flags are there.

-- 
Terveisin,

Sakari Ailus
