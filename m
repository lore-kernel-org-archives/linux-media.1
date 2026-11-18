Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008539;
	b=xmSQyBdYo7OKRvDTtuYS7FaoQtUG0ynCMpKdE6b/6UcYv1ejh4/yDUybjvX6aUo5uaav
	 0E1U+D/auQMwSRHhj0uKYxd6CT0XJFam1U+8jDPg2nWwkDzslryyE2NHub4/MX9xPMsn8
	 XWG1stX//+7LSR7FXWIgR/F0sZ49PkK+XMcgMk0ySNfetwjDRryWM5mEt+5+/GdkFpnNk
	 id84YmvVBuojMPyjQ0jX0E/O0ishIELIx4cslcPVP4s4V+HNiJHzW/d4hT2mBw4xm793G
	 rKrXKeac4pL4CdiOU/M1UTJL/5aZukTZe/V4hkafEGyrjv+DRR9Xwr8KWLVvLnQ1Wkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008539;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=lnUtK997ougY9Grs6oPfUV+LnbCyRs2btkkbxHRk1i4=;
	b=BKdHmCy5hzvlnj5yPPoe7FP+qnWe8tkhdwMYaPFq88qlSsUUbIx6iMztR5Pt6qjdpQzd
	 CyvuMDrxxtMOHxcisqsANmHjgC2YgDB4F3D7+z/AdZK73J0p7Z8qv5/HreLwDYDRRPXN6
	 pV/Vi9KbgpnE3dIlO3HC2EwOWnRahPQSdDToioaFnr1Y9TNp2a3q/Wal+LZpPvgQrj4OG
	 CnLXRkM+F36B8X/S2Vz5Aytkw4ruNnoVkVZ4dFwKzcPyEyu0g81uTxDXIrIzWOsQKQ2Ue
	 bJNA6xtwo+cG67cl/DuXe9cWDaaC65+0emmPznUAPG0WM2cA68BUM8CsTLb5l4SjR6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z7A6ADF5;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2CE606A330
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A2CE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z7A6ADF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008539; x=1826544539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JdbourPei+sGZHaLTHmR/uu8EAB55nTi6zoqQj+n7h0=;
  b=Z7A6ADF5JB6kf07HdC2VcSPmyOdTO8/p30p/lUZjbgTOAofUP/Oa85Lj
   fB/joI0VFJ8mMAi35WKgKUQYZ/6iXQvFvirG87fFdICMvI+hU9xWrIBlv
   P75Gp5TyC39/zb+zbrN39Xq0eAekkJ5OtLpz2kYYYuJJ5tSjRYQx/PJCG
   y8gx4cHFod4sUP6QwJQuIMbG6+FPzVZvhvCFSdTZhNT3rjmVppEP1TnXV
   2rWdw97+n9atN4jFl05/E4ZXOkZ+jTyCTAym6lBHpJ6nNTHZuBUlTAv0H
   JHwhlI+58Wwm29krZCuMtbz+Z/FolqVKPGabrXUOCGYaGLDhytoeHyBE3
   Q==;
X-CSE-ConnectionGUID: MdNlvJiCQv2WL/S4X4WpNg==
X-CSE-MsgGUID: cvIL3DiSRRek9FewLhFhgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808698"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808698"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: MXxaZdUGR+GLKA7P+SO3/Q==
X-CSE-MsgGUID: QBQEfVucTYuJyEYOyb/aiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376705"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6465A122F35;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tb3-04aG;
	Wed, 18 Nov 2026 15:28:20 +0200
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
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v13 22/73] media: Documentation: Document IMMUTABLE and STATIC route flags
Date: Wed, 18 Nov 2026 15:27:28 +0200
Message-ID: <20261118132819.213473-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
References: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
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

Include the V4L2_SUBDEV_ROUTE_FL_IMMUTABLE and V4L2_SUBDEV_ROUTE_FL_STATIC
flags in V4L2 sub-device documentation that discusses routing.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst         | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index aa1f1a07af17..9168a3a45c9e 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -600,11 +600,15 @@ depending on the hardware. In all cases, however, only routes that have the
 ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set are active.
 
 Devices generating the streams may allow enabling and disabling some of the
-routes or have a fixed routing configuration. If the routes can be disabled, not
-declaring the routes (or declaring them without ``V4L2_SUBDEV_ROUTE_FL_ACTIVE``
-flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.
-``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes back to the user in
-the routes array, with the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
+routes or have a fixed routing configuration. Routes that are bound to hardware
+resources and are always present are marked with ``V4L2_SUBDEV_ROUTE_FL_STATIC``
+flag. Static routes that cannot be disabled are marked with
+``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` route flag. Static routes can be disabled by
+not declaring the routes (or declaring them without
+``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set) in
+``VIDIOC_SUBDEV_S_ROUTING``. ``VIDIOC_SUBDEV_S_ROUTING`` will still return such
+routes back to the user in the routes array, with the
+``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
 
 Devices transporting the streams almost always have more configurability with
 respect to routing. Typically any route between the sub-device's sink and source
-- 
2.47.3

