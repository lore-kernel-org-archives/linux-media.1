Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871473;
	b=WrbKo0h+D1+Yl9S7KxwifA/hVndYaevyRvzT7l9uKHTbfOMHzB1VX46o947DTs/HZ4uU
	 PsK/vIWB+Q3svsWZyAqAI0QQpkuOdF6+qZ9g/bOZiI5gYOXzSWgYf0IxksIx4273lltN8
	 7JDyyZlU8aWHRUQOOe/AibebFoD2kjhOH8v+lrwrOgKce7Ll9KEqnh/OnGJiOHMzLUAQy
	 PurrLpY+AhmYM9cn0DL28zfiG4E5R0bzS2zYCLimVYftpyN2Ev/9HQsdGcwIiJ5Y/IYYH
	 1mZb1yLyjWWN/Gxs8I9Z96DbYHV2tknTNEu8PaphCNsQvoD43EJDqIecYFdHEBl3A0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871473;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qyAGNseM9ZtGQ27A2pYj2pkGrtCSOCurKFsK0ofSkiM=;
	b=VMGJs1VeCYR1BfDzP9S/akAuoxekulegS5d/JXxuqLfbHSWfgl84fSz7q+b9Wate+IOB
	 /AtUyBkEa3NPp/utMk7u1aPAg9PDgy3Gk0wIWoQmLQ2ZYoxmoblekYGpJpgNPxe7sCTfs
	 ksYkvemx/z+5XA+3FMuQs+hfSLsPAr+Q3tRItwEFI8LFHTc7KA3sFo8WA2M8hL49nY02D
	 YCq0/DxwHDIrTVZ0cvFpFzufFGDterAbIFE2hPkYnwl0+WpquYNBbU5HxpQgK6U0DWMjT
	 oU8dd/vw46M5FRq2GhlFuaHNriRyKaaGkYIllFSjMLZ2zCBKMTJbCtUooO3To7N+H2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n9GeEokP;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02810606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 23:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02810606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n9GeEokP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794871473; x=1826407473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4EjdxvBGTgDDcc/xnTR1sIbuVBOIczIojOQ+UV/ePBo=;
  b=n9GeEokPZ6D4AN/9J1W6ToE7WGZ5xphRaGusM8pFZGBNyciNEiLOg+Gu
   ypvqWodlXKauI+kdxBucU1jBkrbVHvegmGt7a0SzYfeD9siU7iIPTX3lN
   Q62YL7EITqcqYRsl4rtIZhxKGqYZPkF9du0dhm2GS/UpyVs2t0vnjfDA+
   eFopewbut1LaEdCymz99pDbku5Bzoy6DvL2uXHzKhOleJUwAH44v+mp6R
   w2277N5G71kUKulDBEU3yNST8SMx5gyQIsx98EUCSSpgleIBWBwa0l1vV
   29JAHk48Yguq+bSmSupigpaIBHjOQM66iIOjdvbt/kMY9pLiGLpkNrMVT
   g==;
X-CSE-ConnectionGUID: Z01gbdQ6RzW4oiYnhnCnqg==
X-CSE-MsgGUID: UfmkCMVJRHSrDksIPULCww==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3632384"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3632384"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:24:32 -0800
X-CSE-ConnectionGUID: XAVzB3cfQKWNqYM0jqeqUw==
X-CSE-MsgGUID: WevRdIwZREejW7N7TpGTiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9992136"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.224])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:24:31 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A45A212063B;
	Tue, 17 Nov 2026 01:24:35 +0200 (EET)
Date: Tue, 17 Nov 2026 01:24:35 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Su, Jimmy" <jimmy.su@intel.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"Yeh, Serin" <serin.yeh@intel.com>,
	"vicamo@gmail.com" <vicamo@gmail.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: Re: [PATCH v1 1/2] media: ipu-bridge: extend upside-down matching
 with DSM module IDs
Message-ID: <avuQsyZAJ0OeSTsP@kekkonen.localdomain>
References: <20261007034914.1654831-1-jimmy.su@intel.com>
 <20261007034914.1654831-2-jimmy.su@intel.com>
 <avr3cTli70qfUMnw@kekkonen.localdomain>
 <MW4PR11MB8289A9EE5B4203B55DCE5FB59D7C2@MW4PR11MB8289.namprd11.prod.outlook.com>
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
In-Reply-To: <MW4PR11MB8289A9EE5B4203B55DCE5FB59D7C2@MW4PR11MB8289.namprd11.prod.outlook.com>

Hi Jimmy,

On Mon, Nov 16, 2026 at 02:43:39PM +0000, Su, Jimmy wrote:
> Hi Sakari, 
> I think we can integrate the two patches to one. 
> Because I saw one patch is already existing in current codebase.  
> We can submit one patch to change the struct array and support module ID.
> Then we can go back to our internal review first. 
> How do you think ? 

Feel free to post it to LMML first as we're already reviewing this here.

-- 
Regards,

Sakari Ailus
