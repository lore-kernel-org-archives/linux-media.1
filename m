Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2329348A2A9
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312658; cv=none; b=scKarN8JLTvnKLVloJK81kg0NEh2IVLlZYi+a2x+MddhcnpTKTI0N9w14tEIkPwK7OssAtJJfxTB/pew78Uy/bgXPs3vJuJXLamyhpRQiXofS5mBFkrK5gG02YKVKwWMHcXcMArrMGfGQXJl6yyQMHlUohrOGxGD9eMmk7V+o3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312658; c=relaxed/simple;
	bh=ZYasFjL3II3+pKKFfTfhcD2tFYXwvWEtoXslxyVLHA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqIiPzqKGdE2q3DcmDiSg6F+TXyGLlnFDThT81X37qPPFBgdybE/5D8zD2eb4yz2orjpckqUjBBJm/7KSW9YmKstipytOUFjYNsqmm/vG9GjUM7v0b7tIyrNcMqukGSh6AfB+zSNxyLFkMGpYqQQPZLZqXu15LfrOFJw6dBnk/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vz32YPjY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vz32YPjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312657; x=1818848657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZYasFjL3II3+pKKFfTfhcD2tFYXwvWEtoXslxyVLHA8=;
  b=Vz32YPjYugcondfgI+3ags1QZMci+4MNhXELblHSzgGNY5QwFF06petj
   TcV0IbTZOJXRb7ADwOhs2vc9wifOagy7Pdd08uKZSTX0u9feQTTbnQldK
   QpkCPBsBLbTF1GsLfKVtRyi8mY4YJ4Vl2j0eRce9mZt5gewxhRc6zqUTC
   UdMod43qMHJPgvH55WCb7C3bQT3+/pXpl33P8Go2Pxt6oTKO0WKzBCced
   KHT5oOHvOtUlS59m/h+Gwgxr9Vi9Lm/Rf79S2GQPjkT/ZLQpp7mroo+Ln
   cmSXIThAVqFzZDtb0LidPuErsop2uYeDT8PTjVsBKJFf8KtXySRcxTU+e
   A==;
X-CSE-ConnectionGUID: 0WaovFRlTFihKBTnhy+p4g==
X-CSE-MsgGUID: xofyJIvqTE2k+ZR8DeMOHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989069"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989069"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:16 -0700
X-CSE-ConnectionGUID: NvzuJ/ctQc+J1VR4GTjNvg==
X-CSE-MsgGUID: BS3GoKbOREyXSeUkH/5znQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172282"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:14 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 16/44] media: ipu6: Add check for pkg_dir before freeing
Date: Fri, 21 Aug 2026 14:42:34 +0300
Message-ID: <20260821114302.365532-17-antti.laakso@linux.intel.com>
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

We are adding support for mapping ipu7 firmware which doesn't have
pkg_dir.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 8e59406a725c..564461e0bb62 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -235,8 +235,9 @@ EXPORT_SYMBOL_NS_GPL(ipu6_cpd_create_pkg_dir, "INTEL_IPU6");
 
 void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev)
 {
-	ipu6_dma_free(adev, adev->pkg_dir_size, adev->pkg_dir,
-		      adev->pkg_dir_dma_addr, 0);
+	if (adev->pkg_dir)
+		ipu6_dma_free(adev, adev->pkg_dir_size, adev->pkg_dir,
+			      adev->pkg_dir_dma_addr, 0);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_cpd_free_pkg_dir, "INTEL_IPU6");
 
-- 
2.55.0

