Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E23B9DA5
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 06:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996802; cv=none; b=HVyCdPpmBvQK7ynEd92izB5+6yHgaojYknQTCYGtznr+c3Qjbt6jCqzFR8QbHkaxmqyqIaSPHj6u0XUs2wvffm9AgvUH/K1hZzHq65FUFOeNK7fh55JDbTJ6PERgOFORTH2R2Ow54xYB1kQEM/plxaaaIgYoEDbUZt1U2PJgy+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996802; c=relaxed/simple;
	bh=NDgy5FNzI2lae9SEYJXK+zmSNoq+WTx2vwvK8F9ILrM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WC2s5B7ojBqxSapT5NDiU6TGGBo6vwVpn8BPoHwUK13bsBzBZUomhGVeJwJesPewoK19LBLGKYuwftO1F8qpQT5/yG/t1hWdVRM5VJEyoSVMoXVPFKoaX3rugQZPfK4ZR2XL9I/0PJ9I+Rde4iiq/luyVAdo0oIQbGQw45YgxO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8DBy/Wk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8DBy/Wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785996799; x=1817532799;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NDgy5FNzI2lae9SEYJXK+zmSNoq+WTx2vwvK8F9ILrM=;
  b=X8DBy/WkPUTV0vKWImlgVGMKq/6X2yPXk32aTE2ZQ2qTcOrFyoIwDpeJ
   TuiuD3FFJJm+/YsKhsd5IOaZ76PfCHzD61nNqg4Nj1BwaTsivTptetybx
   D/1YZFarN1M3MUN0luf00JNA7bdv+xyCON9tfpEQQfPR5E4F2ElK5z63a
   j+o08TAYdfsBexiA7TO9U2vKh3qmRmsaxpKpyEsL04znyYtFkGIaVNF8F
   P12xeHPWyyKBtxeAMjdlncQFYOB6dUjnBve6OWwTCgnMX0Gd3yS0Z6sfe
   I0fTjIuBkPJVj4+GoWXJF2CMbZ3S7fwFvE8iybfkUQ8sGJQMvPQ4St8Bc
   A==;
X-CSE-ConnectionGUID: z/MUcGpYRj+v3paFiz9pZA==
X-CSE-MsgGUID: wBmNbqA7RvSaxJvY0rkKcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86455796"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86455796"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 23:13:18 -0700
X-CSE-ConnectionGUID: wDul+mvPTsu3ahmHF1qn4w==
X-CSE-MsgGUID: IE4vQZWFRkO+g8KPSX4kqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="260757746"
Received: from serinyeh-ms-7d25.itwn.intel.com ([10.225.65.16])
  by orviesa010.jf.intel.com with ESMTP; 05 Aug 2026 23:13:16 -0700
From: Serin Yeh <serin.yeh@intel.com>
To: linux-media@vger.kernel.org
Cc: serin.yeh@intel.com,
	sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	sarang.sapre@intel.com,
	bod@kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH v4 0/2] media: ov8856: run full power sequence on ACPI
Date: Thu,  6 Aug 2026 14:17:35 +0800
Message-Id: <20260806061735.1359269-1-serin.yeh@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes the ov8856 driver request its power resources and run
the power on/off sequence on ACPI platforms as well as DT, and fixes an
unrelated debug message.

- Background: power resources on Intel ACPI platforms :
On Intel platforms the sensor is enumerated via ACPI, and an INT3472
"discrete" companion device (the power-logic-control driver under
drivers/platform/x86/intel/int3472) registers the sensor's
reset/powerdown GPIOs and the regulator supply.
These resources are therefore discoverable and usable through the
standard gpiod/regulator lookups at probe time.

- Current symptom :
Previously the driver guarded both the GPIO/regulator acquisition in
ov8856_get_hwcfg() and the whole power on/off sequence with 
is_acpi_node() and skipped them on ACPI. As a result the sensor was
never powered or reset by the driver and probe failed when reading
the chip ID in ov8856_identify_module().
Removing those checks makes the ACPI path behave like DT.

- Validation :
Tested on Intel platforms with kernel 6.17 and 7.0.

Changes in v4:
 [1/2] media: i2c: ov8856 : remove ACPI node bypass mechanism
   - Modified commit log description.
   - Added tags : Reviewed-by
 [2/2] media: i2c: ov8856: fix debug message to report actual CSI-2 lane
count
   - No change

Changes in v3:
 Add cover letter to describe details of patches.
 [1/2] media: i2c: ov8856 : remove ACPI node bypass mechanism
   - Add tags : Fixes and Cc
   - Removed a sentence from commit as this change has already been
     split out and is covered separately in patch 2/2
 [2/2] media: i2c: ov8856: fix debug message to report actual CSI-2 lane
count
   - Added tags : Cc

Changes in v2:
 [1/2] media: i2c: ov8856 : remove ACPI node bypass mechanism
   - No change
 [2/2] media: i2c: ov8856: fix debug message to report actual CSI-2 lane
count
   - Added tags : Fixes and Reviewed-by

Serin Yeh (2):
  media: i2c: ov8856 : remove ACPI node bypass mechanism
  media: i2c: ov8856: fix debug message to report actual CSI-2 lane
    count

 drivers/media/i2c/ov8856.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

-- 
2.25.1

