Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267997;
	b=x1wNyE2GldCOeqFVpGHe0PGQ5lO7N1tHPnNpUzCj01Bgy1eJYLSQSu7OnNipTRS38uV3
	 o4CGek1N0qBJIEzyEou7KzWx/uW/uvBfmKMnfUyrg0Zlak3hBEdMOx7+LQ9vBNgf+yzTq
	 qebZ21+ZuAbW5o7mcMw7FMlSjcVHqCVIcLOxOMfkwh30T5MndouOj5oPpopEFMEVd8fmh
	 VW8U8dc3OwA6Q6c6U4Tb7tvoCqXU/Zkzl2G9O/Ia+X9PMiZEtgeexO9sNvFh0qZuXjre/
	 w04NyjpcXoapALnysmycW+kT39egpJM/qoMiYK6HWBekmbh8BZ18IWhgDZ7/YIubQiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
	b=N7srCZutvkU8OsdZWmJlTJQGa0Dyeg2Lud+g5G8hu3MMVD9A5JZP8sjdNB941VOZFS0n
	 1sz7nXnYToRs3o6q9on0nFXEKxDWA9h+qsqWCkoPwyICBdojrIKAZku9Pkkh9DXiTbeHo
	 8YGZUMfYyMMPrNZ4LTmvUdc5Z8Z0IL/uFG+ll6l97A1fvysQI6koTrBbmO0tHIVhNBsmK
	 0JozxPZY68EBMuAePkGD1Y5qqZXK0Cuttc1KFG9f4GoBzcT0SJvALp7oivCFO3f5u/JDL
	 yqMuiJv8zqhWVqEvJldRCuW0ZoOJwXqMi/bZ6Jr4tvAqRvXIzDGvb66yzHuhdZxl28A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjVRqs56;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269B2606A6B2
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 269B2606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjVRqs56
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15744305e9.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267995; x=1795872795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
        b=DjVRqs56b8Yo76Sv6sg1jA+fDVfY5EnzgIbWCxFYUy/sclk38bDySneAMTORk3xXBX
         7XYBTEBH7tm8YTTSiGNgjZmHto3sRjJ6Ib+ZYHXpMJ72FxXzQbdRrMQczUclwqDX4EAP
         PqU3iuJODupI9dkvczG6gzIxYiUHPXHKMPcdG4bIvoLPYjOAiZHV4tkJKCQ+zMQieQBe
         Qu/53oQwQ0KTUfGf8/fza3U6Na+dq3mnmkIbJar+b03LRgYTrWL9qyN19kxdbTq2NrWz
         2kZMRJfSVoXpCf2QGoui5CHP3VdVa3gn28p35gkFJ1GgOUhrtVYoOqOsH0tt5D/s2l7a
         QaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267995; x=1795872795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
        b=I0kB0CvWXp4j4fmLFCJ/nouTbUEKBORB/TWzALxaVgueWyvlDiK7W47XMYNxSG0/gi
         pfBi1taGb4y114Dofx0nbCC1gjgQ7HVY3xHI4Cs4BX8j4gDCdZWF+32QtmL72kCecxw5
         +kC76DKRqMBHJXWjeNa91HmAcY7Ypf2ZnLkA/pHXwS13hi2C1/WVDcuopu2bMVwAmImZ
         iHDW7tPssXKv/+eiWje+QjHBx7qBA80zyEh8eunxvi3n4J2pLhUYW7HZ90iVuPYkjQi1
         EazADrpKNvHsIbtFigBgbxqNcu3oEt6TeZ1xxIr8KXpYTee2E/WQXtUizIt6YD39Sh3U
         qKpw==
X-Gm-Message-State: APuU4Z8eU3pMjSx7YRI/bQlFz8LcV9go96qt0ly5DiO5jDdasxq2Y1MV
	1pyREk9JVcRYk7rCGyM0HiMwzuP6Vh5ibMA6csNso9sVfem59n3SExb0SMIBOA==
X-Gm-Gg: AZFdTZegrmM1Ml9gC4Shi73IWpZrRTC+vwGanA3LjuUGRknA7SyE96g3cWWwi2p/kTD
	LFsndT5osgg3MI6F+Yibr/P5Vt5JnLbAaCgq2wt89XZt3iNsHOliohIkU78Nc9FCNbENFDNfmfg
	PXG3iAHxVkY5iN0km7piaNlxmtoUStKJddXlfJbqC4bNM4JL83VF48TH43uFoFiF6TKjgEfWEw7
	BlnWPueZ2RRkDKBlxePc1dIeMB2mEyk0Uf2ZHNfLL+aLAQ3UmH5aDqhLv8+8FTnNL5rTfwA63bg
	Fb8wQ51HOaArTNefMttKqhQCSVOdpcLkHv8j0QoX4nPEXHjjkeGVguF1Ynm56zZJJgEO/3J7HsC
	WptOzRtr7ddbK5X8q+4XKG9K3Ra9mY8waqreMjfDPdQ832EHaeV3fSvpIj8CuG8XRYu1k5h+f5W
	KF6TVYdjlHkPhKZcOjbltBZ6E/dTAXaIlCGwWRy5y5/hxWGeqveXlBc2I3x+B09LETA/oZbMEuK
	WfeyUXzuyCggbp56ARQ5cqq94BAwf7fqQGlhgwnHw8jGMbcg3exXjglUXkF31QeRs5xEjDn6ISF
	EH9A4tU5KA0/5V3Ot75iBh+NJBkZOUzPIMhgX8jG5+o296ehEnAq187GQFMxSesY5ghcZT/nu3S
	3UNSEOBu2/TBpjC1yi4SPVB6JoxQAJMhZidE=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr149002085e9.12.1795267995455;
        Sat, 21 Nov 2026 05:33:15 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:15 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 14/14] media: atomisp: Preserve the capture graph when a lens rebinds
Date: Sat, 21 Nov 2026 14:31:44 +0100
Message-ID: <e19d87138eaf283350f85ace17ee9ee4563e9423.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The root notifier completes again when the lens subdevice is rebound.
Rebuilding the entire graph adds the original sensors a second time
and attempts to register the capture video device again.

If the capture node already exists and the sensors are unchanged,
register only missing subdevice nodes. Reject a changed sensor graph until
the driver is reinitialized. The preceding V4L2 rollback fix keeps
existing sensor nodes if new node registration fails. The X91L rebind
trial exposed the original issue. Codex drafted the notifier change.

Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/2PUHZIDBEIGQKGXTJJOUXXJS2EOEMJGD/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c     | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 56da454f0..72048de9b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -508,8 +508,23 @@ static void atomisp_notifier_unbind(struct v4l2_async_notifier *notifier,
 static int atomisp_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct atomisp_device *isp = notifier_to_atomisp(notifier);
+	unsigned int i;
 
-	return atomisp_register_device_nodes(isp);
+	if (!video_is_registered(&isp->asd.video_out.vdev))
+		return atomisp_register_device_nodes(isp);
+
+	/*
+	 * Completing the lens notifier again only needs a new lens node.
+	 * The existing graph is valid as long as its sensors are unchanged.
+	 */
+	for (i = 0; i < isp->input_cnt; i++) {
+		const struct atomisp_input_subdev *input = &isp->inputs[i];
+
+		if (input->csi_remote_source != isp->sensor_subdevs[input->port])
+			return -EBUSY;
+	}
+
+	return v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
 }
 
 static const struct v4l2_async_notifier_operations atomisp_async_ops = {
-- 
2.53.0

