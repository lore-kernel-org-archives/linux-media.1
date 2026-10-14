Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973850E5A3
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982582; cv=none; b=gYMUhxaTuR6shiU9uPfPwotY48sGY/b+uMeouArnwG++MwApLpUyLp7k/BxarAKNcpz48js8LfdQD1hSjWPDnN/8adEOH6SqtNrmGbWrzjy5RxBbWCune8qfzzlopp99iEgbXCTFEvAWT5ENRtpjN2PCfH/Nq4q/OInrDTZ7epI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982582; c=relaxed/simple;
	bh=ujR0Ao8Zsx56mkPeBslHepwaYTUlbN4DmdNIeSwQtjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ef8dhfd2CIqswcaWagt7ladXZrvv5xM06JvISXMBIPZ9eoTpUknaiiVgeCB1iF7GMbAnGGH1ZH9TcIbBeG3QRr3r62nCMl9SCQ15SniK/1lOV4pfgR8wCnrd/k3TNhvfEjIJTY5VA8iZvGy0txr/R7/TM18WNK+6sgncGOcRCLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=bvwQ79GU; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="bvwQ79GU"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-53524092d9cso41118401cf.1
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1791982570; x=1792587370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Q+nDPtiFiTRu/6rqQEpn2KpK7KopfG0Bv6ggVQsS+Q=;
        b=bvwQ79GU96PkDRgx5Aw/dLoJaEfRo/wj3EyEoH12bQy3q0vPMki/7jRcra8ft1jAB+
         xtQ1hqzIMGp/s3RCJj1JPCzdKsq+JrZI0IGNc0PZvfTknyJ7ugRQKlm2K+vn4+uajeua
         sOGplMtFk/dWfX6PMSvTxW7TI4lb4m1LhTlIMxJDvyXw2A3DlpoRMI94U98NhisAQs/P
         IkNuEt7amYC3ApusBIPH2NeIoOUAyevU16hopUQmvtz6yh8vVh0WdLPB5UGci+hKu+lu
         VEffZ5KCzXoU4aL/YFSPs9IkTXiZSz4M9lKcyk+Khk8bvx385EA3TGGcMZzpIEGdI6NJ
         DjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982570; x=1792587370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Q+nDPtiFiTRu/6rqQEpn2KpK7KopfG0Bv6ggVQsS+Q=;
        b=NltLD9l94Awv3QQwwiD4uw86+5/Tr7cssW0V7U4OpmVhDK6yUxMB3eDBbWApa5mNKD
         vvvHpO+KlpGklDML5Z9jZePIWrXjHtsnmh6XUhq9I71iByW7suFPkfAP2Q4eThtD0d0m
         kCjzj1+GmtWdf9aU2DGfn2IFBS31fUrpJyWX9NlKmqUMOw3s2fgD3JzPE1VGhlxZcyZQ
         4jxopNTMRUYS/2+lD9GinF7jM2N756qpytB4yWD0D2momJOWSV/0ws9cI5h1XAJeR7+2
         hRFbOKrpc37zRkVRaCn10ZEnYgFThgfUGEID/k/64tWNvm+3D0CSwM5iCDV69473A1P2
         SmcA==
X-Gm-Message-State: AFq9FYKNL1d7RjFvEUCVrWSzGpdTFu5dwI7XWTqbgOfBQmIZyK5WpFco
	ojK1xWHNdaaXo9Uiwz2NVorWZY06vRiRXhhEtPU6w707bijulE/l1stN33XE2brwsILc3cx7GtK
	WMe7KwCezZsfb
X-Gm-Gg: AYBFou0cq4VoiBya7q0t0SFjfVEJKFwHbFotbNtKWIR6UFXRw15qODBrExh36qBQgR8
	ZR9pUERSHbtxLRQSO2g4V/Q6HoCtaBiRhApZkQ9Clly73GtXS4o335c9LnFA9x76BhL/dQuH2WO
	i5w44Ce1KEC2fFp5NoQdlZKNFMKC43tFtnei6GwxgG+n4xBBAR5Aist8onohsGw/r45eGj7VZVl
	Kukfks1t7ewkfWUISGrQgBOuY3s3DJGqk5U6gVDSmZcCfL3cOgxrsaeXW99/5pPTtYS0xof0knK
	yZa3Cml7/Fw8whXW4yMIM2BBqfZwgersRV+A5lEyM5oWqwNgXPrEjU9xZvppxNBctftOcGSnO+K
	aHd/BwSNW+7nehx0ieGK1TgcNl39DF6A/SbXJXGqx+r0tndYvN8Y8mE0hVRRNNaAJwApPV9NAJL
	6hS4gg4AGYcA5y5iEsp46MAiKwn1Lui1iA6oXZzTt7oj3Cpy4SIShmaBVW1aJK27W8tYFkKozgx
	jMXwG1lZCr3WOz7+FlvRb4FJjHYweEpI+oaIXprkN16q0LmL6keRavhsfLsicsK9zynD0JraFkA
	SMK4WW08RhQXGt6/SB8W9hPLx+Op2gk6lOHsAJoK0Al4avDBazCG6GjU/po71ni5dPVyg518fYh
	+jJSdghhZbNYmzwCrZYvorjtdTXZSPlK7wn1sdDzLEiGvy/7KFuoqBr3wwmjOXw/wErgSMCt5ej
	I3sYWIcr5xl/iEqdBgiiWyfbvZmp4+idzgty8oFl04A8zX48FYXXw1udbS64kKLfmypQ9mSryFf
	3U/ZpNB6Gc=
