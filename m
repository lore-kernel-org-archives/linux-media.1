Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218316;
	b=z5eAOBZVg5RDLXjYsUjoKJMxrjS48VbkpNXAstcFeC8FTf9udP1Z04oPrTwnKY85/+Fg
	 S732crIFv0+DhdyAo9HvaqA8g06wbizuRlrFILS7HGu0+rFqeBzaf6skURgy4QMZc4oca
	 6tJJ1HUG8xqSEhPjNo/D39yVuX+3Uc4hjje96L1OM1E1jHvTLiHC1KBGTn7U5fYXUN91l
	 zyFPJcjVJVTkOFY3xERS0kzkp6gCTL43jsom1BcjOhTnbwvCes/T6gZlNhJ2U1dXAzGkB
	 SHthGgBDzQhCtMzHfn7xc9wuf4Al1JsBD2SYjSwmP56mGI8iOlKAQNpxXMWJ0Rh/auQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Rc2l4NhiVbNsYAKguNZDNfqyM+0RNSHLxFUsWz17xDM=;
	b=xYUgzlLo/avL99Xcka08agiogZKp4NV4xKHPhrg6nyQdhStsgx/fWYuttRmfhVVHOxy+
	 4CYqnXGN+t1NV2+PCVUS+XF2ff/Eko5/PtpdIwT/Sl4eDhBba0x/0Mem0qsSlOg01FSPj
	 yfAuoBGpksVcD5FjLadWdSZmN/j+/MJAGy3L8LzlHGrd/mSZ07gCX8exsLe5eX5P5sE8f
	 xykFpFG2sezZLELamKsWfW544Gmu2btEwf2NYOUABlCF7mK1ybUkNeasM3Lk3jTWPxGpn
	 TYklvdiLeVXPfSJGIhjI8QNv6HOgCgUtmcbmSI1cffkBv0v/0aYUAQRC6bY4K+OJEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esiVVdqS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mlqz0iG6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E260A2611
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73E260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esiVVdqS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mlqz0iG6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKJgbvJ2862797
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc2l4NhiVbNsYAKguNZDNfqyM+0RNSHLxFUsWz17xDM=; b=esiVVdqS0nNVURsr
	7IbCJqr8nt+vkMK0rOK0GHTVPfPC3wnruTKNxKphwtu7cCVfZ0/Skwr7Mq6HvJRd
	xchtLFSkwdmYkmaaH4+NGdxG8XdEkbduzSnNydZAeAn8e6+iNdaAc9D5YeO+p5Il
	RcdL3al1tYTtydBRS8jbtrMc6Ld8nNvmt73tSCpeHHM0rWxaWTI4TEP8agNGof8Z
	/k3xz2D/+6QbbmtW1yNZpdTLOw198NCGIGm+QZUncbvuFWDjUkkrYW0lk5gVKFT8
	j9JHUL1EdnpIQtMg/5hG3XF7OQHyL7jnteVZSabKltUIKsNFSa4E3Fj2Kh2POLeE
	Zkl2Jw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2vksgp10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso177983eec.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218312; x=1795823112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc2l4NhiVbNsYAKguNZDNfqyM+0RNSHLxFUsWz17xDM=;
        b=Mlqz0iG67TeXhO/mshAUhHvFKwVZ0J9974T3FMPSOtPcE+JH7ty8P94n6ApWpCSxkh
         GlB9Sa3gsKDu0DAHlLA0VlO/6cmETzr/ovsCHjRr2mkDjweG92FGRwVH4uet/IIFAIjP
         kceGdnDhHtqb2JDmJpRLMI9ObiXdeZEWhs7vWfRxXX3X1LWXc6hdpS1hFw2ugUwxKoK1
         4ZLwLiBtPl4OQeIyf9rJ8jdZdqqUV5GybRXT4JnowSWumIGuXwm7NJp3HGTrjhQNCdX6
         pvtI4RJ5y6ynCSoY5fsYg2FfArWFuEV/1rnwTjFOLonmsNgHFG3cYDlQbSB/DJe8untx
         1yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218312; x=1795823112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc2l4NhiVbNsYAKguNZDNfqyM+0RNSHLxFUsWz17xDM=;
        b=IwMHUg0zikLSGVRkX4CcPA5rYX2Upkphxv8yEva4KB2e/VW/wKt4wpxNAtR5DYkbOF
         Hj9I18+/Cn1qRUBbXhrU4Z13Aoti22JaARbMjtMXomyQnFuPdLrB+Xp19Iviqy3eHGRQ
         62UbFUo3bdayxm8UM9jXGeyYHyVcVFb9K4xwD/ve5UrhT5iPLoS/C4aDvOgsokAIpD5w
         7gwePYegUGTfP8ljkRB9Cu8eZipsWItWygNQq1JmqJPnxIlcbeMOYyl00jtiHibnktO2
         Zz4DTzhv1u+yBM0ezZSeV2xMKkFNzsGk1u2QEBbndCLopn+S8XlyImP9coxvAPZTid7t
         sBmQ==
