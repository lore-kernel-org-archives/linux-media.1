Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819809;
	b=bcTihUuz82PBRiYj8PexSfRThZWG0NVBMkusI0GjjRb8EOz94ep2hl7qIWWjUV/lxDL3
	 P99J6zGEZnsvW5OViasJWc1+Mkrz8jLRQFzAvaz6V1jdeaypY7wErLYD3Ub5DDzA8wdjH
	 nmlMhD2SREfGRdoVk2+aYGmBVqYyjQ5ItWxFf/2BdBCB7Rr1vCmnnKzFK6g0ssspRxiJx
	 SmTBl3B2BHRslnPbJjntoizdyVmTRxWqoaOaKXV8WBRJaNFgyoeWg+t9Tal3i9XMqDK7p
	 U8SIKOa8icAmn9/Rzl4K7e2UeDNUGpWJlGh5JDnk9N6DYPiVUgd7Sj3fWnX/HYfmr9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819809;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M3QkU2Ej02iW4Ch/KAG65r7bhSmgKAA3qU7ThHGz4+w=;
	b=L7GD1Q1F8wdDxuwJle1x8FXCULne8AZLgcE1knZ28Ijg6ATklTqcXm0HWTSNpVG0ONRm
	 uVslAatAoJY8KuOmGPPRb9XoJvc4cnDPLdw5HsUJMzVKqTQdBpZXa9Pz74fy3k4IAW9I7
	 8iWI/sYb46TwE1JIq1K6Usf6vKG1IYwcYmtLU2+9CyUj2yZPLsQiWz06YttGAH0egciAm
	 /lZ3POaBxtie1O/dnJxfg3O/B4rCaWhpyJz1FKmg5GQuEiwWNZuBmWryTMeHAGAs1qk1o
	 rX+7dtWhrnHBi9rPC1roQgzMi/pNvIsKqtka1jJ8kkz6QepRSf5ZqMbXhvBlcIypSbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7iE4Eec;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E187B606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E187B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7iE4Eec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794819809; x=1826355809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ia0yW06q9hYWRnyVORWjSwk+DCyvSCaz920O7F+jkYY=;
  b=m7iE4Eec6skNMQp583V7WUTExEmd/m2o+EkhtD9P7WUA9Uf7yXlPCKmL
   +9LR0AKgBl9r97NJM3qCMDzjlQXsypyH/97c2l61+TjP0l+xo5k5pNOII
   qH1aHhybx5YEPBXnV8cwfYp7wwUUeEEoKnnrBF/E5E/JonLUpBMF21wkx
   XHw3l/DcMABIw9WkmwIUzlvV9z6xw7idxxEjvk/g5i2YAHN9iX4mQCAZI
   eXwkQC4Su1tqcz+65hB6gWCuV/qm0v7I9t/dZUzBK/0+LcwT72kEbeicR
   vjLnYy0/CXQ5/pHbXvsrMnQ9lYcTHcNPigF1BO1ra+fABG6uAFVDlUYfR
   A==;
X-CSE-ConnectionGUID: /44w49QLTSCOykph2d5RLA==
X-CSE-MsgGUID: vUC+mkQ2Stq9ILQf7bA26g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3561331"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3561331"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:03:29 -0800
X-CSE-ConnectionGUID: fPhT6j7hQ0uoMBujusTILg==
X-CSE-MsgGUID: OB+AKHmmRZu1f9KbWJJ9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="11276179"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:03:28 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5C7FB121B5D;
	Mon, 16 Nov 2026 11:03:31 +0200 (EET)
Date: Mon, 16 Nov 2026 11:03:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Su, Jimmy" <jimmy.su@intel.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"Yeh, Serin" <serin.yeh@intel.com>,
	"vicamo@gmail.com" <vicamo@gmail.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: Re: [PATCH v1 0/2] media: support upside-down camera mounting
Message-ID: <avrG4_oFx0mIoJUe@kekkonen.localdomain>
References: <20261007034914.1654831-1-jimmy.su@intel.com>
 <avbM3VvDu7PuhZKC@kekkonen.localdomain>
 <MW4PR11MB828958D66F3062048E5A9FB89D7C2@MW4PR11MB8289.namprd11.prod.outlook.com>
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
In-Reply-To: <MW4PR11MB828958D66F3062048E5A9FB89D7C2@MW4PR11MB8289.namprd11.prod.outlook.com>

Hi Jimmy,

On Mon, Nov 16, 2026 at 08:03:32AM +0000, Su, Jimmy wrote:
> Hi Sakari,
> I checked the latest codebase and would like to confirm with you. For my
> current situation, I need to rebase and re-submit the patches to v2
> version, right?

Yes, please.

-- 
Regards,

Sakari Ailus
