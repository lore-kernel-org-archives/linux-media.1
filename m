Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0045A288
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323331; cv=none; b=FXkIpVLs5I6JglqdRNHsyBH2AQoxTLLPiOBSmmZgz1PEcuU0BQ+7CMPvmsalFV8uUKx1cPmgkr8tPfPK3X7ieYGGlox9Xqnqvr+Q3tKusxz9MniGwM9XBNppjoInYM9tZwhGlc/QJ7MGHsZRS6hvMVwjfrrB97PyGJViFPbqPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323331; c=relaxed/simple;
	bh=WWYcUNJqox0U4MneodFrpvz+JDQJnUUz8xHqfDsf7X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AAs4QHSSNdZzwGaUxK2sGbajM1e7U/zTwDrUnafkHcd/4+qy5+YGZ8vBMwdftco4q4s25LPNLZSbOzXtK80eHiN1ycs9c8/ECXIz5YuYkH3T8+JuV5RaEdlefpiNc981AhwuJDRQlr1cneYR6Y1sT3AlGACSmL9w5raAiMcqqik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai; spf=pass smtp.mailfrom=getfieldwork.ai; dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b=cI433JoJ; arc=none smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b="cI433JoJ"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so1038995a12.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getfieldwork.ai; s=google; t=1790323328; x=1790928128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWUFrLrjIfZH390SkU8d8eTbrSmOGFmG2O8pFJmGvCI=;
        b=cI433JoJ063n8rIep6SRB/Q5pXsQ49noUfRPBZbRUlcy2Sxbmwbz7gCoUmhmdjrWzJ
         ROeNXF7S4zLIlyEejs4JvH4RX3AznerMj+0s2Zn/pk9ITxiZsK8noU/ZlmzlDxFVngAt
         MQRUzcJ6ahlyVfS7FokCMhtFEK14GHm4/xOHNiGX3zH5LLy8xW76oV568j30wdXh4iGE
         b0aOOIW7+z0kwCt7RDwQfrF9GspuOI5Z/zxQ3DF/4nntlc72LziU9JfaKz1ZXjp4zrU8
         +YXqAThyO6M5+J7xBBH92b0yQI2G14lQYpkvBpknD+cpH/VDnFkKmLwqq0c758LOlfdH
         lEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323328; x=1790928128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWUFrLrjIfZH390SkU8d8eTbrSmOGFmG2O8pFJmGvCI=;
        b=wXkT2SXtUniWWEKNSecJo8Uwqb6vqcGWXMfSr7+FQDPpdE0zISeOIlF/3+KWeVQW/q
         3mWQfE0W4UMjg2WYd/sF10ZLu721kV14l8hjGYi2WNvcntWYryaZLKNPBg/aSI+NiWwz
         lTJp4nnFRrxF5JdNtsHQACo2m7F3Edvmr9JTExIPnx8y9E3H4OYumv7k64r4bPgpURy0
         wxelKd3u4j4ES6yaIw7cNJaSlrOcbfetv9Bed2ZW6pdobPfmn8r51sbLqR4//JPTBW1L
         wHNLflfogpGQByciAKvxXVK2Ht+TFa7b+7bOpcPEeN2opuakBraB18xLi1UNjhcS7mQ/
         b6zw==
X-Forwarded-Encrypted: i=1; AKwUvBzejZKvc3BbB7NFOaDiJnUUC636sXr4SUaNBJBk3qieF8GZMV4S3ev9E+cxBL3pcYQ9c7UXIoWajYTPfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mJ6iGqFqhSwxEQNBelh8MwXU9QNv8wB+uPO0cnutkG6iKUTwsl
	HUyWxwpsZzENVxk/wWcHZ16BGVwDw1Xaa7lJunWRfwOTnK+jo7qiisv7YW/j9IePuZOg