X-Gm-Message-State: APuU4Z9ylVPahWgZS2nxbHUjdwuqqT+4lCL3f94p2gxHeY4v22iTR/Ax
	5pAohOKRBxmfglXPw2D/47wPsNh3CIoHywLqSK5ZJRPsCGg2Df8ZorAiFw/BLZlLXZLga8NRjI9
	bPorwTqlIB4gHIhyyAtYYlrPYVwxHh4qgU/4JydMSXxPm7ZjuacGndVsH453lCXSoVw==
X-Gm-Gg: AZFdTZdkVLnQEFTiO1MsqaPtEQ7NAvFkVprPKWthflq1863hau1c9tn+YCeO+oQEq7z
	c+FOFE8DKOPK96XPaavm4hIWjxLTmxB3K46cq0SI6igMhVWTJde4IHSdk4pMSrGloaEL4r5dCQj
	TF6lcN0xfKxm2NXs6R2IdafqnpXHj0IBjntmEk4ZQAuD2jFIwluQnOCriHglmSotyeputCqRHxp
	x3F6z3y0op20BoWpi+6FGvDhN424CLLIGs6LsPOgplNCceOQx6dTMchHnRgLNsq4+NQiM3ZTKBd
	LRipTWtUDghBGHb4N48zHhv+Lc0pTAJJCblQQzCRWCHdfI7b7yYYQFVRuMVPx1AS8jmGLE3YZax
	RKzvij+Wxop3tM5LoR7Qi1t/8OljxmW4PLjxkfcZ3+uHLMLbM4FsdEcQJ1he/AhZIJxeeWTvppb
	ZNTL/fcYgs6gS4BGAOVVD5978s2odZ9hbzUg==
X-Received: by 2002:a05:7300:caa:b0:385:4627:bd5e with SMTP id 5a478bee46e88-3856ec46bccmr9235216eec.2.1795218311882;
        Fri, 20 Nov 2026 15:45:11 -0800 (PST)
X-Received: by 2002:a05:7300:caa:b0:385:4627:bd5e with SMTP id 5a478bee46e88-3856ec46bccmr9235124eec.2.1795218311136;
        Fri, 20 Nov 2026 15:45:11 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:10 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:45:06 -0800
