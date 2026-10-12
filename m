Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D297423E92
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805363; cv=none; b=auiS9kl+Nsh6TIukNqITZ250SVi4zl1LF5doKuAnQoxVA9KVyzWhHwTyux2N70AqPIjmeGYl2XA7gU4XMcr+st44KouJ4BnWCoRwyINwVFr2F3KRmJqfAVGAeA6EfqmW+/ir5ebHv7WbB1WZvx55dFCCUFDwpROqjxxCIELWnyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805363; c=relaxed/simple;
	bh=N7Mwflk/eSoi6KIEPnZA/uivMKSW6u0EqqNY6Zu7KtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HmFRWaSHxTnUPvA/ddJTkj+VdAjItc/Nwxwy+AEw2qZhh28uAf47E2ORS/pfgOjEarvWwkSTkIJQ6ptpv/gVfHYMn02hTBkZRHqU7DPUprQ1yIDdgaj+oe5s2n0S8ZE5nXutZh/rog1QlO/GBYpRsEy6IjOU+lSZMn5Ko4g7uYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRu34qfL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRu34qfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791805363; x=1823341363;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N7Mwflk/eSoi6KIEPnZA/uivMKSW6u0EqqNY6Zu7KtE=;
  b=iRu34qfL3stEn2IqqEIwPf3lKfyCfkYlX7EyV3C2syJe9JzwGvAznCJw
   X0HN+A5E+LxoHangiJLSQbO8uqcSU17heqZUuWwI/1wza5f4tER3G4aD/
   PkAOh71jKL23lJ8TW9Rxe0jhNA1ggBqQfd/21nE+6Eg6X/nfFrwLz3Ftl
   EBeEVpTZBc0zJsrGJa+3IvQ/GqK487mI0KhY+Ph8DskIsV5//LOJQRI7X
   4uag0to7dCkFHC7EdoAL7i5qoi2+9dpxXNfQjOW3gt0MAYbSHWhRQcgzi
   uwHO2XEbz/dxQ/0qM59vxBnkKN568DSpbj3j0CSjltSz44qdrDXVSxCuO
   A==;
X-CSE-ConnectionGUID: Ual5P2A7RO6XCN4RXTcs9Q==
X-CSE-MsgGUID: b0D/XkTUTryeV7GnzYF8bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="394319"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="394319"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:40 -0700
X-CSE-ConnectionGUID: 9OAqpUn9Qi2+4tHW+y+FPQ==
X-CSE-MsgGUID: Lpb1BCgzT9CvEm/+uGo8Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="978025"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:36 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 199F5121B9E;
	Mon, 12 Oct 2026 14:42:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xGENu-0000000GewQ-1XoY;
	Mon, 12 Oct 2026 14:40:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: [PATCH v2 0/5] IPU reset workaround changes 
Date: Mon, 12 Oct 2026 14:39:57 +0300
Message-ID: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Maybe I should have labelled these as RFC instead... this set reworks based on
what the ISYS is reset and how that affects UAPI.

It seems there are some issues on IPU7; at times (around once in a few hundred
cases) streaming with yavta results capturing a single frame only and an ISYS
power reset is needed to recover from that. No reboot (or driver reload) is
needed with these patches though.

Similarly with these, an ISYS reset is avoided in regular streaming cases for 
IPU7. 

Comments are welcome (as always).

since v1:

- Fix error handling in start_streaming() in the 4th patch.

Sakari Ailus (5):
  media: ipu6: Don't mark need_reset based on returned buffers
  media: ipu6: Tell about not being able to obtain frame descriptor
  media: ipu6: Prevent starting streaming if ISYS needs reset
  media: ipu6: Remove need_reset check from video device open
  media: ipu6: Return errors from stream stop and close

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  6 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 18 ++---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 74 +++++++++++--------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  4 +-
 4 files changed, 55 insertions(+), 47 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.47.3

