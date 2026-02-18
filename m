Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261E530B510
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403646; cv=none; b=oZ8K2gFVUlbI7agY0MIfKUXqT03zxNefR3mw0xj1I+b5uM125JIPulQYVr0LOz3RO2cBBK8R/yCsWDfbhXK+B/PaESjGi6iuPCpM43l2H5AgOUrCaJl/8GyA6UBnqJ4wvNocBKST+oydUAY4760pFNhsvAc7YHiTo1C1AQnYEPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403646; c=relaxed/simple;
	bh=Nim0BCtA58/8fiHkXb9ARDIKdNu/i/2dsluWGrVdBtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ecdC6HFw6tfXSJ+YIzZwGEN1xqf/NWOpmZYF1g++tSBObGlSldzIwwFU8LAMyY65VduAhsotC1gpYwibqUiy4/oEP85tUfN+hIwrVy1dvyl3hMI7fzw/GSsKhGoNroyShDKGLUqI75PZ+iHjamoSyWNON3+lH+8ppsPhpHS+fNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFOvz3oi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFOvz3oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771403645; x=1802939645;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nim0BCtA58/8fiHkXb9ARDIKdNu/i/2dsluWGrVdBtI=;
  b=hFOvz3oi1eWbEsomRvvkY2qVYIiHSf7pm4C4fAdlAneMOHzanVtgQyN0
   jAvQ3P7mUBGMaFTzSbDCDUVtT8RvcxysRnOFfF9CArkTKN8G3vvpRKiJ8
   J09+XmwbrXFDSEx+cpDBebBodMLSjdd+M2Yu3T+f5z4Gv1TNeoe2Wzdyu
   3E4e30kic9fSlMDcuHHOvdOr4lDj1kJnwT2keZ/5zMplJ7UwHh8cFuAfL
   e5KyXKZZPPTYkIOgkA3RBFF1KQfOOBU9mnoBTtqmgomoln8g0TaDOfCl/
   O6jB5J+SAdUKaY6/do42Hb1oGizaDWcJmQzk3RgwNPnMOi6t3yYQWliLu
   g==;
X-CSE-ConnectionGUID: yoN50UzARFmWQ8WzSEVQ7A==
X-CSE-MsgGUID: I3BaCa6iQ0aFhq9SYBMd9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72391227"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72391227"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:34:03 -0800
X-CSE-ConnectionGUID: DIGyZSTpSkqwB/Jo7EQpnQ==
X-CSE-MsgGUID: zpqSiMT6QeyTwKbdHXcC7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="237133556"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:34:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D2539120B7D;
	Wed, 18 Feb 2026 10:34:24 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vsd0q-0000000ACop-2qGR;
	Wed, 18 Feb 2026 10:34:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v3 0/3] 10-bit packed raw support
Date: Wed, 18 Feb 2026 10:34:21 +0200
Message-ID: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

These patches add support for 10-bit packed raw formats. Adding support
for more bit depths would be trivial (at least up to 16 bits) but I only
needed 10. :-)

The code could be prettier.

since v2:

- Drop bpc argument from raw_get() and raw_put(). The bpc argument wasn't
  really needed there as the functions don't operate on the values (but
  simply pack or unpack them).

- Use unsigned values where appropriate (i.e. make signed values
  unsigned).

since v1:

- Use __attribute__((fallthrough)) instead of a compiler flag.

- Better error message on what's wrong if a proper unpacked format isn't
  found when processing the newly supported packed 10-bit raw formats.

Sakari Ailus (3):
  Add explicit switch fallthrough notation
  Add compiler options to avoid warnings
  Add 10-bit CSI-2 packed format support

 Makefile     |  2 +-
 raw2rgbpnm.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 87 insertions(+), 5 deletions(-)

-- 
2.47.3

