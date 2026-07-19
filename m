Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58F0322B7B
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 22:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784501389; cv=none; b=gcqlycDX5VpulBraNmmTjedoRzIYLDm2CBwBoxC1Y5QJdwy1mgbczbgvYbdB4UOu/CNrcOR/daCCHGy4w2keae+N/mKnYyX59PTQ+Jbro3ts+5Rk5jnrwRSF75JeUF/Zf3Lx4vufxja6FbM18WhNm7bdeG0epAHGgyBfhPsaHJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784501389; c=relaxed/simple;
	bh=uts/rJboqGLxgTu9WHE00pp+1byILH8yDgoC+OFfkDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSn/WkW3U5ONqmNOCZemRcFZvRntrcxSzPS7zpFlr6iBMZxFB4s5J3PzSBKAkz0ryYqwkawatScgY9zdhMZZ/we9Z61bXdPwB66HE+GOHqQi5eN1+8ZiS33NOibdHcN/8O/z/nxqR4oDSg8gTG5k6uizStpPzca5Re2cpfKskkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8Gw9mFd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8Gw9mFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784501387; x=1816037387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uts/rJboqGLxgTu9WHE00pp+1byILH8yDgoC+OFfkDw=;
  b=X8Gw9mFdMp+Yt1yitgyRAXZKGNquP5qfWM7yFothBDgCOh4ZrZ+Uwrlc
   g9m10TKrWjNWappLof7kJ0WhjxbS0leq890Cp9xQ6qv4usbNR0vEsq3an
   cVV4VIqCQAStrp8D0BrWNZYYuhHQGK39uh5W6OfLsHGvaMh3Ywy6x6M+F
   xRA1ri3w/vtEX79J9btXabKZCmAtrWT1wTSD29Cy8pwkDyS87juEEvson
   3WCswj8mC/AiiHVsbEciOGfEJsLpqMMJPGNoUmr9NyIppeDLgEOJv5CM6
   hAcuDHnRQzvSIOiaK/cRK/Wqr3jKBWoal5G6jHsYkFLBdkhlOqnFbPw3X
   A==;
X-CSE-ConnectionGUID: KcwhqXd7TQmsa/9kzF8Hrw==
X-CSE-MsgGUID: 7r+6pRrbSlyXnehsiCrwdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85284941"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="85284941"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:49:46 -0700
X-CSE-ConnectionGUID: P8mEsH7ZSyyKpaw1jJ8u1g==
X-CSE-MsgGUID: YXgC9cc4R3yrzhY/pvWY7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="261582405"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:49:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 02CBE11F996;
	Mon, 20 Jul 2026 01:49:48 +0300 (EEST)
Date: Mon, 20 Jul 2026 01:49:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 18/19] staging: media: ipu7: drop unnecessary cleanup
 calls
Message-ID: <al1Ui1lfzqJzgcX5@kekkonen.localdomain>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
 <f53405513d94e58f164ba42618b712689998f4dd.1784276382.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f53405513d94e58f164ba42618b712689998f4dd.1784276382.git.hverkuil+cisco@kernel.org>

On Fri, Jul 17, 2026 at 10:19:41AM +0200, Hans Verkuil wrote:
> If the video device isn't registered, then there is no
> need to call vb2_video_unregister_device or vb2_queue_release.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
