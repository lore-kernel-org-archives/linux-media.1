Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1953139A05D
	for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788004724; cv=none; b=Rdl8YdB9YqDSKtm9EXN4T/gtf74SBjyGaPt//3oSIHb+b+U41bJaqSWQNTcwm8ub8muqLo11bS5Uvnpo5+NsM6alMer1EuJFXXNWP4H5WQPx0JLm1pa/klHzjURWzo5VhCCrw1g0f88homPBeWbJDN7nk+IIicolq5C/kqlM3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788004724; c=relaxed/simple;
	bh=eIXDrzxDlq49pE2fcf2vzbdsd3Koi4r1FzVnUcQ5K+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPugwku4UKmOPlAJ6VMPohAcWliRlL6MhD5tFMGZUvdOCwuXNT2Jg7qy6cB6Km9zOvVHPX2DgWGKBNwyKtNdP38tuGQe8QaHM8q/frrC6o6RDul7gKcptvqsIUEDnk+1LEYZ3jEO8znoV/ImOcTx+ZdbKac7Cn+wCkC923xS+N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+7cWGFE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+7cWGFE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso5753445e9.0
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788004720; x=1788609520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUONAbsac9yqqFRFu6bWfUs5ayDN0YKRiZQdTwHdCRY=;
        b=Z+7cWGFECmXf74ixlh+M6PgvbBtHIsApp+/Ir7wbuFe/BDM7J5r5FB8lOmdaMZJbNX
         JrdwdtPO+JYfWHSFLdxv9qN+YAFak2Qsh9ATTE0mUmNdzYvpZaEnTeAbCttgi+Gwz13e
         Rcu7+TdoHzPMHLj2WSN9xZqsO1L7gx1jUIn4Ywwc4rm3DLXmlUTE+thbW8kSRQkl1FE/
         ZOiu49PWTC5ZNKdyy5ygFYQMl860piUHTszhvq5mCvbvVNdJ7UOv8rPdBcEQ3UG2J3Nb
         0ps5RCQdSpj6BXM7G/edWc+EM7+SEzIzK/+91O/QVAZQWrwFF6ZWCczyl0xWg+2iKovZ
         bBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788004720; x=1788609520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUONAbsac9yqqFRFu6bWfUs5ayDN0YKRiZQdTwHdCRY=;
        b=G/6QpIUYxMxo8uBnPofgyxyaaSvuaboZbcBIMVIBQJsIWsCg03IC6QDu2IWQjpfwvl
         eBXZ9t8TsonDIoz2dgn+qBT7VGpjQg/VsViZ0yWn7CRCCjzd0eQu7NIQ4oq6sY603ueA
         bMsozPtpTLdrwPdhvJ8TIlImyRYvGOpjDes0GHtgLFzx02hftWU4Sry+X6Sxf9LuSuAc
         ilPrheOvaafHQYIFa6AgMiyIAbQjuO9Sww5cT8KrFhzChfnLbQkcob7LsUyZeW39HFi4
         4FEu0C91UCdzdWRnrL3Xla75sKUZ+ltNJvLbIyQei2ijXSRC/ChI6N1dWFJSDZv//h1B
         eAWg==
X-Gm-Message-State: AFuF++kGWFI9zjgv2siZWWGN4WahmYSHhPQ5xiqxzeNffyvRy+dZUqbk
	uk6oTjQy1DUO2ymCTSxt8KrO86HCqXJmoyU2hZJFcvpLn6OaCaIVHsF/dqvbfQWiybY=
X-Gm-Gg: AR+sD10lbeyf5gUCaeL+w5g5pkLPqFk3nhlo+cfj0HNUTS3/70PHhV982/NPwAi/NKN
	S1SUdo0nzLrCQMGl5McY4PWcWAIiHhhGkumeFrQExNE8h7tQ9WmL//NGYACoO1O0C8Q0QTV+oZU
	hTm/ezSg809x5ZQ1o3mUFAcuOeDyHTZFQAp0aNVRN2OEDgoG7tUNr4aQ/W8SHN3l7Xe7TKiWMOE
	ZXWdVG6KHNgL2+QPww6VcXbAcl2MSeBao4stSFV5FZDsFO9RyGS3h6MYJZdIEFdqvaAs+qTF28V
	IZwfGdLfUdt58kgMg6+ZTRcVFLU0GxSX7I9l5qQKN7yAFxWM9I613J1qKw4r90k1+nGinJgnFyh
	IXaCdHrkJ8hOwaZoSZQitAkVu7i2tdzPjbRxqhSInDOTo1oXVjWZBJKP4K5roypFIzlCXTU/6m4
	Yoi1ssSheHNiX1cjrq44KSbPwz5xrFpH07JYQ4mRnMjfDxWV+cQJU9GyvOsz5pSGhCXFdZ8II14
	wMftQ6I4+KeNJd2WTZ1zcF1E+s+UBmS1KIxmWOkbdxbx2Ys04GWo1ZyE66y4+DWD8HYK2Yu7Lbr
	DT4HuM/k/N3SVGM=
X-Received: by 2002:a05:600c:c170:b0:499:afe2:e4d0 with SMTP id 5b1f17b1804b1-49b91c2930dmr220010665e9.8.1788004720135;
        Sat, 29 Aug 2026 04:58:40 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm111107945e9.0.2026.08.29.04.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:58:39 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v3 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Sat, 29 Aug 2026 13:58:32 +0200
Message-ID: <20260829115832.8749-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829115832.8749-1-robertbozik@gmail.com>
References: <20260829115832.8749-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v3:
- Comment above the entry cut down to the sensor name; where the link
  frequency comes from is documented in the driver instead.

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..385400a58 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV32C4 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

