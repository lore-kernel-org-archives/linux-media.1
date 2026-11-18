Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034601;
	b=04nnOs5KblBWagLDKAHIxgSQpEBPlaymMihqYDyoTlnNbpHda6u1zhQNIHd/XwMLcTPe
	 IHTRZx1j0Wk9AnWie9In1rgQRj1oE6AnmX52rCyfDy+kolsNKaTjYZCoEOZnNU03ElWlw
	 QtC2d1/xi95Q4XPHHZr92+84YfaPLvHfZNpigVupfRoiG6gih71qj11SBsX84Xg8H6jnd
	 MNktFqXL9wuirZsq8HK9nPMxzUb7lrrI2sC6PFc+ornjt7ZzGme8tB84SyAdEIJLIHO9C
	 plrwTxfmnesUK1K42Am7rJrEIRqAlMvNy7kNZhQTIQ7f2gp9+sA3qXUn4o/DRXGdIqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
	b=bmAPouqf2LIpLSwetpC2gdu0f//qQcGXFoAtG2AP6LvSUvBFiKN3dI7oiq38vTcE2Xbz
	 I6p3+3VwplqFGmQkfgxZTwBMeQDuaU8md/DvBHthGR7cu7I0VFrjnrHcEacgjD86GvPrx
	 uHadcFf1AKLbBC0ou85YRpsls7lTZeDAMBS/GTSGDntiYWp2v6e8se9XOb4ZTmQshmjkP
	 zfvdTqdvd3WVJzGqqc9a5ggABeyJMOmepicQ8NFmLsVb/5uwZFl5K7IzSCJYylf+fXHEk
	 NUKHS6d+OvjYUhwGq7lDtuMtJvNAfUPbSNkzjbmvl3WgPBMt5J52m2bPt4Q2QGL+f2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1qNzhnC;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1275360A260D
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1275360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1qNzhnC
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70bf1671c21so954563eaf.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034600; x=1795639400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
        b=m1qNzhnClzL2ZS0fSFd8ueIo76GZZ4z13jX9EKGqGvXELXRwi5KUOOQD4fEywycSJC
         vaa07c4wrbZO19fyQ4Yp5bzvVKcQHEP6sg7zWB2dIUwsiAi0VuzRpgt0UKyCdy8H0vwu
         OlaK//hT6ab0Ui/eTeR50z0ij23YHmGclBDAyR+VRyr8lzYOw4CVhksPdW15ALHSaN5a
         vaMjZr3KXAyF8vxWGWfjFSoU5fUPVPVrd3vAEYs3/9xkiwwTYa3stnjc1648nVdqz2GC
         X/YsZq9f0kaoC3P+qneih0J1UKYqrzqWSANgwVggvtNY/PYSMb4IV8M54Wb8ayFZmmkh
         FU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034600; x=1795639400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
        b=kT/dqPwuTfga+Zy5W3p0HUdkZG/48dEOlRIz+qniyOFuNFOBPWYmnx4xjT9bzJz75F
         TSOvC368TPt160s4u+ZJxARTAEmYZazFRs6/pvEyZttQvMTzJhCRcRGmJBOzgj1zTz/M
         cGrszJ0+y4oUpgsAs1Il6SCv7Cv0+TMPHoNkfmeRT8Miet0aMbd1qbNbqovckD9aNJE6
         ZsEMBLnNuz1lLklRxoUuDtCt4KsRksyYUoOo7Nn4A56v+HuhgsBzzD7bZbj/w1r41SPo
         PZCHxNhgo7DwOD0dNunFty/xTeDMqZ2vVvlHSGILSfWZl96jNL6juh+GQ4jn5nQmHiLj
         wS5g==
X-Forwarded-Encrypted: i=1; AL+hErEDyL4EvbAFc1l0utERbGEKo7UjW4FJn5DicNli1E2fdQbnwHvLoVaQkNqQSwhpINC+WnwutwoNWrVrCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+avKbfm60x02V1aSaDGI7+VD+Sh5roCXF21E7RUvBeTGt8SSl
	sy11bx+n58nlL3wwGXo9TkWcWRzT5FT9+cIQ8MNEaNCrdB6oFLfRdpM=
X-Gm-Gg: AYBFou00uNAo8f5Biq8CdddDNjGleSnHUEdjAEChyYt4t70oujb4rA2r1r3J0cIeV47
	Hr7wVJaSsZjyEAGLd8M4s0/1I0QHC+pACjmRyWkt2Ks7jLaicf148RC/EIAc6gHEBL3O8b0wDod
	B4ro5372OaQfbxgElmhKYBRkG2pbsXLTQVJrA+xJv3mfKXRfWrfAoHHjf93w/EOWhyLGM4QnAr/
	ZU974mjZ6zW4LncB26pAkFgsirgxLIKDw1ARmSxEvKgc4FkWL8ct224FJa6oRC1npSQPHhmLO3j
	lEcNTE8s4NRBll3Vf0wUf564biNCcTr0iGHRLIh+xki+WDoMeWVBWTNZlxgE0lgyhy2XtLdLxex
	KrNXDrlumTlxg6t1yCuksGB0tsKRZ3/2xspSpItUc+UJ9sdIprZaXb7aqaBmNo2LAO9a8oIaZmL
	jo3DnWzeu9z7ow5suSFYnraF8zMPVmk9pjdlu5UXjXbPcET7DOfv8ADLBSrtoVQ6LkUlM7so/cs
	xKeJ1ze6RwLd8DTtF+mpNF5oOZ7otbmcWdXMnD5kiAw1rAVI4/jq8DpXzaf33MqNkV0+CLEq81L
	stbYcGtDuX/VJdKLWzhBmLrgM6PO3LDGJCqRLfTAI7/fpTC+DSQz3TKsjWdfoaZwFl0/L3Vl2Xd
	Pmw==
X-Received: by 2002:a05:6820:a649:10b0:71a:f211:9547 with SMTP id 006d021491bc7-71b18297b00mr2227922eaf.4.1795034600007;
        Wed, 18 Nov 2026 12:43:20 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:19 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 3/8] media: tw9900: add saturation, hue and sharpness controls
Date: Wed, 18 Nov 2026 14:43:00 -0600
Message-ID: <20261118204305.28268-4-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118204305.28268-1-matthew.laux@gmail.com>
References: <20261118204305.28268-1-matthew.laux@gmail.com>
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
index 60d5686716f7..d365432e8f89 100644
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

