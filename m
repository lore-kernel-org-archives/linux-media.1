Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D25D46A5EB
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 21:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493665; cv=none; b=QhRAZQJ66jFqC4QUm6nPPOj5jEqe1kliExgP+6/H9ob8j9ZLz+Ch0HiQhoEkGLpHuJUKZAKWv6Zd8RX1zCoViKZQRc3Vv1q/h518WMygWm7GCdBs0lwB85krjgCqrDsr4A69L2a5ZqAh11bjAgoPHUo2T8lXEkTmcLKEQhUVxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493665; c=relaxed/simple;
	bh=iOhOUr1wj/loRxLORzXrXmIxVg7Nup7bI8wq1f7isaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MB8055rp5I1wmP0lbQr29v00CTiPewfKKVDjc/WdMyORi35FPHLUTvAyRrMdRETE1XiWjHIY8d3qqL2ZEj/nC0LTEequoGF9XaCLhjJadGSs8t2a2CyCJRK1/+hFuSDymr430+8Uf3HFbTsumBm4r11MkkAV15U/VCOomLKtKO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ln9GVDwB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ln9GVDwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791493664; x=1823029664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iOhOUr1wj/loRxLORzXrXmIxVg7Nup7bI8wq1f7isaI=;
  b=ln9GVDwBgnbYr3L+E5LXGDekibstWy679TL5TS4oNsM/Pz/FNT1S3oq1
   O0feCs63Zeyl/zOuB8IVvJbtdfWc4pnznM7pe3f6wkeJHK0xwRZqso7Ok
   jPO1RDnQYKBHtbyUG7uFyuk+Er42yA0g0c1NG2sxZMiir9AiAX+bOAXdt
   aOoaYTf6gQNkejePahtxrTlVu2EvJ1a4uVtbzEVGNkgCfGqvH1wOU7ptR
   whXYzGesVf+trRyYj+eCIIvV727NGM5ijBo/Z7gfjE5mnaoZg2oz5kcnS
   /s79YG65Ul3NEXzFZJp9D19mtNpl+pk0HfUEVepYrJlptAAM4aYZmJmtE
   g==;
X-CSE-ConnectionGUID: TDeWOx2jQQeR6MUd8wI81g==
X-CSE-MsgGUID: EOW7tEvCTnqthDzl3lHPiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="173200"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="173200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:40 -0700
X-CSE-ConnectionGUID: jLZa5TmwTqCWysOkUA+tyA==
X-CSE-MsgGUID: Un24YRGURdmXwHtiDuftZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="135319"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:07:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1546F121D4C;
	Fri, 09 Oct 2026 00:07:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEvIW-00000007sm3-1F4q;
	Fri, 09 Oct 2026 00:05:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 4/4] media: ov05c10: Remove duplicated writes to analogue gain register
Date: Fri,  9 Oct 2026 00:05:03 +0300
Message-ID: <20261008210503.1878442-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
References: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
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
---
 drivers/media/i2c/ov05c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index cd64a621ff48..30f118c58ecc 100644
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

