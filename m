Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A64F6485
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179781; cv=none; b=uJE6wcyiIFk1xI1RAoYLjidIkUcKMpLt/h1+j67r6QQMPQASdjFggZTg4ZUvrKTaKs3ZvgGUXzyofp+KyY0CMNeQEcrjWD14EYVJRfycMJTJXt3Q2Q+JDPCtVU5pt5D4bW+5aLENh25RpXGvo9tI9bYD45IUpbhs5XDZEUm2k1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179781; c=relaxed/simple;
	bh=b8GoUajCRwb9rZRbIIdBSuxPXV3lysEPgXkA5wCrXH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BpsyvFyRP1sJP9fZDonPcLD4M1YjjxWZDzfPEOUN/Mb6+aQDqsMjpYDvBMKm5WXSCNBA7XAb00g6TVfaXZrNgCbtM3zZYnswZ9S9yNoH4vaf5DCdJwH1xzjnGcVRIaz/0lPztySkaGql15GEugNyg94I9RfHBlqIde6xApuaMyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai; spf=pass smtp.mailfrom=getfieldwork.ai; dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b=VPsaBzyj; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b="VPsaBzyj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so9499505e9.3
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getfieldwork.ai; s=google; t=1790179777; x=1790784577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P4EdqqA4ozfcfNKKYMKih9kDVdA4+iGB2GWN5KjsS+o=;
        b=VPsaBzyjbR91Wl/rtL5hVBUKZIbWoC74mtKPBtr6XtyF1+YXudMp3auwqAx8obp7Jy
         0WcTjjRVm2TDMzyT/wRi9eJ8tji6SVLEJ3osGmrQYlSwPULZPT+tnrqknjvhZdNHqxrG
         raj01jxBA9pjP5KWSUwvpmIAvx8JZVg1WvcML8CcfPKbgkYQPwrs2qrEqUQ9g7um7QC5
         COxZDfXNsBhjAK7hhjhYyC9hFkqGJpUm2StE5r8xDMFQY0Gz4Ksr/b4LCRoCFWjkRdyG
         BqZ7xAJdOQoA18LNbaSMf4mtiwwJz6ZKAgf8Kvtrym0vVERZ4zvbgAOY5JJV3QQOvPmq
         JugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179777; x=1790784577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4EdqqA4ozfcfNKKYMKih9kDVdA4+iGB2GWN5KjsS+o=;
        b=KsX+mLLxTYvHmDAe+D9G/JVhbGq5MwzpVATFN9dSj1/j/GgW2qo/sJ8LbJkV1UqODw
         qc6rUpz1nr0FS+T6k6qUa+2kIMXCxIWnmfVPcdAv09+hQthoC5J+2gT7k9xyiAw2W38J
         8qJqSa86Uc3XDaa2dDtGv444n1xx4jZ8nZAJ04GBjdxxMqLg9pclq9ljJ+wPTZIhZm92
         WI2dTOHG+cvuTDxXLY62Yq2bOwq4q/5BOTt/9ZZMh6gSY8o0GycqnBXuxZVlFRxcJCrj
         MWHvi02uVygQKI/IFE7LTeyDXpycRBuBu661BpEf1tHu+JRkjIqJuE60THRKuqoDQrzp
         dCpw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ1KlM3GrMspGlu8cYw+VamUfp0qIYJ40hf1YM8IPUv7xE8zj+l2m/4jAN4/IARS/MkTsVvPFD45Uppw==@vger.kernel.org
X-Gm-Message-State: AFuF++nG6BV3xtQ3dCemyfFpA525n1cDKiBDzhQdx2cwbRNREWZ9wRyw
	Z7nXqeDtOnenSqZJpJH0hHFZaddKwFSyxxRSPm7ALH6+P7Tg/xIAuVvxQnCSLAWs3nbT
X-Gm-Gg: AYBFou1pXD8RUeC3np7XD4BzEzIWRhKs3VyIQGcB1wB1gBsU+sI+MHNrkF+G7QSxvD6
	ylqAfCyC/NHV8tpFn+5HFyxQ3G6ErHag0cNWWcQ1UwNqYKlPVkntYBrjTKd1o0ktErTAR1fnJ8K
	o6cYPjKd0bLQIJQbVTnlsqGaUBJSrA8pzp5PtlCeen3ZCymxQAVWoUbAxjvDjNHsaiQCqz+q9nM
	XbyPvd9mgdC/AT7qjODZfi/BVSDdc3sYf/ACne9JR2n6xtG7OeckrZo6eKBuqVb14mj4F4E9/YO
	JF3YtplcWxO7hkJNQVHzWp8LI2nq1nXWTU41yHayJjUGJEis8LDxEkLbb+m9d0JqELSebYrqJsC
	g9Gn6AcIMmivjyxqU2vYzazYHqO91YyXHgS0PS4VJy5HE/+zLkeU1DbjSwac03xEuOM4QXW3pAl
	3qEuoAN4+kTossIuupkswZYaK9On2bn+TNx2OK6FOi3lQ+4zPURFlAMALdbbkXaWiMPnHSLhNcv
	cuPpEb2jOdeSubEoekThcV2tnlpXx+OKCj/K55E8ygHT9cIz9pcFzG3YVWxORDa+H+YmvP3ZAz+
	AwDjQS8uKlyid/CSsjg7dq7DvmU2llbdxUVZHYsHByyv+UN0F2WWH75lO3U=
X-Received: by 2002:a05:600c:474a:b0:49e:7c83:4733 with SMTP id 5b1f17b1804b1-49fdf25339emr44310815e9.32.1790179777452;
        Wed, 23 Sep 2026 09:09:37 -0700 (PDT)
Received: from NicksFWMBP.taile41d51.ts.net ([2a00:23c8:b064:8301:d1bc:6ea7:7a71:d69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm82865825e9.8.2026.09.23.09.09.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 09:09:36 -0700 (PDT)
From: Nick Rogers <nick@getfieldwork.ai>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Brian Daniels <briandaniels@google.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-ioctl: zero the ext control built for VIDIOC_{G,S}_CTRL
Date: Wed, 23 Sep 2026 17:09:36 +0100
Message-ID: <20260923160936.33445-1-nick@getfieldwork.ai>
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

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
---
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

