Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186249D5BF
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538512; cv=none; b=bGroLE6g3UAPwNBhmaeKlbDD+LZvCLJ032+4x3G55o0iABnUl51JvK/19db69sWgmgqkcn4sve8TYQ6QPLwxwEaWd4cOz5fPfTY0a6NL+r7ixYU6efL+7w45+QRMpaERhu1PblEgeXBkcdxYcf9mPs3rel7Pkka+xy2JnE6skUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538512; c=relaxed/simple;
	bh=hsnm2X/qSkpL9oqxHFlQpEoVMfXRcdoUSCsk+gBgF2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRacjEhKmbBfc4tLR38KVwUZOfcmJ6ssGKxjvqJBNUW1dzBcucuvx2RdlGOH9SIcGtdwt+DNXloymj0CMkjRFUnS8fQojngSeN97VkjZtusePgMVkiYSrynoZkfd6WOBP1M2yMTHL9myvUTc7JuT2WrrDmtfjyoTEnjMAunVlp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6zE5Z+3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6zE5Z+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791538509; x=1823074509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hsnm2X/qSkpL9oqxHFlQpEoVMfXRcdoUSCsk+gBgF2w=;
  b=m6zE5Z+3IjKGlC91cmMlACU4I2Ue1BFfHQzrkM5GGrK0cswiK6fv46iq
   TpVDovjQyM8PaHpYMGE3d7UbHXGcf6AAl5Si5I+4UrTIcnCBMcmMj+ycM
   xa4ScKkQesobgDQxzeyPLDlxBWzktlxo3bXWO9etvlFSku4sCSyLhx9z9
   zyYhw6/vzvsI3J/eN9obXem72ZH5KPchubzDwecdFgliM+LEbR+9JpoDz
   iAcS2s0wlGAVpKSr7wqllSFABbAaGgIm3quOI/9OVyw58LYHwjJ9cz1XG
   oXFumn5vxcsbFL0mpOQMP1GQZct5vtMna1IjzVyws7uba3BaR5ZjEqd1v
   Q==;
X-CSE-ConnectionGUID: tSpPXyvWQTSZTmuhVhBxkQ==
X-CSE-MsgGUID: 8dFVJZuATNOcc7VllavZfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="229304"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="229304"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:34:52 -0700
X-CSE-ConnectionGUID: zLZOt6tRRm2I8Cj/f/2g6A==
X-CSE-MsgGUID: JF4smEI0SQeiIfuutPUMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="596352"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:34:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D8306121D4C;
	Fri, 09 Oct 2026 12:34:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF6xc-00000009Fj7-1QdE;
	Fri, 09 Oct 2026 12:32:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v3 4/4] media: ov05c10: Remove duplicated writes to analogue gain register
Date: Fri,  9 Oct 2026 12:32:16 +0300
Message-ID: <20261009093216.2205375-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009093216.2205375-1-sakari.ailus@linux.intel.com>
References: <20261009093216.2205375-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove duplicated writes to analogue gain (P1:0x24) register from the mode
register list.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov05c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 692474cbe84b..8fe4dc0d9405 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -158,7 +158,6 @@ static const struct cci_reg_sequence mode_2800_1576_30fps[] = {
 	{ OV05C10_REG8(0x01, 0x06), 0x76 },
 	{ OV05C10_REG8(0x01, 0x07), 0x08 },
 	{ OV05C10_REG8(0x01, 0x1b), 0x01 },
-	{ OV05C10_REG8(0x01, 0x24), 0xff },
 	{ OV05C10_REG8(0x01, 0x42), 0x5d },
 	{ OV05C10_REG8(0x01, 0x43), 0x08 },
 	{ OV05C10_REG8(0x01, 0x44), 0x81 },
-- 
2.47.3

