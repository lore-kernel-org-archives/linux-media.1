Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E65A395AE4
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 19:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377104; cv=none; b=BhFfnEEQ22N5e6SqOv3wNff+tQ8/uxjpkIprY7KQk4Bc1KilxhZ72akZjycl8UXIkJ1WPYmrCtDOinZuabS+UBseYDGafAaXgHIB6ZqdEorumvPAGyas2gYRUFS0xJCUKSI1AR8umGd3hyUTVx6928V6to0KCvNa6fpECr8EgPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377104; c=relaxed/simple;
	bh=2LM7KB6iN5oPOcRr//+KhomCrF7WG5ewiRkQqoSzP+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1nXzZc30DJ++DoZ0DH7H2DT6cIwBoy8OmRn5MlMfwPyAfQwhVW1+cKxyTAB+/Iyz98Vcu+XkWxMd5mUSEKYtiC8DwvbUWcTToXS2ph684kyL3xrVkrarWChjuu/hMn2zZG5+WTvWFk/5uwDSTSSelnFJS6pP1EAjp+Z71g1NP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0lkd2s9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0lkd2s9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788377097; x=1819913097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2LM7KB6iN5oPOcRr//+KhomCrF7WG5ewiRkQqoSzP+c=;
  b=d0lkd2s9drKZvy8M/KMADCeVpl6buY1LQRIUmjMJxeHdPtu1ivbxGa5m
   bEVLtHC5Ldx3+VD2gV6huypnoK3j3c25XE0GJ4HTFXbj44PzSRPEWxtJA
   YFLB8lCodluNvi5TARPV53VLnnHv1jckEteUhGLUhDb7attVgrNwIQZ9H
   O/snIRxV+jDSooAdstU+znTgo8g5Vj9PYqr0hyONJUWQ+npYqqFA+exgn
   WCJyZRBhIibaAMKbQWb1kziJ3fYxteg+lZKBQXkWevOcWfA7795ixGQWm
   ngJ814XXM3nQpUecpbvS4ho8eXW/HqrmGwKKqQglrSutndYkOUMud5xSa
   A==;
X-CSE-ConnectionGUID: RNaK9YDaRFyazjG4jmREtQ==
X-CSE-MsgGUID: xZ2wAiBCSL636lS7/VkMBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="91359179"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="91359179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:24:53 -0700
X-CSE-ConnectionGUID: liH2XGTeT2usD8ws6jxllw==
X-CSE-MsgGUID: uXkMxrS8Rt6WYpF0HEpUMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="271462716"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:24:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F412211F7F5;
	Wed, 02 Sep 2026 22:24:49 +0300 (EEST)
Date: Wed, 2 Sep 2026 22:24:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: linux-media@vger.kernel.org, Linux Media CI <media-ci@linuxtv.org>
Subject: Re: [media-ci] Re: [1/1] media: ipu6: Add a Kconfig option for IPU
 7, 7.5 support
Message-ID: <aph4AQrGXJWU3KVL@kekkonen.localdomain>
References: <20260902080128.1286050-1-sakari.ailus@linux.intel.com>
 <6a983846.bd8478ff.19809f.007e@mx.google.com>
 <CAPybu_2Yk2Qt6BjH9JEmxc=t57Mac83xUGxGzcjycXRaNjB8gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_2Yk2Qt6BjH9JEmxc=t57Mac83xUGxGzcjycXRaNjB8gQ@mail.gmail.com>

Hi Ricardo,

Thanks for the review.

On Wed, Sep 02, 2026 at 09:06:55PM +0200, Ricardo Ribalda Delgado wrote:
> Hi Sakari
> 
> On Wed, Sep 2, 2026 at 5:30 PM Patchwork Integration
> <patchwork@media-ci.org> wrote:
> >
> > Dear Sakari Ailus:
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > # Test static:test-compile-all
> > Unable to build VIDEO_INTEL_IPU7
> 
> With your patch the CI will be completely blind to the legacy driver.
> 
> Could you add a Kconfig rule that enables compilation of the old
> driver if COMPILE_TEST

Yes, that makes sense. I'll send v2.

-- 
Regards,

Sakari Ailus
