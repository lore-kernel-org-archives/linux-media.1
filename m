Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507957;
	b=hG+7qU2DQjSgZl2qs70YawqmfnY+enOkRAxhmYNQHUhSSJMnO4CVTzF/uir6W/yD8bSK
	 0S8Ngns1NZ5tgVI/tlOag6jASBFTjsJBCTSA3aOoulJYjktYxXkkr8p2I+nHT2uRld0Fv
	 oGjTUV/LV/4RQFjWsB9/EkxYJZCJuMI30na4z8ex2yQcSNs0lOv4xmYuh0F904vCw02Gl
	 uXMJUZu0CkZU7nPw0sWQxkparByfRnH8WQCLQVfnP/RgRRCzLrDH3mgKqHiYQPCtHvNC+
	 EawvuhrO/KiOXzUaVvb2eeMkJKbXDUVCgb5wmkUBCr8xT7b0ciPD3Pn8i0/NJPBACAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Vh6o0Uq0GD1FXVlvKlx8RTkFOpyY76iCiDBsd6zPbMY=;
	b=5QhyNZz+I7JSY3iaMa1XDi5qqnxiTEjypaubj5dUSb7zi+ybMJaMe/WxFyySXY5vwkZ7
	 VNrOih4cLFexxehPHzSEFet4mU3sQiM20Y5E/edm44HBQF1h4rfCjgYYboOte8KU0F6XC
	 5sD3u5JTY0tPIfpGiaGhiFo8sCutHWANAs6G3mldVn0Zxg9WziJvB0jOAglDXY/JE8M7R
	 SevnXIK/jvDYI5Ao9Fr0kbAJlrvZhQt3PmdkKga52zc/fTkenn4/U0N18EICIjtPqH+dr
	 ObSTH3nmfd2AyIc68VGnjjMjfI+GDmUFnDpGZL8Ez0ZgRSKruXPxmAoNgWnjH+EnKSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1askq4J;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17A606A321;
	Tue, 24 Nov 2026 08:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E17A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1askq4J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795507956; x=1827043956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rf4Wny/8xM0G/G/mMyP4juRv8qe8MSGZhUvTveLTgjg=;
  b=E1askq4JTQmZOy8MODXzMAThjB8cxs6WzYSTVZ0+CnDTAkjwYpvEvxL2
   KhUQbCLZIvqC+KEIDcT3HuJfFuVlZivW0W4NzZYX8/D1MqhtpKADFs8s3
   ezAnyJpEnq1T/rAkJUoClfrs1lUveP7mAArARLyNN/SyraO8/N9RtiYEm
   90OBzB9aWc+1p2LjlyxrpD7iAVL4u9zwbEthYakQJJMbLGeLWc5S6eiPh
   y5PYEbQ3gCc5fcJutQjWnMc/Sb/UChwyQBdMALi4oEy7GQfpYTm27Yg4C
   pn+fmoek43hXcFFYnwCRTZ4bHRKF8Y9afiD3Hp3qJJlHA0VlQQZyycywp
   Q==;
X-CSE-ConnectionGUID: 49DpJY3eR42uBfp/4abgFg==
X-CSE-MsgGUID: 060qbe0BSHGpJvsfKFKzmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4438885"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4438885"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:59:08 -0800
X-CSE-ConnectionGUID: tuGy8414R4S2qYx5/P+aDA==
X-CSE-MsgGUID: PQT5WKGnTv6NiF+C2djBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11830089"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:59:05 -0800
Date: Tue, 24 Nov 2026 09:59:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Remove unused timed controller code
Message-ID: <awVDx5P4yvcuVXWp@ashevche-desk.local>
References: <20261123200658.449-1-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261123200658.449-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 08:06:58PM +0000, Abhishek Chaulagain wrote:
> The timed controller HAL module - timed_ctrl_snd_commnd(),
> timed_ctrl_snd_sp_commnd(), timed_ctrl_snd_gpio_commnd() and the inline
> timed_ctrl_reg_store() helper they used - has no callers anywhere in the
> tree. The only remaining reference was a stale #include in sh_css.c that
> pulled in none of its symbols.
> 
> Remove the dead source file, its public/private/local/global headers and
> the timed_controller_defs.h definitions header (included only by this
> module), drop the object from the Makefile, and delete the unused include
> from sh_css.c.

> The timed_ctrl device identifiers (timed_ctrl_ID_t, TIMED_CTRL0_ID,
> N_TIMED_CTRL_ID, TIMED_CTRL_BASE) live in the shared system_global.h /
> system_local.* enumerations and are left untouched.

Why?

> No functional change intended.

-- 
With Best Regards,
Andy Shevchenko


