Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CDF4DA9BA
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160246; cv=none; b=Cnmlon1EZxv/wRTK5r9l3AAsRXwwdLF5V9a3p5+IyQMkpYdwIZ1YBNvHWiRhtboG3Et3ds3XN9UtqBgW8YXQHARwqhN0uIWxWpF15CTE7VLXi4yXkYU2yLfXJehliq7LomukGWFZKEqhzqgRryLbuIPYlJy7OpIFv0llT7dOr9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160246; c=relaxed/simple;
	bh=R0TsCSQgfViLedCAwCa46hdGet8t/BxKhHsStKEoP7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwDZLBEjTuqCR/DNFPTT7iNuv1hdCe2V7DEU2Qi8nCPHDD/HCaMNnTttXZXKLbvSde/i/1kJc/Dr9M2np0kdAfAzGDsVQF6cRSxvmDOeOMILh9x/ZZzrFui/kHUejvs6zYMBrOVW0d3XFmo8YjH+16SyrPpaudZi5ZTB4wBsSnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBImLtUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RH9+TWh5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBImLtUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RH9+TWh5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6RMm2494970
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocrGJ8z2EuP
	x1tBO9RRa6tVtwbknSUeunt4oaL5gV7M=; b=kBImLtUxD1mbzntOfAZBBoFUV7A
	jnlpA7LJ+EvI9Sfaknhq5LulHQ74hfVs3gRMP9kCjDJ62QvFAfPmuLRMCbPwczKq
	eWBSiJPYzM1NE5kHrPxDxlyQhgQX2OKlo0sgh3cl1e9yY65GZrIGwMZu8V1NGffz
	t6Bqxq2OfxJM3u4t1YAIdCFSjvPiw8iy42hRTiBN/L+3pTUudtJktjV6Al6qXkx/
	k4pdZa+w772Do0mxhJ+MwJLm+i9gL6hjaX6Z/4Jwhhts64BOBkeqoimnpN5Rejyk
	2VLfnfn/7HxjBaFTkinDqjk/PYgyUOJUauSGAz5ZLf69sHOM5ELGfQzXj0A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8b0de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e96da6516bso2043903e0c.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160242; x=1792765042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocrGJ8z2EuPx1tBO9RRa6tVtwbknSUeunt4oaL5gV7M=;
        b=RH9+TWh5y7L+rVaI4i4ppdOOil4K59gbw4Cp2W93/PkDW3hDMQLIWkWmPuOuBSTzyp
         PBz5iAcvOP8xdlNx7eicGZwqkkKx2hMqOoOQy6VFeHQOII5vnYdThKHbSajbbal5WYzc
         75XAeiR3j9iHGBfIKjxSZ3AuNom+FE9Rxru+nL0MgIsouQ3Ag+1fzzIuAwm5q+/l6k3K
         KqOTglHbUvgSveLzKhu+Sii4XhepqZYA7UVEcmq/zpz++LLY8xWyM4Vunz0DMS4jkfh3
         WHce9kSyONfMRlkoyE/l2/OSrcaFHN6u2BVQssqx/n6NTZQUi5B7WiK7pmMDivNRzLOs
         1Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160242; x=1792765042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocrGJ8z2EuPx1tBO9RRa6tVtwbknSUeunt4oaL5gV7M=;
        b=VRVgcr6v2Va4AfT69JUi2njsJOD9x4e0q3Avr65EpvjUSRbNKyO9g+rL4BDo37niuS
         L4L0YLh7wuikMZBPH6TGAa9+AP4d3oC7kFUzCxuDpsxsPe7muBXHjijb0lIpG/I+6EQR
         JSPRUwglDdTTGeE5ZSCmtNq7KosnMC3tofy4GsGoGbNvyS9Hqh8hDjRvfaoLznze/Bqt
         MqbgxrnHQfyL3i3gg5sP5U7ImFf4UeT/7uZWv/pEDjobAa3OzygfY7cXYXRS5Ip3hFU9
         AE6aUn++uuCRrjxIFP0k/utV0ecvuOsuLn58RJg13jjU/JiquzGJss+GQj8K43TrSUPL
         W3kA==
X-Forwarded-Encrypted: i=1; AKwUvBx7aL9rHGpV2fqNh0PriJow8bRM9VnJxSsZzfaxiKmF3azw9aiZgnEEH4B24UroThMthbb1UCQ4FJux+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYI9vtFc3klawZABwl2FoBIAlBZzmW1yULkHboXXl1MKHk4HlC07
	/iBmnnl7l9YbXpXBZ64RigCz+S0QMXeYVqrFTzavq6HWfnFgn8Sca1YSOiHcjIVAsBLyZMImKa1
	Vtib46WU2ZZpPi+xDFkJAaFOBb1qGghUI1qMUPQjmo9I9jsUxu37hZJ7bytbMI4GzhQ==
