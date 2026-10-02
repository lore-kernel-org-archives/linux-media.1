Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9427948CD5B
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940081; cv=none; b=DoaPvqbL6QdoVVcL9nQMyVGf98g+AxSCwXMkhCJEM3gNX13s/pIbpNJmdU+IwBGFBuxrlM3NPlT2gJ1owE5EprbSl94bQeBR4yFV/5tus25R7fctRdiXH7UEwN9ZOEzJ/wfWJIDz4CnF1wfQA2ejmdv96rMhy77FBXnpWUqMcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940081; c=relaxed/simple;
	bh=VXjopj5U+omqVAla7VGm6iwYDdGBC64jca9tjyI7yGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VbJSD+SjGAlrwDTMTLdBwakQ1X7PWLKhc2pjPNyXrO/cFdRPskSQG2cuBOPK/Ab7XgiSLD1pHigWIunlqZMJn+WWHTQkJKLiO1wxV42kbu2yYWRg9uMs4432LJQon3kquTcVfazqQIRPjuxJUIa3Kv7Uj9Zdwx0DQcbM88P13Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KuByR8d6; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KuByR8d6"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c06eceso66145021fa.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790940078; x=1791544878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/tFurwhhHzFcRbrY5ZaJlaUHnJjgD55kmW9K0lAQ28=;
        b=KuByR8d6UjZRycl+So0RrwIwPBEicVYJcRk5+xAWoEub528JpDc1RboOKZM4pr9kjQ
         sJ/3nIqIi+3XtFZX/oayLkGHP2IQPXMQ5eCeQp1e6ZTyEBrLp0oUn6qMDrX/mbnyfbDz
         pFwEqMk2qHko4oUPXc65Szti3/xkYoouUcqBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940078; x=1791544878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/tFurwhhHzFcRbrY5ZaJlaUHnJjgD55kmW9K0lAQ28=;
        b=mF+Nn7eB9wJ/dAzMx4/p/LczFGbZhevqR5uFdczgVIvUVxouBhkkDmVI8lTxrOjtQX
         CZ0b84FD/a0Vnohu5HKjmNz/CPrTRIDd/B/RCKPDNwKEsZV2EZc2ojr4qCKzqxrIjGVw
         eT7JOR7hD7k9Qe33y9BcRmvSUNw+IoYnO2cx1jCBSGccEu5vXxOjvJDyWCd6ni8u6mfa
         BvEZzYHr/MMmwhrpRJ1/ctP0hcqnnKGHfhuoyxMltOldbhE1i9clm9oemGpOBfyvMjy2
         jOcBGy06jz1dYszn4eCmC/kgn+uiAxsKTwirZTHd2ICCg4lpWoclU5+pQ39ffZV73Cj0
         PQcA==
X-Forwarded-Encrypted: i=1; AKwUvBxpSNFx3Eic4KD46yt1xB8+8zPnq7fdRLShBlqY3QObTyx+UKHvl3coYFEPjNxyK5EZY7rqLuVWy8NgXA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgb7onP3B9CtxrN7rZ+58AbXlDGRNhW1MUVQF3lgAK80gBXFQz
	MbPPoaOs7SGSPO+nYxd+KpDtKj8mCZUrPtAl9wcZ3japR6LEdZFFcwGD0alkG9rN+g==
X-Gm-Gg: AYBFou1EundVbBM8zUxDqyFnSWOReLcsL3SmJVkhbkOMxJuvycMqIQiZhvQq+vdfp5L
	dhvrRmEddQ1dLB3VqUQNh0YycWPSc6dCc45S3OyaMahzOh5kNacbRA0aWBRXzvahbSdXCocAf/0
	usoyurMzrjkA/n1YV3YGAu4VLq+Yuv+mDRMnME3tnTPNs2B2JHgDafMBHxE6UHBBPvNPmsFbthq
	6ZO2z4GrvSmyk29zXhcO2DNRw4TYnQkmtgseyCTRdC6D6VYwnlkUA3+PaWYUdOXPYsqIWmvrKcS
	yaUFn4nfDNLpeub/8fkplAbXfwDLTzJ7lkKzx+gilYlZSI5KTz2lW77cwk/Q3DEODgSE3Vye2Af
	Q09pFMLE3v9YbuMozpB7vuraa3gUDW/fZqqROhn7VuxiBEJFX5Zaw0SKrDCYqVVBt2cD1QGA2v/
	xVaSQ5cxX90B4wgA9KIqpDzpjUWPMXp8k1a4UI6n/7GIa/mPxYVRQ0sGkwqtpCvaea9PbavkJ9B
	ULpWuT3R/plVGQwvX0SCnQgt8zxEmLDnBacIZz0znQX7hS1GwZBINk=
X-Received: by 2002:a05:651c:553:b0:3a8:380c:9fb6 with SMTP id 38308e7fff4ca-3a88786c31dmr6898411fa.28.1790940077733;
        Fri, 02 Oct 2026 04:21:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm8562931fa.36.2026.10.02.04.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:21:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 02 Oct 2026 11:21:10 +0000
Subject: [PATCH v2 1/2] media: uvcvideo: Introduce scattered field for
 uvc_control_mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-uvc-status-11-v2-1-a98a135df0eb@chromium.org>
References: <20261002-uvc-status-11-v2-0-a98a135df0eb@chromium.org>
In-Reply-To: <20261002-uvc-status-11-v2-0-a98a135df0eb@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

Most of the mappings are contiguous, but the one for
V4L2_CID_ZOOM_CONTINUOUS is not. Instead it uses bytes 0 and 2 but
not 1.

To force reading the byte 1 every time we set the control we used a
fake size of 0, but that was far from nice.

Instead make a new field for this kind of controls.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 6 ++++--
 drivers/media/usb/uvc/uvcvideo.h | 6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d2f722bc3459..6224ecf28ec6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -998,7 +998,9 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_ZOOM_CONTINUOUS,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
-		.size		= 0,
+		.size		= 24,
+		/* Byte 1 (bDigitalZoom) is not part of the mapping. */
+		.scattered	= true,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -2815,7 +2817,7 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
 	 * needs to be loaded from the device to perform the read-modify-write
 	 * operation.
 	 */
-	if ((ctrl->info.size * 8) != mapping->size) {
+	if ((ctrl->info.size * 8) != mapping->size || mapping->scattered) {
 		ret = __uvc_ctrl_load_cur(chain, ctrl);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..69ee3d0c971d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -126,6 +126,12 @@ struct uvc_control_mapping {
 	 */
 	u8 size;
 
+	/*
+	 * True if the mapping does not cover all bits between offset and
+	 * offset + size.
+	 */
+	bool scattered;
+
 	u8 offset;
 	enum v4l2_ctrl_type v4l2_type;
 	u32 data_type;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

