Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819435;
	b=H0Bbb6giVlMbQDZoa3+P/ukM8pHPv5B4w0gbno4hhvcATNwYjyTHd52uEb5La+wUbHnF
	 5WvofPQ9ohfoSgtkvtsCLj4yGyXsYLOvhd6s3ScmIyG+lAf6fqvq9YAybRevdB3grbhvE
	 5dbrJAXuB4cosWJmhSnZpGD0QrR38qypjENZqy6urJ+/VtNe0ihIZuGfyatw3A4zjjpES
	 NLjjS4k5kNDzHYa/c5RSTmwkP7vasY0OOpl5f7nHj0g/SIHd+shLF0WspiADsr66UoaRz
	 EK9aAjbxY/Oxcw6Uq2rUg4MLDmh72JM1yNBR07Ek9YAEsH4KIeSLs1ZxO9krYcHWASA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819435;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kba2h9fzS0MIucUClw5AvguRD/AwR2CKbDJ6Q4sLHG0=;
	b=wE2f4aq7A1DQiZ6iZ6W9WFuDEW+mtCwwpho/oZIcCQ005DIBoTO6q3baCkwMab/Eja7R
	 kLlt7Zob4YLN6qCaPhDTpFP5JPzdxnwkD+N9bi2UUIIaF2IFyzG2yfCDa0lJvXfbp6MzA
	 7c2rkeBJdzXB85qeHgcfIheXZKwZwTmEUcOwLU9m0Rzpdp7pG2i89C8tJNex3qOIAL9FC
	 u0Uh9tk9xePaIn6IXxfOECPbfgScwgQMABP+vXM6ONw5HlpJM6LYKLFC9E0N/zfjh6Xv9
	 jVfclW4bAdgGVurnAM/NqnyLUdmrm3Ps5m1erGjp6G0xbSuH6UNxkPBfazmHwbsR/eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SN6U27IP;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDF5606A31C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDF5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SN6U27IP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794819435; x=1826355435;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zuu7lsLez8e6O6tck1BU/InG9ab2GspFjnjjbDjMcNE=;
  b=SN6U27IP4dYsE1BC4CjGI8Ejzo+lWT4/nRiJxmB0CBLWl1sCA+78YeBF
   QPAw7vp9wa8TZuY8KeqOGzQgIkPuU7usdPiT6slHDNuA76kcA384Yh+C9
   7gr4TT53igUuLccaFtHIvxgha3TMk4+/z8ralnWNy/qBJALDsCZNX549x
   bz1k7l/14BOQY7u5UDA7By8mrUOxEBw899ffLguZy4vnD1KiKpX5GHudI
   kWLJvVSdpLqxYwHDqkerjFTqYy7TW3YoQVHipSWU5UTOSCH596UqfUocR
   ohXmGxyssMPYldAewTPtcXXd93B4drSdix9HcaQyZrmiX/zKqn+/+n+ZV
   g==;
X-CSE-ConnectionGUID: B0yQMNwZQ6iUQuEfAHGcdw==
X-CSE-MsgGUID: BmGGzh3RTgS9AiYtm7J2iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3437440"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3437440"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:57:14 -0800
X-CSE-ConnectionGUID: 4wXAmr1ySmCXRWMnX4zaCg==
X-CSE-MsgGUID: r+dEZvr9QAOa+CXPeypfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9300677"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.25])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:57:11 -0800
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: lsa.uz@pm.me,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com,
	manik.bajpai@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH] media: ipu6: Enable snooping on ipu7 isys buffers
Date: Mon, 16 Nov 2026 10:56:50 +0200
Message-ID: <20261116085650.991445-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.56.0
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
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
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
2.56.0

