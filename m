Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E99415F35
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573692; cv=none; b=V8eF0mxB396fn0xL3JPisuK2jiDwHIVRSEUPH0Zeu6D/uSppvKUEg26F9hfFwzGSOg5IIj+/if1EyD8+3pY/y6HbLz2A91E7N/4/TIfrtPSmXGPdnB33tQgqjk7K69EpsxvSSCAOD8PWYSR6ekMehsskONyEdz437+XNDrjgsvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573692; c=relaxed/simple;
	bh=rQxHIiBVOMbrZUYBobmy+NfTNLUHhirdFkt03pCzPKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+9S7ayH4umKnGsy2Vu0e/+QJVpWhHE6ngjV4dP5uxrM+eDW/PCAO6HKBOufQXQ9+O5V5rqCtK59faQNF9OJBmVHBsohS3SPYm4DbW7ObBSq3Lp//2GP8XxkLFrceK3BDJTspkle9gCSBdvJwzhsUhJ/Q76ozWXCypQNNixwn+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYuWp9Dy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYuWp9Dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573690; x=1819109690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rQxHIiBVOMbrZUYBobmy+NfTNLUHhirdFkt03pCzPKc=;
  b=TYuWp9DyJjvJcAK/ET3Ul6Ci3MqXMMZ6e21LtG5l6yaewn1qYOq8NjJw
   ihV/1/fj9JpHTR8+qg4GgBgkgOvutxZacpJzn0CwALKrNkxBJUTFH+SgU
   gElcTKtxVb8XiKVSKaLk6y8r6QzljAQvYXmVPs9c0cA7oDF0YhpInYbyg
   28ItEbgT9uvN+Bqm4B3T6gJg/3FiJ/nAnyWzaaT3fBREXMdJCBx7gKVZ2
   5IFJSpCW76fA5FrDFqfhxput0Y4L7s5DizpaIjC2MeMQqISyD22qNsqmb
   h9uv/UEUEg6frLeDNuoB2u+CgPwSBKkGGNM3MUdPps4Xq/ijw1wzytG6O
   g==;
X-CSE-ConnectionGUID: OevKGoDuR5K6y6hmmtpkjQ==
X-CSE-MsgGUID: bA7EyJY+QTSp9RP2ijZKZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036509"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036509"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: goetdsvSTjuNLA+ei/+rZQ==
X-CSE-MsgGUID: 54xhDBmhSB+kDrOEdg/ViA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787654"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 77DF5121E96;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39V-2bi3;
	Mon, 24 Aug 2026 15:14:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v3 13/29] media: cdn-csi2rc: media: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
Date: Mon, 24 Aug 2026 15:14:35 +0300
Message-ID: <20260824121451.3348583-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to allow
compatibility with drivers that do not implement get_frame_desc() pad op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 1ff2d8f78d5b..e31cdcd9ce8e 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -722,7 +722,7 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code		= csi2rx_enum_mbus_code,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= csi2rx_set_fmt,
-	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
+	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough_csi2,
 	.set_routing		= csi2rx_set_routing,
 	.enable_streams		= csi2rx_enable_streams,
 	.disable_streams	= csi2rx_disable_streams,
-- 
2.47.3

