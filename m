Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008539;
	b=F4IWLB/yXoS6bbcHJc9z+LGOuPC1gPvAQsZvtu5PsLMsOjsJlCtivLiyXDQVCQ8D83Aq
	 KDyyn59YzmkGq6HgK6rVhGVV9qn+bHSUA/Dn7zM+Z6qM8p2b5BKZ+BbsIipfaiSVSIbTI
	 0fF30VVsd3oMYS1vPFe1oz2e/hUv9AaZ0rtrTCmyFJtD86uer7qf7ZTSE5eJ+tHn7FZjg
	 hb6gCl5iex6idHD96VUE6dg74KsQULWadSRgUi5OJ9NhxL8E1N7xbZzodnCVfVLDrbiLI
	 y0TNwpGw2AiIsEreZNioZHfsB5Js15xBCseU8g5BBn5zE+uSt7RQIxxlZ2hs0wHZu/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008539;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=BifNI3qGL7MH9nEREO3S/zOemji4454CRQ+JSzZ2GzQ=;
	b=cwjw7b8jOpn3YtRx3LWa15680106EYahXUu69lLH4RnsLytvZH2uEU/huMC0tD7Gtrnd
	 +Ki3PJ99LBPgRJDeBS7nMZeQ8ROFDSgkLVKT7Sg+7+P+KyJf7jpcd5E2UQrlSoYEk1S+Z
	 gmL65qhnGZjrV39u1QGJ5c25JTdhE6Yp8xwvsRTmzljypWXT+h4ct4utYQpScpicgfW8H
	 u5JbA8WXcw1gAL17N0pYlR0tT60/BVKy9YEs3dz1QNGTnbOgLWYIsnxw9/rsiNfFmrBnl
	 /BpYf6MXMfy7ERcz+nvnzcIzHYjp16tHd185pWBVIZ77LQgDtidLe6Slki3RmjAycTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cFP74L6r;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A2606A339
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F41A2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cFP74L6r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008539; x=1826544539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n0N4kXmSvUGOCkefV8fZpTl9zTNQUahjAqEYmJMyqI0=;
  b=cFP74L6rcbAmh2ozSLo0ZCpcUxerYyKeatRZKkGYqUGqaKpOTFL1n3xP
   cSZVUnP0BgC/kAHAti2Uvnwt1Sl2ghfOemD/eIqWQ9TCm8OWPL3J/RgKc
   cDYdwdJ10DD10jlqaCx0gt8/AvqlhwdfobVcA4jMAeFsA6DOj2bB5BAHd
   6mq7LRH5ql2agbv2TAja6QfrMWpmT9J1SBZchUN7wNlkQeTvpWO+56OQ1
   yPZU+rKOyrGlnPxSfEngI949azPdCzlPrCvSYn8zTcMK22EsDHr8iFSBr
   F8lo+T3q3DkXLYn/YTDge+eVb76J61srRrnZlEXJWjnWm2VP6q3Kre/Kh
   A==;
X-CSE-ConnectionGUID: tWcYS0YdSeKnhBnVzWOd8A==
X-CSE-MsgGUID: cDBSwbHKQWWS1tfdkNLkug==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808679"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: 9KFqVSRMQ5eEGFE6Tao0HQ==
X-CSE-MsgGUID: Ga0cj3VXRBiuTEUF54QN4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376701"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 49130122E40;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000taX-3iAU;
	Wed, 18 Nov 2026 15:28:19 +0200
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
Subject: [PATCH v13 14/73] media: Documentation: Refer to metadata layout in metadata documentation
Date: Wed, 18 Nov 2026 15:27:20 +0200
Message-ID: <20261118132819.213473-15-sakari.ailus@linux.intel.com>
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

