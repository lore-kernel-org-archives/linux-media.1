Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A94921A1
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908604; cv=none; b=WWDxva2zUykpFr4AbQ6fP6vesa8tyrUXnmnN5LuUV1RwHJAhOKPxnMB7Rl+QIuHTLOxwJwgzeYJymd6Q2C0iU31EqAprpkr7To8he6Xs7SP3XipH7/OPtM9gFEvghtZRqasNlAwcaqM737o4ou/W07MGlcr5/SCdDmbuUNjn1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908604; c=relaxed/simple;
	bh=s6mql3yvxOavyk3gxFFxeoqZq1MaKTu0RoXnz+Iw/FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUszcj6e9FHAuFzNTWXabI5V+PbRvcZmbKvDjccFg2+5pNEw/nFplhF1fWeuZgiwNrescBTrwngJ0ZyqmIDGCo7RUy1KTE4g4GSA5G4L0uXnP52AFSJYogyx2fTnycc9rC5PgabeaZsYbta+gJhwAZxrF5eIcqTRamrOrZcoTZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIyrcArH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIyrcArH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908603; x=1814444603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s6mql3yvxOavyk3gxFFxeoqZq1MaKTu0RoXnz+Iw/FQ=;
  b=XIyrcArHLJXBTFfmvrfI+wLFo7pBV96gT9akMdGkqqAeTevbvQHLYLoD
   KMzPsAtFVrnfDURRu7tz278hM4cqyjyvVYVqHt8qBuSwuSZjLvk7Mz1j1
   I0XwQJW53PW3alXqnS8tCLmWd2JTn8xUsNKaLhCUJshapQRSjKliHbFkD
   FmfTp45acW5QvaXY8eb1byP8vxwSkzEeIganp5ETNyGh3aETaRgTPYRuS
   2YG9YuA3FBQ4DE9OBOw0K21FFFGO5jgGP/eZ39s5OXCV1ImRXFOJBWqO/
   eFhZDgneB6Tm0x18hQKlqABUoULhJQTP4lc8SN71aQsbUP5Scy74kfclJ
   w==;
X-CSE-ConnectionGUID: AfnFiwYDQGyg2J8BR/WpEA==
X-CSE-MsgGUID: +UHetii3Q4mWjX4yqQREBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94239134"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94239134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:21 -0700
X-CSE-ConnectionGUID: N04jh6+3Qduo6AvTYOlb7Q==
X-CSE-MsgGUID: GH/DM0y8TuG8d+3CylCXBw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EE58F121C4E;
	Wed, 01 Jul 2026 15:23:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1weu1S-00000007Fl2-2ylE;
	Wed, 01 Jul 2026 15:26:34 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v6 11/16] media: rdacm20: Don't assign set_fmt()
Date: Wed,  1 Jul 2026 15:26:28 +0300
Message-ID: <20260701122634.1728782-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not assign set_fmt() as it is the same as get_fmt(), which will be
called by the framework now in absence of set_fmt() op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/rdacm21.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index bcab462708c7..c7d2bb1cbe48 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -322,7 +322,6 @@ static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
 static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
 	.enum_mbus_code = rdacm21_enum_mbus_code,
 	.get_fmt	= rdacm21_get_fmt,
-	.set_fmt	= rdacm21_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
-- 
2.47.3

