Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4834A4D90C0
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854695; cv=none; b=HYwMPkDSLP6r1v4foEs2AmVc2bg6OvHduQYb+t89JzyaGlsyLi4/rrSurgOmae//tagNtWoJs5nn0I4LjGLdlku9AW90J+/aOWfpNStBrEMb7UnLq4qhbCiJhNXK91ofElJLdBR2Z/wA1GEORFsIf1A4/5W9gD32h5NaehvJhig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854695; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHv9HhTjJC74SJs9idjvEwYktGkmq+FVCAPKVKUe4IE2o/Xh8UIxfffLyESG3BjuPJdwGemNJO2OvepSL9TA1NhfCKNUVFu+9hTlylrw4q4gI2maDAzMRGILro6L5I2qug8FsduW7kgKoBKmYIEiesZitYo4d/tQz82USlMpQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rS8c6GRN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rS8c6GRN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso615745e9.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854692; x=1788459492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=rS8c6GRNzy8gd2CgbyJjFX1+/4c+4ZA16oDC33F4vfDwiQwodpx4qFWqcRr0khmY89
         t4HFzQjI47OetUrg7HmReo1FC3NNL+3JabuvS4nHZuElhKtBj3PGSMXx4kh3BDtI0K5s
         ZnRIEBuuQtphFdBcG3qIzYYirbQqgvoTiTRDX1t/j5QxEN795Vxs8XgdJsGQPK7C+4l1
         5+ZU4OCAXRa6JV58LWZlrxnHv+Yk4ClRZQiS4lgGGT1qRa2VqiGhd29V82Asgz/bK3fK
         u46Rud1Q5MIBavVlXdiWh25GnP8RDzbDVy+vlfjHsSx+q27Wn0mcCZhIg7Sn96L8csYq
         BmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854692; x=1788459492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=dGEfY3buwiC4zEgOKvV3nCCLzjFGXjwo8ZJv5FTqeyfoEPZo78PC5OL+56jVjEJX/Q
         wuUXA8+gZLznzMkcOdEEF2ViPiw7or1ORJ75T/e72umy6/NWl27hZ8zlpTUyyNJS5hoC
         nEB8rXXlHsRFirBPnqnjyPHCb5h+XJp0Wg2sSJcP7X0NiAxxEjapLokn5cjz/KVOkvt1
         d2Mi2NsxituhnSyiG3ya5HMYjgetI1vR7+1YCi4CMTyWkjwCZk0P52YgWY337ECaIyJW
         u+HDZvfnl4FFG4H5HwwqAUx4/+9/XxePljiExLCvN4aDuv7coCnETNFWMBZvgEvsEDQi
         w1Sw==
X-Gm-Message-State: AFuF++kMq/26NXbn8GkDkJBYVwwHNSiknbiMD9XLma1j5KyL5yDK4OAn
	DDQ4UnHx2B6EAugPPEeMtdRnbuFqxdwLoqUwBoXGOTm2ALDk43nLXf1oI6eO4VV2
X-Gm-Gg: AR+sD12dMVi1TY6aJEDijMGbODi2exER1N2oiY7+xOn1jyFqeNsCQP9oI6MItzomzCf
	pdKQW1Bq8dY1zFE0POg/tZtrZ0XX/ELGgWlN19cgavdjgcYts//zkAwcbQTxM6ebRGT4vGWVZvv
	758pce3J+2CcxA/w8dG1u0ZO1n23W2/XukbjDp87qciVu74HuF1tEsKgspfJrHfXv9aadmSgTJw
	82n03hz75acNoMHu1ER4QRDndb8iuLzsWwnl6h0O8fdVLq3gmAuhHDdCsSZqCP7kg7hnTRhBRND
	YvkvuUovrS7WsbZAFUNs55VpCEsaFLMdVqjZbj3MuRsp68SWz6+96K0oyQVKDEHFfLEaEwuf4tn
	at3CIIAShJNMt8if9lATdo9jhZWQV4GG5V2dG6Kcha3l/KOcFiQjCO29YbJvoy5rXFl78vYQUSL
	vnPRwjvzhZo20zCI5Et9WFxFjPXTpjl+XMbwGUuX9GkjDxFw3E+QW2V1uBLKhOyaio0Z0UF5el/
	bOcHfzAcoUz2IyjfNdSF7rZdlw42CTxjmMAZUg9e8vCUyL85BqJoII=
X-Received: by 2002:a05:600c:4e14:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-49b91bd78c0mr16681215e9.0.1787854692236;
        Thu, 27 Aug 2026 11:18:12 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:11 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 06/11] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Thu, 27 Aug 2026 20:17:51 +0200
Message-ID: <20260827181756.2430054-7-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

