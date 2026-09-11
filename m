Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10642377F
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112620; cv=none; b=CgxmNjvDTUGcolQ3rUZH9qyfnMQ69ml8/Xh9SuzaCnz2IxNXM8LeAStK3jNba4jNno8JK519BBWqjb6WNfDRGJ9RaV0phSIUuw/QIUEDKlooWFEzbmflrswCmCyn4Lsa6Ld/nrLPVGJageEVVZVIlrsjwSSnGnWkTpy6XkZWkH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112620; c=relaxed/simple;
	bh=G2FqqMoeWG2H8RoJ+eFr6e+y+AL8DkHxt72WlbWK86Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM7fuaKFpIVyirlDXTJIRWFPqmKAHdNwVdMIgkoTI8AvRRPZcFlVyF2mqrhH0DibDfLDXM+IcOXhuSh2NBriFQTM7wy9I4ZhHMB6QJzTnxncnfpzClEFN7kS7TE16uOUZVv+1eFQkwxPKWkZkWfMzt2rZixVxg/auBchkxeKot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzNGzj9B; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzNGzj9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789112616; x=1820648616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G2FqqMoeWG2H8RoJ+eFr6e+y+AL8DkHxt72WlbWK86Q=;
  b=JzNGzj9BRc5B6yzimrUJF7Vi1TVO+VGKeP4TfIB9Tw0O8+m58f7TL1I5
   6zk3vzmVmoNrMdKZ2RF9aT6DUCBY8Q1uKZCs09oVJDBrGiP6G7ZO3NE67
   uY3IU2uDFrzuSjMCdABzn01rJc6tYDPxsBDhbK5bk5r/QPT4tGLsjqROC
   SGVl2bX8RGJ37DJCa3X5kmHxdtS8iSNrYtK8JUKYv7fGN+aMAZhUjvj2b
   rXSLKjYfzfT8dFwfDbIzTe4aweI8oshc0zHVKKYflNIv7X0QiVRoWgCU5
   hB5BgEhQ2VnPxB1a1MkWzFDo2/VZ5gbuDMYcb9KhqwWi+y73DLlegln/j
   w==;
X-CSE-ConnectionGUID: hGSr4my4TiufgN6BZwsxGQ==
X-CSE-MsgGUID: 5s3iRDd+QUWcQnkU9qBHug==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100168319"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="100168319"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 00:43:17 -0700
X-CSE-ConnectionGUID: GUDo+ccMSXKQ1zYgAUFHGw==
X-CSE-MsgGUID: BIQ1L3bZSHWWwJV7rYMEcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="272355935"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.128])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 00:43:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EED401218BD;
	Fri, 11 Sep 2026 10:43:19 +0300 (EEST)
Date: Fri, 11 Sep 2026 10:43:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo =?iso-8859-1?Q?Rebou=E7as?= <rgreboucas@gmail.com>
Cc: linux-media@vger.kernel.org, lixu.zhang@intel.com, hdegoede@redhat.com
Subject: Re: [BUG] ipu6/ivsc: no camera on Dell XPS 9320 - mei_csi probes
 without fwnode, and ipu-bridge lacks the OVTI01AB (OV01A1B) HID
Message-ID: <aqOxF23Tk6elRzOD@kekkonen.localdomain>
References: <CAFi4C3qMF2v_PcBu7wxN0MXe6V2yO1P6=+D6EEfBiXde0ggQ=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFi4C3qMF2v_PcBu7wxN0MXe6V2yO1P6=+D6EEfBiXde0ggQ=Q@mail.gmail.com>

Hi Ricardo,

On Thu, Sep 10, 2026 at 05:34:18PM -0700, Ricardo Rebouças wrote:
> Hi,
> 
> Neither of the two cameras on a Dell XPS 9320 (Alder Lake, IPU6 + IVSC)
> is usable on v7.2.3. Investigation points at two independent problems,
> one per camera. I am reporting both together because they share the
> machine and the second one is trivially fixable.

These issues have been fixed in upstream by commits
ce92674d8d8b29562de397b437e16bee499dd92b and
7456b40bc992a3fc34b587545716729923d507b9 but it'll take some time for the
patches to reach distro kernels.

-- 
Sakari Ailus
