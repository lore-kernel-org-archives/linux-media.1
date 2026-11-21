Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233359;
	b=iTqNXiaImtAMnif6KCjW+jeyh3AzIqxii6bTSnAq7VG4vZET6B0Nqjxa0NbfkzHWy9ib
	 JOfP0OhEOiEeIFyh2CDg4+colQIwxlwqNREqdRtmd5/6Ka1/oxct+SHxxJeLZLKIXePBO
	 uOmMwT6c0pw3Ge8wi+hEivwb4vl1qZReeKet7oDD6CUYjMpboCb8SP5Zm28ry9N2lnNio
	 SfLPe6LjPhUGeyHtYhV9i5oQyjDT0MDgm/I3Hv9z7YpphTGCj1kxohE7AgnGOftX6Sxe1
	 vqLB0BA3Dd/5ngU0aBowR2duQ9ioFAu5FR4v/MJ7PTF5jnsAeJ/7JeLimF47CLYrdUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
	b=TYmeAdTKUaUXvZg1beziI0goBSrB+o2+oHQ6Dx4+gkVdsbBwWfNykeFBx1dw8W395mqg
	 fsBbjyKYHZvRfYhy6TlbFa/AFv9nfkuIPF33Sfi6tNedp3LYANkCMg92mLmvU7LrSAR8j
	 2bfysSTnKZMOWNIty5OuzzoJKZC1r1RXsCbFPaI5lCiAPU51JMZzPhw/eiAe1DemJZs3y
	 ilX0RUoDTH6Uthw2AA0c9m4JwNKsHloYv/Y0rJF0o5U4bVD3Kazv5JdiHR/CdTje7ac+H
	 VKUITKNi9BC5/RaoPv5n9UF2NRX4jPx3S9SlrryO0pFvuGdFGHIjsWX74wiSZtdwLeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W7/r/Wjv";
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18E60A2618
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D18E60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7/r/Wjv
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-717080a2d50so1455238eaf.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233348; x=1795838148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
        b=W7/r/Wjv56raxiWAGvFLwcwL9omFwPYkw8pdRgz3zyIPHpaNXJhNycB6BZyrpWa3Oa
         P8w/NXnVnc0okfD9WwEgF+wXDlZi4Sr4yp43lZMQHkRWnRkjxCkNAshXqZCzVzbxEo4r
         W2bx78Ec0gWNwUmfjUptsizWqOv9ijsvRZfDp5d94KQFubfixi4tvJKpnZIV6tRE3RY6
         uvdEK8lD1fJWQnK2zUl4ZQZ8xwxeVmjDgDuD/spX8IZMpMcTDtXZXhsOUq/he+Sd3HIO
         0s9eS829kVGj0cKytSOMN1dw0SywVdWSu+b/iiWbDqvJWJNNQ6917r8fWC9KAwq4vPwf
         SJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233348; x=1795838148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
        b=KUQneEFkSpGUmoNHrFr2YAA64rPOQzpeHfO4Rid9kHEO+BraXGdjjsZ/RSYoKz1TGW
         L1wSRYExu3nOs53vmKo+tRTfTMATW3N3poNrUQdExad7z0u1XmqJJ4cFrV8tjv9ac+6Z
         9TB2Fh3nMtOT0uoJ5MMJFVmF79zwThAgiy2C5lW8f2UxsOS19w7T+k6qxK1IkSzM7gPc
         uJ21IQGKU+7zwe0cIoYEsd1vIdjXWisdRQTPn8G064k87nxblk1Hdu8SgSWtNSb2u/Ln
         k750pbmwdyMtDiGVG+3N6ZytSnEWhhNzcHh3aMnn0my7tllSOQ6QJa4GMdLV91VfuWpc
         Rq5Q==
X-Forwarded-Encrypted: i=1; AL+hErGrzS0bk7nCRYgAc1RlFu/ktRI26DIL7YKVH/ekPbaykSU6Zf46ik1Zf7gWDS9T7+sKPqUcGkQItqcW4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fdk4HWP24p5HMGxr7D18xcJknZkAlWD7I2mt+YYOtNIJjIaQl
	LQy+iTpoj13fJSN/4ReRA/IxkWnriItAEfR81GQZRhmb3LTBjYxWLWY=