Subject: [PATCH v11 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
 for ROI delta QP
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enc_roi_enable-v11-5-c00b95ea1b81@oss.qualcomm.com>
References: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
In-Reply-To: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=13484;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=F3Z04TqkQ6B1gimk/+XFqezGBKHwYbEGxe2v80w+cW4=;
 b=JfCjTAbQ4QfIlr//wQ0/If1c+2TmSWU8hyQmBANCw+1/jsuxweb9E2KYOeHVZDyAhunLN15xt
 7ErI4KcGMljCFInNHBA68RflVmC+HJAPVEDFjA4s7l6+eSHUJ0nL+sy
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX3rxXqlWSiBA/
 QEXzW2eRE77+AdjnO00h9YglBDfuoYfzJiujKYDXGBf8U14XK9FJfL3nNRwvobRo/R33tlvYiSm
 q/MwtVVaHg4QNAc/jkeGUtZmOk5AfJt4B5V1zPT2rL3mtiWqmouZcWcbWHlxin/69Fmk5pRxWSP
 3JSJs78qn8FIUjisybja7yD06cJx52GEvMemLPkC3XKiooYbFJgh5p03coIAn5yKIUBLwmkKFit
 sveets8jYfS/Z6MhsDR3v5+AQGjqes1WcpkIY3qNiJAMHEVwOpJszCLrDaFyEaC+s3jlUpRVOY9
 vlm+3MuNch9nkPeTrlZ1n8T4B2VOOD1skUBKR5i5Vv3pF3EU13eUlyDFU5+mwDBBM4OW9jgHxdb
 uNMLdAt5/1pPbRyzLMqMTJsJKptrJyTeQ5n6NR5aiNCHyW9z0TAZhiniFxj+dg7LPuaxIu6ZZNM
 nzwI25umJtHHOTOceOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX3aADM2ipJsVM
 PQEHivpCv+joLfnT0etGsz7zN2LYjVjO9ytzDCD5uQKze4C7uI4DEUFi9PeREvBxsg70nnHNvAY
 2AETZgjF7jfPfkSPcIZ2vlu5vevwfAU=
X-Proofpoint-ORIG-GUID: FldbgKoMfIjTruOgpg3pxafCk55l2pIi
X-Authority-Analysis: v=2.4 cv=N7u8hG9B c=1 sm=1 tr=0 ts=6b00db89 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=s8F71vpxD9iY_bj2qIcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: FldbgKoMfIjTruOgpg3pxafCk55l2pIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200094

- Introduce BUF_ROIMB_DELTAQP as a new internal buffer type to carry
  per-macroblock ROI delta QP data to the firmware. This buffer is
  allocated on demand when the application sets ROI parameters via
  V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP, and is queued alongside each
  raw input buffer as an HFI_BUFFER_METADATA packet on HFI_PORT_RAW.

- The metadata buffer layout follows the firmware-defined metabuf_header
  and metapayload_header structures. The s8 per-MB delta QP values
  supplied by userspace are widened to s16 as required by the firmware.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |   4 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  28 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  24 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 8 files changed, 176 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..b51976b4c28e1e2e1cb1db508fc75950f8aa5bc2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -5,11 +5,13 @@
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <linux/slab.h>
 
 #include "iris_buffer.h"
 #include "iris_instance.h"
 #include "iris_power.h"
 #include "iris_vpu_buffer.h"
+#include "iris_hfi_gen2_defines.h"
 
 #define PIXELS_4K 4096
 #define MAX_WIDTH 4096
@@ -705,6 +707,20 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
 	return iris_destroy_internal_buffers(inst, plane, false);
 }
 
+int iris_destroy_roi_metadata_buffers(struct iris_inst *inst)
+{
+	struct iris_buffer *buf, *next;
+	struct iris_buffers *buffers;
+
+	if (inst->domain == ENCODER) {
+		buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			iris_destroy_internal_buffer(inst, buf);
+	}
+
+	return 0;
+}
+
 static int iris_release_internal_buffers(struct iris_inst *inst,
 					 enum iris_buffer_type buffer_type)
 {
@@ -928,3 +944,101 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	return 0;
 }
