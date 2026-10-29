Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267731;
	b=U5WosR2tItu0f9rI0fz74Cv83WRV8QZnT6uHj3YPf6iVGTOXmh2aMjXlZYiq8KGPnrbG
	 x5e///IxrhI9Ii8y2ZYHCMq1jV3aUWtitFmSCJ7UAolya6AyrpDld8+Ojx1TvRdXq/1uz
	 B96mRWG4jj+fu5td+isCKNYP84g8Nuqrl60UZdflLc5onsKFbzHsSXs9pfkTBQak6BE71
	 e3ua1SFHHe8yC5IMPOU/wEGQGnMg49npdpffctck6/2IkDt4ZrxUNPGaa+IPbdnZhtG8F
	 /96EqOS8ZIW6Bho63eHyy5FvyKZlg9jgfZaXEHGDRKi1C5wXUWwqvoc9omcIz1loLsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JjlaPahkTtPgjrIwMI9/6GY+ApixKnOFIywkbwnoooU=;
	b=Rgt/GkzDRq7vRUKgPaJ0759/Nw2qYmATeE7Cn0z7Its/VL8eZ8X5xdmR+kLd8VqXvqMI
	 6PCndJ3ZUfXCNegjXouQERrQ5o6kwLIYUKmfrn2kr/hiuNJp6e9Y0kQp88GZH44wiB9/j
	 +AKzvEJZAcpUd+fnjlA+clJHGyBvZkFrLjpnHk8vNRJrf7ToAdqZLt/F1TFgtUsfjl6LM
	 3Pm1ydETKRZVvpemXkc89F/eqQlAv+Puq0JUB3lyeMsr1fxP0/ylYESFCg6V/6KheLbK3
	 7zBKjzRpeO1IApBPolJc33Pu/VkuDw1WFpXSxSToLjCy6e81NTiQafr85ynjAYvvm6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a3+5dlpu;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBDE606A32C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCBDE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a3+5dlpu
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so994691f8f.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267729; x=1793872529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjlaPahkTtPgjrIwMI9/6GY+ApixKnOFIywkbwnoooU=;
        b=a3+5dlpuU3dAzPnqclZxDqJP0GWVKSTANx7Cf5Cad+pvl38cMa6QyMG7ovIul1hebS
         NLaMLbvX9K4BPf8qCnOpQOTV6JX/+yklBGctPmMIW6c/9TgEGj4ctTAE0Mk5D/3OGdwf
         FgDgMGMoCsR5eeG6XlRuwSU62QqCB9WKxybKCX423BJYtNGWj50yGHxPtHAdSMmPxMVZ
         rEj/E+jSb1phxBVmjOcqlb5CjPFSZymdWo+M2cFM8imV1s0MebVPgMESZlQ8Lfnvu/eE
         w51lc47ZfxJ7axQjIv1HfnmDU1Q63xe9cD9Hd131Am73dN7o4486J+ApiaIHjO8TPOgL
         uLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267729; x=1793872529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjlaPahkTtPgjrIwMI9/6GY+ApixKnOFIywkbwnoooU=;
        b=k4VnB0PjPj5tyaHQaptelqlovkpJkwFJ5bQnXkFaoCBy2KTp6AXKdSgUCanCCVi7sW
         Tc9CA0FrAlnJjwk01rnJiRbwz+8j+xMvr2MzUvCvuQq6dwi8NhAo+w+zyrX76/poGCbm
         roTOP9SjLpPKkXR98N65C3DWfTmvkfQb0VShJe139jf0lrREBXr5SCL0DMuwOPSqoTiQ
         tTwezOmtyY3DTxC4Hw35hxAQScyRA6WaE0KdEZi8ByJrtFtjeSZaJwssdr/ztkMYkk5V
         XEBLq0qml4KeSdl/E/wVvK2C2cfRgTqAbMS0QUP80MsWcXliaO1UuB5tHJlXv06TIO2R
         aefg==
X-Gm-Message-State: AFq9FYLhWEp87bQEBy+fsr8esSHDDT+vWkqdHVm78B/NC1gDu+1gVfwJ
	LXXnzP7cufUUzuAd6NrOk8yDJN0IQuiLRsxLDLd3IW56bSRfpaA3O6MkxnYp9lZtaQk=
