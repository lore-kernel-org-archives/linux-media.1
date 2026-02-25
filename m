Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF38F35BDBB
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020860; cv=none; b=EHPO5EruLsKRql9rjdVIcOxQHHjy57OU0PM+95JqpAcoVgH7eKgXuAcT4ZaSqnbsxBoVpFO+sXBzPh/MH2GWR2Zo9m/3HxQJMASywbv5qBMGeM/V/nxgEUi9HOM/DryQc4ONnUCahoZPknCeA54FcIBpRHTOEizy0RDUSDsL9xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020860; c=relaxed/simple;
	bh=m7LiiBNck6GlBg+KwuXzA8YMGw7I2PdXgrTk7oT+qWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GgOMN8nAuTm2Ru5AJKPpSrBXq2yppDJLdBR8arAo/C1Ut9GZ75+LeCI/3ZEaeTf5w9HqBoRUFEYQLS5MJ2k9adTlF+9sdPP4Vd4koIfGniO31HZxdJq/d3znT3LhQbSqNdQRx7rSs9f1r52tYNp5a28ZClc54n56/b+XqyJf2qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0P4qPzi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0P4qPzi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48378136adcso39636315e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 04:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772020857; x=1772625657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bHl7/z9CiN5Y0GbWmCMlQk8ltpG+PRfIFng1ojO696Q=;
        b=a0P4qPziBupy9BKHZX0nEfXeqGnJBzRS7n6ZbPSq368tHUvfusW2k0lsJqGn2drkkV
         VSRmGzfYMQMB/QI5CKSIE8i0CnFftr6f5FfoyKi1Vog4Wbs2TTQwknwMRmMyXdUN35O3
         /om59j4rO7mj/QyOpZjZ6B+/KDevt0w8WXJfXP25qqXsjld5fE9WuxeMKaQbHFk78Y3S
         i8wWAhckET2ZrQAStjRw9AJeXd7GWBsmE38EQLEPIQMyRwCw3PCeJ1L0htmGt2RK1LCl
         /pg9MhOgAIx/dyizcqX9R5RLiOMsMX3f2jWOWxj0sdali+OjSMxCEAAPyRpG3dvbVSd3
         SYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772020857; x=1772625657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHl7/z9CiN5Y0GbWmCMlQk8ltpG+PRfIFng1ojO696Q=;
        b=R2AhLSGjV9uS8DW8jXbbbGWKM30b/9n/Ypx7oe8VgnBjeaCTOYzWUp11fWI7U+LHU6
         FxujUWgpVr7JrN8GQGu4aIDXh6B7gmYEhSpXMSyohbZufcVnBZx5E8RCoXSf9kc2nJd1
         r4iiersQF2q8pAKrLVJuyCMVvw0oomEuq6KO53aalAb7aXuyJedrT/+/c1BHNLkI/d+w
         vmP9TC9ESa8zdnOtcZeEnTxbfRCT4tAEf2TxlqAeHQlM4VDVJwQVSfQjbWfgXU3MjXxO
         oNe5sm6zAjFjfKUWCd44ZMAMrODWRtZEaYSxeyGb5LtkX7oJB5YJbNw2ZcxwkH0qh1Ui
         da9A==
X-Gm-Message-State: AOJu0Yx89uq2gqT7aVQAHbWhjvn/IXWSASkbfUY8RSNq8V/uMEkW+94r
	0mJWSDjYhImviQOrFkL7m0IPxEgT6stefO1Q2XeIZbDITh2PNuzeP93a5SiYE9bh
X-Gm-Gg: ATEYQzy4JOolwsKuyfrNOx29xbWcQMMJTm+DxmaJj4yXNdYKXxLS9LnVswzXCtodIHz
	gc+nZ0Jbv4LtbDjPm3CyOAHmvZnH+Lxzto1IhRW2ZP9r9Mmew1qMctYBvR7mPpFRrx5qbahZ+dH
	XdHV/AAeIltV/JoAhIvhAeurl/lNQ0Iy/kuIODd6YCwc1tVaYL8jcnmnkRDIe4E8vuijyAtd6IJ
	ORqqgD9NTVfvJZVyzFgyZ6dMk5Fol+oR/ZVkFxSUo02v0C4+bV1Fmk7g8NHqHzS5GvGyAaBPCcj
	25FDJ73QUMo0LtpFq/PaccfY1tfEoNxyn0HbkgryQ6JJlg4YK7L3mgy76iMBCzOIjgvEmq4rfYq
	2mqoSIe7dwiqcrFl9Jjhh6DrEQMH8cv1oUQfjuy6LCb0XYmTVRO/7j+c0JxiqiXMltpGK8Jl0BQ
	96ilO88+8fXWPVcVO8ZkSH+eW9ULws2e8JFpzqxO1L3xDhKCz4
X-Received: by 2002:a05:600c:3589:b0:483:129e:b573 with SMTP id 5b1f17b1804b1-483c219eb09mr1971225e9.18.1772020852382;
        Wed, 25 Feb 2026 04:00:52 -0800 (PST)
Received: from localhost ([195.60.235.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77abdsm10379985e9.2.2026.02.25.04.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 04:00:51 -0800 (PST)
From: yehudis9982 <y0533159982@gmail.com>
To: linux-media@vger.kernel.org
Cc: yehudis9982 <y0533159982@gmail.com>
Subject: [PATCH v4l-utils] v4l2-tracer: trace: serialize all mplane planes
Date: Wed, 25 Feb 2026 14:00:48 +0200
Message-ID: <20260225120048.156888-1-y0533159982@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For V4L2_BUF_TYPE_*_MPLANE buffers, trace_v4l2_buffer() only serialized the first plane.
Serialize all planes by iterating over buf->length and appending each entry to m.planes in the JSON trace output.

Signed-off-by: yehudis9982 <y0533159982@gmail.com>
---
 utils/v4l2-tracer/trace.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index 996fb043..8e9039ef 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -252,8 +252,8 @@ void trace_v4l2_buffer(void *arg, json_object *ioctl_args)
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		json_object *planes_obj = json_object_new_array();
-		/* TODO add planes > 0 */
-		json_object_array_add(planes_obj, trace_v4l2_plane(buf->m.planes, buf->memory));
+		for (__u32 i = 0; i < buf->length; i++)
+			json_object_array_add(planes_obj, trace_v4l2_plane(&buf->m.planes[i], buf->memory));
 		json_object_object_add(m_obj, "planes", planes_obj);
 	}
 
-- 
2.43.0

