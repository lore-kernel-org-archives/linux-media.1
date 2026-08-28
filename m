Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D51137E5F5
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933720; cv=none; b=cgv4B3v6bsrQiUrGv+YmOA5rGNJ425Q+Ay+wWLXlsZOg0R/7M1Cn59+7wSagpMr5GDoI4hut9v4syaYcFEM4eDrU9lD9XcJikS3WQxFRg++5m1vh2bYRpTgZx8gRFY5ZN9v39tU8RxnTIYtLL0UttOqVmYmCfbOsOTZqQY2mcPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933720; c=relaxed/simple;
	bh=Wq5pAafYhnlX+730hO8eGZFTr6gc1skehnTfelhN2Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bhsvm3t/8h8/UR5F5jvgw7Bs7W+XYFXDVVDBp+WVUzdtv6JHudYhM7UxN6VMc0pMljb+s+PZ11e5V3MSu3nU+NPPH1tp7K8KEQhbi0WflF/2FDQXBsiMTCEINC0AOXryPqJEZ5yuxGn6Yb+LRjGh6g1y/xd9c+BNLZPwNL9m7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWNRe75G; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWNRe75G"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fecbb7000so421482f8f.2
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933717; x=1788538517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnTmJHQexdV5oBlAiHI8qAl8iNKOtPsWh1YaKqj289g=;
        b=cWNRe75GS3g5sUM8VERlRuPX4pv7UhB5gMHKNtui5a+oKkAri+2fYKehGASZKIlz5S
         xTFjUyv/KUUaucjpszT1NdC4oFuhfUFhzVaQ0jaNJhBeRt3PFrU5jGQsHI00wluzWsaJ
         icFa5Nohsh9fN1c3xXY6jcCX7AbW4ire8bNGPYbovyJupR4ajgL7OvKm+oW4FI1a65wf
         rpJpNAyXewUtMMJdY3RqmxzHKpzgCYMriMiqBuPqzQQEXSbIZ71L8WpqxCQV1VmJ8aJe
         20wwojEWug7NpWJjY29iBmMgIo37kX1eCtKefsmZtJGhPhFVsV59NqoM5JZaL8hSlIjp
         cHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933717; x=1788538517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnTmJHQexdV5oBlAiHI8qAl8iNKOtPsWh1YaKqj289g=;
        b=OFk2L3ErqjyD9BUW26A3ZQhLUTn+KRPaKHXn3yvcHB0c+3/YgZxlv79KKlcZewspLc
         xOtNItq/QPmjE41pMp4Dmd9I4HEXckXRR9ay44kgr5KLtyhBbSbQZABf8JV8olSaVy8U
         zph3bWp+Nt73+jOtJii/xAbo2LENZ5wxd0kbyso1RSDnjutYaqZXVg2NcpockYuamA1W
         eG1om6jyzgTQLi436u1qlr3+v7q0T9hwgNmJr7LfRz7lyKgxGshTxk3Oat5PgdcRs1/t
         DOOJd9llwKtk74yGHxasrTsSs5394ZAFtFJC+6R31hLG0j7kdtq9kKM71LIEJa+fLQHw
         dyDA==
X-Gm-Message-State: AFuF++kMOMA8XFd7kvKiMze2zkf5QQ9SLipKPOYt1egHFbJXi2VWO2ko
	bp4g2WgKsaMNMjMkV7cYp5b+JyBopepr59200K4blh7OtOcJZ4bt3JVy33SDlozJ
X-Gm-Gg: AR+sD10pZnmRcKrLnuAQWDtLn0tzl9/stt0PzU8MaIf1Vsbanr49xNf6KQe/tk4cynG
	gc97LHCNMTo2v8aRW9eSIx+1iq3NyopmEncTSR0DkVy1cs4hSlG/Pvz3i+LPIbke1TJr/9t4y2S
	cA+flbpoZa2J17eYGM9MKLBF+q507k1mDUO4CnpXr0cd4gUsI7PjvenqZWotg3XghyxdA6VbDXl
	zOBAb911YeHT+lIcjtWMx+MoRNXsbx/r9s/9kuMfWTLlSs//UevxRbCmQEqOntTcttRWz2Hqz18
	z+5CJVvjI2ENrTqZ7bFG8PLrDbrHKP+IPzJyCEVAP4cG9WdsFp0UttWdOOdf0OMw9aA+TJLtoW5
	xQxkROmENna4XBZ2eVWGdh7zaSLrDv9A6GoVDyGcmEpqH0YF8jhnX/oRU3XY5TPbWbx6i+I5zCw
	KSgDEGuFNmejJ+6Zc007C4bypMwvZ/iniflRkYzwQaMAHMQEfE/xG25UFNDhJ/UJ1aGD87Nh9cA
	FJTurW0U/dDg3eUJ7SZebGM+QrMpQA+DqnERWgS1w==
X-Received: by 2002:a05:6000:653:b0:482:fa3b:fab2 with SMTP id ffacd0b85a97d-482fa3bfcd5mr10965461f8f.19.1787933717144;
        Fri, 28 Aug 2026 09:15:17 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:16 -0700 (PDT)
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 07/15] media: atomisp: Add Yoga Book camera configuration
Date: Fri, 28 Aug 2026 18:14:49 +0200
Message-ID: <445158bc6dd99ea11806d68b6d1873a2d0bfdd92.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
2.53.0

