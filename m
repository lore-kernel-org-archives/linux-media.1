Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E883A8FE8
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813108; cv=none; b=G0bzEFRtBQeay6IGK0LwLJMljAjeyy4mHQlmcLgP2STb7N9Du81shsDMxobiCwMQ4Vs3UDa4AAJkTttYJAkC61QeMCAWvWTklUa4MQhZTh0YCj0a4uDwXF1h2X+WhT9Dmk5FsQmAJrIsVKrbMrp+FkNMj6ER9yzw0vYN1fGsRVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813108; c=relaxed/simple;
	bh=wNSnJKOgztdC3ne3lak6EyiEz726mPRuXdiV40/w+sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cxVnVaE+p0jk+nJCdAtXVB9tWStWN8ctvLeMf+PEQoSv8l0DkIx6IUTq/Xe04EuMA0JfgskJx/smGGb/b07vPmonYExyG6oqb+6A5lCXkggHev2oD7w8G1XYZzVKglYnJWqBKHV/4A1UrEC4evmyiW0uDK6/ey8nMyxHrv9mKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAgMySTR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAgMySTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788813106; x=1820349106;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wNSnJKOgztdC3ne3lak6EyiEz726mPRuXdiV40/w+sw=;
  b=cAgMySTR/cm9rZ/yTA1iOrqNGecXeLehL+8eXfFqM8zkzE4i2ncksroT
   gvcFfzcqwo/6x6bFaf788yMKPC8AjIYxv8II7l53DKQEl03W+142MY5SQ
   9aVJNK4XtDRl9zvNIScD/s3GMdzS+YLlYJkgsqpY2Rygbf9vGtljz+uVb
   ZwVpg2oQpYyAJ89o3ZCQziTdef2O6/plB4DT7Vp/OniU2dEsY/GAXjtsY
   t74v8exNBqyq6u2Z/qKzNG1oKnhbroBVQPOgct8aUxVlMZAIZSdJi6ufu
   QvB3hEixKs4TLUF5iacAeQO3U/VI4t5mY+4JmA+JyHJkPiFkJRtD264Eg
   g==;
X-CSE-ConnectionGUID: TfDf8wfXRMaBTl2r2ff+Ug==
X-CSE-MsgGUID: CPawAEbfSmqqBbqyQYAb1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93034696"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93034696"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:31:42 -0700
X-CSE-ConnectionGUID: yM3LedfXQO+h9elwrDVqrQ==
X-CSE-MsgGUID: PGTkTZSaQ8WTG8q37NjJxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267536426"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.80])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:31:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C50951203EB;
	Mon, 07 Sep 2026 23:31:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x3g0E-0000000Be9G-0x7Y;
	Mon, 07 Sep 2026 23:31:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: [PATCH 0/3] Rework IPU6 PCI table
Date: Mon,  7 Sep 2026 23:31:39 +0300
Message-ID: <20260907203142.2775925-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

This set reworks IPU PCI tables a little, by moving them from the IVSC and
CVS drivers to the IPU bridge. The IPU 6 driver will need a copy of the
PCI ID table for module device table whereas another copy will reside on
the IPU bridge. That's one copy less.

Sakari Ailus (3):
  media: ipu-bridge: Add ipu_bridge_get_ipu6()
  media: cvs: Use ipu_bridge_get_ipu6()
  media: ivsc: Use ipu_bridge_get_ipu6()

 drivers/media/i2c/cvs/core.c           |  7 ++-----
 drivers/media/pci/intel/ipu-bridge.c   | 14 ++++++++++++++
 drivers/media/pci/intel/ivsc/mei_csi.c |  7 +------
 include/media/ipu-bridge.h             |  2 ++
 4 files changed, 19 insertions(+), 11 deletions(-)


base-commit: 201807737edef3af88c54072e2b895ab9e0ab7c7
-- 
2.47.3

