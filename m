Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1379449DB96
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538507; cv=none; b=upAPtPwzBJ+6VEkMSxCNVZbJGnSlACT/EB1f7C14sxpV+zlWo9UhhAY0Q3ZOdOwG0eT9U/9SkLswj/D7EDYacBM96opyk8540BGKaEfA4lJpphNlLZqAwpOaU/FQlQoLi2n47pad1ICdoaC4p3srF9gVhlFJ+WLG/+4ffxLCxnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538507; c=relaxed/simple;
	bh=wyDfOJXkGlUDNy0FBr9eyqSTRIaiGuCRFVrdc/96SdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gnS2PgpESyb0dp0cS4tYgp5D1srs96pybEzcRYOz+OPyWCKXHrfuHZ1D+n3y8QjVcjXBc7LiwFnGfGXmP/kNsj1CniLo3hd2LiUNqbMcIlfMS6xNxIXjaZVVkBnQ0/LlfTWVxZOYMxtg9/ufjzQ21BUq2biq+mBrKoTPeWp7jAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAg9JIQT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAg9JIQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791538499; x=1823074499;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wyDfOJXkGlUDNy0FBr9eyqSTRIaiGuCRFVrdc/96SdQ=;
  b=DAg9JIQTyh6HdRMEhi7YlALNZEU2LdSgZuWYT7lccS/yOXZsG/6x3v+K
   6PXze+WzqRBqogZ7UvYnUIpofDLUfVsINEY8iM2GKilzpsPcsEUWbQerz
   50H1WRndL7y1Nr5VtG75M+ZXCB1AkfJ/8hj/bQMe+/St/8Pzadv/MtEiB
   6B9+3i2GTdg1lXThBoF4UwUKkY9mxKfzVMzW9E9ZiJ414ehmOFbM9K54m
   sZOK6UyIhjkuv6LDfdfUZX3JSnafhG6mCEg35AIk3Z45GWdyT9r1TniYG
   Qpn8Y6KgXDZnjhDPtwx3EbDFdNmSgWu2VgyvH81ELNAGbAkXkPVE/BXil
   Q==;
X-CSE-ConnectionGUID: T8LnLnTFQMSJF65AmooQ1w==
X-CSE-MsgGUID: TAp1oOFxSwayZUO22yxyCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="229298"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="229298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:34:51 -0700
X-CSE-ConnectionGUID: SPRgdFH1RfCSCaZzGeBxLQ==
X-CSE-MsgGUID: A5m0ZSgiRem9CeUCsnNNlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="596348"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:34:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D26661206CF;
	Fri, 09 Oct 2026 12:34:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF6xc-00000009Fis-14k7;
	Fri, 09 Oct 2026 12:32:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v3 0/4] ov05c10 cleanups and fixes
Date: Fri,  9 Oct 2026 12:32:12 +0300
Message-ID: <20261009093216.2205375-1-sakari.ailus@linux.intel.com>
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

since v2:

- Fix return value in chip ID mismatch case.

since v1:

- Also set the device's PM runtime status to suspended on sub-device
  registration failure (missed in v1).

Sakari Ailus (4):
  media: ov05c10: Small cleanups
  media: ov05c10: Set reset GPIO high when acquiring it
  media: ov05c10: Power management fixes
  media: ov05c10: Remove duplicated writes to analogue gain register

 drivers/media/i2c/ov05c10.c | 55 ++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 31 deletions(-)


base-commit: dda275330d50412de64f52e856633c66898a1573
-- 
2.47.3

