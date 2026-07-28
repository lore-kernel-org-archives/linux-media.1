Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F041C2F2
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230677; cv=none; b=Q69b+hUrnktkohVA9Awtml1c/q6PgvQ99uYzpq/xHybT85pozVruvNR/6H5BnY8JaQ+tGn/4eAGId3LkZ7xMYxyJwNxlYVYZkE2/Qt3jlLtc5LnCMhH2aGr/YuP/8TKy6+QvqLXCqha+GXdMthWjs81moGyjmaEa0p5hpQJsoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230677; c=relaxed/simple;
	bh=x4EfWP9lpPGABSNYkiBqcMZxBLj2mqJhtQnxiC7693s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kf+c95TRT50Q+zN+OmNhUPkkyOH3B4ZPWQ+5A/MBy3xQbyoJhu2k/TFK8GWU6YXpeSfm278F0GudTgC4A0zYm3Z/u5TnnhJDUlKqGKvAhDf/DqdxuHQccYLtcw4waTvNuNXsDW1VXXByU4R+Cj/CdfN5L7VB/vlxZqWbGAxYQig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jecgP6af; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jecgP6af"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so26775075e9.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785230674; x=1785835474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MU0kB3tzcL3BcIvbRsjvopfqP7S9hljDqDjRn4DR50I=;
        b=jecgP6af/u1p5YR5mFutb7goA6nUViQ09L+qU/ddzWiyN7qV53CTVt/kwF2fsQOJbr
         /w2RnSyYP1F8Xbp+Z6F94l5PTe/2PX/bhuKehFPLfp4npSWg5RJ6oiWAg7dQkri7E8t3
         dPBJHlsX5kyxnoWF6rxo5YvU5rfnN9NpeVblqoLRhUniwwwnir5ylW6HEml7cU2hR258
         81NGZVq7u+EoZPIrkmyIChsP2NoxgDm0EWfNgDIQX1DxdUxS4t93KDKSmtN5v3Wx2Zuc
         OzAQdJokbWfuwg7mh+MHG2CQv8PXsBa6FjM0K6kglEAgJvzCFrmL7HgnlgXCHZB2mJxk
         kiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230674; x=1785835474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MU0kB3tzcL3BcIvbRsjvopfqP7S9hljDqDjRn4DR50I=;
        b=JTcrwu8yblMIB4LR5sgDEIvFRaZKfiqrqQTE5gMlR3c2fKrcylxroE5yi0RtVRUprB
         L44zxS6rvrUNXtj/vFDZhaf7x2O/3IwDc38MViPxLVptr9lC4QJqUcbWkQMEB6/Xmbdm
         UCxgm9WzuH0va4fwwDc9ZSVaJ3MtGZrFdoUSCJg6m9dkvMfkT57663HsWCb6eFV1J8EB
         +tpNxQ4iTdJ8u4DVvNZjQTlrZ237a5374rvvyux52FcDGJ8jV4S7zCs39tgYCysnUG4E
         zK9LqSGwCo3bjgir8rf9fC5h3PQGwzOpQkRuOXqzkLk8L0NlZ5DJdFji8I/mhgc0BOA0
         jfzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgHfnaOiIj+8ANfSzQfpM7hLjHEmrDR5Ti6MDFqtlsOXunp1F5EkR/g5LAdJaxjKDicAWtAg7Y3kjKlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5bZBxSCnwBQK7OtMHfm5lWr2bXHOpRGehyyom6IXmU0bKUbMd
	hVYtvD8T3P7ArgFRYL6XIcAajgk70pHkFWXBzrVhCFKnSqDyYjGmwg9Tp6TANg==
X-Gm-Gg: AR+sD12Kiixsh4LKs/vJU19SS6Hrs9JzEs2xjaJvnDE1sirgKC185DnHQmUNtiJXeSc
	+cCXv/bw2YQlC4owqnqH8VqF80OMVCrGc4qNttOeUoAqZwXumdJgqs5YplgBu0SeL/IvhGoAVs9
	AbSulr8yT44Q1xFOczwl1MR3I2eHfkdOV1CtWDod3Jqg6VI2Ls6e5vzTks4Nu6YusEx/mnrWZhB
	IOQRbtzZB6ph21RtMCeIpgQLdJrlI4gmaNyDGG1v8xh2LPpZZzy0yclrL+4LJGUBb+4z1N64iTj
	ThCWHy9O9J8eZOk0gM0A95qcSDnYyUYTftwp7v07hDO0vLYkbwMoaWwOMc+Gxw4a65cMBN6gk4l
	lNSNzEyIiJf/h/LQRZEqNbaqyRsqAQ80QVjQgzPpndD33GJAqqKN6Xl1VD2cCwpfakf9MzBBb3o
	eeJ8fOi4VNSkri9VBmQ3neE4+eqw5fm9AIErOQdUob3ROVdsSqp8gzNijqAT9elg==
X-Received: by 2002:a05:600c:4ecb:b0:495:443b:1bbb with SMTP id 5b1f17b1804b1-496c656ca2emr15166545e9.25.1785230673624;
        Tue, 28 Jul 2026 02:24:33 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm267739645e9.4.2026.07.28.02.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:24:32 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: i2c: imx471: Fix uninitialized error value in imx471_set_ctrl()
Date: Tue, 28 Jul 2026 10:24:30 +0100
Message-ID: <20260728092430.12491-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724041417.9921-1-devnexen@gmail.com>
References: <20260724041417.9921-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exposure and vertical blanking writes pass the address of the local
ret variable to cci_write() as its error pointer, but there is no earlier
error to propagate: each case is a single standalone write, like the other
controls in the same switch that already pass NULL. In the exposure case
ret is still uninitialized, so a non-zero stack value makes cci_write()
return early without programming the register, and the control write
reports a bogus status. The vertical blanking case is benign today because
ret is zero there, but the construct is equally wrong.

Pass NULL as the error pointer in both cases.

Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor driver")
Suggested-by: Kate Hsuan <hpa@redhat.com>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Changes in v2:
- Fix the root cause by passing NULL as the cci_write() error pointer for
  the exposure and vertical blanking writes, instead of initializing ret
  to zero (Kate Hsuan).

v1: https://lore.kernel.org/linux-media/20260724041417.9921-1-devnexen@gmail.com/

 drivers/media/i2c/imx471.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 6d358b11e96d..4053aed84340 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -334,12 +334,12 @@ static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
-				ctrl->val, &ret);
+				ctrl->val, NULL);
 		break;
 	case V4L2_CID_VBLANK:
 		/* Update FLL that meets expected vertical blanking */
 		ret = cci_write(sensor->regmap, IMX471_REG_FLL,
-				format->height + ctrl->val, &ret);
+				format->height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN,
-- 
2.53.0