+
+static int iris_fill_roi_data(struct iris_inst *inst, struct iris_buffer *buffer)
+{
+	s8 *p_array = (s8 *)inst->fw_caps[ROI_PARAMS].p_array;
+	u32 payload_offset, lcu_width, lcu_height, row_size;
+	u32 array_size = inst->fw_caps[ROI_PARAMS].elems;
+	struct metabuf_header *mbuf_hdr = buffer->kvaddr;
+	struct metapayload_header *mbuf_payload_hdr;
+	s16 *p_16, *p_temp;
+
+	memset(mbuf_hdr, 0, sizeof(struct metabuf_header) +
+		sizeof(struct metapayload_header));
+	mbuf_hdr->count = 1;
+	mbuf_hdr->size = sizeof(struct metabuf_header) +
+			 sizeof(struct metapayload_header);
+	mbuf_hdr->version = BIT(16);
+	mbuf_hdr++;
+	mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr);
+	payload_offset = sizeof(struct metabuf_header) +
+			 sizeof(struct metapayload_header);
+
+	mbuf_payload_hdr->type = HFI_PROP_ROI_INFO;
+	mbuf_payload_hdr->version = BIT(16);
+	mbuf_payload_hdr->offset = ALIGN(payload_offset, 256);
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_width = DIV_ROUND_UP(inst->enc_raw_width, 32);
+		lcu_height = DIV_ROUND_UP(inst->enc_raw_height, 32);
+	} else {
+		lcu_width = DIV_ROUND_UP(inst->enc_raw_width, 16);
+		lcu_height = DIV_ROUND_UP(inst->enc_raw_height, 16);
+	}
+	/* Firmware expects each row to align to 8 LCU */
+	row_size = ALIGN(lcu_width, 8);
+	mbuf_payload_hdr->size = row_size * lcu_height * sizeof(s16) + 256;
+
+	if (array_size != (lcu_width * lcu_height))
+		return -EINVAL;
+
+	/* Firmware expects 2bytes of delta_Qp, int16_t */
+	p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
+	for (int j = 0; j < lcu_height; j++) {
+		p_temp = p_16 + j * row_size;
+		for (int i = 0; i < lcu_width; i++)
+			*p_temp++ = BIT(11) | ((p_array[j * lcu_width + i]
+						   & 0x3F) << 4);
+	}
+
+	return 0;
+}
+
+int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst)
+{
+	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+	struct iris_core *core = inst->core;
+	struct iris_buffer *buffer, *next;
+	bool found = false;
+	int ret = 0;
+
+	if (!buffers->size)
+		return 0;
+
+	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
+		if (buffer->attr & BUF_ATTR_DEQUEUED) {
+			buffer->attr &= ~BUF_ATTR_DEQUEUED;
+			list_move(&buffer->list, &buffers->list);
+			found = true;
+			break;
+		}
+	}
+	if (!found) {
+		buffer = kzalloc_obj(*buffer);
+		if (!buffer)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&buffer->list);
+		buffer->type = BUF_ROIMB_DELTAQP;
+		buffer->buffer_size = buffers->size;
+		buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE;
+
+		buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+						 &buffer->device_addr, GFP_KERNEL,
+						 buffer->dma_attrs);
+
+		if (!buffer->kvaddr) {
+			kfree(buffer);
+			return -ENOMEM;
+		}
+		list_add(&buffer->list, &buffers->list);
+	}
+
+	buffer = list_first_entry(&buffers->list, struct iris_buffer, list);
+	ret = iris_fill_roi_data(inst, buffer);
+	if (ret)
+		return ret;
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index ee2d24bb69c57220b0a735d9b4aae4434a33daf6..df9d018493f3ec37fd5e6b0ba049dba0b5ae76e9 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -28,6 +28,7 @@ struct iris_inst;
  * @BUF_SCRATCH_2: buffer to store encoding context data for HW
  * @BUF_VPSS: buffer to store VPSS context data for HW
  * @BUF_PARTIAL: buffer for AV1 IBC data
