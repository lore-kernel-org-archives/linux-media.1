Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F24630BB9B
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601926; cv=none; b=ZC0dmAQfhM0CAPUssnxzHDNenMMDXf/dnlt4ohUswerJQb3PGJPdVHaIat5A5KMklPVK06UuAeqov9q6ZsNz+KHQD8wSdicz7mERKfXjAqWRvqKQq0MTCbhwj9THjGk9kBxrytTiejDeyp0cTm9q8jfEvgdCXshjGH2YGxoshXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601926; c=relaxed/simple;
	bh=Fi3+Edj1vCwPdfBKcJ9NF6yrRuHhIar24v5OJ2pIEps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+iLYS0DcdpadLORmtqowq2nzjpvcYYzd16yI6TjzfmJgkRKTDav4S1NHEXwwh8jHr57CiMBdovz23Z04US2JhK0vYd6chLjyWmmKE0s3HYxll2mmZJyk4TT376kfo6vZ9TGczkEZc09YcywyGgsBW8KgBQ7RR73GqufYCAKXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F26snVv9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F26snVv9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c168baac83so19604595ad.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 02:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781601923; x=1782206723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQDYhPlQvRFUX7M9coPWTPJbINbAS+sfJCZWJojAKpg=;
        b=F26snVv9lHGbICJVASyKi3sEmMVfcbIJTShUdJta6a++KO70PTHzocwXWLWkD6cBa7
         2mecc5H9Ne5u3IjPqAQfmc7/F+ho5ZHvxxC1UjJpq68QUIEmyXUmkA0TjbIeY6BwhWiJ
         MmRJYfiVS/AqlCltYy0rbXjgyzbFQSWQoYjBveqIpi9HrATbcL8f2DzEQcHASaERzfoA
         bkXmhJDv8gGyoHHyE7HRi/CmIGTgD45gLq2y6fLhYbvnMEkQ3CekcXsW5iSXXO/EJPXv
         mzVKVXGh1dz4VNkP6Dkyi2AyC1hJi5ZiPe6l5/l2fhhot9d6N68Qiiixmns4YtC+BcAb
         LbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601923; x=1782206723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQDYhPlQvRFUX7M9coPWTPJbINbAS+sfJCZWJojAKpg=;
        b=AWKTiVXvWzekMc7ZuurQDcxaE6v0q9ROGB0XdFM0tlZOfqVLPVIL/Z5GNxVopFBxVw
         N5oyxTHhX7FncRHn6PPktobZHqxEd8KqXQ4WLk9wWzRo0DbH23UbyYsJklBWyS8JyIVH
         vx5pM1RkD+9amfoWOl/7f7UpFwBEK5KnUz5lL74gbVpqyTp1ZlFmhJjAbBxKolxIQ+8A
         256kfdOOAoHnmTeAE9SOcT8NPBo79M6rvsU8XWIDPMmNAVpVEUScfbsWr/qherdhhcj6
         tyfBZHoi4sTJXvSbC88XOU3ne7Snx9KK8EsXOuqWieKvHTD9SNhDeQ5aO3n63c/lVu4g
         79aA==
X-Forwarded-Encrypted: i=1; AFNElJ8N5wKAIiz1YPARNDZerNQU/BUUk/zL30B5Ac4vLKOTf1nAAIQmFKl5998hWrK7j+LveSmOf6qhPVd+jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeyjvOZLTHAX8l7xJtpsMRKj4zkSDeWuDt6nMz2BbsflITha8F
	46A+vJ+bAdact5zxYqkc41LtUVOFGVmiBqsNeIWKbJBQgQblsjkieqX9
X-Gm-Gg: Acq92OGewCA7tc6FFIlT8MbN0lzPDOR85Ztoh5J74AuLdEojPLs7EzswPdjlOQIb4pk
	QKEXtHTroPJpNCCWga+lENmVgnYezpd9vpFUU1MLisL8fpPopxAwgyW0IdrUflOauNmP6hzBffS
	b1cpVodz26EoAV1alarZSiKlb9BRAfJe/R6E2mWvaspB/hIRJk5nxXhC3FCaTz+DzuCRocyocC0
	7L3XMkQbRbH+2pooUAAs7esEzloxnZ0aV71ORkQRvNi7L+67OM69uGlb4gJNOTSl7uhAOcXwPRJ
	oEexh5ssjdszUHz2+vu5Sa42Vk9PEw+wDd2u7ouWHp+3TqXXObeGDyxohSv9KkH0s3d6hR0ZuMG
	Klvt3Nv+oBOBsQs07fU75FFGUAkA7V4fUVU89eJGFKZfQyxiueaJRPzAxOQ7bXfp/XtVAo1p++Y
	9cfKPAZYLZW1DxeAMnQD9PpYCNNwqSKrASnoXkjkplMNSv7GqKAugR
X-Received: by 2002:a17:902:ce03:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6a99a5426mr3485315ad.7.1781601922802;
        Tue, 16 Jun 2026 02:25:22 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6aa228f8fsm1618825ad.24.2026.06.16.02.25.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 02:25:22 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH] media: v4l2-core: Fix Use-After-Free in v4l2_subdev_get_fwnode_pad_1_to_1
Date: Tue, 16 Jun 2026 14:55:16 +0530
Message-ID: <20260616092516.46339-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_subdev_get_fwnode_pad_1_to_1() drops the fwnode reference via
fwnode_handle_put() before passing it to device_match_fwnode(). This
creates a Use-After-Free vulnerability. If the freed memory is instantly
reallocated by SLUB, the pointer comparison could accidentally match
the wrong pad or trigger a KASAN panic.

Fix this by using the __free(fwnode_handle) scoped guard. This safely
binds the fwnode lifecycle to the function scope, holding the reference
during the match and releasing it automatically upon return.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8..e6b133ef7850 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -7,7 +7,7 @@
  * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  *	    Sakari Ailus <sakari.ailus@iki.fi>
  */
-
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/ioctl.h>
 #include <linux/leds.h>
@@ -1243,7 +1243,7 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 				      struct fwnode_endpoint *endpoint)
 {
-	struct fwnode_handle *fwnode;
+	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
 	struct v4l2_subdev *sd;
 
 	if (!is_media_entity_v4l2_subdev(entity))
@@ -1252,7 +1252,6 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 	sd = media_entity_to_v4l2_subdev(entity);
 
 	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
-	fwnode_handle_put(fwnode);
 
 	if (device_match_fwnode(sd->dev, fwnode))
 		return endpoint->port;

-- 
2.50.1 (Apple Git-155)

