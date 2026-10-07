Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F72F0680
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 03:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791344999; cv=none; b=ER1kauIfczo4gm7L00p0DbDuEXbApmz9SsXtbkGeYmw5PCr2Cop87/mJI/pWtM1C5UpvOYHtEyChuttBvW7Lpdj1KyE5RaszGdlkZavAo7WL+PJOdQRd0bKc8Vz/LygXQ6ELpfesGRTd/uxi/m/x9AJl+IwQpmcJNBd9vkveZ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791344999; c=relaxed/simple;
	bh=idU0pgv0D5DSTL42pIGMCoaBYJX/n/86sGl+NVyBfO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W7kfwdcxkECQFvG3UM3q3qsJcBqIbxYIglJuheK8Ix6wlCKIyuKuiT3joIUpIKvaWa2aZv755JgPNZopmyRoCUCLxvfkzhBpRAn3ftiLzbeZXE5/t/CFibhJ+gPDSJdSyaRWtGQVJXJ/StcKTkzfvVIahig9zxy1ABNrvewZ0h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0Z46r4s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0Z46r4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791344997; x=1822880997;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=idU0pgv0D5DSTL42pIGMCoaBYJX/n/86sGl+NVyBfO4=;
  b=N0Z46r4sud7w0+lmcej1j3uPU0BFT/ifytoFDzWtt8Wcd8304iM3Ve3e
   C51VDgXMzyfhFUS6Pb0iOjbonlHxHizU0NWgmziPO14CqPlNi+7ozKQ1B
   ZZ9wvCBY9VYHT5Q9C5jvOxaWMBAyoy/NHYCNdl9jyduezl6BzhbQCy9uI
   7/dxML74Ab9e8ldYwRifxJsXejT1Xxdw4X5qK2vIMzz5jIWlQWE6HnFdb
   ZiFw0Fsb2ByFnBFKBaCGC2eVGYbKmeqJO69LIhl5SvpXdunKMCK/o4W+y
   dbnxCbTIgLUNCZpNk0cVFJuacGI97JnGwB2jZ4AfLY123kLLzRcT0cbky
   g==;
X-CSE-ConnectionGUID: RsqS3VZxSs2TQo01gLCzrQ==
X-CSE-MsgGUID: 13h52m8HQf2XHazKumn2HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="87876"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="87876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 20:49:57 -0700
X-CSE-ConnectionGUID: Pd2lykDiRHSdAjmiXUgXMw==
X-CSE-MsgGUID: f+ClrI19TCCa6D3oKb+54A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="277469973"
Received: from jimmy-x299-aorus-gaming-7.itwn.intel.com ([10.225.65.17])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2026 20:49:55 -0700
From: Jimmy Su <jimmy.su@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	serin.yeh@intel.com,
	vicamo@gmail.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 0/2] media: support upside-down camera mounting
Date: Wed,  7 Oct 2026 11:49:12 +0800
Message-Id: <20261007034914.1654831-1-jimmy.su@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some platforms use camera sensors mounted upside-down. This series adds
support for handling these sensors to ensure that captured images match the
device's mechanical orientation.

- Extend ipu-bridge upside-down matching with ACPI _DSM module identifiers.

- Add upside-down quirks for selected Dell products

Jimmy Su (2):
  media: ipu-bridge: extend upside-down matching with DSM module IDs
  media: ipu-bridge: add upside-down quirks for Dell PA14260 & DA14260

 drivers/media/pci/intel/ipu-bridge.c | 119 ++++++++++++++++++++++++---
 1 file changed, 106 insertions(+), 13 deletions(-)

-- 
2.34.1

