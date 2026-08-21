Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82048C8CE
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312720; cv=none; b=OsXrnCrekX5noruUCpOEPOyFVxx/NHqIgppQHYMo/NE4xRsbkvYC10KkWs+mXNdgUlCsgkZq0u4uR9YbEsVgs8WMrIRDc3/ute507lBZLq94UAEga0Qt3VX0DssNKibZ88R54ohCuzJIkq6cj6bjemj1Ph4HwAvSuJaTyaMfknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312720; c=relaxed/simple;
	bh=VWP315LoVueNlKqhnhRSaEQ1HEz4T7EWAG2wv6SvYzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqEqfu9DUAMxmxN1jrrB7NeqtIPixubxtFm+F2k2dH4Yf/7GynEx4F5GRyh9BMbHxnzgsbRABNOVXgFVECBnhtntuc9ogirBHmNU5OfNJnfeAANlGkifnxopJxAwawRmhGOk9torqLjhIHrzaq01itHqz33+ckhdOFw/vM4X9ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjJk/OW/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjJk/OW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312719; x=1818848719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VWP315LoVueNlKqhnhRSaEQ1HEz4T7EWAG2wv6SvYzg=;
  b=gjJk/OW/V2qzmHqtbt9wVAbQ40HifGNFWV75rnFyqcq0HUZsoTR69s92
   1ouLL/iDsYruqy811TpfJk9r06HYWuHsV+5feC3yeVI0y2JqIkIcPoTWS
   kMdk/ym1b0qO4fOq5rLC7USK09B49Os7bj+mOyLeDmP6XJp4Qw76D72oK
   Gk2wUhDDc34sG7YEzB2FQ/oKfYdzxCwG1TUQ+0QIlOpCiwj270VGz+EPQ
   oT7t5zck3BAAqzxf8f6W2veAuzTD/27bU9q9cy4yd/SLaNKjHc1y6IoNk
   KaWtnu9p4s5x/g/ZLDZfljl4aYE2Yy0ydtJ3cX/E9w77xfMCWlH73hIr/
   g==;
X-CSE-ConnectionGUID: Xh4wJpymTKGHAz/GWr6rsA==
X-CSE-MsgGUID: fYBhQy2ATBKOOwSEOAzI2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989149"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:19 -0700
X-CSE-ConnectionGUID: RPgRoCawQpmrwmX1KAnJig==
X-CSE-MsgGUID: 7VtcTnIDTjeoVP0uj3gRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172501"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:17 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 44/44] media: ipu6: Enable ipu7 and ipu7.5
Date: Fri, 21 Aug 2026 14:43:02 +0300
Message-ID: <20260821114302.365532-45-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821114302.365532-1-antti.laakso@linux.intel.com>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver have now support for ipu7 and 7.5.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 include/media/ipu6-pci-table.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
index cd5b941fb96c..cacb8a3170d0 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -24,6 +24,8 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5) },
 	{ }
 };
 
-- 
2.55.0

