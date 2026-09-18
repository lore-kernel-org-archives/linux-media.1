Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466FA4AEBD8
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719485; cv=none; b=ilMr3Pujkt1OPtBArDklChVxrWW3p2kQa8EgY170V7NELkV/0uCgem87kGotQlIep8D65g+7+3gjpnIHXAjikn4PUf17S6+iOqgk3pfyQS7ghNQX12NkHo16PHvU7pdmx4qGUNFDtO3j5anOc1DzAPQ6hwLRcFpQzgOze8EEJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719485; c=relaxed/simple;
	bh=0TiiXdP0AZgV8wGzlnd+WgWs8luh3QUddKWCiLH6ED8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IDpv+9o5VuuN3tntVLevJLtGUsK8w88ya345AOU7SeBGd9rnwS/v9hW2uMN10kwVDjp9qKuiVVFr8RWo9CZGEmqI3jWm/JZvqHXvFtjOB3OhCBX10M6a40Ehzn5PpDUtz7nL+gPjBKWMllNwXCelVksoPc/puEroqXM6e/3DFPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L92R3hQS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L92R3hQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789719482; x=1821255482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0TiiXdP0AZgV8wGzlnd+WgWs8luh3QUddKWCiLH6ED8=;
  b=L92R3hQSfZ4za0x9bkpCIWo3fRWWEuA9zCxnKAbVDJOhEo+5o3GRft63
   xvmUwGBTQAJ0AeaoXoEL0To079xn27K4gc0pFm4TfST9OqzJNynQPJgOo
   L3IZHhGAX+TTZ0jmw0fJsF9/nsdtlJvXvZFE2mXOG/lyB0IHPFngr0NNM
   /dIYYt3KpmRs9bjQt8AnJT0VKDQ1PgJZycxOhAP49y7oZ99DOEf5nyiQ8
   t2pCKYHrhpEKDYZ01mgm9Vmsawk0Od6boMAlAvep7ApY0DIgzNhU2NY9N
   dEljp5U0TYPd3bx3HNoo4X8bsBeAxm0BOByM5CHy+UceH9txhrwqqUdW4
   w==;
X-CSE-ConnectionGUID: doxjygFUSW6z3Utns/tiig==
X-CSE-MsgGUID: Aw8WlIQjQLyAdFwiFj35nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100807361"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100807361"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:18:01 -0700
X-CSE-ConnectionGUID: Z+mRC8MiSL6dCxZ1Sc6OtA==
X-CSE-MsgGUID: ePvLPHP1Qpih5kVvn38l0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2511306"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.188])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:17:59 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 76F15121BB0;
	Fri, 18 Sep 2026 11:17:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7Tn9-00000000Gvt-2Taw;
	Fri, 18 Sep 2026 11:17:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Junjie Cao <junjie.cao@intel.com>
Subject: [PATCH 1/1] =?UTF-8?q?media:=20Don't=20hide=20I=C2=B2C=20or=20SPI?= =?UTF-8?q?=20drivers=20by=20default?=
Date: Fri, 18 Sep 2026 11:17:55 +0300
Message-ID: <20260918081755.65082-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MEDIA_HIDE_ANCILLARY_SUBDRV Kconfig option was intended for working with
sub-device and other helper driver autoselection in cases where the
required drivers are known, e.g. for PCI cards where all the related
components are mounted. This option, however, applied to e.g. all camera
sensor and lens VCM drivers that are generally present in systems without
being mounted on such a card. This leads to easily omitting required
drivers.

Drop the MEDIA_HIDE_ANCILLARY_SUBDRV for I²C and SPI devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig | 11 +----------
 drivers/media/spi/Kconfig |  4 ----
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4d9946479160..9b28e91b8a67 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1010,14 +1010,12 @@ endmenu
 # V4L2 I2C drivers that aren't related with Camera support
 #
 
-comment "audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'"
-	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+comment "audio, video and radio I2C drivers"
 #
 # Encoder / Decoder module configuration
 #
 
 menu "Audio decoders, processors and mixers"
-	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_CS3308
 	tristate "Cirrus Logic CS3308 audio ADC"
@@ -1180,7 +1178,6 @@ config VIDEO_WM8775
 endmenu
 
 menu "RDS decoders"
-	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_SAA6588
 	tristate "SAA6588 Radio Chip RDS decoder support"
@@ -1197,7 +1194,6 @@ config VIDEO_SAA6588
 endmenu
 
 menu "Video decoders"
-	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_ADV7180
 	tristate "Analog Devices ADV7180 decoder"
@@ -1557,7 +1553,6 @@ source "drivers/media/i2c/cx25840/Kconfig"
 endmenu
 
 menu "Video encoders"
-	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_ADV7170
 	tristate "Analog Devices ADV7170 video encoder"
@@ -1656,7 +1651,6 @@ config VIDEO_THS8200
 endmenu
 
 menu "Video improvement chips"
-	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_UPD64031A
 	tristate "NEC Electronics uPD64031A Ghost Reduction"
@@ -1685,7 +1679,6 @@ config VIDEO_UPD64083
 endmenu
 
 menu "Audio/Video compression chips"
-	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_SAA6752HS
 	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
@@ -1701,7 +1694,6 @@ config VIDEO_SAA6752HS
 endmenu
 
 menu "SDR tuner chips"
-	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config SDR_MAX2175
 	tristate "Maxim 2175 RF to Bits tuner"
@@ -1718,7 +1710,6 @@ config SDR_MAX2175
 endmenu
 
 menu "Miscellaneous helper chips"
-	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 source "drivers/media/i2c/cvs/Kconfig"
 
diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
index 4656afae5bb4..da3e225d420d 100644
--- a/drivers/media/spi/Kconfig
+++ b/drivers/media/spi/Kconfig
@@ -1,15 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 if VIDEO_DEV && SPI
 
-comment "SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'"
-	depends on MEDIA_HIDE_ANCILLARY_SUBDRV && SPI
-
 menu "Media SPI Adapters"
 
 config CXD2880_SPI_DRV
 	tristate "Sony CXD2880 SPI support"
 	depends on DVB_CORE && SPI
-	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Choose if you would like to have SPI interface support for Sony CXD2880.
 

base-commit: aedd77ea8168f00687c1248cdf115071e869cf93
-- 
2.47.3

