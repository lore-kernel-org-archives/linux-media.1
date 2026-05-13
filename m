Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE13D47BC;
	Wed, 13 May 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656692; cv=none; b=DC4neKGrBojCcyJQSb2adxuFg1UnYZpJ8O2rQ5jQQC/folIo6TN6bnpghMdxbBPro4KSJ84J2ySvSsyPAOOB7riqz/Ukc6Zwm9jbsbyPuWlESeNGpJ+awxWWr0OETsZDMnQ9E9897aLwPZ6feK7TuwXO2XD79K5W870AWyecy3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656692; c=relaxed/simple;
	bh=WqY41+TA/Cu2ZBpBlhUCQyjQZQR/yf4ZUqVaZ6BEAco=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s2Ld8Rc4qSidufyNka5eIVm5CsKfv31B2mr3N2Iq/cFi0GVkinAo7+GNid7BN2rwFZ05ANA5NRE7E+hZUQJIfwb5dlMm7HOnlovJdoUbNDA9fMgwN9s62imwYGH1ZQtK2p7EZEnDswsiiuS8Yo4oKxADer6HVQoxc8S6pyMVrrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=aEk+X2mg; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="aEk+X2mg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656688; x=1810192688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WqY41+TA/Cu2ZBpBlhUCQyjQZQR/yf4ZUqVaZ6BEAco=;
  b=aEk+X2mg6gAH4ya6ddexXkM/BWRXIdF5DjpRDphdPvtVbA8ptkh1/8iX
   m8xEdapTvpCnezbQaENddr8Oe0Pvl2jV+KlkhjW9xrCzUi/kTKU6CawLs
   xN5uAAWJ1V3YIOUX4inYxuFrBd+t+3L1O2BIdCIkAgyuX+D1mL1C9s/hL
   3IwRuTQGFFWL+xV0Z61qRfAlIHeXb+4RY5T2DVupNvw3Wa7H31BmX+qM5
   aIPXE5ajBW/aGUlXX79JX6vIxh8xV2D2dLKLei7DGsMYMyNcmY/yOywZm
   kfqap+VYfk0F5wFM09lwFqe/pAAntjUDCdTLu+VIXQE+g1TValXrdQB7N
   w==;
X-CSE-ConnectionGUID: oa9dgZfKSwWKc4464C1eKA==
X-CSE-MsgGUID: 00GrWWu3Q1eihsD1b/bOSA==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="56656520"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2026 00:18:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 13 May 2026 00:18:07 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:18:04 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	"Balamanikandan Gunasundar" <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 07/15] media: microchip-isc: configure DPC and pipeline for SAMA7G5
Date: Wed, 13 May 2026 12:47:34 +0530
Message-ID: <20260513071742.97263-8-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513071742.97263-1-balakrishnan.s@microchip.com>
References: <20260512154339.210444-1-balakrishnan.s@microchip.com>
 <20260513071742.97263-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Enable DPC_GDCENABLE for RGB output. Disable pipeline for raw Bayer
passthrough to provide unmodified sensor data for software ISP.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@micro=
chip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microch=
ip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c    | 7 ++-----
 drivers/media/platform/microchip/microchip-sama7g5-isc.c | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index f61a5d5a3e04..23a09ed12946 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -800,7 +800,7 @@ static int isc_try_configure_pipeline(struct isc_device=
 *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline =3D CFA_ENABLE |
 				WB_ENABLE | GAM_ENABLES | DPC_BLCENABLE |
-				CC_ENABLE;
+				DPC_GDCENABLE | CC_ENABLE;
 		} else {
 			isc->try_config.bits_pipeline =3D 0x0;
 		}
@@ -850,10 +850,7 @@ static int isc_try_configure_pipeline(struct isc_devic=
e *isc)
 		}
 		break;
 	default:
-		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code))
-			isc->try_config.bits_pipeline =3D WB_ENABLE | DPC_BLCENABLE;
-		else
-			isc->try_config.bits_pipeline =3D 0x0;
+		isc->try_config.bits_pipeline =3D 0x0;
 	}
=20
 	/* Tune the pipeline to product specific */
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index 4119cfe12cdf..04930aa0f289 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -59,7 +59,8 @@
 #define ISC_SAM9X7_MAX_SUPPORT_HEIGHT   1920
=20
 #define ISC_SAMA7G5_PIPELINE \
-	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
+	(DPC_DPCENABLE | DPC_GDCENABLE | DPC_BLCENABLE | \
+	WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
 	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
=20
 /* This is a list of the formats that the ISC can *output* */
--=20
2.34.1

