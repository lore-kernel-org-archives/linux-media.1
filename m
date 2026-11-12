Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508341;
	b=MSqCi9UcqLOOvT58YcGrOVLeMvwhEjg+wQ6lfXbo8FWsBgTZTIJgh7grnEXgv6UgO4dQ
	 D/IZNqmIGNEISjTRgTEIOWrE8o1B8p+dPTjKYUYeVi2qiy3gNdkxREWfP3TT0WgWfi64Q
	 LsCK0wj1/Wro/aTKQupvlwB7BgbUft7fwM2SAAmrlxFbJocKNzBWotY6E3/ghQRkMY+Yv
	 BxjuyY6myWw0l8cgQ3yASdDVXPyS8Lh8/3wL+shuNSPI9qIoFe93SzqRcP6pqlSU+D8Ik
	 Pwds0lTgEtIvdnRYPrErQZ2j6JgXIfI2vu4F1cqgcQ4ohX5QrrBAR8tq88HhVgsc/AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508341;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tV6r5MB/5FIxkx97f51ihC5VUwOJnKgq3aEHnO14w+M=;
	b=3SlYZMCI3OgCmXzX/HCYaqfLSDjCJ1aFGae5drKdHW+qzrv5b8BtQz+Zgp6YQNpELyIP
	 WlUyQyHEzF47/et49Z+heCjoJU64YC0H20EXrP2P0RWN9NoapYLEWbRoYUmm+zj+UTtNZ
	 K2ylDNEb8MUGyXt8vSwxAZf3W37yPOzkvHW13K5Fk2j9NSt1Fs6aR1XlUCi5j4RpRAFBf
	 PN+DEb6F4TTOJGoGD8mQzjdL8bt5wlBERHNadhor7KPV4zu7TPs1YGZLiXk+KUyu0e3p5
	 ylhFdCVhGOGE7veZR/v8LDzp8GA7Gxm9Nrw8FEcA0amfULzg3rWebsuG7Rgl+VMi8AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1TBVy4H;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD360A2621
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBD360A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1TBVy4H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794508342; x=1826044342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IGBhMtrRjJl0n4esDMpqx2bbeKyzIv4/AzvkzeFD/eE=;
  b=V1TBVy4HRu6CEG1Zo/tDoS/wcIO+ev7M4uC89+zJTWwtuUO4J5CcB9hL
   c80uRbxWJIGvdC/VfJ3Q6A2LdNaNrr5N3jEIt4BbclQDQYngPW0eea5Zo
   s9kOLgF90JAxxUoXZVV+OPgBFMNVf35oe5zF6zvkbdsqOMj+LhKYnc/0X
   VAm/Gv3v+1+mf3w60dzXfJ4U3FyK2fjSFP8wC9iJ4XbEwuDZASvUqqZGn
   yetzbMUulODOAV27jA/aSE+wP+UHq6M6ic2cSsS1RKgW0/P3++bi5ZtEy
   U7zfEYZluuSvhwh6/QVG4OawiiXOG1enkLNlWS9XJIu8k9oh0t5nRU/jJ
   A==;
X-CSE-ConnectionGUID: 1pSOCSp1QeSGDQYUs1Qv4A==
X-CSE-MsgGUID: RxO/v+UyRvWBkHzjZmeKxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3347789"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3347789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 10:32:22 -0800
X-CSE-ConnectionGUID: mrtK/zTLT2+59ewYre5AsA==
X-CSE-MsgGUID: isn7RK4RRPW5xFvUSVRnEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8618135"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.103])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 10:32:20 -0800
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: linux-media@vger.kernel.org,
	paul.elder@ideasonboard.com,
	daniel@makrotopia.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v1 2/2] media: rockchip: rkcif: Validate the pixel format against the media bus code
Date: Thu, 12 Nov 2026 19:32:08 +0100
Message-ID: <20261112183208.2688580-3-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112183208.2688580-1-mehdi.djait@linux.intel.com>
References: <20261112183208.2688580-1-mehdi.djait@linux.intel.com>
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

The link validation only checks the frame size, so a pixel format that
does not match the media bus code on the source pad is accepted.

Reject such pipelines with -EPIPE.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..66726f654674 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -460,6 +460,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
 {
 	struct video_device *vdev =
 		media_entity_to_video_device(link->sink->entity);
+	const struct rkcif_output_fmt *fmt;
 	struct v4l2_mbus_framefmt *source_fmt;
 	struct v4l2_subdev *sd;
 	struct v4l2_subdev_state *state;
@@ -489,6 +490,17 @@ static int rkcif_stream_link_validate(struct media_link *link)
 		goto out;
 	}
 
+	fmt = rkcif_stream_find_output_fmt(stream, false,
+					   stream->pix.pixelformat);
+	if (!fmt || (fmt->mbus_code && fmt->mbus_code != source_fmt->code)) {
+		dev_dbg(stream->rkcif->dev,
+			"link '%s':%u -> '%s':%u not valid: Format mismatch\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index);
+		ret = -EPIPE;
+		goto out;
+	}
+
 	ret = 0;
 
 out:
-- 
2.56.0

