Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B643F4A6
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 21:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493663; cv=none; b=uIVDwdIetfvmWA4brEl1ectRN0r43jfGgKt1COWFdsxg5DJoLSKy7i9ug+IjJ0zoTqgGfGXAVTInKWzjIXpzdgE2uvxk9vCSwvdRm9WDAeXP4hwA89mBa9omwwQfQKDVhqGrTOZOuXjc29tV//bNdgEjf8fonqBBHIM9uAnkt5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493663; c=relaxed/simple;
	bh=GEOI17BJL+yAGaPH/EhFMqyt6lrYXhnALXb0USygvxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R1wb7DQrUpV5dsY7fOYGC+bxADX7ZKb34+xdSoC6zkxcIBpoSDvADiTq8QRq69oCeeaaDrtduDHKat+nCzt6WJ914mltNZO1DEeVDp6CzplJgiUW6/m7HUJ3s0jhy+vRh0akvJBeD2hrxf+CO3M01ifUe5dDhd0pn1zqYVbIzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVRYdseX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVRYdseX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791493663; x=1823029663;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GEOI17BJL+yAGaPH/EhFMqyt6lrYXhnALXb0USygvxY=;
  b=nVRYdseXn6o6qgj+P4jRC0pbdMqubjTKeeXb9IOTmJuz510/NIyEd1cy
   Ooo3O/A+uyC3KP0jZIJk/QlswXyX+r8LEAS1gWTldFRwQk6UCEJ8HUCJy
   y5F9sqpNjJ6c/GaehLMyU2ltv1JVqIQpOJLy5LimjFUNe2DN7oSOkx2M9
   BewA6L/qcLyr5XAzf0bQCeqzH3/7YjznYSbFh5Y4yiSW477lNEIi9pWWS
   HUcsfBZme0XUTZvDK/YPQzIWW8oKkUS+4CuBzXQUeGED+sZr6/Bia7ouF
   PeFa3skSTdRsy5BtX9lQjZwK9lOvKp/q1botejaguDc6aDi9QOlUA6Mtr
   Q==;
X-CSE-ConnectionGUID: 1Sx7vDEzQzC6546PR0rArg==
X-CSE-MsgGUID: JcHlLt+HQSq8crv4xPCvWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="173196"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="173196"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:40 -0700
X-CSE-ConnectionGUID: pG3ymyjoQGeeEM3Nio6ojg==
X-CSE-MsgGUID: pv429D44QcC+Phd/XJIkcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="135315"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3F8E11F851;
	Fri, 09 Oct 2026 00:07:39 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEvIW-00000007skY-02Jk;
	Fri, 09 Oct 2026 00:05:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 0/4] ov05c10 cleanups and fixes
Date: Fri,  9 Oct 2026 00:04:59 +0300
Message-ID: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This small set contains a few ov05c10 driver cleanups and fixes based on
Tarang's review.

Sakari Ailus (4):
  media: ov05c10: Small cleanups
  media: ov05c10: Set reset GPIO high when acquiring it
  media: ov05c10: Power management fixes
  media: ov05c10: Remove duplicated writes to analogue gain register

 drivers/media/i2c/ov05c10.c | 53 +++++++++++++++----------------------
 1 file changed, 22 insertions(+), 31 deletions(-)


-- 
2.47.3

