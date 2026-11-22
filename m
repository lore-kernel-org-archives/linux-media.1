Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397871;
	b=F6o+MgL0j3Gcvy0AExWrv3QfJz7i8Yg9aErTmGri+yNsIorHBm/w7IouzNPF/w76z6b8
	 26r2huHag/jTgCAFHC8iYwOT/yr4XTmI3JiGNrA0EiRxP+FG4yco5aBg+8wZTqlV/M6n7
	 O+w5Zf9uxFbEF3wS8CDtbOC3giuKaqFmyVPMYbl7PC3nfHd/C7dgurnEhlHJ3/JpA0NCl
	 i0+yjQQ0OgImzDcnB110dsIdRw0cJwuJvQ5RVDg7Id3o/0zGm8xTxbbAfIveh0rojkCab
	 3aB7uZ/orjB/Uha6fhb5iran9SRuyNqd3neisv0AJoeiIXNo0kpUw6ACj0xNW04r5YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397871;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=omJNctg+TiqBC7uSsreYEFqpxjeelyc9bW4GZzkI+r4=;
	b=31tUQPI0LZGVlmCQsMxfqr+4Seudc4hTlin2dxMNYyqu158metaaziRpSOpXq9YkZXpS
	 x4XOJlwuPl3VcMfAolZr+/jXb+Hsp+HozIgezzpfJP47zgvgpgREQI6QtSHGtZVWy7pG2
	 oknD+Q4V/V6NXGXy89pMQ206WsvdjxrL+xIx0YGBAMau6nBmJC43cbofX9Ia7yaGp9MKR
	 Ul/QZkXZIDp3KrAb0qC7l4b/rUsECaSmU82yAQi5IkcVzvQTOuefl0vX6Zf7Y8UkgzasM
	 yNbVSHn8gPVZzcpchqnr7iiov6xpm2FRifIU6AURMzjYLLIp47ZGVzQ/457VIODlT+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bSBHGzyB;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACC7606A686
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AACC7606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bSBHGzyB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795397870; x=1826933870;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8yQwP/djo4MWznjJZMUzkSAVVbOr3qsz64zh2KdZF8g=;
  b=bSBHGzyBeReEZoqTlvb9NCyxMgS8EljZLeJBEtbljgj4rJ1d8xMlj375
   rUcoMXv/AduDj2Zf27oGUvxGEoLC6jU+NDyHAmO9aC7ec8dwBKAOOcsQ3
   bQCU6RLt/Z/CsnIGIY90w04g5U/gQYsH0B91RMTOgcrJx8eX9pIGFyVhb
   D5lZ2Xmzrbpwn8OmLF1egH5Akq+7RvlnPSuvgdPpkoJccckgpQloKtMgr
   9I8gHWFl6rovnmbNfRdWm3E9a4+ucPfAT6GXBKSmv81sl1vP+91AmE5zR
   rXvYCgul3KwemQlqxX8d7ga1lL2zQiQ04KtdAHd6uWBuVP3xMnUjHxKC4
   g==;
X-CSE-ConnectionGUID: 3EbK71TNR3CcTGBNC+hEjg==
X-CSE-MsgGUID: iZ+5Bi3JQW6fLPYY/vId8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4091814"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4091814"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 17:37:49 -0800
X-CSE-ConnectionGUID: 2+UwBr3dQCqLVZJ0yfIxEQ==
X-CSE-MsgGUID: 837e8K6OTV+FT9Tt5PZVqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11173691"
Received: from pg12hl01tchew6.png.intel.com ([10.107.246.123])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2026 17:37:48 -0800
From: vunny.sodhi@intel.com
To: linux-drivers-review@eclists.intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH 0/3] media: i2c: maxim-serdes: fix format and status handling
Date: Mon, 23 Nov 2026 07:43:10 +0800
Message-ID: <20261122234313.327866-1-vunny.sodhi@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: "Sodhi, Vunny" <vunny.sodhi@intel.com>

This series addresses three issues in the Maxim serializer/deserializer
drivers:

- Avoid using an uninitialized doubled_bpp when no bpps are reported.
- Correct the max9296a video pipe status register offset.
- Resolve V4L2_FIELD_ANY in set_fmt.

Khai Wen Ng (2):
  media: i2c: max_serdes: fix uninitialized doubled_bpp on zero bpps
  media: i2c: max9296a: fix video pipe status register offset

Sodhi, Vunny (1):
  media: i2c: maxim-serdes: resolve V4L2_FIELD_ANY in set_fmt

 drivers/media/i2c/maxim-serdes/max9296a.c   | 6 +++++-
 drivers/media/i2c/maxim-serdes/max_des.c    | 3 +++
 drivers/media/i2c/maxim-serdes/max_ser.c    | 3 +++
 drivers/media/i2c/maxim-serdes/max_serdes.c | 4 ++--
 4 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.43.0