X-Gm-Gg: AYBFou1Nbx7HyqN0w/NkUvtPhEcVadyO+V9q5MDWKoTayXvSjaoJLjUeT18Wc0OdCjN
	jFV5pphIZJTABH1nHcHah4hCFdXvUjbF+FtLjzHqNVPoh8Vybqe0mjkV5r87LSIuBrlaVKKRPrh
	4oOsS3aANL/0X98R2e81QeGGKuxH+PLtMi9ecLyYfR/OMUfMgvUHkyqc/u2c7aLMGAze2U5S+Fy
	n1H3S1kStaF+zWspmTZYU4bZTTOOi7NhTI00Gj7HHiRLgBa/yLsNZ+qvqywK+7XAS7OZxHjqKud
	DmhMECVGPtwqyFCNFSTjrss/5cfVmWhCzb/8YEHrxA/LSxNlI5n/HKbVDdTlUZ45w4CII2v86sk
	egKJYMJUhlh06Ot29ZOakyeVhkWUvBqhPPpLAkXl4vXIj15B7xPwUHJkzHsD1+MGzVe7g4Cy7eS
	kVIDHbvirwIBP1gg==
X-Received: by 2002:a05:6122:4893:b0:5e9:6d96:b6d9 with SMTP id 71dfb90a1353d-5eaaabc20a8mr55959e0c.20.1792160241956;
        Fri, 16 Oct 2026 07:17:21 -0700 (PDT)
X-Received: by 2002:a05:6122:4893:b0:5e9:6d96:b6d9 with SMTP id 71dfb90a1353d-5eaaabc20a8mr55932e0c.20.1792160241505;
        Fri, 16 Oct 2026 07:17:21 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:20 -0700 (PDT)
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
Subject: [PATCH 2/5] platform/x86: int3472: Rename DOVDD GPIO type to AVDD
Date: Fri, 16 Oct 2026 16:17:13 +0200
Message-ID: <20261016141716.130220-3-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX7WioIOhAdlX5
 TupdHl0fvqEQAjy28PFHZ+F3OmGUzvJiu1/ro7g7f1yPQ9DM7CKROs0yDaUwZkJwD5xFbtQP2TG
 lKHQ/XVGzXCESzh/1HbIjQ2gCkP3FYY=
X-Proofpoint-ORIG-GUID: Njpgm6qm_o-AMGFuotNHlEw7OTUhZ118
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad231f2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=5k0iGRGwmvYjmk2vAgYA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX9EhqgIHGn/YK
 Pq6BtW0LIBA14vYXnPNt2wNv7xKZCgIbsNZg3Uh23VdoP4b54Y9OqjOoWso/pWAFR3CgggkXzVK
 0zBxQFnKVPJuY5pxO3TEJzXHVVxWjD1mFShZj+0Ww5JV3qF5kSLMjmp7OAU8ob77UBCIKWAjMNm
 vyIFBrYxkyvp0vm9MSqdC/8F7+aOr2aNXyw+6YN17LE3Q65vP6k4dCk5+L5xIyowXYcLbD9yuMA
 RUCI9X5I7oWA6WpX9TUnVByBoeXp1euwGPeest3Z4XZ8DmPSomImhAbIkfMo3AnbQfeyX2CA5vd
 VUfOiw7+GjBc63bkfBWH6UwrAREW3SYmE9ZlZOgnqIpx2Sz4gUhh1pgz1uJPcNen5TqqbRQbQXu
 uD20wFPME1U2gptMMOja6+gOYL9zTSdBzFWYT634vZQZf9rFDnLtXOp/VkP6W1QPySNh9ARgWfF
 P3+H10sclcDfFw18o4Q==
X-Proofpoint-GUID: Njpgm6qm_o-AMGFuotNHlEw7OTUhZ118
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

The window drivers call GPIO type 0x10 AVDD not DOVDD, rename
the INT3472_GPIO_TYPE_DOVDD define to INT3472_GPIO_TYPE_AVDD to match.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 7 ++++---
 include/linux/platform_data/x86/int3472.h     | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b19ea6ee3374..f3d6c6ccad0d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -277,7 +277,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
-	case INT3472_GPIO_TYPE_DOVDD:
+	case INT3472_GPIO_TYPE_AVDD:
+		/* Should be avdd kept as dovdd for now to avoid regressions */
 		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
@@ -402,7 +403,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_POWER1:
-	case INT3472_GPIO_TYPE_DOVDD:
+	case INT3472_GPIO_TYPE_AVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio))
@@ -429,7 +430,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
-		case INT3472_GPIO_TYPE_DOVDD:
+		case INT3472_GPIO_TYPE_AVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b1040e36deb8..e1d5c4915ef7 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -30,7 +30,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
-#define INT3472_GPIO_TYPE_DOVDD					0x10
+#define INT3472_GPIO_TYPE_AVDD					0x10
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
-- 
2.55.0

