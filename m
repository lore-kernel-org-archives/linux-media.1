Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755924E432E
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160246; cv=none; b=QNb6BSs54Xl77K+rx6Cx3N6YAKKMP14hbROpv07MBLN8nU3ZZKMOuXD16IZGNyXXKYbcCOVHceUFsI5B9nNDm2ZShBs+FE+SsE2MPQ/aVGSRJLaQdPecHcnuBf3YQMYa1lkZu5rSLHzM9Hj6zjk7b/1dSa7tAim9fdcIA4yU214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160246; c=relaxed/simple;
	bh=BTAi3fbJSRwJQk5klyMMAeNzipYn8jLNqlUNA1g/E4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAXfzKcq+nl2UEpwcnCXGO5ODE6dKZ79Ht0xczlHzY0MLcol4MUyHBQ/OZOMTLwtYgX2sIjjo9yCHfZoOKnU9fuCk1hfsWhe2brj0brajKpNF96EDbyfmIxXgpXDhJNkr+dmDu1JsNLH/pNis1Gd+rd/p4El3/3CfiFH73HqUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFyF3oUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cK/KoT0M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFyF3oUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cK/KoT0M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5rtZ3577687
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lq1fyb46CPH
	Gh446aXhfkskJVnPuzZFSJm7kdyKB/2s=; b=SFyF3oUrwB+QVvj7zXdJ72pkOFZ
	ZwR40Y0/ytsmDt2fKeOEYVJ0ET5soHNbHW1kviADPRPbrOCXsh3OubkZCkZZ2UVt
	5tYWUibwx+VwYTaOfhmuxXVl5DL/KisaPEM3Q1lTBpr3sKL4htJoYPCqNW2qKnp+
	u7UcBm/xy/6Zv5tljxBEdfLK3KxtBLx/zvaP8e62hdN4mPRntRodtzrnlKj4+Ckh
	jS4Njfu4mvj7JWwpOdLAmc5YXI1il6alWoDcoMDEF3IWOblt5frl+nZoNNdbjb2T
	Tv3fJH8Hl+3qaXwF9e0jELzztgYvICvKX8YuLHCKcOdLpxOcO5OdKW2Q+LQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262p4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso204848485a.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160244; x=1792765044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq1fyb46CPHGh446aXhfkskJVnPuzZFSJm7kdyKB/2s=;
        b=cK/KoT0MNhpwfRcT23DRy/AsntEN1+6fTqTeytrIhKlgjQBwFOPZ9u5k5TDeZPYNYl
         EewwPgKE2qBscwYjnoXhOBdysm3RQ5XCwj409jBPciD2X29TP08UpnHUJ3pWtDueL9ee
         4qIYJGUxAkpLoTbNzVt5NdD9CeqKOoOWgkMlrrYY2oB2C8RsbbrIHQzngTmdvOJI1QO3
         o+XpJ7/YjjsV07egoTzEdxDToxIbgMc5d8VYOjEJdijRXTH1wsd3wlZW4111dHZJ+Y0r
         319zbFe8HSVQqLGYiFhEzsrSZEflXDaU6hsX4z8xbcbfcGFAYqUzT0QmMMi9jOjjCxlA
         eXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160244; x=1792765044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq1fyb46CPHGh446aXhfkskJVnPuzZFSJm7kdyKB/2s=;
        b=2iTW5LwnaliwEsMfCboFtS3Blx+vszRnWd5kKMbYokZ3gnQ4J1aHNv+3ROI5qmjuyD
         IPfYlPY1CqDJojhqYNq7W2Nf9mUKECBD5o7NjxKi5TZlsruON8FRd4EKIGY0+vEnlWuR
         yRFFHQAS0mVGvPLkZa0tyZC5BUnFsGyZBZkut/U236paZ3BH6JBc6j3fy1+NRcH+BJqL
         pWJ5wEfKDxxDlXvoWpWEmeCXOoog+2kjYIgyQp8dV5/2ZeDai1xje9Tpv6EsxoU3zTL+
         3s3XMxM1y6Zx9vDOEXaYN5B7/klyrvaf9vzirwL2X7hoRHIbwSWGJs8PKTBdrJneAa6O
         6yMg==
X-Forwarded-Encrypted: i=1; AKwUvBzfuOIO/MR2NughRUuwlVJeU0J0zJ50K2NUA0qo4AiE3SU8cwy5wBrnu0+J8OYazWk2uplvbG6I7tZQRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8Hwvtaprnyozhx5a979VJcezlWvk13L6FexBPqDU9DoCYX6nH
	vGXMPBBfMu3o9gan2BTCGISzUWJ/sSu5n/r+9zVwSZn54UAw4sXaBSkhx9fht23CpOMSFB62pf0
	lDhyJkBe//lhKmjwOLFMec7O8trnCPR7NhLRHiv5XBpXY52u77a/uuSMM6Vv4ueHN/g==
