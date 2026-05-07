Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F12D3D349C
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148525; cv=none; b=pFyFiNaLPg02ebomK0Wz9efGkvJTxdS6X64rfMCSKzhX4O6IvHfFbXtUdfxWHJPTswYEjutLsmWja86lBB+cv+N7sJWa4fm0WDMHMQ3nfW+QRWn46TJl4YNafIOw13XK1qfXQfYeFPsgbuJADH6e2JvtgBlf/D8YVB5kbk500q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148525; c=relaxed/simple;
	bh=/HH7adGee9bl8735GG/Nez990NQxLbcqQokXJsgDxwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rhRPWHrG7YGgM4WJC0+Ic42u0ypeR06Wmru3KG8SScjTYPgg3E3A7LTXPNKh3wEGCZd7tBXt5AGkUllL7sz/Kxe31Vtu5/3c/9kYsfnP3GTXr+YaFQ6dFr4iF76CCNHzaJKPDYuGDeEI5QrTEAN83Z6Y/DGNjNB/AWQG81B0T5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Knl7cu33; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Knl7cu33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778148524; x=1809684524;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/HH7adGee9bl8735GG/Nez990NQxLbcqQokXJsgDxwE=;
  b=Knl7cu33jQjDyLEsAvYeWfclVO2QftTvKndj2tsyhQr3b83p+qJt53Vy
   zvZK+93pQYaIDvu1WRQgAPY5t8DM0co2xgpP4vTbdPyF2MJ+606vZK1i8
   bFIzqtexnnqYlqvmfxKdAYfPyo7+/3iN3MsFvMIC9pDiOSZoH5u0d+WXM
   Ws/FwvY4smtQbr02H7G7Kij91dHMRvOEFPUQJvdux6x7Z3vN5kKQZG073
   gp5pB8WbkFo8vGWvjAj4e3JYMf8uQEwLjJIQFVcjpwmLiowCQq+8Rpdhd
   XakTOKyrhHp4ui31hrj75YA4ts7IApYmrWyZayHrkP/jEbWRhJKRcZc+v
   A==;
X-CSE-ConnectionGUID: HIFFBQvCT9Kc9aCuyZfT8A==
X-CSE-MsgGUID: edMPJzmFSkul+XP4AzBhxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96663002"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="96663002"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 03:08:34 -0700
X-CSE-ConnectionGUID: U6sI5lyGQVSxX+nOj2YEHw==
X-CSE-MsgGUID: ZuMDR5xvRpiUF1T/cebYLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="274565955"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 03:08:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6936D121CCD;
	Thu, 07 May 2026 13:08:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wKvgy-00000000NAy-2x8r;
	Thu, 07 May 2026 13:10:52 +0300
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 1/1] media: Documentation: Improve LINK_FREQ documentation
Date: Thu,  7 May 2026 13:10:52 +0300
Message-ID: <20260507101052.89080-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a reference to the LINK_FREQ control and clarify the meaning of the
control as for C-PHY the matter is less obvious.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
I'm posting this separately from the metadata preparation series.

since v4 metadata preparation:

- Add the dependency to UI for CSI-2.

 Documentation/driver-api/media/tx-rx.rst                     | 3 ++-
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 22e1b13ecde9..7df2407817b3 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -93,7 +93,8 @@ where
    * - variable or constant
      - description
    * - link_freq
-     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
+     - The value of the :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` integer64
+       menu item.
    * - nr_of_lanes
      - Number of data lanes used on the CSI-2 link.
    * - 2
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 6d516f041ca2..57c2baf34acf 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -24,7 +24,10 @@ Image Process Control IDs
 .. _v4l2-cid-link-freq:
 
 ``V4L2_CID_LINK_FREQ (integer menu)``
-    The frequency of the data bus (e.g. parallel or CSI-2).
+    The fundamental frequency of the operating symbol rate (serial interfaces
+    such as CSI-2) or the sampling rate (parallel interfaces such as DVP or
+    Bt.565) of the data interface. For CSI-2, the frequency is equal to
+    _1 / (2 * UI)_.
 
 .. _v4l2-cid-pixel-rate:
 
-- 
2.47.3