X-Gm-Gg: AYBFou07v/zsClnnfzLIP9r71HW877k/Cf0A2j/Ixaj5TSW1uXJp9WDoweZ7+Zlatxj
	VBe8CHCbbt4vfNai8iQ5hayXreuxudhYNDO/KqWkHN/sy8HQ4Gk+bhqhOZQzQBEzMXlYBEd2gcC
	ZYJdAoJzZBSfLoxeE8tUp4S/0/zyKtzEIHpiKjTPGTUfaSNpvvnyQG2kxP4ACB1/XTn6riCVijt
	rmZqgDcFgykktL6TBBj87XoJnY6dItbXJoujNB26ER86VS82W42ob+13MJcxATxSBg1i1PktGMT
	0UqYCdfJLmDf0GSIYrHGO4QKAcTCiWJ8Fq95F5qPCw7gWqVNit+6j5Mclz6GQYFXE3Ewk2a4wn7
	6OTWqFb+cq1w3sET8yo5eFd5dyqRyUZCxSVge/TSEyFin09I+eYQjQKzRMXFh6mP+LDypv1kO67
	zE/MNmpfJEQSAxxtGiC7DvIWpG71x3CpBSO+vWI0igTktbPGZaH9WtcxbiskgEG7XpZfb25+Zlp
	AZLWsbZjtNur2V+4SdLNrqRy6HOnyLQ087WvXjsLNF+/6sMPNTfnP4h42bTqJzpMAuyqMFK8O+V
	59fARe/ITaWoZ9GxoJSoXVssTT+TZzAOAyVAbjbx0M967tADkvL8bbcGbXI=
X-Received: by 2002:a05:6402:52c1:b0:6a9:cd42:eeae with SMTP id 4fb4d7f45d1cf-6aac8f12c11mr3913364a12.15.1790323327627;
        Fri, 25 Sep 2026 01:02:07 -0700 (PDT)
Received: from NicksFWMBP.taile41d51.ts.net ([2a00:23c8:b064:8301:e401:b461:4e5:786c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm4912115f8f.32.2026.09.25.01.02.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 01:02:07 -0700 (PDT)
From: Nick Rogers <nick@getfieldwork.ai>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Brian Daniels <briandaniels@google.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: v4l2-ioctl: zero the ext control built for VIDIOC_{G,S}_CTRL
Date: Fri, 25 Sep 2026 09:02:06 +0100
Message-ID: <20260925080206.45261-1-nick@getfieldwork.ai>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a driver implements the extended control ioctls but has no control
handler, v4l_g_ctrl() and v4l_s_ctrl() pass VIDIOC_G_CTRL and
VIDIOC_S_CTRL on as a single struct v4l2_ext_control built on the stack.
Only its id and value are set, and check_ext_ctrls() clears reserved[0]
and reserved2[0]; the control's size and the rest of both structures are
left uninitialized.

A driver that forwards the controls rather than handling them through
the control framework sees that stack garbage. The virtio-media driver
under review takes a nonzero size as a payload to copy from userspace,
so VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL through it whenever
the stack is dirty. GStreamer's V4L2 encoders set their profile with
VIDIOC_S_CTRL, and cannot negotiate against such a device.

Zero-initialize both structures.

Assisted-by: LLM
Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes in v2:
- Assisted-by: LLM, per Documentation/process/coding-assistants.rst
  (Alexandre)
- Collected Nicolas's Reviewed-by

v1: https://lore.kernel.org/all/20260923160936.33445-1-nick@getfieldwork.ai/

Alexandre asked whether drivers should fill the structure themselves.
The core builds it and passes it down, and a driver can't tell a
translated G_CTRL/S_CTRL from a real extended control call, so I think
it's the core's to zero. He's right that virtio-media will meet kernels
without this, though, so the driver now guards against it too:
https://lore.kernel.org/all/20260925080140.44696-1-nick@getfieldwork.ai/

Found running the virtio-media v9 series [1] in a VMM with a host-side
stateful encoder: GStreamer's v4l2h264enc fails to negotiate because
VIDIOC_S_CTRL returns -EINVAL. Tested on 6.18 with that series applied:
VIDIOC_G_CTRL and VIDIOC_S_CTRL now reach the device intact, and
v4l2-compliance 1.30.1 reports the same results with and without this
patch. Build-tested on media.git next (arm64, W=1, no new warnings).

[1] https://lore.kernel.org/all/20260917171921.2810550-1-briandaniels@google.com/

 drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae70..b7d248ab7 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2357,8 +2357,8 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
-	struct v4l2_ext_controls ctrls;
-	struct v4l2_ext_control ctrl;
+	struct v4l2_ext_controls ctrls = {};
+	struct v4l2_ext_control ctrl = {};
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_g_ctrl(vfh->ctrl_handler, p);
@@ -2388,8 +2388,8 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
-	struct v4l2_ext_controls ctrls;
-	struct v4l2_ext_control ctrl;
+	struct v4l2_ext_controls ctrls = {};
+	struct v4l2_ext_control ctrl = {};
 	int ret;
 
 	if (vfh && vfh->ctrl_handler)
-- 
2.54.0 (Apple Git-157)

