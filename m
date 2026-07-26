Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFA53C98BA
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 21:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785102282; cv=none; b=pm596swQos7uTxcfXSXgvP4hCY1XbhhRJU8RGjXhcuYXu1zD1BCdZFANI39TJtUK8KmXJCxA/b/QGhgn8UT56IO5Q7Tf+ASPBRNIyXiSDJclpXHUL0F5xdTFJMfJQxvG4y+B6sN8KcU7IRzjPf4Comnz29fkHFr6M/t0t+BxJmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785102282; c=relaxed/simple;
	bh=ygRoN7b3dgu4lAhoJksF8fNETvwsHkA61bUd2JkCIIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkiNGAO9hPCLY2/ucWABow74zEE3YtGAQsfC9Mb+so3ZiI1TiUrYKhmWuzhRJbJwZuaoEKSjtpDt6qkpTm73q5Zwaml9ZzsGmZ2TzFhV4okLTnbcktr2w9yGdgdqHHLVPbZGCC1CyUr/JOGbo9UI6aVZJZNx8ihnPkzjG7n0Ywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=qOzrUEfV; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="qOzrUEfV"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c15bf5000so12290271cf.3
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 14:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1785102278; x=1785707078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jto/MrdGaItM/ShBKHC/4oOFN7WiMbrQtyy4H38GKYY=;
        b=qOzrUEfVZmaTWgDVzoYHCCwEmg+B7zb67YHkjkqFf2EeUaK+QmAYvf1CQ/THw8zz5/
         +ySbuX6oc/bMcXWbFqgjOIlYyf+JvIW357Fz+B1tGPJD4r9lcx0eQugzhsRHb7+cJWmb
         E+xD8BOZi7fojPq7zOsWRrL8okIuzuAN8CiVeo4odJ2n1R7mPwF20IwyxkjyCS9n5pjL
         U9mCQiLJEqJ93uenkIxUhS8D8m+mAJH0Nm76CkduQk4xwZC1bNxIe4FAC83dLBbhU0m3
         WDXpTOy0A0jRDZxxAZVhRfEMs+THvFQejYlr3Rg47AxOLrj1LVXcDeVzKsabkVWYlAgR
         +j+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785102278; x=1785707078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jto/MrdGaItM/ShBKHC/4oOFN7WiMbrQtyy4H38GKYY=;
        b=Dst6m1yZRCuWIaD1N/d6C1u5iWRWZ7sr4RFYMVUHzDcn+hpb1mhDZlEcNnwp5U5VGw
         1LOr+X/IkFekT0Y1bEbCbChqqAA4BA1v7oo4sofuAQ63xVKSu4Y4xf8AFFkSkYzok7Pm
         8oEPZvyerkHpXMeR8/XQUz0T7bUtjLECa7kxo0zEJR/Eas+xSbjciuy/LvMXbPNXhnXw
         R9kwTT31O8FDy/yKK1dqiHnxbjuZhyJEOoEngVtBTYRMyHyBTsQ1HLn0XMpyRvJkh0b+
         S4kZPOOSxJcF0LOE6Nnl+VDf4gCOPN5/g+gf8qnzDKX8y2rYo2Zr/8ueKia71idgmp7l
         NGpg==
X-Gm-Message-State: AOJu0YyCNd+M30SDVcR/9w6qOZrAIEdpAPwgE7BcRyvn6WYK61cD6EoN
	G+Y/f+GEOn9DfdP5NUZYzJoL23XOxjPgXiBdyVvj9mMmB7TTNIPb/eYoEEOgnVhglMyamRZ3CL4
	Qj2B84kh/wjeVquD7ucQbEF66n5Ce5/DgQibiwwLA0d8MdKPMlSs71q0GVCPMc6GPvH1B5mnaKt
	3rzSUVx9xvgdV5eaKQ7fU/kkRfzUFwmSWGVNape5Jo5UVojiZuGg==
X-Gm-Gg: AR+sD10uQlsSCdVzFUK6IB+qjGM8n0SUPR+CsKZk0uAnKJfS2ivGyQFrwPPfs0IcZJw
	Zs9obgOwwA9rcz0z56x+SuoXC8rwYWiBuG8T4MLhmkiZCNrpVUSyCBcAmNFnvrLFOClp/R151wM
	hWjNad8IqlKmTHgQ5xllGUgMuBzc60waojcXNP5umTacQQCZt9nbvGR6H+MQDdufKtvRhkqtxW9
	ObkTEe0ndyI5Y+oOE88Ant5LF5TSI0ySrY2LNErWcSBwHwii4jOpehqRbaOT3ANyISdYzmF9iD/
	99F+tdTTdvTvlq7wfOaK58r+tirYcOX56K59yjJY3X4UPIcKKNjVlCRhheFZAyn7VsxWW6dlSHu
	R4myWX9ooLpqdHgxA8ktoHz2Aw76sA+rMdDCfwgMf95cGW+yw9SJpRSJARRnQMxWlpyT7sAa1p2
	1u12dF0ju+rqpzK2WoV1u9/hx2VcQfpCavsiNOaIKdCCiPbXG6CQpBciXqGKo9RVz2CUTHpIO4V
	V5b0Frlj+P09axl/dNpqnh2FZNk5g==
X-Received: by 2002:a05:622a:1dc5:b0:516:ea30:8756 with SMTP id d75a77b69052e-529a839f57emr61929401cf.36.1785102277619;
        Sun, 26 Jul 2026 14:44:37 -0700 (PDT)
Received: from jake-laptop ([153.67.53.72])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a27cedccsm41487031cf.4.2026.07.26.14.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 14:44:36 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	bingbu.cao@intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: ipu-bridge: add Himax HM1092 IR sensor
Date: Sun, 26 Jul 2026 17:44:01 -0400
Message-ID: <20260726214401.19042-3-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726214401.19042-1-j@metarealtyinc.ca>
References: <20260726214401.19042-1-j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Himax HM1092 monochrome infrared sensor to the supported
sensor list so that ipu-bridge builds the software fwnode graph
connecting it to the IPU CSI-2 receiver.

The sensor uses one CSI-2 data lane. The link frequency is 180480000,
which is the DDR clock; the vendor-stated 360960000 is the per-lane
bit rate and using it here leaves the receiver expecting twice the
line rate the sensor transmits, so no start-of-frame is ever
generated. See the sensor driver for the full explanation.

The list is kept sorted by ACPI HID, and HIMX1092 sorts before
HIMX11B1.

Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 88581a4..481cfb5 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -49,6 +49,8 @@
  * Please keep the list sorted by ACPI HID.
  */
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
+	/* Himax HM1092 */
+	IPU_SENSOR_CONFIG("HIMX1092", 1, 180480000),
 	/* Himax HM11B1 */
 	IPU_SENSOR_CONFIG("HIMX11B1", 1, 384000000),
 	/* Himax HM2170 */
