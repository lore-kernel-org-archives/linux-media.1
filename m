Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE2409121
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405872; cv=none; b=Vfdrnf0exd4HEO/JiGcyfaibA0nE7ejcbYDGsP5qQ4wHEpS63HRYkK8nlJuDD4d6pkh5USZSV6/+uKvQ/8u5glpapE5YRS6xpEtzUSlX0t/1iwdtr7p9uey7ceYGbmEepheWqQ4IwBQc7R+vqY/aPKiqq8weZ2b6ZSEmy/U6Zyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405872; c=relaxed/simple;
	bh=clChmaBLiqlHwkcVRCyYXk/pnCOfPn2q/MrxTVEuZrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yn20LBxxqoPHdVdIPY/tyd3DvZDXQ5kGg/It/2UYDvFKAp9iuunoroHQtKDkuzpEW8hG511tlsxOjJIYpEyD7IdBgRxqROlArUYFlJ5eJ+/1ecIEmxYNkIU/7vJ1y/trTpUcJ+7pYsP55xr/TtWkfjA93swXQQaq8PCRGo5rgP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2Ik+0Hc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2Ik+0Hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791405871; x=1822941871;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=clChmaBLiqlHwkcVRCyYXk/pnCOfPn2q/MrxTVEuZrs=;
  b=K2Ik+0HcGkwsLAnCE4ewDMbLOWrq3LcjZ/zy8zIFe1ALmTWRcU6bKtI3
   SqlWscGAOzd+dDLXNA+DuZlRtSa7ZF9S/HHscgR0sidlizI0mwDRacCAW
   qhboWqjiQhIbUc94ZG57r1uA3I/13/zZl+1mTA/UObQdRgj876dEgkG6z
   SGqwlMC5qdvA1dXuoZd2kWY7+rz47mxFd+p8akPsc60aXr+2sv1EVq1yi
   vsOkvoD3SgvriHJkI4oHTcNw+Nb/LMPPpGD2FLh59JIimJCqw/ftBs0zm
   iEgXT6QRShR6icpP2+csTvyjMqRwN0xooI79Dpr2Wmr19gFElw3Y58n4D
   A==;
X-CSE-ConnectionGUID: V6I7HfjZTnSi0LAAztznDg==
X-CSE-MsgGUID: PICzmV4PQbyzqaIIluIgAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="81552"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="81552"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:44:29 -0700
X-CSE-ConnectionGUID: eAIqSH5CRYiYa2zGWkisdw==
X-CSE-MsgGUID: EgBt/CWeQ8uDkM6hkOTEVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1642446"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:44:22 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 68071121BD4;
	Wed, 07 Oct 2026 23:44:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEYSF-00000003HXq-3MSc;
	Wed, 07 Oct 2026 23:41:35 +0300
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
Subject: [PATCH 0/2] Keep MEDIA_PAD_FL_INTERNAL for kernel only, for now
Date: Wed,  7 Oct 2026 23:41:33 +0300
Message-ID: <20261007204135.782415-1-sakari.ailus@linux.intel.com>
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

Sakari Ailus (2):
  media: mc: Keep INTERNAL pad flags just for the kernel, for now
  media: maxim-serdes: Disable test pattern generator for now

 drivers/media/i2c/maxim-serdes/max_des.c | 3 +--
 drivers/media/i2c/maxim-serdes/max_ser.c | 3 +--
 include/uapi/linux/media.h               | 6 ++++++
 3 files changed, 8 insertions(+), 4 deletions(-)


-- 
2.47.3