X-Gm-Gg: AYBFou1izZBttUL/hq342jERj7Oyanx+QJqjX6uRkwqY0Z1FKjd2qMPiuUbyuGmmJ9s
	xMUHffW+bdAY+1SBpQA1xSGblpmvF38bgdc5VUqeC5ax/4cD8BpSZI8SBjKT9gnCJI7+O9DPQ/z
	iVmsvmVSzIrRsnxuSovIjyATy0nE619CrKnA8lVBN/QHvjHaeq6QT11s26iMxBTOX2DtwBzig7b
	nXAsZA8RcOZQfxsZ0aFsdYDJY4TQQeFttN5Ha7sEwBbWBoMa+dDhLqIhdT2qdQxEehcySmHGE+I
	W6nwB1IqORrLqqlZfNB57I539mZtto55qBF3CVJCr/nAMKY6jMkLumsSYoYVK9onhMEZGGAxF6s
	jRCqpdKp4TMnPURxIU9C+nTZqhfq+3qZPLydXqH6l1NQJ1bMAufAUxukNhumteggO03emIIuRg/
	DzjH/niBviqVMRfPFBWNBOVsUzurU2+SxDwZAubXRTCpg4RHiE1gIVtckdVE934IafcqsIAANtl
	0dNDu08/C4JHZ/BYlzkMeFKnYSa3kLzeM1/ye/R1jiyC7CNehejgUdIUiSIRAZCU1cSqeLEPmot
	rB/QO3frNuM22zbVZmru
X-Received: by 2002:a05:6000:4383:b0:48d:f541:a6e7 with SMTP id ffacd0b85a97d-48e5d5c4738mr11190308f8f.40.1793267729106;
        Thu, 29 Oct 2026 02:55:29 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:28 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:10 +0000
Subject: [PATCH 01/14] media: qcom: camss: Introduce CPU latency QoS during
 streaming
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-v4l2-frame-sync-v1-1-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5374; i=bod@kernel.org;
 h=from:subject:message-id; bh=Ai35Q8ExABw969As4EQ3ii0MaisJda4tJc9aDuiu4Ro=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgJP7E5pu/wCSc3z7ZasGKLN+u170t4lIe74
 XNgmN0c1WOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCQAKCRAicTuzoY3I
 OiUBD/4sKcBewQnuKNKxdWkyJu+Elvl5ygx+Q/pMYV75aR2eqovk5zhSokkbWvpqM4WQ25deCch
 JGSVqtTQBBdTJ327lRanYn4zMiqn6e/An10Ds6RJ/9zneH1iRc6kUXflPnJnzGDBjNyrFlsERjt
 D4yhTuFcAtyQXx905umMMdBjx1/uLfTGEQiEHZmxSOv/e0Zm8YMvszNvm7di6AoCcS5jfqlY5DM
 YO+k6MzF6o5utxloS/a5qiqW1+PZ4L0M8TlPpH3jWcipt6d9DJ9BgdX19TUVkbsoymbGg+l9dSJ
 hKHEeY2VpPgKEx8KyavCTGJSkFpEujOPmBMPYTSxCZb2zJwSG+gQAZxj3hUYgp3UZRODUh/qeTK
 r2Ctug5hx81tV5zCsVUaV2aS3TH2n9Q4E881C9MnE4s4DgQZ488NLm6DZ0IC6JsGmjEROUVUspV
 c679FYuWpuu6YwVFBDJkloHRZvQmQX0YqQ2KS5Mr2ELPfoZb9t9fkgbsPW2dSvX6YIVtaNEB+2w
 1Dn9CZB3tuZkrL6sbd7o+B3eHAKxjM6ogmnxptvyzL3qi3fcDyqTDgiF9+nKK9GC7VIowu4P9vs
 qqs3ZJZitsqxrCKmv2qzfHwWvVI5kubFm+c0RxvHIIfpPbM/BUXIXxWhg15WgeDdwGxmuy+XA4I
 tSQjg1nQbSanF/g==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

