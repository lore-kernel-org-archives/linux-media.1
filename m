Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D24CEE4F
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160255; cv=none; b=m/aVMLZ0Q6xcbSlGrw4Ga/m0b7tNZ40diz25i5V71xCQJZf2wQqLOlU5UhUclZ2elcR5t+RmZlkSM5km5mr8D2R7e7DZNAQH7r2tS23uLF2At6Kl0PtJL9aukelZsYl2a1FoR2Br0JiWHgjycIqRDhwL3xXY9U6fEW2QJQ7uy0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160255; c=relaxed/simple;
	bh=LVKOPRuCzVWnPVKOjlQ5krdoUfYQA26Ypuz73aH1I3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mINFuLb5DZ0VBth5thwHImbcneZoHeQ/5iUOHkKqwAUv3jxTWLgaIIewjHAbjAZ28ciLaEM6brsMdJbnSrXB52V+vDp608g9shx2+LHhhVuac0FMcznEPrvVI2foHWW9/ji/Waep/vKOvpoZkZ5UXLqGHT6t4nmu/X9CtdmdR8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhRgSH58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNkA7EbH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhRgSH58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNkA7EbH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5xXW1613823
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K7c1cjWlvx7
	7hMthCUuJ59q+Owv075/iXXKxX2RilHc=; b=UhRgSH589gmMHkAZ8HiStbAmI10
	jodW7qFPILHaxasb8E0K+0PC/duCNdn0mJ2L9ctTz1I4IJiLY78pcKMzidhmnjsU
	ATbPpgC7lH/2PO8JMkPY1p8kp9/degNU6iz+vaq5aHCg16W8zCcwK/EtEheR4VqW
	MU71XPc2rC8xJa9tpx9/qlO8St+R54vrIWaGoroHwBMmS9UdjH08enYxH8y+taIw
	7CiYJDxp+GZNT5K7fskKvModY0IyMFIJBoD9UUSTfiKsMu04HnlAmnZi4jTlFsWS
	lU1KzPkFb7G+utMBofEaH9MK6wKQWegWOgpZaD7c4Kz8Q9i2nLXtkXJ3uOQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v0jmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e9b3a3b849so2042668e0c.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160252; x=1792765052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7c1cjWlvx77hMthCUuJ59q+Owv075/iXXKxX2RilHc=;
        b=ZNkA7EbHZlDHs2fNjl19KrLnP4rsfZUNkeeDUkXnqpU6qgJHgpAr25REdBFThrjPMw
         H2RtDNgiFsvkXySez0pL6RdzBK/WzYK33cxdHfStfQwJ2GtX/sRJaFJg7y/Rz3JXmNs1
         syNjoObC7cQ8WA2l3w65agH4L/6N+IB271A1AmkQq3CW+AmXnVGrFXGpv46xeZEopr/E
         utZJMmSbt8XGn1aP8k512a2Zw602WySPR4MgIz2Pu1zNV0LPEZqeLmOgMLGogYZzmf4n
         x+SwMzbW5gx0/O/HVjF0nAuRrnxRUvcdyuHNl30OXK/zqto5Z4bbXjZ91T1wNPDCD0oL
         nM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160252; x=1792765052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7c1cjWlvx77hMthCUuJ59q+Owv075/iXXKxX2RilHc=;
        b=Urm+2gRmT8ktECMccJCp6c1uIPx3FTSqaj2/mDjlTyenN18LMqGGoakf7VWHDpREtl
         ur6KK+xr1O8P4K+7yoUPjJOZOtOCCBxvQLyNp2XYddSY5tzNR1sa+Aeyx5zrexnj6HKP
         9u4iKjdkrJqeZieXoEGXUAxWKuoP2zcQcET2KxEcTXPym3OAX7IvOAb/ItgsYP/EzeXH
         sQxqlQ/clzbZysPtVIuwkgr0sjCVlczZRe/Qr6+k4gA+Guc3cpKTmF/kH/F7A/uilYLi
         NjrWZ8VGV6S/oxcnlWYESFjHaWXveigTnWkQyzBb6QBdoEnay5boyexTxt0h2PXm+WSZ
         WgFg==
X-Forwarded-Encrypted: i=1; AKwUvBzGv4oklXw0RBrI2qx0DeTcSedk/a8CwxUJ9qxWQbiDtuuFjqSVSea/7w0CYlhGM2gRhYEMcRirMlXygw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7Kxkj9uLyAQi37jSd0n23kB5Tnc/H2I/868xKAE2u5TapCQIb
	d66tYcQ9UPHe4ZKqAHIAo5XOmRBnRERHyoVplOqGHkUM3+xZiT0yoL48pLLeMd7tFkijitcLt1p
	AE/XgaGEDgczJzwskEnj98mKko/CWfvdjiMB4ELT3haQ04/YA0+f8hVfqWH2dZn/thA==