+ * @BUF_ROIMB_DELTAQP: metadata buffer for ROI MB DeltaQp
  * @BUF_TYPE_MAX: max buffer types
  */
 enum iris_buffer_type {
@@ -44,6 +45,7 @@ enum iris_buffer_type {
 	BUF_SCRATCH_2,
 	BUF_VPSS,
 	BUF_PARTIAL,
+	BUF_ROIMB_DELTAQP,
 	BUF_TYPE_MAX,
 };
 
@@ -139,5 +141,7 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
 void iris_vb2_queue_error(struct iris_inst *inst);
+int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst);
+int iris_destroy_roi_metadata_buffers(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8c02b4fec93b511d1d9bdd71a9038a7f7be5404f..91a3ec52d299e942fde18eafaf58ea6542afd0ec 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1720,3 +1720,31 @@ int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
+int iris_set_roi_params(struct iris_inst *inst, u32 plane)
+{
+	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+	u32 height = inst->enc_raw_height;
+	u32 width = inst->enc_raw_width;
+	u32 metadata_header_bytes = 256;
+	u32 lcu_height = 0;
+	u32 lcu_width = 0;
+	u32 lcu_size = 16;
+	u32 n_shift = 0;
+	u32 size = 0;
+
+	if (!inst->fw_caps[ROI_PARAMS].p_array)
+		return -EINVAL;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC)
+		lcu_size = 32;
+
+	n_shift = ilog2(lcu_size);
+	lcu_width = (width + (lcu_size - 1)) >> n_shift;
+	lcu_height = (height + (lcu_size - 1)) >> n_shift;
+	size = ALIGN(lcu_width, 8) * lcu_height * 2;
+	size += metadata_header_bytes;
+	buffers->size = ALIGN(size, 4096);
+
+	return iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index ef2c09485ad93719e4acc7f395899d7f67cb5b2d..d5fb33a8e2a19035a0ff5eb412ffb8167e6098f3 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -52,5 +52,6 @@ int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_c
 int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
+int iris_set_roi_params(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 0f4c6f955f4f408c45c50796332b47c116f52982..36d2517140ce67821962c200093a9887e5b6b392 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1822,6 +1822,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_ROI_INFO,
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
 			 CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_roi_params,
 	},
 	{
 		.cap_id = MB_SIZE,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index cf88dbe11e8e9faef826e661d8e9909fd7f16b94..a1b0c4982f0d789a807f22a1dffdf61decd20d28 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -134,6 +134,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
 		switch (buffer_type) {
 		case BUF_INPUT:
 		case BUF_VPSS:
+		case BUF_ROIMB_DELTAQP:
 			return HFI_PORT_RAW;
 		case BUF_OUTPUT:
 		case BUF_BIN:
@@ -1267,6 +1268,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 		return HFI_BUFFER_VPSS;
 	case BUF_PARTIAL:
 		return HFI_BUFFER_PARTIAL_DATA;
+	case BUF_ROIMB_DELTAQP:
+		return HFI_BUFFER_METADATA;
 	default:
 		return 0;
 	}
@@ -1328,6 +1331,7 @@ static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
 static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct iris_hfi_buffer hfi_meta_buffer;
 	struct iris_hfi_buffer hfi_buffer;
 	u32 port;
 	int ret;
@@ -1349,6 +1353,26 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 					     &hfi_buffer,
 					     sizeof(hfi_buffer));
 
+	/* check if any metadata buffer is available not queued, queue it */
+	if (port == HFI_PORT_RAW) {
+		buffer = iris_queue_metadata_buffers(inst, BUF_ROIMB_DELTAQP, buffer->index);
+		if (buffer) {
+			iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_meta_buffer);
+			port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
+			iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
+						    HFI_CMD_BUFFER,
+						    HFI_HOST_FLAGS_INTR_REQUIRED,
+						    HFI_PAYLOAD_STRUCTURE,
+						    port,
+						    inst->core->packet_id++,
+						    &hfi_meta_buffer,
+						    sizeof(hfi_meta_buffer));
+
+			buffer->attr |= BUF_ATTR_QUEUED;
+			buffer->attr &= ~BUF_ATTR_DEQUEUED;
+		}
+	}
+
 	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
 					inst_hfi_gen2->packet->size);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index ea1fc96077fdce83db9c6a6c1f753ec7978b0673..4f8f0b78f7b7559d985ea627f9a3224f36fb6f18 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -58,6 +58,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 		return BUF_PARTIAL;
 	case HFI_BUFFER_VPSS:
 		return BUF_VPSS;
+	case HFI_BUFFER_METADATA:
+		return BUF_ROIMB_DELTAQP;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..ba56aca5c0d102869dcf7ad6c050579283000cd7 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -199,6 +199,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
@@ -321,6 +322,7 @@ int iris_close(struct file *filp)
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_destroy_roi_metadata_buffers(inst);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	iris_inst_put(inst);

-- 
2.34.1

