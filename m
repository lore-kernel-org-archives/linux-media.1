Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992A43F080
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421322; cv=none; b=B1EK17n8Ns9OfjomvsTYOZ6zJTLbXo9Qf1aNlTxVqjTE9plORRG2G8p+4tMwlzEhZdh1f+KQE7ic8JgC3WU6OqDLSQYTkosIbKNOqo52qywNkKCvv2yibvaKiClVo8iB8E1bUOrl7iRlRARYgJj/acmc98yq3B85WOzk1tEQ3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421322; c=relaxed/simple;
	bh=db4jwCSYf65uPE2hErJ21BNgTDYM0QnUNmaHyTuRs+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c14g2QyBxj9IlGfbiMZxrkQduzt17/QlQ7XIhCFZPoph4FbUjIKsi4bcN5eZmAJujAbwOsB9FRNJWp9xnHXW/zSKKn2WsZ78Nxkpi7kKVKqhMznOWV13q+TjpyV7FwFbSaSx+WGdCabniyop0Wxrs6s0I4anutGOlP/ZDMFXlKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBgKhfNN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBgKhfNN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so30160415ad.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785421320; x=1786026120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vgJ5zCQaQGqjU+4+BgL6Y7a9Vn81v0XBYEcUUgveGk=;
        b=KBgKhfNNsYXtHWbXEvBB+F+ljZpzbMbyk26AC2SD6Q+0LB9uA97cVGY5Zl0VbvhBv0
         s4ApzZWi9pvfBFp/iWsh8100CjlG8u/KCwH6zHLvEOr01mm7o+QpDs1T3je6UE183lNL
         sUT/TjHDCq17TZavRtqTXnzEMkhtkcQQUiEROKRUgbk+q8a/YivFmwCjgAk85pj/TdeJ
         evdiPB7ScfoiatwtMf0zv/9tssekGQ97wPink/0B87IOB0iBr5Yc6uXxYBr73G/aQs6E
         k1LSeZYdWe6Rf+oRF5ZhrgdLXIV/X81AotIl3z6j9bewuXFrEnlxBEUVP621uiA2AsmL
         8G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421320; x=1786026120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vgJ5zCQaQGqjU+4+BgL6Y7a9Vn81v0XBYEcUUgveGk=;
        b=sLTDyXJYSmogUwOkdj3kmugFme2Cd5q0cvvww4+fjGlu71Oe4UYJ2D7I79jHrJm8zH
         o6HSgEnqv8RrnSWwhuIRL/IBENiTqNlvgfv8WlEAxsTdIWkwhRK+KdfcUglIJevT0lKp
         EEPn/cFvB6QhK+93fVO/p7MApg4Wew1LPzri5FifB/mJK7XZHn9Q5MYrjhBaJ52S+Nwn
         +XUlLE5Ds/APFfWfY8grhzhHRxOQj8S3hA5b6JTNJm9eRfT2QElOMFzVMOX61GHOFlUx
         E4KA1YrMwAkz2fObu+RxK7eVTsJgJSBfLzeV3FWHcInHl9Q+OuN4SfNDC9JneV1xt0xK
         P/7w==
X-Gm-Message-State: AOJu0YxIrT3yC8YcjMblQLyu5wRwF/UWTY+f3rO6eCTIOQ9c3e+GDbXN
	iauy6BONsxRq80VnwDeGHXCTIrH89/9wfRg5HTWs98uptqwCvUPbwmmL
X-Gm-Gg: AR+sD10+l4hnURKjgC+Dv4sBK3dHgzm6M5Qed9D7G5fdluKq3B7oI8tuyHw+NKHmo7I
	502I0c0tFF2gyydyy3fK7YI5EqTbSCD1/fwlp1k0ng8ZWxja/ARFdq+L3B+pGt67O49rsGPDdBe
	m5nLMe/ZXvlliTL1vd/uRntM7os2VbHvoYT01W05C2pECJkXBh828jEkifZvkqeee26jLDnjSo/
	Qxy1WS0SzdUNBz7/RhgI4rmyAF2LNgoq5qUYYjdPaVPM+7UbOtL6g5xHDHMXypVHMSlE/hr1gTg
	PTWgYo8P7OEYdgl3rwKgB91VG06X/UtL/Vwat/cWfBB13nhTbTrLIdi/cYmelsdW3mJiRVwC3e5
	M2pMieZJCYv+hR0w12gXLzZ/o/kMcu0uFltxO7BJMcUCGHZbPYFJ7bpEm7hBUm6v5879HeQQrYP
	IoaqQ1pFP0ZpjWUTNTngkFbdspsz/Dmz/4JWgQdVC3OaDJKa6aRe8yQEsjkzcZ3mckcHygaZwPM
	o0rA5c1t6wUanW6wQ==
X-Received: by 2002:a17:903:3b85:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2d035d04ef6mr24968865ad.39.1785421320415;
        Thu, 30 Jul 2026 07:22:00 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c8b9aasm27770575ad.50.2026.07.30.07.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:21:59 -0700 (PDT)
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shaikh Kamaluddin <shaikhkamal2012@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] Documentation: media: fix spelling errors
Date: Thu, 30 Jul 2026 19:51:26 +0530
Message-ID: <20260730142126.11714-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two spelling errors reported by codespell: a misspelling of
"there" in vidioc-subdev-g-routing.rst and a misspelling of
"struct" in legacy_dvb_video.rst.

No functional change.

Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
---
v3: regenerate from a clean branch to drop the unrelated
    prerequisite-patch-id lines (Sakari)
v2: - use Documentation: subject prefix (Sakari)
    - use full name in From/Signed-off-by (Sakari)
    - reword commit message for the media CI spell check

 Documentation/userspace-api/media/dvb/legacy_dvb_video.rst      | 2 +-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
index b9fd5cadae24..71d044605315 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
@@ -344,7 +344,7 @@ Variables
 
     -  ..
 
-       -  :rspan:`5` ``stuct play``
+       -  :rspan:`5` ``struct play``
 
        -  :rspan:`4` ``__s32 speed``
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 6f66ca38589e..164cf0ad3593 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -67,7 +67,7 @@ subdevice routing table. This may be smaller or larger than the value of
 drivers may adjust the requested routing table.
 
 The kernel can return a ``num_routes`` value larger than ``len_routes`` from
-both ioctls. This indicates thare are more routes in the routing table than fits
+both ioctls. This indicates there are more routes in the routing table than fits
 the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
 with the first ``len_routes`` entries of the subdevice routing table. This is
 not considered to be an error, and the ioctl call succeeds. If the applications

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.43.0