On a quiescent system - for example the X1 CRD booted to a simple ramdisk
rootfs during development of V4L2_EVENT_FRAME_SYNC it was observed that
interrupt for buffer done could be delayed until after the SOF for the next
frame.

Fiddling about with the interrupt bits, clearing them and changing the
logic of V4L2_EVENT_FRAME_SYNC to buffer completion didn't work and besides
"felt wrong".

Tracing it looks like this:
<idle>-0       [000] d.h1.    36.374380: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.    36.406601: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.439910: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.473245: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.504786: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.    36.506350: csid_isr: rdi0 sof=1 done=0

Tracing with /dev/cpu_dma_latency = 0 looks like this:
<idle>-0       [000] d.h1.   556.149115: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.   556.181338: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.   556.182880: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.   556.214643: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.   556.216185: csid_isr: rdi0 sof=1 done=0

The second is the pattern you expect CSI SOF followed by data.

We will require SOF to track and understand which data-frame is correlated
to which camera stastics and parameters frame. On an ordinary system with
several things pinging off at once, WiFi, display, keyboard you will be
unlikely to hit deep idle and hence unlikely to see the long exit. However
we should design for the case where the system is otherwise quiescent with
only the camera streaming.

Choosing a request of 300us - 1000us seemed to work fine but cutting the
margin finer, similar to the value on IPU6.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-video.c |  4 ++++
 drivers/media/platform/qcom/camss/camss.c       | 27 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h       |  7 +++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f13154..191cb71d02e19 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -286,6 +286,8 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 			goto error;
 	}
 
+	camss_cpu_latency_get(video->camss);
+
 	return 0;
 
 error:
@@ -306,6 +308,8 @@ static void video_stop_streaming(struct vb2_queue *q)
 	struct v4l2_subdev *subdev;
 	int ret;
 
+	camss_cpu_latency_put(video->camss);
+
 	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a9..06e1bf82f4836 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5064,6 +5064,29 @@ void camss_buf_done(struct camss *camss, int hw_id, int port_id)
 	}
 }
 
+#define CAMSS_CPU_LATENCY_US	300
+
+void camss_cpu_latency_get(struct camss *camss)
+{
+	mutex_lock(&camss->cpu_latency_lock);
+
+	if (camss->cpu_latency_users++ == 0)
+		cpu_latency_qos_add_request(&camss->cpu_latency,
+					    CAMSS_CPU_LATENCY_US);
+
+	mutex_unlock(&camss->cpu_latency_lock);
+}
+
+void camss_cpu_latency_put(struct camss *camss)
+{
+	mutex_lock(&camss->cpu_latency_lock);
+
+	if (--camss->cpu_latency_users == 0)
+		cpu_latency_qos_remove_request(&camss->cpu_latency);
+
+	mutex_unlock(&camss->cpu_latency_lock);
+}
+
 /*
  * camss_register_entities - Register subdev nodes and create links
  * @camss: CAMSS device
@@ -5429,6 +5452,10 @@ static int camss_probe(struct platform_device *pdev)
 	camss->dev = dev;
 	platform_set_drvdata(pdev, camss);
 
+	ret = devm_mutex_init(dev, &camss->cpu_latency_lock);
+	if (ret)
+		return ret;
+
 	camss->csiphy = devm_kcalloc(dev, camss->res->csiphy_num,
 				     sizeof(*camss->csiphy), GFP_KERNEL);
 	if (!camss->csiphy)
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0d..9341fdc9bca0e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -11,6 +11,8 @@
 #define QC_MSM_CAMSS_H
 
 #include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/pm_qos.h>
 #include <linux/types.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
@@ -141,6 +143,9 @@ struct camss {
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
 	bool legacy_phy;
+	struct mutex cpu_latency_lock;	/* Guards cpu_latency_users */
+	unsigned int cpu_latency_users;
+	struct pm_qos_request cpu_latency;
 };
 
 struct camss_camera_interface {
@@ -182,5 +187,7 @@ void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
+void camss_cpu_latency_get(struct camss *camss);
+void camss_cpu_latency_put(struct camss *camss);
 
 #endif /* QC_MSM_CAMSS_H */

-- 
2.56.0