X-Gm-Gg: AYBFou1Wi1rhhsBrqpvG/sOBcaqVnTFS2lrZ81q/nWcfib1sG03jZEFz4T8tN6kJkdF
	rWymEQHlR2OzN91qcHr3ViXWVmjipZ63oN+smAZqanz5uX3cqu8OyfT9+uthR1lWYwDxmLRISc8
	fdPr3xxaB8O0FOot7dcKd4O2gEKpIUuSJz6glbvJC6MWew4SDuER7i/hGZiOuRJUJgOSLDAj0S9
	h0UvbLm0mGBf99IIBCw2MNf41XznQCmXVL1QnVe5tMNVcsGbwlqnvgAeAQOyUnkrXdZ4tBPnbi7
	btwR4k0LxATdgfllbEz9tGev+0f+9rAKN0LMCXOd4bQBRCD7uvTDRHq8MLryC5KbkCXBvaKOvGD
	vN195KbwkpzkqoTyHPfIehJ08cIqinVbbhNCFgTwgSQc31JbEKE72wetscodUImIBrnpSwnvJsC
	XsjoKAnVWkcKAdra5VjPC51Fj6fzV/Vz1b2D0qJxaPIldZuppwxve/Ct7rUIia9FqXOPhBAbL58
	KlkeAUyEOzXxGooSLANoZyRDYkwE2xG74zsPvIlU3ZGgzsjWSzq4j35F/iBSojUxfPGX13QUjZX
	JYN4bN2jTQR4tOmIzTyBsBYPwwj7PcGhOUZaw8wS425D6MLVSW7keOe1
X-Received: by 2002:a05:6820:1607:b0:716:bbe7:1ca2 with SMTP id 006d021491bc7-71b39447221mr4247611eaf.26.1795233348393;
        Fri, 20 Nov 2026 19:55:48 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:47 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 04/12] media: tw9900: add saturation, hue and sharpness controls
Date: Fri, 20 Nov 2026 21:55:15 -0600
Message-ID: <20261121035523.26764-5-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

Add additional V4L2 controls for the tw9900 that modify the appropriate
registers for saturation, hue, and sharpness, sourced from the datasheet.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index df8c7b1f3450..42fc2afbbc77 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -41,6 +41,11 @@
 #define TW9900_REG_CNTRL1			0x0C
 #define TW9900_REG_BRIGHT_CTL			0x10
 #define TW9900_REG_CONTRAST_CTL			0x11
+#define TW9900_REG_SHARPNESS			0x12
+#define TW9900_REG_SHARPNESS_MASK		GENMASK(3, 0)
+#define TW9900_REG_SAT_U			0x13
+#define TW9900_REG_SAT_V			0x14
+#define TW9900_REG_HUE				0x15
 #define TW9900_REG_VBI_CNTL			0x19
 #define TW9900_REG_ANAL_CTL_II			0x1A
 #define TW9900_REG_OUT_CTRL_II			0x1B
@@ -252,6 +257,26 @@ static int tw9900_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = tw9900_write_reg(tw9900->client, TW9900_REG_CONTRAST_CTL,
 				       (u8)ctrl->val);
 		break;
+	case V4L2_CID_SATURATION:
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SAT_U,
+				       (u8)ctrl->val);
+		if (ret)
+			break;
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SAT_V,
+				       (u8)ctrl->val);
+		break;
+	case V4L2_CID_HUE:
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_HUE,
+				       (u8)ctrl->val);
+		break;
+	case V4L2_CID_SHARPNESS:
+		ret = tw9900_read_reg(tw9900->client, TW9900_REG_SHARPNESS);
+		if (ret < 0)
+			break;
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SHARPNESS,
+				       (ret & ~TW9900_REG_SHARPNESS_MASK) |
+				       ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -701,7 +726,7 @@ static int tw9900_probe(struct i2c_client *client)
 
 	hdl = &tw9900->hdl;
 
-	ret = v4l2_ctrl_handler_init(hdl, 2);
+	ret = v4l2_ctrl_handler_init(hdl, 5);
 	if (ret)
 		goto err_destory_mutex;
 
@@ -711,6 +736,12 @@ static int tw9900_probe(struct i2c_client *client)
 			  -128, 127, 1, 0);
 	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_CONTRAST,
 			  0, 255, 1, 0x60);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_SATURATION,
+			  0, 255, 1, 0x80);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_HUE,
+			  -128, 127, 1, 0);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_SHARPNESS,
+			  0, 15, 1, 1);
 
 	tw9900->subdev.ctrl_handler = hdl;
 	if (hdl->error) {
-- 
2.47.3

