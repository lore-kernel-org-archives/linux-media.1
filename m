Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA13A2568
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741366; cv=none; b=u0UsvxGxb5ZiYtytFFIuMigw6DfsAFmDFfp9bbiQ/xjJV9lGruylCn98ce2IAsMy6rdS1z0QRrkzr8q1Vlwy8H+5CfBiX4TBZ8gM073kg11fJZL+UFDc4QXmTybG3c3+L/fwwY4j8FUHV5HvxMSKMHT+Y6GrCvEwf14f66QUKx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741366; c=relaxed/simple;
	bh=xkWLYUl3P9YIonAH1M1ymWF3z/S6p0crDzIBMiyfB2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9dKfqMxAwfQkHUkduWMXWPD6GNatWrEDJBt2JtbxulDZ3DIpPNdnlFGKEL2DMk2LZ/N2zZwf9ju50jPRdlTseAon9i9lJZcXSRLtxus8MP2iyihmCcAiz9NCAlcmkdhO5OAYqDn9NfkUDc1dPr3B2GKlnu0n+fCZXvx31Tmdm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k07u9Ocj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k07u9Ocj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773741365; x=1805277365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xkWLYUl3P9YIonAH1M1ymWF3z/S6p0crDzIBMiyfB2s=;
  b=k07u9OcjTPd4B6n4W7HKoxq1BMIngJVMwIWBT42D7QX5SIVPRGUBzzLC
   V0hraUZpGWGGFOfw3Ko7DMrk8XQWEs5ymXHpVKZu2l61NYB/u9fiaQ7iQ
   s15fRkrloNOa6t8Fw++J3b5JhAOhaQbsvpZI753craUpTRwOidY762+jG
   hwIRv0kLFqI8aUaQ9IuscFMtYxE0EJpjbirWWbpyyNeM9MWLU3p7nGxMg
   mYCaStIn+kxuvVHbsXc3eSqQlXrY6RaB6vvceQD5TNifOaIqvofPmh6i+
   3OuXc12bxtdqNzZqj0+Y6RnDVIWNIsKTa9RnTHnYGGyCfS1RDD/6BSbAK
   g==;
X-CSE-ConnectionGUID: 912do8nRS5qLyluSuSBAuA==
X-CSE-MsgGUID: Hrtegv0uQ6ujaRAysssDQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62335667"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62335667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:03 -0700
X-CSE-ConnectionGUID: DMWUCO/UQ4qU2cc77Sg9eQ==
X-CSE-MsgGUID: pIWS8VKETCiRIlAUEMEl9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226344878"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 670A2121D57;
	Tue, 17 Mar 2026 11:56:00 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2RBa-00000000ton-1GBO;
	Tue, 17 Mar 2026 11:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 3/7] Add quotes for "-f help" in help text and do a line wrap
Date: Tue, 17 Mar 2026 11:57:58 +0200
Message-ID: <20260317095802.214532-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 8aa7258218ad..e8d72a68be30 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -929,11 +929,12 @@ int main(int argc, char *argv[])
 			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
 			       "                          (float, default 1.0)\n"
 			       "--format, -f <format>     Specify input file format format\n"
-			       "                          (-f help for list, default UYVY)\n"
+			       "                          (\"-f help\" for list, default UYVY)\n"
 			       "--help, -h                Show this help\n"
 			       "--high-bits, -g           Use high bits for Bayer RAW 10 data\n"
 			       "--size, -s <XxY>          Specify image size\n"
-			       "--swap-rb, -w             Swap R and B channels\n", progname, argv[0]);
+			       "--swap-rb, -w             Swap R and B channels\n",
+			       progname, argv[0]);
 			exit(0);
 		case 's':
 			if (parse_format(optarg, &width, &height) < 0) {
-- 
2.47.3

