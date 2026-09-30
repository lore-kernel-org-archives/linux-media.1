Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEE0470454
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757689; cv=none; b=VRNrIlVHniQvkPlN+0BGClfjNTBkRQelMIiVYesJJG2KSayl0bAKctJXP9NTo6KQGfLizasAsURaSvcGLY7oemU43OoPqM5ONMTSwg4XL87L9StJri6XFI0r4uG1VLF/omZgo/wBQpsjGROJavmTz9QvxtGhAwgjFhwzSzOMBQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757689; c=relaxed/simple;
	bh=Sst7bTv9oWWsXCe2E3cZDo20AOf0BmR8ZSOn9WMn1u4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKs5Gjh0TRhMCVsfHXYGgMX6OrcK7MPqmgqdVTBvJDKU2urGIivTc5YyPyhKsmDJHQYiGCvvNt3sjkDOYGlY8Pp3XcTXkno5POlBxDzrwfEBEzRDM9Tg8V7kLIlQJj3yu5djwG5Q/dcOpoAlye5eZ3e/vC+cIGFqn95SmoRM3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7RRNLwb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7RRNLwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790757688; x=1822293688;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sst7bTv9oWWsXCe2E3cZDo20AOf0BmR8ZSOn9WMn1u4=;
  b=j7RRNLwb/XaoIm0foyS1LAWKwsd7BG6qd8dqXgNZAF+Ys1UsSzq2Sbwc
   I9FQBUNqfUvjiLi95OsXVjtfnc44skGbBAyMo8AoR2PxdiH/Kp1tB+dY2
   E+NYxoUcg9HYZO1KIkzGI144YKtbpZ7jJHGbvWlmH/eoox4Js7/0vjV9l
   sClkG2evY/4BFqaAyJPi3ZyE9bO6aKTJwDJRt4pkyjVYX7PDPUenYx4nw
   M9oUk7NsEDS8JF1CvX2Dy8RlkCZ1CCFVUs/UA/SiUE//zIOU6tbxQ0RW+
   glZkwr8sHabnv8SP6yKxDjp7rYJGrC8loouvhve95SZLKS1BKKU8PjLpO
   w==;
X-CSE-ConnectionGUID: DMatuUfiTtOGSDIUtl0HzA==
X-CSE-MsgGUID: 5jE9Us0zSjeEYX6hWhE2Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="79056694"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="79056694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:41:27 -0700
X-CSE-ConnectionGUID: HEoBEGv2QxGos1pajH3ouw==
X-CSE-MsgGUID: XbENvfoZREOeYdf1RGX25Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275665826"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:41:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D4A7A11F8A5;
	Wed, 30 Sep 2026 11:41:29 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xBpsW-0000000B0n9-3vKF;
	Wed, 30 Sep 2026 11:41:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>
Subject: [PATCH 1/1] MAINTAINERS: Add more reviewers for the Intel IPU6 driver
Date: Wed, 30 Sep 2026 11:41:28 +0300
Message-ID: <20260930084128.2624644-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Manik Bajpai and Divyamani Tripathi as reviewers for the Intel IPU6
driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc4a2dc6d30..a756791bf99c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13261,6 +13261,8 @@ INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 R:	Antti Laakso <antti.laakso@linux.intel.com>
 R:	"Sapre, Sarang" <sarang.sapre@intel.com>
+R:	Divyamani Tripathi <divyamani.tripathi@intel.com>
+R:	Manik Bajpai <manik.bajpai@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git

-- 
2.47.3

