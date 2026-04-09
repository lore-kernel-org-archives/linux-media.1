Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896CC345724
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765734; cv=none; b=TZ8BCW3nhN+P3bk6LTsIHmhuxBnZtmE8FDGSlShkCRtyYb3vpPVIYX6xcCJGt8ogxBr7Un41x9EJMZD2d/dBRB3aUWY31756UUlvAo/WMrQCGUzLZs33FfkqdyqjFsH3KME+FpHiDkPwS2w81eYNrkJ3AcA5MsdmNhbF33kRBJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765734; c=relaxed/simple;
	bh=n0N4kXmSvUGOCkefV8fZpTl9zTNQUahjAqEYmJMyqI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bD7fO/yx0Iq7dzdK/+bCy/wKGlXRnQecqGDOZwWOR/0UpY/BW8hLdCMZvhYa/t0IjORm63Mhl9u/FvDR5yJU5Hwbs/HdZof+90BLjD0DHED9BWQ7oYL658JSBH9tHQe1CUlMh9I/aWUjoVz3GcXBaOHlsAKpjem6/fMUzYz04Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKqNaZot; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKqNaZot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765733; x=1807301733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n0N4kXmSvUGOCkefV8fZpTl9zTNQUahjAqEYmJMyqI0=;
  b=GKqNaZotJRb1WefyYqdruFSgOliPbRsvBDHdySQq1Bo4cenXmPfJ4PXk
   TDhWf5QioxjJuGJowtRKUEbouDClLEspb+4KKdevI3JUugQuOmTjUT2kb
   CbMeHTYIK3yblwoegMMLrB7r85Cgt0KsEa2R8JojOQyufV1XZd6vTPECw
   cHIvmbetIB5fCUtli2SICvRbin41944Q3F0UFP6nO1ZiDLRS1iB/D4YR6
   3+RYaJ3Nc53mVXSHmLRxnV2KAbi3eMEPjO2mzZTz1iaIh4TTsMDmTReGx
   Fyl+/+t+9oVf+xGsWWr22LOBRzvb4894B7aszwmpF2X5sg/82qitt7pdA
   Q==;
X-CSE-ConnectionGUID: 0GDAHqlGRO+CbP+X6GQd7Q==
X-CSE-MsgGUID: bk6waqVbR9qnPMWZXk/QiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409145"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:18 -0700
X-CSE-ConnectionGUID: mcqOTqpXSQi5nRAE9ZcQNQ==
X-CSE-MsgGUID: q/Skv7P5SNCvg3uPKb1bnQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 58F6112260E;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lR-3GvH;
	Thu, 09 Apr 2026 23:15:01 +0300
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
Subject: [PATCH v12 12/86] media: Documentation: Refer to metadata layout in metadata documentation
Date: Thu,  9 Apr 2026 23:13:47 +0300
Message-ID: <20260409201501.975242-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using generic metadata mbus codes requires the use of
V4L2_CID_METADATA_LAYOUT control to define the metadata layout. Document
this in generic metadata format documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/metafmt-generic.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 23f69e1a1afa..7226b4810088 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -8,12 +8,16 @@ V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_M
 
 Generic line-based metadata formats
 
-
 Description
 ===========
 
 These generic line-based metadata formats define the memory layout of the data
-without defining the format or meaning of the metadata itself.
+without defining the format or meaning of the metadata itself. These formats may
+only be used with a Media Controller pipeline where the exact metadata layout is
+reported using the :ref:`V4L2_CID_METADATA_LAYOUT control
+<image_source_control_metadata_layout>` by the sub-device generating the
+metadata. See also :ref:`source routes <subdev-routing>`.
+
 
 .. _v4l2-meta-fmt-generic-8:
 
-- 
2.47.3

