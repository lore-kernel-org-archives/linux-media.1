Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904886;
	b=cdRPGXzqIWCPIQz7dVK8wj/6/YlegD0Hqx8C5HQ2rGAPThY4zdvem5cOr2sxEkwHyj08
	 R7swXt/AU8f9VEKasnaKoovaJm37eSFEWv1swjEzDkt7Yktpoh84Oi/xj9NnoRmbO/kI8
	 aTYBft768cRpdCFLthPsoyclPFFgtb/9Bkf29V1XLhe+PQ0QeBVMPL1kwc0q3yCW1AbEl
	 ijsJkeSnhMnzTEg/bNwQhQia0dXiUkkrcw8Qt/Mwmogee5b3PHOqH0WkX7ZNgP20vFCtK
	 /78JqeIB+qzXpHZXj0RXhbyylx+efsXvMnFqkkHrzAlxz0GT/vdD7mxengCmQTYRNfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904886;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZtxBwlDQPOBHrMVZZMyP4TZUsvtqkV0zIkRX9s3PWXE=;
	b=MP7vItl2kIZTWsmQ96PdHeecKQTO+FJdZ+v5389VIzgH+Q9X4ns7KT/Uwi13EUjyhlfk
	 oN8v4CL+RaBwo+rSKEp//PnKbY9lX00T9txpmv76uCYFJLteZ/HzqGYOaOQ6fuUHWX/oX
	 HD9PKlEmUXJObcsMq45+4pXI9PVcS8OOIozdrsPPHXy3ESBIjvid1vPD4BWcnascY9oAI
	 4ewBU7toFVHSjxZ00YiNmwAwujl9Wb5i3hh3cmlA36Ap7C76UGrrGEa4TGhL/HQHblkvm
	 LGkaUeclj+IaEg9NW6jJ+IhXUy10hV6s9KxQiVjCiW8lhDZivvrbyxM896lBXqfbRpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SToDjXJg;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016E2606A886
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 08:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 016E2606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SToDjXJg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794904885; x=1826440885;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+o71Pxda46I4pHemldadNGxalFoanzuxUh3AdwabHT0=;
  b=SToDjXJgFKGX6JbBZvLToFHn4UbIChqnWY8oTWJHwIyxG7tk2aiS4cej
   Pbd7oafXqNAuVtnM5bg7y2fuWvoktcAQs4uCeqE5Wua0Av3Xzfm7bfCiO
   aZekqzxX92613/VVgH7M1CPCoUyyOkwyVJrWCmCW6lxmLbsuSGgb4qzzb
   gbFdogR3duTLi474cVNo9VxSYejbLtvwFKPeY9XuS5u9DFdYxxoTpfeT3
   gWVpTsCUSuFD+FVIBtWxl5CyOczFe/uUasN/k2/rkomVDvsrFcO8agpDP
   zDwSCJWi8KbR774p7b7wyVCOS03Ruf6wBh+38v//XWxEj/g6PdLnG0jLc
   w==;
X-CSE-ConnectionGUID: BReEURnQRViPtV09hHrO7Q==
X-CSE-MsgGUID: yC6hU9fJTeiQXbsbwFKwGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3704147"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3704147"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 00:41:02 -0800
X-CSE-ConnectionGUID: JadpRFu3TW+iKKJhppRssQ==
X-CSE-MsgGUID: eTaOBiJkR7i4cWXIVO6iOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9713000"
Received: from szadworn-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 00:41:00 -0800
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: lsa.uz@pm.me,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com,
	manik.bajpai@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2] media: ipu6: Enable snooping on ipu7 isys buffers
Date: Tue, 17 Nov 2026 10:40:41 +0200
Message-ID: <20261117084041.88457-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The capture buffers are not cache coherent by default, and CPU may
read stale cache lines. Make buffers cache coherent by enabling snooping.

Reported-by: Sergey Lebedev <lsa.uz@pm.me>
Closes: https://lore.kernel.org/linux-media/20261007183311.24637-1-lsa.uz@pm.me/
Fixes: 9ab793dbc176 ("media: ipu6: Add ipu7 fw isys ops")
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
Changes in v2:
- Added Fixes tag.

 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index b1211e24562d..dd7b3ba3b468 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -214,6 +214,7 @@ static int ipu7_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	output_pin->link.pbk_slot_id = IPU7_MSG_LINK_PBK_SLOT_ID_DONT_CARE;
 	output_pin->link.dest = 0; /* IPU_INSYS_OUTPUT_LINK_DEST_MEM */
 	output_pin->link.use_sw_managed = 1;
+	output_pin->link.is_snoop = 1;
 	output_pin->crop.line_top = 0;
 	output_pin->crop.line_bottom = 0;
 	output_pin->dpcm.enable = 0;
-- 
2.56.1