X-Gm-Gg: AYBFou00BTp/B0n2Ednneco9KKG5dh6iy9/DRR41rGTjP+uYm22SFbqINFne2jimR4T
	Wx7ZvglFsng7ry8t3pDL0Z0Sz88t86d2p5M04FYf6Q/RhIYLfV7kGXRvsEmVvD+Yu/bw/dzMiq8
	ifoPWE2GkcqR0D0+b1oCxc1UHnTY1IZxWU0JE39OvFFKQjvtyLkrP2CDJlyD4uumC66g0X0JJGv
	vueHTr+5CWwsww08SWNKNb+NOwocsmlnLR8zB3F0Yiob5/Xre6Nixk2lKbJJ2R3MAFfb0K6B1AB
	qngWX1mxvDmf7GBSr7vaJNeG1Rhv8bwZbEm8vTJ4eH+acXUXaKub2Ze4z2Kz564ke+b1s+v8lbC
	j5tMXWUOfka+09JcU5fLTZeQHPxBlSVp+zbiA4yzjbTUYVgG0kPXTt9HnlOilEMsW3H7cKKTnQ2
	zZRYNR4e2wUebOAw==
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr555835185a.37.1792160243660;
        Fri, 16 Oct 2026 07:17:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr555825485a.37.1792160242972;
        Fri, 16 Oct 2026 07:17:22 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:22 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Alexander Patrakov <patrakov@gmail.com>,
        Leif Skunberg <diamondback@cohunt.app>,
        Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/5] platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
Date: Fri, 16 Oct 2026 16:17:14 +0200
Message-ID: <20261016141716.130220-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad231f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=1kVSyC6lAo2a8Bx00SMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX6xvDdHQ1nLq7
 OOsf8vamHIEOwalZ1QZSk7ButwqX/XBfJ49lec6cacUcdkhxa6VKBkovaUkIJwiumHntAH6s8HW
 ZvJUJcWnZLK9lCG839yKeqUlOhOAvgIofCI/Uq0EpgUMKFaBLPDHojkzcGLzqDU56q+xEkf6OaN
 rj1JESmSyDlLFiegaxkv2/U4BKpa9UsgaftMHDkrU7f1Fw/8fGmH4QRAqqoqMGfA3JHeFPPdRbF
 rlqy2rg5tTZOA4nMhKw8O9wvqhxLZmuI4QzTvhTRWO4Pub+ZcEZQ3EaO2LC79ZLrTVVb8umotLU
 FHBerNOcFDxRPksU0M6mHawYAOGjqy0dWtCeULHeOQzP3J4JzG6qucCYz06gQDWch2HvuGFuGr7
 sM6JGUNxAxSncoeobfTfeCGzVnQsVQ9iXfXCS72Okw7VXLEDw/U7z3/v/76BJvEMb6WGZSe8QHQ
 Vqh/+8kr6L6dojwypEQ==
X-Proofpoint-ORIG-GUID: 0e3hZTSS1R4FyTNWOpG0xWXr3G_Shbvf
X-Proofpoint-GUID: 0e3hZTSS1R4FyTNWOpG0xWXr3G_Shbvf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXydTzdTcbXkdL
 g3EtxXp4yJG68CA0y0aW3VcHb0twlvmdOVIIS71XXP6/IZ3tNIHwpT8shoZCk0JTMvqI3Dc00RS
 n/xS/JgTy3QZVA+J5or+s2AwGO90QjM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Add defines for INT3472_GPIO_TYPE_DOVDD (type 0x0f) and
INT3472_GPIO_TYPE_DVDD (type 0x11) and map them to regulators with
matching names.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 12 ++++++++++++
 include/linux/platform_data/x86/int3472.h     |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index f3d6c6ccad0d..046f93ed1c9f 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -277,11 +277,19 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DOVDD:
+		*con_id = "dovdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_AVDD:
 		/* Should be avdd kept as dovdd for now to avoid regressions */
 		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DVDD:
+		*con_id = "dvdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -403,7 +411,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_POWER1:
+	case INT3472_GPIO_TYPE_DOVDD:
 	case INT3472_GPIO_TYPE_AVDD:
+	case INT3472_GPIO_TYPE_DVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio))
@@ -430,7 +440,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
+		case INT3472_GPIO_TYPE_DOVDD:
 		case INT3472_GPIO_TYPE_AVDD:
+		case INT3472_GPIO_TYPE_DVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index e1d5c4915ef7..f0ec2e7c68fa 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -30,7 +30,9 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_DOVDD					0x0f
 #define INT3472_GPIO_TYPE_AVDD					0x10
+#define INT3472_GPIO_TYPE_DVDD					0x11
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
-- 
2.55.0

