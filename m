Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6AF2C11EE
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834122; cv=none; b=JAEhp2VTw39P8y6IimpuAmbMDXLpvCDoNFkqWmT87Se8nzRm2f1n8CnqNXKdKHrc6y7US3ItB0oH15snj92LgunITjt3TnzNXeL/tkeQWKE4/+JZjyTuGGJlF9+mtxUKr3skAkd692yufndriS9OM5Td3WW9McJh0+SCjISTPLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834122; c=relaxed/simple;
	bh=VWP315LoVueNlKqhnhRSaEQ1HEz4T7EWAG2wv6SvYzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poL9QBpoWgcZkA5+E1gMVLtHObc7EVdtmYlGdZSe0PGK0XIRnNsDAXTSu9JiXBAGXro+0vd9QjzF8h8rwzEuqqjod7ZoZEGoVoFk49eyrzOwMt0kO0SAyAbTvVEt9Gi7Pv4qzVf5ypYhUjy9/utk80KtBMmKNcV4W7H8fpP66+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsC+8pVi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsC+8pVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834120; x=1819370120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VWP315LoVueNlKqhnhRSaEQ1HEz4T7EWAG2wv6SvYzg=;
  b=MsC+8pVi4Lu8ncIRRZMoIq453u2yxkQG3z2Cqf6ifujwgJGVTJd3Pdx1
   nawNgCT3WIQt5ULduBhzCMjPMx3P9KOG1O8WsIRA7CfLasxiJDuz5XV7c
   RmRQDi1NNzVJqnP6ytVnYbcJQotnH6+Zuj+uZSBX1jVN7j3oCoK8TKTzP
   urhA3O3hvlRiaZfstFMxc7eDvnvj1+N+skS3SeQQfL9n0GI8JoAjkXSvr
   oDwm7B3WadABuswfStPVYd3OZdtVgqkbTt0k0hLd19MMQGoComV2jZ2pE
   1hBqjp4IFvoPiqyV4ufGdUEuHhIlvTldYO8zD9d/mNZDCg6GpiXzjmR29
   Q==;
X-CSE-ConnectionGUID: fhzmUaTvRhGMXQw0Opxugw==
X-CSE-MsgGUID: g/9ko5gvTjC36HN8DjXRxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188707"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188707"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:17 -0700
X-CSE-ConnectionGUID: gVS16BskTlGbJKTf+VOt5Q==
X-CSE-MsgGUID: QOAgPDVgRa6aFN7vBW5+Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384733"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:15 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 44/44] media: ipu6: Enable ipu7 and ipu7.5
Date: Thu, 27 Aug 2026 15:33:36 +0300
Message-ID: <20260827123336.2219048-45-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
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

