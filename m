Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679626ED35;
	Sun,  1 Mar 2026 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328734; cv=none; b=bD5A+r/+Uc0nORNifVL0bcNFypHmSZ8Ap9HzrIXpz7oQCG93Nq9LNnVlSntMcrNw5B4yUPEKbnoxtNIj95P+KOp7n8nYxNgMk6ImQxuxKZJtr8QBbaySUYDO/2J6p3+qNp0BE7eUgQtFInbDvEzBYy+V8foltdEHoXw0BYo3gCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328734; c=relaxed/simple;
	bh=ei3flW/4dQO0zI3LRys9GYGDQJhDouYOE2IHt2kIHp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYJO1hNOGqrxq+RkfXW1+GSsBZSg5oJuRiDhvFVtxh8TYwXozu9vENEXJYdspu8Z81OgZvi8RlJ5pAmsCtjB2SMtHbyYt7Al/jKxv65hJ5MnrYOT3xM3IbntszmuKmTI4gq2bm1RLwQN52nmAqrQ4Zd3x9bHK2rMHmgBv+LkMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zn7gRJS3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zn7gRJS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D394C19421;
	Sun,  1 Mar 2026 01:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328734;
	bh=ei3flW/4dQO0zI3LRys9GYGDQJhDouYOE2IHt2kIHp8=;
	h=From:To:Cc:Subject:Date:From;
	b=Zn7gRJS3Kp4hwREq5JywzqAl5Z04/z8tEeqnP8vczgPd9H842noYg2Ss5aW8Q9CeW
	 Bv8dnAtAboaJFbfOxnKQbMNVTRjNAuDpbL3VRafbFsd5olN6M6MRBSEINVxfp1MXpn
	 VUBFQI920y10h76aDBsckerbdDT8yMpX67Wh4mcRjW3R7yd6h4oj3urIfKQPv7V3+w
	 0JCVWRrNNryf1YUfGUWqNHKvCs/unq2rCxaSBhJmL0IsmQHCIlAlboDsm79Q58o/sG
	 YRhlGjK7W39r/h3eU/lZwdL8kctXey+GLuThiEMKouoT9xotWLOIoch+JBbi0pvBLx
	 bWW8XPflwcvKw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Correct minimum VBLANK value" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:11 -0500
Message-ID: <20260301013212.1691066-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 1438248c5a82c86b4e1f0311c3bb827af747a8cf Mon Sep 17 00:00:00 2001
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 22 Dec 2025 13:45:27 +0530
Subject: [PATCH] media: i2c: ov5647: Correct minimum VBLANK value

Trial and error reveals that the minimum vblank value appears to be 24
(the OV5647 data sheet does not give any clues). This fixes streaming
lock-ups in full resolution mode.

Fixes: 2512c06441e3 ("media: ov5647: Support V4L2_CID_VBLANK control")
Cc: stable@vger.kernel.org
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index d9e300406f58e..191954497e3db 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -73,7 +73,7 @@
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-#define OV5647_VBLANK_MIN		4
+#define OV5647_VBLANK_MIN		24
 #define OV5647_VTS_MAX			32767
 
 #define OV5647_EXPOSURE_MIN		4
-- 
2.51.0




