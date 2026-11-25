Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613420;
	b=U5h6tpkEg2BaJM48tkIi2lV5kS+hWWxyKBsstIwaF9NrFGDiujg04OraQSCFBTb3UO8x
	 kb7bq9qPbL+RFQoCov/UEseWLL6gqMffit64Q5ZDa7exUIafLaGucf/DcZLAVkv7cZbWt
	 l71BGQy9KIENdqA4yh5A+KgeERAHlZ+53W4odSBWg47K38e99z8XNC3VKuNM3krXcAAxW
	 h/WVs96cmHDdnUAODYqhbZ4omtJCRZXtkRrw6kIjl/cemtwfdK9/+8y8oGkLR30+m4tmM
	 gPJkfwIonajYBHbwAjNOKEZueU8P0OI74izZd8Kp29oK3afqtwjPtaXDyoA2t01oX3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613420;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=s1Gh+4qSZNP9qOF38aqibpmIzblJfEpYYEOVY1Lb948=;
	b=jsuGKipwiiSPbbD0iaQA1ML1ZlOrwPDGfP3wt/ozIBdvnR4U3+dcBIQ6lkulbqeu3U7w
	 ol2oP7FXv2pCfI29jMF6tnLcLArw/4WRYEk5ytNqjrjgtgy/6MZtW59T/j2D8jmb/QCqw
	 C3PsehEyKsvvFH3rCtBf+r9n7rKdDGW44AEXrByURq50YqkdQr6MebChZEeXp7gEwJBFY
	 elmg88BDdBWCSQiBjp6hsbmsVSXEm4SJYHFseREN3qgNUSFyx4kOMFCMCQp/n8vPwjMxf
	 ODlHqsq3mEhcJHoLdYvOtvVfzQvSh+knBtUkH+xTQq0ISdNaiW8i/PiiTWRDzpP9igw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0EGO2h3;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FB606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2FB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0EGO2h3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795613421; x=1827149421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wRG9qP0UkWnDXx9rJR86vgrElIDwEqF+hnomFuNu2CU=;
  b=M0EGO2h39aSHrMFCtKiaDljhXqEdNorU5s8WDSn+f5yzkjkt3/CZ64sQ
   em63y6C0FPzN2zGuFkX884KzCmxteZ0ELw9UA3uRVQIGf1Gfe/ea1bXL0
   8kgVagTBlyT+gqvh1wviQenX0dXZ/amn0uxpjXVgQabQ3mg463JQMAI4W
   xCYFJeQcWzRSNH3+JnKfVofcj+qWDY0nLRPjdGSMVtFz9rGOAoiQo5Sb3
   /gP4qJ58aniA4FgnwJInZYP/uDmU3so7c19P/aLPibZhJGfb7hXXKTjjJ
   5hnqaWSjkr2RS2Woc/p+zpO+fpSBj5JbZCt21HJkhBN0iczNzvEtVJbGl
   w==;
X-CSE-ConnectionGUID: dcm+ZpKMQK2y7Qzja2Jhsg==
X-CSE-MsgGUID: kPbH4D/xSdSgLwADeSR7MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4482789"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4482789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:30:20 -0800
X-CSE-ConnectionGUID: PrAAdWSSQbeF1E5DxPwOHg==
X-CSE-MsgGUID: 7BAAd4jrSG2YlTtnQRpHRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11742706"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:30:18 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E088111F920;
	Wed, 25 Nov 2026 15:30:20 +0200 (EET)
Date: Wed, 25 Nov 2026 15:30:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jizhou Tong <fqwqf@fqwqf.xyz>
Cc: pm@petermarshall.ca, patchwork@media-ci.org, media-ci@linuxtv.org,
	linux-media@vger.kernel.org, benjamin.mugnier@foss.st.com
Subject: Re: media: i2c: vd55g1: correct VD55G0 register access widths
Message-ID: <awbi7CelGQ5VibWb@kekkonen.localdomain>
References: <6aca088f.a3c0497f.3c6821.df4f@mx.google.com>
 <010601a1332f4eaa-5932b837-0115-450a-8e70-a84086c38df4-000000@ap-northeast-1.amazonses.com>
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
In-Reply-To: <010601a1332f4eaa-5932b837-0115-450a-8e70-a84086c38df4-000000@ap-northeast-1.amazonses.com>

On Tue, Oct 13, 2026 at 02:55:00AM +0000, Jizhou Tong wrote:
> The next revision includes explicit base/prerequisite patch IDs. The
> dependency is still required; those tags do not make it a standalone
> patch against media-next. Please evaluate it with the prerequisite
> VD55G0 changes applied.

It'd be best to squash this fix into the bigger set that introduces the
problem.

-- 
Sakari Ailus