X-Gm-Gg: AYBFou1f0OpQjPv7ij1MZLxGGcks99KFEhLQH2pf8XPYGKT+bDb7zkBRYghzm5dr/hU
	r/VR7gMar1+zeFGWWfALaW4SFpKC3Knb8bBO5MAk4L3rm/xpR27YgvO9i1DLf8r85EtQEXEB3Qt
	8Zn/IW+umzBjaSvRl7ZfaI9IQOxkzApqPgLo7c9LSmkd38EsUjcekJW5kxcYPgqrSvo2W/x/wFT
	BIh46MkS73RpfP/JcBN2gmeL1r2cqXR5USEkn6gv2AcgJuCvDENf63F9iiOER1jNw9trl0jq+PG
	TzMgR7WuRsZWJF0pV5CxPhRgI0Bumi4wcOiXRgWZHTo9sG+lJCOxQ/GBDMm+YjFN994jmm6J/6E
	7GJQyad2JUFwKIMnUf49GMAOcTDTnj+VUGnJxH5DQ/dUljkSBiyoxIOskzRLgI1NJPnwOIxrxAl
	vdRAQg4dV99RZN0A==
X-Received: by 2002:a05:6122:35c9:b0:5e0:7a01:c83 with SMTP id 71dfb90a1353d-5eaaa627408mr62788e0c.14.1792160252145;
        Fri, 16 Oct 2026 07:17:32 -0700 (PDT)
X-Received: by 2002:a05:6122:35c9:b0:5e0:7a01:c83 with SMTP id 71dfb90a1353d-5eaaa627408mr62747e0c.14.1792160250315;
        Fri, 16 Oct 2026 07:17:30 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:23 -0700 (PDT)
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
Subject: [PATCH 4/5] platform/x86: int3472: Rename avdd_second_sensor to power_enable_second_sensor
Date: Fri, 16 Oct 2026 16:17:15 +0200
Message-ID: <20261016141716.130220-5-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-GUID: VQkFR9-sNDEGVZnLbdfbwC5Px1YgUVSk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX+bcNJUZzXEna
 /Pvv0nUVySCKB7PdyqtccuM8/M9B4nhwRkJht/bjgeaaI9kENJtC2st87MdJBx0cIYjkabtrWia
 etqnHdT2ayjYEEvEB0ZSoh6f+x8Efb8=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad231fd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=m6U5Mi7_xXUadIKIrwgA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX5IHJWmwwT2AJ
 oZQEqJcqkUkKgbINHldlgaWst5MgakMlbTu74J4gva58AlUHn20MrunVIO7ls8d66UzjRzOqTi8
 SL2JifCbcXhIrqyad8y5ph26olObDB8VOIkKiD+zCPfDpkMrqn/2ayidXAU8vPVfyi3V4Rv4hLi
 ay6Li1fm5gIvjpWy8mAfBnGsI0qjSPnEpB6K0UaYKgAJfMGSqVRo+6dl7HU8RW8wqSXv/RZxn6O
 rX/S5H54tsqg1Q2JYgCGHA3W0gTbnI6xefHFDlzBTp46mtY12MnALxKUAYUXKv5Zx9m2rMnIZRl
 r9NxezAVKTZGXEoL3i7P1tYYBXllsBn2AVTX6vXY0r574XcY9CPu8yFUiAgHoGInj2NOqYXTZCJ
 YeuXUb5s/JRY0hI+3RW0C/6tuioU/lSR1qDvCv+5IENKtl3E2/BPZcvnvJf3B2rEGhdiyzvJCRq
 9YQjkpOhFjixDfIwlBA==
X-Proofpoint-ORIG-GUID: VQkFR9-sNDEGVZnLbdfbwC5Px1YgUVSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

The avdd_second_sensor quirk is for when a GPIO with the power-enable type
is shared between sensors. Sofar power-enable happened to be mapped to
a "avdd" regulator. But that is going to change in future patches, rename
the quirk to better reflect what it actually is for.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c        | 2 +-
 drivers/platform/x86/intel/int3472/discrete_quirks.c | 2 +-
 include/linux/platform_data/x86/int3472.h            | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 046f93ed1c9f..18649ee448a4 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -437,7 +437,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			second_sensor = int3472->quirks.avdd_second_sensor;
+			second_sensor = int3472->quirks.power_enable_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
 		case INT3472_GPIO_TYPE_DOVDD:
diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
index 552869ef91ab..4e57d3f73111 100644
--- a/drivers/platform/x86/intel/int3472/discrete_quirks.c
+++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
@@ -5,7 +5,7 @@
 #include <linux/platform_data/x86/int3472.h>
 
 static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
-	.avdd_second_sensor = "i2c-OVTI2680:00",
+	.power_enable_second_sensor = "i2c-OVTI2680:00",
 };
 
 const struct dmi_system_id skl_int3472_discrete_quirks[] = {
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index f0ec2e7c68fa..86b7510d5a45 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -98,8 +98,8 @@ struct int3472_cldb {
 };
 
 struct int3472_discrete_quirks {
-	/* For models where AVDD GPIO is shared between sensors */
-	const char *avdd_second_sensor;
+	/* For models where power-enable GPIO is shared between sensors */
+	const char *power_enable_second_sensor;
 };
 
 struct int3472_gpio_regulator {
-- 
2.55.0