X-Received: by 2002:a05:622a:1f8b:b0:535:1d90:ebcd with SMTP id d75a77b69052e-5359fa71b46mr242740251cf.27.1791982570371;
        Wed, 14 Oct 2026 05:56:10 -0700 (PDT)
Received: from fedora.tail5f8cb3.ts.net (c-76-151-41-221.hsd1.va.comcast.net. [76.151.41.221])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b35e23sm52368836d6.17.2026.10.14.05.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:56:09 -0700 (PDT)
From: John Cronin <john@stromback.com>
X-Google-Original-From: John Cronin <john.cronin@opcenter.com>
To: linux-media@vger.kernel.org
Cc: hpa@redhat.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	stable@vger.kernel.org,
	John Cronin <john.cronin@opcenter.com>
Subject: [PATCH v6] media: i2c: imx471: return 0 from get_selection after filling crop
Date: Wed, 14 Oct 2026 08:56:08 -0400
Message-ID: <20261014125608.1407042-1-john.cronin@opcenter.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <as9039ZI3Vo43DXX@kekkonen.localdomain>
References: <as9039ZI3Vo43DXX@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libcamera issues VIDIOC_SUBDEV_G_SELECTION with target CROP (rectangle
0) during CameraSensorLegacy bring-up. imx471_get_selection filled the
rectangle then fell out of the switch and returned -EINVAL.

Compute analog crop in set_pad_format: 2x binning, centered in the
native array, same idea as imx219. IMX471 2x2-binned 1928x1088 then
reports CROP as 3856x2176 centered in 4672x3512.

Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor driver")
Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
Cc: stable@vger.kernel.org
Reviewed-by: Kate Hsuan <hpa@redhat.com>
Signed-off-by: John Cronin <john.cronin@opcenter.com>
Signed-off-by: John Cronin <john@stromback.com>
---
v6: drop the tested-on line; add Fixes and Cc stable (Sakari)
v5: drop extra braces; declare crop/bin vars at start of
    set_pad_format (sorted by line length); wrap to 80 cols;
    keep only the bug/feature in the commit log
v4: add Signed-off-by for john@stromback.com
v3: rebase on media-committers next
v2: compute analog crop in set_pad_format; return 0 after switch

 drivers/media/i2c/imx471.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84..0ea18fbb9 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -421,6 +421,8 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct imx471 *sensor = to_imx471(sd);
 	const struct imx471_mode *mode;
+	u8 bin_h, bin_v, binning;
+	struct v4l2_rect *crop;
 	int h_blank, ret;
 
 	mode = v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_modes),
@@ -431,6 +433,18 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
 
 	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 
+	/* Analog crop: 2x bin, centered in native array (imx219). */
+	crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
+	bin_h = min_t(u32,
+		      IMX471_PIXEL_ARRAY_WIDTH / fmt->format.width, 2);
+	bin_v = min_t(u32,
+		      IMX471_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2);
+	binning = min(bin_h, bin_v);
+	crop->width = fmt->format.width * binning;
+	crop->height = fmt->format.height * binning;
+	crop->left = (IMX471_NATIVE_WIDTH - crop->width) / 2;
+	crop->top = (IMX471_NATIVE_HEIGHT - crop->height) / 2;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
@@ -468,7 +482,7 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
 		sel->r.left = 0;
 		sel->r.width = IMX471_NATIVE_WIDTH;
 		sel->r.height = IMX471_NATIVE_HEIGHT;
-		return 0;
+		break;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -476,10 +490,13 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
 		sel->r.left = IMX471_PIXEL_ARRAY_LEFT;
 		sel->r.width = IMX471_PIXEL_ARRAY_WIDTH;
 		sel->r.height = IMX471_PIXEL_ARRAY_HEIGHT;
-		return 0;
+		break;
+
+	default:
+		return -EINVAL;
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int imx471_init_state(struct v4l2_subdev *sd,
-- 
2.55.0
