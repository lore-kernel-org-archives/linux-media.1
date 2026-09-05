Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621F523E25B
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 03:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577498; cv=none; b=RcFs6s09VFM05TXREBmqCyR8ePAXwnS05N+NgppcZ5bO9SzuL+2/xtFZyFmBo9AqPesIQp9dezY0zC1DlrL9Hhpigkeo5PVfxlhSq+kj+11yStsP+RabjGMh0YvwxJWfGnH7igPe+6CbCg4+d+Jiff0N7bvdmm+93rtYeElTCBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577498; c=relaxed/simple;
	bh=uJPPIj6KHCIR9rjchDUmz3N0qO2wD9Mw/wYTDNNQsj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJVGcTXsN0wj91kW3AI9QWJ38FwefEUiHRERGCFJXDBGQdCLK9QwaRF+heCqzPdT/FG7HRoTcr3vQQ1zHpt7hzPdmtALEyh6ran2VwMgsodzhn2Cga8GaGDKH44xpTDMmGzORpU+ETDbeM5uwefG1OQ+fVcKauJMiconDw7ZFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmcK4Sqj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmcK4Sqj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d032846c95so18072075ad.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 20:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577497; x=1789182297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFqS6bUL031SXJAVQUoeuKgNEuuJ/tZOFfd1PDcVQXk=;
        b=QmcK4Sqj4vHSjoMpmH96YJ/jDFvQXuWHDLBhqG/Ol1fQampZJ7FXcybap9y7ENE1Ap
         +08S1q6pamj3alEzB4+c690InNGuv65h/W2nJRXZej0Ek9loNJyB3Q/1MsSMIgLO9/wJ
         MkHF+9S63cb8A46MrCR1MRvGYrleit6gw91vjLnjzJbfvLGBYpTmC+AwdRZdskXgl01K
         PUq+0NCWYHwuKsMiCrycNSEjMOSOhClEjxJas7mJYMsmGmRv9FkDiPpF+GbBhD28nlDN
         UN8fCmVNzRbSEReXsREoHzg7ZaMcvv0HhtmwJkf2Nx2L2bBWx3P5HGx2WIqG0HIq6CiO
         nfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577497; x=1789182297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFqS6bUL031SXJAVQUoeuKgNEuuJ/tZOFfd1PDcVQXk=;
        b=H33BzR8rJLOCsJcjvgJmQ4zs4pPJGaZL/VOgoQZk3UGRhmvoI8KaJeueegwEJrdOc/
         QE0kLleeotA+iT6z492wU/DwM67+Nmh9gfyQSzhrVy6P2/seKWcFOF088tdfXtBwevjU
         0vQrtL3IymZODXoFnDlNDea/WhROmhgDT65UFidf/9ei50n0mDra48TQ8zCkv3/EAkkl
         5DyxRNMvILa/VMfmmDVuwTyMHw+dH0oDnJD7plIEoLBceh/ow7gfOXPn0cP1aKVBjU/X
         nbEivl5AZrj/IskPJ4RUCd7dkNoI4KwOe1PIV4uxvzu4gYpkYfQw5WlbDRf8BtQozDgw
         j/bw==
X-Gm-Message-State: AFuF++mbhvuWN8LfZUoXr+p/ttDIiFBJu8Bk0M8CPWU3IMqUd0onmJUE
	+Cvks+1BI6W5Tn8TmW9Aq+ggAGN3TxhB5vDDGZhsHc+n0xoXLmGUV3k8wde0+K8970s=
X-Gm-Gg: AYBFou3xY1HllI9Fhae0EWR97nTBTVAmpHQ16InKsihma+dswZbTDSr0Wup7OYiP1qH
	kJ8Nch9WuPdxfS9qssVjXtnrhWSl+PmPDydr7l+dTb8lTtbC/dOtxEFQhiNO+QCcw1jb2pQwsLO
	yyyj5Ua4jWX8dkuk6IdFHp4wQj7zrkeTwBMjA9PZhczHPEtfh9NNbibd2N/yNQy5O+GHfQYOqjp
	B3VXtukHuEzGHxPjoR/H7emvd5Buus+nobInk8QJtOO3jBmo1VZrwP+JjKAx69G4PW/ESWY43Sz
	08jtFoxXl9BW8bHwcpVGfdjkqGBLsGo+1ruC/qQHBonP4zZHId8qN512gWVL2Yumz6vRZzuU5KY
	jdhLPJwiHPZAQnbmyTtQAjBpLI2pf/WZu9DVrNnCwGL+G4pYtIpY61X5/eF++GPRr6l2RlDQep6
	n3jWKPo2+QzHRegpo2sL6hfJbvD2/vW9c1A/KV0icICgI0J/42gaKrCQSY+UOT/3pi9Qj7P13sD
	TTgu2fWocO8AST92RA6BxVbkgevPZpK+1gm
X-Received: by 2002:a17:90b:3ccf:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39b26101277mr13184512a91.3.1788577496696;
        Fri, 04 Sep 2026 20:04:56 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm692182eec.8.2026.09.04.20.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:04:56 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor DMI quirk for Samsung Galaxy Book3 Ultra
Date: Sat,  5 Sep 2026 00:04:35 -0300
Message-ID: <20260905030435.38105-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Samsung Galaxy Book3 Ultra (960XFH) the OV02C10 sensor is mounted
upside-down. The 180 degree rotation is not described in the sensor's
ACPI data: both the SSDB and the _PLD report a rotation of 0 degrees, so
ipu_bridge_parse_rotation() assigns a "rotation" property of 0 to the
sensor fwnode and the image is rendered upside-down in userspace.

Because the SSDB degree field holds the valid value 0, the flipped
mounting goes unnoticed: the driver logs no warning and userspace (e.g.
libcamera) has no way to correct the image.

Add a DMI quirk entry for this laptop so that the sensor fwnode gets a
"rotation" property of 180 and userspace (e.g. libcamera) can
compensate.

Tested on the Galaxy Book3 Ultra: with the sensor reporting
V4L2_CID_CAMERA_SENSOR_ROTATION = 180 (verified with an equivalent
local sensor-driver quirk), libcamera renders the image upright.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..165f3c612 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -192,6 +192,14 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02E1",
 	},
+	{
+		/* Samsung Galaxy Book3 Ultra */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "960XFH"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.55.0

