Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B03D7D65
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534988; cv=none; b=A648l6gZOoiEj56pRQ7w/OLSAImY2L+34L2n8UlW0umgri5BjEqoIKkG59noxSqVNgYXNQwMHD/yL8ffjJirhVkv2xjYCmBFMDTNycrchA6QOT1FZLqTSCcvLlDlgFQ7fdEPQfBXs4uUYluqxWgrqVP87pTVxBILOssEeXHT3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534988; c=relaxed/simple;
	bh=S2QsfoEi+ZgSkotsrYcTcNfSxZLY85FbW02wD6OWTJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPYIFQhxGI1hsn1nwmKtkzkZDgbtDQW+kT/g0P8/xB8i2oh7qDwZ/1gVWIUupyfkSHGR6bbDminux81rIuJ/UHfq1+3d9smo4nSVEpYmnZqco2gLpKwS7PH/tNaYdA1l5U/EnKShbxJr/m48uI9Wv5CmXEs2HFPYxJ7LM0rYLA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWZKA10d; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWZKA10d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534987; x=1823070987;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S2QsfoEi+ZgSkotsrYcTcNfSxZLY85FbW02wD6OWTJQ=;
  b=MWZKA10dS31WTjyPDp6q7YfrMV8IGh6pJt7XjGxAxSsUxW2gyo8S6947
   hCY7mqVt8/qtn1fFO1KNoqBU5g3d8qiS1FTn2UC6KdsPqpRn6IJrpjU5B
   RXV99g/dRDA9nwDijjzq4z5sE4Lcs8azhmTqFuljAx4NqcefDDh+zSnCt
   4oNU+LxmnWlh9+WCOcDs3okd5U1TIBa+egaYo8kFuqLmquWsAYTlKAPEA
   M7UI1aFQUA+AN7OCj8w6Ui+UH5kX9jV5tCvoZ4bmOjub/cNz0DGyG+Vql
   oEBKOTrFN8wLLNutuTqT0TDuky+u75KRpZCBZ0LA/2TjHExY4dorqlWap
   A==;
X-CSE-ConnectionGUID: PbkThrk8RmC3PWS0KvBOZg==
X-CSE-MsgGUID: kXSzCKVlTNqEDuGCt8DlHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="232301"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="232301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:36:25 -0700
X-CSE-ConnectionGUID: ig3UNR35STaYG41Vnsg9/Q==
X-CSE-MsgGUID: KvSplZiUTNGAPV0Hk2A1Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="379995"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:36:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 76D2511F9E8;
	Fri, 09 Oct 2026 11:36:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF62n-00000009FYK-3hyS;
	Fri, 09 Oct 2026 11:33:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Dumitru Ceclan <dumitru.ceclan@analog.com>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Cory Keitz <ckeitz@amazon.com>
Subject: [PATCH v2 0/2] Keep MEDIA_PAD_FL_INTERNAL for kernel only, for now
Date: Fri,  9 Oct 2026 11:33:31 +0300
Message-ID: <20261009083333.2204725-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

These two patches limit the visibility of the INTERNAL pad flag to the
kernel as well as disable creating the pads with INTERNAL pad flag so it
won't be enumerable via the MC IOCTLs.

These patches (or later versions of the set) will be merged for 7.4 before
rc1 and reverted once the rest of the metadata series can be merged.

The patches are compile tested only. Review and testing is welcome.

since v1:

- Improve grammar in the commit message of the 1st patch

- Add TODO comments to the maxim-serdes driver about INTERNAL pads.

Sakari Ailus (2):
  media: mc: Keep INTERNAL pad flags just for the kernel, for now
  media: maxim-serdes: Disable test pattern generator for now

 drivers/media/i2c/maxim-serdes/max_des.c | 9 +++++++--
 drivers/media/i2c/maxim-serdes/max_ser.c | 9 +++++++--
 include/uapi/linux/media.h               | 6 ++++++
 3 files changed, 20 insertions(+), 4 deletions(-)


-- 
2.47.3

