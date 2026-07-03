Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86897417363
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092407; cv=none; b=I1f/LAiM9J2IELlygAw8Smdt17wtd253ISeZo5OKrgsmKQG+neIxCccwHg9xwiSmFuQmTuBvYRY/xVOlWnjbg62ZwbLaSkMcNlvCBI1beHCFR7rNjX85whMAX42JNyYNbKGJW/8FlFIdnGJNv6fMRRf4EYxkO/ompY/9t7V4Y50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092407; c=relaxed/simple;
	bh=WtS+wACIiJBtzkLY25Y0pjASNADARee490AFqmjcVrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tft8BuNLKoBkmjeY7qPdp4V3hmzANAgF+kb7idUU3/7tFZ0AbWInfFr8eRzRvWMKQn4YLj3M9YMCXz76XIM5/Je1s6lBQwNYLtI7ncUt9JxKQJXwQLbH+wmDdSeW5pX2VKKzpf6GuO2Iyn1J0Y01Tvyx4iaOkShquxnF1YQ3jz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJgrJkjU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJgrJkjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092406; x=1814628406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WtS+wACIiJBtzkLY25Y0pjASNADARee490AFqmjcVrk=;
  b=dJgrJkjU8OcJ7sMcIN9KWg/2yZxtz+xG/CbPxrToDGqSISmWmS/4NthI
   IbtdVR8lnpYN32XYxz2vLO32S2hIydhk+q+jfWKcsnFDBOV6dRGz8Zspc
   3EicMRa00KqF46Isl2pFEecxygaBa2za/bjP+bCbjhRteC13uk8uApai6
   3xmJGBFN/nT7MDni1UmcbWfq2a/nphdsGveqihyvXHG44ucys/bGE21MY
   FyzU0K+d6uQcoFob0vpActsSJpk+gN+johTk76eX/c0pOoO8rek+UOk7F
   tnU4REgn8FAmzM47J7HngVIQqtOOwMgMX48BJ6RZKQGi+/JAnlfFm8v4G
   A==;
X-CSE-ConnectionGUID: 8fTOqW1cT+21OS+AE/y6+A==
X-CSE-MsgGUID: Q927njl6SHmM3pIN3xeIrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396289"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:46 -0700
X-CSE-ConnectionGUID: x7LG0qcDS+CEkExrAGSHcw==
X-CSE-MsgGUID: yjjBPn75Q8WUW06XE22JJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799861"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:45 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 41/41] media: ipu6: Add ipu7 as supported device
Date: Fri,  3 Jul 2026 18:24:51 +0300
Message-ID: <20260703152451.1743132-42-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include IPU7 PCI ID in ipu6 driver ID table.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 include/media/ipu6-pci-table.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
index 022d6f255ad5..c2a1f2f1bc7d 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -24,6 +24,7 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_MTL) },
 	{ }
 };
 
-- 
2.54.0

