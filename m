Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C1632B9B6
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597735; cv=none; b=QIMCxL1wiEQbnbtf5CvxKmPoABZbxmDNjgDolJRtk9bBvebUMRYmyMA/IceYyx0DN3uxSIuybHLXucsrfOFhB7OIQqO7c1uFgY3dRlx61+9poAFbyCOUsJ9G9CvOXdag6ZiJQGg0GX89A4ui4tELjJzy4aq4oUr63tU/KFEf6so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597735; c=relaxed/simple;
	bh=8BGp63VTqroNrGGTNvpribfZrg3DW3F6V89kXnhOk4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASQm2hGMyH+MeL79e568uF39zSsJxXbijZT+hZ4UJdAWxg0Qj031FAFNXZkFRebzwh0s7p6K6DVac/uKXA/OjVe0zirRiH5/S7BRK0IKg3o/0nEWUackrkPxz0fBNv26B78YcjTSc6HsFrBzIPDcIq5WVH3D+QxXT+A2nAofdUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RinDeLme; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RinDeLme"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c27fc587ebso16675015ad.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781597734; x=1782202534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxo/WBxbGjKdlNvnmA+ZJR8yQhvPZe5NT2EMdY8AfPQ=;
        b=RinDeLmesXHc+3zG9TdJt3X8/Mhb6ZLzSvo6V9/9OGFad1Yi5fMTHDmKev+fv2WdLq
         qFp6cAiFNI/aiJgU9UClTfXslx3smBbd9dbTcBtS2kdv6fx1xgl/SDI+IVYFf3ndxovk
         vHA1llQQh+ipWdFnRkkmRIHGAVBrdYwWWS81ID+mc8MXfmC9POT3TixU8qySBSbHd2Iy
         4VXRVFf8MuPDy+hu/fmMYnOA1zTAkqdbNMuU61ncYohXVcHO3IC+6ChqX2ITo1qdt6hb
         BeiIV2JRo/Z99w7b3gj55NufCrxUuRT7kTrWd5I6qUFXvHNjI83sVd6xBBafdbvRwstl
         36NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597734; x=1782202534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxo/WBxbGjKdlNvnmA+ZJR8yQhvPZe5NT2EMdY8AfPQ=;
        b=Apeo7Wi4VquJo4S7uvI1lOCQ0Pvn5tPPOffVhn6xJ2pGTBRJrNcSHcD7ia/HmGY5m/
         iVl9k5HPA7hJYvMe36DCmd9H9F3ilSXjv4cIWfjCQftiK9J0snv4pLvlZRKEWhIgo0W3
         nBTwb+QbAf3aMmREp7dnsFJr+uv/i+oPc71AHu3n5760f41aUJBqi+0kPp/AiUeH7VE3
         A8pr2u4293EpbyyKoTYMnZZcpnW1huN8tyA9JhRXFdD/4FPgNWBQbSCleXaHTsrZG/BW
         FCySsr8nA2aRWeLP47XPkoQF4HHqimGZOimjj6rHrs0YbXFPt+Fe7mC4u9/sU3/KhzxF
         c3aA==
X-Forwarded-Encrypted: i=1; AFNElJ9s2WOk3ocqpo6QkEb4hCDvPv8KImsYdXAzifF5XmyaMQPtrDesQMlC1ZwPpnNs7hhbYAtO/zCIaZh8sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvWz7ntow7kKaawCpJYKd3q1h0d7cgYM/97a6ba59Iv1JAxIDi
	BjSQjYUk5nHv1AImXP6v9WXRlebjCQQFCDpyynyxukm22Hy83DZYDX3A
X-Gm-Gg: Acq92OEi1SMnAZHXQ4c7a2pz8SSDz8PLppOwm875KK6PAskfn08x0XIriDbg87BBmJP
	mMyVKDat4rCYKh8djGKRfI80F2knHU/YpK5ibscqgGkEvy79w8Z9YnxfwwE/RT8bYr9FzfhiftX
	RtvtjnJsJHfcQH8e/H34PLolTILs/ErBotwzPKFVdj9Z6LtyQ86dFIVygQl9pDn0vazNNakQroO
	buT1fl08fePp1VJ9slMJ+EqSiQffHTV9k98/iA1PuRuNbwU+fWwOKsx/TqPjNnaqOBQu5FVkdAp
	S3rHxtpNX0VTqSAbDlEv5aY32ps/8CQb9iyW4t47hhqX7tkNA1Bz9pQxSUQrD5t7HXEIsJLAKi4
	qGSx2aNfjzTVYF/GskQgnYzkriJkCdGXy9yarR+ax2D4SG+CjrVjTPlfIxmY14J2AMf0lDaK30+
	IGIYj65zLoP3YxoX9AeRYUpo3Hao7kmFuD9qWnThTfLt2L0swjQ9H1Ovt4DLlLX/Q=
X-Received: by 2002:a17:903:2a90:b0:2c2:50c7:58a4 with SMTP id d9443c01a7336-2c69a167225mr29058935ad.22.1781597734206;
        Tue, 16 Jun 2026 01:15:34 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c75c3sm119650765ad.27.2026.06.16.01.15.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 01:15:33 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 3/3] media: i2c: imx219: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Tue, 16 Jun 2026 13:45:17 +0530
Message-ID: <20260616081517.44685-4-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616081517.44685-1-birenpandya@gmail.com>
References: <20260616081517.44685-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in imx219_check_hwcfg().

This inherently guarantees that the endpoint node is released when it
goes out of scope. Consequently, the manual fwnode_handle_put() call
in the error_out label is no longer needed and has been removed.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/imx219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7da02ce5da15..d76eae880d73 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -14,6 +14,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1110,7 +1111,7 @@ static int imx219_identify_module(struct imx219 *imx219)
 
 static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 {
-	struct fwnode_handle *endpoint;
+	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
 	struct v4l2_fwnode_endpoint ep_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
@@ -1172,7 +1173,6 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 
 error_out:
 	v4l2_fwnode_endpoint_free(&ep_cfg);
-	fwnode_handle_put(endpoint);
 
 	return ret;
 }
-- 
2.50.1 (Apple Git-155)

